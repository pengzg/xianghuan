
package com.xianghuan.admin.basetag.controller;

import java.util.HashMap;
import java.util.Map;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.xianghuan.web.controller.BaseController;
import org.xianghuan.web.model.DataGrid;
import org.xianghuan.web.model.Json;
import org.xianghuan.web.model.Pager;
import org.xianghuan.web.model.Query;
import org.xianghuan.web.model.SessionInfo;
import org.xianghuan.web.util.UserSessionUtil;

import com.xianghuan.admin.basetag.model.BaseTag;
import com.xianghuan.admin.basetag.service.IBaseTagService;
import com.xianghuan.admin.basetag.vo.BaseTagVO;

/**
 * @company 社区在线
 * @author pengzg
 * @version 1.0
 * @date 
 */

@Controller
@RequestMapping("/admin/baseTagControl")
public class BaseTagController extends BaseController{
	private static final Logger log = Logger.getLogger(BaseTagController.class);
	@Autowired
	private IBaseTagService baseTagService;

	public BaseTagController() {
		super.folder = "/jsp/basetag/";
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
		return baseTagService.dataGrid(query);
	}

	/**
	 * 跳转到添加页面
	 * @param 
	 * @return
	 */
	@RequestMapping("/addPage")
	public String addPage(HttpServletRequest request) {
		BaseTag bean = new BaseTag();
		request.setAttribute(REQUEST_BEAN, bean);
		return redirectJsp("basetag_"+FORWARD_EDIT_PAGE);
	}
	
	@RequestMapping("/listPage")
	public String listPage(HttpServletRequest request) {
		return redirectJsp("basetag_"+FORWARD_LIST_PAGE);
	}
	
	@RequestMapping("/listPageRef")
	public String listPageRef() {
		return redirectJsp("basetag_"+FORWARD_REFERENCE_PAGE);
	}
	/**
	 * 跳转到修改页面
	 * @param request
	 * @param bt_id
	 * @return
	 */
	@RequestMapping("/editPage")
	public String editPage(HttpServletRequest request, Integer bt_id) {
		BaseTag bean = baseTagService.find(bt_id);
		request.setAttribute(REQUEST_BEAN, bean);
		return redirectJsp("basetag_"+FORWARD_EDIT_PAGE);
	}

	/**
	 * 跳转到查看页面
	 * @param request
	 * @param bt_id
	 * @return
	 */
	@RequestMapping("/detailPage")
	public String detailPage(HttpServletRequest request, Integer bt_id) {
		BaseTag bean = baseTagService.find(bt_id);
		
		BaseTagVO vo = new BaseTagVO();
		BeanUtils.copyProperties(bean, vo);
		
		
		request.setAttribute(REQUEST_BEAN, vo);
		return redirectJsp("basetag_"+FORWARD_DETAIL_PAGE);
	}

	/**
	 * 增加一条记录
	 * @param BaseTag vo
	 * @return JSON
	 */
	@RequestMapping("/insert")
	@ResponseBody
	public Json insert(BaseTag vo) {
		Json j = new Json();
		try {
			baseTagService.insert(vo);
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
	 * @param vo
	 * @return JSON
	 */
	@RequestMapping("/update")
	@ResponseBody
	public Json update(HttpServletRequest request,BaseTag vo) {
		Json j = new Json();
		try {
			SessionInfo sessionInfo = UserSessionUtil.getSession();
			baseTagService.insertAndUpdate(vo,sessionInfo.getId());
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
	 * 从页面的表单获取一条记录id，并删除多条记录
	 * @param bt_id
	 */
	@RequestMapping("/remove")
	@ResponseBody
	public Json remove(HttpServletRequest request,String bt_id) {
		Json j = new Json();
		try {
			Map<String, Object> queryParams = new HashMap<String, Object>();
			queryParams.put("bt_id",bt_id);
			baseTagService.remove(queryParams);
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
	 * @param bt_ids
	 * @return Json
	 * @throws Exception
	 */
	@RequestMapping("/removeMulti")
	@ResponseBody
	public Json removeMulti(HttpServletRequest request,String bt_ids) {
		String[] items = bt_ids.split(",");
		Json j = new Json();
		try {
			Map<String, Object> queryParams = new HashMap<String, Object>();
			queryParams.put("ids",items);
			baseTagService.removeBatch(queryParams);
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
	 * 从页面的表单获取一条记录id，并删除多条记录
	 * @param bt_id
	 */
	@RequestMapping("/delete")
	@ResponseBody
	public Json delete(HttpServletRequest request,Integer bt_id) {
		Json j = new Json();
		try {
			baseTagService.delete(bt_id);
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
	 * @param bt_ids
	 * @return Json
	 * @throws Exception
	 */
	@RequestMapping("/deleteMulti")
	@ResponseBody
	public Json deleteMulti(HttpServletRequest request,String bt_ids) {
		String[] items = bt_ids.split(",");
		Json j = new Json();
		try {
			baseTagService.deleteBatch(items);
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
		// TODO Auto-generated method stub
		Map<String, Object> queryParams = new HashMap<String, Object>();
		//主键	
		String bt_id = request.getParameter("bt_id");
		if (StringUtils.isNotBlank(bt_id)) {
			queryParams.put("bt_id", bt_id);
		}
		//标签名称	
		String bt_title = request.getParameter("bt_title");
		if (StringUtils.isNotBlank(bt_title)) {
			queryParams.put("bt_title", bt_title);
		}
		//标签编码	
		String bt_code = request.getParameter("bt_code");
		if (StringUtils.isNotBlank(bt_code)) {
			queryParams.put("bt_code", bt_code);
		}
		//标签类型 1-用户 2-房子 	
		String bt_type = request.getParameter("bt_type");
		if (StringUtils.isNotBlank(bt_type)) {
			queryParams.put("bt_type", bt_type);
		}
		//图标	
		String bt_icon = request.getParameter("bt_icon");
		if (StringUtils.isNotBlank(bt_icon)) {
			queryParams.put("bt_icon", bt_icon);
		}
		//1在前台显示 2 不在前台显示	
		String bt_is_show = request.getParameter("bt_is_show");
		if (StringUtils.isNotBlank(bt_is_show)) {
			queryParams.put("bt_is_show", bt_is_show);
		}
		//标签排序	
		String bt_order = request.getParameter("bt_order");
		if (StringUtils.isNotBlank(bt_order)) {
			queryParams.put("bt_order", bt_order);
		}
		//添加人	
		String bt_adduserid = request.getParameter("bt_adduserid");
		if (StringUtils.isNotBlank(bt_adduserid)) {
			queryParams.put("bt_adduserid", bt_adduserid);
		}
		//标签状态 1-启用 0-禁用	
		String bt_status = request.getParameter("bt_status");
		if (StringUtils.isNotBlank(bt_status)) {
			queryParams.put("bt_status", bt_status);
		}
		//删除标识位	
		String bt_dr = request.getParameter("bt_dr");
		if (StringUtils.isNotBlank(bt_dr)) {
			queryParams.put("bt_dr", bt_dr);
		}
		//创建时间	
		String bt_addtime = request.getParameter("bt_addtime");
		if (StringUtils.isNotBlank(bt_addtime)) {
			queryParams.put("bt_addtime", bt_addtime);
		}
		//修改时间	
		String bt_updatetime = request.getParameter("bt_updatetime");
		if (StringUtils.isNotBlank(bt_updatetime)) {
			queryParams.put("bt_updatetime", bt_updatetime);
		}
		return queryParams;
	}
}