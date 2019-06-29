package com.xianghuan.mobile.house.service;

import com.xianghuan.mobile.house.vo.Rep3001;
import com.xianghuan.mobile.house.vo.Rep3002;
import com.xianghuan.mobile.house.vo.Rep3003;
import com.xianghuan.mobile.house.vo.Req3001;
import com.xianghuan.mobile.house.vo.Req3002;
import com.xianghuan.mobile.house.vo.Req3003;

public interface IAppHouseService {

	/**
	 * 添加房源
	 * @param req
	 * @return
	 */
	public Rep3001 addHouse(Req3001 req);

	/**
	 * 得到房子列表
	 * @param req
	 * @return
	 */
	public Rep3002 getHouseList(Req3002 req);

	/**
	 * 得到房子详情
	 * @param req
	 * @return
	 */
	public Rep3003 getDetail(Req3003 req);

}
