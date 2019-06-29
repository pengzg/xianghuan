package com.xianghuan.mobile.base.service;

import com.xianghuan.mobile.base.vo.Rep1001;
import com.xianghuan.mobile.base.vo.Rep1002;
import com.xianghuan.mobile.base.vo.Rep1003;
import com.xianghuan.mobile.base.vo.Req1001;
import com.xianghuan.mobile.base.vo.Req1002;
import com.xianghuan.mobile.base.vo.Req1003;

public interface IAppBaseService {

	/**
	 * 发送短信
	 * @param req
	 * @return
	 */
	public Rep1001 sendSms(Req1001 req);

	/**
	 * 图片上传
	 * @param req
	 * @return
	 */
	public Rep1002 uploadImage(Req1002 req);

	/**
	 * 得到基础信息
	 * @param req
	 * @return
	 */
	public Rep1003 getBaseInfo(Req1003 req);

}
