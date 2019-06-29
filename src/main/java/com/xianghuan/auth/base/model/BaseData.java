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


public class BaseData implements java.io.Serializable{
	private static final long serialVersionUID = 5454155825314635342L;
	
	//columns START111
	//主键
	private String bd_id;
	//编码
	private String bd_code;
	//名称
	private String bd_name;
	//排序
	private Integer bd_order;
	//父节点PID
	private String bd_pid;
	//字典类型
	private String bd_datatypeid;
	//机构
	private String bd_org;
	//描述
	private String bd_des;
	//状态
	private String bd_status;
	//
	//private String def1;
	//
	//private String def2;
	//
	private Integer bd_dr;
	//
	private String bd_ts;
	
	private Integer bd_version;
	
	private String bdt_code;
	
	private String bd_adduser;
	
	private String bd_adddate;
	
	private String bd_modifyuser;
	
	private String bd_modifydate;
	
	private String bd_deleteuser;
	
	private String bd_deletedate;
	
	
	
	//columns END

	public void setBd_id(String value) {
		this.bd_id = value;
	}
	
	public String getBd_id() {
		return this.bd_id;
	}
	public void setBd_code(String value) {
		this.bd_code = value;
	}
	
	public String getBd_code() {
		return this.bd_code;
	}
	public void setBd_name(String value) {
		this.bd_name = value;
	}
	
	public String getBd_name() {
		return this.bd_name;
	}
	public void setBd_order(Integer value) {
		this.bd_order = value;
	}
	
	public Integer getBd_order() {
		return this.bd_order;
	}
	public void setBd_pid(String value) {
		this.bd_pid = value;
	}
	
	public String getBd_pid() {
		return this.bd_pid;
	}
	public void setBd_datatypeid(String value) {
		this.bd_datatypeid = value;
	}
	
	public String getBd_datatypeid() {
		return this.bd_datatypeid;
	}
	public void setBd_org(String value) {
		this.bd_org = value;
	}
	
	public String getBd_org() {
		return this.bd_org;
	}
	public void setBd_des(String value) {
		this.bd_des = value;
	}
	
	public String getBd_des() {
		return this.bd_des;
	}
	public void setBd_status(String value) {
		this.bd_status = value;
	}
	
//	public String getBd_status() {
//		return this.bd_status;
//	}
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
//	
//	public String getDef2() {
//		return this.def2;
//	}
	public void setBd_dr(Integer value) {
		this.bd_dr = value;
	}
	
	public Integer getBd_dr() {
		return this.bd_dr;
	}
	public void setBd_ts(String value) {
		this.bd_ts = value;
	}
	
	public String getBd_ts() {
		return this.bd_ts;
	}
	public void setBd_version(Integer value) {
		this.bd_version = value;
	}
	
	public Integer getBd_version() {
		return this.bd_version;
	}

	public String getBdt_code() {
		return bdt_code;
	}

	public void setBdt_code(String bdt_code) {
		this.bdt_code = bdt_code;
	}

	public String getBd_adduser() {
		return bd_adduser;
	}

	public void setBd_adduser(String bd_adduser) {
		this.bd_adduser = bd_adduser;
	}

	public String getBd_adddate() {
		return bd_adddate;
	}

	public void setBd_adddate(String bd_adddate) {
		this.bd_adddate = bd_adddate;
	}

	public String getBd_modifyuser() {
		return bd_modifyuser;
	}

	public void setBd_modifyuser(String bd_modifyuser) {
		this.bd_modifyuser = bd_modifyuser;
	}

	public String getBd_modifydate() {
		return bd_modifydate;
	}

	public void setBd_modifydate(String bd_modifydate) {
		this.bd_modifydate = bd_modifydate;
	}

	public String getBd_deleteuser() {
		return bd_deleteuser;
	}

	public void setBd_deleteuser(String bd_deleteuser) {
		this.bd_deleteuser = bd_deleteuser;
	}

	public String getBd_deletedate() {
		return bd_deletedate;
	}

	public void setBd_deletedate(String bd_deletedate) {
		this.bd_deletedate = bd_deletedate;
	}

	public String getBd_status() {
		return bd_status;
	}
}

