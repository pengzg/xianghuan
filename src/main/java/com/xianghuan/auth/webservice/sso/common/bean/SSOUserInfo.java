package com.xianghuan.auth.webservice.sso.common.bean;

import java.util.List;

import org.xianghuan.web.model.Tree;

public class SSOUserInfo {
	private String issuccess;//登陆是否成功
	private String loginName;
	private String passWord;
	private String userName;
	private String token;
	/*
	 * @see SSOSeverConstants
	 */
	private Integer statusCode;
	
	private String id;
	private String ip;
	private String orgid;
	private String orgname;
	private String usertype;
	private String loginOrgid;
	 
	private List<Tree> tree; 
	private List<String> menusList;//用户可以访问的资源地址列表
	private List<String> orgsList;//可以访问机构列表
	private String belongtype;//1.运营商；2代理；3商户；4推广人；5终端用户
	private String belongpk;//归属PK    sys_user_untiy PK
	private String ss_code;//系统类型编号
	private String msg;//返回信息
	
	public String getLoginName() {
		return loginName;
	}
	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
	public String getPassWord() {
		return passWord;
	}
	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}
	public String getToken() {
		return token;
	}
	public void setToken(String token) {
		this.token = token;
	}
	public Integer getStatusCode() {
		return statusCode;
	}
	public void setStatusCode(Integer statusCode) {
		this.statusCode = statusCode;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public List<Tree> getTree() {
		return tree;
	}
	public void setTree(List<Tree> tree) {
		this.tree = tree;
	}
	public List<String> getMenusList() {
		return menusList;
	}
	public void setMenusList(List<String> menusList) {
		this.menusList = menusList;
	}
	public List<String> getOrgsList() {
		return orgsList;
	}
	public void setOrgsList(List<String> orgsList) {
		this.orgsList = orgsList;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getOrgid() {
		return orgid;
	}
	public void setOrgid(String orgid) {
		this.orgid = orgid;
	}
	public String getOrgname() {
		return orgname;
	}
	public void setOrgname(String orgname) {
		this.orgname = orgname;
	}
	public String getUsertype() {
		return usertype;
	}
	public void setUsertype(String usertype) {
		this.usertype = usertype;
	}
	public String getLoginOrgid() {
		return loginOrgid;
	}
	public void setLoginOrgid(String loginOrgid) {
		this.loginOrgid = loginOrgid;
	}
	public String getBelongtype() {
		return belongtype;
	}
	public void setBelongtype(String belongtype) {
		this.belongtype = belongtype;
	}
	public String getBelongpk() {
		return belongpk;
	}
	public void setBelongpk(String belongpk) {
		this.belongpk = belongpk;
	}
	public String getSs_code() {
		return ss_code;
	}
	public void setSs_code(String ss_code) {
		this.ss_code = ss_code;
	}
	
	public String getIssuccess() {
		return issuccess;
	}
	public void setIssuccess(String issuccess) {
		this.issuccess = issuccess;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
}
