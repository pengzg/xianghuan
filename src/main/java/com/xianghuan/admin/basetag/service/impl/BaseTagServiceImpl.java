package com.xianghuan.admin.basetag.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.xianghuan.jdbc.exception.BusinessException;
import org.xianghuan.util.DateUtil;
import org.xianghuan.util.SystemConstants;
import org.xianghuan.web.model.DataGrid;
import org.xianghuan.web.model.Query;

import com.xianghuan.admin.basetag.dao.IBaseTagDao;
import com.xianghuan.admin.basetag.model.BaseTag;
import com.xianghuan.admin.basetag.service.IBaseTagService;
import com.xianghuan.admin.basetag.vo.BaseTagVO;
/**
 * @company 社区在线
 * @author pengzg
 * @version 1.0
 * @date 
 */

@Service("baseTagService")
public class BaseTagServiceImpl implements IBaseTagService {
	private static final Logger log = Logger.getLogger(BaseTagServiceImpl.class);
	@Autowired
	private IBaseTagDao baseTagDao;

	
	/**
	 * 查询总记录数，带查询条件
	 * @param queryCondition  查询条件
	 * @return 总记录数
	 */
	public Integer getRecordCount(Map queryCondition){
		return baseTagDao.getRecordCount(queryCondition);
	}
	
	/**查询列表信息
	 * @param query
	 * @return list
	 */
	public List<BaseTag> select(Map queryParams) {
		return baseTagDao.select(queryParams);
	}
	
	
	/**分页查询
	 * @param query
	 * @return
	 */
	public DataGrid dataGrid(Query query) {
		// TODO Auto-generated method stub
		DataGrid<BaseTagVO> dg = new DataGrid<BaseTagVO>();
		dg.setTotal(baseTagDao.getRecordCount(query.getQueryParams()));
		dg.setRows(baseTagDao.queryByConditionExt(query));
		return dg;
	}
	
	/**
	 * 插入单条记录，用id作主键，把null全替换为""
	 * @param vo 用于添加的VO对象
	 * @return 若添加成功，返回新生成的id
	 */
	public String insert(BaseTag vo) {
		return baseTagDao.insert(vo)+"";
	}

	/**
	 * 批更新插入多条记录，用id作主键，把null全替换为""
	 * @param vos 添加的VO对象数组
	 * @return 若添加成功，返回新生成的id数组
	 */
	public void insertBatch(BaseTag[] vos) {
		  baseTagDao.insertBatch(vos);
	}
	
	
	/**
	 * 删除单条记录
	 * @param id 用于删除的记录的id
	 * @return 成功删除的记录数
	 */
	public int remove(Map params) {
		// TODO Auto-generated method stub
		return baseTagDao.remove(params);
	}

	/**
	 * 删除多条记录
	 * @param id 用于删除的记录的id
	 * @return 成功删除的记录数
	 */
	public int removeBatch(Map params) {
		// TODO Auto-generated method stub
		return baseTagDao.removeBatch(params);
	}

	/**
	 * 删除单条记录
	 * @param id 用于删除的记录的id
	 * @return 成功删除的记录数
	 */
	public int delete(Integer id) {
		// TODO Auto-generated method stub
		return baseTagDao.delete(id);
	}

	/**
	 * 删除多条记录
	 * @param id 用于删除的记录的id
	 * @return 成功删除的记录数
	 */
	public int deleteBatch(String[] ids) {
		// TODO Auto-generated method stub
		return baseTagDao.deleteBatch(ids);
	}
	
	/**
	 * 根据Id进行查询
	 * @param id 用于查找的id
	 * @return 查询到的VO对象
	 */
	public BaseTag find(Integer id){
		return baseTagDao.find(id);
	}

	/**
	 * 更新单条记录
	 * @param vo 用于更新的VO对象
	 * @return 成功更新的记录数
	 */
	public int update(BaseTag vo) {
		BaseTag temp = find(vo.getBt_id());
		if(temp == null) {
			throw new  BusinessException("数据异常");
		}
		BeanUtils.copyProperties(vo, temp,new String[]{""});
		//todo增加版本号 
		return baseTagDao.update(temp);
	}
	
	
	/**
	 * 更新单条记录
	 * @param vo 用于更新的VO对象
	 * @return 成功更新的记录数
	 */
	public int updateSelect(BaseTag vo) {
		BaseTag temp = find(vo.getBt_id());
		if(temp == null) {
			throw new  BusinessException("数据异常");
		}
		//todo增加版本号 
		return baseTagDao.updateSelect(vo);
	}

	/**
	 * 批量更新修改多条记录
	 * @param vos 添加的VO对象数组
	 * @return 成功更新的记录数组
	 */
	public int updateBatch(BaseTag[] vos) {
		return baseTagDao.updateBatch(vos);
	}

	/**
	 * 修改或者添加一条数据
	 */
	@Override
	public void insertAndUpdate(BaseTag vo, String userId) {
		// TODO Auto-generated method stub
		if (vo.getBt_id() == null) {
			vo.setBt_addtime(DateUtil.getCurrentDateToString2());
			vo.setBt_adduserid(Integer.valueOf(userId));
			vo.setBt_status(SystemConstants.STATUS_ON+"");
			vo.setBt_dr(SystemConstants.SAVE);
			vo.setBt_updatetime(DateUtil.getCurrentDateToString2());
			this.insert(vo);
			
		} else {
			BaseTag bVO = baseTagDao.find(vo.getBt_id());
			bVO.setBt_code(vo.getBt_code());
			bVO.setBt_title(vo.getBt_title());
			bVO.setBt_type(vo.getBt_type());
			bVO.setBt_icon(vo.getBt_icon());
			bVO.setBt_is_show(vo.getBt_is_show());
			bVO.setBt_status(vo.getBt_status());
			bVO.setBt_order(vo.getBt_order());
			bVO.setBt_updatetime(DateUtil.getCurrentDateToString2());
			this.update(bVO);
		}
	}
	
}
