package cn.com.sandi.demo.action;

import java.io.ByteArrayInputStream;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.sun.xml.internal.messaging.saaj.util.ByteInputStream;

import cn.com.sandi.demo.utils.AccessTokenUtil;
import cn.com.sandi.demo.utils.ApiUtils;

@SuppressWarnings("unused")
public class DemoAction extends ActionSupport {
	private static final long serialVersionUID = -4911054117941551962L;

	private String result;
	
	private int bufferSize;
	private InputStream inputStream;
	
	/**
	 * 获取 AccessToken
	 */
	public String getAccessToken() {
		ActionContext ctx = ActionContext.getContext();
		Map<String, Object> map = ctx.getParameters();
		String clientId = null, clientSecret = null;
		try {
			clientId = ((String[])map.get("clientId"))[0];
			clientSecret = ((String[])map.get("clientSecret"))[0];
		} catch(Exception e) {}
		
		
		if (clientId == null || clientId.trim().length() == 0
			|| clientSecret == null || clientSecret.trim().length() == 0) {
			result = "{\"errcode\":10008, \"errmsg\":\"参数不齐\"}";
		} else {
//			String token = "sbjHwWWb/81NJerXm5WvWQ==";		// 测试用
			String token = AccessTokenUtil.getAccessToken(clientId, clientSecret);
			if (token == null) result = AccessTokenUtil.getError();
			else result = "{\"errcode\":0, \"content\":\"" + token + "\"}";
		}
		
		return SUCCESS;
	}
	
