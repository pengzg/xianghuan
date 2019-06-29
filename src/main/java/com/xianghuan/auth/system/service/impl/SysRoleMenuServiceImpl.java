package com.xianghuan.auth.system.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.xianghuan.jdbc.exception.BusinessException;
import org.xianghuan.jdbc.generator.SequenceGenerator;
import org.xianghuan.web.model.DataGrid;
import org.xianghuan.web.model.Query;

import com.xianghuan.auth.system.dao.ISysRoleMenuDao;
import com.xianghuan.auth.system.model.SysMenu;
import com.xianghuan.auth.system.model.SysRoleMenu;
import com.xianghuan.auth.system.service.ISysRoleMenuService;

/**
 * @ClassName: SysRoleMenuServiceImpl
 * @Description: 角色菜单
 * @author shenwu
 * @date 2014年6月24日 下午4:08:55
 */
@Service("sysRoleMenuService")
public class SysRoleMenuServiceImpl implements ISysRoleMenuService {

	@Autowired
	private ISysRoleMenuDao sysRoleMenuDao;

	
	/**
	 * @param vo
	 * @return list
	 */
	public List<SysRoleMenu> queryByCondition(Query query) {
		return sysRoleMenuDao.queryByCondition(query);
	}
	
	
	
	@SuppressWarnings("rawtypes")
	@Override
	public DataGrid dataGrid(Query query) {
		// TODO Auto-generated method stub
		DataGrid<SysRoleMenu> dg = new DataGrid<SysRoleMenu>();
		dg.setTotal(sysRoleMenuDao.getRecordCount(query.getQueryParams()));
		dg.setRows(sysRoleMenuDao.queryByCondition(query));
		return dg;
	}
	
	@Override
	public SysRoleMenu find(String id){
		return sysRoleMenuDao.find(id);
	}

	@Override
	public int insert(SysRoleMenu vo) {
		// TODO Auto-generated method stub
		SequenceGenerator oid = new SequenceGenerator();
		String [] ids = oid.generate(1);
		vo.setSrm_id(ids[0]);
		//todo
		//增加版本号和新增时间
		return sysRoleMenuDao.insert(vo);
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public void insertBatch(String menus, String srm_roleid) {
		
		sysRoleMenuDao.delete(srm_roleid);
		if (menus != null && menus.length() > 0) {
			String[] item = menus.split(",");
			int lent = item == null ? 0 : item.length;
			List<SysRoleMenu> list = new ArrayList();
			SequenceGenerator oid = new SequenceGenerator();
			String[] ids =oid.generate(lent);
			for (int i = 0; i < lent; i++) {
				SysRoleMenu roleMenu = new SysRoleMenu();
				roleMenu.setSrm_menuid(item[i]);
				roleMenu.setSrm_roleid(srm_roleid);
				roleMenu.setSrm_id(ids[i]);
				list.add(roleMenu);
		}
			sysRoleMenuDao.insertBatch(list);
		}
	}

	@Override
	public int delete(String id) {
		// TODO Auto-generated method stub
		return sysRoleMenuDao.delete(id);
	}
	
//	@Override
//	public int deleteMenuId(String ids) {
//		// TODO Auto-generated method stub
//		return sysRoleMenuDao.delete(ids);
//	}

	@Override
	public int deleteBatch(String[] ids) {
		// TODO Auto-generated method stub
		return sysRoleMenuDao.deleteBatch(ids);
	}

	@Override
	public int update(SysRoleMenu vo) {
		SysRoleMenu temp = find(vo.getSrm_id());
		if(temp == null) {
			throw new  BusinessException("数据异常");
		}
		BeanUtils.copyProperties(vo, temp,new String[]{""});
		//todo增加版本号 
		return sysRoleMenuDao.update(vo);
	}

	@Override
	public int updateBatch(SysRoleMenu[] vos) {
		return sysRoleMenuDao.updateBatch(vos);
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List<SysMenu> select(Map queryParams) {
		// TODO Auto-generated method stub
		return sysRoleMenuDao.select(queryParams);
	}
	
}
