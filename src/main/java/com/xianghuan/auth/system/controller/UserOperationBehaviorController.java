
package com.xianghuan.auth.system.controller;

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

import com.xianghuan.auth.system.model.UserOperationBehavior;
import com.xianghuan.auth.system.service.IUserOperationBehaviorService;


/**
 * @company 社区在线
 * @author feizhang
 * @version 1.0
 * @date 
 */

@Controller
@RequestMapping("/system/uob/userOperationBehaviorControl")
public class UserOperationBehaviorController extends BaseController{
	private static final Logger log = Logger.getLogger(UserOperationBehaviorController.class);
	@Autowired
	private IUserOperationBehaviorService userOperationBehaviorService;

	public UserOperationBehaviorController() {
		super.folder = "/jsp/user/mobile/useroperationbehavior/";
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
		return userOperationBehaviorService.dataGrid(query);
	}

	/**
	 * 跳转到添加页面
	 * @param 
	 * @return
	 */
	@RequestMapping("/addPage")
	public String addPage(HttpServletRequest request) {
		UserOperationBehavior bean = new UserOperationBehavior();
		request.setAttribute(REQUEST_BEAN, bean);
		return redirectJsp("useroperationbehavior_"+FORWARD_EDIT_PAGE);
	}
	
	@RequestMapping("/listPage")
	public String listPage(HttpServletRequest request) {
		return redirectJsp("useroperationbehavior_"+FORWARD_LIST_PAGE);
	}
	
	@RequestMapping("/listPageRef")
	public String listPageRef() {
		return redirectJsp("useroperationbehavior_"+FORWARD_REFERENCE_PAGE);
	}
	/**
	 * 跳转到修改页面
	 * @param request
	 * @param uob_id
	 * @return
	 */
	@RequestMapping("/editPage")
	public String editPage(HttpServletRequest request, String uob_id) {
		UserOperationBehavior bean = userOperationBehaviorService.find(uob_id);
		request.setAttribute(REQUEST_BEAN, bean);
		return redirectJsp("useroperationbehavior_"+FORWARD_EDIT_PAGE);
	}

	/**
	 * 跳转到查看页面
	 * @param request
	 * @param uob_id
	 * @return
	 */
	@RequestMapping("/detailPage")
	public String detailPage(HttpServletRequest request, String uob_id) {
		UserOperationBehavior bean = userOperationBehaviorService.find(uob_id);
		request.setAttribute(REQUEST_BEAN, bean);
		return redirectJsp("useroperationbehavior_"+FORWARD_DETAIL_PAGE);
	}

	/**
	 * 增加一条记录
	 * @param UserOperationBehavior vo
	 * @return JSON
	 */
	@RequestMapping("/insert")
	@ResponseBody
	public Json insert(UserOperationBehavior vo) {
		Json j = new Json();
		try {
			userOperationBehaviorService.insert(vo);
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
	public Json update(HttpServletRequest request,UserOperationBehavior vo) {
		Json j = new Json();
		try {
			if (StringUtils.isNotBlank(vo.getUob_id()+"")){
				userOperationBehaviorService.update(vo);
			}else{
				userOperationBehaviorService.insert(vo);
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
	 * @param uob_id
	 */
	@RequestMapping("/remove")
	@ResponseBody
	public Json remove(HttpServletRequest request,String uob_id) {
		Json j = new Json();
		try {
			Map<String, Object> queryParams = new HashMap<String, Object>();
			queryParams.put("uob_id",uob_id);
			userOperationBehaviorService.remove(queryParams);
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
	 * @param uob_ids
	 * @return Json
	 * @throws Exception
	 */
	@RequestMapping("/removeMulti")
	@ResponseBody
	public Json removeMulti(HttpServletRequest request,String uob_ids) {
		String[] items = uob_ids.split(",");
		Json j = new Json();
		try {
			Map<String, Object> queryParams = new HashMap<String, Object>();
			queryParams.put("ids",items);
			userOperationBehaviorService.removeBatch(queryParams);
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
	 * @param uob_id
	 */
	@RequestMapping("/delete")
	@ResponseBody
	public Json delete(HttpServletRequest request,String uob_id) {
		Json j = new Json();
		try {
			userOperationBehaviorService.delete(uob_id);
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
	 * @param uob_ids
	 * @return Json
	 * @throws Exception
	 */
	@RequestMapping("/deleteMulti")
	@ResponseBody
	public Json deleteMulti(HttpServletRequest request,String uob_ids) {
		String[] items = uob_ids.split(",");
		Json j = new Json();
		try {
			userOperationBehaviorService.deleteBatch(items);
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
		String uob_id = request.getParameter("uob_id");
		if (StringUtils.isNotBlank(uob_id)) {
			queryParams.put("uob_id", uob_id);
		}
		//	
		String uob_user_id = request.getParameter("uob_user_id");
		if (StringUtils.isNotBlank(uob_user_id)) {
			queryParams.put("uob_user_id", uob_user_id);
		}
		//请求码	
		String uob_req_code = request.getParameter("uob_req_code");
		if (StringUtils.isNotBlank(uob_req_code)) {
			queryParams.put("uob_req_code", uob_req_code);
		}
		//	
		String uob_req_name = request.getParameter("uob_req_name");
		if (StringUtils.isNotBlank(uob_req_name)) {
			queryParams.put("uob_req_name", uob_req_name);
		}
		//请求参数	
		String uob_req_param = request.getParameter("uob_req_param");
		if (StringUtils.isNotBlank(uob_req_param)) {
			queryParams.put("uob_req_param", uob_req_param);
		}
		//请求地址	
		String uob_req_url = request.getParameter("uob_req_url");
		if (StringUtils.isNotBlank(uob_req_url)) {
			queryParams.put("uob_req_url", uob_req_url);
		}
		//	
		String uob_community_id = request.getParameter("uob_community_id");
		if (StringUtils.isNotBlank(uob_community_id)) {
			queryParams.put("uob_community_id", uob_community_id);
		}
		//	
		String uob_shop_id = request.getParameter("uob_shop_id");
		if (StringUtils.isNotBlank(uob_shop_id)) {
			queryParams.put("uob_shop_id", uob_shop_id);
		}
		//行为来源 1-PC 2-APP	
		String uob_source = request.getParameter("uob_source");
		if (StringUtils.isNotBlank(uob_source)) {
			queryParams.put("uob_source", uob_source);
		}
		//行为状态 1-有效 2-无效	
		String uob_status = request.getParameter("uob_status");
		if (StringUtils.isNotBlank(uob_status)) {
			queryParams.put("uob_status", uob_status);
		}
		//	
		String uob_add_time = request.getParameter("uob_add_time");
		if (StringUtils.isNotBlank(uob_add_time)) {
			queryParams.put("uob_add_time", uob_add_time);
		}
		return queryParams;
	}
}