package com.xianghuan.util;

import java.io.Serializable;

import org.apache.commons.lang.StringUtils;

import com.xianghuan.auth.base.cache.BaseParameterCache;


/**
 * APP服务共用常量
 * 
 * 
 */
public class AppConstants implements Serializable {
	
	public void init(){
		//System.out.println("开始初始化数据...");
	}
	/**
	 * 
	 */
	private static final long serialVersionUID = -6598663677487647687L;
	
	//图片路径
	private String imgpath_domain_url = "";
	//APP接口服务地址
	private String app_domain_url = "";
	
	public String getImgpath_domain_url() {
		imgpath_domain_url = BaseParameterCache.getInstance().getValue("imgpath_domain");
		if (StringUtils.isBlank(imgpath_domain_url)) {
			imgpath_domain_url = "http://47.95.241.50:8090";
		}
		return imgpath_domain_url;
	}

	public void setImgpath_domain_url(String imgpath_domain_url) {
		this.imgpath_domain_url = imgpath_domain_url;
	}
	
	public String getApp_domain_url() {
		app_domain_url = BaseParameterCache.getInstance().getValue("app_domain_url");
		if (StringUtils.isBlank(app_domain_url)) {
			app_domain_url = "http://47.95.241.50:8091";
		}
		return app_domain_url;
	}
	public void setApp_domain_url(String app_domain_url) {
		this.app_domain_url = app_domain_url;
	}	
}
