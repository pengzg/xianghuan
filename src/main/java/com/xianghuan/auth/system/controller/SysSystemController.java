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
import org.xianghuan.jdbc.exception.BusinessException;
import org.xianghuan.web.controller.BaseController;
import org.xianghuan.web.model.DataGrid;
import org.xianghuan.web.model.Json;
import org.xianghuan.web.model.Pager;
import org.xianghuan.web.model.Query;

import com.xianghuan.auth.system.model.SysSystem;
import com.xianghuan.auth.system.service.ISysSystemService;

/**
 * 
 * @ClassName: SysSystemController
 * @Description: 菜单管理
 * @author shenwu
 * @date 2014年6月30日 下午1:27:45
 *
 */
@Controller
@RequestMapping("/system/sysSystemControl")
public class SysSystemController extends BaseController{
	private static final Logger log = Logger.getLogger(SysSystemController.class);
	@Autowired
	private ISysSystemService sysSystemService;

	public SysSystemController() {
		super.folder = "/securityJsp/auth/system/syssystem/";
	}

	/**
	 * 获取数据表格
	 * @param request
	 * @param pager
	 * @return
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping("/dataGrid")
	@ResponseBody
	public DataGrid dataGrid(HttpServletRequest request, Pager pager) {
		Query query = new Query();
		query.setPager(pager);
		query.setQueryParams((Map<String, Object>) getQueryCondition(request));
		return sysSystemService.dataGrid(query);
	}

	/**
	 * 跳转到添加页面
	 * @param 
	 * @return
	 */
	@RequestMapping("/addPage")
	public String addPage() {
		return redirectJsp("syssystem_"+FORWARD_EDIT_PAGE);
	}
	
	@RequestMapping("/listPage")
	public String listPage() {
		return redirectJsp("syssystem_"+FORWARD_LIST_PAGE);
	}
	/**
	 * 跳转到修改页面
	 * @param request
	 * @param ss_id
	 * @return
	 */
	@RequestMapping("/editPage")
	public String editPage(HttpServletRequest request, String ss_id) {
		SysSystem bean = sysSystemService.find(ss_id);
		request.setAttribute(REQUEST_BEAN, bean);
		return redirectJsp("syssystem_"+FORWARD_EDIT_PAGE);
	}

	/**
	 * 跳转到查看页面
	 * @param request
	 * @param ss_id
	 * @return
	 */
	@RequestMapping("/detailPage")
	public String detailPage(HttpServletRequest request, String ss_id) {
		SysSystem bean = sysSystemService.find(ss_id);
		request.setAttribute(REQUEST_BEAN, bean);
		return redirectJsp("syssystem_"+FORWARD_DETAIL_PAGE);
	}

	/**
	 * 增加一条记录
	 * @param SysSystem vo
	 * @return JSON
	 */
	@RequestMapping("/insert")
	@ResponseBody
	public Json insert(SysSystem vo) {
		Json j = new Json();
		try {
			sysSystemService.insert(vo);
			j.setSuccess(true);
			j.setMsg("增加成功！");
		} catch (BusinessException e) {
			e.printStackTrace();
			j.setMsg("操作失败！"+e.getMessage());
			log.error(e.getMessage(), e);
		}
		return j;
	}

	/**
	 * 修改一条记录
	 * @param vo
	 * @return JSON
	 */
	@RequestMapping("/update")
	@ResponseBody
	public Json update(SysSystem vo) {
		Json j = new Json();
		try {
			sysSystemService.update(vo);
			j.setSuccess(true);
			j.setMsg("编辑成功！");
		} catch (BusinessException e) {
			e.printStackTrace();
			j.setMsg("操作失败！"+e.getMessage());
			log.error(e.getMessage(), e);
		}
		return j;
	}

	/**
	 * 从页面的表单获取一条记录id，并删除多条记录
	 * @param ss_id
	 */
	@RequestMapping("/delete")
	@ResponseBody
	public Json delete(String ss_id) {
		Json j = new Json();
		try {
			sysSystemService.delete(ss_id);
			j.setMsg("删除成功！");
			j.setSuccess(true);
		} catch (BusinessException e) {
			e.printStackTrace();
			j.setMsg("操作失败！"+e.getMessage());
			log.error(e.getMessage(), e);
		}
		return j;
	}

	/**
	 * 从页面的表单获取多条记录id，并删除多条记录
	 * @param ss_ids
	 * @return Json
	 * @throws BusinessException
	 */
	@RequestMapping("/deleteMulti")
	@ResponseBody
	public Json deleteMulti(String ss_ids) {
		String[] ids = ss_ids.split(ss_ids);
		Json j = new Json();
		try {
			sysSystemService.deleteBatch(ids);
			j.setMsg("删除成功！");
			j.setSuccess(true);
		} catch (BusinessException e) {
			e.printStackTrace();
			j.setMsg("操作失败！"+e.getMessage());
			log.error(e.getMessage(), e);
		}
		return j;
	}

	@Override
	public Map<?, ?> getQueryCondition(HttpServletRequest request) {
		Map<String, Object> queryParams = new HashMap<String, Object>();
		String ss_name = request.getParameter("ss_name");
		if(StringUtils.isNotBlank(ss_name)) {
			queryParams.put("ss_name",ss_name);
		}
		String ss_code = request.getParameter("ss_code");
		if(StringUtils.isNotBlank(ss_code)) {
			queryParams.put("ss_code",ss_code);
		}
		return queryParams;
	}
}