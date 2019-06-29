package org.xianghuan.web.util;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.xianghuan.web.model.SessionInfo;

public class UserSessionUtil {

	public static SessionInfo getSession(HttpServletRequest request){
		if(request==null){
			return null;
		}
		return (SessionInfo) request.getSession().getAttribute("RM_LOGIN_USER");
	}
	
	public static void setSession(HttpServletRequest request,SessionInfo si){
		if(request!=null)
			 request.getSession().setAttribute("RM_LOGIN_USER",si);
	}
	
	public static SessionInfo getSession(){
		RequestAttributes ra = RequestContextHolder.getRequestAttributes();
		if(null==ra){
			return null;
		}
		HttpServletRequest request = ((ServletRequestAttributes)ra).getRequest();
		if(null==request){
			return null;
		}
		return getSession(request);
	}
	
	public static Object getSession(String attr){
		RequestAttributes ra = RequestContextHolder.getRequestAttributes();
		HttpServletRequest request = ((ServletRequestAttributes)ra).getRequest();
		if(null==request){
			return null;
		}
		return request.getSession().getAttribute(attr);
	}
}
