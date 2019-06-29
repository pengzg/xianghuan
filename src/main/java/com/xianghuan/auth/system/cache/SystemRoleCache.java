package com.xianghuan.auth.system.cache;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.xianghuan.jdbc.exception.BusinessException;
import org.xianghuan.redis.AbstractBaseRedis;
import org.xianghuan.redis.RedisUtil;
import org.xianghuan.util.OnlineListener;

import com.xianghuan.auth.system.model.SysOrg;
import com.xianghuan.auth.system.model.SysRole;
import com.xianghuan.auth.system.service.ISysRoleService;

public class SystemRoleCache extends AbstractBaseRedis<String, SysOrg> {
	private static final Logger logger = Logger.getLogger(SystemRoleCache.class);
	private static SystemRoleCache instance = null;
	private static Object lock = new Object();
	private String keyPrefix = "SystemRoleCache_";

	public static SystemRoleCache getInstance() {
		if (instance == null) {
			synchronized (lock) {
				if (instance == null) {
					instance = new SystemRoleCache();
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
	public void remove(String key) {
		RedisUtil.getInstance().remove(this.keyPrefix + "_" + key);
	}

	public void removeAll() {
		RedisUtil.getInstance().removeAll();
	}

	public String getName(String code) {
		try {
			SysRole vo = this.get(code);
			if (vo == null)
				return "";
			return vo.getSr_name();

		} catch (Exception e) {
			return "";
		}
	}
	
	
	public String getID(String code) {
		try {
			SysRole vo = this.get(code);
			if (vo == null)
				return "";
			return vo.getSr_id();

		} catch (Exception e) {
			return "";
		}
	}

	// 获取被缓存的对象;
	public SysRole get(String key) throws BusinessException {
		ISysRoleService sysRoleService = (ISysRoleService) OnlineListener.ctx
				.getBean("sysRoleService");
		SysRole vo = null;
		try {
			vo = (SysRole) RedisUtil.getInstance().getObj(
					this.keyPrefix + "_" + key);
			if (vo == null) {
				throw new BusinessException("SYS_E998", "cache not find");
			}
			return vo;
		} catch (Exception e) {
			Map map = new HashMap();
			map.put("check_code", key);
			List<SysRole> list = sysRoleService.select(map);
			if (list == null || list.size()==0) {
				 logger.error("角色出错："+this.keyPrefix + "_" + key+"data not find");
			} else {
				vo = list.get(0);
				RedisUtil.getInstance().put(this.keyPrefix + "_" + key, vo);
			}
		}
		return vo;
	}
}
