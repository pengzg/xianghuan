package com.xianghuan.admin.basetag.model;


public class BaseTag implements java.io.Serializable{
	private static final long serialVersionUID = 5454155825314635342L;
	
	//columns START111
	//主键	
	private Integer bt_id;
	//标签名称	
	private String bt_title;
	//标签编码	
	private String bt_code;
	//标签类型 1-用户 2-房子 	
	private String bt_type;
	//图标	
	private String bt_icon;
	//1在前台显示 2 不在前台显示	
	private Integer bt_is_show;
	//标签排序	
	private Integer bt_order;
	//添加人	
	private Integer bt_adduserid;
	//标签状态 1-启用 0-禁用	
	private String bt_status;
	//删除标识位	
	private Integer bt_dr;
	//创建时间	
	private String bt_addtime;
	//修改时间	
	private String bt_updatetime;
	//columns END

	public void setBt_id(Integer bt_id) {
		this.bt_id = bt_id;
	}
	
	public Integer getBt_id() {
		return this.bt_id;
	}
	public void setBt_title(String bt_title) {
		this.bt_title = bt_title;
	}
	
	public String getBt_title() {
		return this.bt_title;
	}
	public void setBt_code(String bt_code) {
		this.bt_code = bt_code;
	}
	
	public String getBt_code() {
		return this.bt_code;
	}
	public void setBt_type(String bt_type) {
		this.bt_type = bt_type;
	}
	
	public String getBt_type() {
		return this.bt_type;
	}
	public void setBt_icon(String bt_icon) {
		this.bt_icon = bt_icon;
	}
	
	public String getBt_icon() {
		return this.bt_icon;
	}
	public void setBt_is_show(Integer bt_is_show) {
		this.bt_is_show = bt_is_show;
	}
	
	public Integer getBt_is_show() {
		return this.bt_is_show;
	}
	public void setBt_order(Integer bt_order) {
		this.bt_order = bt_order;
	}
	
	public Integer getBt_order() {
		return this.bt_order;
	}
	public void setBt_adduserid(Integer bt_adduserid) {
		this.bt_adduserid = bt_adduserid;
	}
	
	public Integer getBt_adduserid() {
		return this.bt_adduserid;
	}
	public void setBt_status(String bt_status) {
		this.bt_status = bt_status;
	}
	
	public String getBt_status() {
		return this.bt_status;
	}
	public void setBt_dr(Integer bt_dr) {
		this.bt_dr = bt_dr;
	}
	
	public Integer getBt_dr() {
		return this.bt_dr;
	}
	public void setBt_addtime(String bt_addtime) {
		this.bt_addtime = bt_addtime;
	}
	
	public String getBt_addtime() {
		return this.bt_addtime;
	}
	public void setBt_updatetime(String bt_updatetime) {
		this.bt_updatetime = bt_updatetime;
	}
	
	public String getBt_updatetime() {
		return this.bt_updatetime;
	}

}

