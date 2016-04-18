var phone={
	//url:"http://10.15.10.90:8080/AgentService",
	url:"http://172.16.24.21:80/AgentService",	//呼叫中心服务地址
	userCode:"81000@sdcpb.com",				//呼叫中心用户账号
	userPwd:"111111",						//呼叫中心用户密码
	groupId:"",
	station:"",
	agtStatus:3,
	callStatus:-1,
	occupy:-1,
	aliveClock:0,
	lastAliveTm:0,
	isLogin:false,
	isMSClick:false,
	isPause:false,
	tmMonitor:0,
	dialGrp:0,
	lastCall:{
		callId:0,
		subId:0,
		areaCode:"",
		ani:"",
		groupId:"",
		ivrList:"",
		offHookTime:""
	},
	rights:{
		agtReq:true,
		dialOut:true,
		agtDisconnectCall:true,
		agtIntercept:true,
		agtJoinTalk:true,
		agtListen:true,
		isMonitor:true,
		logoutAgt:false,
		remoteCti:true
	},
	firstMX:true,
	agtMonitorObj:null,
	toolsType:'zhuanjie',
	topics:{},
	subscribeCnt:{},
	lastAllAgtInfoStr:"",
	lastAllAgtInfoCnt:0,
	webServiceUrl:"",
	tmrDur:0,
	workTime:"",
	callCnt:0,
	dialOutCnt:0,
	talkTime:0,
	totalTalkTime:0
};

$(document).ready(function(){
	phone.loadParams();
	if(phone.userCode==""){
		writeLog("缺少参数：userCode");
		ztoDialog('message',"登录失败：缺少参数[userCode]");
		return;
	}
	if(phone.userPwd==""){
		writeLog("缺少参数：userPwd");
		ztoDialog('message',"登录失败：缺少参数[userPwd]");
		return;
	}
	phone.initConnect('0');
});

phone.loadParams=function(){
	//通过URL获取参数
	var searchStr = location.search;
	if($.trim(searchStr)=="") return;
	searchStr = searchStr.substr(1);
	var searchs = searchStr.split("&");
	for(var i=0;i<searchs.length;i++){
		var param=searchs[i].split("=");
		if(param[0].toLowerCase()=="usercode"){
			phone.userCode = param[1];
		}else if(param[0].toLowerCase()=="userpwd"){
			phone.userPwd = param[1];
		}else if(param[0].toLowerCase()=="groupid"){
			phone.groupId = param[1];
		}else if(param[0].toLowerCase()=="station"){
			phone.station = param[1];
		}else if(param[0].toLowerCase()=="url"){
			phone.url = param[1];
		}
	}
}

//事件发布
phone.event=function(id){
	var callbacks,topic = id && this.topics[id];
	var subCnt = this.subscribeCnt[id];
	var cnt = 0;
	if ( !topic ) {
		callbacks = jQuery.Callbacks();
		topic = {
			publish: callbacks.fire,
			subscribe: function(fn){
				callbacks.add(fn);
				if(subCnt) cnt=subCnt;
				cnt++;
				phone.subscribeCnt[id]=cnt;
			},
			unsubscribe: function(fn){
				callbacks.remove(fn);
				if(subCnt) cnt=subCnt;
				cnt--;
				if(cnt<0) cnt=0;
				phone.subscribeCnt[id]=cnt;
			}
		};
		if (id) {
			this.topics[id] = topic;
		}
	}
	return topic;
};

phone.initConnect = function(force){
	//连接服务器(非强制连接)
	SdAgent.connect(phone.url,phone.userCode,phone.userPwd,force);
}


/***********************事件订阅*************************/
//连接事件
SdAgent.event("onConnect").subscribe(function(result, desc){
	if(result==1 || result==2){
		$("#svrStatus").html("服务器已连接");
		writeLog("onConnect："+desc);

		phone.lastAliveTm=(new Date()).getTime();
		if(phone.aliveClock>0) clearInterval(phone.aliveClock);
		phone.aliveClock=setInterval(function(){
			var nowTm=(new Date()).getTime();
			//writeLog("nowTm:" + nowTm +",lastTm:"+phone.lastAliveTm + ",value:" + ((nowTm-phone.lastAliveTm)/1000));
			if((nowTm-phone.lastAliveTm)/1000>60){
				phone.lastAliveTm=nowTm;
				alert("您的网络有异常，已断开与服务器的连接，点击确定将重新连接！");
				phone.initConnect();
			}
		},10000);
		setTimeout(function(){SdAgent.getAgentRights();},10);
		setTimeout(function(){SdAgent.getAgtGroups();},50);
	}else{
		$("#callStatus").html("未连接");
		ztoDialog("message",desc);
	}
});

