package com.xianghuan.auth.system.interceptors;


import java.lang.reflect.Method;

import org.aopalliance.intercept.MethodInterceptor;
import org.aopalliance.intercept.MethodInvocation;
import org.springframework.beans.factory.annotation.Autowired;
import org.xianghuan.util.DateUtil;
import org.xianghuan.util.SystemConstants;
import org.xianghuan.web.model.SessionInfo;
import org.xianghuan.web.util.UserSessionUtil;

import com.xianghuan.auth.system.model.SysActionLog;
import com.xianghuan.auth.system.service.ISysActionLogService;

public class SysActionLogInterceptor implements MethodInterceptor {

	@Autowired
	private ISysActionLogService sysActionLogService;

	@Override
	public Object invoke(MethodInvocation invocation) throws Throwable {
		SysActionLog sal = new SysActionLog();
		Object returnObject = null;
		SessionInfo session = null;
		try {
			session = UserSessionUtil.getSession();
			if (session != null) {
				Method m = invocation.getMethod();
				sal.setSal_creatid(session.getId());
				sal.setSal_createname(session.getName());
				sal.setSal_actionname(m.toString());// 事件名称
				sal.setSal_actiontype(m.getName());// 事件类型
				sal.setSal_ownerid(session.getLogincode());// 所属人编号
				sal.setSal_ip(session.getIp());// 机器IP
				sal.setSal_plattype(SystemConstants.SYS_USER);// 日志平台类型
				sal.setSal_ts(DateUtil.getCurrentDateToString2());
				sal.setSal_dr(SystemConstants.SAVE);
				sal.setSal_type(getLogType(m.toString()));
				returnObject = invocation.proceed();
				sal.setSal_desc("成功");// 日志描述
			}
		} catch (Exception e) {
			sal.setSal_desc("失败");// 日志描述
		} finally {
			if(session != null) {
				if(isExcludeMethod(sal.getSal_actiontype())){
					sysActionLogService.insert(sal);
				}
			}
			if(returnObject == null) {
				returnObject = invocation.proceed();
			}
		}
		return returnObject;
	}
	private int getLogType(String methodInfo) {
		methodInfo = methodInfo.substring(0,methodInfo.indexOf("("));
		if(methodInfo.contains("controller")) {
			return SystemConstants.LOG_TYPE_CONTROLLER;
		}else {
			return SystemConstants.LOG_TYPE_SERVICE;
		}
	}
	
	private boolean isExcludeMethod(String methodName){
		String [] excludeMethod={"dataGrid","query","listPage","doGetMainMenu","detailItem","initBinder"};
		boolean flag = true;
		for(String str:excludeMethod){
			if(methodName.contains(str)){
				flag = false;
				break;
			}
		}
		return flag;
	}
}
