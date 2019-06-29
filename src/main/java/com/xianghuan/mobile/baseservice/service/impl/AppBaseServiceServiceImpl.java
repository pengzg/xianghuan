package com.xianghuan.mobile.baseservice.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xianghuan.admin.baseservice.service.IBaseServiceService;
import com.xianghuan.admin.baseservice.vo.BaseServiceVO;
import com.xianghuan.auth.base.cache.BaseDataDetailListCache;
import com.xianghuan.auth.base.vo.BaseDataVO;
import com.xianghuan.mobile.baseservice.service.IAppBaseServiceService;
import com.xianghuan.mobile.baseservice.vo.Rep4001;
import com.xianghuan.mobile.baseservice.vo.Rep4002;
import com.xianghuan.mobile.baseservice.vo.Req4001;
import com.xianghuan.mobile.baseservice.vo.Req4002;
import com.xianghuan.mobile.baseservice.vo.ServiceCategoryVO;
import com.xianghuan.util.BaseDataTypeCodeConstant;
@Service("appBaseServiceService")
public class AppBaseServiceServiceImpl implements IAppBaseServiceService{

	@Autowired
	private IBaseServiceService baseServiceService;
	/**
	 * 服务类别列表
	 */
	@Override
	public Rep4001 getServiceCategoryList(Req4001 req) {
		// TODO Auto-generated method stub
		Rep4001 rep = new Rep4001();
		
		List<ServiceCategoryVO> list = new ArrayList<>();
		
		List<BaseDataVO> serviceList = BaseDataDetailListCache.getInstance().get(BaseDataTypeCodeConstant.type_1011);
		for (BaseDataVO vo: serviceList) {
			ServiceCategoryVO vo2 = new ServiceCategoryVO();
			vo2.setName(vo.getBd_name());
			vo2.setSubList(BaseDataDetailListCache.getInstance().get(vo.getBd_code()));
			list.add(vo2);
		}
		rep.setDataList(list);
		rep.setSuccess("成功");
		return rep;
	}

	/**
	 * 得到服务列表
	 */
	@Override
	public Rep4002 getServiceList(Req4002 req) {
		// TODO Auto-generated method stub
		Rep4002 rep = new Rep4002();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("bs_categorycode", req.getCategoryCode());
		map.put("lat", req.getLat());
		map.put("lng", req.getLng());
		map.put("start", (req.getPage()-1)*req.getRows());
		map.put("rows", req.getRows());
		
		List<BaseServiceVO> list = baseServiceService.getListByDistance(map);
		rep.setDataList(list);
		rep.setSuccess("成功");
		
		return rep;
	}

}
