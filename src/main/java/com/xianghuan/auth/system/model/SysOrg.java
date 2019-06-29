/*
 * Powered By [rapid-framework]
 * Web Site: http://www.rapid-framework.org.cn
 * Google Code: http://code.google.com/p/rapid-framework/
 * Since 2008 - 2014
 */

package com.xianghuan.auth.system.model;

import org.apache.commons.lang.StringUtils;

import com.xianghuan.auth.base.cache.BaseDataDetailValueCache;
import com.xianghuan.util.BaseDataTypeCodeConstant;


public class SysOrg implements java.io.Serializable{
	private static final long serialVersionUID = 5454155825314635342L;
	
	//columns START111
	//机构ID
	private String so_orgid;
	//机构编码
	private String so_orgcode;
	//机构名称
	private String so_orgname;
	//联系人姓名
	private String so_contactname;
	//联系人电话
	private String so_contactphone;
	//传真
	private String so_fax;
	//机构地址
	private String so_orgadds;
	//上级机构
	private String so_orgparid;
	//机构图标
	private String so_orgpic;
	//机构状态:1:启用；0禁用
	private String so_status;
	//机构版本号
	private Long so_version;
	//记录插入时间
	private String so_ts;
	//删除标志位:0 已删除，1未删除
	private String so_dr;
	//运营区域ID
	private String so_bpa_id;
	//签约商户数量上限
	private Long so_me_limit;
	//个人用户数量上限
	private Long so_per_limit;
	//代理商层级上限
	private Integer so_agent_level_limit;
	//外系统ID
	private String so_id_ext;
	//外系统编码
	private String so_code_ext;
	//外系统名称
	private String so_name_ext;
	//机构类型
	private String so_type;
	
	private String org_name;
	//品牌Id
	private String so_brand;
	//品牌名称
	private String so_brand_nameref;
	//columns END

	public void setSo_orgid(String value) {
		this.so_orgid = value;
	}
	
	public String getSo_orgid() {
		return this.so_orgid;
	}
	public void setSo_orgcode(String value) {
		this.so_orgcode = value;
	}
	
	public String getSo_orgcode() {
		return this.so_orgcode;
	}
	public void setSo_orgname(String value) {
		this.so_orgname = value;
	}
	
	public String getSo_orgname() {
		return this.so_orgname;
	}
	public void setSo_contactname(String value) {
		this.so_contactname = value;
	}
	
	public String getSo_contactname() {
		return this.so_contactname;
	}
	public void setSo_contactphone(String value) {
		this.so_contactphone = value;
	}
	
	public String getSo_contactphone() {
		return this.so_contactphone;
	}
	public void setSo_fax(String value) {
		this.so_fax = value;
	}
	
	public String getSo_fax() {
		return this.so_fax;
	}
	public void setSo_orgadds(String value) {
		this.so_orgadds = value;
	}
	
	public String getSo_orgadds() {
		return this.so_orgadds;
	}
	public void setSo_orgparid(String value) {
		this.so_orgparid = value;
	}
	
	public String getSo_orgparid() {
		return this.so_orgparid;
	}
	public void setSo_orgpic(String value) {
		this.so_orgpic = value;
	}
	
	public String getSo_orgpic() {
		return this.so_orgpic;
	}
	public void setSo_status(String value) {
		this.so_status = value;
	}
	
	public String getSo_status() {
		return this.so_status;
	}
	public void setSo_version(Long value) {
		this.so_version = value;
	}
	
	public Long getSo_version() {
		return this.so_version;
	}
	public void setSo_ts(String value) {
		this.so_ts = value;
	}
	
	public String getSo_ts() {
		return this.so_ts;
	}
	public void setSo_dr(String value) {
		this.so_dr = value;
	}
	
	public String getSo_dr() {
		return this.so_dr;
	}
	public void setSo_bpa_id(String value) {
		this.so_bpa_id = value;
	}
	
	public String getSo_bpa_id() {
		return this.so_bpa_id;
	}
	public void setSo_me_limit(Long value) {
		this.so_me_limit = value;
	}
	
	public Long getSo_me_limit() {
		return this.so_me_limit;
	}
	public void setSo_per_limit(Long value) {
		this.so_per_limit = value;
	}
	
	public Long getSo_per_limit() {
		return this.so_per_limit;
	}
	public void setSo_agent_level_limit(Integer value) {
		this.so_agent_level_limit = value;
	}
	
	public Integer getSo_agent_level_limit() {
		return this.so_agent_level_limit;
	}
	public void setSo_id_ext(String value) {
		this.so_id_ext = value;
	}
	
	public String getSo_id_ext() {
		return this.so_id_ext;
	}
	public void setSo_code_ext(String value) {
		this.so_code_ext = value;
	}
	
	public String getSo_code_ext() {
		return this.so_code_ext;
	}
	public void setSo_name_ext(String value) {
		this.so_name_ext = value;
	}
	
	public String getSo_name_ext() {
		return this.so_name_ext;
	}
	public void setSo_type(String value) {
		this.so_type = value;
	}
	
	public String getSo_type() {
		return this.so_type;
	}

	public String getOrg_name() {
		return org_name;
	}

	public void setOrg_name(String org_name) {
		this.org_name = org_name;
	}

	public String getSo_brand() {
		return so_brand;
	}

	public void setSo_brand(String so_brand) {
		this.so_brand = so_brand;
	}

	public String getSo_brand_nameref() {
		if (StringUtils.isNotBlank(this.getSo_brand())) {
			so_brand_nameref = BaseDataDetailValueCache.getInstance().getName(
					BaseDataTypeCodeConstant.type_1058, this.getSo_brand());
		}
		return so_brand_nameref;
	}

	public void setSo_brand_nameref(String so_brand_nameref) {
		this.so_brand_nameref = so_brand_nameref;
	}

}

