package org.xianghuan.util;

import javax.servlet.http.HttpSession;

/**
 * 用于前台页面判断是否有权限的工具类
 * 
 * @author administrator
 * 
 */
public class SecurityUtil {
	private HttpSession session;

	public SecurityUtil(HttpSession session) {
		this.session = session;
	}

	/**
	 * 判断当前用户是否可以访问某资源
	 * 
	 * @param url
	 *            资源地址
	 * @return
	 */
	public boolean havePermission(String url) {
//		SessionInfo sessionInfo = (SessionInfo) session.getAttribute(ConfigUtil.getSessionInfoName());
//		List<ResourceBaseVo> resources = new ArrayList<ResourceBaseVo>();
//		for (Syrole role : sessionInfo.getUser().getSyroles()) {
//			resources.addAll(role.getSyresources());
//		}
//		for (Syorganization organization : sessionInfo.getUser().getSyorganizations()) {
//			resources.addAll(organization.getSyresources());
//		}
//		resources = new ArrayList<Syresource>(new HashSet<Syresource>(resources));// 去重(这里包含了当前用户可访问的所有资源)
//		for (Syresource resource : resources) {
//			if (StringUtils.equals(resource.getUrl(), url)) {// 如果有相同的，则代表当前用户可以访问这个资源
//				return true;
//			}
//		}
//		return false;
		return true;
	}
}
