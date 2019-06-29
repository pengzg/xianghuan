/*
 * Powered By [rapid-framework]
 * Web Site: http://www.rapid-framework.org.cn
 * Google Code: http://code.google.com/p/rapid-framework/
 * Since 2008 - 2014
 */

package com.xianghuan.auth.system.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.xianghuan.jdbc.exception.BusinessException;
import org.xianghuan.jdbc.generator.SequenceGenerator;
import org.xianghuan.web.model.DataGrid;
import org.xianghuan.web.model.Query;

import com.xianghuan.auth.system.dao.ISysActionLogDao;
import com.xianghuan.auth.system.model.SysActionLog;
import com.xianghuan.auth.system.service.ISysActionLogService;

@Service("sysActionLogService")
public class SysActionLogServiceImpl implements ISysActionLogService {

	@Autowired
	private ISysActionLogDao sysActionLogDao;

	
	/**
	 * 
	 * 
	 * @param vo
	 * 
	 * 
	 * @return list
	 */
	public List<SysActionLog> queryByCondition(Query query) {
		return sysActionLogDao.queryByCondition(query);
	}
	
	
	
	@Override
	public DataGrid dataGrid(Query query) {
		// TODO Auto-generated method stub
		DataGrid<SysActionLog> dg = new DataGrid<SysActionLog>();
		dg.setTotal(sysActionLogDao.getRecordCount(query.getQueryParams()));
		dg.setRows(sysActionLogDao.queryByCondition(query));
		return dg;
	}
	
	@Override
	public SysActionLog find(String id){
		return sysActionLogDao.find(id);
	}

	@Override
	public int insert(SysActionLog vo) {
		// TODO Auto-generated method stub
		SequenceGenerator oid = new SequenceGenerator();
		String [] ids = oid.generate(1);
		vo.setSal_id(ids[0]);
		//todo
		//增加版本号和新增时间
		return sysActionLogDao.insert(vo);
	}

	@Override
	public String[] insertBatch(SysActionLog[] vos) {
		SequenceGenerator oid = new SequenceGenerator();
		String[] ids =oid.generate(vos.length);
		for(int i = 0; i < vos.length ; i++){
			vos[i].setSal_id(ids[i]);
			//todo
			//增加版本号和新增时间
		}
		return sysActionLogDao.insertBatch(vos);
	}

	@Override
	public int delete(String id) {
		// TODO Auto-generated method stub
		return sysActionLogDao.delete(id);
	}

	@Override
	public int deleteBatch(String[] ids) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("ids",ids);
		/*List<SysActionLog> list = sysActionLogDao.select(map);
		for(SysActionLog l : list) {
			l.setSal_dr(SystemConstantsExt.del);
		}
		SysActionLog[] vos = new SysActionLog[list.size()];
		vos = list.toArray(vos);
		map.put("ids", ids);*/
		return sysActionLogDao.updateBatch(map);
	}

	@Override
	public int update(SysActionLog vo) {
		SysActionLog temp = find(vo.getSal_id());
		if(temp == null) {
			throw new  BusinessException("数据异常");
		}
		BeanUtils.copyProperties(vo, temp,new String[]{""});
		//todo增加版本号 
		return sysActionLogDao.update(vo);
	}

	@Override
	public int updateBatch(SysActionLog[] vos) {
		return sysActionLogDao.updateBatch(vos);
	}



	@Override
	public List<SysActionLog> select(Map<String, Object> map) {
		
		return sysActionLogDao.select(map);
	}



	@Override
	public int updateBatch(Map<String, Object> map) {
		
		return sysActionLogDao.updateBatch(map);
	}
	
}
