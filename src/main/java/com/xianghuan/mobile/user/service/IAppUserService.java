package com.xianghuan.mobile.user.service;

import com.xianghuan.mobile.user.vo.Rep2001;
import com.xianghuan.mobile.user.vo.Rep2002;
import com.xianghuan.mobile.user.vo.Rep2003;
import com.xianghuan.mobile.user.vo.Req2001;
import com.xianghuan.mobile.user.vo.Req2002;
import com.xianghuan.mobile.user.vo.Req2003;


public interface IAppUserService {

	/**
	 * 登录接口
	 * @param req
	 * @return
	 */
	public Rep2001 login(Req2001 req);

	/**
	 * 获取用户信息
	 * @param req
	 * @return
	 */
	public Rep2002 getUserInfo(Req2002 req);

	/**
	 * 收藏
	 * @param req
	 * @return
	 */
	public Rep2003 addFavorite(Req2003 req);

}
