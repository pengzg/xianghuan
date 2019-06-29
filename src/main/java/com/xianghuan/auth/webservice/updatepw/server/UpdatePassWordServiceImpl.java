package com.xianghuan.auth.webservice.updatepw.server;

import javax.jws.WebService;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.xianghuan.auth.system.service.ISysUserService;
import com.xianghuan.auth.webservice.sso.util.SSODeserializatorUtil;
import com.xianghuan.auth.webservice.updatepw.common.UpdatePassWordCode;
import com.xianghuan.auth.webservice.updatepw.common.bean.UPWInfo;

@WebService(endpointInterface = "com.sqkx.auth.webservice.updatepw.server.UpdatePassWordService",targetNamespace="http://client.updatepassword.login.kl.com/")
public class UpdatePassWordServiceImpl implements UpdatePassWordService{

	
	@Autowired
	private ISysUserService sysUserService;
	
	@Override
	public String updtePassWord(String info) {
		UPWInfo wpinfo = SSODeserializatorUtil.StringToUPWOfSecurity(info);
		try{
			check(wpinfo);
			if(UPWServerConstants.CHECK_SUCCEED.equals(wpinfo.getCode())) {//参数为发现
				sysUserService.updateCurrentPassWord(wpinfo.getNewPassWord1(), wpinfo.getNewPassWord2(), wpinfo.getId());
				wpinfo.setCode(""+UpdatePassWordCode.UPDATE_SUCCESS.getCode());
				wpinfo.setMsg(UpdatePassWordCode.UPDATE_SUCCESS.getInfo());
			}
		}catch(Exception e) {
			wpinfo.setCode(""+UpdatePassWordCode.UPDATE_FAIL.getCode());
			wpinfo.setMsg(e.getMessage());
		}
		return SSODeserializatorUtil.UPWObjToStringOfSecurity(wpinfo);
	}
	public UPWInfo check(UPWInfo wpinfo) {
		if(wpinfo == null) {
			wpinfo.setCode(""+UpdatePassWordCode.CHECK_TO_OBJECT.getCode());
			wpinfo.setMsg(UpdatePassWordCode.CHECK_TO_OBJECT.getInfo());
			return wpinfo;
		}
		if(StringUtils.isBlank(wpinfo.getId()) || StringUtils.isBlank(wpinfo.getNewPassWord1()) || StringUtils.isBlank(wpinfo.getNewPassWord2())) {
			wpinfo.setCode(""+UpdatePassWordCode.CHECK_MISS_PARAMETER.getCode());
			wpinfo.setMsg(UpdatePassWordCode.CHECK_MISS_PARAMETER.getInfo());
			return wpinfo;
		}
		wpinfo.setCode(""+UpdatePassWordCode.CHECK_SUCCESS.getCode());
		wpinfo.setMsg(UpdatePassWordCode.CHECK_SUCCESS.getInfo());
		return wpinfo;
	}
}
