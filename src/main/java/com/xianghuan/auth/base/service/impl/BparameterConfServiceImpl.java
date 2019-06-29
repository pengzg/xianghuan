/*
 * Powered By [rapid-framework]
 * Web Site: http://www.rapid-framework.org.cn
 * Google Code: http://code.google.com/p/rapid-framework/
 * Since 2008 - 2014
 */

package com.xianghuan.auth.base.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.xianghuan.jdbc.exception.BusinessException;
import org.xianghuan.jdbc.generator.SequenceGenerator;
import org.xianghuan.util.DateUtil;
import org.xianghuan.util.SystemConstants;
import org.xianghuan.web.model.DataGrid;
import org.xianghuan.web.model.Query;
import org.xianghuan.web.model.SessionInfo;

import com.xianghuan.auth.base.cache.BparameterConfCache;
import com.xianghuan.auth.base.dao.IBparameterConfDao;
import com.xianghuan.auth.base.model.BparameterConf;
import com.xianghuan.auth.base.service.IBparameterConfService;

@Service("bparameterConfService")
public class BparameterConfServiceImpl implements IBparameterConfService {
	private static final Logger log = Logger
			.getLogger(BparameterConfServiceImpl.class);
	@Autowired
	private IBparameterConfDao bparameterConfDao;

	/**
	 * 查询列表信息
	 * 
	 * @param query
	 * @return list
	 */
	public List<BparameterConf> select(Map queryParams) {
		return bparameterConfDao.select(queryParams);
	}

	/**
	 * 分页查询
	 * 
	 * @param query
	 * @return
	 */
	public DataGrid dataGrid(Query query) {
		// TODO Auto-generated method stub
		DataGrid<BparameterConf> dg = new DataGrid<BparameterConf>();
		dg.setTotal(bparameterConfDao.getRecordCount(query.getQueryParams()));
		dg.setRows(bparameterConfDao.queryByCondition(query));
		return dg;
	}

	/**
	 * 插入单条记录，用id作主键，把null全替换为""
	 * 
	 * @param vo
	 *            用于添加的VO对象
	 * @return 若添加成功，返回新生成的id
	 */
	public String insert(BparameterConf vo) {
		// TODO Auto-generated method stub
		Map<String, String> map = new HashMap<String, String>();
		map.put("bpc_key_code", vo.getBpc_key_code());
		map.put("bpc_dr", SystemConstants.SAVE + "");
		int count = bparameterConfDao.getRecordCount(map);
		if (count > 0) {
			throw new BusinessException("编码[" + vo.getBpc_key_code()
					+ "]存在，请重新输入！");
		}
		SequenceGenerator oid = new SequenceGenerator();
		SessionInfo sessionInfo = new SessionInfo();
		String[] ids = oid.generate(1);
		vo.setBpc_id(ids[0]);
		vo.setBpc_dr(SystemConstants.SAVE + "");
		vo.setBpc_adduser(sessionInfo.getId());
		vo.setBpc_adddate(DateUtil.getCurrentDateToString2());

		// todo
		// 增加版本号和新增时间
		String keyStr = bparameterConfDao.insert(vo) + "";
		if (vo.getBpc_status().equals(SystemConstants.STATUS_ON + "")) {
			BparameterConfCache.getInstance().put(vo.getBpc_key_code(), vo);
		}
		return keyStr;
	}

	/**
	 * 批更新插入多条记录，用id作主键，把null全替换为""
	 * 
	 * @param vos
	 *            添加的VO对象数组
	 * @return 若添加成功，返回新生成的id数组
	 */
	public String[] insertBatch(BparameterConf[] vos) {
		SequenceGenerator oid = new SequenceGenerator();
		String[] ids = oid.generate(vos.length);
		for (int i = 0; i < vos.length; i++) {
			vos[i].setBpc_id(ids[i]);
			// todo
			// 增加版本号和新增时间
		}
		return bparameterConfDao.insertBatch(vos);
	}

	/**
	 * 删除单条记录
	 * 
	 * @param id
	 *            用于删除的记录的id
	 * @return 成功删除的记录数
	 */
	public int remove(Map params) {
		// TODO Auto-generated method stub
		int count = bparameterConfDao.remove(params);
		// 清除缓存
		String bpc_id = (String) params.get("bpc_id");
		BparameterConf b = find(bpc_id);
		if (null != b) {
			BparameterConfCache.getInstance().remove(b.getBpc_key_code());
		}
		return count;
	}

	/**
	 * 删除多条记录
	 * 
	 * @param id
	 *            用于删除的记录的id
	 * @return 成功删除的记录数
	 */
	public int removeBatch(Map params) {
		// TODO Auto-generated method stub
		return bparameterConfDao.removeBatch(params);
	}

	/**
	 * 删除单条记录
	 * 
	 * @param id
	 *            用于删除的记录的id
	 * @return 成功删除的记录数
	 */
	public int delete(String id) {
		// TODO Auto-generated method stub
		return bparameterConfDao.delete(id);
	}

	/**
	 * 删除多条记录
	 * 
	 * @param id
	 *            用于删除的记录的id
	 * @return 成功删除的记录数
	 */
	public int deleteBatch(String[] ids) {
		// TODO Auto-generated method stub
		return bparameterConfDao.deleteBatch(ids);
	}

	/**
	 * 根据Id进行查询
	 * 
	 * @param id
	 *            用于查找的id
	 * @return 查询到的VO对象
	 */
	public BparameterConf find(String id) {
		return bparameterConfDao.find(id);
	}

	/**
	 * 根据key_code进行查询
	 * 
	 * @param id
	 *            用于查找的id
	 * @return 查询到的VO对象
	 */
	public BparameterConf findByKeyCode(String key_code) {
		return bparameterConfDao.findByKeyCode(key_code);
	}

	/**
	 * 更新单条记录
	 * 
	 * @param vo
	 *            用于更新的VO对象
	 * @return 成功更新的记录数
	 */
	public int update(BparameterConf vo) {
		BparameterConf temp = find(vo.getBpc_id());
		if (temp == null) {
			throw new BusinessException("数据异常");
		}

		Map<String, String> map = new HashMap<String, String>();
		map.put("bpc_key_code", vo.getBpc_key_code());
		map.put("bpc_dr", SystemConstants.SAVE + "");
		map.put("bpc_id_check", vo.getBpc_id());
		int count = bparameterConfDao.getRecordCount(map);

		if (count > 0) {
			throw new BusinessException("编码[" + vo.getBpc_key_code()
					+ "]存在，请重新输入！");
		}

		BeanUtils.copyProperties(vo, temp, new String[] { "bpc_adduser",
				"bpc_adddate" });
		// todo增加版本号
		bparameterConfDao.update(temp);
		// 更新缓存
		if (vo.getBpc_status().equals(SystemConstants.STATUS_ON + "")) {
			BparameterConfCache.getInstance().put(vo.getBpc_key_code(), vo);
		}
		return count;
	}

	/**
	 * 更新单条记录
	 * 
	 * @param vo
	 *            用于更新的VO对象
	 * @return 成功更新的记录数
	 */
	public int updateSelect(BparameterConf vo) {
		BparameterConf temp = find(vo.getBpc_id());
		if (temp == null) {
			throw new BusinessException("数据异常");
		}
		// todo增加版本号
		return bparameterConfDao.updateSelect(vo);
	}

	/**
	 * 批量更新修改多条记录
	 * 
	 * @param vos
	 *            添加的VO对象数组
	 * @return 成功更新的记录数组
	 */
	public int updateBatch(BparameterConf[] vos) {
		return bparameterConfDao.updateBatch(vos);
	}

}
