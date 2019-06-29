/*
 * Powered By [rapid-framework]
 * Web Site: http://www.rapid-framework.org.cn
 * Google Code: http://code.google.com/p/rapid-framework/
 * Since 2008 - 2014
 */

package com.xianghuan.auth.system.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.xianghuan.jdbc.exception.BusinessException;
import org.xianghuan.jdbc.generator.SequenceGenerator;
import org.xianghuan.util.DateUtil;
import org.xianghuan.util.SystemConstants;
import org.xianghuan.web.model.DataGrid;
import org.xianghuan.web.model.Query;

import com.xianghuan.auth.system.cache.SysUserUnityCache;
import com.xianghuan.auth.system.dao.ISysUserUnityDao;
import com.xianghuan.auth.system.model.SysUserUnity;
import com.xianghuan.auth.system.service.ISysUserUnityService;

@Service("sysUserUnityService")
public class SysUserUnityServiceImpl implements ISysUserUnityService {
	private static final Logger log = Logger.getLogger(SysUserUnityServiceImpl.class);
	@Autowired
	private ISysUserUnityDao sysUserUnityDao;

	
	/**查询列表信息
	 * @param query
	 * @return list
	 */
	public List<SysUserUnity> select(Map queryParams) {
		return sysUserUnityDao.select(queryParams);
	}
	
	
	/**分页查询
	 * @param query
	 * @return
	 */
	public DataGrid dataGrid(Query query) {
		// TODO Auto-generated method stub
		DataGrid<SysUserUnity> dg = new DataGrid<SysUserUnity>();
		dg.setTotal(sysUserUnityDao.getRecordCount(query.getQueryParams()));
		dg.setRows(sysUserUnityDao.queryByCondition(query));
		return dg;
	}
	
	/**
	 * 插入单条记录，用id作主键，把null全替换为""
	 * @param vo 用于添加的VO对象
	 * @return 若添加成功，返回新生成的id
	 */
	public String insert(SysUserUnity vo) {
		// TODO Auto-generated method stub
		SequenceGenerator oid = new SequenceGenerator();
		// String [] ids = oid.generate(1);
		// vo.setSuu_id(ids[0]);
		// todo
		// 增加版本号和新增时间
//		if (StringUtils.isEmpty(vo.getSuu_type_detail()))
//			vo.setSuu_type_detail(vo.getSuu_ub_type());
		vo.setSuu_id(vo.getSuu_ub_id());
		vo.setSuu_dr(SystemConstants.SAVE + "");
		vo.setSuu_ts(DateUtil.getCurrentDateToString2());
		vo.setSuu_status(String.valueOf(SystemConstants.STATUS_ON));
		vo.setSuu_version(new Long(SystemConstants.initVersion));
		int iReturn = sysUserUnityDao.insert(vo);
		SysUserUnityCache.getInstance().put(vo.getSuu_ub_id(), vo);
		return iReturn + "";
	}

	/**
	 * 批更新插入多条记录，用id作主键，把null全替换为""
	 * @param vos 添加的VO对象数组
	 * @return 若添加成功，返回新生成的id数组
	 */
	public String[] insertBatch(SysUserUnity[] vos) {
		SequenceGenerator oid = new SequenceGenerator();
		String[] ids =oid.generate(vos.length);
		for(int i = 0; i < vos.length ; i++){
			vos[i].setSuu_id(ids[i]);
			//todo
			//增加版本号和新增时间
		}
		return sysUserUnityDao.insertBatch(vos);
	}

	/**
	 * 删除单条记录
	 * @param id 用于删除的记录的id
	 * @return 成功删除的记录数
	 */
	public int delete(String id) {
		// TODO Auto-generated method stub
		return sysUserUnityDao.delete(id);
	}

	/**
	 * 删除多条记录
	 * @param id 用于删除的记录的id
	 * @return 成功删除的记录数
	 */
	public int deleteBatch(String[] ids) {
		// TODO Auto-generated method stub
		return sysUserUnityDao.deleteBatch(ids);
	}
	
	/**
	 * 根据Id进行查询
	 * @param id 用于查找的id
	 * @return 查询到的VO对象
	 */
	public SysUserUnity find(String id){
		return sysUserUnityDao.find(id);
	}

	/**
	 * 更新单条记录
	 * @param vo 用于更新的VO对象
	 * @return 成功更新的记录数
	 */
	public int update(SysUserUnity vo) {
		SysUserUnity temp = find(vo.getSuu_id());
		if(temp == null ) {
			throw new  BusinessException("数据异常");
		}
		BeanUtils.copyProperties(vo, temp,new String[]{""});
		//todo增加版本号 
		return sysUserUnityDao.update(temp);
	}
	
	
	/**
	 * 更新单条记录
	 * @param vo 用于更新的VO对象
	 * @return 成功更新的记录数
	 */
	public int updateSelect(SysUserUnity vo) {
		SysUserUnity temp = find(vo.getSuu_id());
		if(temp == null) {
			throw new  BusinessException("数据异常");
		}
		//todo增加版本号 
		vo.setSuu_version(temp.getSuu_version()+1);
		int iReturn = sysUserUnityDao.updateSelect(vo);
		SysUserUnityCache.getInstance().put(temp.getSuu_ub_id(), vo);
		return iReturn;
	}

	/**
	 * 批量更新修改多条记录
	 * @param vos 添加的VO对象数组
	 * @return 成功更新的记录数组
	 */
	public int updateBatch(SysUserUnity[] vos) {
		return sysUserUnityDao.updateBatch(vos);
	}
	/**
	 * 批量更新修改多条记录
	 * @param vos 添加的VO对象数组
	 * @return 成功更新的记录数组
	 */
	public int updateBatch(Map<String, Object> map){
		return sysUserUnityDao.updateBatch(map);
	}

	@Override
	public int delete(SysUserUnity vo) {
		SysUserUnity temp = find(vo.getSuu_id());
		if(temp == null) {
			throw new  BusinessException("数据异常");
		}
		//todo增加版本号 
		temp.setSuu_dr(SystemConstants.DEL+"");
		temp.setSuu_ts(DateUtil.getCurrentDateToString2());
		temp.setSuu_version(temp.getSuu_version()+1);
		int iReturn = sysUserUnityDao.updateSelect(temp);
		SysUserUnityCache.getInstance().remove(vo.getSuu_ub_id());
		return 0;
	}
	
}
