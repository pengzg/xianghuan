
package com.xianghuan.admin.basetag.controller;

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

import com.xianghuan.admin.basetag.model.BaseTagRelation;
import com.xianghuan.admin.basetag.service.IBaseTagRelationService;

/**
 * @company 社区在线
 * @author pengzg
 * @version 1.0
 * @date 
 */

@Controller
@RequestMapping("/base/baseTagRelationControl")
public class BaseTagRelationController extends BaseController{
	private static final Logger log = Logger.getLogger(BaseTagRelationController.class);
	@Autowired
	private IBaseTagRelationService baseTagRelationService;

	public BaseTagRelationController() {
		super.folder = "/jsp/base/base/basetagrelation/";
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
		return baseTagRelationService.dataGrid(query);
	}

	/**
	 * 跳转到添加页面
	 * @param 
	 * @return
	 */
	@RequestMapping("/addPage")
	public String addPage(HttpServletRequest request) {
		BaseTagRelation bean = new BaseTagRelation();
		request.setAttribute(REQUEST_BEAN, bean);
		return redirectJsp("basetagrelation_"+FORWARD_EDIT_PAGE);
	}
	
	@RequestMapping("/listPage")
	public String listPage(HttpServletRequest request) {
		return redirectJsp("basetagrelation_"+FORWARD_LIST_PAGE);
	}
	
	@RequestMapping("/listPageRef")
	public String listPageRef() {
		return redirectJsp("basetagrelation_"+FORWARD_REFERENCE_PAGE);
	}
	/**
	 * 跳转到修改页面
	 * @param request
	 * @param btr_id
	 * @return
	 */
	@RequestMapping("/editPage")
	public String editPage(HttpServletRequest request, Integer btr_id) {
		BaseTagRelation bean = baseTagRelationService.find(btr_id);
		request.setAttribute(REQUEST_BEAN, bean);
		return redirectJsp("basetagrelation_"+FORWARD_EDIT_PAGE);
	}

	/**
	 * 跳转到查看页面
	 * @param request
	 * @param btr_id
	 * @return
	 */
	@RequestMapping("/detailPage")
	public String detailPage(HttpServletRequest request, Integer btr_id) {
		BaseTagRelation bean = baseTagRelationService.find(btr_id);
		request.setAttribute(REQUEST_BEAN, bean);
		return redirectJsp("basetagrelation_"+FORWARD_DETAIL_PAGE);
	}

	/**
	 * 增加一条记录
	 * @param BaseTagRelation vo
	 * @return JSON
	 */
	@RequestMapping("/insert")
	@ResponseBody
	public Json insert(BaseTagRelation vo) {
		Json j = new Json();
		try {
			baseTagRelationService.insert(vo);
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
	public Json update(HttpServletRequest request,BaseTagRelation vo) {
		Json j = new Json();
		try {
			if (vo.getBtr_id()!=null){
				baseTagRelationService.update(vo);
			}else{
				baseTagRelationService.insert(vo);
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
	 * @param btr_id
	 */
	@RequestMapping("/remove")
	@ResponseBody
	public Json remove(HttpServletRequest request,String btr_id) {
		Json j = new Json();
		try {
			Map<String, Object> queryParams = new HashMap<String, Object>();
			queryParams.put("btr_id",btr_id);
			baseTagRelationService.remove(queryParams);
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
	 * @param btr_ids
	 * @return Json
	 * @throws Exception
	 */
	@RequestMapping("/removeMulti")
	@ResponseBody
	public Json removeMulti(HttpServletRequest request,String btr_ids) {
		String[] items = btr_ids.split(",");
		Json j = new Json();
		try {
			Map<String, Object> queryParams = new HashMap<String, Object>();
			queryParams.put("ids",items);
			baseTagRelationService.removeBatch(queryParams);
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
	 * @param btr_id
	 */
	@RequestMapping("/delete")
	@ResponseBody
	public Json delete(HttpServletRequest request,Integer btr_id) {
		Json j = new Json();
		try {
			baseTagRelationService.delete(btr_id);
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
	 * @param btr_ids
	 * @return Json
	 * @throws Exception
	 */
	@RequestMapping("/deleteMulti")
	@ResponseBody
	public Json deleteMulti(HttpServletRequest request,String btr_ids) {
		String[] items = btr_ids.split(",");
		Json j = new Json();
		try {
			baseTagRelationService.deleteBatch(items);
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
		String btr_id = request.getParameter("btr_id");
		if (StringUtils.isNotBlank(btr_id)) {
			queryParams.put("btr_id", btr_id);
		}
		//类型 1用户 2房子	
		String btr_type = request.getParameter("btr_type");
		if (StringUtils.isNotBlank(btr_type)) {
			queryParams.put("btr_type", btr_type);
		}
		//类型id	
		String btr_typeid = request.getParameter("btr_typeid");
		if (StringUtils.isNotBlank(btr_typeid)) {
			queryParams.put("btr_typeid", btr_typeid);
		}
		//标签id	
		String btr_btid = request.getParameter("btr_btid");
		if (StringUtils.isNotBlank(btr_btid)) {
			queryParams.put("btr_btid", btr_btid);
		}
		//状态	
		String btr_state = request.getParameter("btr_state");
		if (StringUtils.isNotBlank(btr_state)) {
			queryParams.put("btr_state", btr_state);
		}
		//删除标记位	
		String btr_dr = request.getParameter("btr_dr");
		if (StringUtils.isNotBlank(btr_dr)) {
			queryParams.put("btr_dr", btr_dr);
		}
		//添加时间	
		String btr_addtime = request.getParameter("btr_addtime");
		if (StringUtils.isNotBlank(btr_addtime)) {
			queryParams.put("btr_addtime", btr_addtime);
		}
		//更新时间	
		String btr_updatetime = request.getParameter("btr_updatetime");
		if (StringUtils.isNotBlank(btr_updatetime)) {
			queryParams.put("btr_updatetime", btr_updatetime);
		}
		return queryParams;
	}
}