//断开连接
SdAgent.event("onDisconnect").subscribe(function(){
	if(phone.aliveClock>0) clearInterval(phone.aliveClock);
	writeLog("onDisconnect");
	phone.setLogOff();
	$("#callStatus").html("断开连接");
});

//心跳检测事件
SdAgent.event("onAlive").subscribe(function(){
	SdAgent.alive();
	phone.lastAliveTm=(new Date()).getTime();
	writeLog("onAlive");
});

//已连接事件，可利用此事件进行强制连接操作
SdAgent.event("onASConnected").subscribe(function(){
	writeLog("onASConnected");
	$("#callStatus").html("已连接");
	phone.initConnect("1");
});

//强制连接事件返回
SdAgent.event("onForceConnect").subscribe(function(){
	writeLog("onForceConnect");
	phone.isLogin=true;
	SdAgent.logout();
});


//座席动作事件
SdAgent.event("onAgtReqReturn").subscribe(function(cmd, ret,desc){
	writeLog("座席动作[cmd："+cmd+"，ret："+ret+"，desc："+desc+"]");
	phone.setAgtReqReturn(cmd, ret,desc);
});

//座席状态变化事件
SdAgent.event("onRunAgtInfo").subscribe(function(status, hook, occupy){
	phone.setAgtStatus(status, hook, occupy);
	
	phone.event("onRunAgtInfo").publish(status, hook, occupy);
});

//来电振铃事件
SdAgent.event("onRing").subscribe(function(callId, subId, area, ani, grpId, srcAgt, ivrList){
	phone.lastCall.callId=callId;
	phone.lastCall.ani=ani;
	phone.setRing(callId, subId, area, ani, grpId, srcAgt, ivrList);
});

//座席详细信息
SdAgent.event("onAgtDetailInfo").subscribe(function(agtId, name,agtStatus,callStatus,hook,occupy,lastCall,webServiceUrl){
	writeLog("onAgtDetailInfo[agtStatus："+agtStatus+"，status："+callStatus+"，hook："+hook+"，occupy："+occupy+"]"+
			" lastCall：{callId:"+lastCall.callId+",subId:"+lastCall.subId+",area:"+lastCall.area+",ani:"+lastCall.ani+",grpId:"+lastCall.grpId+",srcAgt:"+lastCall.srcAgt+",ivrList:"+lastCall.ivrList+"}");
			
	phone.setAgtDetailInfo(agtId, name,agtStatus,callStatus,hook,occupy,lastCall);
	
	phone.webServiceUrl=webServiceUrl;
});

//拨号完成
SdAgent.event("onRunDialDialed").subscribe(function(callid, subid, area, dnis){
	writeLog("onRunDialDialed[callid:"+callid+",subid:"+subid+",area:"+area+",dnis:"+dnis+"]");
	phone.lastCall.callId=callid;
	phone.lastCall.ani = dnis;
	SdAgent.agtWorkAfterCall();	
	var areaInfo = phone.getArea(dnis);
	ztoDialog('ring',SdAgent.agtId+","+dnis+",2,"+callid+","+subid+","+dnis+","+area+",,,"+areaInfo);
	phone.dialOutCnt+=1;
	try{parent.setAgtCountInfo(SdAgent.agtId,phone.workTime,phone.groupId,$.date.dateFormat(phone.talkTime,'hh:mm:ss'),phone.callCnt+"/"+phone.dialOutCnt,$.date.dateFormat(phone.totalTalkTime,'hh:mm:ss'));}catch(e){}
});

SdAgent.event("onRunDialOver").subscribe(function(rlt,desc){
	writeLog("onRunDialOver[rlt:"+rlt+",desc:"+desc+"]");
	ztoDialog("message",desc);
});

SdAgent.event("onTreeJsonInfo").subscribe(function(data){
	writeLog("onTreeJsonInfo："+data);
});

