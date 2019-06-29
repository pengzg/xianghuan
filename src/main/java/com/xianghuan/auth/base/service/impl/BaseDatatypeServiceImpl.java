/*
 * Powered By [rapid-framework]
 * Web Site: http://www.rapid-framework.org.cn
 * Google Code: http://code.google.com/p/rapid-framework/
 * Since 2008 - 2014
 */

package com.xianghuan.auth.base.service.impl;

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
import com.xianghuan.auth.base.dao.IBaseDatatypeDao;
import com.xianghuan.auth.base.model.BaseData;
import com.xianghuan.auth.base.model.BaseDatatype;
import com.xianghuan.auth.base.service.IBaseDataService;
import com.xianghuan.auth.base.service.IBaseDatatypeService;
/**
 * @author hhh
 * @version 1.0
 * @since 1.0
 */

@Service("baseDatatypeService")
public class BaseDatatypeServiceImpl implements IBaseDatatypeService {
	private static final Logger log = Logger.getLogger(BaseDatatypeServiceImpl.class);
	@Autowired
	private IBaseDatatypeDao baseDatatypeDao;
	
	@Autowired
	private IBaseDataService baseDataService;
	

	@Override
	public DataGrid dataGrid(Query query) {
		DataGrid<BaseDatatype> dg = new DataGrid<BaseDatatype>();
		dg.setTotal(baseDatatypeDao.getRecordCount(query.getQueryParams()));
		dg.setRows(baseDatatypeDao.queryByCondition(query));
		return dg;
	}
	
	@Override
	public BaseDatatype find(String id){
		return baseDatatypeDao.find(id);
	}

	@Override
	public int insert(BaseDatatype vo) {
		//在此校验是否存在重复的编号
		SessionInfo sessionInfo = UserSessionUtil.getSession();
//		if(!sessionInfo.getRole().equals(SystemConstantsExt.USESR_SUPER))
//			throw new BusinessException("只有超级管理员才有权限进行操作！");
		vo.setBdt_isgroup(sessionInfo.getLoginorgid());
		vo.setBdt_dr(SystemConstants.SAVE);
//		vo.setBdt_ts(DateUtil.getCurrentDateToString2());
//		vo.setBdt_version(SystemConstantsExt.initVersion);
		vo.setBdt_adduser(sessionInfo.getId());
		vo.setBdt_adddate(DateUtil.getCurrentDateToString2());
		return baseDatatypeDao.insert(vo);
	}

	@Override
	public String[] insertBatch(BaseDatatype[] vos) {
		return baseDatatypeDao.insertBatch(vos);
	}

	public int delete(String id) {
		SessionInfo sessionInfo = UserSessionUtil.getSession();
//		if(!sessionInfo.getRole().equals(SystemConstantsExt.USESR_SUPER))
//			throw new BusinessException("只有超级管理员才有权限进行操作！");
		BaseDatatype temp = find(id);
		temp.setBdt_dr(SystemConstants.DEL);
		temp.setBdt_deleteuser(sessionInfo.getId());
		temp.setBdt_deletedate(DateUtil.getCurrentDateToString2());
		return baseDatatypeDao.update(temp);
	}

	@Override
	public int deleteBatch(String[] ids) {
		// TODO Auto-generated method stub
		return baseDatatypeDao.deleteBatch(ids);
	}

	@Override
	public int update(BaseDatatype vo) {
		SessionInfo sessionInfo = UserSessionUtil.getSession();
//		if(!sessionInfo.getRole().equals(SystemConstantsExt.USESR_SUPER))
//			throw new BusinessException("只有超级管理员才有权限进行操作！");
		BaseDatatype temp = find(vo.getBdt_id());
//		if(temp == null || temp.getBdt_version() != vo.getBdt_version()) {
//			throw new  BusinessException("数据异常");
//		}
		BeanUtils.copyProperties(vo, temp,new String[]{"orgid","bdt_adduser","bdt_adddate","bdt_org"});
//		temp.setBdt_version(temp.getBdt_version()+1);
		temp.setBdt_modifyuser(sessionInfo.getId());
		temp.setBdt_modifydate(DateUtil.getCurrentDateToString2());
		return baseDatatypeDao.update(temp);
	}

	@Override
	public int updateBatch(BaseDatatype[] vos) {
		return baseDatatypeDao.updateBatch(vos);
	}


	@Override
	public List<BaseDatatype> select(Map<String, Object> map) {
		
		return baseDatatypeDao.select(map);
	}

	@Override
	public synchronized void synchroFlush() {
		//同步更新前把以前信息全部销毁
		BaseDataDetailListCache.getInstance().removeAll();
		List<BaseDatatype> list = baseDatatypeDao.select(new HashMap());
		for (BaseDatatype temp : list) {
			Map map = new HashMap();
			map.put("bdt_code", temp.getBdt_code());
			map.put("bd_status", "" + SystemConstants.STATUS_ON);
			List<BaseData> dataList = baseDataService.select(map);
			if (dataList != null && dataList.size() > 0)
				BaseDataDetailListCache.getInstance().put(
						temp.getBdt_code(), dataList);
		}
	}
}
