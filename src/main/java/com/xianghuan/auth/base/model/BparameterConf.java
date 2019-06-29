package com.xianghuan.auth.base.model;

import org.apache.commons.lang3.StringUtils;

import com.xianghuan.auth.base.cache.BaseDataDetailValueCache;
import com.xianghuan.util.BaseDataTypeCodeConstant;

public class BparameterConf implements java.io.Serializable{
	private static final long serialVersionUID = 5454155825314635342L;
	
	//columns START111
	//主键	
	private String bpc_id;
	//key编码	
	private String bpc_key_code;
	//值	
	private String bpc_value;
	//备注说明	
	private String bpc_remark;
	//所属运营商ID	
	private String bpc_orgid;
	//状态 0禁用 1启用	
	private String bpc_status;
	//状态  禁用  启用
	private String bpc_status_nameref;

	//删除标志位:0删除，1未删除	
	private String bpc_dr;
	//删除标志位:删除，未删除	
	private String bpc_dr_nameref;
	//版本号	
	private String bpc_version;
	//新增人	
	private String bpc_adduser;
	//新增日期	
	private String bpc_adddate;
	//最后修改人	
	private String bpc_modifyuser;
	//最后修改日期	
	private String bpc_modifydate;
	//删除人	
	private String bpc_deleteuser;
	//删除日期	
	private String bpc_deletedate;
	//columns END

	public void setBpc_id(String bpc_id) {
		this.bpc_id = bpc_id;
	}
	
	public String getBpc_id() {
		return this.bpc_id;
	}
	public void setBpc_key_code(String bpc_key_code) {
		this.bpc_key_code = bpc_key_code;
	}
	
	public String getBpc_key_code() {
		return this.bpc_key_code;
	}
	public void setBpc_value(String bpc_value) {
		this.bpc_value = bpc_value;
	}
	
	public String getBpc_value() {
		return this.bpc_value;
	}
	public void setBpc_remark(String bpc_remark) {
		this.bpc_remark = bpc_remark;
	}
	
	public String getBpc_remark() {
		return this.bpc_remark;
	}
	public void setBpc_orgid(String bpc_orgid) {
		this.bpc_orgid = bpc_orgid;
	}
	
	public String getBpc_orgid() {
		return this.bpc_orgid;
	}
	public void setBpc_status(String bpc_status) {
		this.bpc_status = bpc_status;
	}
	
	public String getBpc_status() {
		return this.bpc_status;
	}
	public void setBpc_dr(String bpc_dr) {
		this.bpc_dr = bpc_dr;
	}
	
	public String getBpc_dr() {
		return this.bpc_dr;
	}
	public void setBpc_version(String bpc_version) {
		this.bpc_version = bpc_version;
	}
	
	public String getBpc_version() {
		return this.bpc_version;
	}
	public void setBpc_adduser(String bpc_adduser) {
		this.bpc_adduser = bpc_adduser;
	}
	
	public String getBpc_adduser() {
		return this.bpc_adduser;
	}
	public void setBpc_adddate(String bpc_adddate) {
		this.bpc_adddate = bpc_adddate;
	}
	
	public String getBpc_adddate() {
		return this.bpc_adddate;
	}
	public void setBpc_modifyuser(String bpc_modifyuser) {
		this.bpc_modifyuser = bpc_modifyuser;
	}
	
	public String getBpc_modifyuser() {
		return this.bpc_modifyuser;
	}
	public void setBpc_modifydate(String bpc_modifydate) {
		this.bpc_modifydate = bpc_modifydate;
	}
	
	public String getBpc_modifydate() {
		return this.bpc_modifydate;
	}
	public void setBpc_deleteuser(String bpc_deleteuser) {
		this.bpc_deleteuser = bpc_deleteuser;
	}
	
	public String getBpc_deleteuser() {
		return this.bpc_deleteuser;
	}
	public void setBpc_deletedate(String bpc_deletedate) {
		this.bpc_deletedate = bpc_deletedate;
	}
	
	public String getBpc_deletedate() {
		return this.bpc_deletedate;
	}

	public String getBpc_status_nameref() {
		if (StringUtils.isNotBlank(this.getBpc_status())) {
			bpc_status_nameref = BaseDataDetailValueCache.getInstance()
					.getName(BaseDataTypeCodeConstant.type_2006,
							this.getBpc_status());
		}
		return bpc_status_nameref;
	}

	public void setBpc_status_nameref(String bpc_status_nameref) {
		this.bpc_status_nameref = bpc_status_nameref;
	}

	public String getBpc_dr_nameref() {
		if (StringUtils.isNotBlank(this.getBpc_dr())) {
			bpc_dr_nameref = BaseDataDetailValueCache.getInstance()
					.getName(BaseDataTypeCodeConstant.type_1050,
							this.getBpc_dr());
		}
		return bpc_dr_nameref;
	}

	public void setBpc_dr_nameref(String bpc_dr_nameref) {
		this.bpc_dr_nameref = bpc_dr_nameref;
	}
	
}

