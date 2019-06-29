/*
 * Powered By [rapid-framework]
 * Web Site: http://www.rapid-framework.org.cn
 * Google Code: http://code.google.com/p/rapid-framework/
 * Since 2008 - 2014
 */

package com.xianghuan.auth.base.vo;

/**
 * @author feizhang
 * @version 1.0
 * @since 1.0
 */

public class BaseDataVO implements java.io.Serializable {
	private static final long serialVersionUID = 5454155825314635342L;

	// columns START111
	// 主键
//	private String bd_id;
	// 编码
	private String bd_code;
	// 名称
	private String bd_name;
	// 排序

	private String bdt_code;
	

	private String bd_des;
	// columns END

//	public void setBd_id(String value) {
//		this.bd_id = value;
//	}
//
//	public String getBd_id() {
//		return this.bd_id;
//	}

	public void setBd_code(String value) {
		this.bd_code = value;
	}

	public String getBd_code() {
		return this.bd_code;
	}

	public void setBd_name(String value) {
		this.bd_name = value;
	}

	public String getBd_name() {
		return this.bd_name;
	}


	public String getBdt_code() {
		return bdt_code;
	}

	public void setBdt_code(String bdt_code) {
		this.bdt_code = bdt_code;
	}

	public String getBd_des() {
		return bd_des;
	}

	public void setBd_des(String bd_des) {
		this.bd_des = bd_des;
	}
	
	

}
