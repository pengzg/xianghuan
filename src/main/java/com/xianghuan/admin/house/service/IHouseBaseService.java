package com.xianghuan.admin.house.service;

import java.util.List;
import java.util.Map;

import org.xianghuan.web.model.DataGrid;
import org.xianghuan.web.model.Query;

import com.xianghuan.admin.house.model.HouseBase;
import com.xianghuan.admin.house.vo.HouseBaseVO;
/**
 * @company 社区在线
 * @author feizhang
 * @version 1.0
 * @date 
 */


public interface IHouseBaseService {
	
	
	/**查询列表信息
	 * @param queryParams
	 * @return list
	 */
	public List<HouseBase> select(Map queryParams);
	
	
	/**分页查询
	 * @param query
	 * @return
	 */
	public DataGrid dataGrid(Query query);

	/**
	 * 插入单条记录，用id作主键，把null全替换为""
	 * @param vo 用于添加的VO对象
	 * @return 若添加成功，返回新生成的id
	 */
	public String insert(HouseBase vo);

	/**
	 * 批更新插入多条记录，用id作主键，把null全替换为""
	 * @param vos 添加的VO对象数组
	 * @return 若添加成功，返回新生成的id数组
	 */
	public String[] insertBatch(HouseBase[] vos);

	/**
	 * 物理删除单条记录
	 * @param id 用于删除的记录的id
	 * @return 成功删除的记录数
	 */
	public int delete(Integer id);

	/**
	 * 物理删除多条记录
	 * @param id 用于删除的记录的id
	 * @return 成功删除的记录数
	 */
	public int deleteBatch(String[] ids);
	
	
	/**
	 * 逻辑删除单条记录
	 * @param id 用于删除的记录的id
	 * @return 成功删除的记录数
	 */
	public int remove(Map params);

	/**
	 * 逻辑删除多条记录
	 * @param id 用于删除的记录的id
	 * @return 成功删除的记录数
	 */
	public int removeBatch(Map params);


	/**
	 * 根据Id进行查询
	 * @param id 用于查找的id
	 * @return 查询到的VO对象
	 */
	public HouseBase find(Integer id);

	/**
	 * 更新单条记录
	 * @param vo 用于更新的VO对象
	 * @return 成功更新的记录数
	 */
	public int update(HouseBase vo);
	
	
	/**
	 * 更新单条记录
	 * @param vo 用于更新的VO对象
	 * @return 成功更新的记录数
	 */
	public int updateSelect(HouseBase vo);
	
	
	

	/**
	 * 批量更新修改多条记录
	 * @param vos 添加的VO对象数组
	 * @return 成功更新的记录数组
	 */
	public int updateBatch(HouseBase[] vos);

	/**
	 * 
	 * @param vo
	 * @param userId
	 */
	public void insertAndUpdate(HouseBaseVO vo, Integer userId);

	
	/**
	 * 根据距离及条件得到房源列表
	 * @param map
	 * @return
	 */
	public List<HouseBaseVO> selectHouseByDistance(Map<String, Object> map);


	/**
	 * 得到房子详情
	 * @param houseId
	 * @return
	 */
	public HouseBaseVO getDetail(Integer houseId);

}
