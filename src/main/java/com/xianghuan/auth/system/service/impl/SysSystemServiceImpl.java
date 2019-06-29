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
import org.xianghuan.web.model.SessionInfo;
import org.xianghuan.web.util.UserSessionUtil;

import com.xianghuan.auth.system.dao.ISysSystemDao;
import com.xianghuan.auth.system.model.SysSystem;
import com.xianghuan.auth.system.service.ISysSystemService;

/**
 * 
 * @ClassName: SysSystemServiceImpl
 * @Description: 系统管理
 * @author shenwu
 * @date 2014年6月30日 下午1:30:43
 *
 */
@Service("sysSystemService")
public class SysSystemServiceImpl implements ISysSystemService {
	
	@SuppressWarnings("unused")
	private static final Logger log = Logger.getLogger(SysSystemServiceImpl.class);
	@Autowired
	private ISysSystemDao sysSystemDao;

	/**查询列表信息
	 * @param query
	 * @return list
	 */
	public List<SysSystem> queryByCondition(Query query) {
		return sysSystemDao.queryByCondition(query);
	}
	
	/**查询列表信息
	 * @param query
	 * @return list
	 */
	@SuppressWarnings("rawtypes")
	public List<SysSystem> select(Map queryParams) {
		return sysSystemDao.select(queryParams);
	}
	
	/**分页查询
	 * @param query
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public DataGrid dataGrid(Query query) {
		// TODO Auto-generated method stub
		DataGrid<SysSystem> dg = new DataGrid<SysSystem>();
		dg.setTotal(sysSystemDao.getRecordCount(query.getQueryParams()));
		dg.setRows(sysSystemDao.queryByCondition(query));
		return dg;
	}
	
	/**
	 * 插入单条记录，用id作主键，把null全替换为""
	 * @param vo 用于添加的VO对象
	 * @return 若添加成功，返回新生成的id
	 */
	public String insert(SysSystem vo) {
		// TODO Auto-generated method stub
		SequenceGenerator oid = new SequenceGenerator();
		String[] ids = oid.generate(1);
		vo.setSs_id(ids[0]);
		vo.setSs_version(SystemConstants.initVersion);
		vo.setSs_adddate(DateUtil.getCurrentDateToString2());
		vo.setSs_ts(DateUtil.getCurrentDateToString2());
		vo.setSs_dr(SystemConstants.SAVE);
		SessionInfo session = UserSessionUtil.getSession();
		if(session != null) {
			vo.setSs_adduser(session.getId());
		}
		return sysSystemDao.insert(vo) + "";
	}

	/**
	 * 批更新插入多条记录，用id作主键，把null全替换为""
	 * @param vos 添加的VO对象数组
	 * @return 若添加成功，返回新生成的id数组
	 */
	public String[] insertBatch(SysSystem[] vos) {
		SequenceGenerator oid = new SequenceGenerator();
		String[] ids =oid.generate(vos.length);
		for(int i = 0; i < vos.length ; i++){
			vos[i].setSs_id(ids[i]);
			//todo
			//增加版本号和新增时间
		}
		return sysSystemDao.insertBatch(vos);
	}

	/**
	 * 删除单条记录
	 * @param id 用于删除的记录的id
	 * @return 成功删除的记录数
	 */
	public int delete(String id) {
		SysSystem ss = find(id);
		SessionInfo session = UserSessionUtil.getSession();
		if(session != null) {
			ss.setSs_deleteuser(session.getId());
		}
		ss.setSs_deletedate(DateUtil.getCurrentDateToString2());
		ss.setSs_dr(SystemConstants.DEL);
		return sysSystemDao.update(ss);
	}

	/**
	 * 删除多条记录
	 * @param id 用于删除的记录的id
	 * @return 成功删除的记录数
	 */
	public int deleteBatch(String[] ids) {
		// TODO Auto-generated method stub
		return sysSystemDao.deleteBatch(ids);
	}
	
	/**
	 * 根据Id进行查询
	 * @param id 用于查找的id
	 * @return 查询到的VO对象
	 */
	public SysSystem find(String id){
		return sysSystemDao.find(id);
	}

	/**
	 * 更新单条记录
	 * @param vo 用于更新的VO对象
	 * @return 成功更新的记录数
	 */
	@SuppressWarnings("null")
	public int update(SysSystem vo) {
		SysSystem temp = find(vo.getSs_id());
		if(temp == null && temp.getSs_version() != vo.getSs_version()) {
			throw new  BusinessException("数据异常");
		}
		BeanUtils.copyProperties(vo, temp,new String[]{""});
		SessionInfo session = UserSessionUtil.getSession();
		if(session != null) {
			temp.setSs_modifyuser(session.getId());
		}
		temp.setSs_modifydate(DateUtil.getCurrentDateToString2());
		temp.setSs_version(temp.getSs_version()+1);
		return sysSystemDao.update(temp);
	}

	/**
	 * 批量更新修改多条记录
	 * @param vos 添加的VO对象数组
	 * @return 成功更新的记录数组
	 */
	public int updateBatch(SysSystem[] vos) {
		return sysSystemDao.updateBatch(vos);
	}
	
}
