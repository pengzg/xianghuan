
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
import org.xianghuan.web.controller.BaseController;
import org.xianghuan.web.model.DataGrid;
import org.xianghuan.web.model.Json;
import org.xianghuan.web.model.Pager;
import org.xianghuan.web.model.Query;

import com.xianghuan.auth.base.model.BaseAttamentRel;
import com.xianghuan.auth.base.service.IBaseAttamentRelService;

/**
 * @company 社区在线
 * @author feizhang
 * @version 1.0
 * @date 
 */

@Controller
@RequestMapping("/base/baseAttamentRelControl")
public class BaseAttamentRelController extends BaseController{
	private static final Logger log = Logger.getLogger(BaseAttamentRelController.class);
	@Autowired
	private IBaseAttamentRelService baseAttamentRelService;

	public BaseAttamentRelController() {
		super.folder = "/jsp/base/base/baseattamentrel/";
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
		return baseAttamentRelService.dataGrid(query);
	}

	/**
	 * 跳转到添加页面
	 * @param 
	 * @return
	 */
	@RequestMapping("/addPage")
	public String addPage(HttpServletRequest request) {
		BaseAttamentRel bean = new BaseAttamentRel();
		request.setAttribute(REQUEST_BEAN, bean);
		return redirectJsp("baseattamentrel_"+FORWARD_EDIT_PAGE);
	}
	
	@RequestMapping("/listPage")
	public String listPage(HttpServletRequest request) {
		return redirectJsp("baseattamentrel_"+FORWARD_LIST_PAGE);
	}
	
	@RequestMapping("/listPageRef")
	public String listPageRef() {
		return redirectJsp("baseattamentrel_"+FORWARD_REFERENCE_PAGE);
	}
	/**
	 * 跳转到修改页面
	 * @param request
	 * @param bar_id
	 * @return
	 */
	@RequestMapping("/editPage")
	public String editPage(HttpServletRequest request, String bar_id) {
		BaseAttamentRel bean = baseAttamentRelService.find(bar_id);
		request.setAttribute(REQUEST_BEAN, bean);
		return redirectJsp("baseattamentrel_"+FORWARD_EDIT_PAGE);
	}

	/**
	 * 跳转到查看页面
	 * @param request
	 * @param bar_id
	 * @return
	 */
	@RequestMapping("/detailPage")
	public String detailPage(HttpServletRequest request, String bar_id) {
		BaseAttamentRel bean = baseAttamentRelService.find(bar_id);
		request.setAttribute(REQUEST_BEAN, bean);
		return redirectJsp("baseattamentrel_"+FORWARD_DETAIL_PAGE);
	}

	/**
	 * 增加一条记录
	 * @param BaseAttamentRel vo
	 * @return JSON
	 */
	@RequestMapping("/insert")
	@ResponseBody
	public Json insert(BaseAttamentRel vo) {
		Json j = new Json();
		try {
			baseAttamentRelService.insert(vo);
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
	public Json update(HttpServletRequest request,BaseAttamentRel vo) {
		Json j = new Json();
		try {
			if (vo.getBar_id()!=null){
				baseAttamentRelService.update(vo);
			}else{
				baseAttamentRelService.insert(vo);
			}
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
	 * @param bar_id
	 */
	@RequestMapping("/remove")
	@ResponseBody
	public Json remove(HttpServletRequest request,String bar_id) {
		Json j = new Json();
		try {
			Map<String, Object> queryParams = new HashMap<String, Object>();
			queryParams.put("bar_id",bar_id);
			baseAttamentRelService.remove(queryParams);
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
	 * @param bar_ids
	 * @return Json
	 * @throws Exception
	 */
	@RequestMapping("/removeMulti")
	@ResponseBody
	public Json removeMulti(HttpServletRequest request,String bar_ids) {
		String[] items = bar_ids.split(",");
		Json j = new Json();
		try {
			Map<String, Object> queryParams = new HashMap<String, Object>();
			queryParams.put("ids",items);
			baseAttamentRelService.removeBatch(queryParams);
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
	 * @param bar_id
	 */
	@RequestMapping("/delete")
	@ResponseBody
	public Json delete(HttpServletRequest request,Integer bar_id) {
		Json j = new Json();
		try {
			baseAttamentRelService.delete(bar_id);
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
	 * @param bar_ids
	 * @return Json
	 * @throws Exception
	 */
	@RequestMapping("/deleteMulti")
	@ResponseBody
	public Json deleteMulti(HttpServletRequest request,String bar_ids) {
		String[] items = bar_ids.split(",");
		Json j = new Json();
		try {
			baseAttamentRelService.deleteBatch(items);
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
		//	
		String bar_id = request.getParameter("bar_id");
		if (StringUtils.isNotBlank(bar_id)) {
			queryParams.put("bar_id", bar_id);
		}
		//图片来源1商品，2 签到	
		String bar_source = request.getParameter("bar_source");
		if (StringUtils.isNotBlank(bar_source)) {
			queryParams.put("bar_source", bar_source);
		}
		//商品描述id	
		String bar_source_id = request.getParameter("bar_source_id");
		if (StringUtils.isNotBlank(bar_source_id)) {
			queryParams.put("bar_source_id", bar_source_id);
		}
		//图片id	
		String bar_attament_id = request.getParameter("bar_attament_id");
		if (StringUtils.isNotBlank(bar_attament_id)) {
			queryParams.put("bar_attament_id", bar_attament_id);
		}
		//状态	
		String bar_status = request.getParameter("bar_status");
		if (StringUtils.isNotBlank(bar_status)) {
			queryParams.put("bar_status", bar_status);
		}
		//wtr_dr	
		String bar_dr = request.getParameter("bar_dr");
		if (StringUtils.isNotBlank(bar_dr)) {
			queryParams.put("bar_dr", bar_dr);
		}
		//添加时间	
		String bar_add_time = request.getParameter("bar_add_time");
		if (StringUtils.isNotBlank(bar_add_time)) {
			queryParams.put("bar_add_time", bar_add_time);
		}
		//操作人	
		String bar_add_userid = request.getParameter("bar_add_userid");
		if (StringUtils.isNotBlank(bar_add_userid)) {
			queryParams.put("bar_add_userid", bar_add_userid);
		}
		//排序	
		String bar_order = request.getParameter("bar_order");
		if (StringUtils.isNotBlank(bar_order)) {
			queryParams.put("bar_order", bar_order);
		}
		return queryParams;
	}
}