/*
 * Powered By [rapid-framework]
 * Web Site: http://www.rapid-framework.org.cn
 * Google Code: http://code.google.com/p/rapid-framework/
 * Since 2008 - 2014
 */


package com.xianghuan.auth.system.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.xianghuan.web.controller.BaseController;
import org.xianghuan.web.model.DataGrid;
import org.xianghuan.web.model.Json;
import org.xianghuan.web.model.Pager;
import org.xianghuan.web.model.Query;

import com.xianghuan.auth.system.model.SysActionLog;
import com.xianghuan.auth.system.service.ISysActionLogService;

/**
 * @author admin
 * @version 1.0
 * @since 1.0
 */

@Controller
@RequestMapping("/system/sysActionLogControl")
public class SysActionLogController extends BaseController{
	private static final Logger log = Logger.getLogger(SysActionLogController.class);
	@Autowired
	private ISysActionLogService sysActionLogService;

	public SysActionLogController() {
		super.folder = "/securityJsp/auth/system/sysactionlog/";
	}

	/**
	 * 获取数据表格
	 * 
	 * @param 
	 * @return
	 */
	@RequestMapping("/dataGrid")
	@ResponseBody
	public DataGrid dataGrid(HttpServletRequest request, Pager pager) {
		Query query = new Query();
		query.setPager(pager);
		query.setQueryParams((Map<String, Object>) getQueryCondition(request));
		return sysActionLogService.dataGrid(query);
	}

	/**
	 * 跳转到添加页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/addPage")
	public String addPage() {
		return redirectJsp("sysactionlog_"+FORWARD_EDIT_PAGE);
	}
	
	@RequestMapping("/listPage")
	public String listPage() {
		return redirectJsp("sysactionlog_"+FORWARD_LIST_PAGE);
	}
	/**
	 * 跳转到修改页面
	 * 
	 * @return
	 */
	@RequestMapping("/editPage")
	public String editPage(HttpServletRequest request, String sal_id) {
		SysActionLog bean = sysActionLogService.find(sal_id);
		request.setAttribute(REQUEST_BEAN, bean);
		return redirectJsp("sysactionlog_"+FORWARD_EDIT_PAGE);
	}

	/**
	 * 跳转到查看页面
	 * 
	 * @return
	 */
	@RequestMapping("/detailPage")
	public String detailPage(HttpServletRequest request, String sal_id) {
		SysActionLog bean = sysActionLogService.find(sal_id);
		request.setAttribute(REQUEST_BEAN, bean);
		return redirectJsp("sysactionlog_"+FORWARD_DETAIL_PAGE);
	}

	/**
	 * 增加一条记录
	 * 
	 * @param vo
	 * @return
	 */
	@RequestMapping("/insert")
	@ResponseBody
	public Json insert(SysActionLog vo) {
		Json j = new Json();
		try {
			sysActionLogService.insert(vo);
			j.setSuccess(true);
			j.setMsg("增加成功！");
		} catch (Exception e) {
			e.printStackTrace();
			j.setMsg("操作失败！"+e.getMessage());
			log.error(e.getMessage(), e);
		}
		return j;
	}

	/**
	 * 修改一条记录
	 * 
	 * @param vo
	 * @return
	 */
	@RequestMapping("/update")
	@ResponseBody
	public Json update(SysActionLog vo) {
		Json j = new Json();
		try {
			sysActionLogService.update(vo);
			j.setSuccess(true);
			j.setMsg("编辑成功！");
		} catch (Exception e) {
			e.printStackTrace();
			j.setMsg("操作失败！"+e.getMessage());
			log.error(e.getMessage(), e);
		}
		return j;
	}

	/**
	 * 从页面的表单获取多条记录id，并删除多条记录
	 * 
	 * @param
	 * @param
	 * @param
	 * @param
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/delete")
	@ResponseBody
	public Json delete(String sal_id) {
		Json j = new Json();
		try {
			sysActionLogService.delete(sal_id);
			j.setMsg("删除成功！");
			j.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
			j.setMsg("操作失败！"+e.getMessage());
			log.error(e.getMessage(), e);
		}
		return j;
	}

	/**
	 * 从页面的表单获取多条记录id，并删除多条记录
	 * 
	 * @param sal_ids
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/deleteMulti")
	@ResponseBody
	public Json deleteMulti(String ids) {
		String[] id_s = ids.split(DEFAULT_STRING_SEPARATOR);
		Json j = new Json();
		try {
			sysActionLogService.deleteBatch(id_s);
			j.setMsg("删除成功！");
			j.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
			j.setMsg("操作失败！"+e.getMessage());
			log.error(e.getMessage(), e);
		}
		return j;
	}

	@Override
	public Map<?, ?> getQueryCondition(HttpServletRequest request) {
		Map<String, Object> queryParams = new HashMap<String, Object>();
		String sal_createname = request.getParameter("sal_createname");
		if(StringUtils.isNotBlank(sal_createname)) {
			queryParams.put("sal_createname", sal_createname);
		}
		String sal_plattype = request.getParameter("sal_plattype");
		if(StringUtils.isNotBlank(sal_plattype)) {
			queryParams.put("sal_plattype", sal_plattype);
		}
		String sal_type = request.getParameter("sal_type");
		if(StringUtils.isNotBlank(sal_type)) {
			queryParams.put("sal_type", sal_type);
		}
		String sal_desc = request.getParameter("sal_desc");
		if(StringUtils.isNotBlank(sal_desc)) {
			queryParams.put("sal_desc", sal_desc);
		}
		return queryParams;
	}
}