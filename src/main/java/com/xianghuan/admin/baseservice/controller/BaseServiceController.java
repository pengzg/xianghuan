
package com.xianghuan.admin.baseservice.controller;

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

import com.xianghuan.admin.baseservice.model.BaseService;
import com.xianghuan.admin.baseservice.service.IBaseServiceService;

/**
 * @company 社区在线
 * @author feizhang
 * @version 1.0
 * @date 
 */

@Controller
@RequestMapping("/admin/baseServiceControl")
public class BaseServiceController extends BaseController{
	private static final Logger log = Logger.getLogger(BaseServiceController.class);
	@Autowired
	private IBaseServiceService baseServiceService;

	public BaseServiceController() {
		super.folder = "/jsp/baseservice/";
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
		return baseServiceService.dataGrid(query);
	}

	/**
	 * 跳转到添加页面
	 * @param 
	 * @return
	 */
	@RequestMapping("/addPage")
	public String addPage(HttpServletRequest request) {
		BaseService bean = new BaseService();
		request.setAttribute(REQUEST_BEAN, bean);
		return redirectJsp("baseservice_"+FORWARD_EDIT_PAGE);
	}
	
	@RequestMapping("/listPage")
	public String listPage(HttpServletRequest request) {
		return redirectJsp("baseservice_"+FORWARD_LIST_PAGE);
	}
	
	@RequestMapping("/listPageRef")
	public String listPageRef() {
		return redirectJsp("baseservice_"+FORWARD_REFERENCE_PAGE);
	}
	/**
	 * 跳转到修改页面
	 * @param request
	 * @param bs_id
	 * @return
	 */
	@RequestMapping("/editPage")
	public String editPage(HttpServletRequest request, Integer bs_id) {
		BaseService bean = baseServiceService.find(bs_id);
		request.setAttribute(REQUEST_BEAN, bean);
		return redirectJsp("baseservice_"+FORWARD_EDIT_PAGE);
	}

	/**
	 * 跳转到查看页面
	 * @param request
	 * @param bs_id
	 * @return
	 */
	@RequestMapping("/detailPage")
	public String detailPage(HttpServletRequest request, Integer bs_id) {
		BaseService bean = baseServiceService.find(bs_id);
		request.setAttribute(REQUEST_BEAN, bean);
		return redirectJsp("baseservice_"+FORWARD_DETAIL_PAGE);
	}

