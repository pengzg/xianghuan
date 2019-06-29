package com.xianghuan.auth.base.model;

import java.util.Date;


public class BaseArea implements java.io.Serializable{
	private static final long serialVersionUID = 5454155825314635342L;
	
	//columns START111
	//	
	private Integer ba_id;
	//地区名称	
	private String ba_name;
	//	
	private String ba_level;
	//	
	private String ba_parent_id;
	private String parent_nameref;
	//	
	private String ba_code;
	//	
	private Integer ba_dr;
	//	
	private String ba_ts;
	//	
	private Integer ba_version;
	//	
	private String ba_adduser;
	//	
	private java.util.Date ba_add_time;
	//	
	private String ba_modifyuser;
	//	
	private java.util.Date ba_update_time;
	//	
	private String ba_deleteuser;
	//	
	private String ba_deletetime;
	//	
	private String ba_orgid;
	//	
	private String ba_status;
	//	
	private String ba_cn;
	//	
	private String ba_letter;
	//columns END

	public void setBa_id(Integer ba_id) {
		this.ba_id = ba_id;
	}
	
	public Integer getBa_id() {
		return this.ba_id;
	}
	public void setBa_name(String ba_name) {
		this.ba_name = ba_name;
	}
	
	public String getBa_name() {
		return this.ba_name;
	}
	public void setBa_level(String ba_level) {
		this.ba_level = ba_level;
	}
	
	public String getBa_level() {
		return this.ba_level;
	}
	public void setBa_parent_id(String ba_parent_id) {
		this.ba_parent_id = ba_parent_id;
	}
	
	public String getBa_parent_id() {
		return this.ba_parent_id;
	}
	public void setBa_code(String ba_code) {
		this.ba_code = ba_code;
	}
	
	public String getBa_code() {
		return this.ba_code;
	}
	public void setBa_dr(Integer ba_dr) {
		this.ba_dr = ba_dr;
	}
	
	public Integer getBa_dr() {
		return this.ba_dr;
	}
	public void setBa_ts(String ba_ts) {
		this.ba_ts = ba_ts;
	}
	
	public String getBa_ts() {
		return this.ba_ts;
	}
	public void setBa_version(Integer ba_version) {
		this.ba_version = ba_version;
	}
	
	public Integer getBa_version() {
		return this.ba_version;
	}
	public void setBa_adduser(String ba_adduser) {
		this.ba_adduser = ba_adduser;
	}
	
	public String getBa_adduser() {
		return this.ba_adduser;
	}
	
	public void setBa_modifyuser(String ba_modifyuser) {
		this.ba_modifyuser = ba_modifyuser;
	}
	
	public String getBa_modifyuser() {
		return this.ba_modifyuser;
	}
	
	public void setBa_deleteuser(String ba_deleteuser) {
		this.ba_deleteuser = ba_deleteuser;
	}
	
	public String getBa_deleteuser() {
		return this.ba_deleteuser;
	}
	public void setBa_deletetime(String ba_deletetime) {
		this.ba_deletetime = ba_deletetime;
	}
	
	public String getBa_deletetime() {
		return this.ba_deletetime;
	}
	public void setBa_orgid(String ba_orgid) {
		this.ba_orgid = ba_orgid;
	}
	
	public String getBa_orgid() {
		return this.ba_orgid;
	}
	public void setBa_status(String ba_status) {
		this.ba_status = ba_status;
	}
	
	public String getBa_status() {
		return this.ba_status;
	}
	public void setBa_cn(String ba_cn) {
		this.ba_cn = ba_cn;
	}
	
	public String getBa_cn() {
		return this.ba_cn;
	}
	public void setBa_letter(String ba_letter) {
		this.ba_letter = ba_letter;
	}
	
	public String getBa_letter() {
		return this.ba_letter;
	}

	public String getParent_nameref() {
		return parent_nameref;
	}

	public void setParent_nameref(String parent_nameref) {
		this.parent_nameref = parent_nameref;
	}

	public Date getBa_add_time() {
		return ba_add_time;
	}

	public void setBa_add_time(Date ba_add_time) {
		this.ba_add_time = ba_add_time;
	}

	public Date getBa_update_time() {
		return ba_update_time;
	}

	public void setBa_update_time(Date ba_update_time) {
		this.ba_update_time = ba_update_time;
	}

}

