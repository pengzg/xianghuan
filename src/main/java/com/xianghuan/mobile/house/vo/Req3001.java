package com.xianghuan.mobile.house.vo;

import java.math.BigDecimal;

import com.xianghuan.util.ReqBaseBean;

public class Req3001 extends ReqBaseBean{

	/**
	 * 
	 */
	private static final long serialVersionUID = -2147641102758353268L;
	
	//类型 对应字典	
	private Integer hb_rent_type;
	//标题	
	private String hb_title;
	//简介	
	private String hb_summary;
	//介绍	
	private String hb_intro;
	//主图	
	private String hb_cover;
	//户型 对应字典	
	private Integer hb_house_type;
	//房屋总面积	
	private Integer hb_house_area;
	//联系电话	
	private String hb_contacts_mobile;
	//房间类型	
	private Integer hb_room_type;
	//房间面积	
	private Integer hb_room_area;
	//联系人姓名	
	private String hb_contacts_name;
	//地址	
	private String hb_address;
	//价格	
	private BigDecimal hb_price;
	//价格区间 
	private Integer hb_price_range;
	//经度	
	private String hb_lng;
	//纬度 	
	private String hb_lat;

	//标签	
	private String hb_tag_str;
	
	private String imgStr;

	public Integer getHb_rent_type() {
		return hb_rent_type;
	}

	public void setHb_rent_type(Integer hb_rent_type) {
		this.hb_rent_type = hb_rent_type;
	}

	public String getHb_title() {
		return hb_title;
	}

	public void setHb_title(String hb_title) {
		this.hb_title = hb_title;
	}

	public String getHb_summary() {
		return hb_summary;
	}

	public void setHb_summary(String hb_summary) {
		this.hb_summary = hb_summary;
	}

	public String getHb_intro() {
		return hb_intro;
	}

	public void setHb_intro(String hb_intro) {
		this.hb_intro = hb_intro;
	}

	public String getHb_cover() {
		return hb_cover;
	}

	public void setHb_cover(String hb_cover) {
		this.hb_cover = hb_cover;
	}

	public Integer getHb_house_type() {
		return hb_house_type;
	}

	public void setHb_house_type(Integer hb_house_type) {
		this.hb_house_type = hb_house_type;
	}

	public Integer getHb_house_area() {
		return hb_house_area;
	}

	public void setHb_house_area(Integer hb_house_area) {
		this.hb_house_area = hb_house_area;
	}

	public String getHb_contacts_mobile() {
		return hb_contacts_mobile;
	}

	public void setHb_contacts_mobile(String hb_contacts_mobile) {
		this.hb_contacts_mobile = hb_contacts_mobile;
	}

	public Integer getHb_room_type() {
		return hb_room_type;
	}

	public void setHb_room_type(Integer hb_room_type) {
		this.hb_room_type = hb_room_type;
	}

	public Integer getHb_room_area() {
		return hb_room_area;
	}

	public void setHb_room_area(Integer hb_room_area) {
		this.hb_room_area = hb_room_area;
	}

	public String getHb_contacts_name() {
		return hb_contacts_name;
	}

	public void setHb_contacts_name(String hb_contacts_name) {
		this.hb_contacts_name = hb_contacts_name;
	}


	public String getHb_address() {
		return hb_address;
	}

	public void setHb_address(String hb_address) {
		this.hb_address = hb_address;
	}

	public BigDecimal getHb_price() {
		return hb_price;
	}

	public void setHb_price(BigDecimal hb_price) {
		this.hb_price = hb_price;
	}

	public Integer getHb_price_range() {
		return hb_price_range;
	}

	public void setHb_price_range(Integer hb_price_range) {
		this.hb_price_range = hb_price_range;
	}

	public String getHb_lng() {
		return hb_lng;
	}

	public void setHb_lng(String hb_lng) {
		this.hb_lng = hb_lng;
	}

	public String getHb_lat() {
		return hb_lat;
	}

	public void setHb_lat(String hb_lat) {
		this.hb_lat = hb_lat;
	}

	public String getHb_tag_str() {
		return hb_tag_str;
	}

	public void setHb_tag_str(String hb_tag_str) {
		this.hb_tag_str = hb_tag_str;
	}

	public String getImgStr() {
		return imgStr;
	}

	public void setImgStr(String imgStr) {
		this.imgStr = imgStr;
	}
	
}
