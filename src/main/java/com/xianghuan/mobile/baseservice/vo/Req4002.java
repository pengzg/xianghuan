package com.xianghuan.mobile.baseservice.vo;

import com.xianghuan.util.ReqBaseBean;

public class Req4002 extends ReqBaseBean{

	/**
	 * 
	 */
	private static final long serialVersionUID = -4605554291724353052L;

	
	private String lng;
	
	private String lat;
	
	private String categoryCode;

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

	public String getCategoryCode() {
		return categoryCode;
	}

	public void setCategoryCode(String categoryCode) {
		this.categoryCode = categoryCode;
	}
}
