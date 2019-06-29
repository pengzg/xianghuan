package org.xianghuan.web.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.xianghuan.util.FastjsonFilter;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;

/**
 * 基础控制器
 * 
 * 其他控制器继承此控制器获得日期字段类型转换和防止XSS攻击的功能
 * 
 * @author feizhang
 * 
 */
@RestController
public abstract class BaseController {
	private static final Logger logger = Logger.getLogger(BaseController.class);
	// 框架内置全局性的配置，用于页面跳转
	public final static String FORWARD_TO_QUERY_ALL = "toQueryAll";
	public final static String FORWARD_LIST_PAGE = "listPage";
	public final static String FORWARD_ADD_PAGE = "addPage";
	public final static String FORWARD_EDIT_PAGE = "editPage";
	public final static String FORWARD_DETAIL_PAGE = "detailPage";
	public final static String FORWARD_PRINT_PAGE = "printPage";
	public final static String FORWARD_REFERENCE_PAGE = "referencePage";
	public final static String FORWARD_STATISTIC_PAGE = "statisticPage";
	public final static String FORWARD_LOCAL = "localPage";
	public final static String RM_LOGIN_USER = "RM_LOGIN_USER";
	public final static String SQKXBOX_LOGIN_USER = "SQKXBOX_LOGIN_USER";
	// 页面中的列表控件宽度定义
	public final static String JSP_LAYOUT_WIDTH = "99%";

	// request处理中的key值
	public final static String REQUEST_ID = "id";
	public final static String REQUEST_IDS = "ids";
	public final static String REQUEST_BEAN = "bean";
	public final static String REQUEST_BEANS = "beans";
	public final static String REQUEST_QUERY_CONDITION = "queryCondition";
	public final static String REQUEST_WRITE_BACK_FORM_VALUES = "writeBackFormValues";
	public final static String REQUEST_REFERENCE_INPUT_TYPE = "referenceInputType";
	
	
	public final static String DEFAULT_STRING_SEPARATOR = ",";
	// 模块名称
	protected String folder;
	

	protected HttpServletRequest request;
	
	/*private static ActionMessages m_actionMessages = new ActionMessages();// 显示异常信息
	
	public static ActionMessages getActionMessages() {
		return m_actionMessages;
	}*/
	
	public BaseController() {
		super();
	}
	
	public BaseController(String folder) {
		super();
		this.folder = folder;
	}
	
	@InitBinder
	public void initBinder(ServletRequestDataBinder binder) {
		/**
		 * 自动转换日期类型的字段格式
		 */
		binder.registerCustomEditor(Date.class, new CustomDateEditor(
				new SimpleDateFormat("yyyy-MM-dd"), true));

		/**
		 * 防止XSS攻击
		 */
//		binder.registerCustomEditor(String.class, new StringEscapeEditor());
//		binder.registerCustomEditor(String.class, new StringEscapeEditor(true,false));
	}
	/**
	 * 用户跳转JSP页面
	 * 
	 * 此方法不考虑权限控制
	 * 
	 * @param folder 路径
	 * @param jspName JSP名称(不加后缀)
	 * @return 指定JSP页面
	 */
	@RequestMapping("/{jspName}")
	public String redirectJsp(@PathVariable String jspName) {
		return folder + "/" + jspName;
	}
	
	
	/**
     * 从request中获得查询条件
     * @param request
     * @return 返回查询字段对应的查询条件
     */
	public abstract Map<?, ?> getQueryCondition(HttpServletRequest request);
	
	
	/**
	 * 将对象转换成JSON字符串，并响应回前台
	 * 
	 * @param object
	 * @throws IOException
	 */
	public void writeJson(HttpServletResponse response,Object object) {
		writeJsonByFilter(response,object, null, null);
	}
	
	
	/**
	 * 获得request
	 * 
	 * @return
	 */
	public HttpServletRequest getRequest() {
		this.request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		return request;
	}

	
	/**
	 * 将对象转换成JSON字符串，并响应回前台
	 * 
	 * @param object
	 * @param includesProperties
	 *            需要转换的属性
	 * @param excludesProperties
	 *            不需要转换的属性
	 */
	public void writeJsonByFilter(HttpServletResponse response,Object object, String[] includesProperties, String[] excludesProperties) {
		try {
			FastjsonFilter filter = new FastjsonFilter();// excludes优先于includes
			if (excludesProperties != null && excludesProperties.length > 0) {
				filter.getExcludes().addAll(Arrays.<String> asList(excludesProperties));
			}
			if (includesProperties != null && includesProperties.length > 0) {
				filter.getIncludes().addAll(Arrays.<String> asList(includesProperties));
			}
			logger.info("对象转JSON：要排除的属性[" + excludesProperties + "]要包含的属性[" + includesProperties + "]");
			String json;
			String User_Agent = getRequest().getHeader("User-Agent");
			//if (StringUtils.indexOfIgnoreCase(User_Agent, "MSIE 6") > -1) {
				// 使用SerializerFeature.BrowserCompatible特性会把所有的中文都会序列化为\\uXXXX这种格式，字节数会多一些，但是能兼容IE6
			//	json = JSON.toJSONString(object, filter, SerializerFeature.WriteDateUseDateFormat, SerializerFeature.DisableCircularReferenceDetect, SerializerFeature.BrowserCompatible);
			//} else {
				// 使用SerializerFeature.WriteDateUseDateFormat特性来序列化日期格式的类型为yyyy-MM-dd hh24:mi:ss
				// 使用SerializerFeature.DisableCircularReferenceDetect特性关闭引用检测和生成
				json = JSON.toJSONString(object, filter, SerializerFeature.WriteDateUseDateFormat, SerializerFeature.DisableCircularReferenceDetect);
			//}
			logger.info("转换后的JSON字符串：" + json);
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().write(json);
			response.getWriter().flush();
			response.getWriter().close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
