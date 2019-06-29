package com.xianghuan.auth.system.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.xianghuan.jdbc.exception.BusinessException;
import org.xianghuan.web.model.DataGrid;
import org.xianghuan.web.model.Query;

import com.xianghuan.auth.system.dao.ISysSmsDao;
import com.xianghuan.auth.system.model.SysSms;
import com.xianghuan.auth.system.service.ISysSmsService;
import com.xianghuan.auth.system.vo.SysSmsVO;
/**
 * @company 社区在线
 * @author feizhang
 * @version 1.0
 * @date 
 */

@Service("sysSmsService")
public class SysSmsServiceImpl implements ISysSmsService {
	private static final Logger log = Logger.getLogger(SysSmsServiceImpl.class);
	@Autowired
	private ISysSmsDao sysSmsDao;

	
	/**
	 * 查询总记录数，带查询条件
	 * @param queryCondition  查询条件
	 * @return 总记录数
	 */
	public Integer getRecordCount(Map queryCondition){
		return sysSmsDao.getRecordCount(queryCondition);
	}
	
	/**查询列表信息
	 * @param query
	 * @return list
	 */
	public List<SysSms> select(Map queryParams) {
		return sysSmsDao.select(queryParams);
	}
	
	
	/**分页查询
	 * @param query
	 * @return
	 */
	public DataGrid dataGrid(Query query) {
		// TODO Auto-generated method stub
		DataGrid<SysSms> dg = new DataGrid<SysSms>();
		dg.setTotal(sysSmsDao.getRecordCount(query.getQueryParams()));
		dg.setRows(sysSmsDao.queryByCondition(query));
		return dg;
	}
	
	/**
	 * 插入单条记录，用id作主键，把null全替换为""
	 * @param vo 用于添加的VO对象
	 * @return 若添加成功，返回新生成的id
	 */
	public String insert(SysSms vo) {
		return sysSmsDao.insert(vo)+"";
	}

	/**
	 * 批更新插入多条记录，用id作主键，把null全替换为""
	 * @param vos 添加的VO对象数组
	 * @return 若添加成功，返回新生成的id数组
	 */
	public String[] insertBatch(SysSms[] vos) {
		return sysSmsDao.insertBatch(vos);
	}
	
	
	/**
	 * 删除单条记录
	 * @param id 用于删除的记录的id
	 * @return 成功删除的记录数
	 */
	public int remove(Map params) {
		// TODO Auto-generated method stub
		return sysSmsDao.remove(params);
	}

	/**
	 * 删除多条记录
	 * @param id 用于删除的记录的id
	 * @return 成功删除的记录数
	 */
	public int removeBatch(Map params) {
		// TODO Auto-generated method stub
		return sysSmsDao.removeBatch(params);
	}

	/**
	 * 删除单条记录
	 * @param id 用于删除的记录的id
	 * @return 成功删除的记录数
	 */
	public int delete(Integer id) {
		// TODO Auto-generated method stub
		return sysSmsDao.delete(id);
	}

	/**
	 * 删除多条记录
	 * @param id 用于删除的记录的id
	 * @return 成功删除的记录数
	 */
	public int deleteBatch(String[] ids) {
		// TODO Auto-generated method stub
		return sysSmsDao.deleteBatch(ids);
	}
	
	/**
	 * 根据Id进行查询
	 * @param id 用于查找的id
	 * @return 查询到的VO对象
	 */
	public SysSms find(Integer id){
		return sysSmsDao.find(id);
	}

	/**
	 * 更新单条记录
	 * @param vo 用于更新的VO对象
	 * @return 成功更新的记录数
	 */
	public int update(SysSms vo) {
		SysSms temp = find(vo.getSs_id());
		if(temp == null) {
			throw new  BusinessException("数据异常");
		}
		BeanUtils.copyProperties(vo, temp,new String[]{""});
		//todo增加版本号 
		return sysSmsDao.update(temp);
	}
	
	
	/**
	 * 更新单条记录
	 * @param vo 用于更新的VO对象
	 * @return 成功更新的记录数
	 */
	public int updateSelect(SysSms vo) {
		SysSms temp = find(vo.getSs_id());
		if(temp == null) {
			throw new  BusinessException("数据异常");
		}
		//todo增加版本号 
		return sysSmsDao.updateSelect(vo);
	}

	/**
	 * 批量更新修改多条记录
	 * @param vos 添加的VO对象数组
	 * @return 成功更新的记录数组
	 */
	public int updateBatch(SysSms[] vos) {
		return sysSmsDao.updateBatch(vos);
	}

	@Override
	public Boolean checkSms(SysSmsVO vo) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("ss_mobile", vo.getSs_mobile());
		map.put("ss_code", vo.getSs_code());
		map.put("ss_type", vo.getSs_type());
		List<SysSms> list = sysSmsDao.select(map);
		if (list == null || list.size()<1) {
			return false;
		} else {
			SysSms smsVO = list.get(0);
			 long a = new Date().getTime();
			 SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			 Date d = new Date();
			try {
				d = sdf.parse(smsVO.getSs_send_time());
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			 long b = d.getTime();
			  int c = (int)((a - b) / 1000);
			  if (c > 300) {
				  return false;
			  }
			
		}

		return true;
	}
	
}
