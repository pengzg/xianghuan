package com.xianghuan.auth.base.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.xianghuan.util.SystemConstants;
import org.xianghuan.web.controller.BaseController;
import org.xianghuan.web.model.DataGrid;
import org.xianghuan.web.model.Json;
import org.xianghuan.web.model.Pager;
import org.xianghuan.web.model.Query;

import com.xianghuan.auth.base.model.BaseParameter;
import com.xianghuan.auth.base.service.IBaseParameterService;

/**
 * @company 社区在线
 * @author feizhang
 * @version 1.0
 * @date 
 */

@Controller
@RequestMapping("/base/baseParameter")
public class BaseParameterController extends BaseController{
	private static final Logger log = Logger.getLogger(BaseParameterController.class);
	@Autowired
	private IBaseParameterService baseParameterService;

	public BaseParameterController() {
		super.folder = "/securityJsp/auth/base/baseparameter/";
	}

	/**
	 * 获取数据表格
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
		return baseParameterService.dataGrid(query);
	}

	/**
	 * 跳转到添加页面
	 * @param 
	 * @return
	 */
	@RequestMapping("/addPage")
	public String addPage(HttpServletRequest request) {
		BaseParameter bean = new BaseParameter();
		request.setAttribute(REQUEST_BEAN, bean);
		return redirectJsp("baseparameter_"+FORWARD_EDIT_PAGE);
	}
	
	@RequestMapping("/listPage")
	public String listPage(HttpServletRequest request) {
		return redirectJsp("baseparameter_"+FORWARD_LIST_PAGE);
	}
	
	@RequestMapping("/listPageRef")
	public String listPageRef() {
		return redirectJsp("baseparameter_"+FORWARD_REFERENCE_PAGE);
	}
	/**
	 * 跳转到修改页面
	 * @param request
	 * @param bp_id
	 * @return
	 */
	@RequestMapping("/editPage")
	public String editPage(HttpServletRequest request, Integer bp_id) {
		BaseParameter bean = baseParameterService.find(bp_id);
		request.setAttribute(REQUEST_BEAN, bean);
		return redirectJsp("baseparameter_"+FORWARD_EDIT_PAGE);
	}

	/**
	 * 跳转到查看页面
	 * @param request
	 * @param bp_id
	 * @return
	 */
	@RequestMapping("/detailPage")
	public String detailPage(HttpServletRequest request, Integer bp_id) {
		BaseParameter bean = baseParameterService.find(bp_id);
		request.setAttribute(REQUEST_BEAN, bean);
		return redirectJsp("baseparameter_"+FORWARD_DETAIL_PAGE);
	}

	/**
	 * 增加一条记录
	 * @param BaseParameter vo
	 * @return JSON
	 */
	@RequestMapping("/insert")
	@ResponseBody
	public Json insert(BaseParameter vo) {
		Json j = new Json();
		try {
			baseParameterService.insert(vo);
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
	 * 增加一条记录
	 * @param BaseParameter vo
	 * @return JSON
	 */
	@RequestMapping("/update")
	@ResponseBody
	public Json update(BaseParameter vo) {
		Json j = new Json();
		try {
			baseParameterService.update(vo);
			j.setSuccess(true);
			j.setMsg("修改成功！");
		} catch (Exception e) {
			e.printStackTrace();
			j.setMsg("操作失败！"+e.getMessage());
			log.error(e.getMessage(), e);
		}
		return j;
	}

	/**
	 * 从页面的表单获取一条记录id，并删除多条记录
	 * @param bp_id
	 */
	@RequestMapping("/remove")
	@ResponseBody
	public Json remove(HttpServletRequest request,String bp_id) {
		Json j = new Json();
		try {
			Map<String, Object> queryParams = new HashMap<String, Object>();
			queryParams.put("bp_id",bp_id);
			queryParams.put("bp_dr",SystemConstants.DEL);
			baseParameterService.remove(queryParams);
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
	 * @param bp_ids
	 * @return Json
	 * @throws Exception
	 */
	@RequestMapping("/removeMulti")
	@ResponseBody
	public Json removeMulti(HttpServletRequest request,String bp_ids) {
		String[] items = bp_ids.split(",");
		Json j = new Json();
		try {
			Map<String, Object> queryParams = new HashMap<String, Object>();
			queryParams.put("ids",items);
			baseParameterService.removeBatch(queryParams);
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
	 * @param bp_ids
	 * @return Json
	 * @throws Exception
	 */
	@RequestMapping("/deleteMulti")
	@ResponseBody
	public Json deleteMulti(HttpServletRequest request,String bp_ids) {
		String[] items = bp_ids.split(",");
		Json j = new Json();
		try {
			baseParameterService.deleteBatch(items);
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
	 * 是否启用
	 * @param 
	 * @return
	 */
	@RequestMapping("/setDr")
	@ResponseBody
	public Json setDr(HttpServletRequest request, Integer bp_id) {
		
		BaseParameter vo=baseParameterService.find(bp_id);
		
		Json j = new Json();	
		try {
			if (Integer.valueOf(vo.getBp_dr()) != 1) {
				vo.setBp_dr(1+"");
			} else {
				vo.setBp_dr(0+"");
			}						
			baseParameterService.update(vo);
			j.setSuccess(true);
			j.setMsg("提交成功！");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			j.setSuccess(false);
			j.setMsg("提交失败！");
		}		
		return j;
	}
	
	@Override
	public Map<?, ?> getQueryCondition(HttpServletRequest request) {
		// TODO Auto-generated method stub
		Map<String, Object> queryParams = new HashMap<String, Object>();
		//主键	
		String bp_id = request.getParameter("bp_id");
		if (StringUtils.isNotBlank(bp_id)) {
			queryParams.put("bp_id", bp_id);
		}
		//键	
		String bp_key = request.getParameter("bp_key");
		if (StringUtils.isNotBlank(bp_key)) {
			queryParams.put("bp_key_like", bp_key);
		}
		//值	
		String bp_value = request.getParameter("bp_value");
		if (StringUtils.isNotBlank(bp_value)) {
			queryParams.put("bp_value", bp_value);
		}
		//备注	
		String bp_remark = request.getParameter("bp_remark");
		if (StringUtils.isNotBlank(bp_remark)) {
			queryParams.put("bp_remark", bp_remark);
		}
		//删除标志位	
		String bp_dr = request.getParameter("bp_dr");
		if (StringUtils.isNotBlank(bp_dr)) {
			queryParams.put("bp_dr", bp_dr);
		}
		//版本	
		String bp_version = request.getParameter("bp_version");
		if (StringUtils.isNotBlank(bp_version)) {
			queryParams.put("bp_version", bp_version);
		}
		//新增人	
		String bp_adduser = request.getParameter("bp_adduser");
		if (StringUtils.isNotBlank(bp_adduser)) {
			queryParams.put("bp_adduser", bp_adduser);
		}
		//修改人	
		String bp_updateuser = request.getParameter("bp_updateuser");
		if (StringUtils.isNotBlank(bp_updateuser)) {
			queryParams.put("bp_updateuser", bp_updateuser);
		}
		//状态	
		String status = request.getParameter("status");
		if (StringUtils.isNotBlank(status)) {
			queryParams.put("status", status);
		}
		//新增时间	
		String add_time = request.getParameter("add_time");
		if (StringUtils.isNotBlank(add_time)) {
			queryParams.put("add_time", add_time);
		}
		//修改时间	
		String update_time = request.getParameter("update_time");
		if (StringUtils.isNotBlank(update_time)) {
			queryParams.put("update_time", update_time);
		}
		return queryParams;
	}
}