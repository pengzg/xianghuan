/*
 * Powered By [rapid-framework]
 * Web Site: http://www.rapid-framework.org.cn
 * Google Code: http://code.google.com/p/rapid-framework/
 * Since 2008 - 2014
 */


package com.xianghuan.auth.system.controller;


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
import org.xianghuan.web.controller.BaseController;
import org.xianghuan.web.model.DataGrid;
import org.xianghuan.web.model.Json;
import org.xianghuan.web.model.Pager;
import org.xianghuan.web.model.Query;

import com.xianghuan.auth.system.model.SysOrg;
import com.xianghuan.auth.system.model.SysUser;
import com.xianghuan.auth.system.service.ISysOrgService;
import com.xianghuan.auth.system.service.ISysUserService;

/**
 * @author admin
 * @version 1.0
 * @since 1.0
 */

@Controller
@RequestMapping("/system/sysOrgControl")
public class SysOrgController extends BaseController{

	private static final Logger log = Logger.getLogger(SysOrgController.class);
	@Autowired
	private ISysOrgService sysOrgService;

	@Autowired
	private ISysUserService sysUserService;
	
	public SysOrgController() {
		super.folder = "/securityJsp/auth/system/sysorg/";
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
		DataGrid dg = sysOrgService.dataGrid(query);
		return dg;
	}

	/**
	 * 跳转到添加页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/addPage")
	public String addPage() {
		return redirectJsp("sysorg_"+FORWARD_EDIT_PAGE);
	}
	
	@RequestMapping("/listPage")
	public String listPage() {
		return redirectJsp("sysorg_"+FORWARD_LIST_PAGE);
	}
	/**
	 * 跳转到修改页面
	 * 
	 * @return
	 */
	@RequestMapping("/editPage")
	public String editPage(HttpServletRequest request, String so_orgid) {
		SysOrg bean = sysOrgService.find(so_orgid);
		request.setAttribute(REQUEST_BEAN, bean);
		return redirectJsp("sysorg_"+FORWARD_EDIT_PAGE);
	}

	/**
	 * 跳转到查看页面
	 * 
	 * @return
	 */
	@RequestMapping("/detailPage")
	public String detailPage(HttpServletRequest request, String so_orgid) {
		SysOrg bean = sysOrgService.find(so_orgid);
		request.setAttribute(REQUEST_BEAN, bean);
		return redirectJsp("sysorg_"+FORWARD_DETAIL_PAGE);
	}

	/**
	 * 增加一条记录
	 * 
	 * @param vo
	 * @return
	 */
	@RequestMapping("/insert")
	@ResponseBody
	public Json insert(SysOrg vo) {
		Json j = new Json();
		try {
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("so_orgcode", vo.getSo_orgcode());
			List<SysOrg> list = sysOrgService.select(map);
			if(list != null && list.size()>0) {
				j.setMsg("机构编码已存在！");
			}else {
				sysOrgService.insert(vo);
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

	/**
	 * 修改一条记录
	 * 
	 * @param vo
	 * @return
	 */
	@RequestMapping("/update")
	@ResponseBody
	public Json update(SysOrg vo) {
		Json j = new Json();
		try {
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("so_orgcode", vo.getSo_orgcode());
			List<SysOrg> list = sysOrgService.select(map);
			if(list != null && list.size()>0 && !list.get(0).getSo_orgid().equals(vo.getSo_orgid())) {
				j.setMsg("机构编码已存在！");
			}else {
				sysOrgService.update(vo);
				j.setSuccess(true);
				j.setMsg("编辑成功！");
			}
		} catch (Exception e) {
			e.printStackTrace();
			j.setMsg("操作失败！"+e.getMessage());
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
	public Json delete(String so_orgid) {
		Json j = new Json();
		try {
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("su_so_orgId", so_orgid);
			List<SysUser> list = sysUserService.selectByCondition(map);
			if(list != null && list.size()>0) {
				j.setMsg("此机构已分配用户，不能删除！");
			}else {
				sysOrgService.delete(so_orgid);
				j.setMsg("删除成功！");
				j.setSuccess(true);
			}
		} catch (Exception e) {
			e.printStackTrace();
			j.setMsg("操作失败！"+e.getMessage());
		}
		return j;
	}

	/**
	 * 从页面的表单获取多条记录id，并删除多条记录
	 * 
	 * @param so_orgids
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/deleteMulti")
	@ResponseBody
	public Json deleteMulti(String so_orgids) {
		String[] ids = so_orgids.split(so_orgids);
		Json j = new Json();
		try {
			sysOrgService.deleteBatch(ids);
			j.setMsg("删除成功！");
			j.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
			j.setMsg("操作失败！"+e.getMessage());
		}
		return j;
	}

	@Override
	public Map<?, ?> getQueryCondition(HttpServletRequest request) {
		Map<String, Object> queryParams = new HashMap<String, Object>();
		String so_orgname = request.getParameter("so_orgname");
		String so_contactphone = request.getParameter("so_contactphone");
		if(StringUtils.isNotBlank(so_orgname)) {
			queryParams.put("so_orgname",so_orgname);
		}
		if(StringUtils.isNotBlank(so_contactphone)) {
			queryParams.put("so_contactphone",so_contactphone);
		}
//		SessionInfo sessionInfo = (SessionInfo) request.getSession()
//				.getAttribute(BaseController.RM_LOGIN_USER);
//		if (!sessionInfo.getRole().equals(SystemConstantsExt.USESR_SUPER)){
//			queryParams.put("orgsList", sessionInfo.getOrgsList());
//		}
		return queryParams;
	}
	
}