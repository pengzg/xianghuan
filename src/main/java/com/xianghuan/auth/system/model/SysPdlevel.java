/*
 * Powered By [rapid-framework]
 * Web Site: http://www.rapid-framework.org.cn
 * Google Code: http://code.google.com/p/rapid-framework/
 * Since 2008 - 2014
 */

package com.xianghuan.auth.system.model;

/**
 * 
 * @ClassName: SysPdlevel
 * @Description: 密码策略表
 * @author shenwu
 * @date 2014年6月30日 下午12:10:35
 *
 */
public class SysPdlevel implements java.io.Serializable{
	private static final long serialVersionUID = 5454155825314635342L;
	
	//columns START
	private java.lang.String sp_id;
	private java.lang.String sp_name;
	private java.lang.String sp_pdfzd;
	private java.lang.Integer sp_pdjgtimes;
	private java.lang.String sp_pduptimes;
	private java.lang.String sp_status;
	private java.lang.String sp_ts;
	private java.lang.Integer sp_dr;
	//columns END

	public void setSp_id(java.lang.String value) {
		this.sp_id = value;
	}
	
	public java.lang.String getSp_id() {
		return this.sp_id;
	}
	public void setSp_name(java.lang.String value) {
		this.sp_name = value;
	}
	
	public java.lang.String getSp_name() {
		return this.sp_name;
	}
	public void setSp_pdfzd(java.lang.String value) {
		this.sp_pdfzd = value;
	}
	
	public java.lang.String getSp_pdfzd() {
		return this.sp_pdfzd;
	}
	public void setSp_pdjgtimes(java.lang.Integer value) {
		this.sp_pdjgtimes = value;
	}
	
	public java.lang.Integer getSp_pdjgtimes() {
		return this.sp_pdjgtimes;
	}
	public void setSp_pduptimes(java.lang.String value) {
		this.sp_pduptimes = value;
	}
	
	public java.lang.String getSp_pduptimes() {
		return this.sp_pduptimes;
	}
	public void setSp_status(java.lang.String value) {
		this.sp_status = value;
	}
	
	public java.lang.String getSp_status() {
		return this.sp_status;
	}
	public void setSp_ts(java.lang.String value) {
		this.sp_ts = value;
	}
	
	public java.lang.String getSp_ts() {
		return this.sp_ts;
	}
	public void setSp_dr(java.lang.Integer value) {
		this.sp_dr = value;
	}
	
	public java.lang.Integer getSp_dr() {
		return this.sp_dr;
	}

}

