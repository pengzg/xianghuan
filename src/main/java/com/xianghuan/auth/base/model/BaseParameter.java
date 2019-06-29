package com.xianghuan.auth.base.model;

import com.xianghuan.auth.base.cache.BaseDataDetailValueCache;
import com.xianghuan.util.BaseDataTypeCodeConstant;

public class BaseParameter implements java.io.Serializable{
	private static final long serialVersionUID = 5454155825314635342L;
	
	//columns START111
	//主键	
	private Integer bp_id;
	//键	
	private String bp_key;
	//值	
	private String bp_value;
	//备注	
	private String bp_remark;
	//删除标志位	
	private String bp_dr;
	//版本	
	private Integer bp_version;
	//新增人	
	private String bp_adduser;
	//修改人	
	private String bp_updateuser;
	//状态	
	private Integer status;
	//状态	
	private Integer bp_level;
	//新增时间	
	private java.util.Date add_time;
	//修改时间	
	private java.util.Date update_time;
	
	private String bp_level_nameref;
	//columns END

	public void setBp_id(Integer bp_id) {
		this.bp_id = bp_id;
	}
	
	public Integer getBp_id() {
		return this.bp_id;
	}
	public void setBp_key(String bp_key) {
		this.bp_key = bp_key;
	}
	
	public String getBp_key() {
		return this.bp_key;
	}
	public void setBp_value(String bp_value) {
		this.bp_value = bp_value;
	}
	
	public String getBp_value() {
		return this.bp_value;
	}
	public void setBp_remark(String bp_remark) {
		this.bp_remark = bp_remark;
	}
	
	public String getBp_remark() {
		return this.bp_remark;
	}
	public void setBp_dr(String bp_dr) {
		this.bp_dr = bp_dr;
	}
	
	public String getBp_dr() {
		return this.bp_dr;
	}
	public void setBp_version(Integer bp_version) {
		this.bp_version = bp_version;
	}
	
	public Integer getBp_version() {
		return this.bp_version;
	}
	public void setBp_adduser(String bp_adduser) {
		this.bp_adduser = bp_adduser;
	}
	
	public String getBp_adduser() {
		return this.bp_adduser;
	}
	public void setBp_updateuser(String bp_updateuser) {
		this.bp_updateuser = bp_updateuser;
	}
	
	public String getBp_updateuser() {
		return this.bp_updateuser;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	
	public Integer getStatus() {
		return this.status;
	}
	
	public void setAdd_time(java.util.Date add_time) {
		this.add_time = add_time;
	}
	
	public java.util.Date getAdd_time() {
		return this.add_time;
	}
	
	public void setUpdate_time(java.util.Date update_time) {
		this.update_time = update_time;
	}
	
	public java.util.Date getUpdate_time() {
		return this.update_time;
	}

	public Integer getBp_level() {
		return bp_level;
	}

	public void setBp_level(Integer bp_level) {
		this.bp_level = bp_level;
	}

	public String getBp_level_nameref() {
		return BaseDataDetailValueCache.getInstance().getName(BaseDataTypeCodeConstant.type_2054, getBp_level()+"");
	}



}

