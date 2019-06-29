/*
 * Powered By [rapid-framework]
 * Web Site: http://www.rapid-framework.org.cn
 * Google Code: http://code.google.com/p/rapid-framework/
 * Since 2008 - 2014
 */

package com.xianghuan.auth.system.service.impl;

import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.xianghuan.jdbc.exception.BusinessException;
import org.xianghuan.jdbc.generator.SequenceGenerator;
import org.xianghuan.web.model.DataGrid;
import org.xianghuan.web.model.Query;

import com.xianghuan.auth.system.dao.ISysUppdLogDao;
import com.xianghuan.auth.system.model.SysUppdLog;
import com.xianghuan.auth.system.service.ISysUppdLogService;
/**
 * @author admin
 * @version 1.0
 * @since 1.0
 */

@Service("sysUppdLogService")
public class SysUppdLogServiceImpl implements ISysUppdLogService {

	@Autowired
	private ISysUppdLogDao sysUppdLogDao;

	
	/**
	 * 
	 * 
	 * @param vo
	 * 
	 * 
	 * @return list
	 */
	public List<SysUppdLog> queryByCondition(Query query) {
		return sysUppdLogDao.queryByCondition(query);
	}
	
	
	
	@Override
	public DataGrid dataGrid(Query query) {
		// TODO Auto-generated method stub
		DataGrid<SysUppdLog> dg = new DataGrid<SysUppdLog>();
		dg.setTotal(sysUppdLogDao.getRecordCount(query.getQueryParams()));
		dg.setRows(sysUppdLogDao.queryByCondition(query));
		return dg;
	}
	
	@Override
	public SysUppdLog find(String id){
		return sysUppdLogDao.find(id);
	}

	@Override
	public int insert(SysUppdLog vo) {
		// TODO Auto-generated method stub
		SequenceGenerator oid = new SequenceGenerator();
		String [] ids = oid.generate(1);
		vo.setSul_id(ids[0]);
		//todo
		//增加版本号和新增时间
		return sysUppdLogDao.insert(vo);
	}

	@Override
	public String[] insertBatch(SysUppdLog[] vos) {
		SequenceGenerator oid = new SequenceGenerator();
		String[] ids =oid.generate(vos.length);
		for(int i = 0; i < vos.length ; i++){
			vos[i].setSul_id(ids[i]);
			//todo
			//增加版本号和新增时间
		}
		return sysUppdLogDao.insertBatch(vos);
	}

	@Override
	public int delete(String id) {
		// TODO Auto-generated method stub
		return sysUppdLogDao.delete(id);
	}

	@Override
	public int deleteBatch(String[] ids) {
		// TODO Auto-generated method stub
		return sysUppdLogDao.deleteBatch(ids);
	}

	@Override
	public int update(SysUppdLog vo) {
		SysUppdLog temp = find(vo.getSul_id());
		if(temp == null) {
			throw new  BusinessException("数据异常");
		}
		BeanUtils.copyProperties(vo, temp,new String[]{""});
		//todo增加版本号 
		return sysUppdLogDao.update(vo);
	}

	@Override
	public int updateBatch(SysUppdLog[] vos) {
		return sysUppdLogDao.updateBatch(vos);
	}
	
}
