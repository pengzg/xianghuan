package com.xianghuan.admin.house.vo;

import java.math.BigDecimal;
import java.util.List;

import org.apache.commons.lang.StringUtils;

import com.xianghuan.admin.basetag.vo.BaseTagVO;
import com.xianghuan.admin.user.cache.UserBaseCache;
import com.xianghuan.auth.base.cache.BaseDataDetailValueCache;
import com.xianghuan.auth.base.vo.BaseAttachmentVO;
import com.xianghuan.util.AppConstants;
import com.xianghuan.util.BaseDataTypeCodeConstant;
import com.xianghuan.util.CommonConstants;


public class HouseBaseVO implements java.io.Serializable{
	private static final long serialVersionUID = 5454155825314635342L;
	
	private AppConstants appConstants= new AppConstants();
	
	//columns START111
	//	
	private Integer hb_id;
	//类型 对应字典	
	private Integer hb_rent_type;
	private String hb_rent_type_nameref;
	//标题	
	private String hb_title;
	//简介	
	private String hb_summary;
	//介绍	
	private String hb_intro;
	//主图	
	private String hb_cover;
	private String hb_cover_nameref;
	//用户	
	private Integer hb_userid;
	private String hb_userid_nameref;
	private String hb_userid_img;
	//户型 对应字典	
	private Integer hb_house_type;
	private String hb_house_type_nameref;
	//房屋总面积	
	private Integer hb_house_area;
	//联系电话	
	private String hb_contacts_mobile;
	//房间类型	
	private Integer hb_room_type;
	private String hb_room_type_nameref;
	//房间面积	
	private Integer hb_room_area;
	//联系人姓名	
	private String hb_contacts_name;
	//发布时间	
	private String hb_posttime;
	//地址	
	private String hb_address;
	//价格	
	private BigDecimal hb_price;
	//价格区间 	
	private Integer hb_price_range;
	//经度	
	private String hb_lng;
	//纬度 	
	private String hb_lat;
	//是否显示  1是 2 不显示	
	private String hb_isshow;
	//标签	
	private String hb_tag;
	//审核状态	
	private Integer hb_checkstatus;
	//状态  1正常	
	private Integer hb_status;
	//1正常	
	private Integer hb_dr;
	//	
	private String hb_addtime;
	//	
	private String hb_updatetime;
	//columns END

	//标签	
	private String hb_tag_str;
	
	private String imgStr;
	// 距离 
	private String distance;
	
	private List<BaseAttachmentVO> imgList;
	
	private List<BaseTagVO> tagList;
	
	public void setHb_id(Integer hb_id) {
		this.hb_id = hb_id;
	}
	
	public Integer getHb_id() {
		return this.hb_id;
	}
	public void setHb_rent_type(Integer hb_rent_type) {
		this.hb_rent_type = hb_rent_type;
	}
	
	public Integer getHb_rent_type() {
		return this.hb_rent_type;
	}
	public void setHb_title(String hb_title) {
		this.hb_title = hb_title;
	}
	
	public String getHb_title() {
		return this.hb_title;
	}
	public void setHb_summary(String hb_summary) {
		this.hb_summary = hb_summary;
	}
	
	public String getHb_summary() {
		return this.hb_summary;
	}
	public void setHb_intro(String hb_intro) {
		this.hb_intro = hb_intro;
	}
	
	public String getHb_intro() {
		return this.hb_intro;
	}
	public void setHb_cover(String hb_cover) {
		this.hb_cover = hb_cover;
	}
	
	public String getHb_cover() {
		return this.hb_cover;
	}
	public void setHb_userid(Integer hb_userid) {
		this.hb_userid = hb_userid;
	}
	
	public Integer getHb_userid() {
		return this.hb_userid;
	}
	public void setHb_house_type(Integer hb_house_type) {
		this.hb_house_type = hb_house_type;
	}
	
	public Integer getHb_house_type() {
		return this.hb_house_type;
	}
	public void setHb_house_area(Integer hb_house_area) {
		this.hb_house_area = hb_house_area;
	}
	
	public Integer getHb_house_area() {
		return this.hb_house_area;
	}
	public void setHb_contacts_mobile(String hb_contacts_mobile) {
		this.hb_contacts_mobile = hb_contacts_mobile;
	}
	
	public String getHb_contacts_mobile() {
		return this.hb_contacts_mobile;
	}
	public void setHb_room_type(Integer hb_room_type) {
		this.hb_room_type = hb_room_type;
	}
	
	public Integer getHb_room_type() {
		return this.hb_room_type;
	}
	public void setHb_room_area(Integer hb_room_area) {
		this.hb_room_area = hb_room_area;
	}
	
	public Integer getHb_room_area() {
		return this.hb_room_area;
	}
	public void setHb_contacts_name(String hb_contacts_name) {
		this.hb_contacts_name = hb_contacts_name;
	}
	
	public String getHb_contacts_name() {
		return this.hb_contacts_name;
	}
	public void setHb_posttime(String hb_posttime) {
		this.hb_posttime = hb_posttime;
	}
	
	public String getHb_posttime() {
		return this.hb_posttime;
	}
	public void setHb_address(String hb_address) {
		this.hb_address = hb_address;
	}
	
	public String getHb_address() {
		return this.hb_address;
	}
	public void setHb_price(BigDecimal hb_price) {
		this.hb_price = hb_price;
	}
	
