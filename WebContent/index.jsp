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
				<h1 class="page-header">获取AccessToken</h1>

				<div class="row" style="margin-bottom: 10px;">
					<div class="col-sm-4">
						<button id="submit-btn" class="btn btn-lg btn-default">获取AccessToken</button>
					</div>
					<div class="col-sm-8" style="line-height: 46px; font-size: 18px;">
						<span id="result">请输入 Client ID 和 Client Secret<!-- 你获取的 AccessToken 为: sbjHwWWb/81NJerXm5WvWQ== --></span>
					</div>
				</div>

				<form>
					<div class="form-group">
						<label for="client_id">Client ID<font color="red">*</font></label>
						<input class="form-control" id="client_id" placeholder="Client ID"
							value="sandi">
					</div>
					<div class="form-group">
						<label for="client_secret">Client Secret<font color="red">*</font></label>
						<input class="form-control" id="client_secret"
							placeholder="Client Secret" value="sandisdsaastest">
					</div>
				</form>

				<div id="code-example">
					<h2>代码示例</h2>

					<!-- Nav tabs -->
					<ul class="nav nav-tabs" role="tablist">
						<li role="presentation" class="active"><a href="#tab-1"
							aria-controls="tab-1" role="tab" data-toggle="tab">AccessTokenUtil.java</a></li>
						<li role="presentation"><a href="#tab-2"
							aria-controls="tab-2" role="tab" data-toggle="tab">HttpUtils.getJson()方法</a></li>
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
												<font color="#7f0055"><b>public&nbsp;class&nbsp;</b></font><font
													color="#000000">AccessTokenUtil&nbsp;</font><font
													color="#000000">{</font><br /> <font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;</font><font
													color="#7f0055"><b>private&nbsp;static&nbsp;</b></font><font
													color="#000000">String&nbsp;host_url&nbsp;=&nbsp;</font><font
													color="#2a00ff">&#34;172.16.24.21:9812&#34;</font><font
													color="#000000">;&nbsp;&nbsp;&nbsp;&nbsp;</font><font
													color="#3f7f5f">//&nbsp;服务器地址</font><br /> <font
													color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;</font><font
													color="#7f0055"><b>private&nbsp;static&nbsp;</b></font><font
													color="#000000">String&nbsp;client_id;</font><br /> <font
													color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;</font><font
													color="#7f0055"><b>private&nbsp;static&nbsp;</b></font><font
													color="#000000">String&nbsp;client_secret;</font><br /> <font
													color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;</font><font
													color="#7f0055"><b>private&nbsp;static&nbsp;</b></font><font
													color="#000000">String&nbsp;error;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font
													color="#3f7f5f">//&nbsp;如果&nbsp;AccessToken&nbsp;获取失败,&nbsp;可以从这个属性中获取错误信息.</font><br />
												<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;</font><br />
												<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;</font><font
													color="#7f0055"><b>private&nbsp;static&nbsp;</b></font><font
													color="#000000">String&nbsp;accessToken;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font
													color="#3f7f5f">//&nbsp;保存从服务器中获取的&nbsp;Token</font><br />
												<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;</font><font
													color="#7f0055"><b>private&nbsp;static&nbsp;</b></font><font
													color="#000000">Date&nbsp;expire;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font
													color="#3f7f5f">//&nbsp;设置过期时间</font><br /> <font
													color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;</font><br /> <font
													color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;</font><font
													color="#7f0055"><b>public&nbsp;static&nbsp;</b></font><font
													color="#000000">String&nbsp;getError</font><font
													color="#000000">()&nbsp;{</font><br /> <font
													color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font
													color="#7f0055"><b>return&nbsp;</b></font><font
													color="#000000">error;</font><br /> <font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;</font><font
													color="#000000">}</font><br /> <font color="#ffffff"></font><br />
												<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;</font><font
													color="#7f0055"><b>public&nbsp;static&nbsp;</b></font><font
													color="#000000">String&nbsp;getAccessToken</font><font
													color="#000000">(</font><font color="#000000">String&nbsp;client_id,&nbsp;String&nbsp;client_secret</font><font
													color="#000000">)&nbsp;{</font><br /> <font
													color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font
													color="#000000">Date&nbsp;now&nbsp;=&nbsp;</font><font
													color="#7f0055"><b>new&nbsp;</b></font><font
													color="#000000">Date</font><font color="#000000">()</font><font
													color="#000000">;</font><br /> <font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><br />
												<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font
													color="#3f7f5f">/*</font><br /> <font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font
													color="#3f7f5f">*&nbsp;如果原来的&nbsp;client_id&nbsp;和&nbsp;client_secret&nbsp;与新传入的不一样的话,&nbsp;会重新获取&nbsp;AccessToken</font><br />
												<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font
													color="#3f7f5f">*&nbsp;即使&nbsp;client_id&nbsp;和&nbsp;client_secret&nbsp;没变,&nbsp;如果&nbsp;AccessToken&nbsp;过期也会重新获取</font><br />
												<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font
													color="#3f7f5f">*/</font><br /> <font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font
													color="#7f0055"><b>if&nbsp;</b></font><font color="#000000">(</font><font
													color="#000000">AccessTokenUtil.client_id&nbsp;==&nbsp;</font><font
													color="#7f0055"><b>null&nbsp;</b></font><font
													color="#000000">||&nbsp;!AccessTokenUtil.client_id.equals</font><font
													color="#000000">(</font><font color="#000000">client_id</font><font
													color="#000000">)</font><br /> <font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font
													color="#000000">||&nbsp;AccessTokenUtil.client_secret&nbsp;==&nbsp;</font><font
													color="#7f0055"><b>null&nbsp;</b></font><font
													color="#000000">||&nbsp;!AccessTokenUtil.client_secret.equals</font><font
													color="#000000">(</font><font color="#000000">client_secret</font><font
													color="#000000">)</font><br /> <font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font
													color="#000000">||&nbsp;accessToken&nbsp;==&nbsp;</font><font
													color="#7f0055"><b>null&nbsp;</b></font><font
													color="#000000">||&nbsp;expire&nbsp;==&nbsp;</font><font
													color="#7f0055"><b>null&nbsp;</b></font><font
													color="#000000">||&nbsp;now.getTime</font><font
													color="#000000">()&nbsp;</font><font color="#000000">&gt;&nbsp;expire.getTime</font><font
													color="#000000">())&nbsp;{</font><br /> <font
													color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font
													color="#000000">Map&lt;String,&nbsp;Object&gt;&nbsp;resultMap&nbsp;=&nbsp;</font><font
													color="#7f0055"><b>null</b></font><font color="#000000">;</font><br />
												<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font
													color="#3f7f5f">//&nbsp;调用接口, 通过Get方法连接,
													并获取其返回的结果JSON(下面有它的定义)</font><br /> <font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font
													color="#000000">String&nbsp;result&nbsp;=&nbsp;HttpUtils.getJson</font><font
													color="#000000">(</font><font color="#2a00ff">&#34;http://&#34;&nbsp;</font><font
													color="#000000">+&nbsp;host_url&nbsp;</font><br /> <font
													color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font
													color="#000000">+&nbsp;</font><font color="#2a00ff">&#34;/VenusRest/webservice/sd-saas/oauth20/getToken/&#34;&nbsp;</font><br />
												<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font
													color="#000000">+&nbsp;client_id&nbsp;+&nbsp;</font><font
													color="#2a00ff">&#34;/&#34;&nbsp;</font><font
													color="#000000">+&nbsp;client_secret</font><font
													color="#000000">)</font><font color="#000000">;</font><br />
												<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><br />
												<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font
													color="#7f0055"><b>try&nbsp;</b></font><font
													color="#000000">{</font><br /> <font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font
													color="#000000">resultMap&nbsp;=&nbsp;</font><font
													color="#000000">(</font><font color="#000000">Map&lt;String,&nbsp;Object&gt;</font><font
													color="#000000">)&nbsp;</font><font color="#000000">JSONUtil.deserialize</font><font
													color="#000000">(</font><font color="#000000">result</font><font
													color="#000000">)</font><font color="#000000">;</font><br />
												<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><br />
												<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font
													color="#7f0055"><b>if&nbsp;</b></font><font color="#000000">(</font><font
													color="#000000">resultMap&nbsp;!=&nbsp;</font><font
													color="#7f0055"><b>null&nbsp;</b></font><font
													color="#000000">&amp;&amp;&nbsp;resultMap.containsKey</font><font
													color="#000000">(</font><font color="#2a00ff">&#34;content&#34;</font><font
													color="#000000">))&nbsp;{</font><br /> <font
													color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font
													color="#000000">resultMap&nbsp;=&nbsp;</font><font
													color="#000000">(</font><font color="#000000">Map&lt;String,&nbsp;Object&gt;</font><font
													color="#000000">)&nbsp;</font><font color="#000000">resultMap.get</font><font
													color="#000000">(</font><font color="#2a00ff">&#34;content&#34;</font><font
													color="#000000">)</font><font color="#000000">;</font><br />
												<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font
													color="#000000">}&nbsp;</font><font color="#7f0055"><b>else&nbsp;if&nbsp;</b></font><font
													color="#000000">(</font><font color="#000000">resultMap&nbsp;!=&nbsp;</font><font
													color="#7f0055"><b>null&nbsp;</b></font><font
													color="#000000">&amp;&amp;&nbsp;&nbsp;resultMap.get</font><font
													color="#000000">(</font><font color="#2a00ff">&#34;errcode&#34;</font><font
													color="#000000">)</font><font color="#000000">.toString</font><font
													color="#000000">()</font><font color="#000000">.equals</font><font
													color="#000000">(</font><font color="#2a00ff">&#34;0&#34;</font><font
													color="#000000">))&nbsp;{</font><br /> <font
													color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font
													color="#000000">accessToken&nbsp;=&nbsp;resultMap.get</font><font
													color="#000000">(</font><font color="#2a00ff">&#34;accessToken&#34;</font><font
													color="#000000">)</font><font color="#000000">.toString</font><font
													color="#000000">()</font><font color="#000000">;</font><br />
												<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font
													color="#3f7f5f">//&nbsp;设置两小时后过期</font><br /> <font
													color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font
													color="#000000">expire&nbsp;=&nbsp;</font><font
													color="#7f0055"><b>new&nbsp;</b></font><font
													color="#000000">Date</font><font color="#000000">(</font><font
													color="#000000">now.getTime</font><font color="#000000">()&nbsp;</font><font
													color="#000000">+&nbsp;</font><font color="#990000">7200000</font><font
													color="#000000">)</font><font color="#000000">;</font><br />
												<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font
													color="#3f7f5f">//&nbsp;记录新的&nbsp;client_id&nbsp;和&nbsp;client_secret</font><br />
												<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font
													color="#000000">AccessTokenUtil.client_id&nbsp;=&nbsp;client_id;</font><br />
												<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font
													color="#000000">AccessTokenUtil.client_secret&nbsp;=&nbsp;client_secret;</font><br />
												<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font
													color="#000000">}&nbsp;</font><font color="#7f0055"><b>else&nbsp;</b></font><font
													color="#000000">{</font><br /> <font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font
													color="#3f7f5f">//&nbsp;获取AccessToken失败</font><br /> <font
													color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font
													color="#000000">accessToken&nbsp;=&nbsp;</font><font
													color="#7f0055"><b>null</b></font><font color="#000000">;</font><br />
												<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font
													color="#000000">expire&nbsp;=&nbsp;</font><font
													color="#7f0055"><b>null</b></font><font color="#000000">;</font><br />
												<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font
													color="#000000">System.err.println</font><font
													color="#000000">(</font><font color="#2a00ff">&#34;获取&nbsp;AccessToken&nbsp;失败&#34;</font><font
													color="#000000">)</font><font color="#000000">;</font><br />
												<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font
													color="#000000">error&nbsp;=&nbsp;JSONUtil.serialize</font><font
													color="#000000">(</font><font color="#000000">resultMap.toString</font><font
													color="#000000">())</font><font color="#000000">;</font><br />
												<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font
													color="#000000">}</font><br /> <font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font
													color="#000000">}&nbsp;</font><font color="#7f0055"><b>catch&nbsp;</b></font><font
													color="#000000">(</font><font color="#000000">Exception&nbsp;e</font><font
													color="#000000">)&nbsp;{</font><br /> <font
													color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font
													color="#000000">e.printStackTrace</font><font
													color="#000000">()</font><font color="#000000">;</font><br />
												<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font
													color="#7f0055"><b>return&nbsp;null</b></font><font
													color="#000000">;</font><br /> <font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font
													color="#000000">}</font><br /> <font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font
													color="#000000">}</font><br /> <font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font
													color="#7f0055"><b>return&nbsp;</b></font><font
													color="#000000">accessToken;</font><br /> <font
													color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;</font><font
													color="#000000">}</font><br /> <font color="#000000">}</font>
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
													color="#000000">String&nbsp;getJson</font><font
													color="#000000">(</font><font color="#000000">String&nbsp;url</font><font
													color="#000000">)&nbsp;{</font><br /> <font
													color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;</font><font
													color="#000000">String&nbsp;ans&nbsp;=&nbsp;</font><font
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
												<font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><br />
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
							    AccessToken是调用所有其它接口都需要用到的认证参数.<br>
							    它的有效期是 <b>2小时</b>, 为了不加重服务器负担, 请开发者自觉保存 AccessToken 到本地, 等需要用到时, 直接加载本地的 AccessToken 即可.<br>
							    保存 AccessToken 的重点在于如何在超出有效期之后自动更新 AccessToken, 以上采用的方法是 <b>被动更新</b>.<br>
							    每次创建 AccessToken 都要记录它的创建时间, 当需要调用 AccessToken 的时候, 就查看现在的时间离创建时间是否超出了有效期.<br>
							    如果是, 则重新获取AccessToken; 否则, 继续调用本地的AccessToken.<br>
							    上述实例中, 2个小时内获取的 AccessToken 一定是相同的.<br>
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
		$($(".nav-sidebar > li")[0]).addClass("active");
	
		$("#submit-btn").click(function() {
			$("#result").html("正在获取 AccessToken ...");
			
			$.ajax({
				type: "POST",
				url: host_url + "/demo/getAccessToken.action",
				data: {clientId: $("#client_id").val(), clientSecret: $("#client_secret").val()},
				dataType: "json",
				async: false,
				success: function(result) {
					var obj = JSON.parse(result);
					
					if (obj.errcode == 0) {
						$("#result").html("取得的 AccessToken: " + obj.content);
					} else {
						$("#result").html("获取失败, 错误码: " + obj.errcode + ", " + obj.errmsg);
					}
				}
			});
		});
	</script>
</body>
</html>