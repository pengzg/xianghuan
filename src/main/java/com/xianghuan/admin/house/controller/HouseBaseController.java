
package com.xianghuan.admin.house.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
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

import com.xianghuan.admin.house.model.HouseBase;
import com.xianghuan.admin.house.service.IHouseBaseService;

/**
 * @company 社区在线
 * @author feizhang
 * @version 1.0
 * @date 
 */

@Controller
@RequestMapping("/admin/houseBaseControl")
public class HouseBaseController extends BaseController{
	private static final Logger log = Logger.getLogger(HouseBaseController.class);
	@Autowired
	private IHouseBaseService houseBaseService;

	public HouseBaseController() {
		super.folder = "/jsp/housebase/";
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
		return houseBaseService.dataGrid(query);
	}

	/**
	 * 跳转到添加页面
	 * @param 
	 * @return
	 */
	@RequestMapping("/addPage")
	public String addPage(HttpServletRequest request) {
		HouseBase bean = new HouseBase();
		request.setAttribute(REQUEST_BEAN, bean);
		return redirectJsp("housebase_"+FORWARD_EDIT_PAGE);
	}
	
	@RequestMapping("/listPage")
	public String listPage(HttpServletRequest request) {
		return redirectJsp("housebase_"+FORWARD_LIST_PAGE);
	}
	
	@RequestMapping("/listPageRef")
	public String listPageRef() {
		return redirectJsp("housebase_"+FORWARD_REFERENCE_PAGE);
	}
	/**
	 * 跳转到修改页面
	 * @param request
	 * @param hb_id
	 * @return
	 */
	@RequestMapping("/editPage")
	public String editPage(HttpServletRequest request, Integer hb_id) {
		HouseBase bean = houseBaseService.find(hb_id);
		request.setAttribute(REQUEST_BEAN, bean);
		return redirectJsp("housebase_"+FORWARD_EDIT_PAGE);
	}

	/**
	 * 跳转到查看页面
	 * @param request
	 * @param hb_id
	 * @return
	 */
	@RequestMapping("/detailPage")
	public String detailPage(HttpServletRequest request, Integer hb_id) {
		HouseBase bean = houseBaseService.find(hb_id);
		request.setAttribute(REQUEST_BEAN, bean);
		return redirectJsp("housebase_"+FORWARD_DETAIL_PAGE);
	}

