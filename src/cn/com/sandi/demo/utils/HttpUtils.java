package cn.com.sandi.demo.utils;

import java.io.IOException;
import java.nio.charset.Charset;
import java.util.List;
import java.util.Map;

import org.apache.http.HttpEntity;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.EntityBuilder;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ContentType;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.apache.struts2.json.JSONUtil;

public class HttpUtils {
	
	public static String postJson(String url, Map<String, Object> params) {
		String ans = null;
		try {
			HttpPost httpPost = new HttpPost(url);
			CloseableHttpClient httpclient = HttpClients.createDefault();
	        
	        if (params != null) {
	        	// 配置 HTTP 参数
	        	HttpEntity entity = EntityBuilder.create()
	        			.setText(JSONUtil.serialize(params))
	        			.setContentType(ContentType.APPLICATION_JSON)
	        			.setContentEncoding("UTF-8")
	        			.build();
		        httpPost.setEntity(entity);
	        }
	       
	        // 开始连接 URL
	        CloseableHttpResponse response = httpclient.execute(httpPost);
	        
	    	// 获取响应信息
	        HttpEntity resEntity = response.getEntity();
	        if (resEntity != null) {
	            ans = EntityUtils.toString(resEntity, Charset.forName("UTF-8"));
	            EntityUtils.consume(resEntity);
	        }
	        response.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return ans;
	}
	
	public static String getJson(String url) {
		String ans = null;
		try {
			HttpGet httpGet = new HttpGet(url);
			CloseableHttpClient httpclient = HttpClients.createDefault();
	       
	        // 开始连接 URL
	        CloseableHttpResponse response = httpclient.execute(httpGet);
	        
	    	// 获取响应信息
	        HttpEntity resEntity = response.getEntity();
	        if (resEntity != null) {
	        	ans = EntityUtils.toString(resEntity, Charset.forName("UTF-8"));
	            EntityUtils.consume(resEntity);
	        }
	        response.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return ans;
	}
	
	public static byte[] postFormAndGetBytes(String url, List<NameValuePair> params) {
		byte[] bytes = null;
		try {
			HttpPost httpPost = new HttpPost(url);
			CloseableHttpClient httpclient = HttpClients.createDefault();
	        
	        if (params != null) {
	        	// 配置 HTTP 参数
	        	UrlEncodedFormEntity entity = new UrlEncodedFormEntity(params);
		        httpPost.setEntity(entity);
	        }
	       
	        // 开始连接 URL
	        CloseableHttpResponse response = httpclient.execute(httpPost);
	        
	    	// 获取响应信息
	        HttpEntity resEntity = response.getEntity();
	        if (resEntity != null) {
	            bytes = EntityUtils.toByteArray(resEntity);
	            EntityUtils.consume(resEntity);
	        }
	        response.close();
		} catch(IOException e) {
			e.printStackTrace();
		}
		return bytes;
	}
	
	public static byte[] getBytes(String url) {
		byte[] bytes = null;
		try {
			HttpGet httpGet = new HttpGet(url);
			CloseableHttpClient httpclient = HttpClients.createDefault();
	        
	        // 开始连接 URL
	        CloseableHttpResponse response = httpclient.execute(httpGet);
	        
	    	// 获取响应信息
	        HttpEntity resEntity = response.getEntity();
	        if (resEntity != null) {
	            bytes = EntityUtils.toByteArray(resEntity);
	            EntityUtils.consume(resEntity);
	        }
	        response.close();
		} catch(IOException e) {
			e.printStackTrace();
		}
		return bytes;
	}
}
