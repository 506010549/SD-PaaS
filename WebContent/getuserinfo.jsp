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
				<h1 class="page-header">查询用户信息<button type="button" class="btn btn-success" id="search-btn">查询</button></h1>
				
				<form>
					<div class="form-group">
						<label for="client_id">Client ID<font color="red">*</font></label> <input
							class="form-control" id="client_id"
							placeholder="Client ID" value="sandi">
					</div>
					<div class="form-group">
						<label for="openId">OpenID<font color="red">*</font></label> <input
							class="form-control" id="openId"
							placeholder="OpenID" value="ttxitsioeoshifs">
					</div>
				</form>
				
				<div id="result"></div>
				
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
													color="#2a00ff">&#34;http://172.16.24.21:9812/VenusRest/webservice/&#34;</font><br />
												<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font
													color="#000000">+&nbsp;</font><font color="#2a00ff">&#34;sd-saas/user/getuserinfo?accessToken=&#34;&nbsp;</font><font
													color="#000000">+&nbsp;accessToken;</font><br /> <font
													color="#ffffff"></font><br /> <font color="#3f7f5f">//&nbsp;设置参数</font><br />
												<font color="#000000">Map&lt;String,&nbsp;Object&gt;&nbsp;params&nbsp;=&nbsp;</font><font
													color="#7f0055"><b>new&nbsp;</b></font><font
													color="#000000">HashMap&lt;String,&nbsp;Object&gt;</font><font
													color="#000000">()</font><font color="#000000">;</font><br />
												<font color="#000000">params.put</font><font color="#000000">(</font><font
													color="#2a00ff">&#34;client_id&#34;</font><font
													color="#000000">,&nbsp;clientId</font><font color="#000000">)</font><font
													color="#000000">;</font><br /> <font color="#000000">params.put</font><font
													color="#000000">(</font><font color="#2a00ff">&#34;openId&#34;</font><font
													color="#000000">,&nbsp;openId</font><font color="#000000">)</font><font
													color="#000000">;</font><br /> <font color="#ffffff"></font><br />
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
									&quot;查询用户信息接口&quot; 是通过 HTTP POST 方法, 并以 JSON 作为参数实体传递到服务器进行调用.<br>
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
	<script src="${pageContext.request.contextPath}/js/plugins/bootstrap3/bootstrap.min.js"></script>
	
	<script type="text/javascript">
		$($(".nav-sidebar > li")[5]).addClass("active");
	
		$("#search-btn").click(function() {
			$("#result").html("正在获取 用户信息 ...");
			
			$.ajax({
				type: "POST",
				url: host_url + "/demo/getuserinfo.action",
				data: {clientId: $("#client_id").val(), openId: $("#openId").val()},
				dataType: "json",
				async: false,
				success: function(result) {
					$("#result").html("<h3>获得结果:</h3><table class=\"table\"><tbody></tbody></table>");
					var obj = JSON.parse(result);
					
					if (obj.errcode == 0) {
						var tbody = $("#result tbody"), tr;
						if (obj.value != null) {
							tbody.html("");
							tbody.append("<tr><td width=\"30%\">固话号码</td><td>" + obj.value.phoneNumber + "</td></tr>");
							tbody.append("<tr><td width=\"30%\">电子邮箱</td><td>" + obj.value.email + "</td></tr>");
							tbody.append("<tr><td width=\"30%\">用户账号</td><td>" + obj.value.userCode + "</td></tr>");
							tbody.append("<tr><td width=\"30%\">用户ID</td><td>" + obj.value.userId + "</td></tr>");
							tbody.append("<tr><td width=\"30%\">用户名称</td><td>" + obj.value.userName + "</td></tr>");
							tbody.append("<tr><td width=\"30%\">管理员</td><td>" + obj.value.isAdmin  + "</td></tr>");
							tbody.append("<tr><td width=\"30%\">手机号码</td><td>" + obj.value.mobileNumber + "</td></tr>");
							tbody.append("<tr><td width=\"30%\">所属租户ID</td><td>" + obj.value.tenantsId + "</td></tr>");
							tbody.append("<tr><td width=\"30%\">所属组织ID</td><td>" + obj.value.organizerId + "</td></tr>");
							tbody.append("<tr><td width=\"30%\">用户唯一标识</td><td>" + obj.value.openId + "</td></tr>");
							tbody.append("<tr><td width=\"30%\">加密组织ID</td><td>" + obj.value.encrypt_OrgId + "</td></tr>");
							tbody.append("<tr><td width=\"30%\">加密租户ID</td><td>" + obj.value.encrypt_TenId + "</td></tr>");
						} else {
							alert("获取完毕, 没有找到结果");
						}
					} else {
						$("#result").html("获取失败, 错误码: " + obj.errcode + ", " + obj.errmsg);
					}
				}
			});
		});
	</script>	
</body>
</html>