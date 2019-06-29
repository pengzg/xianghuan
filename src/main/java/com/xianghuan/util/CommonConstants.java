package com.xianghuan.util;

import org.xianghuan.util.SystemConstants;

public interface CommonConstants extends SystemConstants {
	
	/**
	 * 用户类型
	 */
	public static final int BASE_USERTYPE_1 = 1; // 实名认证
	public static final int BASE_USERTYPE_2 = 2; // 中介
	public static final int BASE_USERTYPE_3 = 3; // 房东
	public static final int BASE_USERTYPE_4 = 4; // 二房东
	public static final int BASE_USERTYPE_5 = 5;
	
	/**
	 * 用户来源
	 */
	public static final String BASE_USERSOURCE_1 = "1"; // 安卓 
	public static final String BASE_USERSOURCE_2 = "2"; // ios
	
	/**
	 * 租赁方式
	 */
	public static final String RENT_TYPE_1 = "1"; // 整租
	public static final String RENT_TYPE_2 = "2"; // 合租
	public static final String RENT_TYPE_3 = "3"; // 换租
	public static final String RENT_TYPE_4 = "4"; // 转租 
	public static final String RENT_TYPE_5 = "5"; // 公寓
	
	/**
	 * 房前类型
	 */
	public static final String ROOM_TYPE_1 = "1"; // 主卧
	public static final String ROOM_TYPE_2 = "2"; // 次卧
	public static final String ROOM_TYPE_3 = "3"; // 阳隔
	public static final String ROOM_TYPE_4 = "4"; // 厅隔 
	public static final String ROOM_TYPE_5 = "5"; // 暗隔 
	
	
	/**
	 * 审核状态 
	 */
	public static final String CHECK_STATUS_1 = "1"; // 提交待审核
	public static final String CHECK_STATUS_2 = "2"; // 审核通过
	public static final String CHECK_STATUS_3 = "3"; // 审核不通过
	public static final String CHECK_STATUS_4 = "4"; // 作废
	
	public static final String TYPE_USER = "1";
	public static final String TYPE_HOUSE = "2";

}
