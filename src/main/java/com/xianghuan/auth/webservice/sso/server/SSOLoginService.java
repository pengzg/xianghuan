package com.xianghuan.auth.webservice.sso.server;

import javax.jws.WebService;

import com.xianghuan.auth.webservice.sso.common.bean.SSOUserInfo;

@WebService
public interface SSOLoginService {
	
	/**
	 * 登陆
	 */
	public String login(String ssoUserInfo);
	
	/**
	 * 检验登陆信息
	 */
	SSOUserInfo checkLoginInfo(String ssoUserInfo); 
}
