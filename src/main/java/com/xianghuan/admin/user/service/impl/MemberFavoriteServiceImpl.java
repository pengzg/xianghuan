package com.xianghuan.admin.user.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.xianghuan.jdbc.exception.BusinessException;
import org.xianghuan.web.model.DataGrid;
import org.xianghuan.web.model.Query;

import com.xianghuan.admin.user.dao.IMemberFavoriteDao;
import com.xianghuan.admin.user.model.MemberFavorite;
import com.xianghuan.admin.user.service.IMemberFavoriteService;
import com.xianghuan.admin.user.vo.MemberFavoriteVO;
/**
 * @company 社区在线
 * @author pengzg
 * @version 1.0
 * @date 
 */

@Service("memberFavoriteService")
public class MemberFavoriteServiceImpl implements IMemberFavoriteService {
	private static final Logger log = Logger.getLogger(MemberFavoriteServiceImpl.class);
	@Autowired
	private IMemberFavoriteDao memberFavoriteDao;

	
	/**
	 * 查询总记录数，带查询条件
	 * @param queryCondition  查询条件
	 * @return 总记录数
	 */
	public Integer getRecordCount(Map queryCondition){
		return memberFavoriteDao.getRecordCount(queryCondition);
	}
	
	/**查询列表信息
	 * @param query
	 * @return list
	 */
	public List<MemberFavorite> select(Map queryParams) {
		return memberFavoriteDao.select(queryParams);
	}
	
	
	/**分页查询
	 * @param query
	 * @return
	 */
	public DataGrid dataGrid(Query query) {
		// TODO Auto-generated method stub
		DataGrid<MemberFavoriteVO> dg = new DataGrid<MemberFavoriteVO>();
		dg.setTotal(memberFavoriteDao.getRecordCount(query.getQueryParams()));
		dg.setRows(memberFavoriteDao.queryByCondition(query));
		return dg;
	}
	
	/**
	 * 插入单条记录，用id作主键，把null全替换为""
	 * @param vo 用于添加的VO对象
	 * @return 若添加成功，返回新生成的id
	 */
	public String insert(MemberFavorite vo) {
		return memberFavoriteDao.insert(vo)+"";
	}

	/**
	 * 批更新插入多条记录，用id作主键，把null全替换为""
	 * @param vos 添加的VO对象数组
	 * @return 若添加成功，返回新生成的id数组
	 */
	public void insertBatch(MemberFavorite[] vos) {
		  memberFavoriteDao.insertBatch(vos);
	}
	
	
	/**
	 * 删除单条记录
	 * @param id 用于删除的记录的id
	 * @return 成功删除的记录数
	 */
	public int remove(Map params) {
		// TODO Auto-generated method stub
		return memberFavoriteDao.remove(params);
	}

	/**
	 * 删除多条记录
	 * @param id 用于删除的记录的id
	 * @return 成功删除的记录数
	 */
	public int removeBatch(Map params) {
		// TODO Auto-generated method stub
		return memberFavoriteDao.removeBatch(params);
	}

	/**
	 * 删除单条记录
	 * @param id 用于删除的记录的id
	 * @return 成功删除的记录数
	 */
	public int delete(Integer id) {
		// TODO Auto-generated method stub
		return memberFavoriteDao.delete(id);
	}

	/**
	 * 删除多条记录
	 * @param id 用于删除的记录的id
	 * @return 成功删除的记录数
	 */
	public int deleteBatch(String[] ids) {
		// TODO Auto-generated method stub
		return memberFavoriteDao.deleteBatch(ids);
	}
	
	/**
	 * 根据Id进行查询
	 * @param id 用于查找的id
	 * @return 查询到的VO对象
	 */
	public MemberFavorite find(Integer id){
		return memberFavoriteDao.find(id);
	}

	/**
	 * 更新单条记录
	 * @param vo 用于更新的VO对象
	 * @return 成功更新的记录数
	 */
	public int update(MemberFavorite vo) {
		MemberFavorite temp = find(vo.getMf_id());
		if(temp == null) {
			throw new  BusinessException("数据异常");
		}
		BeanUtils.copyProperties(vo, temp,new String[]{""});
		//todo增加版本号 
		return memberFavoriteDao.update(temp);
	}
	

}
