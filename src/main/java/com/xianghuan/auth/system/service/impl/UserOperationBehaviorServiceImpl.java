package com.xianghuan.auth.system.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.xianghuan.jdbc.generator.SequenceGenerator;
import org.xianghuan.web.model.DataGrid;
import org.xianghuan.web.model.Query;

import com.xianghuan.auth.system.dao.IUserOperationBehaviorDao;
import com.xianghuan.auth.system.model.UserOperationBehavior;
import com.xianghuan.auth.system.service.IUserOperationBehaviorService;
/**
 * @company 社区在线
 * @author feizhang
 * @version 1.0
 * @date 
 */

@Service("userOperationBehaviorService")
public class UserOperationBehaviorServiceImpl implements IUserOperationBehaviorService {
	private static final Logger log = Logger.getLogger(UserOperationBehaviorServiceImpl.class);
	@Autowired
	private IUserOperationBehaviorDao userOperationBehaviorDao;

	
	/**
	 * 查询总记录数，带查询条件
	 * @param queryCondition  查询条件
	 * @return 总记录数
	 */
	public Integer getRecordCount(Map queryCondition){
		return userOperationBehaviorDao.getRecordCount(queryCondition);
	}
	
	/**查询列表信息
	 * @param query
	 * @return list
	 */
	public List<UserOperationBehavior> select(Map queryParams) {
		return userOperationBehaviorDao.select(queryParams);
	}
	
	
	/**分页查询
	 * @param query
	 * @return
	 */
	public DataGrid dataGrid(Query query) {
		// TODO Auto-generated method stub
		DataGrid<UserOperationBehavior> dg = new DataGrid<UserOperationBehavior>();
		dg.setTotal(userOperationBehaviorDao.getRecordCount(query.getQueryParams()));
		dg.setRows(userOperationBehaviorDao.queryByCondition(query));
		return dg;
	}
	
	/**
	 * 插入单条记录，用id作主键，把null全替换为""
	 * @param vo 用于添加的VO对象
	 * @return 若添加成功，返回新生成的id
	 */
	public String insert(UserOperationBehavior vo) {
		// TODO Auto-generated method stub
		SequenceGenerator oid = new SequenceGenerator();
		String [] ids = oid.generate(1);
		vo.setUob_id(ids[0]);
		//todo
		//增加版本号和新增时间
		return userOperationBehaviorDao.insert(vo)+"";
	}

	/**
	 * 批更新插入多条记录，用id作主键，把null全替换为""
	 * @param vos 添加的VO对象数组
	 * @return 若添加成功，返回新生成的id数组
	 */
	public String[] insertBatch(UserOperationBehavior[] vos) {
		SequenceGenerator oid = new SequenceGenerator();
		String[] ids =oid.generate(vos.length);
		for(int i = 0; i < vos.length ; i++){
//			vos[i].setUob_id(ids[i]);
			//todo
			//增加版本号和新增时间
		}
		return userOperationBehaviorDao.insertBatch(vos);
	}
	
	
	/**
	 * 删除单条记录
	 * @param id 用于删除的记录的id
	 * @return 成功删除的记录数
	 */
	public int remove(Map params) {
		// TODO Auto-generated method stub
		return userOperationBehaviorDao.remove(params);
	}

	/**
	 * 删除多条记录
	 * @param id 用于删除的记录的id
	 * @return 成功删除的记录数
	 */
	public int removeBatch(Map params) {
		// TODO Auto-generated method stub
		return userOperationBehaviorDao.removeBatch(params);
	}

	/**
	 * 删除单条记录
	 * @param id 用于删除的记录的id
	 * @return 成功删除的记录数
	 */
	public int delete(String id) {
		// TODO Auto-generated method stub
		return userOperationBehaviorDao.delete(id);
	}

	/**
	 * 删除多条记录
	 * @param id 用于删除的记录的id
	 * @return 成功删除的记录数
	 */
	public int deleteBatch(String[] ids) {
		// TODO Auto-generated method stub
		return userOperationBehaviorDao.deleteBatch(ids);
	}
	
	/**
	 * 根据Id进行查询
	 * @param id 用于查找的id
	 * @return 查询到的VO对象
	 */
	public UserOperationBehavior find(String id){
		return userOperationBehaviorDao.find(id);
	}

	/**
	 * 更新单条记录
	 * @param vo 用于更新的VO对象
	 * @return 成功更新的记录数
	 */
	public int update(UserOperationBehavior vo) {
//		UserOperationBehavior temp = find(vo.getUob_id());
//		if(temp == null) {
//			throw new  BusinessException("数据异常");
//		}
//		BeanUtils.copyProperties(vo, temp,new String[]{""});
//		//todo增加版本号 
//		return userOperationBehaviorDao.update(temp);
		return 0;
	}
	
	
	/**
	 * 更新单条记录
	 * @param vo 用于更新的VO对象
	 * @return 成功更新的记录数
	 */
	public int updateSelect(UserOperationBehavior vo) {
//		UserOperationBehavior temp = find(vo.getUob_id());
//		if(temp == null) {
//			throw new  BusinessException("数据异常");
//		}
//		//todo增加版本号 
//		return userOperationBehaviorDao.updateSelect(vo);
		return 0;
	}

	/**
	 * 批量更新修改多条记录
	 * @param vos 添加的VO对象数组
	 * @return 成功更新的记录数组
	 */
	public int updateBatch(UserOperationBehavior[] vos) {
		return userOperationBehaviorDao.updateBatch(vos);
	}
	
}
