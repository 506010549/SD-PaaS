package cn.com.sandi.demo.utils;

import java.util.Date;
import java.util.Map;

import org.apache.struts2.json.JSONUtil;

/**
 * AccessToken工具类
 * @author lWJ
 * 用于获取AccessToken并保管起来
 * 过期时会自动刷新
 */
@SuppressWarnings("unchecked")
public class AccessTokenUtil {
	public static String host_url;
	public static String client_id;
	public static String client_secret;
	public static String error;				// 如果 AccessToken 获取失败, 可以从这个属性中获取错误信息.
	public static String openId;
	
	static {
		host_url = "http://124.172.245.229:9817/VenusRest";			// 服务器地址
//		host_url = "http://172.16.23.21:98/VenusRest";	
		client_id = "sandi";										//开发者ID
		client_secret = "sandi";							//开发者秘钥
		openId = "33A5A27DFD0E9641E0530100007F8A3E";									//测试用户的OpenId
//		openId = "30F63C20A1131890E0530100007FB4D0";
	}
	
	private static String accessToken;			// 保存从服务器中获取的 Token
	private static Date expire;				// 设置过期时间
	
	public static String getError() {
		return error;
	}

	public static String getAccessToken() {
		Date now = new Date();
		
		// 判断 AccessToken 是否过期
		if (accessToken == null || expire == null || now.getTime() > expire.getTime()) {
			Map<String, Object> resultMap = null;
			// 调用接口
			String result = HttpUtils.getJson(host_url 
					+ "/webservice/sd-saas/oauth20/getToken/" 
					+ client_id + "/" + client_secret);
			
			try {
				resultMap = (Map<String, Object>) JSONUtil.deserialize(result);
				
				if (resultMap != null && resultMap.containsKey("content")) {
					resultMap = (Map<String, Object>) resultMap.get("content");
				} else if (resultMap != null &&  resultMap.get("errcode").toString().equals("0")) {
					accessToken = resultMap.get("accessToken").toString();
					// 设置两小时后过期
					expire = new Date(now.getTime() + 7200000);
				} else {
					// 获取AccessToken失败
					accessToken = null;
					expire = null;
					System.err.println("获取 AccessToken 失败");
					error = JSONUtil.serialize(resultMap.toString());
				}
			} catch (Exception e) {
				e.printStackTrace();
				return null;
			}
		}
		return accessToken;
	}
	
	public static String getAccessToken(String client_id, String client_secret) {
		Date now = new Date();
		
		/*
		 * 如果原来的 client_id 和 client_secret 与新传入的不一样的话, 会重新获取 AccessToken
		 * 即使 client_id 和 client_secret 没变, 如果 AccessToken 过期也会重新获取
		 */
		if (AccessTokenUtil.client_id == null || !AccessTokenUtil.client_id.equals(client_id)
			|| AccessTokenUtil.client_secret == null || !AccessTokenUtil.client_secret.equals(client_secret)
			|| accessToken == null || expire == null || now.getTime() > expire.getTime()) {
			Map<String, Object> resultMap = null;
			// 调用接口
			String result = HttpUtils.getJson(host_url 
					+ "/webservice/sd-saas/oauth20/getToken/" 
					+ client_id + "/" + client_secret);
			
			try {
				resultMap = (Map<String, Object>) JSONUtil.deserialize(result);
				
				if (resultMap != null && resultMap.containsKey("content")) {
					resultMap = (Map<String, Object>) resultMap.get("content");
				} else if (resultMap != null &&  resultMap.get("errcode").toString().equals("0")) {
					accessToken = resultMap.get("accessToken").toString();
					// 设置两小时后过期
					expire = new Date(now.getTime() + 7200000);
					// 记录新的 client_id 和 client_secret
					AccessTokenUtil.client_id = client_id;
					AccessTokenUtil.client_secret = client_secret;
				} else {
					// 获取AccessToken失败
					accessToken = null;
					expire = null;
					System.err.println("获取 AccessToken 失败");
					error = JSONUtil.serialize(resultMap.toString());
				}
			} catch (Exception e) {
				e.printStackTrace();
				return null;
			}
		}
		return accessToken;
	}
}
