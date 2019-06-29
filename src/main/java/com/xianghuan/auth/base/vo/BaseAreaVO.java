package com.xianghuan.auth.base.vo;

import java.io.Serializable;

/**
 * 地区VO
 * 
 * @author panyf
 * 
 */
public class BaseAreaVO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8682457078306434725L;

	private Integer ba_id;
	// 地区名称
	private String ba_name;
	//
	private String ba_level;
	//
	private String ba_parent_id;
	//
	private String ba_letter;

	public Integer getBa_id() {
		return ba_id;
	}

	public void setBa_id(Integer ba_id) {
		this.ba_id = ba_id;
	}

	public String getBa_name() {
		return ba_name;
	}

	public void setBa_name(String ba_name) {
		this.ba_name = ba_name;
	}

	public String getBa_level() {
		return ba_level;
	}

	public void setBa_level(String ba_level) {
		this.ba_level = ba_level;
	}

	public String getBa_parent_id() {
		return ba_parent_id;
	}

	public void setBa_parent_id(String ba_parent_id) {
		this.ba_parent_id = ba_parent_id;
	}

	public String getBa_letter() {
		return ba_letter;
	}

	public void setBa_letter(String ba_letter) {
		this.ba_letter = ba_letter;
	}

}
