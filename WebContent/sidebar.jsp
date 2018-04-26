<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<div class="col-sm-3 col-md-2 sidebar">
	<ul class="nav nav-sidebar">
		<li><a href="${pageContext.request.contextPath}">获取AccessToken</a></li>
		<li><a href="${pageContext.request.contextPath}/getRecordList.jsp">查询录音</a></li>
		<li><a href="${pageContext.request.contextPath}/getRecordFile.jsp">播放录音</a></li>
		<li><a href="${pageContext.request.contextPath}/downloadRecord.jsp">下载录音</a></li>
		<li><a href="${pageContext.request.contextPath}/getAgentCallHistoryList.jsp">查询通话记录</a></li>
		<li><a href="${pageContext.request.contextPath}/getuserinfo.jsp">查询用户信息</a></li>
		<li><a href="${pageContext.request.contextPath}/exportExcel.jsp">导出Excel</a></li>
		<li><a href="${pageContext.request.contextPath}/phone2/test.html" target="_blank">呼叫中心工具条</a></li>
		<li><a href="http://124.172.245.229:9846/index.php/home/item/pwd?item_id=4" target="_blank">API文档</a></li>
	</ul>
</div>