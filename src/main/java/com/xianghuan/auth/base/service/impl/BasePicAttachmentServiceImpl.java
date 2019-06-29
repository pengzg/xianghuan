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

import com.xianghuan.auth.base.dao.IBasePicAttachmentDao;
import com.xianghuan.auth.base.model.BasePicAttachment;
import com.xianghuan.auth.base.service.IBasePicAttachmentService;
/**
 * @company 社区在线
 * @author feizhang
 * @version 1.0
 * @date 
 */

@Service("basePicAttachmentService")
public class BasePicAttachmentServiceImpl implements IBasePicAttachmentService {
	private static final Logger log = Logger.getLogger(BasePicAttachmentServiceImpl.class);
	@Autowired
	private IBasePicAttachmentDao basePicAttachmentDao;

	
	/**
	 * 查询总记录数，带查询条件
	 * @param queryCondition  查询条件
	 * @return 总记录数
	 */
	public Integer getRecordCount(Map queryCondition){
		return basePicAttachmentDao.getRecordCount(queryCondition);
	}
	
	/**查询列表信息
	 * @param query
	 * @return list
	 */
	public List<BasePicAttachment> select(Map queryParams) {
		return basePicAttachmentDao.select(queryParams);
	}
	
	
	/**分页查询
	 * @param query
	 * @return
	 */
	public DataGrid dataGrid(Query query) {
		// TODO Auto-generated method stub
		DataGrid<BasePicAttachment> dg = new DataGrid<BasePicAttachment>();
		dg.setTotal(basePicAttachmentDao.getRecordCount(query.getQueryParams()));
		dg.setRows(basePicAttachmentDao.queryByCondition(query));
		return dg;
	}
	
	/**
	 * 插入单条记录，用id作主键，把null全替换为""
	 * @param vo 用于添加的VO对象
	 * @return 若添加成功，返回新生成的id
	 */
	public String insert(BasePicAttachment vo) {
		return basePicAttachmentDao.insert(vo)+"";
	}

	/**
	 * 批更新插入多条记录，用id作主键，把null全替换为""
	 * @param vos 添加的VO对象数组
	 * @return 若添加成功，返回新生成的id数组
	 */
	public void insertBatch(BasePicAttachment[] vos) {
		 basePicAttachmentDao.insertBatch(vos);
	}
	
	
	/**
	 * 删除单条记录
	 * @param id 用于删除的记录的id
	 * @return 成功删除的记录数
	 */
	public int remove(Map params) {
		// TODO Auto-generated method stub
		return basePicAttachmentDao.remove(params);
	}

	/**
	 * 删除多条记录
	 * @param id 用于删除的记录的id
	 * @return 成功删除的记录数
	 */
	public int removeBatch(Map params) {
		// TODO Auto-generated method stub
		return basePicAttachmentDao.removeBatch(params);
	}

	/**
	 * 删除单条记录
	 * @param id 用于删除的记录的id
	 * @return 成功删除的记录数
	 */
	public int delete(Integer id) {
		// TODO Auto-generated method stub
		return basePicAttachmentDao.delete(id);
	}

	/**
	 * 删除多条记录
	 * @param id 用于删除的记录的id
	 * @return 成功删除的记录数
	 */
	public int deleteBatch(String[] ids) {
		// TODO Auto-generated method stub
		return basePicAttachmentDao.deleteBatch(ids);
	}
	
	/**
	 * 根据Id进行查询
	 * @param id 用于查找的id
	 * @return 查询到的VO对象
	 */
	public BasePicAttachment find(String id){
		return basePicAttachmentDao.find(id);
	}

	/**
	 * 更新单条记录
	 * @param vo 用于更新的VO对象
	 * @return 成功更新的记录数
	 */
	public int update(BasePicAttachment vo) {
		BasePicAttachment temp = find(vo.getBpa_id());
		if(temp == null) {
			throw new  BusinessException("数据异常");
		}
		BeanUtils.copyProperties(vo, temp,new String[]{""});
		//todo增加版本号 
		return basePicAttachmentDao.update(temp);
	}
	
	
	/**
	 * 更新单条记录
	 * @param vo 用于更新的VO对象
	 * @return 成功更新的记录数
	 */
	public int updateSelect(BasePicAttachment vo) {
		BasePicAttachment temp = find(vo.getBpa_id());
		if(temp == null) {
			throw new  BusinessException("数据异常");
		}
		//todo增加版本号 
		return basePicAttachmentDao.updateSelect(vo);
	}

	/**
	 * 批量更新修改多条记录
	 * @param vos 添加的VO对象数组
	 * @return 成功更新的记录数组
	 */
	public int updateBatch(BasePicAttachment[] vos) {
		return basePicAttachmentDao.updateBatch(vos);
	}
	
}
