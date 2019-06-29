package com.xianghuan.mobile.baseservice.vo;

import java.util.List;

import com.xianghuan.auth.base.model.BaseData;
import com.xianghuan.auth.base.vo.BaseDataVO;
import com.xianghuan.util.RepBaseBean;

public class Rep4001 extends RepBaseBean{

	/**
	 * 
	 */
	private static final long serialVersionUID = 371999787795599950L;

	
	private List<ServiceCategoryVO> dataList;


	public List<ServiceCategoryVO> getDataList() {
		return dataList;
	}


	public void setDataList(List<ServiceCategoryVO> dataList) {
		this.dataList = dataList;
	}

}
