package com.xianghuan.auth.system.service.impl;

import java.util.ArrayList;
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

import com.xianghuan.auth.system.dao.ISysUserRoleDao;
import com.xianghuan.auth.system.model.SysRole;
import com.xianghuan.auth.system.model.SysUser;
import com.xianghuan.auth.system.model.SysUserRole;
import com.xianghuan.auth.system.service.ISysUserRoleService;

/**
 * @ClassName: SysUserRoleServiceImpl
 * @Description: 用户角色
 * @author shenwu
 * @date 2014年6月23日 上午9:01:49
 */
@Service("sysUserRoleService")
public class SysUserRoleServiceImpl implements ISysUserRoleService {

	@Autowired
	private ISysUserRoleDao sysUserRoleDao;
	
	/**
	 * @param vo
	 * @return list
	 */
	public List<SysUserRole> queryByCondition(Query query) {
		return sysUserRoleDao.queryByCondition(query);
	}
	
	@SuppressWarnings("rawtypes")
	@Override
	public DataGrid dataGrid(Query query) {
		// TODO Auto-generated method stub
		DataGrid<SysUserRole> dg = new DataGrid<SysUserRole>();
		dg.setTotal(sysUserRoleDao.getRecordCount(query.getQueryParams()));
		dg.setRows(sysUserRoleDao.queryByCondition(query));
		return dg;
	}
	
	@Override
	public SysUserRole find(String id){
		return sysUserRoleDao.find(id);
	}

	@Override
	public int insert(SysUserRole vo) {
		// TODO Auto-generated method stub
		SequenceGenerator oid = new SequenceGenerator();
		String [] ids = oid.generate(1);
		vo.setSur_id(ids[0]);
		return sysUserRoleDao.insert(vo);
	}

	@SuppressWarnings("unchecked")
	@Override
	public void insertBatch(String roles, String sur_userid) {

		sysUserRoleDao.delete(sur_userid);
		if (roles != null && roles.length() > 0) {
			String[] item = roles.split(",");
			int lent = item == null ? 0 : item.length;
			@SuppressWarnings("rawtypes")
			List<SysUserRole> list = new ArrayList();
			SequenceGenerator oid = new SequenceGenerator();
			String[] ids = oid.generate(lent);
			for (int i = 0; i < lent; i++) {
				SysUserRole userRole = new SysUserRole();
				userRole.setSur_roleid(item[i]);
				userRole.setSur_userid(sur_userid);
				userRole.setSur_id(ids[i]);
				list.add(userRole);
			}
			sysUserRoleDao.insertBatch(list);
		}
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public void insertBatchs(String sur_roles, String users) {
		if (users != null && users.length() > 0) {
			String[] item = users.split(",");
			int lent = item == null ? 0 : item.length;
			List<SysUserRole> list = new ArrayList();
			SequenceGenerator oid = new SequenceGenerator();
			String[] ids = oid.generate(lent);
			for (int i = 0; i < lent; i++) {
				SysUserRole userRole = new SysUserRole();
				userRole.setSur_userid(item[i]);
				userRole.setSur_roleid(sur_roles);
				userRole.setSur_id(ids[i]);
				list.add(userRole);
			}
			sysUserRoleDao.insertBatch(list);
		}
	}

	@Override
	public int delete(String id) {
		// TODO Auto-generated method stub
		return sysUserRoleDao.delete(id);
	}

	@Override
	public int deleteBatch(String[] ids1) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("ids",ids1);
		return sysUserRoleDao.deleteBatch(map);
	}

	@Override
	public int update(SysUserRole vo) {
		SysUserRole temp = find(vo.getSur_id());
		if(temp == null) {
			throw new  BusinessException("数据异常");
		}
		BeanUtils.copyProperties(vo, temp,new String[]{""});
		//todo增加版本号 
		return sysUserRoleDao.update(vo);
	}

	@Override
	public int updateBatch(SysUserRole[] vos) {
		return sysUserRoleDao.updateBatch(vos);
	}
	
	@SuppressWarnings("rawtypes")
	@Override
	public List<SysRole> select(Map queryParams) {
		// TODO Auto-generated method stub
		return sysUserRoleDao.select(queryParams);
	}
	
	@SuppressWarnings("rawtypes")
	@Override
	public List<SysUser> selectUsers(Map queryParams) {
		// TODO Auto-generated method stub
		return sysUserRoleDao.selectUsers(queryParams);
	}
	
}
