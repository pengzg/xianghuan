/*
 * Powered By [rapid-framework]
 * Web Site: http://www.rapid-framework.org.cn
 * Google Code: http://code.google.com/p/rapid-framework/
 * Since 2008 - 2014
 */

package com.xianghuan.auth.base.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.xianghuan.util.SystemConstants;
import org.xianghuan.web.controller.BaseController;
import org.xianghuan.web.model.DataGrid;
import org.xianghuan.web.model.Json;
import org.xianghuan.web.model.Pager;
import org.xianghuan.web.model.Query;
import org.xianghuan.web.model.SessionInfo;
import org.xianghuan.web.util.UserSessionUtil;

import com.xianghuan.auth.base.cache.BaseDataDetailListCache;
import com.xianghuan.auth.base.model.BaseData;
import com.xianghuan.auth.base.service.IBaseDataService;
import com.xianghuan.auth.base.vo.BaseDataVO;

/**
 * @author hhh
 * @version 1.0
 * @since 1.0
 */

@Controller
@Scope("prototype")
@RequestMapping("/base/baseDataControl")
public class BaseDataController extends BaseController {
	private static final Logger log = Logger
			.getLogger(BaseDataController.class);
	@Autowired
	private IBaseDataService baseDataService;

	public BaseDataController() {
		super.folder = "/securityJsp/auth/base/basedata/";
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
		return baseDataService.dataGrid(query);
	}

	/**
	 * 跳转到添加页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/addPage")
	public String addPage(HttpServletRequest request, String bd_datatypeid) {
		request.setAttribute("bd_datatypeid", bd_datatypeid);
		return redirectJsp("basedata_" + FORWARD_EDIT_PAGE);
	}

	@RequestMapping("/listPage")
	public String listPage() {
		return redirectJsp("basedata_" + FORWARD_LIST_PAGE);
	}

	/**
	 * 跳转到修改页面
	 * 
	 * @return
	 */
	@RequestMapping("/editPage")
	public String editPage(HttpServletRequest request, String bd_id,
			String bdt_isgroup) {
		BaseData bean = baseDataService.find(bd_id);
		request.setAttribute(REQUEST_BEAN, bean);
		request.setAttribute("bd_datatypeid", bean.getBd_datatypeid());
		request.setAttribute("bdt_isgroup", bdt_isgroup);
		return redirectJsp("basedata_" + FORWARD_EDIT_PAGE);
	}

	/**
	 * 跳转到查看页面
	 * 
	 * @return
	 */
	@RequestMapping("/detailPage")
	public String detailPage(HttpServletRequest request, String bd_id) {
		BaseData bean = baseDataService.find(bd_id);
		request.setAttribute(REQUEST_BEAN, bean);
		return redirectJsp("basedata_" + FORWARD_DETAIL_PAGE);
	}

	/**
	 * 增加一条记录
	 * 
	 * @param vo
	 * @return
	 */
	@RequestMapping("/insert")
	@ResponseBody
	public Json insert(HttpServletRequest request, BaseData vo) {
		Json j = new Json();
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("bd_code", vo.getBd_code());
			map.put("bd_datatypeid", vo.getBd_datatypeid());
			List<BaseData> list = baseDataService.select(map);
			if (list != null && list.size() > 0) {
				j.setMsg("字典编码已存在!");
			} else {
				baseDataService.insert(vo);
				j.setSuccess(true);
				j.setMsg("增加成功！");
			}
		} catch (Exception e) {
			e.printStackTrace();
			j.setMsg("操作失败！" + e.getMessage());
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
	public Json update(HttpServletRequest request, BaseData vo) {
		Json j = new Json();
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("bd_code", vo.getBd_code());
			map.put("bd_datatypeid", vo.getBd_datatypeid());
			List<BaseData> list = baseDataService.select(map);
			if (list != null && list.size() > 0
					&& !list.get(0).getBd_id().equals(vo.getBd_id())) {
				j.setMsg("字典编码已存在!");
			} else {
				baseDataService.update(vo);
				j.setSuccess(true);
				j.setMsg("编辑成功！");
			}
		} catch (Exception e) {
			e.printStackTrace();
			j.setMsg("操作失败！" + e.getMessage());
			log.error(e.getMessage(), e);
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
	public Json delete(String bd_id) {
		Json j = new Json();
		try {
			baseDataService.delete(bd_id);
			j.setMsg("删除成功！");
			j.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
			j.setMsg("操作失败！" + e.getMessage());
			log.error(e.getMessage(), e);
		}
		return j;
	}

	/**
	 * 从页面的表单获取多条记录id，并删除多条记录
	 * 
	 * @param bd_ids
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/deleteMulti")
	@ResponseBody
	public Json deleteMulti(String bd_ids) {
		String[] ids = bd_ids.split(bd_ids);
		Json j = new Json();
		try {
			baseDataService.deleteBatch(ids);
			j.setMsg("删除成功！");
			j.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
			j.setMsg("操作失败！" + e.getMessage());
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

	/**
	 * 根据 BaseDataType 的 ID 查找 BaseData
	 * 
	 */
	@RequestMapping("/treeGrid")
	@ResponseBody
	public void findByBaseDataTypeId(HttpServletRequest request,
			HttpServletResponse response, String datatype, String bdt_isgroup) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (StringUtils.isNotBlank(datatype)
				&& StringUtils.isNotBlank(bdt_isgroup)) {
			map.put("bd_datatypeid", datatype);
			if (SystemConstants.ISGROUP_COMPANY.equals(bdt_isgroup)) {
				SessionInfo session = UserSessionUtil.getSession(request);
				map.put("orgsList", session.getOrgsList());
			}
			super.writeJson(response, baseDataService.select(map));
		} else {
			try {
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().write("[]");
				response.getWriter().flush();
				response.getWriter().close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	@RequestMapping("/detailItem")
	@ResponseBody
	public List detailItem(HttpServletRequest request,
			HttpServletResponse response) {
		String codekey = request.getParameter("codekey");
		Map map = new HashMap();
		List<BaseDataVO> list = BaseDataDetailListCache.getInstance().get(
				codekey);
		/*Map<String,String> map = new HashMap<String,String>();
		map.put("bd_org", "00000001");
		map.put("bdt_code", "1007");
		map.put("bd_status", "" + SystemConstantsExt.STATUS_ON);
		List<BaseDataVO> list = baseDataService.selectVO(map);*/
		return list;
	}

}