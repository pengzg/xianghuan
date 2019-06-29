package com.xianghuan.auth.system.service;

import java.util.List;
import java.util.Map;

import org.xianghuan.web.model.DataGrid;
import org.xianghuan.web.model.Query;

import com.xianghuan.auth.system.model.SysOrg;
import com.xianghuan.auth.system.model.SysUserOrg;

/**
 * 
 * @ClassName: ISysUserOrgService
 * @Description: 用户机构
 * @author shenwu
 * @date 2014年6月26日 下午1:10:11
 *
 */
public interface ISysUserOrgService {
	

	/**查询列表信息
	 * @param query
	 * @return list
	 */
	public List<SysUserOrg> queryByCondition(Query query);
	
	/**
	 * 查询列表信息
	 * @param queryParams
	 * @return list
	 */
	public List<SysOrg> select(@SuppressWarnings("rawtypes") Map queryParams);
	
	
	/**分页查询
	 * @param query
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public DataGrid dataGrid(Query query);

	/**
	 * 插入单条记录，用id作主键，把null全替换为""
	 * @param vo 用于添加的VO对象
	 * @return 若添加成功，返回新生成的id
	 */
	public String insert(SysUserOrg vo);

	/**
	 * 批更新插入多条记录，用id作主键，把null全替换为""
	 * @param vos 添加的VO对象数组
	 * @return 若添加成功，返回新生成的id数组
	 */
	public void insertBatch(String ids, String id);

	/**
	 * 删除单条记录
	 * @param id 用于删除的记录的id
	 * @return 成功删除的记录数
	 */
	public int delete(String id);

	/**
	 * 删除多条记录
	 * @param id 用于删除的记录的id
	 * @return 成功删除的记录数
	 */
	public int deleteBatch(String[] ids);

	/**
	 * 根据Id进行查询
	 * @param id 用于查找的id
	 * @return 查询到的VO对象
	 */
	public SysUserOrg find(String id);

	/**
	 * 更新单条记录
	 * @param vo 用于更新的VO对象
	 * @return 成功更新的记录数
	 */
	public int update(SysUserOrg vo);

	/**
	 * 批量更新修改多条记录
	 * @param vos 添加的VO对象数组
	 * @return 成功更新的记录数组
	 */
	public int updateBatch(SysUserOrg[] vos);
	

}
