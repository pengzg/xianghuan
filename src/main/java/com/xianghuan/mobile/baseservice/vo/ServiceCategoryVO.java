package com.xianghuan.mobile.baseservice.vo;

import java.io.Serializable;
import java.util.List;

import com.xianghuan.auth.base.vo.BaseDataVO;

public class ServiceCategoryVO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 4808273879176956772L;

	private String name;
	
	private List<BaseDataVO> subList;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<BaseDataVO> getSubList() {
		return subList;
	}

	public void setSubList(List<BaseDataVO> subList) {
		this.subList = subList;
	}
}
