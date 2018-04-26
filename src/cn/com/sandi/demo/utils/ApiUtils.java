package cn.com.sandi.demo.utils;

import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.http.NameValuePair;
import org.apache.http.message.BasicNameValuePair;
import org.apache.struts2.json.JSONException;
import org.apache.struts2.json.JSONUtil;

public class ApiUtils {
	
	/**
	 * 查询通话记录
	 */
	public static String getAgentCallHistoryList(String accessToken, String clientId, 
			String openId, String userCode, String organizerId, String offHkTmSt, String offHkTmEd) {
		// 接口地址
		String url = AccessTokenUtil.host_url+"/webservice/sd-saas/"
				+ "call/getAgentCallHistoryList?accessToken=" + accessToken;
		
		// 设置参数
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("client_id", clientId);
		params.put("openId", openId);
		if (userCode != null) params.put("userCode", userCode);
		if (organizerId != null) params.put("organizerId", organizerId);
		if (offHkTmSt != null) params.put("offHkTmSt", offHkTmSt);
		if (offHkTmEd != null) params.put("offHkTmEd", offHkTmEd);
		
		// 调用接口
		return HttpUtils.postJson(url, params);
	}
	
	/**
	 * 查询通话记录
	 */
	public static String getAgentCallHistoryList() {
		// 接口地址
		String url = AccessTokenUtil.host_url+"/webservice/sd-saas/"
				+ "call/getAgentCallHistoryList?accessToken=" + AccessTokenUtil.getAccessToken();
		
		// 设置参数
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("client_id", "sandi");
		params.put("openId", "ttxitsioeoshifs");
		params.put("userCode", "-1");
		params.put("acdrlt", "1");
		params.put("currentPage", 1);
		params.put("rows", 10);
		params.put("offHkTmSt", "2000-03-01 00:00:00");
		params.put("offHkTmEd", "2016-04-06 00:00:00");
		
		// 调用接口
		return HttpUtils.postJson(url, params);
	}
	
	/**
	 * 查询录音
	 */
	public static String getRecordList(String accessToken, String clientId, 
			String openId, String agtId, String startTime, String endTime, String organizerId) {
		// 接口地址
		String url = AccessTokenUtil.host_url+"/webservice/"
				+ "sd-saas/record/getRecordList?accessToken=" + accessToken;
		
		// 设置参数
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("client_id", clientId);
		params.put("openId", openId);
		if (agtId != null) params.put("agtId", agtId);
		if (endTime != null) params.put("endTime", endTime);
		if (startTime != null) params.put("startTime", startTime);
		if (organizerId != null) params.put("organizerId", Long.parseLong(organizerId));
		
		// 调用接口
		return HttpUtils.postJson(url, params);
	}
	
	/**
	 * 查询录音
	 */
	public static String getRecordList() {
		// 接口地址
		String url = AccessTokenUtil.host_url+"/webservice/"
				+ "sd-saas/record/getRecordList?accessToken=" + AccessTokenUtil.getAccessToken();
		
		// 设置参数
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("client_id", "sandi");
		params.put("openId", "ttxitsioeoshifs");
		params.put("agtId", "81004");
		params.put("endTime", "2016-02-24 23:59:59");
		params.put("startTime", "2016-02-24 00:00:00");
		params.put("organizerId", 2359);
		
		// 调用接口
		return HttpUtils.postJson(url, params);
	}
	
	/**
	 * 听取录音
	 */
	public static String getRecordFile(String accessToken, String clientId, 
			String openId, String callId, String subId, String organizerId) {
		// 接口地址
		String url = AccessTokenUtil.host_url+"/webservice/sd-saas/"
				+ "record/getRecordFile?accessToken=" + accessToken;
		
		// 设置参数
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("client_id", clientId);
		params.put("openId", openId);
		params.put("callId", Long.parseLong(callId));
		params.put("subId", Long.parseLong(subId));
		params.put("organizerId", Long.parseLong(organizerId));
		
		// 调用接口
		return HttpUtils.postJson(url, params);
	}
	
