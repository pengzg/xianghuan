package org.xianghuan.util;

import java.io.Serializable;

/**
 * 执行结果 用于 函数 执行结果传递
 * 
 * @author panyf
 * 
 */
public class Result<T> implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2909683881033382915L;

	private boolean flag; // 执行是否成功
	private String code; // 返回码
	private String msg; // 返回信息
	private T t; // 返回值

	public static final String SUCCESS = "00";
	public static final String FALID = "01";
	public static final String ERROR = "02";

	public boolean isFlag() {
		return flag;
	}

	public void setFlag(boolean flag) {
		this.flag = flag;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public T getObj() {
		return t;
	}

	public void setObj(T obj) {
		this.t = obj;
	}

	/**
	 * 执行是否成功
	 * 
	 * @return
	 */
	public boolean isSuccess() {
		return flag;
	}

	/**
	 * 执行成功
	 */
	public void setSuccess(String msg) {
		this.flag = true;
		this.code = SUCCESS;
		this.msg = msg;
	}

	/**
	 * 执行成功
	 */
	public void setSuccess(String code, String msg) {
		this.flag = true;
		this.code = code;
		this.msg = msg;
	}

	/**
	 * 执行成功
	 */
	public void setSuccess(String code, String msg, T t) {
		this.flag = true;
		this.code = code;
		this.msg = msg;
		this.t = t;
	}

	/**
	 * 执行失败
	 */
	public void setFalid(String msg) {
		this.flag = false;
		this.code = FALID;
		this.msg = msg;
	}

	/**
	 * 执行失败
	 */
	public void setFalid(String code, String msg) {
		this.flag = false;
		this.code = code;
		this.msg = msg;
	}

	/**
	 * 执行失败
	 */
	public void setFalid(String code, String msg, T t) {
		this.flag = false;
		this.code = code;
		this.msg = msg;
		this.t = t;
	}

	/**
	 * 执行异常
	 */
	public void setError(String msg) {
		this.flag = false;
		this.code = ERROR;
		this.msg = msg;
	}

}