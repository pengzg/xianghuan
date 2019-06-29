package com.xianghuan.auth.system.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.xianghuan.jdbc.exception.BusinessException;
import org.xianghuan.web.controller.BaseController;
import org.xianghuan.web.model.DataGrid;
import org.xianghuan.web.model.Json;
import org.xianghuan.web.model.Pager;
import org.xianghuan.web.model.Query;
import org.xianghuan.web.model.SessionInfo;
import org.xianghuan.web.model.Tree;

import com.xianghuan.auth.system.model.SysOrg;
import com.xianghuan.auth.system.model.SysUserOrg;
import com.xianghuan.auth.system.service.ISysOrgService;
import com.xianghuan.auth.system.service.ISysUserOrgService;
import com.xianghuan.auth.system.util.GetAllTrees;

/**
 * 
 * @ClassName: SysUserOrgController
 * @Description: 用户机构
 * @author shenwu
 * @date 2014年6月26日 上午11:43:27
 *
 */
@Controller
@RequestMapping("/system/sysUserOrgControl")
public class SysUserOrgController extends BaseController{
	
	private static final Logger log = Logger.getLogger(SysUserOrgController.class);
	
	@Autowired
	private ISysUserOrgService sysUserOrgService;
	
	@Autowired
	private ISysOrgService sysOrgService;
	
	public SysUserOrgController() {
		super.folder = "/securityJsp/auth/system/sysuserorg/";
	}
	
	@RequestMapping("/getOrgTrees")
	public String getRolesTrees(HttpServletRequest request) {
		
		request.setAttribute("su_id", request.getParameter("su_id"));
		return redirectJsp("sysuser_"+"orgGrantPage");
	}
	
	/**
	 * 获得当前用户能看到的所有机构树
	 * @author shenwu
	 * @return 
	 */
	@SuppressWarnings({ "unused" })
	@RequestMapping("/getOrgTree")
	public void getOrgTrees(HttpServletRequest request, HttpServletResponse response,ModelMap map) {
		SessionInfo sessionInfo = (SessionInfo) request.getSession()
				.getAttribute(BaseController.RM_LOGIN_USER);
		sessionInfo.getId();
			
	/*	if (!sessionInfo.getUsertype().equals(SystemConstantsExt.user_super)) {
			if (!sessionInfo.getLoginorgid().equals(
					SystemConstantsExt.ORG_FAULT_VALUE)) {
				map.put("orgsList", sessionInfo.getOrgsList());
				if (!sessionInfo.getUsertype().equals(
						SystemConstantsExt.user_manager))
					map.put("sur_userid", sessionInfo.getId());
			}
		}*/
//		map.put("orgsList", sessionInfo.getOrgsList());	
		List<SysOrg> orgs = sysOrgService.select(map);
		List<Tree> l = new GetAllTrees().getOrgTree(orgs);
		writeJson(response, l);
	}
	
	/**
	 * 获得当前用户的机构
	 * @author shenwu
	 */
	@SuppressWarnings({ "unused" })
	@RequestMapping("/getUserByOrgId")
	public void getUserByOrgId(HttpServletRequest request, String su_id, HttpServletResponse response) {
		SessionInfo sessionInfo = (SessionInfo) request.getSession()
				.getAttribute(BaseController.RM_LOGIN_USER);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("suo_userid", su_id);
		List<SysOrg> orgs = sysUserOrgService.select(map);
		List<Tree> l = new GetAllTrees().getOrgTree(orgs);
		writeJson(response, l);
	}
	
	/**
	 * 修改用户机构
	 * @return 
	 */
	@RequestMapping("/grantOrg")
	@ResponseBody
	public Json grantOrg(String ids, String id, HttpServletResponse response) {
		sysUserOrgService.insertBatch(ids,id);
		Json json = new Json();
		json.setSuccess(true);
		return json;
	}
	
	/**
	 * 获取数据表格
	 * @param request
	 * @param pager
	 * @return
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping("/dataGrid")
	@ResponseBody
	public DataGrid dataGrid(HttpServletRequest request, Pager pager) {
		Query query = new Query();
		query.setPager(pager);
		query.setQueryParams((Map<String, Object>) getQueryCondition(request));
		return sysUserOrgService.dataGrid(query);
	}

	/**
	 * 跳转到添加页面
	 * @param 
	 * @return
	 */
	@RequestMapping("/addPage")
	public String addPage() {
		return redirectJsp("sysuserorg_"+FORWARD_EDIT_PAGE);
	}
	
	@RequestMapping("/listPage")
	public String listPage() {
		return redirectJsp("sysuserorg_"+FORWARD_LIST_PAGE);
	}
	/**
	 * 跳转到修改页面
	 * @param request
	 * @param suo_id
	 * @return
	 */
	@RequestMapping("/editPage")
	public String editPage(HttpServletRequest request, String suo_id) {
		SysUserOrg bean = sysUserOrgService.find(suo_id);
		request.setAttribute(REQUEST_BEAN, bean);
		return redirectJsp("sysuserorg_"+FORWARD_EDIT_PAGE);
	}

	/**
	 * 跳转到查看页面
	 * @param request
	 * @param suo_id
	 * @return
	 */
	@RequestMapping("/detailPage")
	public String detailPage(HttpServletRequest request, String suo_id) {
		SysUserOrg bean = sysUserOrgService.find(suo_id);
		request.setAttribute(REQUEST_BEAN, bean);
		return redirectJsp("sysuserorg_"+FORWARD_DETAIL_PAGE);
	}

	/**
	 * 增加一条记录
	 * @param SysUserOrg vo
	 * @return JSON
	 */
	@RequestMapping("/insert")
	@ResponseBody
	public Json insert(SysUserOrg vo) {
		Json j = new Json();
		try {
			sysUserOrgService.insert(vo);
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
	 * @param vo
	 * @return JSON
	 */
	@RequestMapping("/update")
	@ResponseBody
	public Json update(SysUserOrg vo) {
		Json j = new Json();
		try {
			sysUserOrgService.update(vo);
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
	 * 从页面的表单获取一条记录id，并删除多条记录
	 * @param suo_id
	 */
	@RequestMapping("/delete")
	@ResponseBody
	public Json delete(String suo_id) {
		Json j = new Json();
		try {
			sysUserOrgService.delete(suo_id);
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
	 * @param suo_ids
	 * @return Json
	 * @throws BusinessException
	 */
	@RequestMapping("/deleteMulti")
	@ResponseBody
	public Json deleteMulti(String suo_ids) {
		String[] ids = suo_ids.split(suo_ids);
		Json j = new Json();
		try {
			sysUserOrgService.deleteBatch(ids);
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

		return queryParams;
	}
}