	/**
	 * 听取录音
	 */
	public static String getRecordFile() {
		// 接口地址
		String url = AccessTokenUtil.host_url+"/webservice/sd-saas/"
				+ "record/getRecordFile?accessToken=" + AccessTokenUtil.getAccessToken();
		
		// 设置参数
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("client_id", "sandi");
		params.put("openId", "ttxitsioeoshifs");
		params.put("callId", 1535123546);
		params.put("subId", 2);
		params.put("organizerId", 2359);
		
		// 调用接口
		return HttpUtils.postJson(url, params);
	}
	
	/**
	 * 下载录音
	 */
	public static byte[] downloadRecord(String accessToken, String clientId, 
			String openId, String callId, String subId, String organizerId) {
		// 接口地址
		String url = String.format(AccessTokenUtil.host_url+"/webservice/sd-saas/"
				+ "record/downloadRecord/%s/%s/%s/%s/%s?accessToken=%s",
				clientId, openId, callId, subId, organizerId, accessToken);
		
		// 调用接口
	    return HttpUtils.getBytes(url);
	}
	
	/**
	 * 下载录音
	 */
	public static byte[] downloadRecord() {
		// 接口地址
		String url = String.format(AccessTokenUtil.host_url+"/webservice/sd-saas/"
				+ "record/downloadRecord/%s/%s/%s/%s/%s?accessToken=%s",
				"sandi", "ttxitsioeoshifs", "1535123546", "2", "2359", AccessTokenUtil.getAccessToken());
		
		// 调用接口
		return HttpUtils.getBytes(url);
	}
	
	/**
	 * 获取openId对应的授权用户信息
	 */
	public static String getuserinfo(String accessToken, String clientId, String openId) {
		// 接口地址
		String url = AccessTokenUtil.host_url+"/webservice/"
				+ "sd-saas/user/getuserinfo?accessToken=" + accessToken;
		
		// 设置参数
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("client_id", clientId);
		params.put("openId", openId);
		
		return HttpUtils.postJson(url, params);
	}
	
	/**
	 * 获取openId对应的授权用户信息
	 */
	public static String getuserinfo() {
		// 接口地址
		String url = AccessTokenUtil.host_url+"/webservice/"
				+ "sd-saas/user/getuserinfo?accessToken=" + AccessTokenUtil.getAccessToken();
		
		// 设置参数
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("client_id", "sandi");
		params.put("openId", "ttxitsioeoshifs");
		
		return HttpUtils.postJson(url, params);
	}
	
	/**
	 * 导出Excel
	 */
	public static byte[] exportExcel(String accessToken, String clientId, String openId) {
		// 接口地址
		String url = AccessTokenUtil.host_url+"/webservice/sd-saas/"
				+ "contact/exportcontacts?accessToken=" + accessToken;
		
		// 设置参数
		Map<String, Object> valueMap = new HashMap<String, Object>();
		valueMap.put("client_id", clientId);
		valueMap.put("openId", openId);
		
		String json = null;
		try {
			json = JSONUtil.serialize(valueMap);
		} catch (JSONException e) {
			e.printStackTrace();
			return null;
		}
		
		List<NameValuePair> nvps = new ArrayList<NameValuePair>();
		nvps.add(new BasicNameValuePair("jsonQueryCon", json));
		
		// 调用接口
		return HttpUtils.postFormAndGetBytes(url, nvps);
	}
	
	/**
	 * 导出Excel
	 */
	public static byte[] exportExcel() {
		// 接口地址
		String url = AccessTokenUtil.host_url+"/webservice/sd-saas/"
				+ "contact/exportcontacts?accessToken=" + AccessTokenUtil.getAccessToken();
		
		// 设置参数
		Map<String, Object> valueMap = new HashMap<String, Object>();
		valueMap.put("client_id", "sandi");
		valueMap.put("openId", "ttxitsioeoshifs");
		
		String json = null;
		try {
			json = JSONUtil.serialize(valueMap);
		} catch (JSONException e) {
			e.printStackTrace();
			return null;
		}
		
		List<NameValuePair> nvps = new ArrayList<NameValuePair>();
		nvps.add(new BasicNameValuePair("jsonQueryCon", json));
		
		// 调用接口
		return HttpUtils.postFormAndGetBytes(url, nvps);
	}
	
	
	public static void main(String[] args) {
		byte[] bytes = exportExcel();
		
		try {
			FileOutputStream fos = new FileOutputStream("tmp.xls");
			fos.write(bytes);
			fos.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
