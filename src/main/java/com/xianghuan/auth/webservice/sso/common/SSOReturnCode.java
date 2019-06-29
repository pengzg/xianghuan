package com.xianghuan.auth.webservice.sso.common;

/**
 * hhh
 * 
 * SSO返回对照枚举类
 * 
 */
public enum SSOReturnCode {

	LOGIN_SUCCESS {
		public int getCode() {
			return 0;
		}
		public String getInfo() {
			return "登陆成功";
		}
		public String toString() {
			return getCode() + ":" + getInfo();
		}
	},
	
	LOGIN_FAIL_MISS_PARAMETER {
		public int getCode() {
			return -1;
		}
		public String toString() {
			return getCode() + ":" + getInfo();
		}
		public String getInfo() {
			return "登陆失败,用户名或密码不能为空";
		}
	},
	
	LOGIN_FAIL {
		public int getCode() {
			return -3;
		}
		public String toString() {
			return getCode() + ":" + getInfo();
		}
		public String getInfo() {
			return "登陆失败";
		}
	},
	
	CONNECTION_FAIL {
		public int getCode() {
			return 500;
		}
		public String toString() {
			return getCode() + ":" + getInfo();
		}
		public String getInfo() {
			return "连接失败";
		}
	},
	
	ACCOUNT_ISLOGIN{
		public int getCode() {
			return -5;
		}
		public String toString() {
			return getCode() + ":" + getInfo();
		}
		public String getInfo() {
			return "账号已经登陆";
		}
	},
	
	CHECK_IN_SUCCESS {
		public int getCode() {
			return 0;
		}
		public String getInfo() {
			return "签入成功";
		}
		public String toString() {
			return getCode() + ":" + getInfo();
		}
	},
	
	CHECK_IN_FAIL {
		public int getCode() {
			return -1;
		}
		public String toString() {
			return getCode() + ":" + getInfo();
		}
		public String getInfo() {
			return "签入失败";
		}
	},
	
	LOGOUT_SUCCESS {
		public int getCode() {
			return 0;
		}
		public String getInfo() {
			return "退出成功";
		}
		public String toString() {
			return getCode() + ":" + getInfo();
		}
	},
	
	LOGOUT_FAIL {
		public int getCode() {
			return -1;
		}
		public String toString() {
			return getCode() + ":" + getInfo();
		}
		public String getInfo() {
			return "退出失败";
		}
	};

	public String getInfo() {
		return null;
	}
	
	public int getCode() {
		return 0;
	}
	
}
