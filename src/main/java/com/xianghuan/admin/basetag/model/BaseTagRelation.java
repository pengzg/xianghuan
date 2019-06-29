package com.xianghuan.admin.basetag.model;


public class BaseTagRelation implements java.io.Serializable{
	private static final long serialVersionUID = 5454155825314635342L;
	
	//columns START111
	//主键	
	private Integer btr_id;
	//类型 1用户 2房子	
	private Integer btr_type;
	//类型id	
	private Integer btr_typeid;
	//标签id	
	private Integer btr_btid;
	//状态	
	private Integer btr_state;
	//删除标记位	
	private Integer btr_dr;
	//添加时间	
	private String btr_addtime;
	//更新时间	
	private String btr_updatetime;
	//columns END

	public void setBtr_id(Integer btr_id) {
		this.btr_id = btr_id;
	}
	
	public Integer getBtr_id() {
		return this.btr_id;
	}
	public void setBtr_type(Integer btr_type) {
		this.btr_type = btr_type;
	}
	
	public Integer getBtr_type() {
		return this.btr_type;
	}
	public void setBtr_typeid(Integer btr_typeid) {
		this.btr_typeid = btr_typeid;
	}
	
	public Integer getBtr_typeid() {
		return this.btr_typeid;
	}
	public void setBtr_btid(Integer btr_btid) {
		this.btr_btid = btr_btid;
	}
	
	public Integer getBtr_btid() {
		return this.btr_btid;
	}
	public void setBtr_state(Integer btr_state) {
		this.btr_state = btr_state;
	}
	
	public Integer getBtr_state() {
		return this.btr_state;
	}
	public void setBtr_dr(Integer btr_dr) {
		this.btr_dr = btr_dr;
	}
	
	public Integer getBtr_dr() {
		return this.btr_dr;
	}
	public void setBtr_addtime(String btr_addtime) {
		this.btr_addtime = btr_addtime;
	}
	
	public String getBtr_addtime() {
		return this.btr_addtime;
	}
	public void setBtr_updatetime(String btr_updatetime) {
		this.btr_updatetime = btr_updatetime;
	}
	
	public String getBtr_updatetime() {
		return this.btr_updatetime;
	}

}

