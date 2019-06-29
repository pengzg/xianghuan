
package com.xianghuan.auth.base.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.BeanUtils;
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

import com.xianghuan.auth.base.model.BaseArea;
import com.xianghuan.auth.base.service.IBaseAreaService;
import com.xianghuan.auth.base.vo.BaseAreaVO;

/**
 * @company 社区在线
 * @author feizhang
 * @version 1.0
 * @date 
 */

@Controller
@RequestMapping("/baseArea/baseAreaControl")
public class BaseAreaController extends BaseController{
	private static final Logger log = Logger.getLogger(BaseAreaController.class);
	@Autowired
	private IBaseAreaService baseAreaService;

	public BaseAreaController() {
		super.folder = "/jsp/baseArea/baseArea/basearea/";
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
		return baseAreaService.dataGrid(query);
	}

	/**
	 * 跳转到添加页面
	 * @param 
	 * @return
	 */
	@RequestMapping("/addPage")
	public String addPage(HttpServletRequest request) {
		BaseArea bean = new BaseArea();
		request.setAttribute(REQUEST_BEAN, bean);
		return redirectJsp("basearea_"+FORWARD_EDIT_PAGE);
	}
	
	@RequestMapping("/listPage")
	public String listPage(HttpServletRequest request) {
		return redirectJsp("basearea_"+FORWARD_LIST_PAGE);
	}
	
	@RequestMapping("/listPageRef")
	public String listPageRef() {
		return redirectJsp("basearea_"+FORWARD_REFERENCE_PAGE);
	}
	/**
	 * 跳转到修改页面
	 * @param request
	 * @param ba_id
	 * @return
	 */
	@RequestMapping("/editPage")
	public String editPage(HttpServletRequest request, String ba_id) {
		BaseArea bean = baseAreaService.find(ba_id);
		request.setAttribute(REQUEST_BEAN, bean);
		return redirectJsp("basearea_"+FORWARD_EDIT_PAGE);
	}

	/**
	 * 跳转到查看页面
	 * @param request
	 * @param ba_id
	 * @return
	 */
	@RequestMapping("/detailPage")
	public String detailPage(HttpServletRequest request, String ba_id) {
		BaseArea bean = baseAreaService.find(ba_id);
		request.setAttribute(REQUEST_BEAN, bean);
		return redirectJsp("basearea_"+FORWARD_DETAIL_PAGE);
	}

