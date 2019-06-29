package com.xianghuan.auth.base.vo;

import java.io.Serializable;




import org.apache.commons.lang.StringUtils;

import com.xianghuan.util.AppConstants;
import com.xianghuan.util.CommonConstants;

public class BaseAttachmentVO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -3539173148871772626L;

	private String path;
	
	private String path_nameref;
	
	private AppConstants appConstants= new AppConstants();

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getPath_nameref() {
		if (StringUtils.isNotBlank(getPath())) {
			path_nameref = appConstants.getImgpath_domain_url()+CommonConstants.IMGPATH_ROUTE+getPath();
		}
		return path_nameref;
	}

	public void setPath_nameref(String path_nameref) {
		this.path_nameref = path_nameref;
	}
}
