package com.xianghuan.admin.user.controller;

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

import com.xianghuan.admin.user.model.UserBase;
import com.xianghuan.admin.user.service.IUserBaseService;

/**
 * @company 社区在线
 * @author feizhang
 * @version 1.0
 * @date 
 */

@Controller
@RequestMapping("/admin/userBaseControl")
public class UserBaseController extends BaseController{
	private static final Logger log = Logger.getLogger(UserBaseController.class);
	@Autowired
	private IUserBaseService userBaseService;

	public UserBaseController() {
		super.folder = "/jsp/userbase/";
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
		return userBaseService.dataGrid(query);
	}

	/**
	 * 跳转到添加页面
	 * @param 
	 * @return
	 */
	@RequestMapping("/addPage")
	public String addPage(HttpServletRequest request) {
		UserBase bean = new UserBase();
		request.setAttribute(REQUEST_BEAN, bean);
		return redirectJsp("userbase_"+FORWARD_EDIT_PAGE);
	}
	
	@RequestMapping("/listPage")
	public String listPage(HttpServletRequest request) {
		return redirectJsp("userbase_"+FORWARD_LIST_PAGE);
	}
	
	@RequestMapping("/listPageRef")
	public String listPageRef() {
		return redirectJsp("userbase_"+FORWARD_REFERENCE_PAGE);
	}
	/**
	 * 跳转到修改页面
	 * @param request
	 * @param ub_id
	 * @return
	 */
	@RequestMapping("/editPage")
	public String editPage(HttpServletRequest request, Integer ub_id) {
		UserBase bean = userBaseService.find(ub_id);
		request.setAttribute(REQUEST_BEAN, bean);
		return redirectJsp("userbase_"+FORWARD_EDIT_PAGE);
	}

	/**
	 * 跳转到查看页面
	 * @param request
	 * @param ub_id
	 * @return
	 */
	@RequestMapping("/detailPage")
	public String detailPage(HttpServletRequest request, Integer ub_id) {
		UserBase bean = userBaseService.find(ub_id);
		request.setAttribute(REQUEST_BEAN, bean);
		return redirectJsp("userbase_"+FORWARD_DETAIL_PAGE);
	}

	/**
	 * 增加一条记录
	 * @param UserBase vo
	 * @return JSON
	 */
	@RequestMapping("/insert")
	@ResponseBody
	public Json insert(UserBase vo) {
		Json j = new Json();
		try {
			userBaseService.insert(vo);
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
	public Json update(HttpServletRequest request,UserBase vo) {
		Json j = new Json();
		try {
			if (vo.getUb_id()!=null){
				userBaseService.update(vo);
			}else{
				userBaseService.insert(vo);
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
	 * @param ub_id
	 */
	@RequestMapping("/remove")
	@ResponseBody
	public Json remove(HttpServletRequest request,String ub_id) {
		Json j = new Json();
		try {
			Map<String, Object> queryParams = new HashMap<String, Object>();
			queryParams.put("ub_id",ub_id);
			userBaseService.remove(queryParams);
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
	 * @param ub_ids
	 * @return Json
	 * @throws Exception
	 */
	@RequestMapping("/removeMulti")
	@ResponseBody
	public Json removeMulti(HttpServletRequest request,String ub_ids) {
		String[] items = ub_ids.split(",");
		Json j = new Json();
		try {
			Map<String, Object> queryParams = new HashMap<String, Object>();
			queryParams.put("ids",items);
			userBaseService.removeBatch(queryParams);
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
	 * @param ub_id
	 */
	@RequestMapping("/delete")
	@ResponseBody
	public Json delete(HttpServletRequest request,Integer ub_id) {
		Json j = new Json();
		try {
			userBaseService.delete(ub_id);
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
	 * @param ub_ids
	 * @return Json
	 * @throws Exception
	 */
	@RequestMapping("/deleteMulti")
	@ResponseBody
	public Json deleteMulti(HttpServletRequest request,String ub_ids) {
		String[] items = ub_ids.split(",");
		Json j = new Json();
		try {
			userBaseService.deleteBatch(items);
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
		String ub_id = request.getParameter("ub_id");
		if (StringUtils.isNotBlank(ub_id)) {
			queryParams.put("ub_id", ub_id);
		}
		//用户真实姓名	
		String ub_realname = request.getParameter("ub_realname");
		if (StringUtils.isNotBlank(ub_realname)) {
			queryParams.put("ub_realname", ub_realname);
		}
		//	
		String ub_username = request.getParameter("ub_username");
		if (StringUtils.isNotBlank(ub_username)) {
			queryParams.put("ub_username", ub_username);
		}
		//	
		String ub_mobile = request.getParameter("ub_mobile");
		if (StringUtils.isNotBlank(ub_mobile)) {
			queryParams.put("ub_mobile", ub_mobile);
		}
		//经度	
		String ub_lng = request.getParameter("ub_lng");
		if (StringUtils.isNotBlank(ub_lng)) {
			queryParams.put("ub_lng", ub_lng);
		}
		//纬度	
		String ub_lat = request.getParameter("ub_lat");
		if (StringUtils.isNotBlank(ub_lat)) {
			queryParams.put("ub_lat", ub_lat);
		}
		//微信openid	
		String ub_openid = request.getParameter("ub_openid");
		if (StringUtils.isNotBlank(ub_openid)) {
			queryParams.put("ub_openid", ub_openid);
		}
		//	
		String ub_unionid = request.getParameter("ub_unionid");
		if (StringUtils.isNotBlank(ub_unionid)) {
			queryParams.put("ub_unionid", ub_unionid);
		}
		//邮件	
		String ub_email = request.getParameter("ub_email");
		if (StringUtils.isNotBlank(ub_email)) {
			queryParams.put("ub_email", ub_email);
		}
		//性别 	
		String ub_sex = request.getParameter("ub_sex");
		if (StringUtils.isNotBlank(ub_sex)) {
			queryParams.put("ub_sex", ub_sex);
		}
		//	
		String ub_last_logintime = request.getParameter("ub_last_logintime");
		if (StringUtils.isNotBlank(ub_last_logintime)) {
			queryParams.put("ub_last_logintime", ub_last_logintime);
		}
		//注册时间	
		String ub_regtime = request.getParameter("ub_regtime");
		if (StringUtils.isNotBlank(ub_regtime)) {
			queryParams.put("ub_regtime", ub_regtime);
		}
		//	
		String ub_pinyin = request.getParameter("ub_pinyin");
		if (StringUtils.isNotBlank(ub_pinyin)) {
			queryParams.put("ub_pinyin", ub_pinyin);
		}
		//	
		String ub_status = request.getParameter("ub_status");
		if (StringUtils.isNotBlank(ub_status)) {
			queryParams.put("ub_status", ub_status);
		}
		//	
		String ub_dr = request.getParameter("ub_dr");
		if (StringUtils.isNotBlank(ub_dr)) {
			queryParams.put("ub_dr", ub_dr);
		}
		//	
		String ub_addtime = request.getParameter("ub_addtime");
		if (StringUtils.isNotBlank(ub_addtime)) {
			queryParams.put("ub_addtime", ub_addtime);
		}
		//	
		String ub_updatetime = request.getParameter("ub_updatetime");
		if (StringUtils.isNotBlank(ub_updatetime)) {
			queryParams.put("ub_updatetime", ub_updatetime);
		}
		return queryParams;
	}
}