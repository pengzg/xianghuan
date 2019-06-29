/*
 * Powered By [rapid-framework]
 * Web Site: http://www.rapid-framework.org.cn
 * Google Code: http://code.google.com/p/rapid-framework/
 * Since 2008 - 2014
 */

package com.xianghuan.auth.system.model;


/**
 * @author admin
 * @version 1.0
 * @since 1.0
 */


public class SysActionLog implements java.io.Serializable{
	private static final long serialVersionUID = 5454155825314635342L;
	
	//columns START
	private java.lang.String sal_id;
	private java.lang.String sal_creatid;//操作人编号
	private java.lang.String sal_createname;//操作人姓名
	private java.lang.String sal_actionname;//事件名称
	private java.lang.String sal_actiontype;//事件类型
	private java.lang.String sal_actiontime;//事件时间
	private java.lang.String sal_ownerid;//所属人编号
	private java.lang.String sal_ip;//机器IP
	private java.lang.String sal_plattype;//日志平台类型
	private java.lang.String sal_desc;//日志描述
	private java.lang.String sal_ts;//时间
	private java.lang.Integer sal_dr;//删除标志位
	private java.lang.Integer sal_type;//日志类弄 
	//columns END

	public void setSal_id(java.lang.String value) {
		this.sal_id = value;
	}
	
	public java.lang.String getSal_id() {
		return this.sal_id;
	}
	public void setSal_creatid(java.lang.String value) {
		this.sal_creatid = value;
	}
	
	public java.lang.String getSal_creatid() {
		return this.sal_creatid;
	}
	public void setSal_createname(java.lang.String value) {
		this.sal_createname = value;
	}
	
	public java.lang.String getSal_createname() {
		return this.sal_createname;
	}
	public void setSal_actionname(java.lang.String value) {
		this.sal_actionname = value;
	}
	
	public java.lang.String getSal_actionname() {
		return this.sal_actionname;
	}
	public void setSal_actiontype(java.lang.String value) {
		this.sal_actiontype = value;
	}
	
	public java.lang.String getSal_actiontype() {
		return this.sal_actiontype;
	}
	public void setSal_actiontime(java.lang.String value) {
		this.sal_actiontime = value;
	}
	
	public java.lang.String getSal_actiontime() {
		return this.sal_actiontime;
	}
	public void setSal_ownerid(java.lang.String value) {
		this.sal_ownerid = value;
	}
	
	public java.lang.String getSal_ownerid() {
		return this.sal_ownerid;
	}
	public void setSal_ip(java.lang.String value) {
		this.sal_ip = value;
	}
	
	public java.lang.String getSal_ip() {
		return this.sal_ip;
	}
	public void setSal_plattype(java.lang.String value) {
		this.sal_plattype = value;
	}
	
	public java.lang.String getSal_plattype() {
		return this.sal_plattype;
	}
	public void setSal_desc(java.lang.String value) {
		this.sal_desc = value;
	}
	
	public java.lang.String getSal_desc() {
		return this.sal_desc;
	}
	public void setSal_ts(java.lang.String value) {
		this.sal_ts = value;
	}
	
	public java.lang.String getSal_ts() {
		return this.sal_ts;
	}
	public void setSal_dr(java.lang.Integer value) {
		this.sal_dr = value;
	}
	
	public java.lang.Integer getSal_dr() {
		return this.sal_dr;
	}

	public java.lang.Integer getSal_type() {
		return sal_type;
	}

	public void setSal_type(java.lang.Integer sal_type) {
		this.sal_type = sal_type;
	}
}

