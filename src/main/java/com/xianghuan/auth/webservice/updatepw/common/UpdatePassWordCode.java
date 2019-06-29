package com.xianghuan.auth.webservice.updatepw.common;

public enum UpdatePassWordCode {
	UPDATE_SUCCESS {
		public int getCode() {
			return 0;
		}
		public String getInfo() {
			return "修改密码成功!";
		}
		public String toString() {
			return getCode() + ":" + getInfo();
		}
	},
	UPDATE_FAIL {
		public int getCode() {
			return 1;
		}
		public String toString() {
			return getCode() + ":" + getInfo();
		}
		public String getInfo() {
			return "修改密码失败请联系管理员!";
		}
	},
	NOT_FIND_FAIL {
		public int getCode() {
			return 1;
		}
		public String toString() {
			return getCode() + ":" + getInfo();
		}
		public String getInfo() {
			return "修改密码失败,此用户不存在!";
		}
	},
	CHECK_MISS_PARAMETER {
		public int getCode() {
			return 2;
		}
		public String toString() {
			return getCode() + ":" + getInfo();
		}
		public String getInfo() {
			return "参数不全!";
		}
	},
	CHECK_TO_OBJECT {
		public int getCode() {
			return 3;
		}
		public String toString() {
			return getCode() + ":" + getInfo();
		}
		public String getInfo() {
			return "还原成对象失败!";
		}
	},
	CHECK_SUCCESS {
		public int getCode() {
			return 4;
		}
		public String toString() {
			return getCode() + ":" + getInfo();
		}
		public String getInfo() {
			return "参数未发现异常！";
		}
	};
	public String getInfo() {
		return null;
	}
	
	public int getCode() {
		return 0;
	}
}
