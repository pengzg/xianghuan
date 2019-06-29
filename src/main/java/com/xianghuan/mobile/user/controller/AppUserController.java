package com.xianghuan.mobile.user.controller;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.xianghuan.jdbc.exception.BusinessException;
import org.xianghuan.web.controller.BaseController;

import com.xianghuan.mobile.user.service.IAppUserService;
import com.xianghuan.mobile.user.vo.Rep2001;
import com.xianghuan.mobile.user.vo.Rep2002;
import com.xianghuan.mobile.user.vo.Rep2003;
import com.xianghuan.mobile.user.vo.Req2001;
import com.xianghuan.mobile.user.vo.Req2002;
import com.xianghuan.mobile.user.vo.Req2003;
import com.xianghuan.util.RepBaseBean;


@Controller
@RequestMapping("/app/userControl")
public class AppUserController extends BaseController{
	private static final Logger log = Logger.getLogger(AppUserController.class);
	
	@Autowired
	private IAppUserService appUserService;
	/**
	 * 登录
	 * @param ss_id
	 */
	@RequestMapping("/login")
	@ResponseBody
	public Rep2001 login(HttpServletRequest request,Req2001 req) {
		Rep2001 rep = new Rep2001();
		if(StringUtils.isBlank(req.getMobile())){
			rep.setRepCode(RepBaseBean.REQPCODE_PARAM);
			rep.setRepMsg("手机号不能为空");
			return rep;
		}
		if(StringUtils.isBlank(req.getSms_code())){
			rep.setRepCode(RepBaseBean.REQPCODE_PARAM);
			rep.setRepMsg("验证码不能为空");
			return rep;
		}
		try {
		  //  rep = sysSmsService.sentb2bSms(req);
			rep = appUserService.login(req);
			
		} catch(BusinessException e1){
			log.error("登录异常!["+e1.getMessageArgs()[0]+"]", e1);
			rep.setExecRes(e1.getErrorCode(), e1.getMessageArgs()[0]);
		}catch (Exception e) {
			rep.setRepCode(RepBaseBean.REQPCODE_ERROR);
			rep.setRepMsg("登录异常！");
			log.error(e.getMessage(), e);
		}
		return rep;
	}
	
	/**
	 * 登录
	 * @param ss_id
	 */
	@RequestMapping("/getUserInfo")
	@ResponseBody
	public Rep2002 getUserInfo(HttpServletRequest request,Req2002 req) {
		Rep2002 rep = new Rep2002();
		if(StringUtils.isBlank(req.getUserId()+"")){
			rep.setRepCode(RepBaseBean.REQPCODE_PARAM);
			rep.setRepMsg("获取用户信息失败");
			return rep;
		}
		
		try {
			rep = appUserService.getUserInfo(req);
			
		} catch(BusinessException e1){
			log.error("异常!["+e1.getMessageArgs()[0]+"]", e1);
			rep.setExecRes(e1.getErrorCode(), e1.getMessageArgs()[0]);
		}catch (Exception e) {
			rep.setRepCode(RepBaseBean.REQPCODE_ERROR);
			rep.setRepMsg("异常！");
			log.error(e.getMessage(), e);
		}
		return rep;
	}
	
	
	/**
	 * 收藏
	 * @param ss_id
	 */
	@RequestMapping("/addFavorite")
	@ResponseBody
	public Rep2003 addFavorite(HttpServletRequest request,Req2003 req) {
		Rep2003 rep = new Rep2003();
		if(StringUtils.isBlank(req.getUserId()+"")){
			rep.setRepCode(RepBaseBean.REQPCODE_PARAM);
			rep.setRepMsg("获取用户信息失败");
			return rep;
		}
		
		try {
			rep = appUserService.addFavorite(req);
			
		} catch(BusinessException e1){
			log.error("收藏异常!["+e1.getMessageArgs()[0]+"]", e1);
			rep.setExecRes(e1.getErrorCode(), e1.getMessageArgs()[0]);
		}catch (Exception e) {
			rep.setRepCode(RepBaseBean.REQPCODE_ERROR);
			rep.setRepMsg("收藏异常！");
			log.error(e.getMessage(), e);
		}
		return rep;
	}
	@Override
	public Map<?, ?> getQueryCondition(HttpServletRequest request) {
		// TODO Auto-generated method stub
		return null;
	}

}
