package com.xianghuan.auth.system.service.impl;

import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.xianghuan.jdbc.exception.BusinessException;
import org.xianghuan.jdbc.generator.SequenceGenerator;
import org.xianghuan.util.DateUtil;
import org.xianghuan.util.SystemConstants;
import org.xianghuan.web.model.DataGrid;
import org.xianghuan.web.model.Query;

import com.xianghuan.auth.system.dao.ISysPdlevelDao;
import com.xianghuan.auth.system.model.SysPdlevel;
import com.xianghuan.auth.system.service.ISysPdlevelService;

/**
 * 
 * @ClassName: SysPdlevelServiceImpl
 * @Description: 密码策略
 * @author shenwu
 * @date 2014年6月26日 上午11:17:38
 *
 */
@Service("sysPdlevelService")
public class SysPdlevelServiceImpl implements ISysPdlevelService {

	@Autowired
	private ISysPdlevelDao sysPdlevelDao;
	
	/**
	 * @param vo
	 * @return list
	 */
	public List<SysPdlevel> queryByCondition(Query query) {
		return sysPdlevelDao.queryByCondition(query);
	}
	
	@SuppressWarnings("rawtypes")
	@Override
	public DataGrid dataGrid(Query query) {
		// TODO Auto-generated method stub
		DataGrid<SysPdlevel> dg = new DataGrid<SysPdlevel>();
		dg.setTotal(sysPdlevelDao.getRecordCount(query.getQueryParams()));
		dg.setRows(sysPdlevelDao.queryByCondition(query));
		return dg;
	}
	
	@Override
	public SysPdlevel find(String id){
		return sysPdlevelDao.find(id);
	}

	@Override
	public int insert(SysPdlevel vo) {
		// TODO Auto-generated method stub
		SequenceGenerator oid = new SequenceGenerator();
		String [] ids = oid.generate(1);
		vo.setSp_id(ids[0]);
		vo.setSp_dr(SystemConstants.SAVE);
		vo.setSp_ts(DateUtil.getCurrentDateToString2());
		//todo
		//增加版本号和新增时间
		return sysPdlevelDao.insert(vo);
	}

	@Override
	public String[] insertBatch(SysPdlevel[] vos) {
		SequenceGenerator oid = new SequenceGenerator();
		String[] ids =oid.generate(vos.length);
		for(int i = 0; i < vos.length ; i++){
			vos[i].setSp_id(ids[i]);
			//todo
			//增加版本号和新增时间
		}
		return sysPdlevelDao.insertBatch(vos);
	}

	@Override
	public int delete(String id) {
		// TODO Auto-generated method stub
		return sysPdlevelDao.delete(id);
	}

	@Override
	public int deleteBatch(String[] ids) {
		// TODO Auto-generated method stub
		return sysPdlevelDao.deleteBatch(ids);
	}

	@Override
	public int update(SysPdlevel vo) {
		SysPdlevel tem = find(vo.getSp_id());
		if(tem == null) {
			throw new BusinessException("数据异常");
		}
		BeanUtils.copyProperties(vo, tem,new String[]{"sp_ts,sp_dr"});
		return sysPdlevelDao.update(tem);
		//todo增加版本号 
	}

	@Override
	public int updateBatch(SysPdlevel[] vos) {
		return sysPdlevelDao.updateBatch(vos);
	}
	
}
