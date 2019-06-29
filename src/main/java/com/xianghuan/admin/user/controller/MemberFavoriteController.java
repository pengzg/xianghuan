
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

import com.xianghuan.admin.user.model.MemberFavorite;
import com.xianghuan.admin.user.service.IMemberFavoriteService;

/**
 * @company 社区在线
 * @author pengzg
 * @version 1.0
 * @date 
 */

@Controller
@RequestMapping("/base/memberFavoriteControl")
public class MemberFavoriteController extends BaseController{
	private static final Logger log = Logger.getLogger(MemberFavoriteController.class);
	@Autowired
	private IMemberFavoriteService memberFavoriteService;

	public MemberFavoriteController() {
		super.folder = "/jsp/base/base/memberfavorite/";
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
		return memberFavoriteService.dataGrid(query);
	}

	/**
	 * 跳转到添加页面
	 * @param 
	 * @return
	 */
	@RequestMapping("/addPage")
	public String addPage(HttpServletRequest request) {
		MemberFavorite bean = new MemberFavorite();
		request.setAttribute(REQUEST_BEAN, bean);
		return redirectJsp("memberfavorite_"+FORWARD_EDIT_PAGE);
	}
	
	@RequestMapping("/listPage")
	public String listPage(HttpServletRequest request) {
		return redirectJsp("memberfavorite_"+FORWARD_LIST_PAGE);
	}
	
	@RequestMapping("/listPageRef")
	public String listPageRef() {
		return redirectJsp("memberfavorite_"+FORWARD_REFERENCE_PAGE);
	}
	/**
	 * 跳转到修改页面
	 * @param request
	 * @param mf_id
	 * @return
	 */
	@RequestMapping("/editPage")
	public String editPage(HttpServletRequest request, Integer mf_id) {
		MemberFavorite bean = memberFavoriteService.find(mf_id);
		request.setAttribute(REQUEST_BEAN, bean);
		return redirectJsp("memberfavorite_"+FORWARD_EDIT_PAGE);
	}

	/**
	 * 跳转到查看页面
	 * @param request
	 * @param mf_id
	 * @return
	 */
	@RequestMapping("/detailPage")
	public String detailPage(HttpServletRequest request, Integer mf_id) {
		MemberFavorite bean = memberFavoriteService.find(mf_id);
		request.setAttribute(REQUEST_BEAN, bean);
		return redirectJsp("memberfavorite_"+FORWARD_DETAIL_PAGE);
	}

	/**
	 * 增加一条记录
	 * @param MemberFavorite vo
	 * @return JSON
	 */
	@RequestMapping("/insert")
	@ResponseBody
	public Json insert(MemberFavorite vo) {
		Json j = new Json();
		try {
			memberFavoriteService.insert(vo);
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
	public Json update(HttpServletRequest request,MemberFavorite vo) {
		Json j = new Json();
		try {
			if (vo.getMf_id()!=null){
				memberFavoriteService.update(vo);
			}else{
				memberFavoriteService.insert(vo);
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
	 * @param mf_id
	 */
	@RequestMapping("/remove")
	@ResponseBody
	public Json remove(HttpServletRequest request,String mf_id) {
		Json j = new Json();
		try {
			Map<String, Object> queryParams = new HashMap<String, Object>();
			queryParams.put("mf_id",mf_id);
			memberFavoriteService.remove(queryParams);
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
	 * @param mf_ids
	 * @return Json
	 * @throws Exception
	 */
	@RequestMapping("/removeMulti")
	@ResponseBody
	public Json removeMulti(HttpServletRequest request,String mf_ids) {
		String[] items = mf_ids.split(",");
		Json j = new Json();
		try {
			Map<String, Object> queryParams = new HashMap<String, Object>();
			queryParams.put("ids",items);
			memberFavoriteService.removeBatch(queryParams);
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
	 * @param mf_id
	 */
	@RequestMapping("/delete")
	@ResponseBody
	public Json delete(HttpServletRequest request,Integer mf_id) {
		Json j = new Json();
		try {
			memberFavoriteService.delete(mf_id);
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
	 * @param mf_ids
	 * @return Json
	 * @throws Exception
	 */
	@RequestMapping("/deleteMulti")
	@ResponseBody
	public Json deleteMulti(HttpServletRequest request,String mf_ids) {
		String[] items = mf_ids.split(",");
		Json j = new Json();
		try {
			memberFavoriteService.deleteBatch(items);
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
		String mf_id = request.getParameter("mf_id");
		if (StringUtils.isNotBlank(mf_id)) {
			queryParams.put("mf_id", mf_id);
		}
		//用户主键	
		String mf_member_id = request.getParameter("mf_member_id");
		if (StringUtils.isNotBlank(mf_member_id)) {
			queryParams.put("mf_member_id", mf_member_id);
		}
		//关注类型 1用户，2房源	
		String mf_favorite_type = request.getParameter("mf_favorite_type");
		if (StringUtils.isNotBlank(mf_favorite_type)) {
			queryParams.put("mf_favorite_type", mf_favorite_type);
		}
		//关注主键	
		String mf_favoriteid = request.getParameter("mf_favoriteid");
		if (StringUtils.isNotBlank(mf_favoriteid)) {
			queryParams.put("mf_favoriteid", mf_favoriteid);
		}
		//请求url	
		String mf_url = request.getParameter("mf_url");
		if (StringUtils.isNotBlank(mf_url)) {
			queryParams.put("mf_url", mf_url);
		}
		//状态标志位 1未删除，0删除	
		String mf_dr = request.getParameter("mf_dr");
		if (StringUtils.isNotBlank(mf_dr)) {
			queryParams.put("mf_dr", mf_dr);
		}
		//1：正常，2：禁用	
		String mf_status = request.getParameter("mf_status");
		if (StringUtils.isNotBlank(mf_status)) {
			queryParams.put("mf_status", mf_status);
		}
		//添加时间	
		String mf_add_time = request.getParameter("mf_add_time");
		if (StringUtils.isNotBlank(mf_add_time)) {
			queryParams.put("mf_add_time", mf_add_time);
		}
		//更新时间	
		String mf_update_time = request.getParameter("mf_update_time");
		if (StringUtils.isNotBlank(mf_update_time)) {
			queryParams.put("mf_update_time", mf_update_time);
		}
		return queryParams;
	}
}