package com.xianghuan.auth.system.cache;

import org.apache.log4j.Logger;
import org.xianghuan.jdbc.exception.BusinessException;
import org.xianghuan.redis.RedisUtil;
import org.xianghuan.util.OnlineListener;

import com.xianghuan.auth.system.model.SysUserUnity;
import com.xianghuan.auth.system.service.ISysUserUnityService;
 

//根据机构CODE查询机构名字
public class SysUserUnityCache  {
	private static final Logger logger = Logger.getLogger(SysUserUnityCache.class);

	// 关键字前缀字符;
	private String keyPrefix = "SysUserUnityCache_$$$";

	private static final long serialVersionUID = -4397192926052141162L;

	private static SysUserUnityCache instance = null;

	private static Object lock = new Object();

	public static SysUserUnityCache getInstance() {
		if (instance == null) {
			synchronized (lock) {
				if (instance == null) {
					instance = new SysUserUnityCache();
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
				SysUserUnity vo = this.get(code);
				if (vo == null)
					return "";
				return vo.getSuu_ub_name();

			} catch (Exception e) {
				return "";
			}
		}

		// 获取被缓存的对象;
		public SysUserUnity get(String key) throws BusinessException {
			ISysUserUnityService sysUserUnityService = (ISysUserUnityService) OnlineListener.ctx.getBean("sysUserUnityService");
			SysUserUnity vo = null;
			try {
				vo = (SysUserUnity) RedisUtil.getInstance().getObj(this.keyPrefix + "_" + key);
				if (vo == null) {
					throw new BusinessException("SYS_E998", "cache not find");
				}
				return vo;
			} catch (Exception e) {
				vo = sysUserUnityService.find(key);
				if (vo == null) {
					 logger.error(this.keyPrefix + "_" + key+"data not find");
				}else {
					RedisUtil.getInstance().put(this.keyPrefix + "_" + key, vo);
				}
			}
			return vo;
		}
}