	/**
	 * 查询录音
	 */
	public String getRecordList() {
		ActionContext ctx = ActionContext.getContext();
		Map<String, Object> map = ctx.getParameters();
		String accessToken = null, clientId = null, openId = null, agtId = null, 
				startTime = null, endTime = null, organizerId = null;
		try {
			clientId = ((String[])map.get("clientId"))[0];
			openId = ((String[])map.get("openId"))[0];
			if (map.containsKey("agtId")) agtId = ((String[])map.get("agtId"))[0];
			if (map.containsKey("startTime")) startTime = ((String[])map.get("startTime"))[0];
			if (map.containsKey("endTime")) endTime = ((String[])map.get("endTime"))[0];
			if (map.containsKey("organizerId")) organizerId = ((String[])map.get("organizerId"))[0];
		} catch(Exception e) {}
		
		accessToken = AccessTokenUtil.getAccessToken();
		
		if (clientId == null || clientId.trim().length() == 0
			|| openId == null || openId.trim().length() == 0
			|| accessToken == null || accessToken.trim().length() == 0) {
			result = "{\"errcode\":10008, \"errmsg\":\"参数不齐\"}";
		} else {
			// 调用接口
//			result = "{\"errcode\":\"0\",\"errmsg\":\"ok\",\"value\":{\"total\":5,\"rows\":[{\"PROVINCENAME\":null,\"CALLID\":1535123546,\"NAME\":\"沙太中通281004\",\"ORGANIZER_ID\":2359,\"GROUPID\":null,\"AGTID\":\"81004\",\"NOTYPE\":\"A\",\"CALLTYPE\":\"1\",\"DNIS\":\"9999\",\"MEMO\":null,\"ANI\":\"41000\",\"ROWNUMBER\":1,\"TENANTS_ID\":7,\"ORGANIZER_NAME\":\"沙太中通\",\"ACDTM\":{\"date\":24,\"day\":3,\"hours\":17,\"minutes\":32,\"month\":1,\"nanos\":0,\"seconds\":53,\"time\":1456306373000,\"timezoneOffset\":-480,\"year\":116},\"SVRDUR\":25,\"SCORE1\":-1,\"CHNID\":\"00\",\"OFFHKTM\":\"2016-02-24 17:32:37\",\"SUBID\":2,\"CITYNAME\":null,\"DURATION\":53,\"AREACODE\":null,\"AUTOID\":null},{\"PROVINCENAME\":null,\"CALLID\":1535123546,\"NAME\":\"沙太中通281004\",\"ORGANIZER_ID\":2359,\"GROUPID\":null,\"AGTID\":\"81004\",\"NOTYPE\":\"A\",\"CALLTYPE\":\"1\",\"DNIS\":\"9999\",\"MEMO\":null,\"ANI\":\"41000\",\"ROWNUMBER\":1,\"TENANTS_ID\":7,\"ORGANIZER_NAME\":\"沙太中通\",\"ACDTM\":{\"date\":24,\"day\":3,\"hours\":17,\"minutes\":32,\"month\":1,\"nanos\":0,\"seconds\":53,\"time\":1456306373000,\"timezoneOffset\":-480,\"year\":116},\"SVRDUR\":25,\"SCORE1\":-1,\"CHNID\":\"00\",\"OFFHKTM\":\"2016-02-24 17:32:37\",\"SUBID\":2,\"CITYNAME\":null,\"DURATION\":53,\"AREACODE\":null,\"AUTOID\":null},{\"PROVINCENAME\":null,\"CALLID\":1535123546,\"NAME\":\"沙太中通281004\",\"ORGANIZER_ID\":2359,\"GROUPID\":null,\"AGTID\":\"81004\",\"NOTYPE\":\"A\",\"CALLTYPE\":\"1\",\"DNIS\":\"9999\",\"MEMO\":null,\"ANI\":\"41000\",\"ROWNUMBER\":1,\"TENANTS_ID\":7,\"ORGANIZER_NAME\":\"沙太中通\",\"ACDTM\":{\"date\":24,\"day\":3,\"hours\":17,\"minutes\":32,\"month\":1,\"nanos\":0,\"seconds\":53,\"time\":1456306373000,\"timezoneOffset\":-480,\"year\":116},\"SVRDUR\":25,\"SCORE1\":-1,\"CHNID\":\"00\",\"OFFHKTM\":\"2016-02-24 17:32:37\",\"SUBID\":2,\"CITYNAME\":null,\"DURATION\":53,\"AREACODE\":null,\"AUTOID\":null},{\"PROVINCENAME\":null,\"CALLID\":1535123546,\"NAME\":\"沙太中通281004\",\"ORGANIZER_ID\":2359,\"GROUPID\":null,\"AGTID\":\"81004\",\"NOTYPE\":\"A\",\"CALLTYPE\":\"1\",\"DNIS\":\"9999\",\"MEMO\":null,\"ANI\":\"41000\",\"ROWNUMBER\":1,\"TENANTS_ID\":7,\"ORGANIZER_NAME\":\"沙太中通\",\"ACDTM\":{\"date\":24,\"day\":3,\"hours\":17,\"minutes\":32,\"month\":1,\"nanos\":0,\"seconds\":53,\"time\":1456306373000,\"timezoneOffset\":-480,\"year\":116},\"SVRDUR\":25,\"SCORE1\":-1,\"CHNID\":\"00\",\"OFFHKTM\":\"2016-02-24 17:32:37\",\"SUBID\":2,\"CITYNAME\":null,\"DURATION\":53,\"AREACODE\":null,\"AUTOID\":null},{\"PROVINCENAME\":null,\"CALLID\":1535123546,\"NAME\":\"沙太中通281004\",\"ORGANIZER_ID\":2359,\"GROUPID\":null,\"AGTID\":\"81004\",\"NOTYPE\":\"A\",\"CALLTYPE\":\"1\",\"DNIS\":\"9999\",\"MEMO\":null,\"ANI\":\"41000\",\"ROWNUMBER\":1,\"TENANTS_ID\":7,\"ORGANIZER_NAME\":\"沙太中通\",\"ACDTM\":{\"date\":24,\"day\":3,\"hours\":17,\"minutes\":32,\"month\":1,\"nanos\":0,\"seconds\":53,\"time\":1456306373000,\"timezoneOffset\":-480,\"year\":116},\"SVRDUR\":25,\"SCORE1\":-1,\"CHNID\":\"00\",\"OFFHKTM\":\"2016-02-24 17:32:37\",\"SUBID\":2,\"CITYNAME\":null,\"DURATION\":53,\"AREACODE\":null,\"AUTOID\":null}]}}";
			result = ApiUtils.getRecordList(accessToken, clientId, 
					openId, agtId, startTime, endTime, organizerId);
		}
		
		return SUCCESS;
	}
	
