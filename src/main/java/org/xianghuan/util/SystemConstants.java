package org.xianghuan.util;


public interface SystemConstants {
	
	public static final String ORG_FAULT_VALUE = "00000001";

	public static final int SAVE = 1;// 保存

	public static final int DEL = 2;// 删除

	public static final int initVersion = 1;// 初始版本值

	public static final int STATUS_ON = 1;// 启用

	public static final int STATUS_OFF = 0;// 禁用
	
	//是否 1-是 2 - 否
	public static final int YES =  1;
	public static final int NO =  2;
	
	public static final int page_size = 10;
	/**
	 * 用户权限系统
	 */
	public static final String SYS_USER = "1";

	/**
	 * 日志类型 CONTROLLER
	 */
	public static final int LOG_TYPE_CONTROLLER = 1;
	/**
	 * 日志类型 SERVICE
	 */
	public static final int LOG_TYPE_SERVICE = 2;

	
	public static final String user_super = "1";// 超级管理员
	public static final String user_manager = "1";// 管理员
	public static final String user_general = "2";//业务员
	
	public static final String user_parter_general = "3";//加盟商业务员
	
	public static final String menutype_1 = "1";//菜单管理
	public static final String menutype_2 = "2";//菜单审核
	public static final String menutype_3 = "3";//菜单查询
	
	

	public static final String Y = "Y";
	public static final String N = "N";
	
	public static final String sort_str ="sort_str";//排序字段
	public static final String order_str = "order_str";//sort
	
	public static final String SESSION_VALIDATECODE = "session_validatecode";//验证码
	
	public static final String ISGROUP_GROUP = "1";//集团
	public static final String ISGROUP_COMPANY = "2";//公司
	public static final String USER_TYPE_ORG = "3";//公司
		
	public static final String SYSTEM_AUTH = "1001";//权限系统
	//1-注册验证码 2-普通短信 3 重置密码验证码4 修改绑定手机验证码5 后台用户名密码发送
	public static final String SYS_SMS_TYPE_1 =  "1";
	public static final String SYS_SMS_TYPE_2 =  "2";
	public static final String SYS_SMS_TYPE_3 =  "3";
	public static final String SYS_SMS_TYPE_4 =  "4";
	public static final String SYS_SMS_TYPE_5 =  "5";
	public static final String SYS_SMS_TYPE_6 =  "6"; // 社区盒子注册码
	public static final String SYS_SMS_TYPE_7 =  "7"; // 社区盒子微信注册完了 在app上设置密码
	public static final String SYS_SMS_TYPE_8 =  "8"; // 已注册但没有审核通过，再次提交信息
	//状态 1-成功 2-失败
	public static final String SUCCESS =  "1";
	public static final String FILE =  "2";
	
	/**
	 * 图片路径常量
	 */
	//public static final String IMGPATH_DOMAIN="http://m.shequkuaixian.com";
	public static final String IMGPATH_ROUTE="/static/upload";

	

	public static final Object USESR_SUPER = 1;

	

	

}
