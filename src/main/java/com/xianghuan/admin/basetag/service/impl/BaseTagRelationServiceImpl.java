package com.xianghuan.admin.basetag.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.aspectj.weaver.ArrayAnnotationValue;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.xianghuan.jdbc.exception.BusinessException;
import org.xianghuan.util.DateUtil;
import org.xianghuan.web.model.DataGrid;
import org.xianghuan.web.model.Query;

import com.xianghuan.admin.basetag.dao.IBaseTagRelationDao;
import com.xianghuan.admin.basetag.model.BaseTagRelation;
import com.xianghuan.admin.basetag.service.IBaseTagRelationService;
import com.xianghuan.admin.basetag.vo.BaseTagVO;
import com.xianghuan.util.CommonConstants;
/**
 * @company 社区在线
 * @author pengzg
 * @version 1.0
 * @date 
 */

@Service("baseTagRelationService")
public class BaseTagRelationServiceImpl implements IBaseTagRelationService {
	private static final Logger log = Logger.getLogger(BaseTagRelationServiceImpl.class);
	@Autowired
	private IBaseTagRelationDao baseTagRelationDao;

	
	/**
	 * 查询总记录数，带查询条件
	 * @param queryCondition  查询条件
	 * @return 总记录数
	 */
	public Integer getRecordCount(Map queryCondition){
		return baseTagRelationDao.getRecordCount(queryCondition);
	}
	
	/**查询列表信息
	 * @param query
	 * @return list
	 */
	public List<BaseTagRelation> select(Map queryParams) {
		return baseTagRelationDao.select(queryParams);
	}
	
	
	/**分页查询
	 * @param query
	 * @return
	 */
	public DataGrid dataGrid(Query query) {
		// TODO Auto-generated method stub
		DataGrid<BaseTagRelation> dg = new DataGrid<BaseTagRelation>();
		dg.setTotal(baseTagRelationDao.getRecordCount(query.getQueryParams()));
		dg.setRows(baseTagRelationDao.queryByCondition(query));
		return dg;
	}
	
	/**
	 * 插入单条记录，用id作主键，把null全替换为""
	 * @param vo 用于添加的VO对象
	 * @return 若添加成功，返回新生成的id
	 */
	public String insert(BaseTagRelation vo) {
		return baseTagRelationDao.insert(vo)+"";
	}

	/**
	 * 批更新插入多条记录，用id作主键，把null全替换为""
	 * @param vos 添加的VO对象数组
	 * @return 若添加成功，返回新生成的id数组
	 */
	public void insertBatch(BaseTagRelation[] vos) {
		  baseTagRelationDao.insertBatch(vos);
	}
	
	
	/**
	 * 删除单条记录
	 * @param id 用于删除的记录的id
	 * @return 成功删除的记录数
	 */
	public int remove(Map params) {
		// TODO Auto-generated method stub
		return baseTagRelationDao.remove(params);
	}

	/**
	 * 删除多条记录
	 * @param id 用于删除的记录的id
	 * @return 成功删除的记录数
	 */
	public int removeBatch(Map params) {
		// TODO Auto-generated method stub
		return baseTagRelationDao.removeBatch(params);
	}

	/**
	 * 删除单条记录
	 * @param id 用于删除的记录的id
	 * @return 成功删除的记录数
	 */
	public int delete(Integer id) {
		// TODO Auto-generated method stub
		return baseTagRelationDao.delete(id);
	}

	/**
	 * 删除多条记录
	 * @param id 用于删除的记录的id
	 * @return 成功删除的记录数
	 */
	public int deleteBatch(String[] ids) {
		// TODO Auto-generated method stub
		return baseTagRelationDao.deleteBatch(ids);
	}
	
	/**
	 * 根据Id进行查询
	 * @param id 用于查找的id
	 * @return 查询到的VO对象
	 */
	public BaseTagRelation find(Integer id){
		return baseTagRelationDao.find(id);
	}

	/**
	 * 更新单条记录
	 * @param vo 用于更新的VO对象
	 * @return 成功更新的记录数
	 */
	public int update(BaseTagRelation vo) {
		BaseTagRelation temp = find(vo.getBtr_id());
		if(temp == null) {
			throw new  BusinessException("数据异常");
		}
		BeanUtils.copyProperties(vo, temp,new String[]{""});
		//todo增加版本号 
		return baseTagRelationDao.update(temp);
	}
	
	
	/**
	 * 更新单条记录
	 * @param vo 用于更新的VO对象
	 * @return 成功更新的记录数
	 */
	public int updateSelect(BaseTagRelation vo) {
		BaseTagRelation temp = find(vo.getBtr_id());
		if(temp == null) {
			throw new  BusinessException("数据异常");
		}
		//todo增加版本号 
		return baseTagRelationDao.updateSelect(vo);
	}

	/**
	 * 批量更新修改多条记录
	 * @param vos 添加的VO对象数组
	 * @return 成功更新的记录数组
	 */
	public int updateBatch(BaseTagRelation[] vos) {
		return baseTagRelationDao.updateBatch(vos);
	}

	@Override
	public void insertData(int source, String sourceid, String hb_tag_str) {
		// TODO Auto-generated method stub
		String[] tag_arr = hb_tag_str.split(",");
		List<BaseTagRelation> list = new ArrayList<BaseTagRelation>();
		int num = 0;
		for (String tag_id:tag_arr) {
			BaseTagRelation vo = new BaseTagRelation();
			vo.setBtr_addtime(DateUtil.getCurrentDateToString2());
			vo.setBtr_dr(CommonConstants.SAVE);
			vo.setBtr_state(CommonConstants.STATUS_ON);
			vo.setBtr_btid(Integer.valueOf(tag_id));
			vo.setBtr_type(source);
			vo.setBtr_typeid(Integer.valueOf(sourceid));
			list.add(vo);
		}
		
		this.insertBatch(list.toArray( new BaseTagRelation[list.size()] ));
		
	}

	@Override
	public List<BaseTagVO> getTagListBySource(String type, String typeid) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("btr_type", type);
		map.put("btr_typeid", typeid);
		
		return baseTagRelationDao.getTagListBySource(map);
	}
	
}
