package com.xianghuan.auth.system.model;

/**
 * @ClassName: SysRoleMenu
 * @Description: 角色菜单
 * @author shenwu
 * @date 2014年6月24日 下午4:19:26
 */
public class SysRoleMenu implements java.io.Serializable{
	
	private static final long serialVersionUID = 5454155825314635342L;
	
	//columns START
	private java.lang.String srm_id;
	private java.lang.String srm_roleid;
	private java.lang.String srm_menuid;
	//columns END

	public void setSrm_id(java.lang.String value) {
		this.srm_id = value;
	}
	
	public java.lang.String getSrm_id() {
		return this.srm_id;
	}

	public java.lang.String getSrm_roleid() {
		return srm_roleid;
	}

	public void setSrm_roleid(java.lang.String srm_roleid) {
		this.srm_roleid = srm_roleid;
	}

	public java.lang.String getSrm_menuid() {
		return srm_menuid;
	}

	public void setSrm_menuid(java.lang.String srm_menuid) {
		this.srm_menuid = srm_menuid;
	}
}

