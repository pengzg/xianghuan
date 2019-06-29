package com.xianghuan.auth.system.service;

import java.util.List;
import java.util.Map;

import org.xianghuan.web.model.DataGrid;
import org.xianghuan.web.model.Query;

import com.xianghuan.auth.system.model.SysRole;

/**
 * @ClassName: ISysRoleService
 * @Description: 角色管理接口
 * @author shenwu
 * @date 2014年6月19日 下午12:03:58
 */
public interface ISysRoleService {
	
	/**查询列表信息
	 * @param query
	 * @return list
	 */
	@SuppressWarnings("rawtypes")
	public List<SysRole> select(Map map);
	
	/**
	 * @param vo
	 * @return list
	 */
	public List<SysRole> queryByCondition(Query query);
	
	/**
	 * @param vo
	 * @param ph
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public DataGrid dataGrid(Query query);

	/**
	 * 插入单条记录，用id作主键，把null全替换为""
	 * 
	 * @param vo
	 *            用于添加的VO对象
	 * @return 若添加成功，返回新生成的id
	 */
	public int insert(SysRole vo);

	/**
	 * 批更新插入多条记录，用id作主键，把null全替换为""
	 * 
	 * @param vos
	 *            添加的VO对象数组
	 * @return 若添加成功，返回新生成的id数组
	 */
	public String[] insertBatch(SysRole[] vos);

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
	public int deleteBatch(String[] ids1);

	/**
	 * 根据Id进行查询
	 * 
	 * @param id
	 *            用于查找的id
	 * @return 查询到的VO对象
	 */
	public SysRole find(String id);

	/**
	 * 更新单条记录
	 * 
	 * @param vo
	 *            用于更新的VO对象
	 * @return 成功更新的记录数
	 */
	public int update(SysRole vo);

	/**
	 * 批量更新修改多条记录
	 * 
	 * @param vos
	 *            添加的VO对象数组
	 * @return 成功更新的记录数组
	 */
	public int updateBatch(SysRole[] vos);

}
