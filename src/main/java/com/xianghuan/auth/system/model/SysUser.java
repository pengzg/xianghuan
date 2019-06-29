package com.xianghuan.auth.system.model;

import org.apache.commons.lang.StringUtils;

import com.xianghuan.auth.base.cache.BaseDataDetailValueCache;
import com.xianghuan.auth.system.cache.SysUserUnityCache;
import com.xianghuan.util.BaseDataTypeCodeConstant;

/**
 * @ClassName: SysUser
 * @Description: 用户管理VO
 * @author feizhang
 * @date 2014年6月18日 下午1:41:23
 */
public class SysUser implements java.io.Serializable {

	private static final long serialVersionUID = 5454155825314635342L;

	// columns START
	private String su_id;
	//登陆账号
	private String su_loginname;
	//用户名
	private String su_name;
	//密码 
	private String su_pwd;
	//性别
	private String su_sex;
	private String su_sex_nameref;
	//邮箱
	private String su_email;
	//归属部门
	private String su_orgid;
	private String su_orgid_nameref;
	//状态
	private String su_status;
	private String su_status_nameref;
	private String su_startdate;
	private String su_enddate;
	//用户类型
	private String su_usertype;
	private String su_usertype_nameref;
	//用户角色
	private String su_role;//1管理员2业务员
	private String su_role_nameref;
	private String su_createdatetime;
	private String su_modifydatetime;
	private Integer su_version;
	private Integer su_errornum;
	private String su_lastlogindata;
	private Integer su_dr;
	private String su_ts;
	//用户电话
	private String su_phone;
	
	private String su_headimgurl;
	private String su_openid;
	
	private String su_userid; //用户ID
	private String su_userid_nameref; //
	private String su_pay_pwd; // 支付密码
	private String su_procice;// 
	private String su_city;// 
	private String su_district;// 
	private String su_wx;
	private String su_qq;// 
	private String su_wb;// 
	private String su_wxid;
	private String su_token;
	private String su_address;
	private String su_isauth;//认证
	private String su_isauth_nameref;
	private String su_storeid;// 店铺
	private String su_communityid;//社区ID
	private String su_communityid_nameref;//社区ID

	public String getSu_pay_pwd() {
		return su_pay_pwd;
	}

