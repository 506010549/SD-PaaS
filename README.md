# SD-PaaS
SD-PaaS开发者平台的基本接口接入例子，通过此例子，你可基本了解到SD-PaaS平台如何与你的应用进行接入。

###如何把DemoProject部署到自己的服务器

- 环境要求

	jdk1.6以上版本、Tomcat7.0以上版本、VOIP环境


- 克隆或者下载代码：

	[https://github.com/506010549/SD-PaaS](https://github.com/506010549/SD-PaaS)

- 修改配置文件

  把项目导入到eclipse中

	进入src/cn/com/sandi/demo/utils目录，编辑AccessTokenUtil.java文件，填写相应的接口服务器地址、开发者ID、开发者秘钥以及测试用户OpendId；
	
	进入WebContent/phone2/js目录，编辑phone.js文件，填写相应的呼叫中心服务器、呼叫中心用户账号以及呼叫中心用户密码。

- 启动部署项目
  
  修改后，编译部署项目到tomcat中，启动tomcat，启动成功后访问：http://127.0.0.1:{tomcat端口}/DemoProject。
  
- 错误排查
	
	部署时出错，请先确认是否按照上面步骤执行（例如说相应的配置是否有修改）。

  项目导入eclipse时报错的情况下，右键项目-->Build Path-->Configure Build Path..，检查jdk包和tomcat包是否正确。
  
  再遇到无法解决的问题可上github和博客搜索下有没有已解决的方法。再不行还可以联系我，联系方式有QQ、github、邮件等。

###使用在线的SD-PaaS DemoProject

- 如果你没有自己的服务器，或者觉得自己部署麻烦，但又想尝试SD-PaaS接口的作用以及了解接口的简单接入，你可以使用在线的SD-PaaS DemoProject [http://xxx.com](http://xxx.com)（在线域名待定）


###版权

- SD-PaaS DemoProject遵循Apache2开源协议发布，并提供免费使用。  
版权所有Copyright © 2016 by 广州市三地信息技术有限公司 
技术咨询QQ：506010549  
邮箱：liuwj@sandi.com.cn   
All rights reserved.
