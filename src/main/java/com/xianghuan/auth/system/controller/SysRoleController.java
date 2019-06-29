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

import com.xianghuan.auth.system.model.SysRole;
import com.xianghuan.auth.system.model.SysUser;
import com.xianghuan.auth.system.service.ISysRoleMenuService;
import com.xianghuan.auth.system.service.ISysRoleService;
import com.xianghuan.auth.system.service.ISysUserRoleService;
import com.xianghuan.auth.system.util.GetAllTrees;

/**
 * @ClassName: SysRoleController
 * @Description: 角色管理
 * @author shenwu
 * @date 2014年6月19日 上午11:54:40
 */
@Controller
@RequestMapping("/system/sysRoleControl")
public class SysRoleController extends BaseController{

	private static final Logger log = Logger.getLogger(SysOrgController.class);
	
	@Autowired
	private ISysRoleService sysRoleService;
	
	@Autowired
	private ISysUserRoleService sysUserRoleService;
	
	@Autowired
	private ISysRoleMenuService sysRoleMenuService;

	public SysRoleController() {
		super.folder = "/securityJsp/auth/system/sysrole/";
	}

	/**
	 * @Title: listPage
	 * @Description: 跳转到列表页面
	 * @param @return
	 * @return String
	 */
	@RequestMapping("/listPage")
	public String listPage() {
		return redirectJsp("sysrole_"+FORWARD_LIST_PAGE);
	}
	
