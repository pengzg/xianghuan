package com.xianghuan.auth.webservice.sso.util;

import net.sf.json.JSONObject;
import net.sf.json.util.JSONUtils;

import com.xianghuan.auth.webservice.sso.common.bean.SSOUserInfo;
import com.xianghuan.auth.webservice.updatepw.common.bean.UPWInfo;

/**
 * hhh
 * 
 * 对象串行化工具类
 * 使用JsonLib实现User和String的相互转换
 * 
 */
public class SSODeserializatorUtil {
	
	/**
	 * 根据加密的字符串返回User对象
	 * @param str
	 * @return
	 */
	public static SSOUserInfo StringToUserOfSecurity(String str) {
		try {
			SSOUserInfo user = null;
			str = SSOSecureUtil.DataDecrypt(str);
			if (JSONUtils.mayBeJSON(str)) {
				JSONObject jsonObject = JSONObject.fromObject(str);
				user = (SSOUserInfo) JSONObject.toBean(jsonObject, SSOUserInfo.class);
				return user;
			} else {
				return null;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * 将对象序列化为加密后的字符串
	 * @param user
	 * @return
	 */
	public static String ObjToStringOfSecurity(SSOUserInfo user) {
		JSONObject jsonObject = JSONObject.fromObject(user);
		try {
			return SSOSecureUtil.DataEncrypt(jsonObject.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}  
		return null;
	}
	
	/**
	 * 根据加密的字符串返回User对象
	 * @param str
	 * @return
	 */
	public static UPWInfo StringToUPWOfSecurity(String str) {
		try {
			UPWInfo info = null;
			str = SSOSecureUtil.DataDecrypt(str);
			if (JSONUtils.mayBeJSON(str)) {
				JSONObject jsonObject = JSONObject.fromObject(str);
				info = (UPWInfo) JSONObject.toBean(jsonObject, UPWInfo.class);
				return info;
			} else {
				return null;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * 将对象序列化为加密后的字符串
	 * @param user
	 * @return
	 */
	public static String UPWObjToStringOfSecurity(UPWInfo info) {
		JSONObject jsonObject = JSONObject.fromObject(info);
		try {
			return SSOSecureUtil.DataEncrypt(jsonObject.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}  
		return null;
	}
	
}

