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


public class SysUserOrg implements java.io.Serializable{
	private static final long serialVersionUID = 5454155825314635342L;
	
	//columns START111
	//
	private java.lang.String suo_id;
	//
	private java.lang.String suo_userid;
	//
	private java.lang.String suo_orgid;
	//新增人
	private java.lang.String suo_adduser;
	//新增日期 
	private java.lang.String suo_adddate;
	//最后修改人
	private java.lang.String suo_modifyuser;
	//最后修改日期
	private java.lang.String suo_modifydate;
	//删除人
	private java.lang.String suo_deleteuser;
	//删除日期
	private java.lang.String suo_deletedate;
	//
	private java.lang.String suo_ts;
	//
	private java.lang.Integer suo_dr;
	//
	private java.lang.Integer suo_version;
	//columns END

	public void setSuo_id(java.lang.String value) {
		this.suo_id = value;
	}
	
	public java.lang.String getSuo_id() {
		return this.suo_id;
	}
	public void setSuo_userid(java.lang.String value) {
		this.suo_userid = value;
	}
	
	public java.lang.String getSuo_userid() {
		return this.suo_userid;
	}
	public void setSuo_orgid(java.lang.String value) {
		this.suo_orgid = value;
	}
	
	public java.lang.String getSuo_orgid() {
		return this.suo_orgid;
	}
	public void setSuo_adduser(java.lang.String value) {
		this.suo_adduser = value;
	}
	
	public java.lang.String getSuo_adduser() {
		return this.suo_adduser;
	}
	public void setSuo_adddate(java.lang.String value) {
		this.suo_adddate = value;
	}
	
	public java.lang.String getSuo_adddate() {
		return this.suo_adddate;
	}
	public void setSuo_modifyuser(java.lang.String value) {
		this.suo_modifyuser = value;
	}
	
	public java.lang.String getSuo_modifyuser() {
		return this.suo_modifyuser;
	}
	public void setSuo_modifydate(java.lang.String value) {
		this.suo_modifydate = value;
	}
	
	public java.lang.String getSuo_modifydate() {
		return this.suo_modifydate;
	}
	public void setSuo_deleteuser(java.lang.String value) {
		this.suo_deleteuser = value;
	}
	
	public java.lang.String getSuo_deleteuser() {
		return this.suo_deleteuser;
	}
	public void setSuo_deletedate(java.lang.String value) {
		this.suo_deletedate = value;
	}
	
	public java.lang.String getSuo_deletedate() {
		return this.suo_deletedate;
	}
	public void setSuo_ts(java.lang.String value) {
		this.suo_ts = value;
	}
	
	public java.lang.String getSuo_ts() {
		return this.suo_ts;
	}
	public void setSuo_dr(java.lang.Integer value) {
		this.suo_dr = value;
	}
	
	public java.lang.Integer getSuo_dr() {
		return this.suo_dr;
	}
	public void setSuo_version(java.lang.Integer value) {
		this.suo_version = value;
	}
	
	public java.lang.Integer getSuo_version() {
		return this.suo_version;
	}

}

