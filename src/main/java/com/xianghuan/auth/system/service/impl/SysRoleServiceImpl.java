package com.xianghuan.auth.system.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.xianghuan.jdbc.exception.BusinessException;
import org.xianghuan.jdbc.generator.SequenceGenerator;
import org.xianghuan.util.DateUtil;
import org.xianghuan.util.SystemConstants;
import org.xianghuan.web.model.DataGrid;
import org.xianghuan.web.model.Query;

import com.xianghuan.auth.system.cache.SystemRoleCache;
import com.xianghuan.auth.system.dao.ISysRoleDao;
import com.xianghuan.auth.system.model.SysRole;
import com.xianghuan.auth.system.service.ISysRoleService;

/**
 * @ClassName: SysRoleServiceImpl
 * @Description: 角色管理实现层，主要写业务逻辑
 * @author shenwu
 * @date 2014年6月19日 下午12:04:49
 */
@Service("sysRoleService")
public class SysRoleServiceImpl implements ISysRoleService {

	@Autowired
	private ISysRoleDao sysRoleDao;
	
	@SuppressWarnings("rawtypes")
	public List<SysRole> select(Map map) {
		return sysRoleDao.select(map);
	}
	
	/**
	 * @param vo
	 * @return list
	 */
	public List<SysRole> queryByCondition(Query query) {
		return sysRoleDao.queryByCondition(query);
	}
	
	@SuppressWarnings("rawtypes")
	@Override
	public DataGrid dataGrid(Query query) {
		// TODO Auto-generated method stub
		DataGrid<SysRole> dg = new DataGrid<SysRole>();
		dg.setTotal(sysRoleDao.getRecordCount(query.getQueryParams()));
		dg.setRows(sysRoleDao.queryByCondition(query));
		return dg;
	}
	
	@Override
	public SysRole find(String id){
		return sysRoleDao.find(id);
	}

	@Override
	public int insert(SysRole vo) {
		check(vo, false);
		String prefix = vo.getSr_so_orgid();
		SequenceGenerator oid = new SequenceGenerator();
		String [] ids = oid.generate(prefix,1);
		vo.setSr_id(prefix+ids[0]);
		vo.setSr_dr(SystemConstants.SAVE+"");
		vo.setSr_version(new Long(SystemConstants.initVersion));
		vo.setSr_status(vo.getSr_status());
		vo.setSr_ts(DateUtil.getCurrentDateToString2());
		//todo
		//增加版本号和新增时间
		int i= sysRoleDao.insert(vo);
		SystemRoleCache.getInstance().put(vo.getSr_code(), vo);
		return i;
		
		
	}
	
	private void check(SysRole vo, boolean isUpdate) {
		Map queryCondition = new HashMap();
		queryCondition.put("check_code", vo.getSr_code());
		if (isUpdate)
			queryCondition.put("check_id", vo.getSr_id());
		int count = sysRoleDao.getRecordCount(queryCondition);
		if (count > 0)
			throw new BusinessException("角色编码 【" + vo.getSr_code()
					+ "】已存在，不允许重复");

	}

	@Override
	public String[] insertBatch(SysRole[] vos) {
		SequenceGenerator oid = new SequenceGenerator();
		String[] ids =oid.generate(vos.length);
		for(int i = 0; i < vos.length ; i++){
			vos[i].setSr_id(ids[i]);
			//todo
			//增加版本号和新增时间
		}
		return sysRoleDao.insertBatch(vos);
	}

	@Override
	public int delete(String id) {
		// TODO Auto-generated method stub
		return sysRoleDao.delete(id);
	}

	@Override
	public int deleteBatch(String[] ids1) {
		// TODO Auto-generated method stub
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("ids",ids1);
		return sysRoleDao.deleteBatch(map);
	}

	public int update(SysRole vo) {
		check(vo, true);
		SysRole tem = find(vo.getSr_id());
		if (tem == null || vo.getSr_version() != tem.getSr_version()) {
			throw new BusinessException("数据异常");
		}
		BeanUtils.copyProperties(vo, tem, new String[] { "" });
		tem.setSr_version(tem.getSr_version() + 1);
		int i = sysRoleDao.update(tem);
		SystemRoleCache.getInstance().put(tem.getSr_code(), tem);
		return i;
	}

	@Override
	public int updateBatch(SysRole[] vos) {
		return sysRoleDao.updateBatch(vos);
	}
	
}
