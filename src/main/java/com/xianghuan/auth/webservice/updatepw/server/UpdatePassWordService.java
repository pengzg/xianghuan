package com.xianghuan.auth.webservice.updatepw.server;

import javax.jws.WebService;

@WebService
public interface UpdatePassWordService {
	
	public String updtePassWord(String UPWInfo);
}
