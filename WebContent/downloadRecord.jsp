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
				<h1 class="page-header">下载录音</h1>

				<div class="row" style="margin-bottom: 10px;">
					<div class="col-sm-4">
						<button id="submit-btn" class="btn btn-lg btn-default">下载录音</button>
					</div>
					<div class="col-sm-8" style="line-height: 46px; font-size: 18px;">
						<span id="result">
							请填写信息并获取录音
						</span>
					</div>
				</div>

				<form>
					<div class="form-group">
						<label for="client_id">Client ID<font color="red">*</font></label> <input
							class="form-control" id="client_id"
							placeholder="Client ID" value="sandi">
					</div>
					<div class="form-group">
						<label for="openId">OpenID<font color="red">*</font></label> <input
							class="form-control" id="openId"
							placeholder="OpenID" value="33A5A27DFD0E9641E0530100007F8A3E">
					</div>
					<div class="form-group">
						<label for="callId">呼叫ID<font color="red">*</font></label> <input
							class="form-control" id="callId"
							placeholder="呼叫ID" value="1527359289">
					</div>
					<div class="form-group">
						<label for="subId">呼叫子ID<font color="red">*</font></label> <input
							class="form-control" id="subId"
							placeholder="呼叫子ID" value="1">
					</div>
					<div class="form-group">
						<label for="organizerId">录音所属组织ID<font color="red">*</font></label> <input
							class="form-control" id="organizerId"
							placeholder="录音所属组织ID" value="1">
					</div>
				</form>
				
				<div id="code-example">
					<h2>代码示例</h2>
					
					<!-- Nav tabs -->
					<ul class="nav nav-tabs" role="tablist">
						<li role="presentation" class="active"><a href="#tab-1"
							aria-controls="tab-1" role="tab" data-toggle="tab">API 调用</a></li>
						<li role="presentation"><a href="#tab-2"
							aria-controls="tab-2" role="tab" data-toggle="tab">HttpUtils.getBytes()方法</a></li>
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
													color="#000000">String&nbsp;url&nbsp;=&nbsp;String.format</font><font
													color="#000000">(</font><font color="#2a00ff">&#34;http://172.16.24.21:9812VenusRest/webservice/sd-saas/&#34;</font><br />
												<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font
													color="#000000">+&nbsp;</font><font color="#2a00ff">&#34;record/downloadRecord/%s/%s/%s/%s/%s?accessToken=%s&#34;</font><font
													color="#000000">,</font><br /> <font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font
													color="#2a00ff">&#34;sandi&#34;</font><font color="#000000">,&nbsp;</font><font
													color="#2a00ff">&#34;ttxitsioeoshifs&#34;</font><font
													color="#000000">,&nbsp;</font><font color="#2a00ff">&#34;1535123546&#34;</font><font
													color="#000000">,&nbsp;</font><font color="#2a00ff">&#34;2&#34;</font><font
													color="#000000">,&nbsp;</font><font color="#2a00ff">&#34;2359&#34;</font><font
													color="#000000">,&nbsp;AccessTokenUtil.getAccessToken</font><font
													color="#000000">())</font><font color="#000000">;</font><br />
												<font color="#ffffff"></font><br /> <font color="#3f7f5f">//&nbsp;调用接口,
													返回的是文件的字节数据</font><br /> <font color="#7f0055"><b>return&nbsp;</b></font><font
													color="#000000">HttpUtils.getBytes</font><font
													color="#000000">(</font><font color="#000000">url</font><font
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
													color="#7f0055"><b>byte</b></font><font color="#000000">[]&nbsp;</font><font
													color="#000000">getBytes</font><font color="#000000">(</font><font
													color="#000000">String&nbsp;url</font><font color="#000000">)&nbsp;{</font><br />
												<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;</font><font
													color="#7f0055"><b>byte</b></font><font color="#000000">[]&nbsp;</font><font
													color="#000000">bytes&nbsp;=&nbsp;</font><font
													color="#7f0055"><b>null</b></font><font color="#000000">;</font><br />
												<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;</font><font
													color="#7f0055"><b>try&nbsp;</b></font><font
													color="#000000">{</font><br /> <font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font
													color="#000000">HttpGet&nbsp;httpGet&nbsp;=&nbsp;</font><font
													color="#7f0055"><b>new&nbsp;</b></font><font
													color="#000000">HttpGet</font><font color="#000000">(</font><font
													color="#000000">url</font><font color="#000000">)</font><font
													color="#000000">;</font><br /> <font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font
													color="#000000">CloseableHttpClient&nbsp;httpclient&nbsp;=&nbsp;HttpClients.createDefault</font><font
													color="#000000">()</font><font color="#000000">;</font><br />
												<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><br />
												<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font
													color="#3f7f5f">//&nbsp;开始连接&nbsp;URL</font><br /> <font
													color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font
													color="#000000">CloseableHttpResponse&nbsp;response&nbsp;=&nbsp;httpclient.execute</font><font
													color="#000000">(</font><font color="#000000">httpGet</font><font
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
													color="#000000">bytes&nbsp;=&nbsp;EntityUtils.toByteArray</font><font
													color="#000000">(</font><font color="#000000">resEntity</font><font
													color="#000000">)</font><font color="#000000">;</font><br />
												<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font
													color="#000000">EntityUtils.consume</font><font
													color="#000000">(</font><font color="#000000">resEntity</font><font
													color="#000000">)</font><font color="#000000">;</font><br />
												<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font
													color="#000000">}</font><br /> <font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font
													color="#000000">response.close</font><font color="#000000">()</font><font
													color="#000000">;</font><br /> <font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;</font><font
													color="#000000">}&nbsp;</font><font color="#7f0055"><b>catch</b></font><font
													color="#000000">(</font><font color="#000000">IOException&nbsp;e</font><font
													color="#000000">)&nbsp;{</font><br /> <font
													color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font
													color="#000000">e.printStackTrace</font><font
													color="#000000">()</font><font color="#000000">;</font><br />
												<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;</font><font
													color="#000000">}</font><br /> <font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;</font><font
													color="#7f0055"><b>return&nbsp;</b></font><font
													color="#000000">bytes;</font><br /> <font color="#000000">}</font>
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
									&quot;下载录音接口&quot; 功能是通过 HTTP GET 方法直接传参, 调用服务器接口.<br>
									如果传参无误, 服务器将直接返回音频文件的 <b>二进制流数据</b>, 用浏览器直接跳转访问接口可以做到下载文件的效果.<br>
									如果传参失败, 服务器将会返回一个 JSON 实体, 告诉开发者错误信息.
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
	<script src="${pageContext.request.contextPath}/js/plugins/bootstrap3/bootstrap.min.js"></script>
	
	<script type="text/javascript">
		$($(".nav-sidebar > li")[3]).addClass("active");
	
		$("#submit-btn").click(function() {
			var form = $("<form>"); //定义一个form表单
			form.attr('style', 'display:none'); //在form表单中添加查询参数
			form.attr('target', '');
			form.attr('method', 'post');
			form.attr('action', host_url + "/demo/downloadRecord.action");

			var input1 = $('<input>');
			input1.attr('type', 'hidden');
			input1.attr('name', 'clientId');
			input1.attr('value', $("#client_id").val());
			var input2 = $("<input>");
			input2.attr('type', 'hidden');
			input2.attr('name', 'openId');
			input2.attr('value', $("#openId").val());
			var input3 = $("<input>");
			input3.attr('type', 'hidden');
			input3.attr('name', 'callId');
			input3.attr('value', $("#callId").val());
			var input4 = $("<input>");
			input4.attr('type', 'hidden');
			input4.attr('name', 'subId');
			input4.attr('value', $("#subId").val());
			var input5 = $("<input>");
			input5.attr('type', 'hidden');
			input5.attr('name', 'organizerId');
			input5.attr('value', $("#organizerId").val());
			$('body').append(form);
			form.append(input1);
			form.append(input2);
			form.append(input3);
			form.append(input4);
			form.append(input5);
			form.submit();
		});
	</script>	
</body>
</html>