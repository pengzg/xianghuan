package com.xianghuan.auth.base.cache;

import java.io.Serializable;

import org.apache.log4j.Logger;
import org.xianghuan.jdbc.exception.BusinessException;
import org.xianghuan.redis.RedisUtil;
import org.xianghuan.util.OnlineListener;

import com.xianghuan.auth.base.model.BaseArea;
import com.xianghuan.auth.base.service.IBaseAreaService;

public class BaseAreaCache implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -3791229310526033813L;

	private static final Logger logger = Logger.getLogger(BaseAreaCache.class);

	// 关键字前缀字符;
	private String keyPrefix = "BaseAreaCache_$$$";


	private static BaseAreaCache instance = null;

	private static Object lock = new Object();

	public static BaseAreaCache getInstance() {
		if (instance == null) {
			synchronized (lock) {
				if (instance == null) {
					instance = new BaseAreaCache();
				}
			}
		}
		return instance;
	}

	public String getValue(String code) {
		try {
			BaseArea vo = this.get(code);
			if (vo == null)
				return "";
			return vo.getBa_id()+"";

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
	public BaseArea get(String key) throws BusinessException {
		IBaseAreaService baseAreaService = (IBaseAreaService) OnlineListener.ctx
				.getBean("baseAreaService");
		BaseArea vo = null;
		try {
			vo = (BaseArea) RedisUtil.getInstance().getObj(
					this.keyPrefix + "_" + key);
			if (vo == null) {
				throw new BusinessException("SYS_E998", "cache not find");
			}
			return vo;
		} catch (Exception e) {
			vo = baseAreaService.find(key);
			if (vo == null) {
				 logger.error("获取地区信息缓存异常："+this.keyPrefix + "_" + key+"data not find");
			} else {
				RedisUtil.getInstance().put(this.keyPrefix + "_" + key, vo);
			}
		}
		return vo;
	}
	// 获取被缓存的值;
	public String getKeyValue(String key) throws BusinessException {
		IBaseAreaService baseAreaService = (IBaseAreaService) OnlineListener.ctx
				.getBean("baseAreaService");
		BaseArea vo = null;
		String keyValue="";
		try {
			vo = (BaseArea) RedisUtil.getInstance().getObj(
					this.keyPrefix + "_" + key);

			if (vo == null) {
				throw new BusinessException("SYS_E998", "cache not find");
			}
			return vo.getBa_name();
		} catch (Exception e) {
			vo = baseAreaService.find(key);
			if (vo == null) {
				logger.error("获取地区信息缓存异常："+this.keyPrefix + "_" + key+"data not find");
			} else {
				RedisUtil.getInstance().put(this.keyPrefix + "_" + key, vo);
			}
		}
		if(vo == null)
			keyValue="";
		else
			keyValue = vo.getBa_name();
		return keyValue;
	}
}