SdAgent.event("onAllAgtInfo").subscribe(function(result, errMsg,allAgentsInfo,count){
	try{
		if(allAgentsInfo==phone.lastAllAgtInfoStr) return;
		phone.lastAllAgtInfoStr = allAgentsInfo;
		phone.lastAllAgtInfoCnt = count;
		if(result==0)phone.event("onAllAgtInfo").publish(allAgentsInfo,count);
	}catch(e){writeLog("未找到上级页面中的[phone.event]方法");}
});

SdAgent.event("onCallerHangup").subscribe(function(callId){
	writeLog("onCallerHangup：[callid:"+callId+"]");
});

//排队事件
SdAgent.event("onQueueInfo").subscribe(function(grpId,waitCall){
	$("#queueInfo").html(waitCall+"人");
	writeLog("onQueueInfo[grpId:"+grpId+",waitCall:"+waitCall+"]");
});

//拦截事件
SdAgent.event("onIntercept").subscribe(function(ret,callId,subId,area,ani,grpId,srcAgt,errMsg,ivrList){
	writeLog("拦截事件:[ret:"+ret+",callId:"+callId+",subId:"+subId+",area:"+area+",ani:"+ani+",grpId:"+grpId+",srcAgt:"+srcAgt+",errMsg:"+errMsg+",ivrList:"+ivrList+"]");
	if(ret==true){
		var orderNo = "";
		if(ivrList!=null && ivrList!=undefined){
			var arrIvr = ivrList.split(",");
			if(arrIvr.length>=4)orderNo = arrIvr[3];
		}
		var areaInfo = phone.getArea(ani);
		ztoDialog('ring',ani+","+SdAgent.agtId+",1,"+callId+","+subId+","+SdAgent.agtId+","+area+",,"+orderNo+","+areaInfo);
	}else{
		ztoDialog("message","拦截失败；"+errMsg);
	}
});

//被拦截事件
SdAgent.event("onIntercepted").subscribe(function(agtId,agtName,callId){
	writeLog("onIntercepted[agtId:"+agtId+",agtName:"+agtName+",callId:"+callId+"]");
	ztoDialog("message","当前通话被["+agtName+"("+agtId+")]拦截");
});

//强拆事件
SdAgent.event("onCallDisconnected").subscribe(function(agtId,agtName){
	writeLog("onCallDisconnected[agtId:"+agtId+",agtName:"+agtName+"]");
	ztoDialog("message","当前通话被["+agtName+"("+agtId+")]强制挂断");
});

//收到请求
SdAgent.event("onReqAgtCallAct").subscribe(function(srcAgtId,srcAgtName,tmTime,actType,callId,content){
	writeLog("onReqAgtCallAct[srcAgtId:"+srcAgtId+",srcAgtName:"+srcAgtName+",tmTime:"+tmTime+",actType:"+actType+",callId:"+callId+",content:"+content+"]");
	try{
		phone.openMonitor("banzhang");
		setTimeout(function(){phone.agtMonitorObj.onRecvAgtReq(srcAgtId,srcAgtName,tmTime,actType,callId,content);},200);
	}catch(e){writeLog("调用AgtMonitor.html中的onRecvAgtReq方法出错");}
});

//接收请求事件
SdAgent.event("onAcceptAgtReq").subscribe(function(){
	writeLog("onAcceptAgtReq");
	phone.event("onAcceptAgtReq").publish();
});

SdAgent.event("onGetOrgAgtgrps").subscribe(function(data){
	writeLog("onGetOrgAgtgrps");
	phone.event("onGetOrgAgtgrps").publish(data);
});

SdAgent.event("onGetAgentRights").subscribe(function(data){
	writeLog("onGetAgentRights");
	phone.setAgentRights(data);
});

SdAgent.event("onGetAgtGroups").subscribe(function(data){
	writeLog("onGetAgtGroups");
	phone.initAgtGroups(data);
});


/*********************************事件处理**********************************/
//离线状态
phone.setLogOff = function(){
	$("#callStatus").html("离线");
	
	phone.agtStatus=3;
	phone.clearCall();
    $("#zhuce").show().removeClass("gray");
	$("#logout,#shixian,#jietong").hide();
	
	$("#banzhang,#hujiao,#zhuanjie,#shimang,#sanfang,#guanduan,#zhijian").addClass("gray");
	$("#shimang,#baochi").show().addClass("gray");
	
    $("#queueInfo").html("0人");
}

