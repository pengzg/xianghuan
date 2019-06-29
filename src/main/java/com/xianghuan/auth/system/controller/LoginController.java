/*
 * Powered By [rapid-framework]
 * Web Site: http://www.rapid-framework.org.cn
 * Google Code: http://code.google.com/p/rapid-framework/
 * Since 2008 - 2014
 */


package com.xianghuan.auth.system.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.xianghuan.jdbc.exception.BusinessException;
import org.xianghuan.web.controller.BaseController;
import org.xianghuan.web.model.DataGrid;
import org.xianghuan.web.model.Json;
import org.xianghuan.web.model.Pager;
import org.xianghuan.web.model.Query;
import org.xianghuan.web.model.SessionInfo;
import org.xianghuan.web.util.UserSessionUtil;

import com.xianghuan.auth.system.model.SysMenu;
import com.xianghuan.auth.system.model.SysOrg;
import com.xianghuan.auth.system.model.SysUser;
import com.xianghuan.auth.system.service.ISysMenuService;
import com.xianghuan.auth.system.service.ISysUserOrgService;
import com.xianghuan.auth.system.service.ISysUserService;

/**
 * @author feizhang
 * @version 1.0
 * @since 1.0
 */
@Controller
@RequestMapping("/system/loginController")
public class LoginController extends BaseController{

	private static final Logger logger = Logger.getLogger(LoginController.class);

	@Autowired
	private ISysUserService sysUserService;
	
	@Autowired
	private ISysMenuService sysMenuService;
	
	@Autowired
	private ISysUserOrgService sysUserOrgService;
	

	public LoginController() {
		super.folder = "";
	}
	
	
	//跳转到列表页面
	@RequestMapping("/login")
	public String login() {
		return redirectJsp("login");
	}
	

