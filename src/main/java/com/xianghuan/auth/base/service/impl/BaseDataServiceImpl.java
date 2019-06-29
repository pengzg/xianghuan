/*
 * Powered By [rapid-framework]
 * Web Site: http://www.rapid-framework.org.cn
 * Google Code: http://code.google.com/p/rapid-framework/
 * Since 2008 - 2014
 */

package com.xianghuan.auth.base.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.xianghuan.util.DateUtil;
import org.xianghuan.util.SystemConstants;
import org.xianghuan.web.model.DataGrid;
import org.xianghuan.web.model.Query;
import org.xianghuan.web.model.SessionInfo;
import org.xianghuan.web.util.UserSessionUtil;

import com.xianghuan.auth.base.cache.BaseDataDetailListCache;
import com.xianghuan.auth.base.cache.BaseDataDetailValueCache;
import com.xianghuan.auth.base.dao.IBaseDataDao;
import com.xianghuan.auth.base.model.BaseData;
import com.xianghuan.auth.base.service.IBaseDataService;
import com.xianghuan.auth.base.vo.BaseDataVO;
/**
 * @author hhh
 * @version 1.0
 * @since 1.0
 */

@Service("baseDataService")
public class BaseDataServiceImpl implements IBaseDataService {
	private static final Logger log = Logger.getLogger(BaseDataServiceImpl.class);
	@Autowired
	private IBaseDataDao baseDataDao;

	
	
	@Override
	public DataGrid dataGrid(Query query) {
		DataGrid<BaseData> dg = new DataGrid<BaseData>();
		dg.setTotal(baseDataDao.getRecordCount(query.getQueryParams()));
		dg.setRows(baseDataDao.queryByCondition(query));
		return dg;
	}
	
	@Override
	public BaseData find(String id){
		return baseDataDao.find(id);
	}

	@Override
	public int insert(BaseData vo) {
		vo.setBd_dr(SystemConstants.SAVE);
//		vo.setBd_ts(DateUtil.getCurrentDateToString2());
//		vo.setBd_version(SystemConstantsExt.initVersion);
		vo.setBd_status(""+SystemConstants.STATUS_ON);
		SessionInfo sessionInfo = UserSessionUtil.getSession();
		if(sessionInfo != null) {
			vo.setBd_adduser(sessionInfo.getId());
		}
		vo.setBd_org(sessionInfo.getLoginorgid());
		vo.setBd_adddate(DateUtil.getCurrentDateToString2());
		int count = baseDataDao.insert(vo); 
		vo = this.find(vo.getBd_id());
		// updateCache(vo,false);
		return count;
	}

	@Override
	public String[] insertBatch(BaseData[] vos) {
		return baseDataDao.insertBatch(vos);
	}

	@Override
	public int delete(String id) {
		BaseData temp = this.find(id);
		temp.setBd_dr(SystemConstants.DEL);
		SessionInfo sessionInfo = UserSessionUtil.getSession();
		if(sessionInfo != null) {
			temp.setBd_deleteuser(sessionInfo.getId());
		}
		temp.setBd_deletedate(DateUtil.getCurrentDateToString2());
//		temp.setBd_ts(DateUtil.getCurrentDateToString2());
		int iReturn = baseDataDao.update(temp);
		// updateCache(temp,true);
		return iReturn;
	}

	@Override
	public int deleteBatch(String[] ids) {
		// TODO Auto-generated method stub
		return baseDataDao.deleteBatch(ids);
	}

	@Override
	public int update(BaseData vo) {
		BaseData temp = find(vo.getBd_id());
//		if(temp == null || vo.getBd_version() != temp.getBd_version()) {
//			throw new  BusinessException("数据异常");
//		}
		BeanUtils.copyProperties(vo, temp, new String[] { "bd_org", "bd_dr",
				"bdt_code", "bd_datatypeid" });
//		temp.setBd_version(temp.getBd_version()+1);
		SessionInfo sessionInfo = UserSessionUtil.getSession();
		if(sessionInfo != null) {
			temp.setBd_modifyuser(sessionInfo.getId());
		}
		temp.setBd_modifydate(DateUtil.getCurrentDateToString2());
//		temp.setBd_ts(DateUtil.getCurrentDateToString2());
		int iReturn =  baseDataDao.update(temp);
		updateCache(temp,false);
		return iReturn;
	}



	private void updateCache(BaseData temp, boolean isDel) {
		if (isDel) {
			BaseDataDetailValueCache.getInstance().remove(temp.getBdt_code(),temp.getBd_code());
		} else {
			BaseDataVO vo = changeModelToVO(temp);
			BaseDataDetailValueCache.getInstance().put(vo.getBdt_code(),vo.getBd_code(), vo);
		}
		Map map = new HashMap();
		map.put("bd_datatypeid", temp.getBd_datatypeid());
		map.put("bd_status", "" + SystemConstants.STATUS_ON);
		List<BaseDataVO> list = this.selectVO(map);
		String code =temp.getBdt_code();
		BaseDataDetailListCache.getInstance().put(SystemConstants.ORG_FAULT_VALUE,code, list);
	}

	@Override
	public int updateBatch(BaseData[] vos) {
		return baseDataDao.updateBatch(vos);
	}

	@Override
	public List<BaseData> select(Map map) {
		
		List list =  baseDataDao.select(map);
		
		return list;
	}

	public List<BaseDataVO> selectVO(Map map) {
		List<BaseData> list = baseDataDao.select(map);
		List<BaseDataVO> l = new ArrayList<BaseDataVO>();
		for (BaseData t : list) {
			BaseDataVO vo = new BaseDataVO();
			BeanUtils.copyProperties(t, vo);
			l.add(vo);
		}
		return l;
	}
	
	
	public BaseDataVO changeModelToVO(BaseData model) {
		BaseDataVO vo = new BaseDataVO();
		BeanUtils.copyProperties(model, vo);
		return vo;
	}

	@Override
	public List<BaseData> getBaseDataByPid(String pid) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("bdt_code", pid);
		map.put("bd_status", SystemConstants.STATUS_ON);
		map.put("bd_dr", SystemConstants.SAVE);
		List<BaseData> list = baseDataDao.getBaseData(map);
		return list;
	}
}
