package com.xianghuan.admin.user.cache;

import org.apache.log4j.Logger;
import org.xianghuan.jdbc.exception.BusinessException;
import org.xianghuan.redis.RedisUtil;
import org.xianghuan.util.OnlineListener;

import com.xianghuan.admin.user.model.UserBase;
import com.xianghuan.admin.user.service.IUserBaseService;

public class UserBaseCache {
	/**
	 * 
	 */
	private static final long serialVersionUID = -3791229310526033813L;

	private static final Logger logger = Logger.getLogger(UserBaseCache.class);

	// 关键字前缀字符;
	private String keyPrefix = "UserBaseCache_$$$";


	private static UserBaseCache instance = null;

	private static Object lock = new Object();

	public static UserBaseCache getInstance() {
		if (instance == null) {
			synchronized (lock) {
				if (instance == null) {
					instance = new UserBaseCache();
				}
			}
		}
		return instance;
	}

	public String getValue(String code) {
		try {
			UserBase vo = this.get(code);
			if (vo == null)
				return "";
			return vo.getUb_id()+"";

		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}
	}

	//把缓存里放值
	public void put(String id,Object obj) {
		RedisUtil.getInstance().put(this.keyPrefix + "_" + id, obj);
	}
	// 删除被缓存的对象;
	public void remove(String key) {
		RedisUtil.getInstance().remove(this.keyPrefix + "_" + key);
	}

	public void removeAll() {
		RedisUtil.getInstance().removeAll();
	}

	// 获取被缓存的对象;
	public UserBase get(String key) throws BusinessException {
		IUserBaseService userBaseService = (IUserBaseService) OnlineListener.ctx
				.getBean("userBaseService");
		UserBase vo = null;
		try {
			vo = (UserBase) RedisUtil.getInstance().getObj(
					this.keyPrefix + "_" + key);
			if (vo == null) {
				throw new BusinessException("SYS_E998", "cache not find");
			}
			return vo;
		} catch (Exception e) {
			vo = userBaseService.find(Integer.valueOf(key));
			if (vo == null) {
				 logger.error("用户信息缓存异常："+this.keyPrefix + "_" + key+"data not find");
			} else {
				RedisUtil.getInstance().put(this.keyPrefix + "_" + key, vo);
			}
		}
		return vo;
	}
	// 获取被缓存的值;
	public String getKeyValue(String key) throws BusinessException {
		IUserBaseService userBaseService = (IUserBaseService) OnlineListener.ctx
				.getBean("userBaseService");
		UserBase vo = null;
		String keyValue="";
		vo = this.get(key);
		if(vo == null)
			keyValue="";
		else
			keyValue = vo.getUb_username();
		return keyValue;
	}
}
