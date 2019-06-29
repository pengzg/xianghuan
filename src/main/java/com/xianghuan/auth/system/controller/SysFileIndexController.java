/*
 * Powered By [rapid-framework]
 * Web Site: http://www.rapid-framework.org.cn
 * Google Code: http://code.google.com/p/rapid-framework/
 * Since 2008 - 2014
 */


package com.xianghuan.auth.system.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.xianghuan.util.FileConfigUtil;
import org.xianghuan.web.controller.BaseController;
import org.xianghuan.web.model.DataGrid;
import org.xianghuan.web.model.Json;
import org.xianghuan.web.model.Pager;
import org.xianghuan.web.model.Query;

import com.xianghuan.auth.system.model.SysFileIndex;
import com.xianghuan.auth.system.service.ISysFileIndexService;
import com.xianghuan.auth.system.service.ISysUserUnityService;
import com.xianghuan.util.CommonConstants;

/**
 * @company 聚品国际
 * @author feizhang
 * @version 1.0
 * @date 
 */

@Controller
@RequestMapping("/conf/sysFileIndexControl")
public class SysFileIndexController extends BaseController{
	private static final Logger log = Logger.getLogger(SysFileIndexController.class);
	@Autowired
	private ISysFileIndexService sysFileIndexService;
	@Autowired
	private ISysUserUnityService sysUserUnityService;

	public SysFileIndexController() {
		super.folder = "/jsp/common/conf/sysfileindex/";
	}
	
	@InitBinder
	public void initBinder(ServletRequestDataBinder binder) {
		/**
		 * 自动转换日期类型的字段格式
		 */
		binder.registerCustomEditor(Date.class, new CustomDateEditor(
				new SimpleDateFormat("yyyy-MM-dd"), true));

		/**
		 * 防止XSS攻击,需要对html编码
		 */
		//binder.registerCustomEditor(String.class, new StringEscapeEditor(true,false));
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
		return sysFileIndexService.dataGrid(query);
	}

	/**
	 * 跳转到添加页面
	 * @param 
	 * @return
	 */
	@RequestMapping("/addPage")
	public String  	addPage(HttpServletRequest request) {
		SysFileIndex sfi = new SysFileIndex();
		sfi.setSfi_user_id((request.getParameter("sfi_user_id")));
		sfi.setSfi_status(String.valueOf(CommonConstants.STATUS_ON));
		request.setAttribute(REQUEST_BEAN, sfi);
		return redirectJsp("sysfileindex_"+FORWARD_EDIT_PAGE);
	}
	
	@RequestMapping("/listPage")
	public String listPage() {
		return redirectJsp("sysfileindex_"+FORWARD_LIST_PAGE);
	}
	
	@RequestMapping("/listPageRef")
	public String listPageRef(HttpServletRequest request) {
		String sfi_user_id = request.getParameter("sfi_user_id");
		request.setAttribute("sfi_user_id", sfi_user_id);
		String fileUrlPre = FileConfigUtil.FILE_URL_PRE;
		request.setAttribute("fileUrlPre", fileUrlPre);
		return redirectJsp("sysfileindex_"+FORWARD_REFERENCE_PAGE);
	}
	
	/**
	 * 获取数据表格
	 * @param request
	 * @param pager
	 * @return
	 */
	@RequestMapping("/dataGridRef")
	@ResponseBody
	public DataGrid dataGridRef(HttpServletRequest request, Pager pager) {
		Query query = new Query();
		query.setPager(pager);
		query.setQueryParams((Map<String, Object>) getQueryCondition(request));
		return sysFileIndexService.dataGrid(query);
	}
	
	
	/**
	 * 跳转到修改页面
	 * @param request
	 * @param sfi_id
	 * @return
	 */
	@RequestMapping("/editPage")
	public String editPage(HttpServletRequest request, String sfi_id) {
		SysFileIndex bean = sysFileIndexService.find(sfi_id);
		request.setAttribute(REQUEST_BEAN, bean);
		return redirectJsp("sysfileindex_"+FORWARD_EDIT_PAGE);
	}

	/**
	 * 跳转到查看页面
	 * @param request
	 * @param sfi_id
	 * @return
	 */
	@RequestMapping("/detailPage")
	public String detailPage(HttpServletRequest request, String sfi_id) {
		SysFileIndex bean = sysFileIndexService.find(sfi_id);
		request.setAttribute(REQUEST_BEAN, bean);
		return redirectJsp("sysfileindex_"+FORWARD_DETAIL_PAGE);
	}

	/**
	 * 增加一条记录
	 * @param SysFileIndex vo
	 * @return JSON
	 */
	@RequestMapping("/insert")
	@ResponseBody
	public Json insert(SysFileIndex vo) {
		Json j = new Json();
		try {
			sysFileIndexService.insert(vo);
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
	public Json update(SysFileIndex vo) {
		Json j = new Json();
		try {
			sysFileIndexService.update(vo);
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
	 * @param sfi_id
	 */
	@RequestMapping("/delete")
	@ResponseBody
	public Json delete(String sfi_id) {
		Json j = new Json();
		try {
			sysFileIndexService.delete(sfi_id);
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
	 * @param sfi_ids
	 * @return Json
	 * @throws Exception
	 */
	@RequestMapping("/deleteMulti")
	@ResponseBody
	public Json deleteMulti(String sfi_ids) {
		String[] ids = sfi_ids.split(sfi_ids);
		Json j = new Json();
		try {
			sysFileIndexService.deleteBatch(ids);
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
		queryParams.put("sfi_user_id", request.getParameter("sfi_user_id"));
		return queryParams;
	}
}