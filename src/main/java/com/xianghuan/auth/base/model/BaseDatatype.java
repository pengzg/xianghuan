/*
 * Powered By [rapid-framework]
 * Web Site: http://www.rapid-framework.org.cn
 * Google Code: http://code.google.com/p/rapid-framework/
 * Since 2008 - 2014
 */

package com.xianghuan.auth.base.model;


/**
 * @author feizhang
 * @version 1.0
 * @since 1.0
 */


public class BaseDatatype implements java.io.Serializable{
	private static final long serialVersionUID = 5454155825314635342L;
	
	//columns START111
	//主键
	private String bdt_id;
	//编码
	private String bdt_code;
	//名称
	private String bdt_name;
	
	//排序
	private Integer bdt_order;
	//类型
	private String bdt_type;
	//机构
	private String bdt_org;
	//描述
	private String bdt_des;
	//状态
	private String bdt_status;
	//
	//private String def1;
	//
	//private String def2;
	//
	private Integer bdt_dr;
	//
	//private String bdt_ts;
	//
	//private Integer bdt_version;
	
	private String bdt_adduser;
	
	private String bdt_adddate;
	
	private String bdt_modifyuser;
	
	private String bdt_modifydate;
	
	private String bdt_deleteuser;
	
	private String bdt_deletedate;
	
	private String bdt_isgroup;
	//columns END

	public void setBdt_id(String value) {
		this.bdt_id = value;
	}
	
	public String getBdt_id() {
		return this.bdt_id;
	}
	public void setBdt_code(String value) {
		this.bdt_code = value;
	}
	
	public String getBdt_code() {
		return this.bdt_code;
	}
	public void setBdt_name(String value) {
		this.bdt_name = value;
	}
	
	public String getBdt_name() {
		return this.bdt_name;
	}
	public void setBdt_order(Integer value) {
		this.bdt_order = value;
	}
	
	public Integer getBdt_order() {
		return this.bdt_order;
	}
	public void setBdt_type(String value) {
		this.bdt_type = value;
	}
	
	public String getBdt_type() {
		return this.bdt_type;
	}
	public void setBdt_org(String value) {
		this.bdt_org = value;
	}
	
	public String getBdt_org() {
		return this.bdt_org;
	}
	public void setBdt_des(String value) {
		this.bdt_des = value;
	}
	
	public String getBdt_des() {
		return this.bdt_des;
	}
	public void setBdt_status(String value) {
		this.bdt_status = value;
	}
	
	public String getBdt_status() {
		return this.bdt_status;
	}
//	public void setDef1(String value) {
//		this.def1 = value;
//	}
//	
//	public String getDef1() {
//		return this.def1;
//	}
//	public void setDef2(String value) {
//		this.def2 = value;
//	}
	
//	public String getDef2() {
//		return this.def2;
//	}
	public void setBdt_dr(Integer value) {
		this.bdt_dr = value;
	}
	
	public Integer getBdt_dr() {
		return this.bdt_dr;
	}
//	public void setBdt_ts(String value) {
//		this.bdt_ts = value;
//	}
//	
//	public String getBdt_ts() {
//		return this.bdt_ts;
//	}
//	public void setBdt_version(Integer value) {
//		this.bdt_version = value;
//	}
//	
//	public Integer getBdt_version() {
//		return this.bdt_version;
//	}

	public String getBdt_adduser() {
		return bdt_adduser;
	}

	public void setBdt_adduser(String bdt_adduser) {
		this.bdt_adduser = bdt_adduser;
	}

	public String getBdt_adddate() {
		return bdt_adddate;
	}

	public void setBdt_adddate(String bdt_adddate) {
		this.bdt_adddate = bdt_adddate;
	}

	public String getBdt_modifyuser() {
		return bdt_modifyuser;
	}

	public void setBdt_modifyuser(String bdt_modifyuser) {
		this.bdt_modifyuser = bdt_modifyuser;
	}

	public String getBdt_modifydate() {
		return bdt_modifydate;
	}

	public void setBdt_modifydate(String bdt_modifydate) {
		this.bdt_modifydate = bdt_modifydate;
	}

	public String getBdt_deleteuser() {
		return bdt_deleteuser;
	}

	public void setBdt_deleteuser(String bdt_deleteuser) {
		this.bdt_deleteuser = bdt_deleteuser;
	}

	public String getBdt_deletedate() {
		return bdt_deletedate;
	}

	public void setBdt_deletedate(String bdt_deletedate) {
		this.bdt_deletedate = bdt_deletedate;
	}

	public String getBdt_isgroup() {
		return bdt_isgroup;
	}

	public void setBdt_isgroup(String bdt_isgroup) {
		this.bdt_isgroup = bdt_isgroup;
	}
}

