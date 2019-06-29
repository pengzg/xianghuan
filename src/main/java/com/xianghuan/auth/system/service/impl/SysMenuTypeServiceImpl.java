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

import com.xianghuan.auth.system.dao.ISysMenuTypeDao;
import com.xianghuan.auth.system.model.SysMenuType;
import com.xianghuan.auth.system.service.ISysMenuTypeService;
/**
 * @author admin
 * @version 1.0
 * @since 1.0
 */

@Service("sysMenuTypeService")
public class SysMenuTypeServiceImpl implements ISysMenuTypeService {

	@Autowired
	private ISysMenuTypeDao sysMenuTypeDao;

	
	/**
	 * 
	 * 
	 * @param vo
	 * 
	 * 
	 * @return list
	 */
	public List<SysMenuType> queryByCondition(Query query) {
		return sysMenuTypeDao.queryByCondition(query);
	}
	
	
	
	@Override
	public DataGrid dataGrid(Query query) {
		DataGrid<SysMenuType> dg = new DataGrid<SysMenuType>();
		dg.setTotal(sysMenuTypeDao.getRecordCount(query.getQueryParams()));
		dg.setRows(sysMenuTypeDao.queryByCondition(query));
		return dg;
	}
	
	@Override
	public SysMenuType find(String id){
		return sysMenuTypeDao.find(id);
	}

	@Override
	public int insert(SysMenuType vo) {
		// TODO Auto-generated method stub
		SequenceGenerator oid = new SequenceGenerator();
		String [] ids = oid.generate(1);
		vo.setSmt_id(ids[0]);
		//todo
		//增加版本号和新增时间
		return sysMenuTypeDao.insert(vo);
	}

	@Override
	public String[] insertBatch(SysMenuType[] vos) {
		SequenceGenerator oid = new SequenceGenerator();
		String[] ids =oid.generate(vos.length);
		for(int i = 0; i < vos.length ; i++){
			vos[i].setSmt_id(ids[i]);
			//todo
			//增加版本号和新增时间
		}
		return sysMenuTypeDao.insertBatch(vos);
	}

	@Override
	public int delete(String id) {
		// TODO Auto-generated method stub
		return sysMenuTypeDao.delete(id);
	}

	@Override
	public int deleteBatch(String[] ids) {
		// TODO Auto-generated method stub
		return sysMenuTypeDao.deleteBatch(ids);
	}

	@Override
	public int update(SysMenuType vo) {
		SysMenuType temp = find(vo.getSmt_id());
		if(temp == null) {
			throw new  BusinessException("数据异常");
		}
		BeanUtils.copyProperties(vo, temp,new String[]{""});
		//todo增加版本号 
		return sysMenuTypeDao.update(vo);
	}

	@Override
	public int updateBatch(SysMenuType[] vos) {
		return sysMenuTypeDao.updateBatch(vos);
	}
	
}
