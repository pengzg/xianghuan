package org.xianghuan.util;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.apache.log4j.Logger;
import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;

import com.xianghuan.auth.base.cache.BaseParameterCache;

/**
 * 短信发送 公共类
 * 
 * @author panyf
 * 
 */
public class SmsUtils implements Serializable {
	
	private static Logger logger = Logger.getLogger(SmsUtils.class);

	private String url = "http://106.ihuyi.cn/webservice/sms.php?method=Submit";
	private String user = "";
	private String pwd = "";

	public SmsUtils(){
		this.url = BaseParameterCache.getInstance().getKeyValue("sms_1001");;
		this.user = BaseParameterCache.getInstance().getKeyValue("sms_1002");;
		this.pwd = BaseParameterCache.getInstance().getKeyValue("sms_1003");;
	}
	/**
	 * 
	 */
	private static final long serialVersionUID = 2827270337807842894L;

	/**
	 * 发送短信
	 * @param telephone
	 * @param content
	 * @return
	 */
	public Result<String> sendSms(String telephone, String content) throws Exception{
		Result<String> result = new Result<String>();
		
		logger.info("向手机号码为["+telephone+"]发送短信[START]...");
		if(StringUtils.isEmpty(telephone) || StringUtils.isEmpty(content)){
			result.setFalid("电话号码、短信内容不能为空!");
			return result;
		}
		
		String str = null;
		HttpClient httpClient = new DefaultHttpClient();
		String code = "";	
		String msg = "";	
		try {
				HttpPost httpPost = new HttpPost(url);
				List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>();

				nameValuePairs.add(new BasicNameValuePair("account", user));
				nameValuePairs.add(new BasicNameValuePair("password", pwd));
				nameValuePairs.add(new BasicNameValuePair("mobile", telephone));
				nameValuePairs.add(new BasicNameValuePair("content", content));

				httpPost.setEntity(new UrlEncodedFormEntity(nameValuePairs,
						"UTF-8"));
				HttpResponse httpResponse = httpClient.execute(httpPost);
				HttpEntity httpEntity = httpResponse.getEntity();
				str = EntityUtils.toString(httpEntity);
				EntityUtils.consume(httpEntity);

				Document document = DocumentHelper.parseText(str);
				Element root = document.getRootElement();

				code = root.elementText("code");
				msg = root.elementText("msg");
			

				if ("2".equals(code)) {
					result.setSuccess("发送成功!");
					logger.info("向手机号码为[" + telephone + "]发送短信成功![" + msg + "]");
				} else {
					result.setFalid(code, msg, "");
					logger.info("向手机号码为[" + telephone + "]发送短信失败![" + msg + "]");
				}
			
		} catch (Exception e) {
			result.setFalid(e.getMessage());
			logger.error("向手机号码为["+telephone+"]发送短信异常["+e.getMessage()+"]");
			e.printStackTrace();
		}finally {
			httpClient.getConnectionManager().shutdown();
			logger.info("向手机号码为["+telephone+"]发送短信[END]...");
		}
		return result;
	}

	
	/**
	 * 获取短信内容
	 * @param code
	 * @param args
	 * @return
	 */
	public String getMessage(String code,Object ...args){
		
//		String template = BparameterConfCache.getInstance().getKeyValue(code);
//		if(StringUtils.isNotEmpty(template) && null!=args){
//			return MessageFormat.format(template, args);
//		}
		return "";
	}
	
}
