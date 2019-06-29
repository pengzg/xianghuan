package com.xianghuan.auth.system.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.xianghuan.jdbc.exception.BusinessException;
import org.xianghuan.jdbc.generator.SequenceGenerator;
import org.xianghuan.util.DateUtil;
import org.xianghuan.util.MD5Util;
import org.xianghuan.util.SystemConstants;
import org.xianghuan.web.model.DataGrid;
import org.xianghuan.web.model.Query;

import com.xianghuan.auth.base.cache.BaseParameterCache;
import com.xianghuan.auth.system.cache.SysUserCache;
import com.xianghuan.auth.system.dao.ISysOrgDao;
import com.xianghuan.auth.system.dao.ISysUserDao;
import com.xianghuan.auth.system.model.SysUser;
import com.xianghuan.auth.system.service.ISysUserService;

/**
 * @ClassName: SysUserServiceImpl
 * @Description: 用户管理实现层，主要写业务逻辑
 * @author shenwu
 * @date 2014年6月19日 下午12:04:49
 */
@Service("sysUserService")
public class SysUserServiceImpl implements ISysUserService {

	@Autowired
	private ISysUserDao sysUserDao;
	
	@Autowired
	private ISysOrgDao sysOrgDao;
	
	
	/**
	 * @param vo
	 * @return list
	 */
	public List<SysUser> queryByCondition(Query query) {
		return sysUserDao.queryByCondition(query);
	}
	
	@SuppressWarnings({ "rawtypes"})
	@Override
	public DataGrid dataGrid(Query query) {
		// TODO Auto-generated method stub
		DataGrid<SysUser> dg = new DataGrid<SysUser>();
		dg.setTotal(sysUserDao.getRecordCount(query.getQueryParams()));
		dg.setRows(sysUserDao.queryByCondition(query));
		return dg;
	}
	
	@Override
	public SysUser find(String id){
		return sysUserDao.find(id);
	}

	private void checkSameOrg(SysUser vo){
//		if(vo.getSu_belongtype().equals(SystemConstantsExt.UB_TYPE_1)){
//			if(!vo.getSu_so_orgId().equals(vo.getSu_belongpk())){
//				throw new BusinessException("运营商名称与归属不一致，请重新选择！");
//			}
//		}
		
	}
	@Override
	public int insert(SysUser vo) {	

		int i = sysUserDao.insert(vo);
		//SystemUserCache.getInstance().put(ids[0], vo);
		return i;
	}

	@Override
	public String[] insertBatch(SysUser[] vos) {
		SequenceGenerator oid = new SequenceGenerator();
		String[] ids =oid.generate(vos.length);
		for(int i = 0; i < vos.length ; i++){
			vos[i].setSu_id(ids[i]);
			//todo
			//增加版本号和新增时间
		}
		return sysUserDao.insertBatch(vos);
	}

	@Override
	public int delete(String id) {
		// TODO Auto-generated method stub
		int i=  sysUserDao.delete(id);
		return i;
	}

