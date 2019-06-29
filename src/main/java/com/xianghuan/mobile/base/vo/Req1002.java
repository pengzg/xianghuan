package com.xianghuan.mobile.base.vo;

import com.xianghuan.util.ReqBaseBean;

public class Req1002 extends ReqBaseBean{

	/**
	 * 
	 */
	private static final long serialVersionUID = -4603302948893114622L;
	
	// 图片类型  1 用户  2 房子
	private Integer type;
	// 图片字符 串 base64加密后的
	private String imgStr;


	public String getImgStr() {
		return imgStr;
	}


	public void setImgStr(String imgStr) {
		this.imgStr = imgStr;
	}


	public Integer getType() {
		return type;
	}


	public void setType(Integer type) {
		this.type = type;
	}
}
