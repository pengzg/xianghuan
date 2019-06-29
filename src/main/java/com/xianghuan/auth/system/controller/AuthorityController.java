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
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.xianghuan.util.SystemConstants;
import org.xianghuan.web.controller.BaseController;
import org.xianghuan.web.model.DataGrid;
import org.xianghuan.web.model.Pager;
import org.xianghuan.web.model.Query;
import org.xianghuan.web.model.SessionInfo;
import org.xianghuan.web.model.Tree;

import com.xianghuan.auth.system.model.SysMenu;
import com.xianghuan.auth.system.service.ISysMenuService;
import com.xianghuan.auth.system.service.ISysUserService;
import com.xianghuan.auth.system.util.GetAllTrees;


@Controller
@RequestMapping("/system/authorityController")
public class AuthorityController extends BaseController{

	@Autowired
	private ISysUserService sysUserService;
	
	@Autowired
	private ISysMenuService sysMenuService;
	
	
	/**
	 * 获取数据表格
	 * 
	 * @param user
	 * @return
	 */
	@RequestMapping("/dataGrid")
	@ResponseBody
	public DataGrid dataGrid(HttpServletRequest request, Pager pager) {
		Query query = new Query();
		query.setPager(pager);
		query.setQueryParams((Map<String, Object>) getQueryCondition(request));
		return sysUserService.dataGrid(query);
	}

	

	@Override
	public Map<?, ?> getQueryCondition(HttpServletRequest request) {
		// TODO Auto-generated method stub
		Map<String, Object> queryParams = new HashMap<String, Object>();

		return queryParams;
	}
	
	

	/**
	 * 获得主菜单tree，也用于获得上级资源菜单combotree
	 */
	@ResponseBody
	@RequestMapping("/doGetMainMenu")
	public void doGetMainMenu(HttpServletRequest request,
			HttpServletResponse response) {
		SessionInfo sessionInfo = (SessionInfo) request.getSession()
				.getAttribute(BaseController.RM_LOGIN_USER);
		String pid = request.getParameter("pid");
		String id = request.getParameter("id");
		
		
		
		Map<String, Object> queryParams = new HashMap<String, Object>();
		queryParams.put("sm_typeid", "1");
		queryParams.put("sur_userid", sessionInfo.getId());
		queryParams.put("sm_status", SystemConstants.STATUS_ON);
		queryParams.put("sm_systemid", "1001");
		if(StringUtils.isNotBlank(id)){
			queryParams.put("sm_pid", id);
		}else{
			queryParams.put("isroot", "isroot");
		}
		
		queryParams.put(SystemConstants.sort_str, " t.sm_seq  ");
		queryParams.put(SystemConstants.order_str, " asc ");
		
		// 根据选择的商家类型，获取不同的菜单
//		if (sessionInfo.getLoginusertype().equals(SystemConstantsExt.USER_TYPE_ORG)) {
//			//平台用户
//			queryParams.put("ss_code", SystemConstantsExt.SYSTEM_AUTH);
//		}else if (sessionInfo.getLoginusertype().equals(SystemConstantsExt.USER_TYPE_CORP)) {
//			//物业公司
//			queryParams.put("ss_code", SystemConstantsExt.SYSTEM_CORP);
//			
//		}else if (sessionInfo.getLoginusertype().equals(SystemConstantsExt.USER_TYPE_MERCHANT)) {
//			//商家
//			queryParams.put("ss_code", SystemConstantsExt.SYSTEM_MERCHANT);// 归属于权限系统
//		}else{
//			queryParams.put("ss_code", "xxxxx");// 归属于权限系统
//		}
		
		List<SysMenu> list = sysMenuService.select(queryParams);
		List<Tree> tree = new GetAllTrees().getMenuTree(list);
		writeJson(response, tree);
	}
	

	private void setMenueOpenStatus(SysMenu resource, Tree node) {
		// if(resource.getSyresources()==null ||
		// resource.getSyresources().size()==0)
		// node.setState("open");
		// else{
		// node.setState("open");
		// Iterator<Syresource> it = resource.getSyresources().iterator();
		// while(it.hasNext()){
		// Syresource temp = it.next();
		// if(temp.getSyresourcetype().getId().equals("0")){
		// node.setState("closed");
		// return;
		// }
		// }
		// }
	}
	
	
	

}