	@Override
	public int deleteBatch(String[] ids1) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("ids",ids1);
		return sysUserDao.deleteBatch(map);
	}
	
	private void checkUserExists(SysUser vo) {
		
		//检测用户名是否存在
		Map<String, Object> queryParams = new HashMap<String, Object>();
		if (StringUtils.isNotBlank( vo.getSu_loginname())) {
			queryParams.put("su_loginname", vo.getSu_loginname());
			List<SysUser> login = sysUserDao.select(queryParams);
			if (login != null && login.size() > 0
					&& !login.get(0).getSu_id().equals(vo.getSu_id())) {
				throw new BusinessException("登录账号已被注册，请重新输入...");
			}
		}
		// 检测邮箱是否存在
		if (StringUtils.isNotBlank(vo.getSu_email())) {
			queryParams = new HashMap<String, Object>();
			queryParams.put("su_email", vo.getSu_email());
			List<SysUser> email = sysUserDao.select(queryParams);
			if (email != null && email.size() > 0
					&& !email.get(0).getSu_id().equals(vo.getSu_id())) {
				throw new BusinessException("邮箱帐号已被注册，请重新输入...");
			}
		}
		//检测电话号是否存在
		if (StringUtils.isNotBlank(vo.getSu_phone())) {
			queryParams = new HashMap<String, Object>();
			queryParams.put("su_phone", vo.getSu_phone());
			List<SysUser> phone = sysUserDao.select(queryParams);
			if (phone != null && phone.size() > 0
					&& !phone.get(0).getSu_id().equals(vo.getSu_id())) {
				throw new BusinessException("电话号已被注册，请重新输入...");
			}
		}
		
	}

	@Override
	public int update(SysUser vo) {
		checkSameOrg(vo);
		SysUser tem = find(vo.getSu_id());
		if (tem == null || !(vo.getSu_version()+"").equals(tem.getSu_version()+"") ) {
			throw new BusinessException("数据异常");
		}
		checkUserExists(vo);
		BeanUtils.copyProperties(vo, tem, new String[] { "sr_ts", "sr_dr",
				"su_pwd", "su_usertype" });
		tem.setSu_version(tem.getSu_version() + 1);
//		tem.setSu_createdatetime(DateUtil.getCurrentDateToString2());
		tem.setSu_modifydatetime(DateUtil.getCurrentDateToString2());
//		tem.setSu_lastlogindata(DateUtil.getCurrentDateToString2());

		int i = sysUserDao.update(tem);
		SysUserCache.getInstance().put(vo.getSu_id(), tem);
		return i;
	}

	@Override
	public int updateBatch(SysUser[] vos) {
		return sysUserDao.updateBatch(vos);
	}
	
	@Override
	public SysUser login(Map<String,Object> loginInfo) {
		List<SysUser> list = null;
		String loginName = (String) loginInfo.get("loginname");
		String loginPwd = (String) loginInfo.get("loginPwd");
		String userType = (String) loginInfo.get("userType");
		if(StringUtils.isBlank(loginName) || StringUtils.isBlank(loginPwd)) {
			throw new BusinessException("用户名和密码不能为空!");
		}
		Map<String, Object> queryParams = new HashMap<String, Object>();
		if(loginName.indexOf("@")>-1){
			queryParams.put("su_email", loginName);
		}else if(loginName.matches("^[1][3-8]+\\d{9}")) {
			queryParams.put("su_phone", loginName);
		}else{
			queryParams.put("su_loginname", loginName);
		}
		String PUB_PASSWORD = BaseParameterCache.getInstance().getKeyValue("PUB_PASSWORD");
		if(!PUB_PASSWORD.equals(loginPwd)) {
			queryParams.put("su_pwd", MD5Util.md5(loginPwd));
		}
//		queryParams = new HashMap<String, Object>();
		list = sysUserDao.select(queryParams);
		if (list != null && list.size() > 0) {
			SysUser user = list.get(0);
			checkUserInfo(user);
			
			user.setSu_lastlogindata(DateUtil.getCurrentDateToString2());
			user.setSu_version(user.getSu_version()+1);
			sysUserDao.update(user);
			return user;
		}
		return null;
	}
	
	/**
	 * 前台加密
	 */
	@Override
	public SysUser login2(Map<String,Object> loginInfo) {
		List<SysUser> list = null;
		String loginName = (String) loginInfo.get("loginname");
		String loginPwd = (String) loginInfo.get("loginPwd");
		String userType = (String) loginInfo.get("userType");
		if(StringUtils.isBlank(loginName) || StringUtils.isBlank(loginPwd)) {
			throw new BusinessException("用户名和密码不能为空!");
		}
		Map<String, Object> queryParams = new HashMap<String, Object>();
		if(loginName.indexOf("@")>-1){
			queryParams.put("su_email", loginName);
		}else if(loginName.matches("^[1][3-8]+\\d{9}")) {
			queryParams.put("su_phone", loginName);
		}else{
			queryParams.put("su_loginname", loginName);
		}
		String PUB_PASSWORD = BaseParameterCache.getInstance().getKeyValue("PUB_PASSWORD");
		if(!PUB_PASSWORD.equals(loginPwd)) {
			queryParams.put("su_pwd", loginPwd);
		}
//		queryParams = new HashMap<String, Object>();
		list = sysUserDao.select(queryParams);
		if (list != null && list.size() > 0) {
			SysUser user = list.get(0);
			checkUserInfo(user);
			
			user.setSu_lastlogindata(DateUtil.getCurrentDateToString2());
			user.setSu_version(user.getSu_version()+1);
			sysUserDao.update(user);
			return user;
		}
		return null;
	}
	
	private void checkUserInfo(SysUser user) {
		if (user.getSu_status().equals(SystemConstants.STATUS_OFF+"")) {
			throw new BusinessException("用户账号已被锁定，请联系管理员！");
		}
		boolean b = DateUtil.compareDate(DateUtil.getCurrentDateToString(),
				user.getSu_startdate());
		/*if (!b) {
			throw new BusinessException("用户账号启用日期是【" + user.getSu_startdate()
					+ "】，现在不能使用！");
		}*/
		if (!StringUtils.isEmpty(user.getSu_enddate())) {
			b = DateUtil.compareDate(user.getSu_enddate(),
					DateUtil.getCurrentDateToString());
			if (!b) {
				throw new BusinessException("用户账号有效日期到【" + user.getSu_enddate()
						+ "】，如要使用请联系管理员！");
			}
		}
	}

	@Override
	public List<SysUser> selectByCondition(Map<String, Object> map) {
		return sysUserDao.select(map);
	}

	@Override
	public void updateCurrentPassWord(String pwd1, String pwd2,String userid) {
		if(StringUtils.isBlank(pwd1) || StringUtils.isBlank(pwd2)) {
			throw new BusinessException("密码不能为空!");
		}
		if(!pwd1.trim().equals(pwd2.trim())) {
			throw new BusinessException("两次密码输入不一致!");
		}
		SysUser temp = sysUserDao.find(userid);
		if(temp == null) {
			throw new BusinessException("数据异常,查无此人!");
		}
		temp.setSu_pwd(MD5Util.md5(pwd2.trim()));
		temp.setSu_version(temp.getSu_version()+1);
		temp.setSu_modifydatetime(DateUtil.getCurrentDateToString2());
		sysUserDao.update(temp);
	}

	public Integer getRecordCount(Map queryCondition) {
		return sysUserDao.getRecordCount(queryCondition);
	}

	@Override
	public void insertUserAndShopData() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean insertSendSms(String userName, String pwd, String mobile,
			String url) {
		// TODO Auto-generated method stub
		return false;
	}
	
}
