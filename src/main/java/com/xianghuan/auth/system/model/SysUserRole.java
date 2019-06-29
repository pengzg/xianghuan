package com.xianghuan.auth.system.model;

/**
 * @ClassName: SysUserRole
 * @Description: 用户角色
 * @author shenwu
 * @date 2014年6月23日 下午2:22:52
 */
public class SysUserRole implements java.io.Serializable{
	private static final long serialVersionUID = 5454155825314635342L;
	
	//columns START
	private java.lang.String sur_id;
	private java.lang.String sur_roleid;
	private java.lang.String sur_userid;
	//columns END

	public void setSur_id(java.lang.String value) {
		this.sur_id = value;
	}
	
	public java.lang.String getSur_id() {
		return this.sur_id;
	}
	public void setSur_roleid(java.lang.String value) {
		this.sur_roleid = value;
	}
	
	public java.lang.String getSur_roleid() {
		return this.sur_roleid;
	}
	public void setSur_userid(java.lang.String value) {
		this.sur_userid = value;
	}
	
	public java.lang.String getSur_userid() {
		return this.sur_userid;
	}

}

