package com.xianghuan.auth.system.service;

import java.util.List;
import java.util.Map;

import org.xianghuan.web.model.DataGrid;
import org.xianghuan.web.model.Query;

import com.xianghuan.auth.system.model.SysUser;

/**
 * @ClassName: ISysUserService
 * @Description: 用户管理接口
 * @author shenwu
 * @date 2014年6月19日 下午12:03:31
 */
public interface ISysUserService {

	// 手机客户端注册
//	public void regUser(SysUser sysUser);
	
	@SuppressWarnings("rawtypes")
	public Integer getRecordCount(Map queryCondition);
	/**
	 * @param vo
	 * @param ph
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public DataGrid dataGrid(Query query);

	/**
	 * 插入单条记录，用id作主键，把null全替换为""
	 * @param vo
	 *            用于添加的VO对象
	 * @return 若添加成功，返回新生成的id
	 */
	public int insert(SysUser vo);

	/**
	 * 批更新插入多条记录，用id作主键，把null全替换为""
	 * @param vos
	 *            添加的VO对象数组
	 * @return 若添加成功，返回新生成的id数组
	 */
	public String[] insertBatch(SysUser[] vos);

	/**
	 * 删除单条记录
	 * @param id
	 *            用于删除的记录的id
	 * @return 成功删除的记录数
	 */
	public int delete(String id);

	/**
	 * 删除多条记录
	 * @param id
	 *            用于删除的记录的id
	 * @return 成功删除的记录数
	 */
	public int deleteBatch(String[] ids1);

	/**
	 * 根据Id进行查询
	 * @param id
	 *            用于查找的id
	 * @return 查询到的VO对象
	 */
	public SysUser find(String id);

	public SysUser login(Map<String,Object> loginInfo);
	
	/**
	 * 更新单条记录
	 * @param vo
	 *            用于更新的VO对象
	 * @return 成功更新的记录数
	 */
	public int update(SysUser vo);

	/**
	 * 批量更新修改多条记录
	 * @param vos
	 *            添加的VO对象数组
	 * @return 成功更新的记录数组
	 */
	public int updateBatch(SysUser[] vos);
	
	/**
	 * 单表条件查询
	 */
	public List<SysUser> selectByCondition(Map<String,Object> map);
	/**
	 * 
	 * @param pwd1  新密码
	 * @param pwd2 重复新密码
	 */
	public void updateCurrentPassWord(String pwd1,String pwd2,String userid);
	/**
	 * 同步用户和店铺信息
	 */
	public void insertUserAndShopData();
	
	public boolean insertSendSms(String userName,String pwd,String mobile,String url);
	SysUser login2(Map<String, Object> loginInfo);
}
