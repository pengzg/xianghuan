package com.xianghuan.mobile.base.vo;

import com.xianghuan.util.ReqBaseBean;

public class Req1001 extends ReqBaseBean{

	/**
	 * 
	 */
	private static final long serialVersionUID = -8724419541002641727L;

	// 手机号
	private String mobile;
	
	// 
	private String smsType;
	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getSmsType() {
		return smsType;
	}

	public void setSmsType(String smsType) {
		this.smsType = smsType;
	}
}
