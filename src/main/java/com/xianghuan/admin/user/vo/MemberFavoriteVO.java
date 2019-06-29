package com.xianghuan.admin.user.vo;


public class MemberFavoriteVO implements java.io.Serializable{
	private static final long serialVersionUID = 5454155825314635342L;
	
	//columns START111
	//主键	
	private Integer mf_id;
	//用户主键	
	private Integer mf_member_id;
	//关注类型 1用户，2房源	
	private Integer mf_favorite_type;
	//关注主键	
	private String mf_favoriteid;
	//请求url	
	private String mf_url;
	//状态标志位 1未删除，0删除	
	private Integer mf_dr;
	//1：正常，2：禁用	
	private Integer mf_status;
	//添加时间	
	private String mf_add_time;
	//更新时间	
	private String mf_update_time;
	//columns END

	public void setMf_id(Integer mf_id) {
		this.mf_id = mf_id;
	}
	
	public Integer getMf_id() {
		return this.mf_id;
	}
	public void setMf_member_id(Integer mf_member_id) {
		this.mf_member_id = mf_member_id;
	}
	
	public Integer getMf_member_id() {
		return this.mf_member_id;
	}
	public void setMf_favorite_type(Integer mf_favorite_type) {
		this.mf_favorite_type = mf_favorite_type;
	}
	
	public Integer getMf_favorite_type() {
		return this.mf_favorite_type;
	}
	public void setMf_favoriteid(String mf_favoriteid) {
		this.mf_favoriteid = mf_favoriteid;
	}
	
	public String getMf_favoriteid() {
		return this.mf_favoriteid;
	}
	public void setMf_url(String mf_url) {
		this.mf_url = mf_url;
	}
	
	public String getMf_url() {
		return this.mf_url;
	}
	public void setMf_dr(Integer mf_dr) {
		this.mf_dr = mf_dr;
	}
	
	public Integer getMf_dr() {
		return this.mf_dr;
	}
	public void setMf_status(Integer mf_status) {
		this.mf_status = mf_status;
	}
	
	public Integer getMf_status() {
		return this.mf_status;
	}
	public void setMf_add_time(String mf_add_time) {
		this.mf_add_time = mf_add_time;
	}
	
	public String getMf_add_time() {
		return this.mf_add_time;
	}
	public void setMf_update_time(String mf_update_time) {
		this.mf_update_time = mf_update_time;
	}
	
	public String getMf_update_time() {
		return this.mf_update_time;
	}

}

