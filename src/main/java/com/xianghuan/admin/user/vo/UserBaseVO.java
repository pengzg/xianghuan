package com.xianghuan.admin.user.vo;

import com.xianghuan.auth.base.cache.BaseDataDetailValueCache;
import com.xianghuan.util.BaseDataTypeCodeConstant;

public class UserBaseVO implements java.io.Serializable{
	private static final long serialVersionUID = 5454155825314635342L;
	
	//columns START111
	//	
	private Integer ub_id;
	//用户真实姓名	
	private String ub_realname;
	//用户类型	
	private Integer ub_usertype;
	private String ub_usertype_nameref;
	//	
	private String ub_username;
	//头像	
	private String ub_image;
	//	
	private String ub_mobile;
	//经度	
	private String ub_lng;
	//纬度	
	private String ub_lat;
	//微信openid	
	private String ub_openid;
	//	
	private String ub_unionid;
	//邮件	
	private String ub_email;
	//性别 	
	private String ub_sex;
	//	
	private String ub_last_logintime;
	//注册时间	
	private String ub_regtime;
	//用户来源 1安卓  2ios	
	private Integer ub_source;
	//	
	private String ub_birthday;
	private String ub_pinyin;
	//	
	private Integer ub_status;
	//	
	private Integer ub_dr;
	//	
	private String ub_addtime;
	//	
	private String ub_updatetime;
	// 推广码
	private String ub_spreadcode;
	// 推广人
	private Integer ub_spread;
	//columns END


	public void setUb_id(Integer ub_id) {
		this.ub_id = ub_id;
	}
	
	public Integer getUb_id() {
		return this.ub_id;
	}
	public void setUb_realname(String ub_realname) {
		this.ub_realname = ub_realname;
	}
	
	public String getUb_realname() {
		return this.ub_realname;
	}
	public void setUb_usertype(Integer ub_usertype) {
		this.ub_usertype = ub_usertype;
	}
	
	public Integer getUb_usertype() {
		return this.ub_usertype;
	}
	public void setUb_username(String ub_username) {
		this.ub_username = ub_username;
	}
	
	public String getUb_username() {
		return this.ub_username;
	}
	public void setUb_image(String ub_image) {
		this.ub_image = ub_image;
	}
	
	public String getUb_image() {
		return this.ub_image;
	}
	public void setUb_mobile(String ub_mobile) {
		this.ub_mobile = ub_mobile;
	}
	
	public String getUb_mobile() {
		return this.ub_mobile;
	}
	public void setUb_lng(String ub_lng) {
		this.ub_lng = ub_lng;
	}
	
	public String getUb_lng() {
		return this.ub_lng;
	}
	public void setUb_lat(String ub_lat) {
		this.ub_lat = ub_lat;
	}
	
	public String getUb_lat() {
		return this.ub_lat;
	}
	public void setUb_openid(String ub_openid) {
		this.ub_openid = ub_openid;
	}
	
	public String getUb_openid() {
		return this.ub_openid;
	}
	public void setUb_unionid(String ub_unionid) {
		this.ub_unionid = ub_unionid;
	}
	
	public String getUb_unionid() {
		return this.ub_unionid;
	}
	public void setUb_email(String ub_email) {
		this.ub_email = ub_email;
	}
	
	public String getUb_email() {
		return this.ub_email;
	}
	public void setUb_sex(String ub_sex) {
		this.ub_sex = ub_sex;
	}
	
	public String getUb_sex() {
		return this.ub_sex;
	}
	public void setUb_last_logintime(String ub_last_logintime) {
		this.ub_last_logintime = ub_last_logintime;
	}
	
	public String getUb_last_logintime() {
		return this.ub_last_logintime;
	}
	public void setUb_regtime(String ub_regtime) {
		this.ub_regtime = ub_regtime;
	}
	
	public String getUb_regtime() {
		return this.ub_regtime;
	}
	public void setUb_source(Integer ub_source) {
		this.ub_source = ub_source;
	}
	
	public Integer getUb_source() {
		return this.ub_source;
	}
	public void setUb_pinyin(String ub_pinyin) {
		this.ub_pinyin = ub_pinyin;
	}
	
	public String getUb_pinyin() {
		return this.ub_pinyin;
	}
	public void setUb_status(Integer ub_status) {
		this.ub_status = ub_status;
	}
	
	public Integer getUb_status() {
		return this.ub_status;
	}
	public void setUb_dr(Integer ub_dr) {
		this.ub_dr = ub_dr;
	}
	
	public Integer getUb_dr() {
		return this.ub_dr;
	}
	public void setUb_addtime(String ub_addtime) {
		this.ub_addtime = ub_addtime;
	}
	
	public String getUb_addtime() {
		return this.ub_addtime;
	}
	public void setUb_updatetime(String ub_updatetime) {
		this.ub_updatetime = ub_updatetime;
	}
	
	public String getUb_updatetime() {
		return this.ub_updatetime;
	}

	public String getUb_usertype_nameref() {
		if (getUb_usertype() != null) {
			ub_usertype_nameref = BaseDataDetailValueCache.getInstance().getName(BaseDataTypeCodeConstant.type_1002 , getUb_usertype()+"");
		}
		return ub_usertype_nameref;
	}

	public void setUb_usertype_nameref(String ub_usertype_nameref) {
		this.ub_usertype_nameref = ub_usertype_nameref;
	}

	public String getUb_birthday() {
		return ub_birthday;
	}

	public void setUb_birthday(String ub_birthday) {
		this.ub_birthday = ub_birthday;
	}

	public String getUb_spreadcode() {
		return ub_spreadcode;
	}

	public void setUb_spreadcode(String ub_spreadcode) {
		this.ub_spreadcode = ub_spreadcode;
	}

	public Integer getUb_spread() {
		return ub_spread;
	}

	public void setUb_spread(Integer ub_spread) {
		this.ub_spread = ub_spread;
	}

}

