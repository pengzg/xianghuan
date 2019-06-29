package com.xianghuan.mobile.baseservice.vo;

import java.util.List;

import com.xianghuan.admin.baseservice.vo.BaseServiceVO;
import com.xianghuan.util.RepBaseBean;

public class Rep4002 extends RepBaseBean{

	/**
	 * 
	 */
	private static final long serialVersionUID = -798044905941458064L;

	
	private List<BaseServiceVO> dataList;


	public List<BaseServiceVO> getDataList() {
		return dataList;
	}


	public void setDataList(List<BaseServiceVO> dataList) {
		this.dataList = dataList;
	}
}
