/*
 * Powered By [rapid-framework]
 * Web Site: http://www.rapid-framework.org.cn
 * Google Code: http://code.google.com/p/rapid-framework/
 * Since 2008 - 2014
 */

package com.xianghuan.auth.system.model;

import com.xianghuan.auth.base.cache.BaseDataDetailValueCache;
import com.xianghuan.auth.system.cache.SysUserCache;
import com.xianghuan.util.BaseDataTypeCodeConstant;

public class SysFileIndex implements java.io.Serializable{
	private static final long serialVersionUID = 5454155825314635342L;
	
	//columns START111
	//主键
	private String sfi_id;
	//用户ID（FK:UB_ID）
	private String sfi_user_id;
	//运营商id
	private String sfi_orgid;
	//运营商id
	private String sfi_orgid_nameref;
	//删除标志位:0删除，1未删除
	private String sfi_dr;
	//时间
	private String sfi_ts;
	//模块类型（1.商家展示图片；2.头像图片；3.身份证扫描件；4.电子协议快照）
	private String sfi_type;
	//模块类型（1.商家展示图片；2.头像图片；3.身份证扫描件；4.电子协议快照）
	private String sfi_type_nameref;
	//存放路径
	private String sfi_save_url;
	//排序字段
	private Integer sfi_sort;
	//状态（0.禁用；1.启用）
	private String sfi_status;
	//状态（0.禁用；1.启用）
	private String sfi_status_nameref;
	//版本号
	private Long sfi_version;
	//新增人
	private String sfi_adduser;
	//新增人
	private String sfi_adduser_nameref;
	//新增日期
	private String sfi_adddate;
	//最后修改人
	private String sfi_modifyuser;
	//最后修改人
	private String sfi_modifyuser_nameref;
	//最后修改日期
	private String sfi_modifydate;
	//删除人
	private String sfi_deleteuser;
	//删除人
	private String sfi_deleteuser_nameref;
	//删除日期
	private String sfi_deletedate;
	//文件类型
	private String sfi_filetype;
	//文件名
	private String sfi_filename;
	//columns END

	public void setSfi_id(String value) {
		this.sfi_id = value;
	}
	
	public String getSfi_id() {
		return this.sfi_id;
	}
	public void setSfi_user_id(String value) {
		this.sfi_user_id = value;
	}
	
	public String getSfi_user_id() {
		return this.sfi_user_id;
	}
	public void setSfi_orgid(String value) {
		this.sfi_orgid = value;
	}
	
	public String getSfi_orgid() {
		return this.sfi_orgid;
	}
	public void setSfi_dr(String value) {
		this.sfi_dr = value;
	}
	
	public String getSfi_dr() {
		return this.sfi_dr;
	}
	public void setSfi_ts(String value) {
		this.sfi_ts = value;
	}
	
	public String getSfi_ts() {
		return this.sfi_ts;
	}
	public void setSfi_type(String value) {
		this.sfi_type = value;
	}
	
	public String getSfi_type() {
		return this.sfi_type;
	}
	public void setSfi_save_url(String value) {
		this.sfi_save_url = value;
	}
	
	public String getSfi_save_url() {
		return this.sfi_save_url;
	}
	public void setSfi_sort(Integer value) {
		this.sfi_sort = value;
	}
	
	public Integer getSfi_sort() {
		return this.sfi_sort;
	}
	public void setSfi_status(String value) {
		this.sfi_status = value;
	}
	
	public String getSfi_status() {
		return this.sfi_status;
	}
	public void setSfi_version(Long value) {
		this.sfi_version = value;
	}
	
	public Long getSfi_version() {
		return this.sfi_version;
	}
	public void setSfi_adduser(String value) {
		this.sfi_adduser = value;
	}
	
	public String getSfi_adduser() {
		return this.sfi_adduser;
	}
	public void setSfi_adddate(String value) {
		this.sfi_adddate = value;
	}
	
	public String getSfi_adddate() {
		return this.sfi_adddate;
	}
	public void setSfi_modifyuser(String value) {
		this.sfi_modifyuser = value;
	}
	
	public String getSfi_modifyuser() {
		return this.sfi_modifyuser;
	}
	public void setSfi_modifydate(String value) {
		this.sfi_modifydate = value;
	}
	
	public String getSfi_modifydate() {
		return this.sfi_modifydate;
	}
	public void setSfi_deleteuser(String value) {
		this.sfi_deleteuser = value;
	}
	
	public String getSfi_deleteuser() {
		return this.sfi_deleteuser;
	}
	public void setSfi_deletedate(String value) {
		this.sfi_deletedate = value;
	}
	
	public String getSfi_deletedate() {
		return this.sfi_deletedate;
	}
	public void setSfi_filetype(String value) {
		this.sfi_filetype = value;
	}
	
	public String getSfi_filetype() {
		return this.sfi_filetype;
	}
	public void setSfi_filename(String value) {
		this.sfi_filename = value;
	}
	
	public String getSfi_filename() {
		return this.sfi_filename;
	}

	public String getSfi_orgid_nameref() {
		if (this.getSfi_orgid()!= null) {
	// 		sfi_orgid_nameref = SystemOrgCache.getInstance().getName(this.getSfi_orgid());
		}
		return sfi_orgid_nameref;
	}

	public void setSfi_orgid_nameref(String sfi_orgid_nameref) {
		this.sfi_orgid_nameref = sfi_orgid_nameref;
	}

	public String getSfi_type_nameref() {
		if (this.getSfi_type() != null) {
			sfi_type_nameref = BaseDataDetailValueCache.getInstance().getName(BaseDataTypeCodeConstant.type_1033,getSfi_type());
		}
		return sfi_type_nameref;
	}

	public void setSfi_type_nameref(String sfi_type_nameref) {
		this.sfi_type_nameref = sfi_type_nameref;
	}

	public String getSfi_status_nameref() {
		if (this.getSfi_status() != null) {
			sfi_status_nameref = BaseDataDetailValueCache.getInstance().getName(BaseDataTypeCodeConstant.type_2006,getSfi_status());
		}
		return sfi_status_nameref;
	}

	public void setSfi_status_nameref(String sfi_status_nameref) {
		this.sfi_status_nameref = sfi_status_nameref;
	}

	public String getSfi_adduser_nameref() {
		if (this.getSfi_adduser()!= null) {
			sfi_adduser_nameref = SysUserCache.getInstance().getName(
					this.getSfi_adduser());
		}
		return sfi_adduser_nameref;
	}

	public void setSfi_adduser_nameref(String sfi_adduser_nameref) {
		this.sfi_adduser_nameref = sfi_adduser_nameref;
	}

	public String getSfi_modifyuser_nameref() {
		if (this.getSfi_modifyuser()!= null) {
			sfi_modifyuser_nameref = SysUserCache.getInstance().getName(
					this.getSfi_modifyuser());
		}
		return sfi_modifyuser_nameref;
	}

	public void setSfi_modifyuser_nameref(String sfi_modifyuser_nameref) {
		this.sfi_modifyuser_nameref = sfi_modifyuser_nameref;
	}

	public String getSfi_deleteuser_nameref() {
		if (this.getSfi_deleteuser()!= null) {
			sfi_deleteuser_nameref = SysUserCache.getInstance().getName(
					this.getSfi_deleteuser());
		}
		return sfi_deleteuser_nameref;
	}

	public void setSfi_deleteuser_nameref(String sfi_deleteuser_nameref) {
		this.sfi_deleteuser_nameref = sfi_deleteuser_nameref;
	}

	
	
}

