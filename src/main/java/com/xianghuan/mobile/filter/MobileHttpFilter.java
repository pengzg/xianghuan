package com.xianghuan.mobile.filter;

import java.io.IOException;
import java.io.OutputStream;
import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.xianghuan.util.DateUtil;
import org.xianghuan.util.MD5Util;
import org.xianghuan.util.SystemUtil;

import com.xianghuan.admin.user.service.IUserBaseService;
import com.xianghuan.auth.base.cache.BaseDataDetailValueCache;
import com.xianghuan.auth.system.model.UserOperationBehavior;
import com.xianghuan.auth.system.service.IUserOperationBehaviorService;
import com.xianghuan.util.RepBaseBean;

/**
 * APP端 请求 Filter
 * 目的：1、验证请求签名
 * 	   2、验证用户是否登陆
 *     3、记录访问日志
 * @author panyf
 *
 */
public class MobileHttpFilter implements Filter {
	
	private static Logger log = Logger.getLogger(MobileHttpFilter.class);
	
	private IUserOperationBehaviorService userOperationBehaviorService;
	
	private IUserBaseService userBaseService;
	
	/**
	 * 异常返回值
	 */
	private static String errorRetStr = "\"repCode\":\"{0}\",\"repMsg\":\"{1}\"";
	
	/**
	 * 请求码数组
	 */
	private static final String[] REQ_CODE={
		"0000","0101","0100","0102","0103","0104","0105","0106","0107","0108","0109","0110",
		"0111","0112","0113","0114","0115","0116","0117","0118","0119","0120","0121","0122","0123","0124","0125","0128","0129","0130",
		"0200","0201","0202","0203","0204","0205","0206","0207","0208","0209","0210","0211","0212","0213",
		"0300","0301","0302","0303","0304","0305","0306","0307","0308","0309",
		"0400","0401","0402","0403","0404","0405","0406","0407","0408","0409","0410","0411","0412","0413",
		"0414","0415","0416","0417","0420","0418","0421","0422",
		"0500","0501","0502","0503","0504","0505","0506",
		"0600","0601",
		"0700","0701",
		"0800","0801","0802","0803","0804","0805","0806","0807","0808","0810","0811","0812","0813","0814","0817","0818",
		"0900","0902","0903","0904","0905","0906","0907","0908","0909","0910","0911","0912",
		"1000","1001","1002","1003","1006","1007","1008","1009","1010","1011","1012","1013","1014","1015","1016","1017","1018","1019","1020","1021","1022",
		"1100","1101","1102","1103","1104","1105","1106","1107","1108",
		"1200","1201","1202",
		"1300","1301","1302",
		"1312","1310","1314"
		};
	
	private String REQ_CODE_STR = "";
	
	/**
	 * 不进行校验 登录的 请求CODE
	 */
	private static final String[] NON_CHECK_LOGIN_REQCODE= {
		"0000","0101","0100","0102","0103","0105","0106","0107","0108","0125","0110",
		"0200","0201","0202","0203","0204","0205","0208","0209","0210","0212","0213","0307",
		"0416",
		"0500","0501","0502","0503","0504","0505","0506",
		"0600","0601",
		"0800","0801","0803","0804","0805","0806","0807","0808","0810","0811","0812","0813","0814","0817","0818",
		"0900","0902","0903","0904","0905","0906","0907","0908","0909","0910","0911","0912",
		"1000","1001","1002","1003","1006","1007","1008","1009","1010","1011","1012","1013","1014","1015","1016","1017","1018","1019","1020","1021","1022",
		"1100","1101",
		"1200","1201","1202"
	}; 
	private String NONO_CHECK_LOGIN_REQ_CODE_STR="";
	
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(filterConfig.getServletContext());
		userOperationBehaviorService = (IUserOperationBehaviorService) ctx.getBean("userOperationBehaviorService");
		userBaseService = (IUserBaseService) ctx.getBean("userBaseService");
		
		REQ_CODE_STR = handlerCode(REQ_CODE);
		NONO_CHECK_LOGIN_REQ_CODE_STR = handlerCode(NON_CHECK_LOGIN_REQCODE);
		
