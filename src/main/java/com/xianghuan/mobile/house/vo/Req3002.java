package com.xianghuan.mobile.house.vo;

import com.xianghuan.util.ReqBaseBean;

public class Req3002 extends ReqBaseBean{

	/**
	 * 
	 */
	private static final long serialVersionUID = -2592821994680190385L;

	// 经纬度
	private String lng;
	private String lat;
	// 标签
	private String tag_str;
	// 房间类型
	private String room_type_str;
	// 租房类型
	private String rent_type_str;
	// 地址
	private String address;
	// 价格区间
	private String price_range_str;
	// 距离
	private String distance_range;
	
	private String searchKey;
	
	public String getLng() {
		return lng;
	}
	public void setLng(String lng) {
		this.lng = lng;
	}
	public String getLat() {
		return lat;
	}
	public void setLat(String lat) {
		this.lat = lat;
	}
	public String getTag_str() {
		return tag_str;
	}
	public void setTag_str(String tag_str) {
		this.tag_str = tag_str;
	}
	public String getRoom_type_str() {
		return room_type_str;
	}
	public void setRoom_type_str(String room_type_str) {
		this.room_type_str = room_type_str;
	}
	public String getRent_type_str() {
		return rent_type_str;
	}
	public void setRent_type_str(String rent_type_str) {
		this.rent_type_str = rent_type_str;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	public String getDistance_range() {
		return distance_range;
	}
	public void setDistance_range(String distance_range) {
		this.distance_range = distance_range;
	}
	public String getPrice_range_str() {
		return price_range_str;
	}
	public void setPrice_range_str(String price_range_str) {
		this.price_range_str = price_range_str;
	}
	public String getSearchKey() {
		return searchKey;
	}
	public void setSearchKey(String searchKey) {
		this.searchKey = searchKey;
	}
	
	
	
	
	
	
}
