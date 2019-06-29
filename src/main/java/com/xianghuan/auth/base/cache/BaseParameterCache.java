package com.xianghuan.auth.base.cache;

import org.apache.log4j.Logger;
import org.xianghuan.jdbc.exception.BusinessException;
import org.xianghuan.redis.RedisUtil;
import org.xianghuan.util.OnlineListener;

import com.xianghuan.auth.base.model.BaseParameter;
import com.xianghuan.auth.base.service.IBaseParameterService;

public class BaseParameterCache  {
	
	private static final long serialVersionUID = 1934969776833301021L;

	private static final Logger logger = Logger.getLogger(BaseParameterCache.class);

	// 关键字前缀字符;
	private String keyPrefix = "BaseParameterCache_$$$";


	private static BaseParameterCache instance = null;

	private static Object lock = new Object();

	public static BaseParameterCache getInstance() {
		if (instance == null) {
			synchronized (lock) {
				if (instance == null) {
					instance = new BaseParameterCache();
				}
			}
		}
		return instance;
	}

	public String getValue(String code) {
		try {
			BaseParameter vo = this.get(code);
			if (vo == null)
				return "";
			return vo.getBp_value();

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
	public BaseParameter get(String key) throws BusinessException {
		IBaseParameterService BaseParameterService = (IBaseParameterService) OnlineListener.ctx
				.getBean("baseParameterService");
		BaseParameter vo = null;
		try {
			vo = (BaseParameter) RedisUtil.getInstance().getObj(
					this.keyPrefix + "_" + key);
			if (vo == null) {
				throw new BusinessException("SYS_E998", "cache not find");
			}
			return vo;
		} catch (Exception e) {
			vo = BaseParameterService.findByKeyCode(key);
			if (vo == null) {
				 logger.error("多渠道参数配置缓存异常："+this.keyPrefix + "_" + key+"data not find");
			} else {
				RedisUtil.getInstance().put(this.keyPrefix + "_" + key, vo);
			}
		}
		return vo;
	}
	// 获取被缓存的值;
	public String getKeyValue(String key) throws BusinessException {
		IBaseParameterService BaseParameterService = (IBaseParameterService) OnlineListener.ctx
				.getBean("baseParameterService");
		BaseParameter vo = null;
		String keyValue="";
		try {
			vo = (BaseParameter) RedisUtil.getInstance().getObj(
					this.keyPrefix + "_" + key);

			if (vo == null) {
				throw new BusinessException("SYS_E998", "cache not find");
			}
			return vo.getBp_value();
		} catch (Exception e) {
			vo = BaseParameterService.findByKeyCode(key);
			if (vo == null) {
				logger.error("多渠道参数配置缓存异常："+this.keyPrefix + "_" + key+"data not find");
			} else {
				RedisUtil.getInstance().put(this.keyPrefix + "_" + key, vo);
			}
		}
		if(vo == null)
			keyValue="";
		else
			keyValue = vo.getBp_value();
		return keyValue;
	}
}
