package com.xianghuan.auth.base.cache;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.xianghuan.jdbc.exception.BusinessException;
import org.xianghuan.redis.RedisUtil;
import org.xianghuan.util.OnlineListener;
import org.xianghuan.util.SystemConstants;

import com.xianghuan.auth.base.service.IBaseDataService;
import com.xianghuan.auth.base.vo.BaseDataVO;
 

//@Component
public class BaseDataDetailListCache  {
	
	private static final Logger logger = Logger.getLogger(BaseDataDetailValueCache.class);

	// 关键字前缀字符;
	
	//aaaa
	
	private String keyPrefix = "BaseDataDetailListCache_VO_";

	   private static final long serialVersionUID = -4397192926052141162L;

	private static BaseDataDetailListCache instance = null;

	private static Object lock = new Object();

	private BaseDataDetailListCache() {
	}

	public static BaseDataDetailListCache getInstance() {
		if (instance == null) {
			synchronized (lock) {
				if (instance == null) {
					instance = new BaseDataDetailListCache();
				}
			}
		}
		return instance;
	}

	// 添加被缓存的对象;
	public void put(String code,Object value) {
		instance.put(SystemConstants.ORG_FAULT_VALUE,code, value);
	}
	
	public void put(String orgid,String code,Object value) {
		RedisUtil.getInstance().put(this.keyPrefix + "_" + orgid + "_" + code, value);
	}

	// 删除被缓存的对象;
	public void remove(String code) {
		this.remove(SystemConstants.ORG_FAULT_VALUE, code);
	}
	
	public void remove(String orgid,String code) {
		RedisUtil.getInstance().remove(this.keyPrefix + "_" + orgid + "_" + code);
	}


	public void removeAll() {
		RedisUtil.getInstance().removeAll();
	}
	
	//更新操作
	public void refreshUpdate(String code){
		List<BaseDataVO> list = getDetailList(code);
		RedisUtil.getInstance().put(this.keyPrefix + "_" + SystemConstants.ORG_FAULT_VALUE + "_" + code, list);
	}
	public void refreshUpdate(String orgid,String code){
		List<BaseDataVO> list = getDetailList(orgid,code);
		RedisUtil.getInstance().put(this.keyPrefix + "_" + orgid + "_" + code, list);
	}

	private List<BaseDataVO> getDetailList(String code) {
		return this.getDetailList(SystemConstants.ORG_FAULT_VALUE, code);
	}
	
	private List<BaseDataVO> getDetailList(String orgid,String code) {
		IBaseDataService baseDataService = (IBaseDataService) OnlineListener.ctx.getBean("baseDataService");
		Map<String, String> map = new HashMap<String, String>();
		if (StringUtils.isNotBlank(orgid))
			map.put("bd_org", orgid);
		map.put("bdt_code", code);
		map.put("bd_status", "" + SystemConstants.STATUS_ON);
		List<BaseDataVO> list = baseDataService.selectVO(map);
		return list;
	}
	
	// 获取被缓存的对象;
	public List<BaseDataVO> get(String code) throws BusinessException {
		return this.get(SystemConstants.ORG_FAULT_VALUE, code);
	}
	
	// 获取被缓存的对象;
	public  List<BaseDataVO>  get(String orgid,String code) throws BusinessException {
		logger.info(orgid+code);
		List<BaseDataVO> list = null;
		try {
			List<Object> objs = (List<Object>) RedisUtil.getInstance().getList(this.keyPrefix + "_" + orgid + "_" + code);
			list = ObjectToBaseData(objs);
			if (list == null || list.size() == 0) {
				throw new BusinessException("SYS_E998", "cache not find");
			}
			return list;
		} catch (Exception e) {
			// Cache中没有则从库获得数据.
			list = this.getDetailList(orgid,code);
			// 存放在Cache中 键值myKey
			if (list == null || list.size() == 0) {
				logger.error(e.getMessage(), e);
				logger.error("字典缓存列表异常：orgid：["+orgid+"] code:["+code+"]");
//				throw new BusinessException("SYS_E999", "取系统类型定义缓存出错");
			}
			RedisUtil.getInstance().put(this.keyPrefix + "_" + orgid + "_" + code, list);
			return list;
		}

	}
	
	private List<BaseDataVO> ObjectToBaseData(List<Object> objs ) {
		List<BaseDataVO> list = new ArrayList<BaseDataVO>();
		for(Object obj : objs) {
			list.add((BaseDataVO)obj);
		}
		return list;
	}
}