	/**
	 * 获取数据表格
	 * 
	 * @param user
	 * @return
	 */
	@RequestMapping("/dataGrid")
	@ResponseBody
	public DataGrid dataGrid(HttpServletRequest request, Pager pager) {
		Query query = new Query();
		query.setPager(pager);
		query.setQueryParams((Map<String, Object>) getQueryCondition(request));
		return sysUserService.dataGrid(query);
	}
	
	
	

	
	/**
	 * 登录
	 */
	/**
	 * 用户登录
	 * 
	 * @param user
	 *            用户对象
	 * @param session
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/doLogin")
	public Json doLogin(HttpServletRequest request,
			HttpServletResponse response, SysUser data) {

		Json json = new Json();
		String userType = request.getParameter("userType");
		String userName = request.getParameter("userName");
		String loginPwd = request.getParameter("loginPwd");
		String role = request.getParameter("role");
		String yzm = request.getParameter("yzm");
		String token = request.getParameter("token");
		String loginname = request.getParameter("loginname");
		String validatecode = request.getParameter("validatecode");
		try {
			//验证码验证
	/*		String sessionvalidatecode = (String) UserSessionUtil.getSession(SystemConstantsExt.SESSION_VALIDATECODE);
			if(!(StringUtils.isNotBlank(sessionvalidatecode) && StringUtils.isNotBlank(validatecode) && validatecode.equalsIgnoreCase(sessionvalidatecode))) {
				json.setMsg("请输入正确的验证码!");
				return json;
			}*/
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("loginname", loginname);
			map.put("loginPwd", loginPwd);
			map.put("userType", userType);
			SysUser user = sysUserService.login(map);
			if (user != null) {
				SessionInfo sessionInfo = new SessionInfo();
				sessionInfo.setId(user.getSu_id());
				sessionInfo.setLogincode(user.getSu_loginname());
				sessionInfo.setName(user.getSu_name());
				sessionInfo.setOrgid(user.getSu_orgid());
				sessionInfo.setOrgname(user.getSu_orgid_nameref());
				sessionInfo.setLoginorgid(user.getSu_orgid());
				sessionInfo.setRole(user.getSu_role());
//				sessionInfo.setLoginusertype(userType);
				sessionInfo.setUsertype(user.getSu_usertype());
//				sessionInfo.setUserid(user.getSu_userid());
//				sessionInfo.setUsername(user.getSu_userid_nameref());
				sessionInfo.setUserTel(user.getSu_phone());
				
				sessionInfo.setShopId(Integer.valueOf(user.getSu_orgid()));
				sessionInfo.setShopName(sessionInfo.getOrgname());
				
				//取登陆人所在小区信息
				if (StringUtils.isNotBlank(user.getSu_communityid())) {
					sessionInfo.setOrgname(user.getSu_userid_nameref() + "|"
							+ user.getSu_communityid_nameref());
				}
				
				
				
				//取可以访问的菜单信息
				setMenuPrivValue(sessionInfo,user);
				//取可以访问的机构数据信息
				setOrgPrivValue(sessionInfo,user);
				UserSessionUtil.setSession(request, sessionInfo);
				json.setSuccess(true);
				json.setMsg("登录成功!");
			} else {
				json.setMsg("用户名或密码错误！");
			}
		}catch(BusinessException e){
			json.setMsg(e.getMessage());
			json.setSuccess(false);
			logger.error(e.getMessage(), e);
		}
		return json;
	}

	private void setOrgPrivValue(SessionInfo sessionInfo,SysUser user) {
		// 取可以访问的菜单信息
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("suo_userid", user.getSu_id());
		List<SysOrg> list = sysUserOrgService.select(map);
		List<String> orgsList = new ArrayList();
		for(SysOrg t:list){
			orgsList.add(t.getSo_orgid());
		}
		if(!"0".equals(user.getSu_orgid())){
			orgsList.add(user.getSu_orgid());
		}else{
			sessionInfo.setOrgid("");
		}
		if(orgsList.size()>0) {
			sessionInfo.setOrgsList(orgsList);
		}
	}
	
	private void setMenuPrivValue(SessionInfo sessionInfo,SysUser user) {
		// 取可以访问的菜单信息
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sur_userid", user.getSu_id());
		List<SysMenu> list = sysMenuService.select(map);
		List<String> menusList = new ArrayList();
		for(SysMenu t:list){
			menusList.add(t.getSm_url());
		}
		sessionInfo.setMenusList(menusList);
	}

	/**
	 * 注销系统
	 */
	@ResponseBody
	@RequestMapping("/logout")
	public void logout(HttpServletRequest request, HttpServletResponse response) {
		if (request.getSession() != null) {
			request.getSession().invalidate();
		}
		Json j = new Json();
		j.setSuccess(true);
		writeJson(response, j);
	}
	
	
	
	/**
	 * 用户登录页面的自动补全
	 */
	@ResponseBody
	@RequestMapping("/doNotNeedSessionAndSecurity_login")
	public void doNotNeedSessionAndSecurity_login(
			HttpServletRequest request, HttpServletResponse response) {
//		 HqlFilter hqlFilter = new HqlFilter();
//		 hqlFilter.addFilter("usertype", "!=", "0");
//		 //hqlFilter.addFilter("QUERY_t#loginname_S_LK", "%%" +
//		 StringUtils.defaultString(q) + "%%");
//		 hqlFilter.addSort("t.loginname");
//		 hqlFilter.addOrder("asc");
//		 hqlFilter.addDr();
//		writeJsonByIncludesProperties(response,
//				sysUserService.findByFilter(hqlFilter, 1, 10),
//				new String[] { "loginname" });
	}
	
	
	/**
	 * 用户登录页面的自动补全
	 */
	@ResponseBody
	@RequestMapping("/doNotNeedSessionAndSecurity_loginNameComboBox")
	public void doNotNeedSessionAndSecurity_loginNameComboBox(
			HttpServletRequest request, HttpServletResponse response) {
		// HqlFilter hqlFilter = new HqlFilter();
		// hqlFilter.addFilter("usertype", "!=", "0");
		// //hqlFilter.addFilter("QUERY_t#loginname_S_LK", "%%" +
		// StringUtils.defaultString(q) + "%%");
		// hqlFilter.addSort("t.loginname");
		// hqlFilter.addOrder("asc");
		// hqlFilter.addDr();
//		writeJsonByIncludesProperties(response,
//				sysUserService.findByFilter(hqlFilter, 1, 10),
//				new String[] { "loginname" });
	}
	
	

	/**
	 * 用户登录页面的grid自动补全
	 */
	@ResponseBody
	@RequestMapping("/doNotNeedSessionAndSecurity_loginNameComboGrid")
	public DataGrid doNotNeedSessionAndSecurity_loginNameComboGrid(
			HttpServletRequest request, HttpServletResponse response,  Pager pager) {
		Query query = new Query();
		query.setPager(pager);
		query.setQueryParams((Map<String, Object>) getQueryCondition(request));
		return sysUserService.dataGrid(query);
	}

	@Override
	public Map<?, ?> getQueryCondition(HttpServletRequest request) {
		// TODO Auto-generated method stub
		return null;
	}
	

}