//在线状态
phone.setLogOn  =function(){
	$("#callStatus").html("在线");
	
	$("#zhuce").hide();
	$("#logout").show();
	
	$("#zhuanjie,#shimang,#guanduan,#shixian,#baochi").removeClass("gray");
	
	if(phone.rights.dialOut){
		$("#hujiao").removeClass("gray");
		$("#sanfang").removeClass("gray");
	}
	if(phone.rights.isMonitor) $("#banzhang").removeClass("gray");
	if(phone.rights.remoteCti) $("#zhijian").removeClass("gray");
	
	phone.workTime = $.date.dateFormat(new Date(),"HH:mm:ss");
	try{parent.setAgtCountInfo(SdAgent.agtId,phone.workTime,phone.groupId,$.date.dateFormat(phone.talkTime,'hh:mm:ss'),phone.callCnt+"/"+phone.dialOutCnt,$.date.dateFormat(phone.totalTalkTime,'hh:mm:ss'));}catch(e){}
}

//暂停状态
phone.setPause = function(){
	phone.isPause=true;
	if(phone.occupy==0)	$("#callStatus").html("暂停中");
}

//恢复状态（工作状态）
phone.setRestore = function(){
	phone.isPause=false;
	phone.setOnHk();
}

//空闲状态
phone.setOnHk = function() {
	if(phone.isPause==false){
		$("#callStatus").html("空闲中");
	}else{
		$("#callStatus").html("暂停中");
	}
   
	$("#trans_tools1,#sanfang_tools1").show();
	$("#trans_tools2,#sanfang_tools2").hide();
	
	if(phone.tmrDur != ""){clearInterval(phone.tmrDur);}
	phone.clearCall();
};

//转为示忙状态
phone.setWorkAfterCall = function() {
	$("#callStatus").html("处理中");
	if(phone.tmrDur != ""){clearInterval(phone.tmrDur);}
};

//设置暂停按钮状态
phone.setMangXian = function(){
	if(phone.callStatus==0 && phone.occupy==1) $("#callStatus").html("处理中");
	
	if(phone.agtStatus==7){
		$('#shimang').hide();
		$('#shixian').show();
		if(phone.isMSClick==true){
			phone.isMSClick=false;
			$(".s-tips li").removeClass("curr");
			$('#shixian').addClass("curr");
		}
		if(phone.firstMX==false){
			ztoDialog('message','暂停成功!');
		}else{
			phone.firstMX=false;
		}
	}else if(phone.agtStatus==8){
		$('#shimang').show();
		$('#shixian').hide();
		if(phone.isMSClick==true){
			phone.isMSClick=false;
			$(".s-tips li").removeClass("curr");
			$('#shimang').addClass("curr");
		}
		if(phone.firstMX==false){
			ztoDialog('message','恢复成功!');
		}else{
			phone.firstMX=false;
		}
	}
}

//振铃状态
phone.setRing = function(callId, subId, area, ani, grpId, srcAgt, ivrList){
	$("#callStatus").html("振铃中");
	SdAgent.agtWorkAfterCall();
	//ani,dnis,calltype,callid,subid,dnis,area,,ivrList(agtId,groupId,keyNo,订单号)
	var orderNo = "";
	if(ivrList!=null && ivrList!=undefined && ivrList.length>=4) orderNo = ivrList[3];
	var areaInfo = phone.getArea(ani);
	writeLog("来电振铃事件[来电号码："+ani+"，来电组："+grpId+"，区号："+areaInfo+"，订单号："+orderNo+"]");
	ztoDialog('ring',ani+","+SdAgent.agtId+",1,"+callId+","+subId+","+SdAgent.agtId+","+area+",,"+orderNo+","+areaInfo);
	phone.callCnt+=1;
	try{parent.setAgtCountInfo(SdAgent.agtId,phone.workTime,phone.groupId,$.date.dateFormat(phone.talkTime,'hh:mm:ss'),phone.callCnt+"/"+phone.dialOutCnt,$.date.dateFormat(phone.totalTalkTime,'hh:mm:ss'));}catch(e){}
}

//播放工号
phone.setPlayAgtId=function(){
	$("#callStatus").html("播工号");
}

