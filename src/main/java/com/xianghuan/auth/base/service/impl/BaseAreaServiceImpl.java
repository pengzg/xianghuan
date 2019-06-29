package com.xianghuan.auth.base.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.xianghuan.jdbc.exception.BusinessException;
import org.xianghuan.web.model.DataGrid;
import org.xianghuan.web.model.Query;

import com.xianghuan.auth.base.model.BaseArea;
import com.xianghuan.auth.base.service.IBaseAreaService;
/**
 * @company 社区在线
 * @author feizhang
 * @version 1.0
 * @date 
 */
import com.xianghuan.auth.base.dao.IBaseAreaDao;

@Service("baseAreaService")
public class BaseAreaServiceImpl implements IBaseAreaService {
	private static final Logger log = Logger.getLogger(BaseAreaServiceImpl.class);
	@Autowired
	private IBaseAreaDao baseAreaDao;

	
	/**
	 * 查询总记录数，带查询条件
	 * @param queryCondition  查询条件
	 * @return 总记录数
	 */
	public Integer getRecordCount(Map queryCondition){
		return baseAreaDao.getRecordCount(queryCondition);
	}
	
	/**查询列表信息
	 * @param query
	 * @return list
	 */
	public List<BaseArea> select(Map queryParams) {
		return baseAreaDao.select(queryParams);
	}
	
	
	/**分页查询
	 * @param query
	 * @return
	 */
	public DataGrid dataGrid(Query query) {
		// TODO Auto-generated method stub
		DataGrid<BaseArea> dg = new DataGrid<BaseArea>();
		dg.setTotal(baseAreaDao.getRecordCount(query.getQueryParams()));
		dg.setRows(baseAreaDao.queryByCondition(query));
		return dg;
	}
	
	/**
	 * 插入单条记录，用id作主键，把null全替换为""
	 * @param vo 用于添加的VO对象
	 * @return 若添加成功，返回新生成的id
	 */
	public String insert(BaseArea vo) {
		// TODO Auto-generated method stub
//		SequenceGenerator oid = new SequenceGenerator();
//		String [] ids = oid.generate(1);
//		vo.setBa_id(ids[0]);
		//todo
		//增加版本号和新增时间
		return baseAreaDao.insert(vo)+"";
	}

	/**
	 * 批更新插入多条记录，用id作主键，把null全替换为""
	 * @param vos 添加的VO对象数组
	 * @return 若添加成功，返回新生成的id数组
	 */
	public String[] insertBatch(BaseArea[] vos) {
//		SequenceGenerator oid = new SequenceGenerator();
//		String[] ids =oid.generate(vos.length);
//		for(int i = 0; i < vos.length ; i++){
//			vos[i].setBa_id(ids[i]);
//			//todo
//			//增加版本号和新增时间
//		}
		return baseAreaDao.insertBatch(vos);
	}
	
	
	/**
	 * 删除单条记录
	 * @param id 用于删除的记录的id
	 * @return 成功删除的记录数
	 */
	public int remove(Map params) {
		// TODO Auto-generated method stub
		return baseAreaDao.remove(params);
	}

	/**
	 * 删除多条记录
	 * @param id 用于删除的记录的id
	 * @return 成功删除的记录数
	 */
	public int removeBatch(Map params) {
		// TODO Auto-generated method stub
		return baseAreaDao.removeBatch(params);
	}

	/**
	 * 删除单条记录
	 * @param id 用于删除的记录的id
	 * @return 成功删除的记录数
	 */
	public int delete(String id) {
		// TODO Auto-generated method stub
		return baseAreaDao.delete(id);
	}

	/**
	 * 删除多条记录
	 * @param id 用于删除的记录的id
	 * @return 成功删除的记录数
	 */
	public int deleteBatch(String[] ids) {
		// TODO Auto-generated method stub
		return baseAreaDao.deleteBatch(ids);
	}
	
	/**
	 * 根据Id进行查询
	 * @param id 用于查找的id
	 * @return 查询到的VO对象
	 */
	public BaseArea find(String id){
		return baseAreaDao.find(id);
	}

	/**
	 * 更新单条记录
	 * @param vo 用于更新的VO对象
	 * @return 成功更新的记录数
	 */
	public int update(BaseArea vo) {
		BaseArea temp = find(vo.getBa_id()+"");
		if(temp == null) {
			throw new  BusinessException("数据异常");
		}
		BeanUtils.copyProperties(vo, temp,new String[]{""});
		//todo增加版本号 
		return baseAreaDao.update(temp);
	}
	
	
	/**
	 * 更新单条记录
	 * @param vo 用于更新的VO对象
	 * @return 成功更新的记录数
	 */
	public int updateSelect(BaseArea vo) {
		BaseArea temp = find(vo.getBa_id()+"");
		if(temp == null) {
			throw new  BusinessException("数据异常");
		}
		//todo增加版本号 
		return baseAreaDao.updateSelect(vo);
	}

	/**
	 * 批量更新修改多条记录
	 * @param vos 添加的VO对象数组
	 * @return 成功更新的记录数组
	 */
	public int updateBatch(BaseArea[] vos) {
		return baseAreaDao.updateBatch(vos);
	}
	
}
