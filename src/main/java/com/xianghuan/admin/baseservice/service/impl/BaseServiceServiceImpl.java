package com.xianghuan.admin.baseservice.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.xianghuan.jdbc.exception.BusinessException;
import org.xianghuan.web.model.DataGrid;
import org.xianghuan.web.model.Query;

import com.xianghuan.admin.baseservice.dao.IBaseServiceDao;
import com.xianghuan.admin.baseservice.model.BaseService;
import com.xianghuan.admin.baseservice.service.IBaseServiceService;
import com.xianghuan.admin.baseservice.vo.BaseServiceVO;
/**
 * @company 社区在线
 * @author feizhang
 * @version 1.0
 * @date 
 */

@Service("baseServiceService")
public class BaseServiceServiceImpl implements IBaseServiceService {
	private static final Logger log = Logger.getLogger(BaseServiceServiceImpl.class);
	@Autowired
	private IBaseServiceDao baseServiceDao;

	
	/**
	 * 查询总记录数，带查询条件
	 * @param queryCondition  查询条件
	 * @return 总记录数
	 */
	public Integer getRecordCount(Map queryCondition){
		return baseServiceDao.getRecordCount(queryCondition);
	}
	
	/**查询列表信息
	 * @param query
	 * @return list
	 */
	public List<BaseService> select(Map queryParams) {
		return baseServiceDao.select(queryParams);
	}
	
	
	/**分页查询
	 * @param query
	 * @return
	 */
	public DataGrid dataGrid(Query query) {
		// TODO Auto-generated method stub
		DataGrid<BaseService> dg = new DataGrid<BaseService>();
		dg.setTotal(baseServiceDao.getRecordCount(query.getQueryParams()));
		dg.setRows(baseServiceDao.queryByCondition(query));
		return dg;
	}
	
	/**
	 * 插入单条记录，用id作主键，把null全替换为""
	 * @param vo 用于添加的VO对象
	 * @return 若添加成功，返回新生成的id
	 */
	public String insert(BaseService vo) {
		return baseServiceDao.insert(vo)+"";
	}

	/**
	 * 批更新插入多条记录，用id作主键，把null全替换为""
	 * @param vos 添加的VO对象数组
	 * @return 若添加成功，返回新生成的id数组
	 */
	public void insertBatch(BaseService[] vos) {
		  baseServiceDao.insertBatch(vos);
	}
	
	
	/**
	 * 删除单条记录
	 * @param id 用于删除的记录的id
	 * @return 成功删除的记录数
	 */
	public int remove(Map params) {
		// TODO Auto-generated method stub
		return baseServiceDao.remove(params);
	}

	/**
	 * 删除多条记录
	 * @param id 用于删除的记录的id
	 * @return 成功删除的记录数
	 */
	public int removeBatch(Map params) {
		// TODO Auto-generated method stub
		return baseServiceDao.removeBatch(params);
	}

	/**
	 * 删除单条记录
	 * @param id 用于删除的记录的id
	 * @return 成功删除的记录数
	 */
	public int delete(Integer id) {
		// TODO Auto-generated method stub
		return baseServiceDao.delete(id);
	}

	/**
	 * 删除多条记录
	 * @param id 用于删除的记录的id
	 * @return 成功删除的记录数
	 */
	public int deleteBatch(String[] ids) {
		// TODO Auto-generated method stub
		return baseServiceDao.deleteBatch(ids);
	}
	
	/**
	 * 根据Id进行查询
	 * @param id 用于查找的id
	 * @return 查询到的VO对象
	 */
	public BaseService find(Integer id){
		return baseServiceDao.find(id);
	}

	/**
	 * 更新单条记录
	 * @param vo 用于更新的VO对象
	 * @return 成功更新的记录数
	 */
	public int update(BaseService vo) {
		BaseService temp = find(vo.getBs_id());
		if(temp == null) {
			throw new  BusinessException("数据异常");
		}
		BeanUtils.copyProperties(vo, temp,new String[]{""});
		//todo增加版本号 
		return baseServiceDao.update(temp);
	}
	
	
	/**
	 * 更新单条记录
	 * @param vo 用于更新的VO对象
	 * @return 成功更新的记录数
	 */
	public int updateSelect(BaseService vo) {
		BaseService temp = find(vo.getBs_id());
		if(temp == null) {
			throw new  BusinessException("数据异常");
		}
		//todo增加版本号 
		return baseServiceDao.updateSelect(vo);
	}

	/**
	 * 批量更新修改多条记录
	 * @param vos 添加的VO对象数组
	 * @return 成功更新的记录数组
	 */
	public int updateBatch(BaseService[] vos) {
		return baseServiceDao.updateBatch(vos);
	}

	@Override
	public List<BaseServiceVO> getListByDistance(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return baseServiceDao.getListByDistance(map);
	}
	
}