//呼入通话状态
phone.setCallIn = function() {
	$("#callStatus").html("通话中");
	
	$(".baochi").show();
	$(".jietong").hide();
	$(".s-tips li").removeClass("curr");
	
	$("#trans_tools1,#sanfang_tools1").show();
	$("#trans_tools2,#sanfang_tools2").hide();
	
	//拦截成功
	if(phone.agtStatus==2){
		if(phone.isPause==true){
			phone.agtStatus=7;
		}else{
			phone.agtStatus=8;
		}
		SdAgent.agtWorkAfterCall();
		phone.event("onInterceptTalk").publish();
	}
	
	if(phone.lastCall.offHookTime == ""){
	    var objDate = new Date();
	    phone.lastCall.offHookTime = $.date.dateFormat(objDate,'yyyy-MM-dd hh:mm:ss');
	}
	
	if(phone.tmrDur != ""){clearInterval(phone.tmrDur);}
    phone.tmrDur = setInterval(function() {
	    var objDate = new Date();
	    var nSecond = $.date.dateDiff('s',$.date.stringToDate(phone.lastCall.offHookTime),objDate);
	    phone.talkTime = nSecond;
		try{parent.setAgtCountInfo(SdAgent.agtId,phone.workTime,phone.groupId,$.date.dateFormat(phone.talkTime,'hh:mm:ss'),phone.callCnt+"/"+phone.dialOutCnt,$.date.dateFormat(phone.totalTalkTime,'hh:mm:ss'));}catch(e){}
    }, 1000);
}

//呼出状态
phone.setCallOut = function() {
    if(phone.callStatus==20){
    	$("#callStatus").html("呼座席");
    }else if(phone.callStatus==29){
    	$("#callStatus").html("呼座席组");
    }else{
    	$("#callStatus").html("呼出中");
    }
};

//座席动作事件
phone.setAgtReqReturn = function(cmd, ret,desc){
	if(ret==0){
		phone.agtStatus=cmd;
		switch(cmd){
		case 0:		//保持通话
			break;
		case 2:		//监听
			phone.setListen();
			phone.event("onListen").publish(desc);
			//desc - 被监听者的CallID
			break;
		case 3:		//注销
			phone.setLogOff();
			break;
		case 4:		//注册
			phone.setLogOn();
			break;
		case 5:		//逻辑摘机
			break;
		case 6:		//逻辑挂机
			break;
		case 7:		//暂停
			phone.isPause = true;
			if(phone.isMSClick==false) phone.firstMX=true;
			phone.setPause();
			phone.setMangXian();
			break;
		case 8:		//恢复
			phone.isPause = false;
			if(phone.isMSClick==false) phone.firstMX=true;
			phone.setRestore();
			phone.setMangXian();
			break;
		case 9:		//拉回通话
			break;
		case 10:	//返回IVR
			break;
		case 11:	//连接
			break;
		case 12:	//取消监听
			phone.event("onUnListen").publish();
			break;
		case 13:	//后处理开始
			break;
		case 14:	//后处理结束
			break;
		case 15:	//预订座席
			break;
		case 16:	//强拆
			phone.event("onDisconncall").publish();
			break;
		case 17:	//开始外拨
			break;
		case 18:	//返回指定座席的当前呼叫流水号
			break;
		case 19:	//加入通话
			phone.event("onJoinAgtTalk").publish();
			break;
		case 20:	//退出通话
			phone.event("onExitAgtTalk").publish();
			break;
		case 21:	//向指定座席发消息
			phone.event("onAgtReqAct").publish();
			break;
		case 22:	//请求指定座席执行呼叫动作
			break;
		default:
			break;
		}
	}else{		//座席动作失败事件
		switch(cmd){
			case 0:	//保持失败
				ztoDialog('message',"电话保持失败："+desc);
				break;
			default:
				ztoDialog('message',desc);
				break;
		}
	}
}

