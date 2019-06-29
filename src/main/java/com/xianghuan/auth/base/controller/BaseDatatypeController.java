/*
 * Powered By [rapid-framework]
 * Web Site: http://www.rapid-framework.org.cn
 * Google Code: http://code.google.com/p/rapid-framework/
 * Since 2008 - 2014
 */


package com.xianghuan.auth.base.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
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
import org.xianghuan.web.model.SessionInfo;
import org.xianghuan.web.util.UserSessionUtil;

import com.xianghuan.auth.base.model.BaseDatatype;
import com.xianghuan.auth.base.service.IBaseDatatypeService;

/**
 * @author hhh
 * @version 1.0
 * @since 1.0
 */

@Controller
@RequestMapping("/base/baseDatatypeControl")
public class BaseDatatypeController extends BaseController{
	private static final Logger log = Logger.getLogger(BaseDatatypeController.class);
	@Autowired
	private IBaseDatatypeService baseDatatypeService;


	public BaseDatatypeController() {
		super.folder = "/securityJsp/auth/base/basedatatype/";
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
		return baseDatatypeService.dataGrid(query);
	}

	/**
	 * 跳转到添加页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/addPage")
	public String addPage() {
		return redirectJsp("basedatatype_"+FORWARD_EDIT_PAGE);
	}
	
	@RequestMapping("/listPage")
	public String listPage() {
		return redirectJsp("basedatatype_"+FORWARD_LIST_PAGE);
	}
	/**
	 * 跳转到修改页面
	 * 
	 * @return
	 */
	@RequestMapping("/editPage")
	public String editPage(HttpServletRequest request, String bdt_id) {
		BaseDatatype bean = baseDatatypeService.find(bdt_id);
		request.setAttribute(REQUEST_BEAN, bean);
		return redirectJsp("basedatatype_"+FORWARD_EDIT_PAGE);
	}

	/**
	 * 跳转到查看页面
	 * 
	 * @return
	 */
	@RequestMapping("/detailPage")
	public String detailPage(HttpServletRequest request, String bdt_id) {
		BaseDatatype bean = baseDatatypeService.find(bdt_id);
		request.setAttribute(REQUEST_BEAN, bean);
		return redirectJsp("basedatatype_"+FORWARD_DETAIL_PAGE);
	}

	/**
	 * 增加一条记录
	 * 
	 * @param vo
	 * @return
	 */
	@RequestMapping("/insert")
	@ResponseBody
	public Json insert(BaseDatatype vo) {
		Json j = new Json();
		try {
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("bdt_dr", SystemConstants.SAVE);
			map.put("bdt_code", vo.getBdt_code());
			List<BaseDatatype> list =  select(map);
			if(list != null &&  list.size()>0) {
				j.setMsg("这个编码已存在！");
			}else {
				baseDatatypeService.insert(vo);
				j.setSuccess(true);
				j.setMsg("增加成功！");
			}
		} catch (Exception e) {
			e.printStackTrace();
			j.setMsg("操作失败！"+e.getMessage());
			log.error(e.getMessage(), e);
		}
		return j;
	}

	@RequestMapping("/synchroFlush")
	@ResponseBody
	public Json synchroFlush() {
		Json j = new Json();
		try {
			baseDatatypeService.synchroFlush();
			j.setSuccess(true);
			j.setMsg("同步更新成功！");
		} catch (Exception e) {
			e.printStackTrace();
			j.setMsg("同步更新成功！" + e.getMessage());
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
	public Json update(BaseDatatype vo) {
		Json j = new Json();
		try {
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("bdt_dr", SystemConstants.SAVE);
			map.put("bdt_code", vo.getBdt_code());
			List<BaseDatatype> list =  select(map);
			if(list != null &&  list.size()>0 && !list.get(0).getBdt_id().equals(vo.getBdt_id())) {
				j.setMsg("这个编码已存在！");
			}else {
				baseDatatypeService.update(vo);
				j.setSuccess(true);
				j.setMsg("编辑成功！");
			}
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
	public Json delete(String bdt_id) {
		Json j = new Json();
		try {
			baseDatatypeService.delete(bdt_id);
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
	 * @param bdt_ids
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/deleteMulti")
	@ResponseBody
	public Json deleteMulti(String bdt_ids) {
		String[] ids = bdt_ids.split(bdt_ids);
		Json j = new Json();
		try {
			baseDatatypeService.deleteBatch(ids);
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
		//根据用户的类型来控制
		Map<String, Object> queryParams = new HashMap<String, Object>();
		String bdt_name_like = request.getParameter("bdt_name_like");
		if(StringUtils.isNotBlank(bdt_name_like)) {
			queryParams.put("bdt_name_like", bdt_name_like);
		}
		SessionInfo sessionInfo = UserSessionUtil.getSession(request);
//		if(!sessionInfo.getUsertype().equals(SystemConstantsExt.user_super)){
//			queryParams.put("bdt_type", "0");
//		}

		String bdt_type = request.getParameter("bdt_type");
		if(StringUtils.isNotBlank(bdt_type)) {
			queryParams.put("bdt_type", bdt_type);
		}
		String bdt_status = request.getParameter("bdt_status");
		if(StringUtils.isNotBlank(bdt_status)) {
			queryParams.put("bdt_status", bdt_status);
		}
		
		
		
		
		return queryParams;
	}
	
	public List<BaseDatatype> select(Map<String,Object> map) {
		
		return baseDatatypeService.select(map);
	}
}