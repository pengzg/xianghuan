/*
 * Powered By [rapid-framework]
 * Web Site: http://www.rapid-framework.org.cn
 * Google Code: http://code.google.com/p/rapid-framework/
 * Since 2008 - 2014
 */

package com.xianghuan.auth.system.model;


/**
 * @author feizhang
 * @version 1.0
 * @since 1.0
 */


public class SysSystem implements java.io.Serializable{
	private static final long serialVersionUID = 5454155825314635342L;
	
	//columns START111
	//PK
	private java.lang.String ss_id;
	//系统编码
	private java.lang.String ss_code;
	//系统名称
	private java.lang.String ss_name;
	//域名前缀
	private java.lang.String ss_url;
	//
	private java.lang.Integer ss_dr;
	//
	private java.lang.String ss_ts;
	//系统描述
	private java.lang.String ss_desc;
	//
	private java.lang.Integer ss_version;
	//新增人
	private java.lang.String ss_adduser;
	//新增日期 
	private java.lang.String ss_adddate;
	//最后修改人
	private java.lang.String ss_modifyuser;
	//最后修改日期
	private java.lang.String ss_modifydate;
	//删除人
	private java.lang.String ss_deleteuser;
	//删除日期
	private java.lang.String ss_deletedate;
	//columns END

	public void setSs_id(java.lang.String value) {
		this.ss_id = value;
	}
	
	public java.lang.String getSs_id() {
		return this.ss_id;
	}
	public void setSs_code(java.lang.String value) {
		this.ss_code = value;
	}
	
	public java.lang.String getSs_code() {
		return this.ss_code;
	}
	public void setSs_name(java.lang.String value) {
		this.ss_name = value;
	}
	
	public java.lang.String getSs_name() {
		return this.ss_name;
	}
	public void setSs_url(java.lang.String value) {
		this.ss_url = value;
	}
	
	public java.lang.String getSs_url() {
		return this.ss_url;
	}
	public void setSs_dr(java.lang.Integer value) {
		this.ss_dr = value;
	}
	
	public java.lang.Integer getSs_dr() {
		return this.ss_dr;
	}
	public void setSs_ts(java.lang.String value) {
		this.ss_ts = value;
	}
	
	public java.lang.String getSs_ts() {
		return this.ss_ts;
	}
	public void setSs_desc(java.lang.String value) {
		this.ss_desc = value;
	}
	
	public java.lang.String getSs_desc() {
		return this.ss_desc;
	}
	public void setSs_version(java.lang.Integer value) {
		this.ss_version = value;
	}
	
	public java.lang.Integer getSs_version() {
		return this.ss_version;
	}
	public void setSs_adduser(java.lang.String value) {
		this.ss_adduser = value;
	}
	
	public java.lang.String getSs_adduser() {
		return this.ss_adduser;
	}
	public void setSs_adddate(java.lang.String value) {
		this.ss_adddate = value;
	}
	
	public java.lang.String getSs_adddate() {
		return this.ss_adddate;
	}
	public void setSs_modifyuser(java.lang.String value) {
		this.ss_modifyuser = value;
	}
	
	public java.lang.String getSs_modifyuser() {
		return this.ss_modifyuser;
	}
	public void setSs_modifydate(java.lang.String value) {
		this.ss_modifydate = value;
	}
	
	public java.lang.String getSs_modifydate() {
		return this.ss_modifydate;
	}
	public void setSs_deleteuser(java.lang.String value) {
		this.ss_deleteuser = value;
	}
	
	public java.lang.String getSs_deleteuser() {
		return this.ss_deleteuser;
	}
	public void setSs_deletedate(java.lang.String value) {
		this.ss_deletedate = value;
	}
	
	public java.lang.String getSs_deletedate() {
		return this.ss_deletedate;
	}

}

