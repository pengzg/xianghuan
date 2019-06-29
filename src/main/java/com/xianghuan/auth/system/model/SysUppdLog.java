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


public class SysUppdLog implements java.io.Serializable{
	private static final long serialVersionUID = 5454155825314635342L;
	
	//columns START
	private java.lang.String sul_id;
	private java.lang.String sul_creatid;
	private java.lang.String sul_uptime;
	private java.lang.String sul_oldpd;
	private java.lang.String sul_newpd;
	private java.lang.String sul_inserttime;
	private java.lang.String sul_sp_id;
	private java.lang.String sul_desc;
	//columns END

	public void setSul_id(java.lang.String value) {
		this.sul_id = value;
	}
	
	public java.lang.String getSul_id() {
		return this.sul_id;
	}
	public void setSul_creatid(java.lang.String value) {
		this.sul_creatid = value;
	}
	
	public java.lang.String getSul_creatid() {
		return this.sul_creatid;
	}
	public void setSul_uptime(java.lang.String value) {
		this.sul_uptime = value;
	}
	
	public java.lang.String getSul_uptime() {
		return this.sul_uptime;
	}
	public void setSul_oldpd(java.lang.String value) {
		this.sul_oldpd = value;
	}
	
	public java.lang.String getSul_oldpd() {
		return this.sul_oldpd;
	}
	public void setSul_newpd(java.lang.String value) {
		this.sul_newpd = value;
	}
	
	public java.lang.String getSul_newpd() {
		return this.sul_newpd;
	}
	public void setSul_inserttime(java.lang.String value) {
		this.sul_inserttime = value;
	}
	
	public java.lang.String getSul_inserttime() {
		return this.sul_inserttime;
	}
	public void setSul_sp_id(java.lang.String value) {
		this.sul_sp_id = value;
	}
	
	public java.lang.String getSul_sp_id() {
		return this.sul_sp_id;
	}
	public void setSul_desc(java.lang.String value) {
		this.sul_desc = value;
	}
	
	public java.lang.String getSul_desc() {
		return this.sul_desc;
	}

}

