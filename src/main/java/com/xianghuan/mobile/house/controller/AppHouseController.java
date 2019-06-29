package com.xianghuan.mobile.house.controller;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.xianghuan.jdbc.exception.BusinessException;
import org.xianghuan.web.controller.BaseController;

import com.xianghuan.mobile.house.service.IAppHouseService;
import com.xianghuan.mobile.house.vo.Rep3001;
import com.xianghuan.mobile.house.vo.Rep3002;
import com.xianghuan.mobile.house.vo.Rep3003;
import com.xianghuan.mobile.house.vo.Req3001;
import com.xianghuan.mobile.house.vo.Req3002;
import com.xianghuan.mobile.house.vo.Req3003;
import com.xianghuan.util.RepBaseBean;


@Controller
@RequestMapping("/app/appHouseControl")
public class AppHouseController extends BaseController{
	private static final Logger log = Logger.getLogger(AppHouseController.class);
	
	@Autowired
	private IAppHouseService appHouseService;
	/**
	 * 添加房子
	 * @param ss_id
	 */
	@RequestMapping("/addHouse")
	@ResponseBody
	public Rep3001 getServiceCategoryList(HttpServletRequest request,Req3001 req) {
		Rep3001 rep = new Rep3001();
		try {
			rep = appHouseService.addHouse(req);
			
		} catch(BusinessException e1){
			log.error("添加房源异常!["+e1.getMessageArgs()[0]+"]", e1);
			rep.setExecRes(e1.getErrorCode(), e1.getMessageArgs()[0]);
		}catch (Exception e) {
			rep.setRepCode(RepBaseBean.REQPCODE_ERROR);
			rep.setRepMsg("添加房源异常！");
			log.error(e.getMessage(), e);
		}
		return rep;
	}
	
	/**
	 * 得到房子列表
	 */
	@RequestMapping("/getHouseList")
	@ResponseBody
	public Rep3002 getHouseList(HttpServletRequest request,Req3002 req) {
		Rep3002 rep = new Rep3002();
		try {
			rep = appHouseService.getHouseList(req);
			
		} catch(BusinessException e1){
			log.error("房源列表异常!["+e1.getMessageArgs()[0]+"]", e1);
			rep.setExecRes(e1.getErrorCode(), e1.getMessageArgs()[0]);
		}catch (Exception e) {
			rep.setRepCode(RepBaseBean.REQPCODE_ERROR);
			rep.setRepMsg("房源列表异常！");
			log.error(e.getMessage(), e);
		}
		return rep;
	}

	/**
	 * 得到房子列表
	 */
	@RequestMapping("/getDetail")
	@ResponseBody
	public Rep3003 getDetail(HttpServletRequest request,Req3003 req) {
		Rep3003 rep = new Rep3003();
		try {
			rep = appHouseService.getDetail(req);
			
		} catch(BusinessException e1){
			log.error("房源列表异常!["+e1.getMessageArgs()[0]+"]", e1);
			rep.setExecRes(e1.getErrorCode(), e1.getMessageArgs()[0]);
		}catch (Exception e) {
			rep.setRepCode(RepBaseBean.REQPCODE_ERROR);
			rep.setRepMsg("房源列表异常！");
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
