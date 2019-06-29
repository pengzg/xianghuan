package com.xianghuan.admin.baseservice.model;


public class BaseService implements java.io.Serializable{
	private static final long serialVersionUID = 5454155825314635342L;
	
	//columns START111
	//自增id	
	private Integer bs_id;
	//类别id	
	private String bs_categoryid;
	//类别编码	
	private String bs_categorycode;
	//名称	
	private String bs_name;
	//电话	
	private String bs_mobile;
	//	联系人姓名 
	private String bs_contact_name;
	//地址	
	private String bs_address;
	//图片	
	private String bs_image;
	//拨打数量	
	private Integer bs_clicknum;
	//经度	
	private String bs_lng;
	// 纬度	
	private String bs_lat;
	//简介 	
	private String bs_intro;
	//评价星级	
	private Integer bs_star;
	//备注	
	private String bs_note;
	//工作时间	
	private String bs_officehour;
	//状态 	
	private Integer bs_state;
	//删除标记位	
	private Integer bs_dr;
	//添加时间	
	private String bs_addtime;
	//更新时间	
	private String bs_updatetime;
	// 排序
	private Integer bs_vieworder;
	
	//columns END

	public void setBs_id(Integer bs_id) {
		this.bs_id = bs_id;
	}
	
	public Integer getBs_id() {
		return this.bs_id;
	}
	public void setBs_categoryid(String bs_categoryid) {
		this.bs_categoryid = bs_categoryid;
	}
	
	public String getBs_categoryid() {
		return this.bs_categoryid;
	}
	public void setBs_categorycode(String bs_categorycode) {
		this.bs_categorycode = bs_categorycode;
	}
	
	public String getBs_categorycode() {
		return this.bs_categorycode;
	}
	public void setBs_name(String bs_name) {
		this.bs_name = bs_name;
	}
	
	public String getBs_name() {
		return this.bs_name;
	}
	public void setBs_mobile(String bs_mobile) {
		this.bs_mobile = bs_mobile;
	}
	
	public String getBs_mobile() {
		return this.bs_mobile;
	}
	public void setBs_contact_name(String bs_contact_name) {
		this.bs_contact_name = bs_contact_name;
	}
	
	public String getBs_contact_name() {
		return this.bs_contact_name;
	}
	public void setBs_address(String bs_address) {
		this.bs_address = bs_address;
	}
	
	public String getBs_address() {
		return this.bs_address;
	}
	public void setBs_image(String bs_image) {
		this.bs_image = bs_image;
	}
	
	public String getBs_image() {
		return this.bs_image;
	}
	public void setBs_clicknum(Integer bs_clicknum) {
		this.bs_clicknum = bs_clicknum;
	}
	
	public Integer getBs_clicknum() {
		return this.bs_clicknum;
	}
	public void setBs_lng(String bs_lng) {
		this.bs_lng = bs_lng;
	}
	
	public String getBs_lng() {
		return this.bs_lng;
	}
	public void setBs_lat(String bs_lat) {
		this.bs_lat = bs_lat;
	}
	
	public String getBs_lat() {
		return this.bs_lat;
	}
	public void setBs_intro(String bs_intro) {
		this.bs_intro = bs_intro;
	}
	
	public String getBs_intro() {
		return this.bs_intro;
	}
	public void setBs_star(Integer bs_star) {
		this.bs_star = bs_star;
	}
	
	public Integer getBs_star() {
		return this.bs_star;
	}
	public void setBs_note(String bs_note) {
		this.bs_note = bs_note;
	}
	
	public String getBs_note() {
		return this.bs_note;
	}
	public void setBs_officehour(String bs_officehour) {
		this.bs_officehour = bs_officehour;
	}
	
	public String getBs_officehour() {
		return this.bs_officehour;
	}
	public void setBs_state(Integer bs_state) {
		this.bs_state = bs_state;
	}
	
	public Integer getBs_state() {
		return this.bs_state;
	}
	public void setBs_dr(Integer bs_dr) {
		this.bs_dr = bs_dr;
	}
	
	public Integer getBs_dr() {
		return this.bs_dr;
	}
	public void setBs_addtime(String bs_addtime) {
		this.bs_addtime = bs_addtime;
	}
	
	public String getBs_addtime() {
		return this.bs_addtime;
	}
	public void setBs_updatetime(String bs_updatetime) {
		this.bs_updatetime = bs_updatetime;
	}
	
	public String getBs_updatetime() {
		return this.bs_updatetime;
	}

	public Integer getBs_vieworder() {
		return bs_vieworder;
	}

	public void setBs_vieworder(Integer bs_vieworder) {
		this.bs_vieworder = bs_vieworder;
	}

}

