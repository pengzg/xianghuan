package com.xianghuan.auth.base.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.xianghuan.jdbc.exception.BusinessException;
import org.xianghuan.web.model.DataGrid;
import org.xianghuan.web.model.Query;

import com.xianghuan.auth.base.cache.BaseParameterCache;
import com.xianghuan.auth.base.dao.IBaseParameterDao;
import com.xianghuan.auth.base.model.BaseParameter;
import com.xianghuan.auth.base.service.IBaseParameterService;

@Service("baseParameterService")
public class BaseParameterServiceImpl implements IBaseParameterService {
	private static final Logger log = Logger.getLogger(BaseParameterServiceImpl.class);
	@Autowired
	private IBaseParameterDao baseParameterDao;

	
	/**
	 * 查询总记录数，带查询条件
	 * @param queryCondition  查询条件
	 * @return 总记录数
	 */
	public Integer getRecordCount(Map queryCondition){
		return baseParameterDao.getRecordCount(queryCondition);
	}
	
	/**查询列表信息
	 * @param query
	 * @return list
	 */
	public List<BaseParameter> select(Map queryParams) {
		return baseParameterDao.select(queryParams);
	}
	
	
	/**分页查询
	 * @param query
	 * @return
	 */
	public DataGrid dataGrid(Query query) {
		// TODO Auto-generated method stub
		DataGrid<BaseParameter> dg = new DataGrid<BaseParameter>();
		dg.setTotal(baseParameterDao.getRecordCount(query.getQueryParams()));
		dg.setRows(baseParameterDao.queryByCondition(query));
		return dg;
	}
	
	/**
	 * 插入单条记录，用id作主键，把null全替换为""
	 * @param vo 用于添加的VO对象
	 * @return 若添加成功，返回新生成的id
	 */
	public String insert(BaseParameter vo) {

		Map<String, Object> queryParams = new HashMap<String, Object>();
		queryParams.put("bp_key", vo.getBp_key());
		List<BaseParameter> baseParameterList = select(queryParams);
		if (baseParameterList != null && baseParameterList.size() > 0) {
			throw new BusinessException("键值已经存在，请重新输入");
		}

		String id = baseParameterDao.insert(vo) + "";
		BaseParameterCache.getInstance().put(vo.getBp_key(), vo);
		return id;
	}

	/**
	 * 批更新插入多条记录，用id作主键，把null全替换为""
	 * @param vos 添加的VO对象数组
	 * @return 若添加成功，返回新生成的id数组
	 */
	public String[] insertBatch(BaseParameter[] vos) {
		return baseParameterDao.insertBatch(vos);
	}
	
	
	/**
	 * 删除单条记录
	 * @param id 用于删除的记录的id
	 * @return 成功删除的记录数
	 */
	public int remove(Map params) {
		// TODO Auto-generated method stub
		return baseParameterDao.remove(params);
	}

	/**
	 * 删除多条记录
	 * @param id 用于删除的记录的id
	 * @return 成功删除的记录数
	 */
	public int removeBatch(Map params) {
		// TODO Auto-generated method stub
		return baseParameterDao.removeBatch(params);
	}

	/**
	 * 删除单条记录
	 * @param id 用于删除的记录的id
	 * @return 成功删除的记录数
	 */
	public int delete(Integer id) {
		// TODO Auto-generated method stub
		return baseParameterDao.delete(id);
	}

	/**
	 * 删除多条记录
	 * @param id 用于删除的记录的id
	 * @return 成功删除的记录数
	 */
	public int deleteBatch(String[] ids) {
		// TODO Auto-generated method stub
		return baseParameterDao.deleteBatch(ids);
	}
	
	/**
	 * 根据Id进行查询
	 * @param id 用于查找的id
	 * @return 查询到的VO对象
	 */
	public BaseParameter find(Integer id){
		return baseParameterDao.find(id);
	}

	/**
	 * 更新单条记录
	 * @param vo 用于更新的VO对象
	 * @return 成功更新的记录数
	 */
	public int update(BaseParameter vo) {
		BaseParameter temp = find(vo.getBp_id());
		if (temp == null) {
			throw new BusinessException("数据异常");
		}
		Map<String, Object> queryParams = new HashMap<String, Object>();
		queryParams.put("bp_key", vo.getBp_key());
		List<BaseParameter> baseParameterList = select(queryParams);
		if (baseParameterList != null && baseParameterList.size() > 0) {
			BaseParameter baseParameter = baseParameterList.get(0);
			if (baseParameter.getBp_id() != vo.getBp_id()) {
				throw new BusinessException("键值已经存在，请重新输入");
			}
		}

		// todo增加版本号
		int i = baseParameterDao.update(vo);
		BaseParameterCache.getInstance().put(vo.getBp_key(), vo);
		return i;
	}
	
	
	/**
	 * 更新单条记录
	 * @param vo 用于更新的VO对象
	 * @return 成功更新的记录数
	 */
	public int updateSelect(BaseParameter vo) {
		BaseParameter temp = find(vo.getBp_id());
		if(temp == null) {
			throw new  BusinessException("数据异常");
		}
		//todo增加版本号 
		return baseParameterDao.updateSelect(vo);
	}

	/**
	 * 批量更新修改多条记录
	 * @param vos 添加的VO对象数组
	 * @return 成功更新的记录数组
	 */
	public int updateBatch(BaseParameter[] vos) {
		return baseParameterDao.updateBatch(vos);
	}

	@Override
	public BaseParameter findByKeyCode(String key) {
		return baseParameterDao.findByKeyCode(key);
	}
	
}
