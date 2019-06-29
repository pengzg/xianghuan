package com.xianghuan.mobile.baseservice.service;

import com.xianghuan.mobile.baseservice.vo.Rep4001;
import com.xianghuan.mobile.baseservice.vo.Rep4002;
import com.xianghuan.mobile.baseservice.vo.Req4001;
import com.xianghuan.mobile.baseservice.vo.Req4002;


public interface IAppBaseServiceService {

	/**
	 * 得到服务类别列表
	 * @param req
	 * @return
	 */
	public Rep4001  getServiceCategoryList(Req4001 req);

	/**
	 * 服务列表
	 * @param req
	 * @return
	 */
	public Rep4002 getServiceList(Req4002 req);

}
