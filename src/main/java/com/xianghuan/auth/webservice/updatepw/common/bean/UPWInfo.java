package com.xianghuan.auth.webservice.updatepw.common.bean;
/**
 * 要更新的密码信息
 * @author hehh
 *
 */
public class UPWInfo {
	private String id;//当前登录人ID
	private String newPassWord1;//新密码
	private String newPassWord2;//新密码
	private String code;//返回修改后CODE的信息
	private String msg;//返回错误信息
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getNewPassWord1() {
		return newPassWord1;
	}
	public void setNewPassWord1(String newPassWord1) {
		this.newPassWord1 = newPassWord1;
	}
	public String getNewPassWord2() {
		return newPassWord2;
	}
	public void setNewPassWord2(String newPassWord2) {
		this.newPassWord2 = newPassWord2;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
}
