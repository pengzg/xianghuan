
package com.xianghuan.auth.base.controller;

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

import com.xianghuan.auth.base.model.BasePicAttachment;
import com.xianghuan.auth.base.service.IBasePicAttachmentService;

/**
 * @company 社区在线
 * @author feizhang
 * @version 1.0
 * @date 
 */

@Controller
@RequestMapping("/base/basePicAttachmentControl")
public class BasePicAttachmentController extends BaseController{
	private static final Logger log = Logger.getLogger(BasePicAttachmentController.class);
	@Autowired
	private IBasePicAttachmentService basePicAttachmentService;

	public BasePicAttachmentController() {
		super.folder = "/jsp/base/base/basepicattachment/";
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
		return basePicAttachmentService.dataGrid(query);
	}

	/**
	 * 跳转到添加页面
	 * @param 
	 * @return
	 */
	@RequestMapping("/addPage")
	public String addPage(HttpServletRequest request) {
		BasePicAttachment bean = new BasePicAttachment();
		request.setAttribute(REQUEST_BEAN, bean);
		return redirectJsp("basepicattachment_"+FORWARD_EDIT_PAGE);
	}
	
	@RequestMapping("/listPage")
	public String listPage(HttpServletRequest request) {
		return redirectJsp("basepicattachment_"+FORWARD_LIST_PAGE);
	}
	
	@RequestMapping("/listPageRef")
	public String listPageRef() {
		return redirectJsp("basepicattachment_"+FORWARD_REFERENCE_PAGE);
	}
	/**
	 * 跳转到修改页面
	 * @param request
	 * @param bpa_id
	 * @return
	 */
	@RequestMapping("/editPage")
	public String editPage(HttpServletRequest request, String bpa_id) {
		BasePicAttachment bean = basePicAttachmentService.find(bpa_id);
		request.setAttribute(REQUEST_BEAN, bean);
		return redirectJsp("basepicattachment_"+FORWARD_EDIT_PAGE);
	}

	/**
	 * 跳转到查看页面
	 * @param request
	 * @param bpa_id
	 * @return
	 */
	@RequestMapping("/detailPage")
	public String detailPage(HttpServletRequest request, String bpa_id) {
		BasePicAttachment bean = basePicAttachmentService.find(bpa_id);
		request.setAttribute(REQUEST_BEAN, bean);
		return redirectJsp("basepicattachment_"+FORWARD_DETAIL_PAGE);
	}

	/**
	 * 增加一条记录
	 * @param BasePicAttachment vo
	 * @return JSON
	 */
	@RequestMapping("/insert")
	@ResponseBody
	public Json insert(BasePicAttachment vo) {
		Json j = new Json();
		try {
			basePicAttachmentService.insert(vo);
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
	public Json update(HttpServletRequest request,BasePicAttachment vo) {
		Json j = new Json();
		try {
			if (vo.getBpa_id()!=null){
				basePicAttachmentService.update(vo);
			}else{
				basePicAttachmentService.insert(vo);
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
	 * @param bpa_id
	 */
	@RequestMapping("/remove")
	@ResponseBody
	public Json remove(HttpServletRequest request,String bpa_id) {
		Json j = new Json();
		try {
			Map<String, Object> queryParams = new HashMap<String, Object>();
			queryParams.put("bpa_id",bpa_id);
			basePicAttachmentService.remove(queryParams);
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
	 * @param bpa_ids
	 * @return Json
	 * @throws Exception
	 */
	@RequestMapping("/removeMulti")
	@ResponseBody
	public Json removeMulti(HttpServletRequest request,String bpa_ids) {
		String[] items = bpa_ids.split(",");
		Json j = new Json();
		try {
			Map<String, Object> queryParams = new HashMap<String, Object>();
			queryParams.put("ids",items);
			basePicAttachmentService.removeBatch(queryParams);
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
	 * @param bpa_id
	 */
	@RequestMapping("/delete")
	@ResponseBody
	public Json delete(HttpServletRequest request,Integer bpa_id) {
		Json j = new Json();
		try {
			basePicAttachmentService.delete(bpa_id);
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
	 * @param bpa_ids
	 * @return Json
	 * @throws Exception
	 */
	@RequestMapping("/deleteMulti")
	@ResponseBody
	public Json deleteMulti(HttpServletRequest request,String bpa_ids) {
		String[] items = bpa_ids.split(",");
		Json j = new Json();
		try {
			basePicAttachmentService.deleteBatch(items);
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
		//自增id	
		String bpa_id = request.getParameter("bpa_id");
		if (StringUtils.isNotBlank(bpa_id)) {
			queryParams.put("bpa_id", bpa_id);
		}
		//所属公司	
		String bpa_orgid = request.getParameter("bpa_orgid");
		if (StringUtils.isNotBlank(bpa_orgid)) {
			queryParams.put("bpa_orgid", bpa_orgid);
		}
		//商品图片标题	
		String bpa_tittle = request.getParameter("bpa_tittle");
		if (StringUtils.isNotBlank(bpa_tittle)) {
			queryParams.put("bpa_tittle", bpa_tittle);
		}
		//路径	
		String bpa_path = request.getParameter("bpa_path");
		if (StringUtils.isNotBlank(bpa_path)) {
			queryParams.put("bpa_path", bpa_path);
		}
		//类型（0-其他；1-图片；2-视频）	
		String bpa_type = request.getParameter("bpa_type");
		if (StringUtils.isNotBlank(bpa_type)) {
			queryParams.put("bpa_type", bpa_type);
		}
		//附件尺寸	
		String bpa_size = request.getParameter("bpa_size");
		if (StringUtils.isNotBlank(bpa_size)) {
			queryParams.put("bpa_size", bpa_size);
		}
		//原始文件名称	
		String bpa_file_name = request.getParameter("bpa_file_name");
		if (StringUtils.isNotBlank(bpa_file_name)) {
			queryParams.put("bpa_file_name", bpa_file_name);
		}
		//附件描述	
		String bpa_description = request.getParameter("bpa_description");
		if (StringUtils.isNotBlank(bpa_description)) {
			queryParams.put("bpa_description", bpa_description);
		}
		//状态	
		String bpa_status = request.getParameter("bpa_status");
		if (StringUtils.isNotBlank(bpa_status)) {
			queryParams.put("bpa_status", bpa_status);
		}
		//添加时间	
		String bpa_add_time = request.getParameter("bpa_add_time");
		if (StringUtils.isNotBlank(bpa_add_time)) {
			queryParams.put("bpa_add_time", bpa_add_time);
		}
		//上传用户id	
		String bpa_adduserid = request.getParameter("bpa_adduserid");
		if (StringUtils.isNotBlank(bpa_adduserid)) {
			queryParams.put("bpa_adduserid", bpa_adduserid);
		}
		//	
		String bpa_dr = request.getParameter("bpa_dr");
		if (StringUtils.isNotBlank(bpa_dr)) {
			queryParams.put("bpa_dr", bpa_dr);
		}
		return queryParams;
	}
}