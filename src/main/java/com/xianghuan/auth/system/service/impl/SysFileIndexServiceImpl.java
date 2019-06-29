/*
 * Powered By [rapid-framework]
 * Web Site: http://www.rapid-framework.org.cn
 * Google Code: http://code.google.com/p/rapid-framework/
 * Since 2008 - 2014
 */

package com.xianghuan.auth.system.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.xianghuan.jdbc.exception.BusinessException;
import org.xianghuan.jdbc.generator.SequenceGenerator;
import org.xianghuan.util.DateUtil;
import org.xianghuan.web.model.DataGrid;
import org.xianghuan.web.model.Query;
import org.xianghuan.web.model.SessionInfo;
import org.xianghuan.web.util.UserSessionUtil;

import com.xianghuan.auth.system.dao.ISysFileIndexDao;
import com.xianghuan.auth.system.model.SysFileIndex;
import com.xianghuan.auth.system.model.SysUserUnity;
import com.xianghuan.auth.system.service.ISysFileIndexService;
import com.xianghuan.auth.system.service.ISysUserUnityService;
import com.xianghuan.util.CommonConstants;

@Service("sysFileIndexService")
public class SysFileIndexServiceImpl implements ISysFileIndexService {
	private static final Logger log = Logger.getLogger(SysFileIndexServiceImpl.class);
	@Autowired
	private ISysFileIndexDao sysFileIndexDao;
	@Autowired
	private ISysUserUnityService sysUserUnityService;

	
	/**查询列表信息
	 * @param query
	 * @return list
	 */
	public List<SysFileIndex> select(Map queryParams) {
		return sysFileIndexDao.select(queryParams);
	}
	
	
	/**分页查询
	 * @param query
	 * @return
	 */
	public DataGrid dataGrid(Query query) {
		//添加查询未删除的条件
		Map<String, Object> map = query.getQueryParams();
		map.put("sfi_dr", String.valueOf(CommonConstants.SAVE+""));
		query.setQueryParams(map);
		DataGrid<SysFileIndex> dg = new DataGrid<SysFileIndex>();
		dg.setTotal(sysFileIndexDao.getRecordCount(query.getQueryParams()));
		dg.setRows(sysFileIndexDao.queryByCondition(query));
		return dg;
	}
	
	/**
	 * 插入单条记录，用id作主键，把null全替换为""
	 * @param vo 用于添加的VO对象
	 * @return 若添加成功，返回新生成的id
	 */
	public String insert(SysFileIndex vo) {
		SequenceGenerator oid = new SequenceGenerator();
		String [] ids = oid.generate(1);
		vo.setSfi_id(ids[0]);
		
		vo.setSfi_dr(String.valueOf(CommonConstants.SAVE));
		String nowStr = DateUtil.getCurrentDateToString2();
		vo.setSfi_ts(nowStr);
		
		Map<String, Object> queryParams = new HashMap<String, Object>();
		queryParams.put("suu_ub_id", vo.getSfi_user_id());
		List<SysUserUnity> suuList = sysUserUnityService.select(queryParams);
		if(suuList!=null&&suuList.size()>0){
			vo.setSfi_orgid(suuList.get(0).getSuu_orgid());
		}
		String sfi_save_url = vo.getSfi_save_url();
		if(!StringUtils.isNotBlank(sfi_save_url)){
			throw new BusinessException("请先上传图片文件");
		}
		
		vo.setSfi_filetype(sfi_save_url.substring(sfi_save_url.lastIndexOf(".")+1, sfi_save_url.length()));
		vo.setSfi_filename(sfi_save_url.substring(sfi_save_url.lastIndexOf("/")+1, sfi_save_url.length()));
		
		SessionInfo sessionInfo = UserSessionUtil.getSession();
		if(sessionInfo != null) {
			//都为null？
			vo.setSfi_adduser(sessionInfo.getId());
		}
		vo.setSfi_adddate(nowStr);
		
		//todo
		//增加版本号和新增时间
		vo.setSfi_version(new Long(CommonConstants.initVersion));
		return sysFileIndexDao.insert(vo)+"";
	}

