package com.xianghuan.auth.system.model;


public class UserOperationBehavior implements java.io.Serializable{
	private static final long serialVersionUID = 5454155825314635342L;
	
	//columns START111
	//	
	private String uob_id;
	//	
	private Integer uob_user_id;
	//请求码	
	private String uob_req_code;
	//	
	private String uob_req_name;
	//请求参数	
	private String uob_req_param;
	//请求地址	
	private String uob_req_url;
	//	
	private Integer uob_community_id;
	//	
	private Integer uob_shop_id;
	//行为来源 1-PC 2-APP	
	private String uob_source;
	//行为状态 1-有效 2-无效	
	private String uob_status;
	//	
	private String uob_add_time;
	//	
	private String uob_device;
	//	
	private String uob_device_type;
	//	
	private String uob_req_ip;
	//columns END

	public void setUob_id(String uob_id) {
		this.uob_id = uob_id;
	}
	
	public String getUob_id() {
		return this.uob_id;
	}
	public void setUob_user_id(Integer uob_user_id) {
		this.uob_user_id = uob_user_id;
	}
	
	public Integer getUob_user_id() {
		return this.uob_user_id;
	}
	public void setUob_req_code(String uob_req_code) {
		this.uob_req_code = uob_req_code;
	}
	
	public String getUob_req_code() {
		return this.uob_req_code;
	}
	public void setUob_req_name(String uob_req_name) {
		this.uob_req_name = uob_req_name;
	}
	
	public String getUob_req_name() {
		return this.uob_req_name;
	}
	public void setUob_req_param(String uob_req_param) {
		this.uob_req_param = uob_req_param;
	}
	
	public String getUob_req_param() {
		return this.uob_req_param;
	}
	public void setUob_req_url(String uob_req_url) {
		this.uob_req_url = uob_req_url;
	}
	
	public String getUob_req_url() {
		return this.uob_req_url;
	}
	public void setUob_community_id(Integer uob_community_id) {
		this.uob_community_id = uob_community_id;
	}
	
	public Integer getUob_community_id() {
		return this.uob_community_id;
	}
	public void setUob_shop_id(Integer uob_shop_id) {
		this.uob_shop_id = uob_shop_id;
	}
	
	public Integer getUob_shop_id() {
		return this.uob_shop_id;
	}
	public void setUob_source(String uob_source) {
		this.uob_source = uob_source;
	}
	
	public String getUob_source() {
		return this.uob_source;
	}
	public void setUob_status(String uob_status) {
		this.uob_status = uob_status;
	}
	
	public String getUob_status() {
		return this.uob_status;
	}
	public void setUob_add_time(String uob_add_time) {
		this.uob_add_time = uob_add_time;
	}
	
	public String getUob_add_time() {
		return this.uob_add_time;
	}

	public String getUob_device() {
		return uob_device;
	}

	public void setUob_device(String uob_device) {
		this.uob_device = uob_device;
	}

	public String getUob_device_type() {
		return uob_device_type;
	}

	public void setUob_device_type(String uob_device_type) {
		this.uob_device_type = uob_device_type;
	}

	public String getUob_req_ip() {
		return uob_req_ip;
	}

	public void setUob_req_ip(String uob_req_ip) {
		this.uob_req_ip = uob_req_ip;
	}

}

