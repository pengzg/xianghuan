package com.xianghuan.auth.system.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.xianghuan.jdbc.exception.BusinessException;
import org.xianghuan.web.controller.BaseController;
import org.xianghuan.web.model.DataGrid;
import org.xianghuan.web.model.Json;
import org.xianghuan.web.model.Pager;
import org.xianghuan.web.model.Query;

import com.xianghuan.auth.system.model.SysPdlevel;
import com.xianghuan.auth.system.service.ISysPdlevelService;

/**
 * @ClassName: SysPdlevelController
 * @Description: 密码策略
 * @author shenwu
 * @date 2014年6月26日 上午11:16:53
 */
@Controller
@RequestMapping("/system/sysPdlevelControl")
public class SysPdlevelController extends BaseController{
	private static final Logger log = Logger.getLogger(SysPdlevelController.class);
	@Autowired
	private ISysPdlevelService sysPdlevelService;

	public SysPdlevelController() {
		super.folder = "/securityJsp/auth/system/syspdlevel/";
	}
	
	@RequestMapping("/listPage")
	public String listPage() {
		return redirectJsp("syspdlevel_"+FORWARD_LIST_PAGE);
	}

	/**
	 * 获取数据表格
	 * @param 
	 * @return
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping("/dataGrid")
	@ResponseBody
	public DataGrid dataGrid(HttpServletRequest request, Pager pager) {
		Query query = new Query();
		query.setPager(pager);
		query.setQueryParams((Map<String, Object>) getQueryCondition(request));
		return sysPdlevelService.dataGrid(query);
	}

	/**
	 * 跳转到添加页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/addPage")
	public String addPage() {
		return redirectJsp("syspdlevel_"+FORWARD_EDIT_PAGE);
	}
	
	/**
	 * 跳转到查看页面
	 * @return
	 */
	@RequestMapping("/detailPage")
	public String detailPage(HttpServletRequest request, String sp_id) {
		SysPdlevel bean = sysPdlevelService.find(sp_id);
		request.setAttribute(REQUEST_BEAN, bean);
		return redirectJsp("syspdlevel_"+FORWARD_DETAIL_PAGE);
	}
	
	/**
	 * 跳转到修改页面
	 * @return
	 */
	@RequestMapping("/editPage")
	public String editPage(HttpServletRequest request, String sp_id) {
		SysPdlevel bean = sysPdlevelService.find(sp_id);
		request.setAttribute(REQUEST_BEAN, bean);
		return redirectJsp("syspdlevel_"+FORWARD_EDIT_PAGE);
	}

	/**
	 * 增加一条记录
	 * @param vo
	 * @return
	 */
	@RequestMapping("/insert")
	@ResponseBody
	public Json insert(SysPdlevel vo) {
		Json j = new Json();
		try {
			sysPdlevelService.insert(vo);
			j.setSuccess(true);
			j.setMsg("增加成功！");
		} catch (BusinessException e) {
			e.printStackTrace();
			j.setMsg("操作失败！"+e.getMessage());
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
	public Json update(SysPdlevel vo) {
		Json j = new Json();
		try {
			sysPdlevelService.update(vo);
			j.setSuccess(true);
			j.setMsg("编辑成功！");
		} catch (BusinessException e) {
			e.printStackTrace();
			j.setMsg("操作失败！"+e.getMessage());
			log.error(e.getMessage(), e);
		}
		return j;
	}

	/**
	 * 从页面的表单获取多条记录id，并删除多条记录
	 * @throws BusinessException
	 */
	@RequestMapping("/delete")
	@ResponseBody
	public Json delete(String sp_id) {
		Json j = new Json();
		try {
			sysPdlevelService.delete(sp_id);
			j.setMsg("删除成功！");
			j.setSuccess(true);
		} catch (BusinessException e) {
			e.printStackTrace();
			j.setMsg("操作失败！"+e.getMessage());
			log.error(e.getMessage(), e);
		}
		return j;
	}

	/**
	 * 从页面的表单获取多条记录id，并删除多条记录
	 * @param sp_ids
	 * @return
	 * @throws BusinessException
	 */
	@RequestMapping("/deleteMulti")
	@ResponseBody
	public Json deleteMulti(String sp_ids) {
		String[] ids = sp_ids.split(sp_ids);
		Json j = new Json();
		try {
			sysPdlevelService.deleteBatch(ids);
			j.setMsg("删除成功！");
			j.setSuccess(true);
		} catch (BusinessException e) {
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
		String sp_name = request.getParameter("sp_name");
		queryParams.put("sp_name",sp_name);

		return queryParams;
	}
}