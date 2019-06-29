package com.xianghuan.auth.base.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
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

import com.xianghuan.auth.base.dao.IBaseAttamentRelDao;
import com.xianghuan.auth.base.model.BaseAttamentRel;
import com.xianghuan.auth.base.model.BasePicAttachment;
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

@Service("baseAttamentRelService")
public class BaseAttamentRelServiceImpl implements IBaseAttamentRelService {
	private static final Logger log = Logger.getLogger(BaseAttamentRelServiceImpl.class);
	@Autowired
	private IBaseAttamentRelDao baseAttamentRelDao;

	@Autowired
	private IBasePicAttachmentService basePicAttachmentService;
	
	/**
	 * 查询总记录数，带查询条件
	 * @param queryCondition  查询条件
	 * @return 总记录数
	 */
	public Integer getRecordCount(Map queryCondition){
		return baseAttamentRelDao.getRecordCount(queryCondition);
	}
	
	/**查询列表信息
	 * @param query
	 * @return list
	 */
	public List<BaseAttamentRel> select(Map queryParams) {
		return baseAttamentRelDao.select(queryParams);
	}
	
	
	/**分页查询
	 * @param query
	 * @return
	 */
	public DataGrid dataGrid(Query query) {
		// TODO Auto-generated method stub
		DataGrid<BaseAttamentRel> dg = new DataGrid<BaseAttamentRel>();
		dg.setTotal(baseAttamentRelDao.getRecordCount(query.getQueryParams()));
		dg.setRows(baseAttamentRelDao.queryByCondition(query));
		return dg;
	}
	
	/**
	 * 插入单条记录，用id作主键，把null全替换为""
	 * @param vo 用于添加的VO对象
	 * @return 若添加成功，返回新生成的id
	 */
	public String insert(BaseAttamentRel vo) {
		return baseAttamentRelDao.insert(vo)+"";
	}

	/**
	 * 批更新插入多条记录，用id作主键，把null全替换为""
	 * @param vos 添加的VO对象数组
	 * @return 若添加成功，返回新生成的id数组
	 */
	public void insertBatch(BaseAttamentRel[] vos) {
		 baseAttamentRelDao.insertBatch(vos);
	}
	
	
	/**
	 * 删除单条记录
	 * @param id 用于删除的记录的id
	 * @return 成功删除的记录数
	 */
	public int remove(Map params) {
		// TODO Auto-generated method stub
		return baseAttamentRelDao.remove(params);
	}

	/**
	 * 删除多条记录
	 * @param id 用于删除的记录的id
	 * @return 成功删除的记录数
	 */
	public int removeBatch(Map params) {
		// TODO Auto-generated method stub
		return baseAttamentRelDao.removeBatch(params);
	}

	/**
	 * 删除单条记录
	 * @param id 用于删除的记录的id
	 * @return 成功删除的记录数
	 */
	public int delete(Integer id) {
		// TODO Auto-generated method stub
		return baseAttamentRelDao.delete(id);
	}

	/**
	 * 删除多条记录
	 * @param id 用于删除的记录的id
	 * @return 成功删除的记录数
	 */
	public int deleteBatch(String[] ids) {
		// TODO Auto-generated method stub
		return baseAttamentRelDao.deleteBatch(ids);
	}
	
	/**
	 * 根据Id进行查询
	 * @param id 用于查找的id
	 * @return 查询到的VO对象
	 */
	public BaseAttamentRel find(String id){
		return baseAttamentRelDao.find(id);
	}

	/**
	 * 更新单条记录
	 * @param vo 用于更新的VO对象
	 * @return 成功更新的记录数
	 */
	public int update(BaseAttamentRel vo) {
		BaseAttamentRel temp = find(vo.getBar_id());
		if(temp == null) {
			throw new  BusinessException("数据异常");
		}
		BeanUtils.copyProperties(vo, temp,new String[]{""});
		//todo增加版本号 
		return baseAttamentRelDao.update(temp);
	}
	
	
	/**
	 * 更新单条记录
	 * @param vo 用于更新的VO对象
	 * @return 成功更新的记录数
	 */
	public int updateSelect(BaseAttamentRel vo) {
		BaseAttamentRel temp = find(vo.getBar_id());
		if(temp == null) {
			throw new  BusinessException("数据异常");
		}
		//todo增加版本号 
		return baseAttamentRelDao.updateSelect(vo);
	}

	/**
	 * 批量更新修改多条记录
	 * @param vos 添加的VO对象数组
	 * @return 成功更新的记录数组
	 */
	public int updateBatch(BaseAttamentRel[] vos) {
		return baseAttamentRelDao.updateBatch(vos);
	}

	@Override
	public void insertData(Integer source, String sourceid, String imgStr) {
		// TODO Auto-generated method stub
		if (StringUtils.isNotBlank(imgStr)) {
			String[] imgList = imgStr.split(",");
			List<BasePicAttachment> picList = new ArrayList<BasePicAttachment>();
			List<BaseAttamentRel> attList = new ArrayList<BaseAttamentRel>();
			int num = 0;
			for (String imgPath:imgList) {
				if (StringUtils.isNotBlank(imgPath)) {
		            // 插入图片表
		            BasePicAttachment basePicAttachment = new BasePicAttachment();
		            basePicAttachment.setBpa_path(imgPath);
		            basePicAttachment.setBpa_id(DateUtil.getCurrentDateToString5()+sourceid+num);
		            basePicAttachment.setBpa_dr(CommonConstants.SAVE+"");
		            basePicAttachment.setBpa_type(1);
		            basePicAttachment.setBpa_status(CommonConstants.STATUS_ON);
		            basePicAttachment.setBpa_add_time(DateUtil.getCurrentDateToString2());
		            picList.add(basePicAttachment);
		            // basePicAttachmentService.insert(basePicAttachment);
		            log.info("图片表插入");
		            // 插入图片关联表
		            BaseAttamentRel baseAttamentRel = new BaseAttamentRel();
		            baseAttamentRel.setBar_id(DateUtil.getCurrentDateToString5()+sourceid+num);
		            baseAttamentRel.setBar_attament_id(basePicAttachment.getBpa_id());
		            baseAttamentRel.setBar_source(source);
		            baseAttamentRel.setBar_source_id(sourceid);
		            baseAttamentRel.setBar_dr(CommonConstants.SAVE);
		            baseAttamentRel.setBar_add_time(DateUtil.getCurrentDateToString2());
		            baseAttamentRel.setBar_status(CommonConstants.STATUS_ON);
		            attList.add(baseAttamentRel);
		            log.info("关联表插入");
		            num++;
				}
			}

			basePicAttachmentService.insertBatch(picList.toArray(new BasePicAttachment[picList.size()]));
			// 插入关联表
			
			this.insertBatch(attList.toArray(new BaseAttamentRel[attList.size()]));
		}
	}

	@Override
	public List<BaseAttachmentVO> getAttachmentList(String source, String sourceid) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("bar_source", source);
		map.put("bar_source_id", sourceid);
		return baseAttamentRelDao.getAttachmentList(map);
	}

	@Override
	public void removeBySource(String source, String sourceid) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("bar_source", source);
		map.put("bar_source_id", sourceid);
		baseAttamentRelDao.removeBySource(map);
	}
	
}
