package com.xianghuan.auth.system.model;

import org.apache.commons.lang.StringUtils;

import com.alibaba.fastjson.annotation.JSONField;
import com.xianghuan.auth.base.cache.BaseDataDetailValueCache;
import com.xianghuan.util.BaseDataTypeCodeConstant;

/**
 * @ClassName: SysRole
 * @Description: 角色VO
 * @author shenwu
 * @date 2014年6月27日 下午4:11:31
 */
public class SysRole implements java.io.Serializable {
	private static final long serialVersionUID = 5454155825314635342L;

	// columns START
	@JSONField(name = "id")
	private String sr_id;
	private String sr_name;
	private Long sr_order;
	private String sr_desc;
	private String sr_pid;
	private String sr_status;
	private String sr_status_nameref;
	private Long sr_version;
	private String sr_dr;
	private String sr_ts;
	private String name;
	private String so_orgname;
	private String sr_so_orgid;
	private String sr_so_orgid_nameref;
	private String sr_code;
	private String sr_userid;
	private String sr_roletype;

	// columns END

	public String getSr_so_orgid_nameref() {
	// 	if (StringUtils.isNotBlank(this.getSr_so_orgid()))
// 			sr_so_orgid_nameref = SystemOrgCache.getInstance().getName(
	// 				this.getSr_so_orgid());
		return sr_so_orgid_nameref;
	}

	public void setSr_so_orgid_nameref(String sr_so_orgid_nameref) {
		this.sr_so_orgid_nameref = sr_so_orgid_nameref;
	}

	public void setSr_id(String value) {
		this.sr_id = value;
	}

	public String getSr_id() {
		return this.sr_id;
	}

	public void setSr_name(String value) {
		this.sr_name = value;
	}

	public String getSr_name() {
		return this.sr_name;
	}

	public void setSr_order(Long value) {
		this.sr_order = value;
	}

	public Long getSr_order() {
		return this.sr_order;
	}

	public void setSr_desc(String value) {
		this.sr_desc = value;
	}

	public String getSr_desc() {
		return this.sr_desc;
	}

	public void setSr_pid(String value) {
		this.sr_pid = value;
	}

	public String getSr_pid() {
		return this.sr_pid;
	}

	public void setSr_status(String value) {
		this.sr_status = value;
	}

	public String getSr_status() {
		return this.sr_status;
	}

	public void setSr_version(Long value) {
		this.sr_version = value;
	}

	public Long getSr_version() {
		return this.sr_version;
	}

	public void setSr_dr(String value) {
		this.sr_dr = value;
	}

	public String getSr_dr() {
		return this.sr_dr;
	}

	public void setSr_ts(String value) {
		this.sr_ts = value;
	}

	public String getSr_ts() {
		return this.sr_ts;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSo_orgname() {
		return so_orgname;
	}

	public void setSo_orgname(String so_orgname) {
		this.so_orgname = so_orgname;
	}

	public String getSr_so_orgid() {
		return sr_so_orgid;
	}

	public void setSr_so_orgid(String sr_so_orgid) {
		this.sr_so_orgid = sr_so_orgid;
	}

	public String getSr_status_nameref() {
		if (StringUtils.isNotBlank(this.getSr_status())) {
			sr_status_nameref = BaseDataDetailValueCache.getInstance()
					.getName(BaseDataTypeCodeConstant.type_2006,
							this.getSr_status());
		}
		return sr_status_nameref;
	}

	public void setSr_status_nameref(String sr_status_nameref) {
		this.sr_status_nameref = sr_status_nameref;
	}

	public String getSr_code() {
		return sr_code;
	}

	public void setSr_code(String sr_code) {
		this.sr_code = sr_code;
	}

	public String getSr_userid() {
		return sr_userid;
	}

	public void setSr_userid(String sr_userid) {
		this.sr_userid = sr_userid;
	}

	public String getSr_roletype() {
		return sr_roletype;
	}

	public void setSr_roletype(String sr_roletype) {
		this.sr_roletype = sr_roletype;
	}

}
