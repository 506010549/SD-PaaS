<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- 新 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/plugins/bootstrap3/bootstrap.min.css">

<!-- 可选的Bootstrap主题文件（一般不用引入） -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/plugins/bootstrap3/bootstrap-theme.min.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/theme.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/page.css">

<title>Insert title here</title>

<script type="text/javascript">
	var host_url = "${pageContext.request.contextPath}";
</script>

</head>
<body>
	<jsp:include page="navbar.jsp"/>

	<div class="container-fluid">
		<div class="row">
			<jsp:include page="sidebar.jsp" />

			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<!-- 输入主界面内容 -->
				<h1 class="page-header">查询通话记录<button type="button" class="btn btn-success" id="search-btn">查询</button></h1>
				
				<form class="search-form">
					<div class="form-inline row">
						<div class="form-group col-sm-4">
						<label for="client_id" class="col-sm-4">Client ID<font color="red">*</font></label> <input
							class="form-control" id="client_id"
							value="sandi">
						</div>
						<div class="form-group col-sm-4">
							<label for="openId" class="col-sm-4">OpenID<font color="red">*</font></label> <input class="form-control"
								id="openId" value="ttxitsioeoshifs">
						</div>
						<div class="form-group col-sm-4">
							<label for="userCode" class="col-sm-4">用户账号</label> <input class="form-control"
								id="userCode" placeholder="" value="-1">
						</div>
					</div>
					
					<div class="form-inline row">
						<div class="form-group col-sm-4">
							<label for="organizerId" class="col-sm-4">组织ID</label> <input class="form-control"
								id="organizerId" placeholder="" value="2359">
						</div>
						<div class="form-group col-sm-4">
							<label for="offHkTmSt" class="col-sm-4">呼入起始时间</label> <input class="form-control"
								id="offHkTmSt" placeholder="yyyy-MM-dd HH:mm:ss" value="2016-02-17 00:00:00">
						</div>
						<div class="form-group col-sm-4">
							<label for="offHkTmEd" class="col-sm-4">呼入结束时间</label> <input class="form-control"
								id="offHkTmEd" placeholder="yyyy-MM-dd HH:mm:ss" value="2016-02-17 23:00:00">
						</div>
					</div>
				</form>
				
				<div id="result" class="row" style="padding: 10px 15px 0 15px;">
					<table class="table table-striped">
						<thead>
							<tr>
								<th>呼叫流水号</th>
								<th>联系人名称</th>
								<th>所属坐席组ID</th>
								<th>座席ID</th>
								<th>录音类型</th>
								<th>呼叫类型</th>
								<th>被叫号码</th>
								<th>主叫号码</th>
								<th>摘机时间</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
				
				<div id="code-example">
					<h2>代码示例</h2>
					<!-- Nav tabs -->
					<ul class="nav nav-tabs" role="tablist">
						<li role="presentation" class="active"><a href="#tab-1"
							aria-controls="tab-1" role="tab" data-toggle="tab">API 调用</a></li>
						<li role="presentation"><a href="#tab-2"
							aria-controls="tab-2" role="tab" data-toggle="tab">HttpUtils.postJson()方法</a></li>
						<li role="presentation"><a href="#tab-3"
							aria-controls="tab-3" role="tab" data-toggle="tab">备注</a></li>
					</ul>
					
					<!-- Tab panes -->
					<div class="tab-content">
						<!-- start tab-1 -->
						<div role="tabpanel" class="tab-pane active" id="tab-1">
							<!-- ======================================================== -->
							<!-- = Java Sourcecode to HTML automatically converted code = -->
							<!-- =   Java2Html Converter 5.0 [2006-02-26] by Markus Gebhard  markus@jave.de   = -->
							<!-- =     Further information: http://www.java2html.de     = -->
							<div align="left" class="java">
								<table border="0" cellpadding="3" cellspacing="0"
									bgcolor="#ffffff">
									<tr>
										<!-- start source code -->
										<td nowrap="nowrap" valign="top" align="left"><code>
												<font color="#3f7f5f">//&nbsp;接口地址</font><br /> <font
													color="#000000">String&nbsp;url&nbsp;=&nbsp;</font><font
													color="#2a00ff">&#34;http://172.16.24.21:9812/VenusRest/webservice/sd-saas/&#34;</font><br />
												<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font
													color="#000000">+&nbsp;</font><font color="#2a00ff">&#34;call/getAgentCallHistoryList?accessToken=&#34;&nbsp;</font><font
													color="#000000">+&nbsp;AccessTokenUtil.getAccessToken</font><font
													color="#000000">()</font><font color="#000000">;</font><br />
												<font color="#ffffff"></font><br /> <font color="#3f7f5f">//&nbsp;设置参数</font><br />
												<font color="#000000">Map&lt;String,&nbsp;Object&gt;&nbsp;params&nbsp;=&nbsp;</font><font
													color="#7f0055"><b>new&nbsp;</b></font><font
													color="#000000">HashMap&lt;String,&nbsp;Object&gt;</font><font
													color="#000000">()</font><font color="#000000">;</font><br />
												<font color="#000000">params.put</font><font color="#000000">(</font><font
													color="#2a00ff">&#34;client_id&#34;</font><font
													color="#000000">,&nbsp;</font><font color="#2a00ff">&#34;sandi&#34;</font><font
													color="#000000">)</font><font color="#000000">;</font><br />
												<font color="#000000">params.put</font><font color="#000000">(</font><font
													color="#2a00ff">&#34;openId&#34;</font><font
													color="#000000">,&nbsp;</font><font color="#2a00ff">&#34;ttxitsioeoshifs&#34;</font><font
													color="#000000">)</font><font color="#000000">;</font><br />
												<font color="#000000">params.put</font><font color="#000000">(</font><font
													color="#2a00ff">&#34;userCode&#34;</font><font
													color="#000000">,&nbsp;</font><font color="#2a00ff">&#34;-1&#34;</font><font
													color="#000000">)</font><font color="#000000">;</font><br />
												<font color="#000000">params.put</font><font color="#000000">(</font><font
													color="#2a00ff">&#34;acdrlt&#34;</font><font
													color="#000000">,&nbsp;</font><font color="#2a00ff">&#34;1&#34;</font><font
													color="#000000">)</font><font color="#000000">;</font><br />
												<font color="#000000">params.put</font><font color="#000000">(</font><font
													color="#2a00ff">&#34;currentPage&#34;</font><font
													color="#000000">,&nbsp;</font><font color="#990000">1</font><font
													color="#000000">)</font><font color="#000000">;</font><br />
												<font color="#000000">params.put</font><font color="#000000">(</font><font
													color="#2a00ff">&#34;rows&#34;</font><font color="#000000">,&nbsp;</font><font
													color="#990000">10</font><font color="#000000">)</font><font
													color="#000000">;</font><br /> <font color="#000000">params.put</font><font
													color="#000000">(</font><font color="#2a00ff">&#34;offHkTmSt&#34;</font><font
													color="#000000">,&nbsp;</font><font color="#2a00ff">&#34;2000-03-01&nbsp;00:00:00&#34;</font><font
													color="#000000">)</font><font color="#000000">;</font><br />
												<font color="#000000">params.put</font><font color="#000000">(</font><font
													color="#2a00ff">&#34;offHkTmEd&#34;</font><font
													color="#000000">,&nbsp;</font><font color="#2a00ff">&#34;2016-04-06&nbsp;00:00:00&#34;</font><font
													color="#000000">)</font><font color="#000000">;</font><br />
												<font color="#ffffff"></font><br /> <font color="#3f7f5f">//&nbsp;调用接口</font><br />
												<font color="#7f0055"><b>return&nbsp;</b></font><font
													color="#000000">HttpUtils.postJson</font><font
													color="#000000">(</font><font color="#000000">url,&nbsp;params</font><font
													color="#000000">)</font><font color="#000000">;</font>
											</code></td>
										<!-- end source code -->
									</tr>
								</table>
							</div>
							<!-- =       END of automatically generated HTML code       = -->
							<!-- ======================================================== -->
						</div>
						<!-- end tab-1 -->
						<!-- start tab-2 -->
						<div role="tabpanel" class="tab-pane" id="tab-2">
							<!-- ======================================================== -->
							<!-- = Java Sourcecode to HTML automatically converted code = -->
							<!-- =   Java2Html Converter 5.0 [2006-02-26] by Markus Gebhard  markus@jave.de   = -->
							<!-- =     Further information: http://www.java2html.de     = -->
							<div align="left" class="java">
								<table border="0" cellpadding="3" cellspacing="0"
									bgcolor="#ffffff">
									<tr>
										<!-- start source code -->
										<td nowrap="nowrap" valign="top" align="left"><code>
												<font color="#7f0055"><b>public&nbsp;static&nbsp;</b></font><font
													color="#000000">String&nbsp;postJson</font><font
													color="#000000">(</font><font color="#000000">String&nbsp;url,&nbsp;Map&lt;String,&nbsp;Object&gt;&nbsp;params</font><font
													color="#000000">)&nbsp;{</font><br /> <font
													color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;</font><font
													color="#000000">String&nbsp;ans&nbsp;=&nbsp;</font><font
													color="#7f0055"><b>null</b></font><font color="#000000">;</font><br />
												<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;</font><font
													color="#7f0055"><b>try&nbsp;</b></font><font
													color="#000000">{</font><br /> <font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font
													color="#000000">HttpPost&nbsp;httpPost&nbsp;=&nbsp;</font><font
													color="#7f0055"><b>new&nbsp;</b></font><font
													color="#000000">HttpPost</font><font color="#000000">(</font><font
													color="#000000">url</font><font color="#000000">)</font><font
													color="#000000">;</font><br /> <font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font
													color="#000000">CloseableHttpClient&nbsp;httpclient&nbsp;=&nbsp;HttpClients.createDefault</font><font
													color="#000000">()</font><font color="#000000">;</font><br />
												<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><br />
												<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font
													color="#7f0055"><b>if&nbsp;</b></font><font color="#000000">(</font><font
													color="#000000">params&nbsp;!=&nbsp;</font><font
													color="#7f0055"><b>null</b></font><font color="#000000">)&nbsp;{</font><br />
												<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font
													color="#3f7f5f">//&nbsp;配置&nbsp;HTTP&nbsp;参数</font><br />
												<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font
													color="#000000">HttpEntity&nbsp;entity&nbsp;=&nbsp;EntityBuilder.create</font><font
													color="#000000">()</font><br /> <font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font
													color="#000000">.setText</font><font color="#000000">(</font><font
													color="#000000">JSONUtil.serialize</font><font
													color="#000000">(</font><font color="#000000">params</font><font
													color="#000000">))</font><br /> <font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font
													color="#000000">.setContentType</font><font color="#000000">(</font><font
													color="#000000">ContentType.APPLICATION_JSON</font><font
													color="#000000">)</font><br /> <font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font
													color="#000000">.setContentEncoding</font><font
													color="#000000">(</font><font color="#2a00ff">&#34;UTF-8&#34;</font><font
													color="#000000">)</font><br /> <font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font
													color="#000000">.build</font><font color="#000000">()</font><font
													color="#000000">;</font><br /> <font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font
													color="#000000">httpPost.setEntity</font><font
													color="#000000">(</font><font color="#000000">entity</font><font
													color="#000000">)</font><font color="#000000">;</font><br />
												<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font
													color="#000000">}</font><br /> <font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><br />
												<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font
													color="#3f7f5f">//&nbsp;开始连接&nbsp;URL</font><br /> <font
													color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font
													color="#000000">CloseableHttpResponse&nbsp;response&nbsp;=&nbsp;httpclient.execute</font><font
													color="#000000">(</font><font color="#000000">httpPost</font><font
													color="#000000">)</font><font color="#000000">;</font><br />
												<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><br />
												<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font
													color="#3f7f5f">//&nbsp;获取响应信息</font><br /> <font
													color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font
													color="#000000">HttpEntity&nbsp;resEntity&nbsp;=&nbsp;response.getEntity</font><font
													color="#000000">()</font><font color="#000000">;</font><br />
												<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font
													color="#7f0055"><b>if&nbsp;</b></font><font color="#000000">(</font><font
													color="#000000">resEntity&nbsp;!=&nbsp;</font><font
													color="#7f0055"><b>null</b></font><font color="#000000">)&nbsp;{</font><br />
												<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font
													color="#000000">ans&nbsp;=&nbsp;EntityUtils.toString</font><font
													color="#000000">(</font><font color="#000000">resEntity,&nbsp;Charset.forName</font><font
													color="#000000">(</font><font color="#2a00ff">&#34;UTF-8&#34;</font><font
													color="#000000">))</font><font color="#000000">;</font><br />
												<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font
													color="#000000">EntityUtils.consume</font><font
													color="#000000">(</font><font color="#000000">resEntity</font><font
													color="#000000">)</font><font color="#000000">;</font><br />
												<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font
													color="#000000">}</font><br /> <font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font
													color="#000000">response.close</font><font color="#000000">()</font><font
													color="#000000">;</font><br /> <font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;</font><font
													color="#000000">}&nbsp;</font><font color="#7f0055"><b>catch</b></font><font
													color="#000000">(</font><font color="#000000">Exception&nbsp;e</font><font
													color="#000000">)&nbsp;{</font><br /> <font
													color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font
													color="#000000">e.printStackTrace</font><font
													color="#000000">()</font><font color="#000000">;</font><br />
												<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;</font><font
													color="#000000">}</font><br /> <font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;</font><font
													color="#7f0055"><b>return&nbsp;</b></font><font
													color="#000000">ans;</font><br /> <font color="#000000">}</font>
											</code></td>
										<!-- end source code -->
									</tr>
								</table>
							</div>
							<!-- =       END of automatically generated HTML code       = -->
							<!-- ======================================================== -->
						</div>
						<!-- end tab-2 -->
						<!-- start tab-3 -->
						<div role="tabpanel" class="tab-pane" id="tab-3">
							<div class="panel panel-default remark">
								<div class="panel-body">
									&quot;查询通话记录接口&quot; 是通过 HTTP POST 方法, 并以 JSON 作为参数实体传递到服务器进行调用.<br>
									服务器的响应是一个 JSON 实体. 如果传参正确, 里面将是录音列表信息; 否则, 里面是错误描述信息.<br>
								</div>
							</div>
						</div>
						<!-- end tab-3 -->
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
	<script src="${pageContext.request.contextPath}/js/plugins/jquery.js"></script>
	<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
	<script
		src="${pageContext.request.contextPath}/js/plugins/bootstrap3/bootstrap.min.js"></script>

	<script type="text/javascript">
		$($(".nav-sidebar > li")[4]).addClass("active");
	
		$("#search-btn").click(function() {
			$("#result").prepend("<p>正在获取数据 ...</p>");
			$("#result tbody").html("");
			var data = {};
			data.clientId = $("#client_id").val();
			data.openId = $("#openId").val();
			if ($("#userCode").val() != "") data.userCode = $("#userCode").val();
			if ($("#organizerId").val() != "") data.organizerId = $("#organizerId").val();
			if ($("#offHkTmSt").val() != "") data.offHkTmSt = $("#offHkTmSt").val();
			if ($("#offHkTmEd").val() != "") data.offHkTmEd = $("#offHkTmEd").val();
			
			$.ajax({
				type: "POST",
				url: host_url + "/demo/getAgentCallHistoryList.action",
				data: data,
				dataType: "json",
				async: false,
				success: function(result) {
					var obj = JSON.parse(result);
					
					if (obj.errcode == 0) {
						$("#result p").remove();
						var tbody = $("#result tbody");
						tbody.html("");
						var total = obj.value.total;
						if (total == 0) alert("加载完毕, 没有找到对象");
						var list = obj.value.rows;
						for (var i = 0; i < list.length; i++) {
							var item = list[i];
							var $tr = $("<tr/>");
							$tr.append($("<td/>").html(item.CALLID != null ? item.CALLID : "暂无"));
							$tr.append($("<td/>").html(item.CONTACT_NAME != null ? item.CONTACT_NAME : "暂无"));
							$tr.append($("<td/>").html(item.GROUPID != null ? item.GROUPID : "暂无"));
							$tr.append($("<td/>").html(item.AGTID != null ? item.AGTID : "暂无"));
							$tr.append($("<td/>").html(item.NOTYPE != null ? item.NOTYPE : "暂无"));
							$tr.append($("<td/>").html(item.CALLTYPE != null ? item.CALLTYPE : "暂无"));
							$tr.append($("<td/>").html(item.DNIS != null ? item.DNIS : "暂无"));
							$tr.append($("<td/>").html(item.ANI != null ? item.ANI : "暂无"));
							$tr.append($("<td/>").html(item.OFFHKTM != null ? item.OFFHKTM : "暂无"));
							tbody.append($tr);
						}
					} else {
						$("#result").html("获取失败, 错误码: " + obj.errcode + ", " + obj.content);
					}
				}
			});
		});
	</script>
</body>
</html>