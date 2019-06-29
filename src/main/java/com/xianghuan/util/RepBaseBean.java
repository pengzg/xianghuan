package com.xianghuan.util;

import java.io.Serializable;

import org.xianghuan.web.model.Pager;

/**
 * 手机端响应 基础类
 * 
 * @author panyf
 * 
 */

public class RepBaseBean implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6232408252840355330L;

	/**
	 * 响应码 其他可自己定义
	 */
	public static final String REQPCODE_SUC = "00"; // 成功
	public static final String REQPCODE_FAILD = "01"; // 失败
	public static final String REQPCODE_SIGN = "02"; // 验签失败
	public static final String REQPCODE_LOGIN = "03"; // 未登录
	public static final String REQPCODE_PARAM = "04"; // 缺少参数
	public static final String REQPCODE_ERROR_PARAM = "06"; // 参数不合法
	public static final String REQPCODE_ERROR_PARAM_MSG = "参数不合法!"; // 参数不合法
	public static final String REQPCODE_PARAM_MSG = "请求缺少参数,系统无法处理!"; // 缺少参数
	public static final String REQPCODE_CODE = "05"; // 错误的请求码
	public static final String REFUND_FRESH_CODE = "06"; // 错误的请求码
	public static final String REFUND_FRESH_CODE_MSG = "生鲜订单退换货请打客服电话"; // 错误的请求码
	public static final String REQPCODE_ERROR = "99";// 异常
	public static final String UPLOAD_PIC_ERROR = "07";// 异常
	public static final String UPLOAD_PIC_ERROR_MSG = "上传的图片不符合类型";// 异常
	public static final String ORDER_CODE_UNEXIT = "08";// 订单号不存在
	public static final String ORDER_UNPAID = "09";// 订单未支付成功
	
	public static final String REFUND_REAPT_CODE = "10";//订单正在售后中 不能再次申请
	public static final String REFUND_REAPT_CODE_MSG = "订单正在售后中 不能再次申请";//
	public static final String REFUND_NO_PRODUCT = "11";//订单可售后的商品为0
	public static final String REFUND_NO_PRODUCT_MSG = "可售后的商品数量为0";//

	public static final String ORDER_USERPAYING = "12";// 订单用户登台支付中.
	
	
	public static final String BENEFIT_GOOD_NOTSUIT_CODE = "13";//
	public static final String BENEFIT_GOOD_NOTSUIT_MSG = "该订单金额不满足该福利商品选择条件 请重新选择福利商品";//
	//b2b用户未通过审核
	public static final String B2B_USER_NOT_CHECK = "20";//
	public static final String B2B_USER_NOT_CHECK_MSG = "该用户还未通过审核，请联系客服推广人员";//
	public static final String BLACK_LIST_USER = "88";// 黑名单用户标志  检测到这个返回 则app退出 清除所有用户在app缓存的数据
	public static final String BLACK_LIST_USER_MSG = "您的登录账号有问题，请与管理员联系!";// 用户账号有问题返回给前端 的信息
	
	
	private Pager pager;
	private String repCode = ""; // 响应码
	private String repMsg = ""; // 返回消息

	
	public Pager getPager() {
		return pager;
	}

	public void setPager(Pager pager) {
		this.pager = pager;
	}

	public String getRepCode() {
		return repCode;
	}

	public void setRepCode(String repCode) {
		this.repCode = repCode;
	}

	public String getRepMsg() {
		return repMsg;
	}

	public void setRepMsg(String repMsg) {
		this.repMsg = repMsg;
	}


	/**
	 * 执行 结果
	 * @param msg
	 */
	public void setSuccess(String msg){
		this.repCode = REQPCODE_SUC;
		this.repMsg = msg;
	}
	public void setFalid(String msg){
		this.repCode = REQPCODE_FAILD;
		this.repMsg = msg;
	}
	public void setError(String msg){
		this.repCode = REQPCODE_ERROR;
		this.repMsg = msg;
	}
	public void setExecRes(String repCode,String msg){
		this.repCode = repCode;
		this.repMsg = msg;
	}
	
	public void setBlackList(){
		this.repCode = BLACK_LIST_USER;
		this.repMsg = BLACK_LIST_USER_MSG;
	}

}
