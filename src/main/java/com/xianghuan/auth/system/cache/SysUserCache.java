package com.xianghuan.auth.system.cache;

import org.apache.log4j.Logger;
import org.xianghuan.jdbc.exception.BusinessException;
import org.xianghuan.redis.RedisUtil;
import org.xianghuan.util.OnlineListener;

import com.xianghuan.auth.system.model.SysUser;
import com.xianghuan.auth.system.service.ISysUserService;
 

//根据字典类型编码取列表信息
public class SysUserCache  {
	private static final Logger logger = Logger.getLogger(SysUserCache.class);

	// 关键字前缀字符;
	private String keyPrefix = "SystemUserCache_$$$";

	private static final long serialVersionUID = -4397192926052141162L;

	private static SysUserCache instance = null;

	private static Object lock = new Object();

	public static SysUserCache getInstance() {
		if (instance == null) {
			synchronized (lock) {
				if (instance == null) {
					instance = new SysUserCache();
				}
			}
		}
		return instance;
	}
	
	//把缓存里放值
	public void put(String id,Object obj) {
		RedisUtil.getInstance().put(this.keyPrefix + "_" + id, obj);
	}
	
	// 删除被缓存的对象;
	public void remove(String key ) {
		RedisUtil.getInstance().remove(this.keyPrefix + "_" + key);
	}


	public void removeAll() {
		RedisUtil.getInstance().removeAll();
	}
	
	public String getName(String code) {
		try {
			SysUser vo = this.get(code);
			if (vo == null)
				return "";
			return vo.getSu_name();

		} catch (Exception e) {
			return "";
		}
	}

	// 获取被缓存的对象;
	public SysUser get(String key) throws BusinessException {
		ISysUserService baseDataService = (ISysUserService) OnlineListener.ctx.getBean("sysUserService");
		SysUser vo = null;
		try {
			vo = (SysUser) RedisUtil.getInstance().getObj(this.keyPrefix + "_" + key);
			if (vo == null) {
				throw new BusinessException("SYS_E998", "cache not find");
			}
			return vo;
		} catch (Exception e) {
			vo = baseDataService.find(key);
			if (vo == null) {
				 logger.error(this.keyPrefix + "_" + key+"data not find");
			}else {
				RedisUtil.getInstance().put(this.keyPrefix + "_" + key, vo);
			}
		}
		return vo;
	}
}
