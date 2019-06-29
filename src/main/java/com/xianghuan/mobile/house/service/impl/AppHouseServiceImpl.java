package com.xianghuan.mobile.house.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xianghuan.admin.house.model.HouseBase;
import com.xianghuan.admin.house.service.IHouseBaseService;
import com.xianghuan.admin.house.vo.HouseBaseVO;
import com.xianghuan.mobile.house.service.IAppHouseService;
import com.xianghuan.mobile.house.vo.Rep3001;
import com.xianghuan.mobile.house.vo.Rep3002;
import com.xianghuan.mobile.house.vo.Rep3003;
import com.xianghuan.mobile.house.vo.Req3001;
import com.xianghuan.mobile.house.vo.Req3002;
import com.xianghuan.mobile.house.vo.Req3003;
@Service("appHouseService")
public class AppHouseServiceImpl implements IAppHouseService{

	
	@Autowired
	private IHouseBaseService houseBaseService;
	/**
	 *添加房源
	 */
	@Override
	public Rep3001 addHouse(Req3001 req) {
		// TODO Auto-generated method stub
		Rep3001 rep = new Rep3001();
		
		HouseBaseVO vo= new HouseBaseVO();
		BeanUtils.copyProperties(req, vo);
		houseBaseService.insertAndUpdate(vo,req.getUserId());
		
		
		rep.setSuccess("成功");
		return rep;
	}
	
	/**
	 * 房源列表
	 */
	@Override
	public Rep3002 getHouseList(Req3002 req) {
		// TODO Auto-generated method stub
		Rep3002 rep = new Rep3002();
		
		Map<String, Object> map = new HashMap<String, Object>();
		if (StringUtils.isNotBlank(req.getTag_str())) {
			map.put("tag_id_arr", req.getTag_str().split(","));
		}
		if (StringUtils.isNotBlank(req.getRoom_type_str())) {
			map.put("hb_roome_type_arr", req.getRoom_type_str().split(","));
		}
		if (StringUtils.isNotBlank(req.getRent_type_str())) {
			map.put("hb_rent_type_arr", req.getRent_type_str().split(","));
		}
		if (StringUtils.isNotBlank(req.getPrice_range_str())) {
			map.put("hb_price_range_arr", req.getPrice_range_str().split(","));
		}
		
		map.put("lng", req.getLng());
		map.put("lat", req.getLat());
		if (StringUtils.isNotBlank(req.getAddress())) {
			map.put("address_like", req.getAddress());
		}
		map.put("searchKey", req.getSearchKey());
		
		map.put("distance_range", req.getDistance_range());
		map.put("start", (req.getPage()-1)*req.getRows());
		map.put("rows", req.getRows());
		rep.setDataList(houseBaseService.selectHouseByDistance(map));
		rep.setSuccess("成功");
		return rep;		
	}

	/**
	 * 得到房子详情
	 */
	@Override
	public Rep3003 getDetail(Req3003 req) {
		// TODO Auto-generated method stub
		Rep3003 rep = new Rep3003(); 
		HouseBaseVO hbBaseVO = houseBaseService.getDetail(req.getHouseId());
		rep.setHouseDetailVO(hbBaseVO);
		rep.setSuccess("成功");
		return rep;
	}

}
