package com.xianghuan.mobile.user.vo;

import com.xianghuan.util.ReqBaseBean;

public class Req2001 extends ReqBaseBean{

	/**
	 * 
	 */
	private static final long serialVersionUID = 407700845360753589L;

	private String mobile;
	
	private String sms_code;
	
	private String spread_code;

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getSms_code() {
		return sms_code;
	}

	public void setSms_code(String sms_code) {
		this.sms_code = sms_code;
	}

	public String getSpread_code() {
		return spread_code;
	}

	public void setSpread_code(String spread_code) {
		this.spread_code = spread_code;
	}
}
