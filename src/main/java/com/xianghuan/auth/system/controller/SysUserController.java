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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.xianghuan.jdbc.exception.BusinessException;
import org.xianghuan.util.DateUtil;
import org.xianghuan.util.MD5Util;
import org.xianghuan.util.SystemConstants;
import org.xianghuan.web.controller.BaseController;
import org.xianghuan.web.model.DataGrid;
import org.xianghuan.web.model.Json;
import org.xianghuan.web.model.Pager;
import org.xianghuan.web.model.Query;
import org.xianghuan.web.model.SessionInfo;
import org.xianghuan.web.util.UserSessionUtil;

import com.xianghuan.auth.system.model.SysRole;
import com.xianghuan.auth.system.model.SysUser;
import com.xianghuan.auth.system.service.ISysRoleService;
import com.xianghuan.auth.system.service.ISysUserRoleService;
import com.xianghuan.auth.system.service.ISysUserService;

/**
 * @ClassName: SysUserController
 * @Description: 用户管理
 * @author shenwu
 * @date 2014年6月16日 下午12:54:31
 */
@Controller
@RequestMapping("/system/sysUserControl")
public class SysUserController extends BaseController {

	@SuppressWarnings("unused")
	private static final Logger log = Logger.getLogger(SysUserController.class);

	@Autowired
	private ISysUserService sysUserService;

	@Autowired
	private ISysRoleService sysRoleService;

	@Autowired
	private ISysUserRoleService sysUserRoleService;

	public SysUserController() {
		super.folder = "/securityJsp/auth/system/sysuser/";
	}

	// 跳转到列表页面
	@RequestMapping("/listPage")
	public String listPage() {
		return redirectJsp("sysuser_" + FORWARD_LIST_PAGE);
	}

	// 跳转到列表页面
	@RequestMapping("/listPageRef")
	public String listPageRef(HttpServletRequest request, String sr_id) {
		SysRole bean = sysRoleService.find(sr_id);
		request.setAttribute(REQUEST_BEAN, bean);
		return redirectJsp("sysuser_" + "rolePage");
	}

	/**
	 * 获取数据表格
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping("/dataGrid")
	@ResponseBody
	public DataGrid dataGrid(HttpServletRequest request, Pager pager) {
		Query query = new Query();
		query.setPager(pager);
		query.setQueryParams((Map<String, Object>) getQueryCondition(request));
		return sysUserService.dataGrid(query);
	}

	/**
	 * 跳转到添加页面
	 */
	@RequestMapping("/addPage")
	public String addPage(HttpServletRequest request) {
		SessionInfo sessionInfo = UserSessionUtil.getSession(request);
		String type = request.getParameter("type");
		String FORWARD_PAGE = "editPage";
		if(type.equals("2")){
			FORWARD_PAGE="editPage2";
		}
		if(type.equals("3")){
			FORWARD_PAGE="editPage3";
		}
		if(type.equals("4")){
			FORWARD_PAGE="editPage4";
		}
		SysUser su = new SysUser();
		su.setSu_orgid(sessionInfo.getOrgid());
		su.setSu_sex("M");
		su.setSu_status("1");
		su.setSu_role(SystemConstants.user_general);	
		su.setSu_startdate(DateUtil.getCurrentDateToString());
		request.setAttribute(REQUEST_BEAN, su);
		return redirectJsp("sysuser_" + FORWARD_PAGE);
	}

	/**
	 * 跳转到查看页面
	 */
	@RequestMapping("/detailPage")
	public String detailPage(HttpServletRequest request, String su_id) {
		SysUser bean = sysUserService.find(su_id);
		request.setAttribute(REQUEST_BEAN, bean);
		return redirectJsp("sysuser_" + FORWARD_DETAIL_PAGE);
	}

	/**
	 * 跳转到修改页面
	 */
	@RequestMapping("/editPage")
	public String editPage(HttpServletRequest request, String su_id) {
		SessionInfo sessionInfo = UserSessionUtil.getSession(request);
		String FORWARD_PAGE = "editPage";
		SysUser su = sysUserService.find(su_id);

		request.setAttribute(REQUEST_BEAN, su);
		return redirectJsp("sysuser_" + FORWARD_PAGE);
	}