	/**
	 * @Title: dataGrid
	 * @Description: 获取数据列表
	 * @param @param request
	 * @param @param pager
	 * @param @return
	 * @return DataGrid
	 * @throws
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping("/dataGrid")
	@ResponseBody
	public DataGrid dataGrid(HttpServletRequest request, Pager pager) {
		Query query = new Query();
		query.setPager(pager);
		query.setQueryParams((Map<String, Object>) getQueryCondition(request));
		return sysRoleService.dataGrid(query);
	}

	/**
	 * 跳转到添加页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/addPage")
	public String addPage(HttpServletRequest request) {
		SysRole sr = new SysRole();
		sr.setSr_status(SystemConstants.STATUS_ON+"");
		request.setAttribute(REQUEST_BEAN, sr);
		return redirectJsp("sysrole_"+FORWARD_EDIT_PAGE);
	}
	
	/**
	 * 增加一条记录
	 * @param vo
	 * @return
	 */
	@RequestMapping("/insert")
	@ResponseBody
	public Json insert(SysRole vo) {
		Json j = new Json();
		try {
			sysRoleService.insert(vo);
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
	 * 跳转到查看页面
	 * @return
	 */
	@RequestMapping("/detailPage")
	public String detailPage(HttpServletRequest request, String sr_id) {
		SysRole bean = sysRoleService.find(sr_id);
		request.setAttribute(REQUEST_BEAN, bean);
		return redirectJsp("sysrole_"+FORWARD_DETAIL_PAGE);
	}

	
	/**
	 * 跳转到修改页面
	 * @return
	 */
	@RequestMapping("/editPage")
	public String editPage(HttpServletRequest request, String sr_id) {
		SysRole bean = sysRoleService.find(sr_id);
		request.setAttribute(REQUEST_BEAN, bean);
		return redirectJsp("sysrole_"+FORWARD_EDIT_PAGE);
	}

	/**
	 * 修改一条记录
	 * @param vo
	 * @return
	 */
	@RequestMapping("/update")
	@ResponseBody
	public Json update(SysRole vo) {
		Json j = new Json();
		try {
			sysRoleService.update(vo);
			j.setSuccess(true);
			j.setMsg("编辑成功！");
		} catch (BusinessException e) {
			e.printStackTrace();
			j.setMsg("操作失败！"+e.getMessage());
		}
		return j;
	}

	/**
	 * 从页面的表单获取一条记录id，并删除一条记录
	 * @throws BusinessException
	 */
	@RequestMapping("/delete")
	@ResponseBody
	public Json delete(String sr_id) {
		Json j = new Json();
		try {
			sysRoleService.delete(sr_id);
			j.setMsg("删除成功！");
			j.setSuccess(true);
		} catch (BusinessException e) {
			e.printStackTrace();
			j.setMsg("操作失败！"+e.getMessage());
		}
		return j;
	}

	/**
	 * 从页面的表单获取多条记录id，并删除多条记录
	 * 
	 * @param sr_ids
	 * @return
	 * @throws BusinessException
	 */
	@RequestMapping("/deleteMulti")
	@ResponseBody
	public Json deleteMulti(String ids) {
		String[] ids1 = ids.split(DEFAULT_STRING_SEPARATOR);
		Json j = new Json();
		try {
			sysRoleService.deleteBatch(ids1);
			j.setMsg("删除成功！");
			j.setSuccess(true);
		} catch (BusinessException e) {
			e.printStackTrace();
			j.setMsg("操作失败！"+e.getMessage());
		}
		return j;
	}
	
	@RequestMapping("/deleteUser")
	@ResponseBody
	public Json deleteUser(String ids) {
		String[] ids1 = ids.split(DEFAULT_STRING_SEPARATOR);
		Json j = new Json();
		try {
			sysUserRoleService.deleteBatch(ids1);
			j.setMsg("删除成功！");
			j.setSuccess(true);
		} catch (BusinessException e) {
			e.printStackTrace();
			j.setMsg("操作失败！"+e.getMessage());
		}
		return j;
	}
	
	@RequestMapping("/getRolesTrees")
	public String getRolesTrees(HttpServletRequest request) {
		request.setAttribute("su_id", request.getParameter("su_id"));
		return redirectJsp("sysrole_"+"userGrantPage");
	}
	
	/**
	 * 获得当前用户能看到的所有角色树
	 * @author shenwu
	 * @return 
	 */
	@RequestMapping("/getRolesTree")
	public void getRolesTree(HttpServletRequest request,
			HttpServletResponse response, ModelMap map) {
		SessionInfo sessionInfo = (SessionInfo) request.getSession()
			.getAttribute(BaseController.RM_LOGIN_USER);
		
//		if (!sessionInfo.getRole().equals(SystemConstantsExt.USESR_SUPER)){
//			map.put("orgsList", sessionInfo.getOrgsList());
//			if (!sessionInfo.getRole().equals(SystemConstantsExt.USER_MANGER))
//				map.put("sur_userid", sessionInfo.getId());
//		}
		List<SysRole> roles = sysRoleService.select(map);
		List<Tree> l = new GetAllTrees().getRoleTree(roles);
		writeJson(response, l);
	}
	

	
	/**
	 * 获得当前角色拥有的用户
	 * @author shenwu
	 * @return 
	 */
	@SuppressWarnings({ "unused" })
	@RequestMapping("/getUserByRoleId")
	@ResponseBody
	public List<SysUser> getUserByRoleId(HttpServletRequest request, String sr_id, HttpServletResponse response) {
		SessionInfo sessionInfo = (SessionInfo) request.getSession()
				.getAttribute(BaseController.RM_LOGIN_USER);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sur_roleid", sr_id);
		return sysUserRoleService.selectUsers(map);
	}

	/**
	 * 修改角色菜单
	 * @return 
	 */
	@RequestMapping("/grantMenu")
	@ResponseBody
	public Json grantMenu(String ids, String id, HttpServletResponse response) {
		sysRoleMenuService.insertBatch(ids,id);
		Json json = new Json();
		json.setSuccess(true);
		return json;
	}
	/**
	 * 解除权限菜单
	 * @return 
	 */
//	@RequestMapping("/unGrant")
//	@ResponseBody
//	public Json unGrant(String ids, HttpServletResponse response) {
//		sysRoleMenuService.delete(ids);
//		Json json = new Json();
//		json.setSuccess(true);
//		return json;
//	}
	
	@Override
	public Map<?, ?> getQueryCondition(HttpServletRequest request) {
		
		Map<String, Object> queryParams = new HashMap<String, Object>();
		String sr_name = request.getParameter("sr_name");
		queryParams.put("sr_name",sr_name);
		if(StringUtils.isNotBlank(sr_name)) {
			queryParams.put("sr_name",sr_name);
		}
		
		SessionInfo sessionInfo = (SessionInfo) request.getSession()
				.getAttribute(BaseController.RM_LOGIN_USER);
		
//		if (!sessionInfo.getRole().equals(SystemConstantsExt.USESR_SUPER)){
//			queryParams.put("orgsList", sessionInfo.getOrgsList());
//		}

		return queryParams;
	}
}