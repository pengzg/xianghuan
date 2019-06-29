/*
 * Powered By [rapid-framework]
 * Web Site: http://www.rapid-framework.org.cn
 * Google Code: http://code.google.com/p/rapid-framework/
 * Since 2008 - 2014
 */

package com.xianghuan.auth.base.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.xianghuan.util.DateUtil;
import org.xianghuan.util.SystemConstants;
import org.xianghuan.web.controller.BaseController;
import org.xianghuan.web.model.DataGrid;
import org.xianghuan.web.model.Json;
import org.xianghuan.web.model.Pager;
import org.xianghuan.web.model.Query;
import org.xianghuan.web.model.SessionInfo;
import org.xianghuan.web.util.UserSessionUtil;

import com.xianghuan.auth.base.model.BparameterConf;
import com.xianghuan.auth.base.service.IBparameterConfService;

/**
 * @company 卡联科技
 * @version 1.0
 * @date
 */

@Controller
@RequestMapping("/base/bparameterConfControl")
public class BparameterConfController extends BaseController {
	private static final Logger log = Logger
			.getLogger(BparameterConfController.class);
	@Autowired
	private IBparameterConfService bparameterConfService;

	public BparameterConfController() {
		super.folder = "/securityJsp/auth/base/bparameterconf/";
	}

	/**
	 * 获取数据表格
	 * 
	 * @param request
	 * @param pager
	 * @return
	 */
	@RequestMapping("/dataGrid")
	@ResponseBody
	public DataGrid dataGrid(HttpServletRequest request, Pager pager) {
		Query query = new Query();
		query.setPager(pager);
		query.setQueryParams((Map<String, Object>) getQueryCondition(request));
		return bparameterConfService.dataGrid(query);
	}

	/**
	 * 跳转到添加页面
	 * 
	 * @param
	 * @return
	 */
	@RequestMapping("/addPage")
	public String addPage(HttpServletRequest request) {
		BparameterConf bpa = new BparameterConf();
		bpa.setBpc_status("" + SystemConstants.STATUS_ON);
		request.setAttribute(REQUEST_BEAN, bpa);
		return redirectJsp("bparameterconf_" + FORWARD_EDIT_PAGE);
	}

	@RequestMapping("/listPage")
	public String listPage() {
		return redirectJsp("bparameterconf_" + FORWARD_LIST_PAGE);
	}

	/**
	 * 跳转到修改页面
	 * 
	 * @param request
	 * @param bpc_id
	 * @return
	 */
	@RequestMapping("/editPage")
	public String editPage(HttpServletRequest request, String bpc_id) {
		BparameterConf bean = bparameterConfService.find(bpc_id);
		request.setAttribute(REQUEST_BEAN, bean);
		return redirectJsp("bparameterconf_" + FORWARD_EDIT_PAGE);
	}

	/**
	 * 跳转到查看页面
	 * 
	 * @param request
	 * @param bpc_id
	 * @return
	 */
	@RequestMapping("/detailPage")
	public String detailPage(HttpServletRequest request, String bpc_id) {
		BparameterConf bean = bparameterConfService.find(bpc_id);
		request.setAttribute(REQUEST_BEAN, bean);
		return redirectJsp("bparameterconf_" + FORWARD_DETAIL_PAGE);
	}

	/**
	 * 增加一条记录
	 * 
	 * @param BparameterConf
	 *            vo
	 * @return JSON
	 */
	@RequestMapping("/insert")
	@ResponseBody
	public Json insert(BparameterConf vo) {
		Json j = new Json();
		// 获取当前登录人信息
		try {
			SessionInfo sessionInfo = UserSessionUtil.getSession();
			vo.setBpc_adduser(sessionInfo.getId());// 新增人id
			vo.setBpc_adddate(DateUtil.getCurrentDateToString2());// 新增时间
			bparameterConfService.insert(vo);
			j.setSuccess(true);
			j.setMsg("增加成功！");
		} catch (Exception e) {
			e.printStackTrace();
			j.setMsg("操作失败！" + e.getMessage());
			log.error(e.getMessage(), e);
		}
		return j;
	}

