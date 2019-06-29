package com.xianghuan.auth.system.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
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

import com.xianghuan.auth.system.dao.ISysMenuDao;
import com.xianghuan.auth.system.model.SysMenu;
import com.xianghuan.auth.system.service.ISysMenuService;

/**
 * 
 * @ClassName: SysMenuServiceImpl
 * @Description: 菜单管理
 * @author shenwu
 * @date 2014年7月8日 下午2:28:04
 *
 */
@Service("sysMenuService")
public class SysMenuServiceImpl implements ISysMenuService {
	
	@SuppressWarnings("unused")
	private static final Logger log = Logger.getLogger(SysMenuServiceImpl.class);
	@Autowired
	private ISysMenuDao sysMenuDao;
	
	@SuppressWarnings("rawtypes")
	public List<SysMenu> select(Map map) {
		return sysMenuDao.select(map);
	}
	/**查询列表信息
	 * @param query
	 * @return list
	 */
	public List<SysMenu> queryByCondition(Query query) {
		return sysMenuDao.queryByCondition(query);
	}
	
	
	
	/**分页查询
	 * @param query
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public DataGrid dataGrid(Query query) {
		// TODO Auto-generated method stub
		DataGrid<SysMenu> dg = new DataGrid<SysMenu>();
		dg.setTotal(sysMenuDao.getRecordCount(query.getQueryParams()));
		dg.setRows(sysMenuDao.queryByCondition(query));
		return dg;
	}
	
	/**
	 * 插入单条记录，用id作主键，把null全替换为""
	 * @param vo 用于添加的VO对象
	 * @return 若添加成功，返回新生成的id
	 */
	public String insert(SysMenu vo) {
		SequenceGenerator oid = new SequenceGenerator();
		String[] ids = oid.generate(1);
		vo.setSm_id(ids[0]);
		vo.setSm_dr(SystemConstants.SAVE);
		vo.setSm_version(SystemConstants.initVersion);
		vo.setSm_ts(DateUtil.getCurrentDateToString2());
		vo.setSm_adddate(DateUtil.getCurrentDateToString2());
		vo.setSm_modifydate(DateUtil.getCurrentDateToString2());
		vo.setSm_status(String.valueOf(SystemConstants.STATUS_ON));
		if (StringUtils.isNotBlank(vo.getSm_url()))
			vo.setSm_url(vo.getSm_url().replace("\\/", "/"));
		return sysMenuDao.insert(vo) + "";
	}

	/**
	 * 批更新插入多条记录，用id作主键，把null全替换为""
	 * @param vos 添加的VO对象数组
	 * @return 若添加成功，返回新生成的id数组
	 */
	public String[] insertBatch(SysMenu[] vos) {
		SequenceGenerator oid = new SequenceGenerator();
		String[] ids =oid.generate(vos.length);
		for(int i = 0; i < vos.length ; i++){
			vos[i].setSm_id(ids[i]);
			//todo
			//增加版本号和新增时间
		}
		return sysMenuDao.insertBatch(vos);
	}

	/**
	 * 删除单条记录
	 * @param id 用于删除的记录的id
	 * @return 成功删除的记录数
	 */
	public int delete(String id) {
		// TODO Auto-generated method stub
		return sysMenuDao.delete(id);
	}

	/**
	 * 删除多条记录
	 * @param id 用于删除的记录的id
	 * @return 成功删除的记录数
	 */
	public int deleteBatch(String[] ids) {
		// TODO Auto-generated method stub
		return sysMenuDao.deleteBatch(ids);
	}
	
	/**
	 * 根据Id进行查询
	 * @param id 用于查找的id
	 * @return 查询到的VO对象
	 */
	public SysMenu find(String id){
		return sysMenuDao.find(id);
	}

	/**
	 * 更新单条记录
	 * @param vo 用于更新的VO对象
	 * @return 成功更新的记录数
	 */
	public int update(SysMenu vo) {
		SysMenu tem = find(vo.getSm_id());
		if (tem == null || vo.getSm_version() != tem.getSm_version()) {
			throw new BusinessException("数据异常");
		}
		BeanUtils.copyProperties(vo, tem, new String[] { "sm_ts,sm_dr" });
		tem.setSm_version(tem.getSm_version() + 1);
		if (StringUtils.isNotBlank(vo.getSm_url()))
			tem.setSm_url(vo.getSm_url().replace("\\/", "/"));
		return sysMenuDao.update(tem);
		// todo增加版本号
	}

	/**
	 * 批量更新修改多条记录
	 * @param vos 添加的VO对象数组
	 * @return 成功更新的记录数组
	 */
	public int updateBatch(SysMenu[] vos) {
		return sysMenuDao.updateBatch(vos);
	}
}
