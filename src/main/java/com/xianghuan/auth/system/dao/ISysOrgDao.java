/*
 * Powered By [rapid-framework]
 * Web Site: http://www.rapid-framework.org.cn
 * Google Code: http://code.google.com/p/rapid-framework/
 * Since 2008 - 2014
 */

package com.xianghuan.auth.system.dao;

import java.util.List;
import java.util.Map;

import org.xianghuan.jdbc.third.mybatis.IGenericDao;
import org.xianghuan.web.model.Query;

import com.xianghuan.auth.system.model.SysOrg;

/**
 * @author xxxx
 * @version 1.0
 * @since 1.0
 */

public interface ISysOrgDao extends IGenericDao<SysOrg, String> {
	
	/**
	 * 查询列表信息
	 * @param query
	 * @return list
	 */
	@SuppressWarnings("rawtypes")
	public List<SysOrg> select(Map map);
	
	/**
	 * 插入单条记录，用id作主键，把null全替换为""
	 * 
	 * @param vo
	 *            用于添加的VO对象
	 * @return 若添加成功，返回新生成的id
	 */
	public int insert(SysOrg vo);

	/**
	 * 批更新插入多条记录，用id作主键，把null全替换为""
	 * 
	 * @param vos
	 *            添加的VO对象数组
	 * @return 若添加成功，返回新生成的id数组
	 */
	public String[] insertBatch(SysOrg[] vos);
	public void insertBatch_list(List<SysOrg> list);

	/**
	 * 删除单条记录
	 * 
	 * @param id
	 *            用于删除的记录的id
	 * @return 成功删除的记录数
	 */
	public int delete(String id);

	/**
	 * 删除多条记录
	 * 
	 * @param id
	 *            用于删除的记录的id
	 * @return 成功删除的记录数
	 */
	public int deleteBatch(String id[]);

	/**
	 * 更新单条记录
	 * 
	 * @param vo
	 *            用于更新的VO对象
	 * @return 成功更新的记录数
	 */
	public int update(SysOrg vo);

	/**
	 * 批量更新修改多条记录
	 * 
	 * @param vos
	 *            添加的VO对象数组
	 * @return 成功更新的记录数组
	 */
	public int updateBatch(SysOrg[] vos);

	/**
	 * 根据Id进行查询
	 * 
	 * @param id
	 *            用于查找的id
	 * @return 查询到的VO对象
	 */
	public SysOrg find(String id);

	/**
	 * 查询总记录数，带查询条件
	 * 
	 * @param queryCondition
	 *            查询条件
	 * @return 总记录数
	 */
	@SuppressWarnings("rawtypes")
	public Integer getRecordCount(Map queryCondition);

	/**
	 * 功能: 通过查询条件获得所有的VO对象列表，带翻页，带排序字符
	 * 
	 * @param param包含queryCondition
	 *            查询条件, queryCondition等于null或""时查询全部，orderStr 排序字符
	 * @return 查询到的VO列表
	 */
	public List<SysOrg> queryByCondition(Query query);
	
	
	public String findMax();

}
