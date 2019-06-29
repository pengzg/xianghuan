/*
 * Powered By [rapid-framework]
 * Web Site: http://www.rapid-framework.org.cn
 * Google Code: http://code.google.com/p/rapid-framework/
 * Since 2008 - 2014
 */

package com.xianghuan.auth.system.model;

import org.apache.commons.lang.StringUtils;

import com.xianghuan.auth.base.cache.BaseDataDetailValueCache;
import com.xianghuan.auth.system.cache.SysUserUnityCache;
import com.xianghuan.util.BaseDataTypeCodeConstant;


public class SysUserUnity implements java.io.Serializable{
	private static final long serialVersionUID = 5454155825314635342L;
	
	//columns START111
	//主键ID
	private String suu_id;
	//用户ID
	private String suu_ub_id;
	//用户名称
	private String suu_ub_name;
	//登陆名
	private String suu_ub_loginname;
	//机构ID
	private String suu_orgid;
	
	//用户类型1.运营商；2代理；3商户；4推广人；5终端用户
	private String suu_ub_type;
	private String suu_ub_type_nameref;
	
	//状态（0.禁用；1.启用）
	private String suu_status;
	//删除标志位:0删除，1未删除
	private String suu_dr;
	//时间
	private String suu_ts;
	//版本号
	private Long suu_version;
	//新增人
	private String suu_adduser;
	//新增日期
	private String suu_adddate;
	//最后修改人
	private String suu_modifyuser;
	//最后修改日期
	private String suu_modifydate;
	
	private String suu_parentsid;//父级ID
	
	private String suu_parentsid_nameref;
	
	private String suu_orgid_nameref;
	
	private String suu_status_nameref;
	
	//columns END

	public void setSuu_id(String value) {
		this.suu_id = value;
	}
	
	public String getSuu_id() {
		return this.suu_id;
	}
	public void setSuu_ub_id(String value) {
		this.suu_ub_id = value;
	}
	
	public String getSuu_ub_id() {
		return this.suu_ub_id;
	}
	public void setSuu_ub_name(String value) {
		this.suu_ub_name = value;
	}
	
	public String getSuu_ub_name() {
		return this.suu_ub_name;
	}
	public void setSuu_ub_type(String value) {
		this.suu_ub_type = value;
	}
	
	public String getSuu_ub_type() {
		return this.suu_ub_type;
	}
	public void setSuu_status(String value) {
		this.suu_status = value;
	}
	
	public String getSuu_status() {
		return this.suu_status;
	}
	public void setSuu_dr(String value) {
		this.suu_dr = value;
	}
	
	public String getSuu_dr() {
		return this.suu_dr;
	}
	public void setSuu_ts(String value) {
		this.suu_ts = value;
	}
	
	public String getSuu_ts() {
		return this.suu_ts;
	}
	public void setSuu_version(Long value) {
		this.suu_version = value;
	}
	
	public Long getSuu_version() {
		return this.suu_version;
	}
	public void setSuu_adduser(String value) {
		this.suu_adduser = value;
	}
	
	public String getSuu_adduser() {
		return this.suu_adduser;
	}
	public void setSuu_adddate(String value) {
		this.suu_adddate = value;
	}
	
	public String getSuu_adddate() {
		return this.suu_adddate;
	}
	public void setSuu_modifyuser(String value) {
		this.suu_modifyuser = value;
	}
	
	public String getSuu_modifyuser() {
		return this.suu_modifyuser;
	}
	public void setSuu_modifydate(String value) {
		this.suu_modifydate = value;
	}
	
	public String getSuu_modifydate() {
		return this.suu_modifydate;
	}

	public String getSuu_ub_loginname() {
		return suu_ub_loginname;
	}

	public void setSuu_ub_loginname(String suu_ub_loginname) {
		this.suu_ub_loginname = suu_ub_loginname;
	}

	public String getSuu_orgid() {
		return suu_orgid;
	}

	public void setSuu_orgid(String suu_orgid) {
		this.suu_orgid = suu_orgid;
	}

	public String getSuu_orgid_nameref() {
		if(StringUtils.isNotBlank(this.getSuu_orgid())) {
			// this.suu_orgid_nameref = SystemOrgCache.getInstance().getName(this.getSuu_orgid());
		}
		return suu_orgid_nameref;
	}

	public void setSuu_orgid_nameref(String suu_orgid_nameref) {
		this.suu_orgid_nameref = suu_orgid_nameref;
	}

	public String getSuu_ub_type_nameref() {
		if(StringUtils.isNotBlank(this.getSuu_ub_type())) {
			this.suu_ub_type_nameref =  BaseDataDetailValueCache.getInstance().getName(BaseDataTypeCodeConstant.type_1021, this.getSuu_ub_type());
		}
		return suu_ub_type_nameref;
	}

	public void setSuu_ub_type_nameref(String suu_ub_type_nameref) {
		this.suu_ub_type_nameref = suu_ub_type_nameref;
	}

	public String getSuu_status_nameref() {
		if(StringUtils.isNotBlank(this.getSuu_status())) {
			this.suu_status_nameref =  BaseDataDetailValueCache.getInstance().getName(BaseDataTypeCodeConstant.type_2006, this.getSuu_status());
		}
		return suu_status_nameref;
	}

	public void setSuu_status_nameref(String suu_status_nameref) {
		this.suu_status_nameref = suu_status_nameref;
	}

	public String getSuu_parentsid() {
		return suu_parentsid;
	}

	public void setSuu_parentsid(String suu_parentsid) {
		this.suu_parentsid = suu_parentsid;
	}

	public String getSuu_parentsid_nameref() {
		if(StringUtils.isNotBlank(this.getSuu_parentsid())) {
			suu_parentsid_nameref = SysUserUnityCache.getInstance().getName(this.getSuu_parentsid());
		}
		return suu_parentsid_nameref;
	}

	public void setSuu_parentsid_nameref(String suu_parentsid_nameref) {
		this.suu_parentsid_nameref = suu_parentsid_nameref;
	}

}

