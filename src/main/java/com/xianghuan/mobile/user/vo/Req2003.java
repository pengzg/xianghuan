package com.xianghuan.mobile.user.vo;

import com.xianghuan.util.ReqBaseBean;

public class Req2003 extends ReqBaseBean{

	/**
	 * 
	 */
	private static final long serialVersionUID = -4783419235490753496L;

	// 1用户 2房源
	private Integer type;
	// id
	private String typeid;
	// Y收藏  N取消收藏 
	private String  isFavorite;
	
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public String getTypeid() {
		return typeid;
	}
	public void setTypeid(String typeid) {
		this.typeid = typeid;
	}
	public String getIsFavorite() {
		return isFavorite;
	}
	public void setIsFavorite(String isFavorite) {
		this.isFavorite = isFavorite;
	}
}
