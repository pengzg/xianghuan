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


public class SysMenuType implements java.io.Serializable{
	private static final long serialVersionUID = 5454155825314635342L;
	
	//columns START
	private java.lang.String smt_id;
	private java.lang.String smt_name;
	private java.lang.Integer smt_dr;
	private java.lang.String smt_ts;
	//columns END

	public void setSmt_id(java.lang.String value) {
		this.smt_id = value;
	}
	
	public java.lang.String getSmt_id() {
		return this.smt_id;
	}
	public void setSmt_name(java.lang.String value) {
		this.smt_name = value;
	}
	
	public java.lang.String getSmt_name() {
		return this.smt_name;
	}
	public void setSmt_dr(java.lang.Integer value) {
		this.smt_dr = value;
	}
	
	public java.lang.Integer getSmt_dr() {
		return this.smt_dr;
	}
	public void setSmt_ts(java.lang.String value) {
		this.smt_ts = value;
	}
	
	public java.lang.String getSmt_ts() {
		return this.smt_ts;
	}

}