	/**
	 * 查询通话记录
	 */
	public String getAgentCallHistoryList() {
		ActionContext ctx = ActionContext.getContext();
		Map<String, Object> map = ctx.getParameters();
		String accessToken = null, clientId = null, openId = null, userCode = null, 
				organizerId = null, offHkTmSt = null, offHkTmEd = null;
		try {
			clientId = ((String[])map.get("clientId"))[0];
			openId = ((String[])map.get("openId"))[0];
			if (map.containsKey("userCode")) userCode = ((String[])map.get("userCode"))[0];
			if (map.containsKey("organizerId")) organizerId = ((String[])map.get("organizerId"))[0];
			if (map.containsKey("offHkTmSt")) offHkTmSt = ((String[])map.get("offHkTmSt"))[0];
			if (map.containsKey("offHkTmEd")) offHkTmEd = ((String[])map.get("offHkTmEd"))[0];
		} catch(Exception e) {}
		
		accessToken = AccessTokenUtil.getAccessToken();
		
		if (clientId == null || clientId.trim().length() == 0
			|| openId == null || openId.trim().length() == 0
			|| accessToken == null || accessToken.trim().length() == 0) {
			result = "{\"errcode\":10008, \"errmsg\":\"参数不齐\"}";
		} else {
			// 调用接口
//			result = "{\"errcode\":\"0\",\"errmsg\":\"OK\",\"value\":{\"total\":5,\"rows\":[{\"CALLID\":1535123334,\"CONTACT_NAME\":null,\"GROUPID\":\"A011\",\"AGTID\":\"81002\",\"NOTYPE\":\"A\",\"CALLTYPE\":\"1\",\"DNIS\":\"9999\",\"ANI\":\"41000\",\"ROWNUMBER\":1,\"ORGANIZERID\":2359,\"ACDRLT\":1,\"SVRDUR\":20,\"CHNID\":\"00\",\"SUBID\":1,\"OFFHKTM\":\"2016-02-17 10:22:55\",\"TARGET_CTI\":null,\"SOURCE_CTI\":null,\"DURATION\":36,\"AREACODE\":null},{\"CALLID\":1535123334,\"CONTACT_NAME\":null,\"GROUPID\":\"A011\",\"AGTID\":\"81002\",\"NOTYPE\":\"A\",\"CALLTYPE\":\"1\",\"DNIS\":\"9999\",\"ANI\":\"41000\",\"ROWNUMBER\":1,\"ORGANIZERID\":2359,\"ACDRLT\":1,\"SVRDUR\":20,\"CHNID\":\"00\",\"SUBID\":1,\"OFFHKTM\":\"2016-02-17 10:22:55\",\"TARGET_CTI\":null,\"SOURCE_CTI\":null,\"DURATION\":36,\"AREACODE\":null},{\"CALLID\":1535123334,\"CONTACT_NAME\":null,\"GROUPID\":\"A011\",\"AGTID\":\"81002\",\"NOTYPE\":\"A\",\"CALLTYPE\":\"1\",\"DNIS\":\"9999\",\"ANI\":\"41000\",\"ROWNUMBER\":1,\"ORGANIZERID\":2359,\"ACDRLT\":1,\"SVRDUR\":20,\"CHNID\":\"00\",\"SUBID\":1,\"OFFHKTM\":\"2016-02-17 10:22:55\",\"TARGET_CTI\":null,\"SOURCE_CTI\":null,\"DURATION\":36,\"AREACODE\":null},{\"CALLID\":1535123334,\"CONTACT_NAME\":null,\"GROUPID\":\"A011\",\"AGTID\":\"81002\",\"NOTYPE\":\"A\",\"CALLTYPE\":\"1\",\"DNIS\":\"9999\",\"ANI\":\"41000\",\"ROWNUMBER\":1,\"ORGANIZERID\":2359,\"ACDRLT\":1,\"SVRDUR\":20,\"CHNID\":\"00\",\"SUBID\":1,\"OFFHKTM\":\"2016-02-17 10:22:55\",\"TARGET_CTI\":null,\"SOURCE_CTI\":null,\"DURATION\":36,\"AREACODE\":null},{\"CALLID\":1535123334,\"CONTACT_NAME\":null,\"GROUPID\":\"A011\",\"AGTID\":\"81002\",\"NOTYPE\":\"A\",\"CALLTYPE\":\"1\",\"DNIS\":\"9999\",\"ANI\":\"41000\",\"ROWNUMBER\":1,\"ORGANIZERID\":2359,\"ACDRLT\":1,\"SVRDUR\":20,\"CHNID\":\"00\",\"SUBID\":1,\"OFFHKTM\":\"2016-02-17 10:22:55\",\"TARGET_CTI\":null,\"SOURCE_CTI\":null,\"DURATION\":36,\"AREACODE\":null}]}}";
			result = ApiUtils.getAgentCallHistoryList(accessToken, clientId, 
					openId, userCode, organizerId, offHkTmSt, offHkTmEd);
		}
		
		return SUCCESS;
	}
	
	/**
	 * 播放录音
	 */
	public String getRecordFile() {
		ActionContext ctx = ActionContext.getContext();
		Map<String, Object> map = ctx.getParameters();
		String accessToken = null, clientId = null, openId = null, callId = null, 
				subId = null, organizerId = null;
		try {
			clientId = ((String[])map.get("clientId"))[0];
			openId = ((String[])map.get("openId"))[0];
			callId = ((String[])map.get("callId"))[0];
			subId = ((String[])map.get("subId"))[0];
			organizerId = ((String[])map.get("organizerId"))[0];
		} catch(Exception e) {}
		
		accessToken = AccessTokenUtil.getAccessToken();
		
		if (clientId == null || clientId.trim().length() == 0
				|| openId == null || openId.trim().length() == 0
				|| accessToken == null || accessToken.trim().length() == 0
				|| callId == null || callId.trim().length() == 0
				|| subId == null || subId.trim().length() == 0
				|| organizerId == null || organizerId.trim().length() == 0) {
			result = "{\"errcode\":10008, \"errmsg\":\"参数不齐\"}";
		} else {
			// 调用接口
			// TODO 测试用
			result = "{\"errcode\":\"0\",\"errmsg\":\"ok\",\"value\":{\"recType\":\"wav\",\"fileUrl\":\"http://172.16.24.12:8603/Rec1/72002/2016/03/03/102457001.wav\"}}";
//			result = ApiUtils.getRecordFile(accessToken, clientId, 
//					openId, callId, subId, organizerId);
		}
		return SUCCESS;
	}
	