		log.info("APP过滤拦截器启动...");
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		//设置请求的编码方式
		request.setCharacterEncoding("UTF-8");
		try {
			HttpServletRequest httpServletRequest = (HttpServletRequest)request;
			
			Map<String, String> paramMap = servletParameterMapToMap(httpServletRequest.getParameterMap());
			String uri = httpServletRequest.getRequestURI();
			if(log.isDebugEnabled()){
				log.debug("请求地址 ： " + uri + "，请求方式：" + httpServletRequest.getMethod() + "，请求的参数列表 ： " + paramMap);
			}
			
			String reqCode = request.getParameter("reqCode");
			String device = request.getParameter("device"); 
			String deviceType = request.getParameter("deviceType"); 
			String user = request.getParameter("user");
			
			//判断请求是否包含 支付通知
			if(!uri.toUpperCase().contains("PAYNOTIFY")
					&&!uri.toUpperCase().contains("IMGFILE")
					&&!uri.toUpperCase().contains("PUBLISH")
					&&!uri.toUpperCase().contains("UPLOADIMAGE")
					&&!uri.toUpperCase().contains("MANAGEMENT")
					&&!uri.toUpperCase().contains("REFUNDALIPAY")
					&&!uri.toUpperCase().contains("WXPAYREFUND")
					&&!uri.toUpperCase().contains("COMMONSHARE")){
				//验证请求参数中是否有请求码、设备ID、设备类型
				if(StringUtils.isBlank(reqCode) || StringUtils.isBlank(device) || StringUtils.isBlank(deviceType)){
					doReturn(RepBaseBean.REQPCODE_PARAM, "缺少参数,系统拒绝处理!", response);
					log.error("缺少参数,系统拒绝处理![请检查reqCode、device、deviceType]");
					return;
				}
				//1.验证请求码
				/*if(!REQ_CODE_STR.contains("&"+reqCode+"&")){
					doReturn(RepBaseBean.REQPCODE_CODE, "错误的请求码!", response);
					log.error("错误的请求码!");
					return;
				}*/
				//2.验证签名
				//checkSign(request, response,httpServletRequest);
				//3.验证用户是否登陆
//				if(!checkUserIsLogin(user,httpServletRequest.getRequestURI(), reqCode, response)){
//					doReturn(RepBaseBean.REQPCODE_LOGIN, "用户未登录", response);
//					log.error("用户["+user+"]未登录!");
//					return;
//				}
			}
			//4.记录访问日志
			insertOperationBehaviod(request, httpServletRequest, paramMap, uri,reqCode, device, deviceType, user);
			
			chain.doFilter(request, response);
		} catch (Exception e) {
			log.error("APP过滤拦截器拦截到异常["+e.getMessage()+"]",e);
			return;
		}
		
	}

	/**
	 * 记录 接口 访问日志
	 * @param request
	 * @param httpServletRequest
	 * @param paramMap
	 * @param uri
	 * @param reqCode
	 * @param device
	 * @param deviceType
	 * @param user
	 */
	private void insertOperationBehaviod(ServletRequest request,
			HttpServletRequest httpServletRequest,
			Map<String, String> paramMap, String uri, String reqCode,
			String device, String deviceType, String user) {
		UserOperationBehavior uob = new UserOperationBehavior();
		uob.setUob_add_time(DateUtil.getCurrentDateToString2());
		if(StringUtils.isNotBlank(request.getParameter("community"))){
			uob.setUob_community_id(Integer.valueOf(request.getParameter("community")));
		}
		uob.setUob_req_code(request.getParameter("reqCode"));
		uob.setUob_req_name(BaseDataDetailValueCache.getInstance().getName("1062", reqCode));
		uob.setUob_req_param(paramMap.toString());
		uob.setUob_req_url(uri);
		if(StringUtils.isNotBlank(request.getParameter("shop"))){
			uob.setUob_shop_id(Integer.valueOf(request.getParameter("shop")));
		}
		uob.setUob_source("2"); //APP
		uob.setUob_status("1"); //有效
		if(StringUtils.isNotBlank(user)){
			uob.setUob_user_id(Integer.valueOf(user));
		}
		uob.setUob_device(device);
		uob.setUob_device_type(deviceType);
		uob.setUob_req_ip(SystemUtil.getIpAddress(httpServletRequest));
		userOperationBehaviorService.insert(uob);
	}

	/**
	 * 校验用户是否登录
	 * @param 
	 * @param reqCode
	 */
	private Boolean checkUserIsLogin(String user,String method,String reqCode,ServletResponse response) {
		//
		if(method.contains("_nologin")){
			return true;
		}
	
		return true;
	}

	@Override
	public void destroy() {
	}

	/**
	 * 验签
	 * @param device
	 * @param userId
	 */
	private void checkSign(ServletRequest request,ServletResponse response,HttpServletRequest httpServletRequest){
				
		//获取所有的请求参数
		Enumeration<String> parameters = httpServletRequest.getParameterNames();
		ArrayList<String> parameterLt = new ArrayList<String>();
		while(parameters.hasMoreElements()){
			parameterLt.add(parameters.nextElement());
		}
		//1.验证 签名
		Collections.sort(parameterLt);
		//拼接签名源串
		StringBuffer signSrcBuffer = new StringBuffer();
		for(String parameterName : parameterLt){
			//忽略签名描述字段
			if(parameterName.equalsIgnoreCase("sign")){
				continue;
			}
			
			signSrcBuffer.append(StringUtils.trimToEmpty(request.getParameter(parameterName)));	
		}
		
		String signStr = StringUtils.trimToEmpty(request.getParameter("sign"));
		
		String localSignStr = StringUtils.trimToEmpty(MD5Util.md5(signSrcBuffer.toString(),"UTF-8"));
		
		log.debug("localSignStr = " + localSignStr + ", signStr = " + signStr);
		
		if("".equals(signStr) || !signStr.equalsIgnoreCase(localSignStr)){
			doReturn(RepBaseBean.REQPCODE_SIGN, "签名验证失败", response);
			log.error("签名验证失败!");
			return;
		}
	}
	
	/**
	 * 执行返回结果
	 * 
	 * @param retCode
	 * @param retMessage
	 * @param orgNum
	 * @param response
	 */
	private void doReturn(String retCode, String retMessage, ServletResponse response){
		String retStr = "{" + MessageFormat.format(errorRetStr, retCode, retMessage) + "}";
		try {
			OutputStream out = response.getOutputStream();
			response.setContentType("text/html;charset=UTF-8");
			out.write(retStr.getBytes("UTF-8"));
			out.flush();
			out.close();
		} catch (Exception e) {
			log.error("执行返回方法发生异常", e);
		}
	}
	
	@SuppressWarnings("rawtypes")
	public synchronized Map<String, String> servletParameterMapToMap(Map paramMap){
		Map<String, String> map = new HashMap<String, String>();
		if(paramMap!=null){
			Iterator<?> entrys = paramMap.entrySet().iterator();
			Map.Entry entry;
			String key = null;
			String value = null;
			while(entrys.hasNext()){
				entry = (Map.Entry)entrys.next();
				
				key = (String)entry.getKey();
				Object valueObj = entry.getValue();
				if(valueObj == null){
					value = "";
				}else if(valueObj instanceof String[]){
					String values[] = (String[])valueObj;
					for(String tval:values){
						value = tval + ",";
					}
					value = value.substring(0,value.length()-1);
				}else{
					value = valueObj.toString();
				}
				map.put(key, value);
			}
		}
		return map;
	}
	
	private String handlerCode(String[] codes){
		StringBuilder sb = new StringBuilder();
		for (String code:codes) {
			sb.append("&").append(code).append("&");
		}
		return sb.toString();
	}
	
	public void setUserOperationBehaviorService(
			IUserOperationBehaviorService userOperationBehaviorService) {
		this.userOperationBehaviorService = userOperationBehaviorService;
	}

	public static void main(String[] args) {
		
		Map<String, Object> map = new HashMap<>();
		map.put("code", "1231231");
		
//		System.out.println(servletParameterMapToMap(map).toString());
	}
}

