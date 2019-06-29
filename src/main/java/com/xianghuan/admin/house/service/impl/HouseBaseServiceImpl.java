package com.xianghuan.admin.house.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.xianghuan.jdbc.exception.BusinessException;
import org.xianghuan.util.DateUtil;
import org.xianghuan.web.model.DataGrid;
import org.xianghuan.web.model.Query;

import com.xianghuan.admin.basetag.service.IBaseTagRelationService;
import com.xianghuan.admin.basetag.vo.BaseTagVO;
import com.xianghuan.admin.house.dao.IHouseBaseDao;
import com.xianghuan.admin.house.model.HouseBase;
import com.xianghuan.admin.house.service.IHouseBaseService;
import com.xianghuan.admin.house.vo.HouseBaseVO;
import com.xianghuan.auth.base.service.IBaseAttamentRelService;
import com.xianghuan.auth.base.service.IBasePicAttachmentService;
import com.xianghuan.auth.base.vo.BaseAttachmentVO;
import com.xianghuan.util.CommonConstants;
/**
 * @company 社区在线
 * @author feizhang
 * @version 1.0
 * @date 
 */

@Service("houseBaseService")
public class HouseBaseServiceImpl implements IHouseBaseService {
	private static final Logger log = Logger.getLogger(HouseBaseServiceImpl.class);
	@Autowired
	private IHouseBaseDao houseBaseDao;

	@Autowired
	private IBaseTagRelationService baseTagRelationService;
	
	@Autowired
	private IBaseAttamentRelService baseAttamentRelService;
	
	@Autowired
	private IBasePicAttachmentService basePicAttachmentService;

	
	/**
	 * 查询总记录数，带查询条件
	 * @param queryCondition  查询条件
	 * @return 总记录数
	 */
	public Integer getRecordCount(Map queryCondition){
		return houseBaseDao.getRecordCount(queryCondition);
	}
	
	/**查询列表信息
	 * @param query
	 * @return list
	 */
	public List<HouseBase> select(Map queryParams) {
		return houseBaseDao.select(queryParams);
	}
	
	
	/**分页查询
	 * @param query
	 * @return
	 */
	public DataGrid dataGrid(Query query) {
		// TODO Auto-generated method stub
		DataGrid<HouseBase> dg = new DataGrid<HouseBase>();
		dg.setTotal(houseBaseDao.getRecordCount(query.getQueryParams()));
		dg.setRows(houseBaseDao.queryByCondition(query));
		return dg;
	}
	
	/**
	 * 插入单条记录，用id作主键，把null全替换为""
	 * @param vo 用于添加的VO对象
	 * @return 若添加成功，返回新生成的id
	 */
	public String insert(HouseBase vo) {
		return houseBaseDao.insert(vo)+"";
	}

	/**
	 * 批更新插入多条记录，用id作主键，把null全替换为""
	 * @param vos 添加的VO对象数组
	 * @return 若添加成功，返回新生成的id数组
	 */
	public String[] insertBatch(HouseBase[] vos) {
		return houseBaseDao.insertBatch(vos);
	}
	
	
	/**
	 * 删除单条记录
	 * @param id 用于删除的记录的id
	 * @return 成功删除的记录数
	 */
	public int remove(Map params) {
		// TODO Auto-generated method stub
		return houseBaseDao.remove(params);
	}

	/**
	 * 删除多条记录
	 * @param id 用于删除的记录的id
	 * @return 成功删除的记录数
	 */
	public int removeBatch(Map params) {
		// TODO Auto-generated method stub
		return houseBaseDao.removeBatch(params);
	}

	/**
	 * 删除单条记录
	 * @param id 用于删除的记录的id
	 * @return 成功删除的记录数
	 */
	public int delete(Integer id) {
		// TODO Auto-generated method stub
		return houseBaseDao.delete(id);
	}

	/**
	 * 删除多条记录
	 * @param id 用于删除的记录的id
	 * @return 成功删除的记录数
	 */
	public int deleteBatch(String[] ids) {
		// TODO Auto-generated method stub
		return houseBaseDao.deleteBatch(ids);
	}
	
	/**
	 * 根据Id进行查询
	 * @param id 用于查找的id
	 * @return 查询到的VO对象
	 */
	public HouseBase find(Integer id){
		return houseBaseDao.find(id);
	}

	/**
	 * 更新单条记录
	 * @param vo 用于更新的VO对象
	 * @return 成功更新的记录数
	 */
	public int update(HouseBase vo) {
		HouseBase temp = find(vo.getHb_id());
		if(temp == null) {
			throw new  BusinessException("数据异常");
		}
		BeanUtils.copyProperties(vo, temp,new String[]{""});
		//todo增加版本号 
		return houseBaseDao.update(temp);
	}
	
	
	/**
	 * 更新单条记录
	 * @param vo 用于更新的VO对象
	 * @return 成功更新的记录数
	 */
	public int updateSelect(HouseBase vo) {
		HouseBase temp = find(vo.getHb_id());
		if(temp == null) {
			throw new  BusinessException("数据异常");
		}
		//todo增加版本号 
		return houseBaseDao.updateSelect(vo);
	}

	/**
	 * 批量更新修改多条记录
	 * @param vos 添加的VO对象数组
	 * @return 成功更新的记录数组
	 */
	public int updateBatch(HouseBase[] vos) {
		return houseBaseDao.updateBatch(vos);
	}

	/**
	 * 
	 */
	public void insertAndUpdate(HouseBaseVO vo, Integer userId) {
		// TODO Auto-generated method stub
		if (vo.getHb_id() != null) {
			
		} else {
			HouseBase hVO = new  HouseBase();
			BeanUtils.copyProperties(vo, hVO);
			hVO.setHb_userid(userId);
			hVO.setHb_addtime(DateUtil.getCurrentDateToString2());
			hVO.setHb_dr(CommonConstants.SAVE);
			hVO.setHb_posttime(DateUtil.getCurrentDateToString2());
			hVO.setHb_updatetime(DateUtil.getCurrentDateToString2());
			hVO.setHb_checkstatus(Integer.valueOf(CommonConstants.CHECK_STATUS_1));
			this.insert(hVO);
			vo.setHb_id(hVO.getHb_id());
		}
		
		if (StringUtils.isNotBlank(vo.getImgStr())) {
			baseAttamentRelService.insertData(2, vo.getHb_id()+"", vo.getImgStr());
		}
		
		if (StringUtils.isNotBlank(vo.getHb_tag_str())) {
			baseTagRelationService.insertData(2, vo.getHb_id()+"", vo.getHb_tag_str());
		}
	}

	/**
	 * 根据距离得到房源列表
	 */
	@Override
	public List<HouseBaseVO> selectHouseByDistance(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return houseBaseDao.selectHouseByDistance(map);
	}

	/**
	 * 详情
	 */
	@Override
	public HouseBaseVO getDetail(Integer houseId) {
		// TODO Auto-generated method stub
		HouseBaseVO  houseBaseVO = new HouseBaseVO();
		HouseBase vo = this.find(houseId);
		BeanUtils.copyProperties(vo, houseBaseVO);
		
		List<BaseAttachmentVO> imgList =  baseAttamentRelService.getAttachmentList("2",houseId+"");
		houseBaseVO.setImgList(imgList);
		
		List<BaseTagVO> tagList = baseTagRelationService.getTagListBySource("2",houseId+"");
		houseBaseVO.setTagList(tagList);
		return houseBaseVO;
	}
	
}