	/**
	 * 修改一条记录
	 * 
	 * @param vo
	 * @return JSON
	 */
	@RequestMapping("/update")
	@ResponseBody
	public Json update(HttpServletRequest request, BparameterConf vo) {
		Json j = new Json();
		try {
			// 获取当前登录人信息
			SessionInfo sessionInfo = UserSessionUtil.getSession();
			vo.setBpc_modifyuser(sessionInfo.getId());// 修改人id
			vo.setBpc_modifydate(DateUtil.getCurrentDateToString2());// 修改时间
			bparameterConfService.update(vo);
			j.setSuccess(true);
			j.setMsg("编辑成功！");
		} catch (Exception e) {
			e.printStackTrace();
			j.setMsg("操作失败！" + e.getMessage());
			log.error(e.getMessage(), e);
		}
		return j;
	}

	/**
	 * 从页面的表单获取一条记录id，并删除多条记录
	 * 
	 * @param bpc_id
	 */
	@RequestMapping("/remove")
	@ResponseBody
	public Json remove(HttpServletRequest request, String bpc_id) {
		Json j = new Json();
		try {
			Map<String, Object> queryParams = new HashMap<String, Object>();
			queryParams.put("bpc_id", bpc_id);
			queryParams.put("bpc_dr", SystemConstants.DEL + "");
			bparameterConfService.remove(queryParams);
			j.setMsg("删除成功！");
			j.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
			j.setMsg("操作失败！" + e.getMessage());
			log.error(e.getMessage(), e);
		}
		return j;
	}

	/**
	 * 从页面的表单获取多条记录id，并删除多条记录
	 * 
	 * @param bpc_ids
	 * @return Json
	 * @throws Exception
	 */
	@RequestMapping("/removeMulti")
	@ResponseBody
	public Json removeMulti(HttpServletRequest request, String ids) {
		String[] items = ids.split(",");
		Json j = new Json();
		try {
			Map<String, Object> queryParams = new HashMap<String, Object>();
			queryParams.put("ids", items);
			queryParams.put("bpc_dr", SystemConstants.DEL + "");
			bparameterConfService.removeBatch(queryParams);
			j.setMsg("删除成功！");
			j.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
			j.setMsg("操作失败！" + e.getMessage());
			log.error(e.getMessage(), e);
		}
		return j;
	}

	/**
	 * 从页面的表单获取一条记录id，并删除多条记录
	 * 
	 * @param bpc_id
	 */
	@RequestMapping("/delete")
	@ResponseBody
	public Json delete(HttpServletRequest request, String bpc_id) {
		Json j = new Json();
		try {
			bparameterConfService.delete(bpc_id);
			j.setMsg("删除成功！");
			j.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
			j.setMsg("操作失败！" + e.getMessage());
			log.error(e.getMessage(), e);
		}
		return j;
	}

	/**
	 * 从页面的表单获取多条记录id，并删除多条记录
	 * 
	 * @param bpc_ids
	 * @return Json
	 * @throws Exception
	 */
	@RequestMapping("/deleteMulti")
	@ResponseBody
	public Json deleteMulti(HttpServletRequest request, String ids) {
		String[] items = ids.split(",");
		Json j = new Json();
		try {
			bparameterConfService.deleteBatch(items);
			j.setMsg("删除成功！");
			j.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
			j.setMsg("操作失败！" + e.getMessage());
			log.error(e.getMessage(), e);
		}
		return j;
	}

	@Override
	public Map<?, ?> getQueryCondition(HttpServletRequest request) {
		// TODO Auto-generated method stub
		Map<String, Object> queryParams = new HashMap<String, Object>();

		return queryParams;
	}
}