	/**
	 * 增加一条记录
	 * @param BaseArea vo
	 * @return JSON
	 */
	@RequestMapping("/insert")
	@ResponseBody
	public Json insert(BaseArea vo) {
		Json j = new Json();
		try {
			baseAreaService.insert(vo);
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
	public Json update(HttpServletRequest request,BaseArea vo) {
		Json j = new Json();
		try {
			if (StringUtils.isNotBlank(vo.getBa_id()+"")){
				baseAreaService.update(vo);
			}else{
				baseAreaService.insert(vo);
			}
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
	 * @param ba_id
	 */
	@RequestMapping("/remove")
	@ResponseBody
	public Json remove(HttpServletRequest request,String ba_id) {
		Json j = new Json();
		try {
			Map<String, Object> queryParams = new HashMap<String, Object>();
			queryParams.put("ba_id",ba_id);
			baseAreaService.remove(queryParams);
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
	 * @param ba_ids
	 * @return Json
	 * @throws Exception
	 */
	@RequestMapping("/removeMulti")
	@ResponseBody
	public Json removeMulti(HttpServletRequest request,String ba_ids) {
		String[] items = ba_ids.split(",");
		Json j = new Json();
		try {
			Map<String, Object> queryParams = new HashMap<String, Object>();
			queryParams.put("ids",items);
			baseAreaService.removeBatch(queryParams);
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
	 * 从页面的表单获取一条记录id，并删除多条记录
	 * @param ba_id
	 */
	@RequestMapping("/delete")
	@ResponseBody
	public Json delete(HttpServletRequest request,String ba_id) {
		Json j = new Json();
		try {
			baseAreaService.delete(ba_id);
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
	 * @param ba_ids
	 * @return Json
	 * @throws Exception
	 */
	@RequestMapping("/deleteMulti")
	@ResponseBody
	public Json deleteMulti(HttpServletRequest request,String ba_ids) {
		String[] items = ba_ids.split(",");
		Json j = new Json();
		try {
			baseAreaService.deleteBatch(items);
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
	 * 级联查询地区数据
	 * @param request
	 * @return
	 */
	@RequestMapping("/queryArea")
	@ResponseBody
	public List<BaseAreaVO> queryArea(HttpServletRequest request,String level,String parentId){
		List<BaseAreaVO> retList = new ArrayList<>();
		BaseAreaVO vo = null;
		Map<String, Object> queryMap = new HashMap<>();
		queryMap.put("ba_level", level);
		queryMap.put("ba_parent_id", parentId);
		List<BaseArea> list = baseAreaService.select(queryMap);
		if(null!=list && list.size() > 0){
			for(BaseArea ba : list){
				vo = new BaseAreaVO();
				BeanUtils.copyProperties(ba, vo);
				retList.add(vo);
			}
		}
		return retList;
	}
	
	@Override
	public Map<?, ?> getQueryCondition(HttpServletRequest request) {
		// TODO Auto-generated method stub
		Map<String, Object> queryParams = new HashMap<String, Object>();
		//	
		String ba_id = request.getParameter("ba_id");
		if (StringUtils.isNotBlank(ba_id)) {
			queryParams.put("ba_id", ba_id);
		}
		//地区名称	
		String ba_name = request.getParameter("ba_name");
		if (StringUtils.isNotBlank(ba_name)) {
			queryParams.put("ba_name", ba_name);
		}
		//	
		String ba_level = request.getParameter("ba_level");
		if (StringUtils.isNotBlank(ba_level)) {
			queryParams.put("ba_level", ba_level);
		}
		//	
		String ba_parent_id = request.getParameter("ba_parent_id");
		if (StringUtils.isNotBlank(ba_parent_id)) {
			queryParams.put("ba_parent_id", ba_parent_id);
		}
		//	
		String ba_code = request.getParameter("ba_code");
		if (StringUtils.isNotBlank(ba_code)) {
			queryParams.put("ba_code", ba_code);
		}
		//	
		String ba_ts = request.getParameter("ba_ts");
		if (StringUtils.isNotBlank(ba_ts)) {
			queryParams.put("ba_ts", ba_ts);
		}
		//	
		String ba_version = request.getParameter("ba_version");
		if (StringUtils.isNotBlank(ba_version)) {
			queryParams.put("ba_version", ba_version);
		}
		//	
		String ba_adduser = request.getParameter("ba_adduser");
		if (StringUtils.isNotBlank(ba_adduser)) {
			queryParams.put("ba_adduser", ba_adduser);
		}
		//	
		String ba_add_time = request.getParameter("ba_add_time");
		if (StringUtils.isNotBlank(ba_add_time)) {
			queryParams.put("ba_add_time", ba_add_time);
		}
		//	
		String ba_modifyuser = request.getParameter("ba_modifyuser");
		if (StringUtils.isNotBlank(ba_modifyuser)) {
			queryParams.put("ba_modifyuser", ba_modifyuser);
		}
		//	
		String ba_update_time = request.getParameter("ba_update_time");
		if (StringUtils.isNotBlank(ba_update_time)) {
			queryParams.put("ba_update_time", ba_update_time);
		}
		//	
		String ba_deleteuser = request.getParameter("ba_deleteuser");
		if (StringUtils.isNotBlank(ba_deleteuser)) {
			queryParams.put("ba_deleteuser", ba_deleteuser);
		}
		//	
		String ba_deletetime = request.getParameter("ba_deletetime");
		if (StringUtils.isNotBlank(ba_deletetime)) {
			queryParams.put("ba_deletetime", ba_deletetime);
		}
		//	
		String ba_orgid = request.getParameter("ba_orgid");
		if (StringUtils.isNotBlank(ba_orgid)) {
			queryParams.put("ba_orgid", ba_orgid);
		}
		//	
		String ba_status = request.getParameter("ba_status");
		if (StringUtils.isNotBlank(ba_status)) {
			queryParams.put("ba_status", ba_status);
		}
		//	
		String ba_cn = request.getParameter("ba_cn");
		if (StringUtils.isNotBlank(ba_cn)) {
			queryParams.put("ba_cn", ba_cn);
		}
		//	
		String ba_letter = request.getParameter("ba_letter");
		if (StringUtils.isNotBlank(ba_letter)) {
			queryParams.put("ba_letter", ba_letter);
		}
		
		queryParams.put("ba_dr", SystemConstants.SAVE);
		return queryParams;
	}
}