//设置座席状态
phone.setAgtStatus = function(status, hook, occupy){
	writeLog("onRunAgtInfo[status："+status+"，hook："+hook+"，occupy："+occupy+"]");
	phone.callStatus=status;
	phone.occupy=occupy;

	switch(status){
	case 0:
		if(occupy==0){		//空闲
			phone.setOnHk();
		}else{					//忙
			phone.setWorkAfterCall();
		}
		break;
	case 1:					//振铃
		break;
	case 2:					//通话
		phone.setCallIn();
		break;
	case 3:					//外拨
		phone.setCallOut();
		break;
	case 5:					//保持
		phone.setHold();
		break;
	case 8:			//加入通话
	case 10:		//三方外拨中
	case 11:		//三方会议外拨接通
		phone.setMeeting11();
		break;
	case 12:		//三方会议中
		phone.setMeeting12();
		break;
	case 14:
		$("#callStatus").html("振铃中");
		break;
	case 15:		//三方呼入摘机
		phone.setTalkingOffHook();
		break;
	case 16:
		phone.setMeeting16();
		break;
	case 20:		//拨座席
		phone.setCallOut();
		break;
	case 21:		//播放工号
		phone.setPlayAgtId();
		break;
	case 28:		//动态分配连接话机中
		break;
	case 29:		//呼叫座席组
		phone.setCallOut();
		break;
	default:
		break;
	}
};

//保持状态
phone.setHold = function() {
	$("#callStatus").html("保持中");
	
	$(".jietong").show();
	$(".baochi").hide();
	$(".s-tips li").removeClass("curr");
	$(".jietong").addClass("curr");
};

//加载在服务器上保存的呼叫信息
phone.setAgtDetailInfo=function(agtId, name,agtStatus,callStatus,hook,occupy,lastCall){
	phone.callStatus = callStatus;
	phone.agtStatus = agtStatus;
	phone.lastCall.callId = lastCall.callId;
	switch(agtStatus){
	case 1:
		break;
	case 2:
		phone.setLogOff();
		//SdAgent.logon(phone.groupId,phone.station);
		break;
	case 3:
		phone.agtStatus=7;
		phone.setLogOn();
		phone.setPause();
		phone.setAgtStatus(callStatus,hook,occupy);
		//振铃
		if(callStatus==1){
			phone.setRing(lastCall.callId,lastCall.subId,lastCall.area,lastCall.ani,lastCall.grpId,lastCall.srcAgt,lastCall.ivrList);
		}else if(callStatus==4){
			phone.setListen();
		}else if(callStatus!=0 || occupy==1){
			//phone.setLastCall(lastCall);
		}
		break;
	case 4:
		phone.agtStatus=8;
		phone.setLogOn();
		phone.setRestore();
		phone.setAgtStatus(callStatus,hook,occupy);
		//振铃
		if(callStatus==1){
			phone.setRing(lastCall.callId,lastCall.subId,lastCall.area,lastCall.ani,lastCall.grpId,lastCall.srcAgt,lastCall.ivrList);
		}else if(callStatus==4){
			phone.setListen();
		}else if(callStatus!=0 || occupy==1){
			//phone.setLastCall(lastCall);
		}
		break;
	default:
		break;
	}
};

//三方外拨成功
phone.setMeeting11 = function(){
	$("#callStatus").html("呼三方");
	
	$("#trans_tools1,#sanfang_tools1").hide();
	$("#trans_tools2,#sanfang_tools2").show();
	$("#sanfang_join").show();
}

//三方通话
phone.setMeeting12 = function(){
	$("#callStatus").html("三方通话");
	$("#sanfang_join").hide();
	
	$("#trans_tools1,#sanfang_tools1").hide();
	$("#trans_tools2,#sanfang_tools2").show();
	$("#sanfang_join").hide();
}

//转为三方会议摘机状态
phone.setTalkingOffHook=function(){
    $("#callStatus").html("通话");
};

phone.setMeeting16 = function(){
	$("#callStatus").html("三方通话");
}

//监听
phone.setListen=function(){
	$("#callStatus").html("监听");
};

//设置座席权限
phone.setAgentRights=function(data){
	if(data==null || data==undefined) return;
	phone.rights.agtReq = data.agtReq;
	phone.rights.dialOut = data.dialOut;
	phone.rights.agtDisconnectCall = data.agtDisconnectCall;
	phone.rights.agtIntercept = data.agtIntercept;
	phone.rights.agtJoinTalk = data.agtJoinTalk;
	phone.rights.agtListen = data.agtListen;
	phone.rights.isMonitor = data.isMonitor;
	phone.rights.logoutAgt = data.logoutAgt;
	phone.rights.remoteCti = (data.remoteCti==undefined?true:data.remoteCti);
}

