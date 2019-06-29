package com.xianghuan.auth.system.model;

import com.alibaba.fastjson.annotation.JSONField;

/**
 * @author feizhang
 * @version 1.0
 * @since 1.0
 */

public class SysMenu implements java.io.Serializable{
	
	private static final long serialVersionUID = 5454155825314635342L;
	
	//columns START111
	//PK
	@JSONField(name="id")
	private java.lang.String sm_id;
	//菜单名称
	private java.lang.String sm_name;
	//访问地址
	private java.lang.String sm_url;
	//上级节点
	private java.lang.String sm_pid;
	//图标
	private java.lang.String sm_iconcls;
	//描述
	private java.lang.String sm_description;
	//菜单类型
	private java.lang.String sm_typeid;
	//序号
	private java.lang.Integer sm_seq;
	//目标
	private java.lang.String sm_target;
	//所属系统
	private java.lang.String sm_systemid;
	//状态
	private java.lang.String sm_status;
	//
	private java.lang.String sm_ts;
	//
	private java.lang.Integer sm_dr;
	//
	private java.lang.Integer sm_version;
	//新增人
	private java.lang.String sm_adduser;
	//新增日期 
	private java.lang.String sm_adddate;
	//最后修改人
	private java.lang.String sm_modifyuser;
	//最后修改日期
	private java.lang.String sm_modifydate;
	//删除人
	private java.lang.String sm_deleteuser;
	//删除日期
	private java.lang.String sm_deletedate;
	
	private java.lang.String name;
	//系统名称
	private java.lang.String ss_name;
	//菜单级别
	private String sm_level;
	//columns END
	
	
	public void setSm_id(java.lang.String value) {
		this.sm_id = value;
	}

	public String getSm_level() {
		return sm_level;
	}

	public void setSm_level(String sm_level) {
		this.sm_level = sm_level;
	}



	public java.lang.String getSm_id() {
		return this.sm_id;
	}
	public void setSm_name(java.lang.String value) {
		this.sm_name = value;
	}
	
	public java.lang.String getSm_name() {
		return this.sm_name;
	}
	public void setSm_url(java.lang.String value) {
		this.sm_url = value;
	}
	
	public java.lang.String getSm_url() {
		return this.sm_url;
	}
	public void setSm_pid(java.lang.String value) {
		this.sm_pid = value;
	}
	
	public java.lang.String getSm_pid() {
		return this.sm_pid;
	}
	public void setSm_iconcls(java.lang.String value) {
		this.sm_iconcls = value;
	}
	
	public java.lang.String getSm_iconcls() {
		return this.sm_iconcls;
	}
	public void setSm_description(java.lang.String value) {
		this.sm_description = value;
	}
	
	public java.lang.String getSm_description() {
		return this.sm_description;
	}
	public void setSm_typeid(java.lang.String value) {
		this.sm_typeid = value;
	}
	
	public java.lang.String getSm_typeid() {
		return this.sm_typeid;
	}
	public void setSm_seq(java.lang.Integer value) {
		this.sm_seq = value;
	}
	
	public java.lang.Integer getSm_seq() {
		return this.sm_seq;
	}
	public void setSm_target(java.lang.String value) {
		this.sm_target = value;
	}
	
	public java.lang.String getSm_target() {
		return this.sm_target;
	}
	public void setSm_systemid(java.lang.String value) {
		this.sm_systemid = value;
	}
	
	public java.lang.String getSm_systemid() {
		return this.sm_systemid;
	}
	public void setSm_status(java.lang.String value) {
		this.sm_status = value;
	}
	
	public java.lang.String getSm_status() {
		return this.sm_status;
	}
	public void setSm_ts(java.lang.String value) {
		this.sm_ts = value;
	}
	
	public java.lang.String getSm_ts() {
		return this.sm_ts;
	}
	public void setSm_dr(java.lang.Integer value) {
		this.sm_dr = value;
	}
	
	public java.lang.Integer getSm_dr() {
		return this.sm_dr;
	}
	public void setSm_version(java.lang.Integer value) {
		this.sm_version = value;
	}
	
	public java.lang.Integer getSm_version() {
		return this.sm_version;
	}
	public void setSm_adduser(java.lang.String value) {
		this.sm_adduser = value;
	}
	
	public java.lang.String getSm_adduser() {
		return this.sm_adduser;
	}
	public void setSm_adddate(java.lang.String value) {
		this.sm_adddate = value;
	}
	
	public java.lang.String getSm_adddate() {
		return this.sm_adddate;
	}
	public void setSm_modifyuser(java.lang.String value) {
		this.sm_modifyuser = value;
	}
	
	public java.lang.String getSm_modifyuser() {
		return this.sm_modifyuser;
	}
	public void setSm_modifydate(java.lang.String value) {
		this.sm_modifydate = value;
	}
	
	public java.lang.String getSm_modifydate() {
		return this.sm_modifydate;
	}
	public void setSm_deleteuser(java.lang.String value) {
		this.sm_deleteuser = value;
	}
	
	public java.lang.String getSm_deleteuser() {
		return this.sm_deleteuser;
	}
	public void setSm_deletedate(java.lang.String value) {
		this.sm_deletedate = value;
	}
	
	public java.lang.String getSm_deletedate() {
		return this.sm_deletedate;
	}

	public java.lang.String getName() {
		return name;
	}

	public void setName(java.lang.String name) {
		this.name = name;
	}

	public java.lang.String getSs_name() {
		return ss_name;
	}

	public void setSs_name(java.lang.String ss_name) {
		this.ss_name = ss_name;
	}

}

