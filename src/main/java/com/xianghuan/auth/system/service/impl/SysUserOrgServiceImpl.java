package com.xianghuan.auth.system.service.impl;

import java.util.ArrayList;
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

import com.xianghuan.auth.system.dao.ISysUserOrgDao;
import com.xianghuan.auth.system.model.SysOrg;
import com.xianghuan.auth.system.model.SysUserOrg;
import com.xianghuan.auth.system.service.ISysUserOrgService;

/**
 * 
 * @ClassName: SysUserOrgServiceImpl
 * @Description: 用户机构
 * @author shenwu
 * @date 2014年6月26日 下午1:15:15
 *
 */
@Service("sysUserOrgService")
public class SysUserOrgServiceImpl implements ISysUserOrgService {
	
	@SuppressWarnings("unused")
	private static final Logger log = Logger.getLogger(SysUserOrgServiceImpl.class);
	
	@Autowired
	private ISysUserOrgDao sysUserOrgDao;

	
	/**查询列表信息
	 * @param query
	 * @return list
	 */
	public List<SysUserOrg> queryByCondition(Query query) {
		return sysUserOrgDao.queryByCondition(query);
	}
	
	/**查询列表信息
	 * @param query
	 * @return list
	 */
	@SuppressWarnings("rawtypes")
	@Override
	public List<SysOrg> select(Map queryParams) {
		return sysUserOrgDao.select(queryParams);
	}
	
	/**分页查询
	 * @param query
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public DataGrid dataGrid(Query query) {
		// TODO Auto-generated method stub
		DataGrid<SysUserOrg> dg = new DataGrid<SysUserOrg>();
		dg.setTotal(sysUserOrgDao.getRecordCount(query.getQueryParams()));
		dg.setRows(sysUserOrgDao.queryByCondition(query));
		return dg;
	}
	
	/**
	 * 插入单条记录，用id作主键，把null全替换为""
	 * @param vo 用于添加的VO对象
	 * @return 若添加成功，返回新生成的id
	 */
	public String insert(SysUserOrg vo) {
		// TODO Auto-generated method stub
		SequenceGenerator oid = new SequenceGenerator();
		String [] ids = oid.generate(1);
		vo.setSuo_id(ids[0]);
		//todo
		//增加版本号和新增时间
		return sysUserOrgDao.insert(vo)+"";
	}

	/**
	 * 批更新插入多条记录，用id作主键，把null全替换为""
	 * @param vos 添加的VO对象数组
	 * @return 若添加成功，返回新生成的id数组
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public void insertBatch(String orgs, String suo_userid) {
		
		sysUserOrgDao.delete(suo_userid);
		if (orgs != null && orgs.length() > 0) {
			String[] item = orgs.split(",");
			int lent = item == null ? 0 : item.length;
			List<SysUserOrg> list = new ArrayList();
			SequenceGenerator oid = new SequenceGenerator();
			String[] ids = oid.generate(lent);
			for (int i = 0; i < lent; i++) {
				SysUserOrg userOrg = new SysUserOrg();
				userOrg.setSuo_orgid(item[i]);
				userOrg.setSuo_userid(suo_userid);
				userOrg.setSuo_id(ids[i]);
				userOrg.setSuo_dr(SystemConstants.SAVE);
				userOrg.setSuo_ts(DateUtil.getCurrentDateToString2());
				userOrg.setSuo_version(SystemConstants.initVersion);
				list.add(userOrg);
			}
			sysUserOrgDao.insertBatch(list);
		}
	}

	/**
	 * 删除单条记录
	 * @param id 用于删除的记录的id
	 * @return 成功删除的记录数
	 */
	public int delete(String id) {
		// TODO Auto-generated method stub
		return sysUserOrgDao.delete(id);
	}

	/**
	 * 删除多条记录
	 * @param id 用于删除的记录的id
	 * @return 成功删除的记录数
	 */
	public int deleteBatch(String[] ids) {
		// TODO Auto-generated method stub
		return sysUserOrgDao.deleteBatch(ids);
	}
	
	/**
	 * 根据Id进行查询
	 * @param id 用于查找的id
	 * @return 查询到的VO对象
	 */
	public SysUserOrg find(String id){
		return sysUserOrgDao.find(id);
	}

	/**
	 * 更新单条记录
	 * @param vo 用于更新的VO对象
	 * @return 成功更新的记录数
	 */
	public int update(SysUserOrg vo) {
		SysUserOrg temp = find(vo.getSuo_id());
		if(temp == null) {
			throw new  BusinessException("数据异常");
		}
		BeanUtils.copyProperties(vo, temp,new String[]{""});
		//todo增加版本号 
		return sysUserOrgDao.update(vo);
	}

	/**
	 * 批量更新修改多条记录
	 * @param vos 添加的VO对象数组
	 * @return 成功更新的记录数组
	 */
	public int updateBatch(SysUserOrg[] vos) {
		return sysUserOrgDao.updateBatch(vos);
	}
	
}