	/**
	 * 下载录音
	 */
	public String downloadRecord() {
		ActionContext ctx = ActionContext.getContext();
		Map<String, Object> map = ctx.getParameters();
		String accessToken = null, clientId = null, openId = null,
				callId = null, subId = null, organizerId = null;
		try {
			clientId = ((String[])map.get("clientId"))[0];
			openId = ((String[])map.get("openId"))[0];
			callId = ((String[])map.get("callId"))[0];
			subId = ((String[])map.get("subId"))[0];
			organizerId = ((String[])map.get("organizerId"))[0];
		} catch(Exception e) {}
		
		accessToken = AccessTokenUtil.getAccessToken();
		
		if (clientId == null || clientId.trim().length() == 0
			|| openId == null || openId.trim().length() == 0
			|| accessToken == null || accessToken.trim().length() == 0
			|| callId == null || callId.trim().length() == 0
			|| subId == null || subId.trim().length() == 0
			|| organizerId == null || organizerId.trim().length() == 0) {
			result = "{\"errcode\":10008, \"errmsg\":\"参数不齐\"}";
			return INPUT;
		} else {
			// 调用接口
			try {
//				byte[] bytes = ApiUtils.downloadRecord(accessToken, 
//						clientId, openId, callId, subId, organizerId);
//				inputStream = new ByteArrayInputStream(bytes);
				// TODO 测试用
				HttpServletRequest request = (HttpServletRequest) ctx.get(ServletActionContext.HTTP_REQUEST);
				String path = request.getServletContext().getRealPath("/") + "test.wav";
				inputStream = new FileInputStream(path);
				bufferSize = inputStream.available();
			} catch (Exception e) {e.printStackTrace();}
		}
		
		return SUCCESS;
	}
	
	/**
	 * 查询用户信息
	 */
	public String getuserinfo() {
		ActionContext ctx = ActionContext.getContext();
		Map<String, Object> map = ctx.getParameters();
		String accessToken = null, clientId = null, openId = null;
		try {
			clientId = ((String[])map.get("clientId"))[0];
			openId = ((String[])map.get("openId"))[0];
		} catch(Exception e) {}
		
		accessToken = AccessTokenUtil.getAccessToken();
		
		if (clientId == null || clientId.trim().length() == 0
				|| openId == null || openId.trim().length() == 0
				|| accessToken == null || accessToken.trim().length() == 0) {
				result = "{\"errcode\":10008, \"errmsg\":\"参数不齐\"}";
				return INPUT;
			} else {
				// 调用接口
				try {
					result = ApiUtils.getuserinfo(accessToken, clientId, openId);
				} catch (Exception e) {}
			}
		
		return SUCCESS;
	}
	
	/**
	 * 导出Excel
	 */
	public String exportExcel() {
		ActionContext ctx = ActionContext.getContext();
		Map<String, Object> map = ctx.getParameters();
		String accessToken = null, clientId = null, openId = null;
		try {
			clientId = ((String[])map.get("clientId"))[0];
			openId = ((String[])map.get("openId"))[0];
		} catch(Exception e) {}
		
		accessToken = AccessTokenUtil.getAccessToken();
		
		if (clientId == null || clientId.trim().length() == 0
			|| openId == null || openId.trim().length() == 0
			|| accessToken == null || accessToken.trim().length() == 0) {
			result = "{\"errcode\":10008, \"errmsg\":\"参数不齐\"}";
			return INPUT;
		} else {
			// 调用接口
			try {
//				byte[] bytes = "测试用".getBytes("utf-8");
				byte[] bytes = ApiUtils.exportExcel(accessToken, clientId, openId);
				inputStream = new ByteArrayInputStream(bytes);
				bufferSize = inputStream.available();
			} catch (Exception e) {}
		}
		
		return SUCCESS;
	}

	public String getResult() {
		return result;
	}
	public int getBufferSize() {
		return bufferSize;
	}
	public InputStream getInputStream() {
		return inputStream;
	}
}
