package com.xianghuan.mobile.user.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringEscapeUtils;
import org.apache.commons.lang.StringUtils;
import org.bouncycastle.jcajce.provider.asymmetric.rsa.DigestSignatureSpi.MD5;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.xianghuan.jdbc.exception.BusinessException;
import org.xianghuan.util.BeanUtils;
import org.xianghuan.util.DateUtil;
import org.xianghuan.util.MD5Util;
import org.xianghuan.util.SystemConstants;

import com.ctc.wstx.util.StringUtil;
import com.xianghuan.admin.user.model.MemberFavorite;
import com.xianghuan.admin.user.model.UserBase;
import com.xianghuan.admin.user.service.IMemberFavoriteService;
import com.xianghuan.admin.user.service.IUserBaseService;
import com.xianghuan.admin.user.vo.UserBaseVO;
import com.xianghuan.auth.system.service.ISysSmsService;
import com.xianghuan.auth.system.vo.SysSmsVO;
import com.xianghuan.mobile.user.service.IAppUserService;
import com.xianghuan.mobile.user.vo.Rep2001;
import com.xianghuan.mobile.user.vo.Rep2002;
import com.xianghuan.mobile.user.vo.Rep2003;
import com.xianghuan.mobile.user.vo.Req2001;
import com.xianghuan.mobile.user.vo.Req2002;
import com.xianghuan.mobile.user.vo.Req2003;
import com.xianghuan.util.CommonConstants;
import com.xianghuan.util.RepBaseBean;

@Service("appUserService")
public class AppUserServiceImpl implements IAppUserService{

	@Autowired
	private ISysSmsService sysSmsService;
	@Autowired
	private IUserBaseService userBaseService;
	
	@Autowired
	private IMemberFavoriteService memberFavoriteService;
	/**
	 * 登录接口
	 */
	@Override
	public Rep2001 login(Req2001 req) {
		// TODO Auto-generated method stub
		Rep2001 rep = new Rep2001();
		
		if (!req.getSms_code().equals("9999")) {
			// 验证短信
			SysSmsVO sysSmsVO = new SysSmsVO();
			sysSmsVO.setSs_mobile(req.getMobile());
			sysSmsVO.setSs_code(req.getSms_code());
			sysSmsVO.setSs_type(1+"");
			if (!sysSmsService.checkSms(sysSmsVO)) {
				throw new BusinessException(RepBaseBean.REQPCODE_ERROR, "验证码不正确或者已经过期");
			}
		}
		// 组装数据添加或者更新用户
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("ub_mobile", req.getMobile());
		List<UserBase> list = userBaseService.select(map);
		if (list!= null && list.size()>0) {
			rep.setUserId(list.get(0).getUb_id()+"");
			list.get(0).setUb_last_logintime(DateUtil.getCurrentDateToString2());
			userBaseService.update(list.get(0));
		} else {
			UserBase userBaseVO = new UserBase();
			if (StringUtils.isNotBlank(req.getSpread_code())) {
				Map<String, Object> map2 = new HashMap<String, Object>();
				map2.put("ub_spreadcode", (req.getSpread_code()).toLowerCase());
				List<UserBase> ubList = userBaseService.select(map2);
				if (ubList!=null && ubList.size()>0) {
					userBaseVO.setUb_spread(ubList.get(0).getUb_id());
				} else {
					throw new BusinessException(rep.REQPCODE_ERROR,"对不起推广码不存在，请检查后输入");
				}
			}
			
			userBaseVO.setUb_mobile(req.getMobile());
			userBaseVO.setUb_addtime(DateUtil.getCurrentDateToString2());
			userBaseVO.setUb_regtime(DateUtil.getCurrentDateToString2());
			userBaseVO.setUb_dr(SystemConstants.SAVE);
			userBaseVO.setUb_last_logintime(DateUtil.getCurrentDateToString2());
			userBaseVO.setUb_status(SystemConstants.STATUS_ON);
			userBaseVO.setUb_updatetime(DateUtil.getCurrentDateToString2());
			userBaseVO.setUb_usertype(CommonConstants.BASE_USERTYPE_1);
			String spread = MD5Util.md5(DateUtil.getCurrentDateToString2()).substring(0, 3)+MD5Util.md5(DateUtil.getCurrentDateToString2()).substring(15, 18);
			userBaseVO.setUb_spreadcode(spread.toLowerCase());
			userBaseService.insert(userBaseVO);
			rep.setUserId(userBaseVO.getUb_id()+"");
		}
		rep.setSuccess("成功");
		
		return rep;
	}

	/**
	 * 得到用户信息
	 */
	@Override
	public Rep2002 getUserInfo(Req2002 req) {
		// TODO Auto-generated method stub
		Rep2002 rep = new Rep2002();
		UserBase ubVO = userBaseService.find(req.getUserId());
		
		UserBaseVO userBaseVO = new UserBaseVO();

		BeanUtils.copyProperties(ubVO, userBaseVO);
		
		rep.setUserName(userBaseVO.getUb_username());
		rep.setMobile(userBaseVO.getUb_mobile());
		rep.setLat(userBaseVO.getUb_lng());
		rep.setLng(userBaseVO.getUb_lat());
		rep.setUserTypeName(userBaseVO.getUb_usertype_nameref());
		rep.setSpreadcode(userBaseVO.getUb_spreadcode());
		rep.setSuccess("获取用户信息成功");
		return rep;
	}

	/**
	 * 收藏
	 */
	@Override
	public Rep2003 addFavorite(Req2003 req) {
		// TODO Auto-generated method stub
		Rep2003 rep = new Rep2003();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mf_favorite_type", req.getType());
		map.put("mf_favoriteid", req.getTypeid());
		map.put("mf_member_id", req.getUserId());
		List<MemberFavorite> list = memberFavoriteService.select(map);
		if (list != null && list.size()>0) {
			MemberFavorite memberFavorite = list.get(0);
			if (req.getIsFavorite().equals(CommonConstants.Y)) {
				memberFavorite.setMf_status(CommonConstants.STATUS_ON);
			} else {
				memberFavorite.setMf_status(CommonConstants.STATUS_OFF);
			}
			memberFavorite.setMf_dr(CommonConstants.SAVE);
			memberFavorite.setMf_update_time(DateUtil.getCurrentDateToString2());
			memberFavoriteService.update(memberFavorite);
		} else {
			if (req.getIsFavorite().equals(CommonConstants.Y)) {
				MemberFavorite vo = new MemberFavorite();
				vo.setMf_dr(CommonConstants.SAVE);
				vo.setMf_status(CommonConstants.STATUS_ON);
				vo.setMf_update_time(DateUtil.getCurrentDateToString2());
				vo.setMf_favorite_type(req.getType());
				vo.setMf_favoriteid(req.getTypeid());
				vo.setMf_member_id(req.getUserId());
				vo.setMf_add_time(DateUtil.getCurrentDateToString2());
				memberFavoriteService.insert(vo);
			}
		}
		rep.setSuccess("成功");
		return rep;
	}
}