	public BigDecimal getHb_price() {
		return this.hb_price;
	}
	public void setHb_price_range(Integer hb_price_range) {
		this.hb_price_range = hb_price_range;
	}
	
	public Integer getHb_price_range() {
		return this.hb_price_range;
	}
	public void setHb_lng(String hb_lng) {
		this.hb_lng = hb_lng;
	}
	
	public String getHb_lng() {
		return this.hb_lng;
	}
	public void setHb_lat(String hb_lat) {
		this.hb_lat = hb_lat;
	}
	
	public String getHb_lat() {
		return this.hb_lat;
	}
	public void setHb_isshow(String hb_isshow) {
		this.hb_isshow = hb_isshow;
	}
	
	public String getHb_isshow() {
		return this.hb_isshow;
	}
	public void setHb_tag(String hb_tag) {
		this.hb_tag = hb_tag;
	}
	
	public String getHb_tag() {
		return this.hb_tag;
	}
	public void setHb_checkstatus(Integer hb_checkstatus) {
		this.hb_checkstatus = hb_checkstatus;
	}
	
	public Integer getHb_checkstatus() {
		return this.hb_checkstatus;
	}
	public void setHb_status(Integer hb_status) {
		this.hb_status = hb_status;
	}
	
	public Integer getHb_status() {
		return this.hb_status;
	}
	public void setHb_dr(Integer hb_dr) {
		this.hb_dr = hb_dr;
	}
	
	public Integer getHb_dr() {
		return this.hb_dr;
	}
	public void setHb_addtime(String hb_addtime) {
		this.hb_addtime = hb_addtime;
	}
	
	public String getHb_addtime() {
		return this.hb_addtime;
	}
	public void setHb_updatetime(String hb_updatetime) {
		this.hb_updatetime = hb_updatetime;
	}
	
	public String getHb_updatetime() {
		return this.hb_updatetime;
	}

	public String getHb_tag_str() {
		return hb_tag_str;
	}

	public void setHb_tag_str(String hb_tag_str) {
		this.hb_tag_str = hb_tag_str;
	}

	public String getImgStr() {
		return imgStr;
	}

	public void setImgStr(String imgStr) {
		this.imgStr = imgStr;
	}



	public String getHb_cover_nameref() {
		if (StringUtils.isNotBlank(getHb_cover())) {
			hb_cover_nameref = appConstants.getImgpath_domain_url()+CommonConstants.IMGPATH_ROUTE+hb_cover;
		}
		return hb_cover_nameref;
	}

	public void setHb_cover_nameref(String hb_cover_nameref) {
		
		this.hb_cover_nameref = hb_cover_nameref;
	}

	public String getHb_rent_type_nameref() {
		if (getHb_rent_type() != null) {
			hb_rent_type_nameref = BaseDataDetailValueCache.getInstance().getName(BaseDataTypeCodeConstant.type_1004, getHb_rent_type()+"");
		}
		return hb_rent_type_nameref;
	}

	public void setHb_rent_type_nameref(String hb_rent_type_nameref) {
		this.hb_rent_type_nameref = hb_rent_type_nameref;
	}

	public String getHb_house_type_nameref() {
		if (getHb_house_type() != null) {
			hb_house_type_nameref = BaseDataDetailValueCache.getInstance().getName(BaseDataTypeCodeConstant.type_1005, getHb_house_type()+"");
		}
		return hb_house_type_nameref;
	}

	public void setHb_house_type_nameref(String hb_house_type_nameref) {
		this.hb_house_type_nameref = hb_house_type_nameref;
	}

	public String getHb_room_type_nameref() {
		if (getHb_room_type() != null) {
			hb_room_type_nameref = BaseDataDetailValueCache.getInstance().getName(BaseDataTypeCodeConstant.type_1006, getHb_room_type()+"");
		}
		return hb_room_type_nameref;
	}

	public void setHb_room_type_nameref(String hb_room_type_nameref) {
		
		this.hb_room_type_nameref = hb_room_type_nameref;
	}

	public String getDistance() {
		return distance;
	}

	public void setDistance(String distance) {
		this.distance = distance;
	}

	public List<BaseAttachmentVO> getImgList() {
		return imgList;
	}

	public void setImgList(List<BaseAttachmentVO> imgList) {
		this.imgList = imgList;
	}

	public List<BaseTagVO> getTagList() {
		return tagList;
	}

	public void setTagList(List<BaseTagVO> tagList) {
		this.tagList = tagList;
	}

	public String getHb_userid_nameref() {
		if (getHb_userid() != null && getHb_userid()>0) {
			hb_userid_nameref = UserBaseCache.getInstance().getKeyValue(getHb_userid()+"");
		}
		return hb_userid_nameref;
	}

	public void setHb_userid_nameref(String hb_userid_nameref) {
		this.hb_userid_nameref = hb_userid_nameref;
	}

	public String getHb_userid_img() {
		if (getHb_userid() != null && getHb_userid()>0) {
			hb_userid_img = UserBaseCache.getInstance().get(getHb_userid()+"").getUb_image();
		}
		return hb_userid_img;
	}

	public void setHb_userid_img(String hb_userid_img) {
		this.hb_userid_img = hb_userid_img;
	}

}

