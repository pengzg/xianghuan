package com.xianghuan.auth.webservice.sso.server;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.jws.WebService;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.xianghuan.util.SystemConstants;
import org.xianghuan.web.model.Tree;

import com.xianghuan.auth.system.model.SysMenu;
import com.xianghuan.auth.system.model.SysOrg;
import com.xianghuan.auth.system.model.SysUser;
import com.xianghuan.auth.system.service.ISysMenuService;
import com.xianghuan.auth.system.service.ISysUserOrgService;
import com.xianghuan.auth.system.service.ISysUserService;
import com.xianghuan.auth.system.util.GetAllTrees;
import com.xianghuan.auth.webservice.sso.common.SSOReturnCode;
import com.xianghuan.auth.webservice.sso.common.bean.SSOUserInfo;
import com.xianghuan.auth.webservice.sso.util.SSODeserializatorUtil;

@WebService(endpointInterface = "com.xianghuan.auth.webservice.sso.server.SSOLoginService",targetNamespace="http://server.updatepw.webservice.auth.kl.com/")
public class SSOLoginServiceImpl implements SSOLoginService{
	
	@Autowired
	private ISysUserService sysUserService;
	
	@Autowired
	private ISysMenuService sysMenuService;
	
	@Autowired
	private ISysUserOrgService sysUserOrgService;
	
	@Override
	public String login(String ssoUserInfo) {
		SSOUserInfo userInfo = checkLoginInfo(ssoUserInfo);
		try{
			if(SSOSeverConstants.CHECKUSERINFO_FAIL == userInfo.getStatusCode()) {//验证失败
				userInfo.setStatusCode(SSOReturnCode.LOGIN_FAIL_MISS_PARAMETER.getCode());
			}else if(SSOSeverConstants.CHECKUSERINFO_SUCCEED == userInfo.getStatusCode()){//验证成功进行登陆
				Map<String,Object> map = new HashMap<String, Object>();
				map.put("loginname", userInfo.getLoginName());
				map.put("loginPwd", userInfo.getPassWord());
				SysUser su = sysUserService.login(map);
				String ss_code = userInfo.getSs_code();
				if(su == null) {
					userInfo.setStatusCode(SSOSeverConstants.LOGIN_FAIL);
					userInfo.setMsg("用户名或密码错误！");
				}else {
//					if (SystemConstantsExt.Y.equals(su.getSu_isBinding())) {// 查看是否IP绑定
//						if (org.apache.commons.lang3.StringUtils
//								.isNotBlank(userInfo.getIp()))
//							if (!checkIPIsBinding(su.getSu_ip(),
//									userInfo.getIp())) {
//								userInfo.setStatusCode(SSOSeverConstants.LOGIN_FAIL);
//								userInfo.setMsg("您登陆的IP：" + userInfo.getIp()
//										+ "不合法");
//								return SSODeserializatorUtil
//										.ObjToStringOfSecurity(userInfo);
//							}
//					}
					userInfo.setLoginName(su.getSu_loginname());
					userInfo.setUserName(su.getSu_name());
					userInfo.setStatusCode(SSOSeverConstants.LOGIN_SUCCEED);
					userInfo.setTree(getMenuList(su.getSu_id(),ss_code));//获取菜单 
					userInfo.setOrgsList(getOrgPrivValue(su));//获取机构信息
					userInfo.setMenusList(getMenuPrivValue(su,ss_code));//获取可以访问的资料
					userInfo.setId(su.getSu_id());
//					userInfo.setOrgid(su.getSu_so_orgId());
//					userInfo.setOrgname(su.getSo_orgname());
//					userInfo.setUsertype(su.getSu_usertype());
//					userInfo.setLoginOrgid(su.getSu_so_orgId());
					
					userInfo.setUsertype(su.getSu_usertype());//用户类型（0超级管理员；1）
//					userInfo.setBelongtype(su.getSu_belongtype());//1.运营商；2代理；3商户；4推广人；5终端用户
//					userInfo.setBelongpk(su.getSu_belongpk());////归属PK    sys_user_untiy PK
				}
			}
		}catch(Exception e) {
			userInfo.setStatusCode(SSOSeverConstants.LOGIN_FAIL);
			userInfo.setMsg(e.getMessage());
		}
		return SSODeserializatorUtil.ObjToStringOfSecurity(userInfo);
	}

	@Override
	public SSOUserInfo checkLoginInfo(String ssoUserInfo) {
		if(StringUtils.isBlank(ssoUserInfo)) {
			SSOUserInfo si =  new SSOUserInfo();
			si.setStatusCode(SSOSeverConstants.CHECKUSERINFO_FAIL);
			return si;
		}
		SSOUserInfo si = SSODeserializatorUtil.StringToUserOfSecurity(ssoUserInfo);
		if(si == null || StringUtils.isBlank(si.getLoginName()) || StringUtils.isBlank(si.getPassWord())||StringUtils.isBlank(si.getSs_code())) {
			si = new SSOUserInfo();
			si.setStatusCode(SSOSeverConstants.CHECKUSERINFO_FAIL);
			return si;
		}
		si.setStatusCode(SSOSeverConstants.CHECKUSERINFO_SUCCEED);//检查所有的参数都合法
		return si;
	}
	
	private List<String> getOrgPrivValue(SysUser user) {
		// 取可以访问的菜单信息
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("suo_userid", user.getSu_id());
		List<SysOrg> list = sysUserOrgService.select(map);
		List<String> orgsList = new ArrayList();
		for(SysOrg t:list){
			orgsList.add(t.getSo_orgid());
		}
		orgsList.add(user.getSu_orgid());
		return orgsList;
	}
	
	private List<String> getMenuPrivValue(SysUser user,String ss_code) {
		// 取可以访问的菜单信息
		Map<String, Object> queryParams = new HashMap<String, Object>();
		queryParams.put("sur_userid", user.getSu_id());
		queryParams.put("ss_code", ss_code);
		List<SysMenu> list = sysMenuService.select(queryParams);
		List<String> menusList = new ArrayList();
		for(SysMenu t:list){
			menusList.add(t.getSm_url());
		}
		return menusList;
	}
	
	private List<Tree> getMenuList(String su_id,String ss_code) {
		Map<String, Object> queryParams = new HashMap<String, Object>();
		queryParams.put("sm_typeid", "1");
		queryParams.put("sur_userid", su_id);
		queryParams.put("sm_status", SystemConstants.STATUS_ON);
		queryParams.put("ss_code", ss_code);
		queryParams.put(SystemConstants.sort_str, " t.sm_seq  ");
		queryParams.put(SystemConstants.order_str, " asc ");
		
		List<SysMenu> list = sysMenuService.select(queryParams);
		List<Tree> tree = new GetAllTrees().getMenuTree(list);
		return tree;
	}
	/**
	 * 
	 * @param ipString    绑定的IP
	 * @param visiterip   用户的访问IP 
	 * @return
	 */
	private Boolean  checkIPIsBinding(String ipString ,String visiterip) {
		boolean flag = false;
			String[] ips = ipString.split(",");
			for(String ip : ips) {
				if(StringUtils.isNotBlank(ip)) {
					if(ip.trim().equals(visiterip.trim())) {
						flag = true;
					}
					if(ip.indexOf("*")>-1) {
						if(visiterip.startsWith(ip.substring(0, ip.length()-1))) {
							flag = true;
						}
					}
				}
			}
		return flag;
	}
	public static void main(String[] args) {
		String a = "aaa";
		System.out.println(a.startsWith("b"));
		System.out.println(a.substring(0, a.length()-1));
		System.out.println(a.indexOf("*"));
	}
}