//初始化座席组
phone.initAgtGroups=function(data){
	$("#grpList").empty();
	if(data==null || data==undefined) return;
	
	var optHtml = [];
	for(var i=0;i<data.length;i++){
		optHtml.push('<li><input type="checkbox" name="checkbox" groupid="'+data[i].groupId+'" /><span>'+data[i].groupId+'('+data[i].groupName+')'+'</span></li>');
	}
	$("#grpList").append(optHtml.join(''));
}

//清空呼叫信息
phone.clearCall = function() {
    phone.lastCall.callId = 0;
    phone.lastCall.subId = 0;
    phone.lastCall.areaCode = "";
    phone.lastCall.ani = "";
    phone.lastCall.groupId = "";
    phone.lastCall.ivrList = "";
	
	if(phone.tmrDur != ""){clearInterval(phone.tmrDur);}
	if(phone.lastCall.offHookTime=="") return;
	var objDate = new Date();
	phone.totalTalkTime += phone.talkTime;
	try{parent.setAgtCountInfo(SdAgent.agtId,phone.workTime,phone.groupId,$.date.dateFormat(phone.talkTime,'hh:mm:ss'),phone.callCnt+"/"+phone.dialOutCnt,$.date.dateFormat(phone.totalTalkTime,'hh:mm:ss'));}catch(e){}
	
	phone.lastCall.offHookTime = "";
};

/*************************方法处理**********************/
//座席监控方法
phone.openMonitor = function(type) {
	phone.toolsType = type;
	SdAgent.getAllAgtInfo();
	parent.showAgtMonitorDlg();
	phone.agtMonitorObj = parent.getAgtMonitorFrame().contentWindow;
	try{phone.agtMonitorObj.showTools(type);}catch(e){}
	if(phone.tmMonitor>0) clearInterval(phone.tmMonitor);
	phone.tmMonitor = setInterval(function(){
		SdAgent.getAllAgtInfo();
		if(parent.getMonitorDlgStatus()==0) clearInterval(phone.tmMonitor);
	},5000);
}

phone.getArea = function(phone){
	var result = "";
	$.ajax({
		url: this.webServiceUrl+"webservice/cc/rest/agent/getPhoneArea/"+phone,
		async: false,
		timeout:3000,
		success: function(data){
			if(data==null || data==""){
				result = "未知地区";
			}else{
				result = data.REGIONNAME+"-"+data.PROVINCENAME+"-"+data.CITYNAME;
			}
		},
		error: function(a, b, c){
			result = "未知地区";
		}
	});
	return result;
}

//是否含有中文（也包含日文和韩文）  
phone.isValidateDNIS = function(str){     
   var reg =/[^\u0000-\u00FF]/;  
   return reg.test(str);  
}

window.onbeforeunload=function(){
	if(phone.isLogin==false){
		var logoutURL=SdAgent.url+"SandiAgent?xdr=xdr&Act=disconnect&AgentId="+SdAgent.agtId+"&CTIID="+SdAgent.ctiId+"&VerifyCode="+SdAgent.verifyCode;
		$.ajax({ url: logoutURL,async: false });
	}
}

window.console = window.console || (function(){  
    var c = {}; c.log = c.warn = c.debug = c.info = c.error = c.time = c.dir = c.profile = c.clear = c.exception = c.trace = c.assert = function(){}; 
    return c;  
})(); 

//用来写调试日志（正式使用时可注释掉里面的代码）
function writeLog(msg){
	var date=new Date();
	var hours=date.getHours()<10?"0"+date.getHours():date.getHours();
	var minutes=date.getMinutes()<10?"0"+date.getMinutes():date.getMinutes();
	var seconds=date.getSeconds()<10?"0"+date.getSeconds():date.getSeconds();
	var ms;
	if(date.getMilliseconds()<10){
		ms="00"+date.getMilliseconds();
	}else if(date.getMilliseconds()<100){
		ms="0"+date.getMilliseconds();
	}else{
		ms=date.getMilliseconds();
	}
	
	msg=hours+":"+minutes+":"+seconds+"."+ms +"    " + msg;
	if(console!=null && console!=undefined){
		console.log(msg);
	}
}