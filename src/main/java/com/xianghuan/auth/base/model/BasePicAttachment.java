package com.xianghuan.auth.base.model;


public class BasePicAttachment implements java.io.Serializable{
	private static final long serialVersionUID = 5454155825314635342L;
	
	//columns START111
	//自增id	
	private String bpa_id;
	//所属公司	
	private Long bpa_orgid;
	//商品图片标题	
	private String bpa_tittle;
	//路径	
	private String bpa_path;
	//类型（0-其他；1-图片；2-视频）	
	private Integer bpa_type;
	//附件尺寸	
	private Integer bpa_size;
	//原始文件名称	
	private String bpa_file_name;
	//附件描述	
	private String bpa_description;
	//状态	
	private Integer bpa_status;
	//添加时间	
	private String bpa_add_time;
	//上传用户id	
	private String bpa_adduserid;
	//	
	private String bpa_dr;
	//columns END

	public void setBpa_id(String bpa_id) {
		this.bpa_id = bpa_id;
	}
	
	public String getBpa_id() {
		return this.bpa_id;
	}
	public void setBpa_orgid(Long bpa_orgid) {
		this.bpa_orgid = bpa_orgid;
	}
	
	public Long getBpa_orgid() {
		return this.bpa_orgid;
	}
	public void setBpa_tittle(String bpa_tittle) {
		this.bpa_tittle = bpa_tittle;
	}
	
	public String getBpa_tittle() {
		return this.bpa_tittle;
	}
	public void setBpa_path(String bpa_path) {
		this.bpa_path = bpa_path;
	}
	
	public String getBpa_path() {
		return this.bpa_path;
	}
	
	public void setBpa_size(Integer bpa_size) {
		this.bpa_size = bpa_size;
	}
	
	public Integer getBpa_size() {
		return this.bpa_size;
	}
	public void setBpa_file_name(String bpa_file_name) {
		this.bpa_file_name = bpa_file_name;
	}
	
	public String getBpa_file_name() {
		return this.bpa_file_name;
	}
	public void setBpa_description(String bpa_description) {
		this.bpa_description = bpa_description;
	}
	
	public String getBpa_description() {
		return this.bpa_description;
	}
	
	public void setBpa_add_time(String bpa_add_time) {
		this.bpa_add_time = bpa_add_time;
	}
	
	public String getBpa_add_time() {
		return this.bpa_add_time;
	}
	public void setBpa_adduserid(String bpa_adduserid) {
		this.bpa_adduserid = bpa_adduserid;
	}
	
	public String getBpa_adduserid() {
		return this.bpa_adduserid;
	}

	public Integer getBpa_status() {
		return bpa_status;
	}

	public void setBpa_status(Integer bpa_status) {
		this.bpa_status = bpa_status;
	}

	public String getBpa_dr() {
		return bpa_dr;
	}

	public void setBpa_dr(String bpa_dr) {
		this.bpa_dr = bpa_dr;
	}

	public Integer getBpa_type() {
		return bpa_type;
	}

	public void setBpa_type(Integer bpa_type) {
		this.bpa_type = bpa_type;
	}
	

}

