package com.xianghuan.mobile.base.vo;

import java.util.List;

import com.xianghuan.admin.basetag.model.BaseTag;
import com.xianghuan.auth.base.vo.BaseDataVO;
import com.xianghuan.util.RepBaseBean;

public class Rep1003 extends RepBaseBean{

	/**
	 * 
	 */
	private static final long serialVersionUID = -4398055616457449623L;

	// 价格区间
	private List<BaseDataVO> priceList;
	// 租房类型
	private List<BaseDataVO> rentTypeList;
	// 房子类型
	private List<BaseDataVO> houseTypeList;
	private List<BaseDataVO> roomTypeList;
	// 标签
	private List<BaseTag> tagList;
	
	public List<BaseDataVO> getPriceList() {
		return priceList;
	}
	public void setPriceList(List<BaseDataVO> priceList) {
		this.priceList = priceList;
	}
	public List<BaseDataVO> getRentTypeList() {
		return rentTypeList;
	}
	public void setRentTypeList(List<BaseDataVO> rentTypeList) {
		this.rentTypeList = rentTypeList;
	}
	public List<BaseDataVO> getHouseTypeList() {
		return houseTypeList;
	}
	public void setHouseTypeList(List<BaseDataVO> houseTypeList) {
		this.houseTypeList = houseTypeList;
	}
	public List<BaseDataVO> getRoomTypeList() {
		return roomTypeList;
	}
	public void setRoomTypeList(List<BaseDataVO> roomTypeList) {
		this.roomTypeList = roomTypeList;
	}
	public List<BaseTag> getTagList() {
		return tagList;
	}
	public void setTagList(List<BaseTag> tagList) {
		this.tagList = tagList;
	}
	
}