	/**
	 * 增加一条记录
	 * @param HouseBase vo
	 * @return JSON
	 */
	@RequestMapping("/insert")
	@ResponseBody
	public Json insert(HouseBase vo) {
		Json j = new Json();
		try {
			houseBaseService.insert(vo);
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
	public Json update(HttpServletRequest request,HouseBase vo) {
		Json j = new Json();
		try {
			if (vo.getHb_id()!=null){
				houseBaseService.update(vo);
			}else{
				houseBaseService.insert(vo);
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
	 * @param hb_id
	 */
	@RequestMapping("/remove")
	@ResponseBody
	public Json remove(HttpServletRequest request,String hb_id) {
		Json j = new Json();
		try {
			Map<String, Object> queryParams = new HashMap<String, Object>();
			queryParams.put("hb_id",hb_id);
			houseBaseService.remove(queryParams);
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
	 * @param hb_ids
	 * @return Json
	 * @throws Exception
	 */
	@RequestMapping("/removeMulti")
	@ResponseBody
	public Json removeMulti(HttpServletRequest request,String hb_ids) {
		String[] items = hb_ids.split(",");
		Json j = new Json();
		try {
			Map<String, Object> queryParams = new HashMap<String, Object>();
			queryParams.put("ids",items);
			houseBaseService.removeBatch(queryParams);
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
	 * @param hb_id
	 */
	@RequestMapping("/delete")
	@ResponseBody
	public Json delete(HttpServletRequest request,Integer hb_id) {
		Json j = new Json();
		try {
			houseBaseService.delete(hb_id);
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
	 * @param hb_ids
	 * @return Json
	 * @throws Exception
	 */
	@RequestMapping("/deleteMulti")
	@ResponseBody
	public Json deleteMulti(HttpServletRequest request,String hb_ids) {
		String[] items = hb_ids.split(",");
		Json j = new Json();
		try {
			houseBaseService.deleteBatch(items);
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
		//	
		String hb_id = request.getParameter("hb_id");
		if (StringUtils.isNotBlank(hb_id)) {
			queryParams.put("hb_id", hb_id);
		}
		//类型 对应字典	
		String hb_rent_type = request.getParameter("hb_rent_type");
		if (StringUtils.isNotBlank(hb_rent_type)) {
			queryParams.put("hb_rent_type", hb_rent_type);
		}
		//标题	
		String hb_title = request.getParameter("hb_title");
		if (StringUtils.isNotBlank(hb_title)) {
			queryParams.put("hb_title", hb_title);
		}
		//简介	
		String hb_summary = request.getParameter("hb_summary");
		if (StringUtils.isNotBlank(hb_summary)) {
			queryParams.put("hb_summary", hb_summary);
		}
		//介绍	
		String hb_intro = request.getParameter("hb_intro");
		if (StringUtils.isNotBlank(hb_intro)) {
			queryParams.put("hb_intro", hb_intro);
		}
		//主图	
		String hb_cover = request.getParameter("hb_cover");
		if (StringUtils.isNotBlank(hb_cover)) {
			queryParams.put("hb_cover", hb_cover);
		}
		//用户	
		String hb_userid = request.getParameter("hb_userid");
		if (StringUtils.isNotBlank(hb_userid)) {
			queryParams.put("hb_userid", hb_userid);
		}
		//户型 对应字典	
		String hb_house_type = request.getParameter("hb_house_type");
		if (StringUtils.isNotBlank(hb_house_type)) {
			queryParams.put("hb_house_type", hb_house_type);
		}
		//房屋总面积	
		String hb_house_area = request.getParameter("hb_house_area");
		if (StringUtils.isNotBlank(hb_house_area)) {
			queryParams.put("hb_house_area", hb_house_area);
		}
		//联系电话	
		String hb_contacts_mobile = request.getParameter("hb_contacts_mobile");
		if (StringUtils.isNotBlank(hb_contacts_mobile)) {
			queryParams.put("hb_contacts_mobile", hb_contacts_mobile);
		}
		//房间类型	
		String hb_room_type = request.getParameter("hb_room_type");
		if (StringUtils.isNotBlank(hb_room_type)) {
			queryParams.put("hb_room_type", hb_room_type);
		}
		//房间面积	
		String hb_room_area = request.getParameter("hb_room_area");
		if (StringUtils.isNotBlank(hb_room_area)) {
			queryParams.put("hb_room_area", hb_room_area);
		}
		//联系人姓名	
		String hb_contacts_name = request.getParameter("hb_contacts_name");
		if (StringUtils.isNotBlank(hb_contacts_name)) {
			queryParams.put("hb_contacts_name", hb_contacts_name);
		}
		//发布时间	
		String hb_posttime = request.getParameter("hb_posttime");
		if (StringUtils.isNotBlank(hb_posttime)) {
			queryParams.put("hb_posttime", hb_posttime);
		}
		//地址	
		String hb_address = request.getParameter("hb_address");
		if (StringUtils.isNotBlank(hb_address)) {
			queryParams.put("hb_address", hb_address);
		}
		//价格	
		String hb_price = request.getParameter("hb_price");
		if (StringUtils.isNotBlank(hb_price)) {
			queryParams.put("hb_price", hb_price);
		}
		//价格区间 	
		String hb_price_range = request.getParameter("hb_price_range");
		if (StringUtils.isNotBlank(hb_price_range)) {
			queryParams.put("hb_price_range", hb_price_range);
		}
		//经度	
		String hb_lng = request.getParameter("hb_lng");
		if (StringUtils.isNotBlank(hb_lng)) {
			queryParams.put("hb_lng", hb_lng);
		}
		//纬度 	
		String hb_lat = request.getParameter("hb_lat");
		if (StringUtils.isNotBlank(hb_lat)) {
			queryParams.put("hb_lat", hb_lat);
		}
		//是否显示  1是 2 不显示	
		String hb_isshow = request.getParameter("hb_isshow");
		if (StringUtils.isNotBlank(hb_isshow)) {
			queryParams.put("hb_isshow", hb_isshow);
		}
		//标签	
		String hb_tag = request.getParameter("hb_tag");
		if (StringUtils.isNotBlank(hb_tag)) {
			queryParams.put("hb_tag", hb_tag);
		}
		//审核状态	
		String hb_checkstatus = request.getParameter("hb_checkstatus");
		if (StringUtils.isNotBlank(hb_checkstatus)) {
			queryParams.put("hb_checkstatus", hb_checkstatus);
		}
		//状态  1正常	
		String hb_status = request.getParameter("hb_status");
		if (StringUtils.isNotBlank(hb_status)) {
			queryParams.put("hb_status", hb_status);
		}
		//1正常	
		String hb_dr = request.getParameter("hb_dr");
		if (StringUtils.isNotBlank(hb_dr)) {
			queryParams.put("hb_dr", hb_dr);
		}
		//	
		String hb_addtime = request.getParameter("hb_addtime");
		if (StringUtils.isNotBlank(hb_addtime)) {
			queryParams.put("hb_addtime", hb_addtime);
		}
		//	
		String hb_updatetime = request.getParameter("hb_updatetime");
		if (StringUtils.isNotBlank(hb_updatetime)) {
			queryParams.put("hb_updatetime", hb_updatetime);
		}
		return queryParams;
	}
}