	/**
	 * 增加一条记录
	 * @param BaseService vo
	 * @return JSON
	 */
	@RequestMapping("/insert")
	@ResponseBody
	public Json insert(BaseService vo) {
		Json j = new Json();
		try {
			baseServiceService.insert(vo);
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
	public Json update(HttpServletRequest request,BaseService vo) {
		Json j = new Json();
		try {
			if (vo.getBs_id()!=null){
				baseServiceService.update(vo);
			}else{
				baseServiceService.insert(vo);
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
	 * @param bs_id
	 */
	@RequestMapping("/remove")
	@ResponseBody
	public Json remove(HttpServletRequest request,String bs_id) {
		Json j = new Json();
		try {
			Map<String, Object> queryParams = new HashMap<String, Object>();
			queryParams.put("bs_id",bs_id);
			baseServiceService.remove(queryParams);
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
	 * @param bs_ids
	 * @return Json
	 * @throws Exception
	 */
	@RequestMapping("/removeMulti")
	@ResponseBody
	public Json removeMulti(HttpServletRequest request,String bs_ids) {
		String[] items = bs_ids.split(",");
		Json j = new Json();
		try {
			Map<String, Object> queryParams = new HashMap<String, Object>();
			queryParams.put("ids",items);
			baseServiceService.removeBatch(queryParams);
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
	 * @param bs_id
	 */
	@RequestMapping("/delete")
	@ResponseBody
	public Json delete(HttpServletRequest request,Integer bs_id) {
		Json j = new Json();
		try {
			baseServiceService.delete(bs_id);
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
	 * @param bs_ids
	 * @return Json
	 * @throws Exception
	 */
	@RequestMapping("/deleteMulti")
	@ResponseBody
	public Json deleteMulti(HttpServletRequest request,String bs_ids) {
		String[] items = bs_ids.split(",");
		Json j = new Json();
		try {
			baseServiceService.deleteBatch(items);
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
		//自增id	
		String bs_id = request.getParameter("bs_id");
		if (StringUtils.isNotBlank(bs_id)) {
			queryParams.put("bs_id", bs_id);
		}
		//类别id	
		String bs_categoryid = request.getParameter("bs_categoryid");
		if (StringUtils.isNotBlank(bs_categoryid)) {
			queryParams.put("bs_categoryid", bs_categoryid);
		}
		//类别编码	
		String bs_categorycode = request.getParameter("bs_categorycode");
		if (StringUtils.isNotBlank(bs_categorycode)) {
			queryParams.put("bs_categorycode", bs_categorycode);
		}
		//联系人姓名 	
		String bs_name = request.getParameter("bs_name");
		if (StringUtils.isNotBlank(bs_name)) {
			queryParams.put("bs_name", bs_name);
		}
		//联系人电话	
		String bs_mobile = request.getParameter("bs_mobile");
		if (StringUtils.isNotBlank(bs_mobile)) {
			queryParams.put("bs_mobile", bs_mobile);
		}
		//	
		String bs_contact_name = request.getParameter("bs_contact_name");
		if (StringUtils.isNotBlank(bs_contact_name)) {
			queryParams.put("bs_contact_name", bs_contact_name);
		}
		//地址	
		String bs_address = request.getParameter("bs_address");
		if (StringUtils.isNotBlank(bs_address)) {
			queryParams.put("bs_address", bs_address);
		}
		//图片	
		String bs_image = request.getParameter("bs_image");
		if (StringUtils.isNotBlank(bs_image)) {
			queryParams.put("bs_image", bs_image);
		}
		//拨打数量	
		String bs_clicknum = request.getParameter("bs_clicknum");
		if (StringUtils.isNotBlank(bs_clicknum)) {
			queryParams.put("bs_clicknum", bs_clicknum);
		}
		//经度	
		String bs_lng = request.getParameter("bs_lng");
		if (StringUtils.isNotBlank(bs_lng)) {
			queryParams.put("bs_lng", bs_lng);
		}
		// 纬度	
		String bs_lat = request.getParameter("bs_lat");
		if (StringUtils.isNotBlank(bs_lat)) {
			queryParams.put("bs_lat", bs_lat);
		}
		//简介 	
		String bs_intro = request.getParameter("bs_intro");
		if (StringUtils.isNotBlank(bs_intro)) {
			queryParams.put("bs_intro", bs_intro);
		}
		//评价星级	
		String bs_star = request.getParameter("bs_star");
		if (StringUtils.isNotBlank(bs_star)) {
			queryParams.put("bs_star", bs_star);
		}
		//备注	
		String bs_note = request.getParameter("bs_note");
		if (StringUtils.isNotBlank(bs_note)) {
			queryParams.put("bs_note", bs_note);
		}
		//工作时间	
		String bs_officehour = request.getParameter("bs_officehour");
		if (StringUtils.isNotBlank(bs_officehour)) {
			queryParams.put("bs_officehour", bs_officehour);
		}
		//状态 	
		String bs_state = request.getParameter("bs_state");
		if (StringUtils.isNotBlank(bs_state)) {
			queryParams.put("bs_state", bs_state);
		}
		//删除标记位	
		String bs_dr = request.getParameter("bs_dr");
		if (StringUtils.isNotBlank(bs_dr)) {
			queryParams.put("bs_dr", bs_dr);
		}
		//添加时间	
		String bs_addtime = request.getParameter("bs_addtime");
		if (StringUtils.isNotBlank(bs_addtime)) {
			queryParams.put("bs_addtime", bs_addtime);
		}
		//更新时间	
		String bs_updatetime = request.getParameter("bs_updatetime");
		if (StringUtils.isNotBlank(bs_updatetime)) {
			queryParams.put("bs_updatetime", bs_updatetime);
		}
		return queryParams;
	}
}