	/**
	 * 增加一条记录
	 */
	@RequestMapping("/insert")
	@ResponseBody
	public Json insert(SysUser vo) {
		Json j = new Json();
		try {
			vo.setSu_usertype(SystemConstants.user_general);
			sysUserService.insert(vo);
			j.setSuccess(true);
			j.setMsg("增加成功！初始密码为[888888]");
		} catch (BusinessException e) {
			e.printStackTrace();
			j.setMsg("操作失败！" + e.getMessage());
		}
		return j;
	}

	@RequestMapping("/checkUserName")
	@ResponseBody
	public Json checkUserName(SysUser vo) {
		Json j = new Json();
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			if (StringUtils.isNotBlank(vo.getSu_loginname())) {
				String loginname = vo.getSu_loginname();
				if (StringUtils.isNotBlank(loginname)) {
					map.put("su_loginname", loginname);
					List<SysUser> list = sysUserService.selectByCondition(map);
					if (list.size() > 0 && list != null) {
						j.setMsg("此登录账号已被使用");
						return j;
					}
				}
				String email = vo.getSu_email();
				if (StringUtils.isNotBlank(email)) {
					map.put("su_email", email);
					List<SysUser> list = sysUserService.selectByCondition(map);
					if (list.size() > 0 && list != null) {
						j.setMsg("此邮箱已被使用");
						return j;
					}
				}
				String phone = vo.getSu_phone();
				if (StringUtils.isNotBlank(phone)) {
					map.put("su_phone", phone);
					List<SysUser> list = sysUserService.selectByCondition(map);
					if (list.size() > 0 && list != null) {
						j.setMsg("此电话号已被使用");
						return j;
					}
				}
			}
		} catch (BusinessException e) {
			e.printStackTrace();
			j.setMsg("操作失败！" + e.getMessage());
		}
		return j;
	}

	/**
	 * 修改一条记录
	 */
	@RequestMapping("/update")
	@ResponseBody
	public Json update(SysUser vo) {
		Json j = new Json();
		try {
			vo.setSu_userid(vo.getSu_orgid());
			vo.setSu_usertype(SystemConstants.user_general);
			if (StringUtils.isNotBlank(vo.getSu_id())) {
				sysUserService.update(vo);
			} else {
				sysUserService.insert(vo);
			}
			j.setSuccess(true);
			j.setMsg("保存成功！");
		} catch (BusinessException e) {
			e.printStackTrace();
			j.setMsg("操作失败！" + e.getMessage());
		}
		return j;
	}

	/**
	 * 从页面的表单获取一条记录id，并删除一条记录
	 * 
	 * @throws BusinessException
	 */
	@RequestMapping("/delete")
	@ResponseBody
	public Json delete(String su_id) {
		Json j = new Json();
		try {
			sysUserService.delete(su_id);
			j.setMsg("删除成功！");
			j.setSuccess(true);
		} catch (BusinessException e) {
			e.printStackTrace();
			j.setMsg("操作失败！" + e.getMessage());
		}
		return j;
	}

	/**
	 * 从页面的表单获取多条记录id，并删除多条记录
	 * 
	 * @param su_ids
	 * @throws BusinessException
	 */
	@RequestMapping("/deleteMulti")
	@ResponseBody
	public Json deleteMulti(String ids) {
		String[] ids1 = ids.split(DEFAULT_STRING_SEPARATOR);
		Json j = new Json();
		try {
			sysUserService.deleteBatch(ids1);
			j.setMsg("删除成功！");
			j.setSuccess(true);
		} catch (BusinessException e) {
			e.printStackTrace();
			j.setMsg("操作失败！" + e.getMessage());
		}
		return j;
	}

	/**
	 * 修改用户角色
	 * 
	 * @return
	 */
	@RequestMapping("/grantRole")
	@ResponseBody
	public Json grantRole(String ids, String id, HttpServletResponse response) {
		sysUserRoleService.insertBatch(ids, id);
		Json json = new Json();
		json.setSuccess(true);
		return json;
	}

	/**
	 * 角色分配用户
	 * 
	 * @return
	 */
	@RequestMapping("/roleGrantUser")
	@ResponseBody
	public Json roleGrantUser(String sr_id, String ids,
			HttpServletResponse response) {
		sysUserRoleService.insertBatchs(sr_id, ids);
		Json json = new Json();
		json.setSuccess(true);
		return json;
	}

	@Override
	public Map<?, ?> getQueryCondition(HttpServletRequest request) {

		SessionInfo sessionInfo = (SessionInfo) request.getSession()
				.getAttribute(BaseController.RM_LOGIN_USER);
		Map<String, Object> queryParams = new HashMap<String, Object>();
		String su_loginname = request.getParameter("su_loginname");
		String su_name = request.getParameter("su_name");
		String su_sex = request.getParameter("su_sex");
		String su_status = request.getParameter("su_status");
		String su_role = request.getParameter("su_role");
		String su_createdatetime = request.getParameter("su_createdatetime");
		queryParams.put("su_loginname", su_loginname);
		String su_orgid = request.getParameter("su_orgid");
		if (StringUtils.isNotBlank(su_orgid)) {
			queryParams.put("su_orgid", su_orgid);
		}
		/*if (!sessionInfo.getRole().equals(SystemConstants.user_super)){
			queryParams.put("su_usertype", sessionInfo.getUsertype());
			
		}*/
		queryParams.put("su_usertype", SystemConstants.user_general);
		queryParams.put("su_name", su_name);
		queryParams.put("su_sex", su_sex);
		queryParams.put("su_createdatetime", su_createdatetime);
		queryParams.put("su_role", su_role);
		queryParams.put("su_status", su_status);
		
		String su_loginname_query = request.getParameter("su_loginname_query");
		String su_name_query = request.getParameter("su_name_query");
		queryParams.put("su_loginname_query", su_loginname_query);
		queryParams.put("su_name_query", su_name_query);

		return queryParams;
	}

	/**
	 * 修改当前登陆用户的密码
	 * 
	 * @return
	 */
	@RequestMapping("/updateCurrentPassWord")
	@ResponseBody
	public Json updateCurrentPassWord(String pwd, String pwd1, String userid) {
		Json j = new Json();
		try {
			SessionInfo sessionInfo = UserSessionUtil.getSession();
			if (sessionInfo == null) {
				throw new BusinessException("请重新登陆!");
			}
			sysUserService.updateCurrentPassWord(pwd, pwd1, userid);
			j.setMsg("修改密码成功！");
			j.setSuccess(true);
		} catch (BusinessException e) {
			j.setMsg(e.getMessage());
			e.printStackTrace();
		}
		return j;
	}
	
	/**
	 * 修改当前登陆用户的密码
	 * 
	 * @return
	 */
	@RequestMapping("/sendSms")
	@ResponseBody
	public Json sendSms(String userName,String mobile) {
		Json j = new Json();
		try {
			if(sysUserService.insertSendSms(userName, "123456", mobile, "http://wscs.sqkx.net")){
				j.setMsg("修改密码成功！");
				j.setSuccess(true);
			}else{
				j.setMsg("发送短信失败！");
				j.setSuccess(false);
			}
		} catch (BusinessException e) {
			j.setMsg(e.getMessage());
			e.printStackTrace();
		}
		return j;
	}
	
	/**
	 *启用-禁用用户
	 * @return
	 */
	@RequestMapping("/setStatus")
	@ResponseBody
	public Json setStatus(Integer sys_userid, String status) {
		SysUser vo= sysUserService.find(sys_userid+"");
		
		Json j = new Json();	
		try {			
			vo.setSu_status(status);
			sysUserService.update(vo);
			j.setSuccess(true);
			j.setMsg("提交成功！");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			j.setSuccess(false);
			j.setMsg("提交失败！");
		}		
		return j;
	}
	
	/**
	 * 同步用户和店铺数据信息
	 * @return
	 */
	@RequestMapping("/synUserAndShopData")
	@ResponseBody
	public Json synUserAndShopData(){
		Json j = new Json();
		try {
			sysUserService.insertUserAndShopData();
			j.setMsg("同步数据成功!");
			j.setSuccess(true);
		} catch (BusinessException e) {
			j.setMsg(e.getMessage());
			e.printStackTrace();
		}catch (Exception e) {
			j.setMsg("同步数据异常!");
			e.printStackTrace();
		}
		return j;
	}
	/**
	 * 用户登录页面的自动补全
	 */
	@ResponseBody
	@RequestMapping("/checkPassword")
	public Json checkPassword(HttpServletRequest request, HttpServletResponse response) {
		Json j = new Json();
		SessionInfo session = (SessionInfo) request.getSession().getAttribute(BaseController.RM_LOGIN_USER);
		String password = sysUserService.find(session.getId()).getSu_pwd();
		if(MD5Util.md5("123456").equals(password)){
			j.setSuccess(true);;
		}else{
			j.setSuccess(false);
		}
		return j;
	}
}