	/**
	 * 批更新插入多条记录，用id作主键，把null全替换为""
	 * @param vos 添加的VO对象数组
	 * @return 若添加成功，返回新生成的id数组
	 */
	public String[] insertBatch(SysFileIndex[] vos) {
		SequenceGenerator oid = new SequenceGenerator();
		String[] ids =oid.generate(vos.length);
		for(int i = 0; i < vos.length ; i++){
			vos[i].setSfi_id(ids[i]);
			//todo
			//增加版本号和新增时间
		}
		return sysFileIndexDao.insertBatch(vos);
	}

	/**
	 * 删除单条记录
	 * @param id 用于删除的记录的id
	 * @return 成功删除的记录数
	 */
	public int delete(String id) {
		SessionInfo sessionInfo = UserSessionUtil.getSession();
		/*if(sessionInfo!=null&&!sessionInfo.getUsertype().equals(SystemConstantsExt.user_super))
			throw new BusinessException("只有超级管理员才有权限进行操作！");*/
		SysFileIndex temp = find(id);
		if(temp == null) {
			throw new  BusinessException("数据异常");
		}
		String nowStr = DateUtil.getCurrentDateToString2();
		temp.setSfi_deleteuser(sessionInfo.getId());
		temp.setSfi_deletedate(nowStr);
		temp.setSfi_dr(String.valueOf(CommonConstants.DEL));
		temp.setSfi_ts(nowStr);
		return sysFileIndexDao.update(temp);
	}

	/**
	 * 删除多条记录
	 * @param id 用于删除的记录的id
	 * @return 成功删除的记录数
	 */
	public int deleteBatch(String[] ids) {
		// TODO Auto-generated method stub
		return sysFileIndexDao.deleteBatch(ids);
	}
	
	/**
	 * 根据Id进行查询
	 * @param id 用于查找的id
	 * @return 查询到的VO对象
	 */
	public SysFileIndex find(String id){
		return sysFileIndexDao.find(id);
	}

	/**
	 * 更新单条记录
	 * @param vo 用于更新的VO对象
	 * @return 成功更新的记录数
	 */
	public int update(SysFileIndex vo) {
		SessionInfo sessionInfo = UserSessionUtil.getSession();
		/*if(sessionInfo!=null&&!sessionInfo.getUsertype().equals(SystemConstantsExt.user_super))
			throw new BusinessException("只有超级管理员才有权限进行操作！");*/
		SysFileIndex temp = find(vo.getSfi_id());
		if(temp == null) {
			throw new  BusinessException("数据异常");
		}
		BeanUtils.copyProperties(vo, temp,new String[]{"sfi_version"});

		temp.setSfi_dr(String.valueOf(CommonConstants.SAVE));
		String nowStr = DateUtil.getCurrentDateToString2();
		temp.setSfi_ts(nowStr);
		temp.setSfi_modifydate(nowStr);
		temp.setSfi_modifyuser(sessionInfo.getId());
		
		String sfi_save_url = vo.getSfi_save_url();
		temp.setSfi_filetype(sfi_save_url.substring(sfi_save_url.lastIndexOf(".")+1, sfi_save_url.length()));
		temp.setSfi_filename(sfi_save_url.substring(sfi_save_url.lastIndexOf("/")+1, sfi_save_url.length()));
		
		//todo增加版本号 
		if(vo.getSfi_version()!=temp.getSfi_version()){
			throw new BusinessException("数据已被修改");
		}
		temp.setSfi_version(temp.getSfi_version()+1);
		return sysFileIndexDao.update(temp);
	}
	
	
	/**
	 * 更新单条记录
	 * @param vo 用于更新的VO对象
	 * @return 成功更新的记录数
	 */
	public int updateSelect(SysFileIndex vo) {
		SysFileIndex temp = find(vo.getSfi_id());
		if(temp == null) {
			throw new  BusinessException("数据异常");
		}
		//todo增加版本号 
		return sysFileIndexDao.updateSelect(vo);
	}

	/**
	 * 批量更新修改多条记录
	 * @param vos 添加的VO对象数组
	 * @return 成功更新的记录数组
	 */
	public int updateBatch(SysFileIndex[] vos) {
		return sysFileIndexDao.updateBatch(vos);
	}
	
}
