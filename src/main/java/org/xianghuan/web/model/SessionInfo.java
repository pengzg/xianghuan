package org.xianghuan.web.model;

import java.util.List;

/**
 * session信息模型
 * 
 * @author feizhang
 * 
 */
public class SessionInfo implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6180116621581534655L;
	
	private String id;// 用户ID（企业登录则为企业信息表的id）
	private String name;// 用户登录名
	private String logincode;
	private String ip;// 用户IP
	private String token;
	private String registerDate; // 注册时间（单点登录则为token传递时间）
	private String loginDate;   // 登录时间
	private String usertype;
	private String loginusertype; //登陆所在角色
	private String role;  // 
	private String orgid;      //当前所在机构
	private String loginorgid;  //登陆所在机构ID
	private String loginorgname; //登陆所在机构
	private String orgname;      //当前所在机构
	private String orgids;     //机构列表信息
	private String userid;
	private String communityid;//当前登陆人所在小区ID
	private String communityname;//当前登陆人所在小区名称
	private String username;
	private int count = 0;     // 登录次数（单点则为token获取次数）
	private Integer memberType;
	
	private List<String> menusList;//用户可以访问的资源地址列表
	private List<String> orgsList;//可以访问机构列表
	
	private String belongtype;
	private String belongpk;

	//用户手机号码
	private String userTel = "";
	// 用户所属店铺ID
	private Integer shopId = 0;
	//店铺地址
	private String shopAddress="";
	// 用户所属店铺名称
	private String shopName = "";
	//店铺所属商家ID
	private Integer merchantId=0;
	//店铺客服电话
	private String shopCusTel="";
	
	//b2b
	private String openid;
	private String avatar;
	private Integer centerShopId;
	private String nickname;
	
	

	public String getOpenid() {
		return openid;
	}

	public void setOpenid(String openid) {
		this.openid = openid;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public Integer getCenterShopId() {
		return centerShopId;
	}

	public void setCenterShopId(Integer centerShopId) {
		this.centerShopId = centerShopId;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return this.name;
	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public String getRegisterDate() {
		return registerDate;
	}

	public void setRegisterDate(String registerDate) {
		this.registerDate = registerDate;
	}

	public String getLoginDate() {
		return loginDate;
	}

	public void setLoginDate(String loginDate) {
		this.loginDate = loginDate;
	}


	public Integer getMemberType() {
		return memberType;
	}

	public void setMemberType(Integer memberType) {
		this.memberType = memberType;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getLogincode() {
		return logincode;
	}

	public void setLogincode(String logincode) {
		this.logincode = logincode;
	}

	public String getOrgid() {
		return orgid;
	}

	public void setOrgid(String orgid) {
		this.orgid = orgid;
	}

	public List<String> getMenusList() {
		return menusList;
	}

	public void setMenusList(List<String> menusList) {
		this.menusList = menusList;
	}

	public List<String> getOrgsList() {
		return orgsList;
	}

	public void setOrgsList(List<String> orgsList) {
		this.orgsList = orgsList;
	}

	public String getOrgids() {
		return orgids;
	}

	public void setOrgids(String orgids) {
		this.orgids = orgids;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getOrgname() {
		return orgname;
	}

	public void setOrgname(String orgname) {
		this.orgname = orgname;
	}


	public String getLoginorgid() {
		return loginorgid;
	}

	public void setLoginorgid(String loginorgid) {
		this.loginorgid = loginorgid;
	}

	public String getLoginorgname() {
		return loginorgname;
	}

	public void setLoginorgname(String loginorgname) {
		this.loginorgname = loginorgname;
	}

	public String getUsertype() {
		return usertype;
	}

	public void setUsertype(String usertype) {
		this.usertype = usertype;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getLoginusertype() {
		return loginusertype;
	}

	public void setLoginusertype(String loginusertype) {
		this.loginusertype = loginusertype;
	}

	public String getCommunityid() {
		return communityid;
	}

	public void setCommunityid(String communityid) {
		this.communityid = communityid;
	}

	public String getCommunityname() {
		return communityname;
	}

	public void setCommunityname(String communityname) {
		this.communityname = communityname;
	}

	public String getBelongtype() {
		return belongtype;
	}

	public void setBelongtype(String belongtype) {
		this.belongtype = belongtype;
	}

	public String getBelongpk() {
		return belongpk;
	}

	public void setBelongpk(String belongpk) {
		this.belongpk = belongpk;
	}

	public String getUserTel() {
		return userTel;
	}

	public void setUserTel(String userTel) {
		this.userTel = userTel;
	}

	public Integer getShopId() {
		return shopId;
	}

	public void setShopId(Integer shopId) {
		this.shopId = shopId;
	}

	public String getShopAddress() {
		return shopAddress;
	}

	public void setShopAddress(String shopAddress) {
		this.shopAddress = shopAddress;
	}

	public String getShopName() {
		return shopName;
	}

	public void setShopName(String shopName) {
		this.shopName = shopName;
	}

	public Integer getMerchantId() {
		return merchantId;
	}

	public void setMerchantId(Integer merchantId) {
		this.merchantId = merchantId;
	}

	public String getShopCusTel() {
		return shopCusTel;
	}

	public void setShopCusTel(String shopCusTel) {
		this.shopCusTel = shopCusTel;
	}

}
