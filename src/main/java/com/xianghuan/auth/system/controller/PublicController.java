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
import org.xianghuan.util.SystemConstants;
import org.xianghuan.web.controller.BaseController;
import org.xianghuan.web.model.SessionInfo;
import org.xianghuan.web.model.Tree;

import com.xianghuan.auth.base.service.IBaseDataService;
import com.xianghuan.auth.system.service.ISysMenuService;
import com.xianghuan.auth.system.service.ISysOrgService;
import com.xianghuan.auth.system.service.ISysRoleService;
import com.xianghuan.auth.system.service.ISysSystemService;
import com.xianghuan.auth.system.util.GetAllTrees;

/**
 * @author admin
 * @version 1.0
 * @since 1.0
 */

@Controller
@RequestMapping("/system/publicControl")
public class PublicController extends BaseController{

	@SuppressWarnings("unused")
	private static final Logger log = Logger.getLogger(PublicController.class);
	
	@Autowired
	private ISysOrgService sysOrgService;
	@Autowired
	private ISysRoleService sysRoleService;
	@Autowired
	private ISysMenuService sysMenuService;
	@Autowired
	private IBaseDataService baseDataService;
	@Autowired
	private ISysSystemService sysSystemService;

	/**
	 * @Title: roleTree
	 * @Description: 角色树
	 * @param @param request
	 * @return List<Tree>
	 * @throws
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping("/roleTree")
	@ResponseBody
	public List<Tree> roleTree(HttpServletRequest request) {
		Map map = new HashMap();
		SessionInfo sessionInfo = (SessionInfo) request.getSession()
				.getAttribute(BaseController.RM_LOGIN_USER);
		if (!sessionInfo.getRole().equals(SystemConstants.USESR_SUPER)){
			map.put("orgsList", sessionInfo.getOrgsList());
		}
		List list = sysRoleService.select(map);
		return new GetAllTrees().getRoleTree(list);
	}
	
	/**
	 * @Title: systemTree
	 * @Description: 所属系统
	 * @param @param list
	 * @author shenwu
	 * @return List<Tree>
	 * @throws
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping("/getSystemTree")
	@ResponseBody
	public List<Tree> getSystemTree(HttpServletRequest request) {
		Map map = new HashMap();
		List list  = sysSystemService.select(map);
		return new GetAllTrees().getSystemTree(list);
	}

	/**
	 * @Title: orgTree
	 * @Description: 机构名称树
	 * @param @param request
	 * @return List<Tree>
	 * @throws
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping("/orgTree")
	@ResponseBody
	public List<Tree> orgTree(HttpServletRequest request) {
		Map map = new HashMap();
		SessionInfo sessionInfo = (SessionInfo) request.getSession()
				.getAttribute(BaseController.RM_LOGIN_USER);
		if (!sessionInfo.getRole().equals(SystemConstants.USESR_SUPER)){
			map.put("orgsList", sessionInfo.getOrgsList());
		}
		List list = sysOrgService.select(map);
		return new GetAllTrees().getOrgTree(list);
	}

	/**
	 * @Title: menuTree
	 * @Description: 菜单树
	 * @param @param request
	 * @return List<Tree>
	 * @throws
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping("/menuTree")
	@ResponseBody
	public List<Tree> menuTree(HttpServletRequest request) {
		Map map = new HashMap();
		List list = sysMenuService.select(map);
		return new GetAllTrees().getMenuTree(list);
	}
	
	@SuppressWarnings("rawtypes")
	@RequestMapping("/baseDataTree")
	@ResponseBody
	public List<Tree> baseDataTree(HttpServletRequest request,String bd_datatypeid) {
		Map<String,Object> map = new HashMap<String, Object>();
		if(StringUtils.isNotBlank(bd_datatypeid)){
			map.put("bd_datatypeid", bd_datatypeid);
		}
		List list = baseDataService.select(map);
		return  new GetAllTrees().getBaseDataTree(list);
	}
	
	@Override
	public Map<?, ?> getQueryCondition(HttpServletRequest request) {
		// TODO Auto-generated method stub
		return null;
	}
}