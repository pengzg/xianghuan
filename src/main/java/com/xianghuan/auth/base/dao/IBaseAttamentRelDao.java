package com.xianghuan.auth.base.dao;

import java.util.List;
import java.util.Map;

import org.xianghuan.jdbc.third.mybatis.IGenericDao;
import org.xianghuan.web.model.Query;

import com.xianghuan.auth.base.model.BaseAttamentRel;
import com.xianghuan.auth.base.vo.BaseAttachmentVO;

/**
 * @company 社区在线
 * @author feizhang
 * @version 1.0
 * @date 
 */

public interface IBaseAttamentRelDao extends IGenericDao<BaseAttamentRel, String> {
	/**
	 * 插入单条记录，用id作主键，把null全替换为""
	 * @param vo 用于添加的VO对象
	 * @return 若添加成功，返回新生成的id
	 */
	public int insert(BaseAttamentRel vo);

	/**
	 * 批更新插入多条记录，用id作主键，把null全替换为""
	 * @param vos  添加的VO对象数组
	 * @return 若添加成功，返回新生成的id数组
	 */
	public void insertBatch(BaseAttamentRel[] vos);

	/**
	 * 删除单条记录
	 * @param id 用于删除的记录的id
	 * @return 成功删除的记录数
	 */
	public int remove(Map params);

	/**
	 * 删除多条记录
	 * @param id 用于删除的记录的id
	 * @return 成功删除的记录数
	 */
	public int removeBatch(Map params);

	/**
	 * 删除单条记录
	 * @param id 用于删除的记录的id
	 * @return 成功删除的记录数
	 */
	public int delete(Integer id);

	/**
	 * 删除多条记录
	 * @param id 用于删除的记录的id
	 * @return 成功删除的记录数
	 */
	public int deleteBatch(String id[]);

	/**
	 * 更新单条记录
	 * @param vo 用于更新的VO对象
	 * @return 成功更新的记录数
	 */
	public int update(BaseAttamentRel vo);
	
	/**
	 * 更新单条记录
	 * @param vo 用于更新的VO对象
	 * @return 成功更新的记录数
	 */
	public int updateSelect(BaseAttamentRel vo);

	/**
	 * 批量更新修改多条记录
	 * @param vos 添加的VO对象数组
	 * @return 成功更新的记录数组
	 */
	public int updateBatch(BaseAttamentRel[] vos);

	/**
	 * 根据Id进行查询
	 * @param id 用于查找的id
	 * @return 查询到的VO对象
	 */
	public BaseAttamentRel find(Integer id);

	/**
	 * 查询总记录数，带查询条件
	 * @param queryCondition  查询条件
	 * @return 总记录数
	 */
	public Integer getRecordCount(Map queryCondition);

	/**
	 * 功能: 通过查询条件获得所有的VO对象列表，带翻页，带排序字符
	 * @param param包含queryCondition
	 *            查询条件, queryCondition等于null或""时查询全部，orderStr 排序字符
	 * @return 查询到的VO列表
	 */
	public List<BaseAttamentRel> queryByCondition(Query query);
	
	/**
	 * 功能: 通过查询条件获得所有的VO对象列表 
	 * @param param 包含 queryParams
	 *        查询条件, select 等于null或""时查询全部，orderStr 排序字符
	 * @return 查询到的VO列表
	 */
	public List<BaseAttamentRel> select(Map queryParams);

	public List<BaseAttachmentVO> getAttachmentList(Map<String, Object> map);
	
	
	public void removeBySource(Map<String, Object> map);
}
