package com.xianghuan.mobile.base.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.xianghuan.jdbc.exception.BusinessException;
import org.xianghuan.web.controller.BaseController;

import com.xianghuan.mobile.base.service.IAppBaseService;
import com.xianghuan.mobile.base.vo.Rep1001;
import com.xianghuan.mobile.base.vo.Rep1002;
import com.xianghuan.mobile.base.vo.Rep1003;
import com.xianghuan.mobile.base.vo.Req1001;
import com.xianghuan.mobile.base.vo.Req1002;
import com.xianghuan.mobile.base.vo.Req1003;
import com.xianghuan.util.RepBaseBean;

@Controller
@RequestMapping("/app/appBaseControl")
public class AppBaseController extends BaseController{
	private static final Logger log = Logger.getLogger(AppBaseController.class);
	
	@Autowired
	private IAppBaseService appBaseService;
	/**
	 * 发送短信
	 * @param ss_id
	 */
	@RequestMapping("/sendSms")
	@ResponseBody
	public Rep1001 sendSms(HttpServletRequest request,Req1001 req) {
		Rep1001 rep = new Rep1001();
		if(StringUtils.isBlank(req.getMobile())){
			rep.setRepCode(RepBaseBean.REQPCODE_PARAM);
			rep.setRepMsg("手机号不能为空");
			return rep;
		}
		if(StringUtils.isBlank(req.getSmsType())){
			rep.setRepCode(RepBaseBean.REQPCODE_PARAM);
			rep.setRepMsg("短信类型不能为空");
			return rep;
		}
		try {
			rep = appBaseService.sendSms(req);
			
		} catch(BusinessException e1){
			log.error("发送短信异常!["+e1.getMessageArgs()[0]+"]", e1);
			rep.setExecRes(e1.getErrorCode(), e1.getMessageArgs()[0]);
		}catch (Exception e) {
			rep.setRepCode(RepBaseBean.REQPCODE_ERROR);
			rep.setRepMsg("短信发送失败！");
			log.error(e.getMessage(), e);
		}
		return rep;
	}
	
	
	/**
	 * 上传图片
	 */
	@RequestMapping("/uploadImage")
	@ResponseBody
	public Rep1002 uploadImage(HttpServletRequest request,Req1002 req) {
		Rep1002 rep = new Rep1002();
		if(StringUtils.isBlank(req.getImgStr())){
			rep.setRepCode(RepBaseBean.REQPCODE_PARAM);
			rep.setRepMsg("请选择要上传的图片");
			return rep;
		}
		if(req.getType() == null){
			rep.setRepCode(RepBaseBean.REQPCODE_PARAM);
			rep.setRepMsg("图片类型不能为空");
			return rep;
		}
		try {
			rep = appBaseService.uploadImage(req);
			
		} catch(BusinessException e1){
			log.error("图片上传异常!["+e1.getMessageArgs()[0]+"]", e1);
			rep.setExecRes(e1.getErrorCode(), e1.getMessageArgs()[0]);
		}catch (Exception e) {
			rep.setRepCode(RepBaseBean.REQPCODE_ERROR);
			rep.setRepMsg("图片上传失败！");
			log.error(e.getMessage(), e);
		}
		return rep;
	}
	
	/**
	 * 得到基础信息
	 */
	@RequestMapping("/getBaseInfo")
	@ResponseBody
	public Rep1003 getBaseInfo(HttpServletRequest request,Req1003 req) {
		Rep1003 rep = new Rep1003();
		
		
		try {
			rep = appBaseService.getBaseInfo(req);
			
		} catch(BusinessException e1){
			log.error("图片上传异常!["+e1.getMessageArgs()[0]+"]", e1);
			rep.setExecRes(e1.getErrorCode(), e1.getMessageArgs()[0]);
		}catch (Exception e) {
			rep.setRepCode(RepBaseBean.REQPCODE_ERROR);
			rep.setRepMsg("图片上传失败！");
			log.error(e.getMessage(), e);
		}
		return rep;
	}
	
	@Override
	public Map<?, ?> getQueryCondition(HttpServletRequest arg0) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
