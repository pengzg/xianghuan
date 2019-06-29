/*
 * Powered By [rapid-framework]
 * Web Site: http://www.rapid-framework.org.cn
 * Google Code: http://code.google.com/p/rapid-framework/
 * Since 2008 - 2014
 */

package com.xianghuan.auth.system.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.xianghuan.jdbc.exception.BusinessException;
import org.xianghuan.jdbc.generator.SequenceGenerator;
import org.xianghuan.util.DateUtil;
import org.xianghuan.util.StringUtil;
import org.xianghuan.util.SystemConstants;
import org.xianghuan.web.model.DataGrid;
import org.xianghuan.web.model.Query;

import com.xianghuan.auth.system.dao.ISysOrgDao;
import com.xianghuan.auth.system.model.SysOrg;
import com.xianghuan.auth.system.model.SysUserUnity;
import com.xianghuan.auth.system.service.ISysOrgService;
import com.xianghuan.auth.system.service.ISysUserUnityService;
//import org.sqkx.util.SystemConstants;

/**
 * @author admin
 * @version 1.0
 * @since 1.0
 */

@Service("sysOrgService")
public class SysOrgServiceImpl implements ISysOrgService {

	@Autowired
	private ISysOrgDao sysOrgDao;

	@Autowired
	private ISysUserUnityService sysUserUnityService;

	@SuppressWarnings("rawtypes")
	public List<SysOrg> select(Map map) {
		return sysOrgDao.select(map);
	}

	public List<SysOrg> queryByCondition(Query query) {
		return sysOrgDao.queryByCondition(query);
	}

	@SuppressWarnings("rawtypes")
	@Override
	public DataGrid dataGrid(Query query) {
		// TODO Auto-generated method stub
		DataGrid<SysOrg> dg = new DataGrid<SysOrg>();
		dg.setTotal(sysOrgDao.getRecordCount(query.getQueryParams()));
		dg.setRows(sysOrgDao.queryByCondition(query));
		return dg;
	}

	@Override
	public SysOrg find(String id) {
		return sysOrgDao.find(id);
	}

	@Override
	public int insert(SysOrg vo) {

		// SequenceGenerator oid = new SequenceGenerator();
		// String [] ids = oid.generate(1);
		// vo.setSo_orgid(getMaxId());
		vo.setSo_dr(SystemConstants.SAVE + "");
		vo.setSo_ts(DateUtil.getCurrentDateToString2());
		vo.setSo_status(String.valueOf(SystemConstants.STATUS_ON));
		vo.setSo_version(new Long(SystemConstants.initVersion));
		int insert = sysOrgDao.insert(vo);

		SysUserUnity unity = new SysUserUnity();
		unity.setSuu_ub_id(vo.getSo_orgid());
		unity.setSuu_ub_name(vo.getSo_orgname());
		unity.setSuu_status(vo.getSo_status());
		unity.setSuu_ub_type(SystemConstants.USER_TYPE_ORG);// 类型为运营商
		unity.setSuu_parentsid(vo.getSo_orgparid());// 父级ID
		unity.setSuu_orgid(vo.getSo_orgid());
		unity.setSuu_ub_loginname(vo.getSo_orgcode());
		sysUserUnityService.insert(unity);
		// SystemOrgCache.getInstance().put(vo.getSo_orgid(), vo);
		return insert;
	}

	@Override
	public String[] insertBatch(SysOrg[] vos) {
		SequenceGenerator oid = new SequenceGenerator();
		String[] ids = oid.generate(vos.length);
		for (int i = 0; i < vos.length; i++) {
			vos[i].setSo_orgid(ids[i]);
			// todo
			// 增加版本号和新增时间
		}
		return sysOrgDao.insertBatch(vos);
	}

	@Override
	public int delete(String id) {
		SysOrg temp = sysOrgDao.find(id);
		temp.setSo_dr(SystemConstants.DEL + "");
		int delete = sysOrgDao.update(temp);

		SysUserUnity unity = new SysUserUnity();
		unity.setSuu_id(id);
		unity.setSuu_ub_type(SystemConstants.USER_TYPE_ORG);// 类型为运营商
		sysUserUnityService.delete(unity);

		// SystemOrgCache.getInstance().put(temp.getSo_orgid(), temp);
		return delete;
	}

	@Override
	public int deleteBatch(String[] ids) {
		// TODO Auto-generated method stub
		return sysOrgDao.deleteBatch(ids);
	}

	@Override
	public int update(SysOrg vo) {
		SysOrg tem = find(vo.getSo_orgid());
		if (tem == null || vo.getSo_version() != tem.getSo_version()) {
			throw new BusinessException("数据异常");
		}
		BeanUtils.copyProperties(vo, tem, new String[] { "so_ts,so_dr" });
		tem.setSo_version(tem.getSo_version() + 1);
		int update = sysOrgDao.update(tem);

		/*SysUserUnity unity = new SysUserUnity();
		unity.setSuu_id(vo.getSo_orgid());
		unity.setSuu_ub_name(vo.getSo_orgname());
		unity.setSuu_status(vo.getSo_status());
		unity.setSuu_ub_type(SystemConstants.USER_TYPE_ORG);// 机构
		unity.setSuu_parentsid(vo.getSo_orgparid());// 父级ID
		unity.setSuu_orgid(vo.getSo_orgid());
		unity.setSuu_ub_loginname(vo.getSo_orgcode());
		sysUserUnityService.updateSelect(unity);*/

		// SystemOrgCache.getInstance().put(tem.getSo_orgid(), tem);
		return update;
	}

	public int updateBatch(SysOrg[] vos) {
		return sysOrgDao.updateBatch(vos);
	}

	private synchronized String getMaxId() {
		String pk = sysOrgDao.findMax();
		if (pk == null || pk.length() == 0)
			return SystemConstants.ORG_FAULT_VALUE;
		else
			pk = StringUtil.formatInt(pk, 1, 8);
		return pk;
	}
}
