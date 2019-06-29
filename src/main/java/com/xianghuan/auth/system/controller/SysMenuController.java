package com.xianghuan.auth.system.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.xianghuan.jdbc.exception.BusinessException;
import org.xianghuan.util.SystemConstants;
import org.xianghuan.web.controller.BaseController;
import org.xianghuan.web.model.DataGrid;
import org.xianghuan.web.model.Json;
import org.xianghuan.web.model.Pager;
import org.xianghuan.web.model.Query;
import org.xianghuan.web.model.SessionInfo;
import org.xianghuan.web.model.Tree;

import com.xianghuan.auth.system.model.SysMenu;
import com.xianghuan.auth.system.service.ISysMenuService;
import com.xianghuan.auth.system.service.ISysRoleMenuService;
import com.xianghuan.auth.system.util.GetAllTrees;

/**
 * 
 * @ClassName: SysMenuController
 * @Description: 菜单管理
 * @author shenwu
 * @date 2014年7月8日 下午2:26:59
 *
 */
@Controller
@RequestMapping("/system/sysMenuControl")
public class SysMenuController extends BaseController{
	private static final Logger log = Logger.getLogger(SysMenuController.class);
	
	@Autowired
	private ISysMenuService sysMenuService;
	
	@Autowired
	private ISysRoleMenuService sysRoleMenuService;

	public SysMenuController() {
		super.folder = "/securityJsp/auth/system/sysmenu/";
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
		query.setQueryParams(((Map<String, Object>) getQueryCondition(request)));
		return sysMenuService.dataGrid(query);
	}
	
	
	@RequestMapping("/treeGrid")
	@ResponseBody
	public void treeGrid(HttpServletRequest request,HttpServletResponse response) {
//		Query query = new Query();
//		query.setPager(pager);
//		query.setQueryParams((Map<String, Object>) getQueryCondition(request));
		super.writeJson(response, sysMenuService.queryByCondition(null));
	}
	
	/**
	 * 跳转到添加页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/addPage")
	public String addPage() {
		return redirectJsp("sysmenu_"+FORWARD_EDIT_PAGE);
	}
	
	@RequestMapping("/listPage")
	public String listPage() {
		return redirectJsp("sysmenu_"+FORWARD_LIST_PAGE);
	}
	/**
	 * 跳转到修改页面
	 * 
	 * @return
	 */
	@RequestMapping("/editPage")
	public String editPage(HttpServletRequest request, String sm_id) {
		SysMenu bean = sysMenuService.find(sm_id);
		request.setAttribute(REQUEST_BEAN, bean);
		return redirectJsp("sysmenu_"+FORWARD_EDIT_PAGE);
	}

	/**
	 * 跳转到查看页面
	 * 
	 * @return
	 */
	@RequestMapping("/detailPage")
	public String detailPage(HttpServletRequest request, String sm_id) {
		SysMenu bean = sysMenuService.find(sm_id);
		request.setAttribute(REQUEST_BEAN, bean);
		return redirectJsp("sysmenu_"+FORWARD_DETAIL_PAGE);
	}

	/**
	 * 增加一条记录
	 * 
	 * @param vo
	 * @return
	 */
	@RequestMapping("/insert")
	@ResponseBody
	public Json insert(SysMenu vo) {
		Json j = new Json();
		try {
			if (StringUtils.isBlank(vo.getSm_pid())) {
				vo.setSm_pid("0");
			}
			sysMenuService.insert(vo);
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
	public Json update(SysMenu vo) {
		Json j = new Json();
		try {
			if (StringUtils.isBlank(vo.getSm_pid())) {
				vo.setSm_pid("0");
			}
			sysMenuService.update(vo);
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
	public Json delete(String sm_id) {
		Json j = new Json();
		try {
			sysMenuService.delete(sm_id);
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
	 * @param sm_ids
	 * @return
	 * @throws BusinessException
	 */
	@RequestMapping("/deleteMulti")
	@ResponseBody
	public Json deleteMulti(String sm_ids) {
		String[] ids = sm_ids.split(sm_ids);
		Json j = new Json();
		try {
			sysMenuService.deleteBatch(ids);
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
	 * @Title: getRolesTrees
	 * @Description:	角色菜单
	 * @param @param request
	 * @author shenwu
	 * @throws
	 */
	@RequestMapping("/sysRoleGrant")
	public String sysRoleGrant(HttpServletRequest request) {
		
		request.setAttribute("sr_id", request.getParameter("sr_id"));
		return redirectJsp("sysmenu_"+"roleGrantPage");
	}
	
	/**
	 * 获得当前用户能看到的所有菜单树
	 * @author shenwu
	 * @return 
	 */
	@RequestMapping("/getMenuTree")
	public void getMenuTree(HttpServletRequest request, HttpServletResponse response,ModelMap map) {
		SessionInfo sessionInfo = (SessionInfo) request.getSession()
				.getAttribute(BaseController.RM_LOGIN_USER);
		
//		if (!sessionInfo.getRole().equals(SystemConstantsExt.USESR_SUPER)){
//			map.put("sur_userid", sessionInfo.getId());
//		}
		map.put("sm_status", SystemConstants.STATUS_ON);
		List<SysMenu> menus = sysMenuService.select(map);
		List<Tree> l = new GetAllTrees().getMenuTree(menus);
		writeJson(response, l);
	}
	
	
	/**
	 * 获得当前角色的菜单
	 * @author shenwu
	 */
	@SuppressWarnings({ "unused" })
	@RequestMapping("/getRoleMenus")
	public void getRoleMenus(HttpServletRequest request, String sr_id, HttpServletResponse response) {
		SessionInfo sessionInfo = (SessionInfo) request.getSession()
				.getAttribute(BaseController.RM_LOGIN_USER);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("srm_roleid", sr_id);
		map.put("sm_status", SystemConstants.STATUS_ON);
		List<SysMenu> menus = sysRoleMenuService.select(map);
		List<Tree> l = new GetAllTrees().getMenuTree(menus);
		writeJson(response, l);
	}
	
	

	
	@Override
	public Map<?, ?> getQueryCondition(HttpServletRequest request) {
		// TODO Auto-generated method stub
		Map<String, Object> queryParams = new HashMap<String, Object>();
		String sm_name = request.getParameter("sm_name");
		queryParams.put("sm_name",sm_name);


		return queryParams;
	}
}