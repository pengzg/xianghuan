package com.xianghuan.mobile.baseservice.controller;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.xianghuan.jdbc.exception.BusinessException;
import org.xianghuan.web.controller.BaseController;

import com.xianghuan.mobile.baseservice.service.IAppBaseServiceService;
import com.xianghuan.mobile.baseservice.vo.Rep4001;
import com.xianghuan.mobile.baseservice.vo.Rep4002;
import com.xianghuan.mobile.baseservice.vo.Req4001;
import com.xianghuan.mobile.baseservice.vo.Req4002;
import com.xianghuan.util.RepBaseBean;


@Controller
@RequestMapping("/app/baseServiceControl")
public class AppBaseServiceController extends BaseController{
	private static final Logger log = Logger.getLogger(AppBaseServiceController.class);
	
	@Autowired
	private IAppBaseServiceService appBaseServiceService;
	/**
	 * 得到服务类别列表
	 * @param ss_id
	 */
	@RequestMapping("/getServiceCategoryList")
	@ResponseBody
	public Rep4001 getServiceCategoryList(HttpServletRequest request,Req4001 req) {
		Rep4001 rep = new Rep4001();
		try {
		    rep = appBaseServiceService.getServiceCategoryList(req);
			
		} catch(BusinessException e1){
			log.error("服务类别异常!["+e1.getMessageArgs()[0]+"]", e1);
			rep.setExecRes(e1.getErrorCode(), e1.getMessageArgs()[0]);
		}catch (Exception e) {
			rep.setRepCode(RepBaseBean.REQPCODE_ERROR);
			rep.setRepMsg("服务类别异常！");
			log.error(e.getMessage(), e);
		}
		return rep;
	}
	
	
	/**
	 * 得到服务列表
	 * @param ss_id
	 */
	@RequestMapping("/getServiceList")
	@ResponseBody
	public Rep4002 getServiceList(HttpServletRequest request,Req4002 req) {
		Rep4002 rep = new Rep4002();
		try {
		    rep = appBaseServiceService.getServiceList(req);
			
		} catch(BusinessException e1){
			log.error("服务类别异常!["+e1.getMessageArgs()[0]+"]", e1);
			rep.setExecRes(e1.getErrorCode(), e1.getMessageArgs()[0]);
		}catch (Exception e) {
			rep.setRepCode(RepBaseBean.REQPCODE_ERROR);
			rep.setRepMsg("服务类别异常！");
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