	public void setSu_pay_pwd(String su_pay_pwd) {
		this.su_pay_pwd = su_pay_pwd;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public void setSu_id(String value) {
		this.su_id = value;
	}

	public String getSu_id() {
		return this.su_id;
	}

	public void setSu_loginname(String value) {
		this.su_loginname = value;
	}

	public String getSu_loginname() {
		return this.su_loginname;
	}

	public void setSu_name(String value) {
		this.su_name = value;
	}

	public String getSu_name() {
		return this.su_name;
	}

	public void setSu_pwd(String value) {
		this.su_pwd = value;
	}

	public String getSu_pwd() {
		return this.su_pwd;
	}

	public void setSu_sex(String value) {
		this.su_sex = value;
	}

	public String getSu_sex() {
		return this.su_sex;
	}

	public void setSu_email(String value) {
		this.su_email = value;
	}

	public String getSu_email() {
		return this.su_email;
	}


	public void setSu_startdate(String value) {
		this.su_startdate = value;
	}

	public String getSu_startdate() {
		return this.su_startdate;
	}

	public void setSu_enddate(String value) {
		this.su_enddate = value;
	}

	public String getSu_enddate() {
		return this.su_enddate;
	}

	public void setSu_createdatetime(String value) {
		this.su_createdatetime = value;
	}

	public String getSu_createdatetime() {
		return this.su_createdatetime;
	}

	public void setSu_modifydatetime(String value) {
		this.su_modifydatetime = value;
	}

	public String getSu_modifydatetime() {
		return this.su_modifydatetime;
	}

	public void setSu_version(Integer value) {
		this.su_version = value;
	}

	public Integer getSu_version() {
		return this.su_version;
	}

	public void setSu_errornum(Integer value) {
		this.su_errornum = value;
	}

	public Integer getSu_errornum() {
		return this.su_errornum;
	}

	public void setSu_lastlogindata(String value) {
		this.su_lastlogindata = value;
	}

	public String getSu_lastlogindata() {
		return this.su_lastlogindata;
	}

	public void setSu_dr(Integer value) {
		this.su_dr = value;
	}

	public Integer getSu_dr() {
		return this.su_dr;
	}

	public void setSu_ts(String value) {
		this.su_ts = value;
	}

	public String getSu_ts() {
		return this.su_ts;
	}


	public void setSu_usertype(String su_usertype) {
		this.su_usertype = su_usertype;
	}

	public String getSu_usertype() {
		return su_usertype;
	}


	public String getSu_phone() {
		return su_phone;
	}

	public void setSu_phone(String su_phone) {
		this.su_phone = su_phone;
	}

	public String getSu_usertype_nameref() {
		return su_usertype_nameref;
	}

	public void setSu_usertype_nameref(String su_usertype_nameref) {
		this.su_usertype_nameref = su_usertype_nameref;
	}

	public String getSu_orgid() {
		return su_orgid;
	}

	public void setSu_orgid(String su_orgid) {
		this.su_orgid = su_orgid;
	}

	public String getSu_status() {
		return su_status;
	}

	public void setSu_status(String su_status) {
		this.su_status = su_status;
	}

	public String getSu_role() {
		return su_role;
	}

	public void setSu_role(String su_role) {
		this.su_role = su_role;
	}

	public String getSu_role_nameref() {
		if (StringUtils.isNotBlank(this.getSu_role()))
			su_role_nameref = BaseDataDetailValueCache.getInstance()
					.getName(BaseDataTypeCodeConstant.type_2001,
							this.getSu_role());
		return su_role_nameref;
	}

	public void setSu_role_nameref(String su_role_nameref) {
		this.su_role_nameref = su_role_nameref;
	}

	public String getSu_userid() {
		return su_userid;
	}

	public void setSu_userid(String su_userid) {
		this.su_userid = su_userid;
	}

	public String getSu_userid_nameref() {
		if (StringUtils.isNotBlank(this.getSu_userid())) {
			su_userid_nameref = SysUserUnityCache.getInstance().getName(
					this.getSu_userid());
		}
		return su_userid_nameref;
	}

	public void setSu_userid_nameref(String su_userid_nameref) {
		this.su_userid_nameref = su_userid_nameref;
	}

	public String getSu_procice() {
		return su_procice;
	}

	public void setSu_procice(String su_procice) {
		this.su_procice = su_procice;
	}

	public String getSu_city() {
		return su_city;
	}

	public void setSu_city(String su_city) {
		this.su_city = su_city;
	}

	public String getSu_district() {
		return su_district;
	}

	public void setSu_district(String su_district) {
		this.su_district = su_district;
	}

	public String getSu_wx() {
		return su_wx;
	}

	public void setSu_wx(String su_wx) {
		this.su_wx = su_wx;
	}

	public String getSu_qq() {
		return su_qq;
	}

	public void setSu_qq(String su_qq) {
		this.su_qq = su_qq;
	}

	public String getSu_wb() {
		return su_wb;
	}

	public void setSu_wb(String su_wb) {
		this.su_wb = su_wb;
	}

	public String getSu_wxid() {
		return su_wxid;
	}

	public void setSu_wxid(String su_wxid) {
		this.su_wxid = su_wxid;
	}

	public String getSu_token() {
		return su_token;
	}

	public void setSu_token(String su_token) {
		this.su_token = su_token;
	}

	public String getSu_address() {
		return su_address;
	}

	public void setSu_address(String su_address) {
		this.su_address = su_address;
	}

	public String getSu_orgid_nameref() {
	// 	if (StringUtils.isNotBlank(this.getSu_orgid()))
	// 		su_orgid_nameref = SystemOrgCache.getInstance().getName(
	// 				this.getSu_orgid());
		return su_orgid_nameref;
	}

	public void setSu_orgid_nameref(String su_orgid_nameref) {
		this.su_orgid_nameref = su_orgid_nameref;
	}

	public String getSu_status_nameref() {
		if (StringUtils.isNotBlank(this.getSu_status()))
			su_status_nameref = BaseDataDetailValueCache.getInstance()
					.getName(BaseDataTypeCodeConstant.type_2006,
							this.getSu_status());
		return su_status_nameref;
	}

	public void setSu_status_nameref(String su_status_nameref) {
		this.su_status_nameref = su_status_nameref;
	}

	public String getSu_sex_nameref() {
		if (StringUtils.isNotBlank(this.getSu_sex()))
			su_sex_nameref = BaseDataDetailValueCache.getInstance()
					.getName(BaseDataTypeCodeConstant.type_2017,
							this.getSu_sex());
		return su_sex_nameref;
	}

	public void setSu_sex_nameref(String su_sex_nameref) {
		this.su_sex_nameref = su_sex_nameref;
	}

	public String getSu_isauth() {
		return su_isauth;
	}

	public void setSu_isauth(String su_isauth) {
		this.su_isauth = su_isauth;
	}

	public String getSu_isauth_nameref() {
		if (StringUtils.isNotBlank(this.getSu_isauth()))
			su_isauth_nameref = BaseDataDetailValueCache.getInstance()
					.getName(BaseDataTypeCodeConstant.type_1005,
							this.getSu_isauth());
		return su_isauth_nameref;
	}

	public void setSu_isauth_nameref(String su_isauth_nameref) {
		this.su_isauth_nameref = su_isauth_nameref;
	}

	public String getSu_storeid() {
		return su_storeid;
	}

	public void setSu_storeid(String su_storeid) {
		this.su_storeid = su_storeid;
	}

	public String getSu_communityid() {
		return su_communityid;
	}

	public void setSu_communityid(String su_communityid) {
		this.su_communityid = su_communityid;
	}

	public String getSu_communityid_nameref() {
		if (StringUtils.isNotBlank(this.getSu_communityid())) {
			su_communityid_nameref = SysUserUnityCache.getInstance().getName(
					this.getSu_communityid());
		}
		return su_communityid_nameref;
	}

	public void setSu_communityid_nameref(String su_communityid_nameref) {
		this.su_communityid_nameref = su_communityid_nameref;
	}

	public String getSu_headimgurl() {
		return su_headimgurl;
	}

	public void setSu_headimgurl(String su_headimgurl) {
		this.su_headimgurl = su_headimgurl;
	}

	public String getSu_openid() {
		return su_openid;
	}

	public void setSu_openid(String su_openid) {
		this.su_openid = su_openid;
	}

}
