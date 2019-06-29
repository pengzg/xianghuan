/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : box

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2015-11-05 09:42:25
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `base_parameter_conf`
-- ----------------------------
DROP TABLE IF EXISTS `base_parameter_conf`;
CREATE TABLE `base_parameter_conf` (
  `bpc_id` varchar(50) NOT NULL DEFAULT '' COMMENT '主键',
  `bpc_key_code` varchar(100) DEFAULT NULL,
  `bpc_value` varchar(100) DEFAULT NULL,
  `bpc_remark` varchar(250) DEFAULT NULL,
  `bpc_orgid` varchar(100) DEFAULT NULL,
  `bpc_status` varchar(1) DEFAULT NULL,
  `bpc_dr` varchar(40) DEFAULT NULL,
  `bpc_version` decimal(10,0) DEFAULT NULL,
  `bpc_adduser` varchar(50) DEFAULT NULL,
  `bpc_adddate` varchar(19) DEFAULT NULL,
  `bpc_modifyuser` varchar(50) DEFAULT NULL,
  `bpc_modifydate` varchar(19) DEFAULT NULL,
  `Bpc_DELETEUSER` varchar(50) DEFAULT NULL,
  `Bpc_DELETEDATE` varchar(19) DEFAULT NULL,
  PRIMARY KEY (`bpc_id`),
  UNIQUE KEY `PK_BN_ID` (`bpc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of base_parameter_conf
-- ----------------------------
INSERT INTO `base_parameter_conf` VALUES ('0040601009', '1004', '您好!您所订购货物已送达{0}号柜,取货箱号:{1},开箱验证码为:{2},请及时提取,祝您购物愉快!', '短信模板', null, '1', '1', null, null, '2015-08-28 15:40:05', null, null, null, null);
INSERT INTO `base_parameter_conf` VALUES ('100269011036', '1003', '1003', '商家角色编码', null, '1', '1', null, null, '2015-01-31 16:22:38', null, null, null, null);
INSERT INTO `base_parameter_conf` VALUES ('1400200018', '1002', '1002', '物业角色编码', null, '1', '1', null, null, '2015-01-31 15:29:33', '100402116118', '2015-01-31 16:22:16', null, null);
INSERT INTO `base_parameter_conf` VALUES ('140020009', '1001', '值班', '11111111', null, '1', '1', null, null, '2015-01-31 15:29:17', '100402116118', '2015-01-31 15:39:39', null, null);
INSERT INTO `base_parameter_conf` VALUES ('14004402440', '1004', '1005', '分配自提柜的角色编码', null, '1', '0', null, null, '2015-08-27 16:14:25', null, null, null, null);

-- ----------------------------
-- Table structure for `sys_action_log`
-- ----------------------------
DROP TABLE IF EXISTS `sys_action_log`;
CREATE TABLE `sys_action_log` (
  `SAL_ID` varchar(20) DEFAULT NULL,
  `SAL_CREATID` varchar(40) DEFAULT NULL,
  `SAL_CREATENAME` varchar(50) DEFAULT NULL,
  `SAL_ACTIONNAME` text,
  `SAL_ACTIONTYPE` varchar(50) DEFAULT NULL,
  `SAL_ACTIONTIME` varchar(19) DEFAULT NULL,
  `SAL_OWNERID` varchar(30) DEFAULT NULL,
  `SAL_IP` varchar(30) DEFAULT NULL,
  `SAL_PLATTYPE` varchar(50) DEFAULT NULL,
  `SAL_DESC` text,
  `SAL_TS` varchar(19) DEFAULT NULL,
  `SAL_DR` decimal(2,0) DEFAULT NULL,
  `SAL_TYPE` varchar(1) DEFAULT NULL,
  UNIQUE KEY `SYS_C0035315` (`SAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_action_log
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_black_list_ip`
-- ----------------------------
DROP TABLE IF EXISTS `sys_black_list_ip`;
CREATE TABLE `sys_black_list_ip` (
  `SBLI_ID` varchar(20) DEFAULT NULL,
  `SBLI_IPADD` varchar(15) DEFAULT NULL,
  `SBLI_RES` text,
  `SBLI_DR` decimal(2,0) DEFAULT NULL,
  `SBL_ADDUSER` varchar(40) DEFAULT NULL,
  `SBL_ADDDATE` varchar(19) DEFAULT NULL,
  `SBL_MODIFYUSER` varchar(40) DEFAULT NULL,
  `SBL_MODIFYDATE` varchar(19) DEFAULT NULL,
  `SBL_DELETEUSER` varchar(40) DEFAULT NULL,
  `SBL_DELETEDATE` varchar(19) DEFAULT NULL,
  `SBL_TS` varchar(19) DEFAULT NULL,
  `SBL_VERSION` decimal(11,0) DEFAULT NULL,
  UNIQUE KEY `SYS_C0035317` (`SBLI_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_black_list_ip
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_file_index`
-- ----------------------------
DROP TABLE IF EXISTS `sys_file_index`;
CREATE TABLE `sys_file_index` (
  `SFI_ID` varchar(36) DEFAULT NULL,
  `SFI_USER_ID` varchar(36) DEFAULT NULL,
  `SFI_ORGID` varchar(6) DEFAULT NULL,
  `SFI_DR` varchar(1) DEFAULT NULL,
  `SFI_TS` varchar(19) DEFAULT NULL,
  `SFI_TYPE` varchar(4) DEFAULT NULL,
  `SFI_SAVE_URL` text,
  `SFI_SORT` decimal(2,0) DEFAULT NULL,
  `SFI_STATUS` varchar(2) DEFAULT NULL,
  `SFI_VERSION` decimal(10,0) DEFAULT NULL,
  `SFI_ADDUSER` varchar(50) DEFAULT NULL,
  `SFI_ADDDATE` varchar(19) DEFAULT NULL,
  `SFI_MODIFYUSER` varchar(50) DEFAULT NULL,
  `SFI_MODIFYDATE` varchar(19) DEFAULT NULL,
  `SFI_DELETEUSER` varchar(50) DEFAULT NULL,
  `SFI_DELETEDATE` varchar(19) DEFAULT NULL,
  `SFI_FILETYPE` varchar(20) DEFAULT NULL,
  `SFI_FILENAME` varchar(128) DEFAULT NULL,
  UNIQUE KEY `PK_SFI_ID` (`SFI_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_file_index
-- ----------------------------
INSERT INTO `sys_file_index` VALUES ('1410202124641', '000003300012411444834438416273444433', '000003', '1', '2014-11-06 10:52:04', '1', '/attached/merchant/image/2014/11/06/46ad8dfb6f944758bb2c7b979bfeb557.jpg', '1', '1', '1', '000003110002341221478827435471646786', '2014-11-06 10:52:04', null, null, null, null, 'jpg', '46ad8dfb6f944758bb2c7b979bfeb557.jpg');
INSERT INTO `sys_file_index` VALUES ('1410220532653', '000003101402002015478104862283477450', null, '1', '2014-11-06 16:12:12', '1', '/attached/merchant/image/2014/11/06/68bd7f287e8a4e299ef97134082c3a9f.jpg', '1', '1', '1', '000003110002341221478827435471646786', '2014-11-06 16:12:12', null, null, null, null, 'jpg', '68bd7f287e8a4e299ef97134082c3a9f.jpg');
INSERT INTO `sys_file_index` VALUES ('141020212228', '000003300003003122606241372832067362', '000003', '1', '2014-11-05 12:08:54', '1', '/attached/merchant/image/2014/10/31/b4e00a636024464fa3409313c3002d17.jpg', '2', '1', '2', '1006100403', '2014-10-31 16:15:22', '1006100403', '2014-11-05 12:08:54', null, null, 'jpg', 'b4e00a636024464fa3409313c3002d17.jpg');
INSERT INTO `sys_file_index` VALUES ('1410000173660', '000005304104100302071306721514250627', '000005', '1', '2014-11-20 10:36:13', '1', '/attached/merchant/image/2014/11/20/4c022e4340f84311b1fcd6bcc6d6bab7.png', '1', '1', '1', '000005114100016400333344633313847117', '2014-11-20 10:36:13', null, null, null, null, 'png', '4c022e4340f84311b1fcd6bcc6d6bab7.png');
INSERT INTO `sys_file_index` VALUES ('1410020417270', '000003300003003122606241372832067362', '000003', '1', '2014-11-05 12:08:21', '1', '/attached/merchant/image/2014/11/05/e026db22a3f84570858486b81bfeecd0.jpg', '1', '1', '2', '1006100403', '2014-11-05 12:06:57', '1006100403', '2014-11-05 12:08:21', null, null, 'jpg', 'e026db22a3f84570858486b81bfeecd0.jpg');

-- ----------------------------
-- Table structure for `sys_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `SM_ID` varchar(40) NOT NULL DEFAULT '',
  `SM_NAME` varchar(50) DEFAULT NULL,
  `SM_URL` varchar(200) DEFAULT NULL,
  `SM_PID` varchar(40) DEFAULT NULL,
  `SM_ICONCLS` varchar(100) DEFAULT NULL,
  `SM_DESCRIPTION` text,
  `SM_TYPEID` varchar(40) DEFAULT NULL,
  `SM_SEQ` decimal(5,0) DEFAULT NULL,
  `SM_TARGET` varchar(50) DEFAULT NULL,
  `SM_SYSTEMID` varchar(40) DEFAULT NULL,
  `SM_STATUS` varchar(2) DEFAULT NULL,
  `SM_TS` varchar(19) DEFAULT NULL,
  `SM_DR` varchar(1) DEFAULT NULL,
  `SM_ADDUSER` varchar(40) DEFAULT NULL,
  `SM_ADDDATE` varchar(19) DEFAULT NULL,
  `SM_MODIFYUSER` varchar(40) DEFAULT NULL,
  `SM_MODIFYDATE` varchar(19) DEFAULT NULL,
  `SM_DELETEUSER` varchar(40) DEFAULT NULL,
  `SM_DELETEDATE` varchar(19) DEFAULT NULL,
  `SM_VERSION` decimal(3,0) DEFAULT NULL,
  PRIMARY KEY (`SM_ID`),
  UNIQUE KEY `SYS_C0035330` (`SM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('10000024027', 'DEMO', null, 'system_1001', null, null, '1', '10', null, '1001', '1', '2015-01-08 13:55:41', '1', null, '2015-01-08 13:55:41', null, '2015-01-08 13:55:41', null, null, '1');
INSERT INTO `sys_menu` VALUES ('10000024033', 'UE', '/jslib/ueditor1_4_3-utf8-jsp/index.html', '10000024027', null, null, '1', '1', null, '1001', '1', '2015-01-08 13:56:29', '1', null, '2015-01-08 13:56:29', null, '2015-01-08 13:56:29', null, null, '1');
INSERT INTO `sys_menu` VALUES ('14004001019', '参数配置', '/base/bparameterConfControl/listPage.htm', 'system_priv_1001', 'ext-icon-asterisk_yellow', null, '1', '89', null, '1001', '1', '2015-01-31 15:19:23', '1', null, '2015-01-31 15:19:23', null, '2015-01-31 15:19:23', null, null, '1');
INSERT INTO `sys_menu` VALUES ('system_1001', '系统管理', null, null, 'ext-icon-anchor', null, '1', '100', null, '1001', '1', '2014-07-23 10:19:12', '1', null, null, null, null, null, null, '5');
INSERT INTO `sys_menu` VALUES ('system_conf_1001', '配置管理', null, 'system_1001', null, null, '1', '2', null, '1001', '1', '2014-07-10 18:04:31', '1', null, '2014-07-10 18:04:31', null, '2014-07-10 18:04:31', null, null, '1');
INSERT INTO `sys_menu` VALUES ('system_conf_datatype_1001', '字典类型', '/base/baseDatatypeControl/listPage', 'system_conf_1001', null, null, '1', '11', null, '1001', '1', null, '1', null, null, null, null, null, null, '1');
INSERT INTO `sys_menu` VALUES ('system_conf_data_1001', '字典管理', '/base/baseDataControl/listPage', 'system_conf_1001', null, null, '1', '8', null, '1001', '1', null, '1', null, null, null, null, null, null, '2');
INSERT INTO `sys_menu` VALUES ('system_priv_1001', '权限管理', null, 'system_1001', null, null, '1', '2', null, '1001', '1', '2014-12-27 18:06:37', '1', null, '2014-12-27 18:06:37', null, '2014-12-27 18:06:37', null, null, '1');
INSERT INTO `sys_menu` VALUES ('system_priv_log_1001', '日志管理', '/system/sysActionLogControl/listPage.htm', 'system_priv_1001', null, null, '1', '18', null, '1001', '1', null, '1', null, null, null, null, null, null, '1');
INSERT INTO `sys_menu` VALUES ('system_priv_menu_1001', '菜单管理', '/system/sysMenuControl/listPage.htm', 'system_priv_1001', null, null, '1', '12', null, '1001', '1', null, '1', null, null, null, null, null, null, '1');
INSERT INTO `sys_menu` VALUES ('system_priv_org_1001', '运营商管理', '/system/sysOrgControl/listPage.htm', 'system_priv_1001', 'ext-icon-bullet_wrench', null, '1', '0', null, '1001', '1', null, '1', null, null, null, null, null, null, '1');
INSERT INTO `sys_menu` VALUES ('system_priv_role_1001', '角色管理', '/system/sysRoleControl/listPage.htm', 'system_priv_1001', null, null, '1', '2', null, '1001', '1', null, '1', null, null, null, null, null, null, '1');
INSERT INTO `sys_menu` VALUES ('system_priv_system_1001', '系统配置', '/system/sysSystemControl/listPage', 'system_priv_1001', null, null, '1', '99', null, '1001', '1', null, '1', null, null, null, null, null, null, '3');
INSERT INTO `sys_menu` VALUES ('system_priv_user_1001', '用户管理', '/system/sysUserControl/listPage.htm', 'system_priv_1001', null, null, '1', '1', null, '1001', '1', null, '1', null, null, null, null, null, null, '1');

-- ----------------------------
-- Table structure for `sys_menu_type`
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu_type`;
CREATE TABLE `sys_menu_type` (
  `SMT_ID` varchar(40) DEFAULT NULL,
  `SMT_NAME` varchar(50) DEFAULT NULL,
  `SMT_DR` decimal(2,0) DEFAULT NULL,
  `SMT_TS` varchar(19) DEFAULT NULL,
  UNIQUE KEY `SYS_C0035332` (`SMT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_menu_type
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_org`
-- ----------------------------
DROP TABLE IF EXISTS `sys_org`;
CREATE TABLE `sys_org` (
  `SO_ORGID` varchar(40) NOT NULL DEFAULT '',
  `SO_ORGCODE` varchar(50) DEFAULT NULL,
  `SO_ORGNAME` text,
  `SO_CONTACTNAME` varchar(50) DEFAULT NULL,
  `SO_CONTACTPHONE` varchar(30) DEFAULT NULL,
  `SO_FAX` varchar(50) DEFAULT NULL,
  `SO_ORGADDS` text,
  `SO_ORGPARID` varchar(30) DEFAULT NULL,
  `SO_ORGPIC` varchar(50) DEFAULT NULL,
  `SO_STATUS` varchar(2) DEFAULT NULL,
  `SO_VERSION` decimal(10,0) DEFAULT NULL,
  `SO_TS` varchar(19) DEFAULT NULL,
  `SO_DR` varchar(1) DEFAULT NULL,
  `SO_BPA_ID` varchar(36) DEFAULT NULL,
  `SO_ME_LIMIT` decimal(10,0) DEFAULT '0',
  `SO_PER_LIMIT` decimal(10,0) DEFAULT '0',
  `SO_AGENT_LEVEL_LIMIT` decimal(4,0) DEFAULT '0',
  `SO_ID_EXT` varchar(40) DEFAULT NULL,
  `SO_CODE_EXT` varchar(40) DEFAULT NULL,
  `SO_NAME_EXT` varchar(150) DEFAULT NULL,
  `SO_TYPE` varchar(2) DEFAULT NULL,
  `SO_BRAND` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`SO_ORGID`),
  UNIQUE KEY `SYS_C0035334` (`SO_ORGID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_org
-- ----------------------------
INSERT INTO `sys_org` VALUES ('00000001', '10001', '社区快线', null, null, null, null, null, null, '1', '5', null, '1', null, null, null, null, null, null, null, '11', '01');
INSERT INTO `sys_org` VALUES ('00000002', '10002', '社区快线运营部', '张飞', '15801403629', '0', '0', '00000001', null, '1', '5', '2014-12-27 18:19:15', '1', null, null, null, null, null, null, null, '0', '01');

-- ----------------------------
-- Table structure for `sys_pdlevel`
-- ----------------------------
DROP TABLE IF EXISTS `sys_pdlevel`;
CREATE TABLE `sys_pdlevel` (
  `SP_ID` varchar(40) DEFAULT NULL,
  `SP_NAME` varchar(50) DEFAULT NULL,
  `SP_PDFZD` varchar(100) DEFAULT NULL,
  `SP_PDJGTIMES` decimal(5,0) DEFAULT NULL,
  `SP_PDUPTIMES` varchar(50) DEFAULT NULL,
  `SP_STATUS` varchar(2) DEFAULT NULL,
  `SP_TS` varchar(19) DEFAULT NULL,
  `SP_DR` varchar(1) DEFAULT NULL,
  UNIQUE KEY `SYS_C0035336` (`SP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_pdlevel
-- ----------------------------
INSERT INTO `sys_pdlevel` VALUES ('1008824010361', '22', '111', '2', '1', '1', '2014-08-25 19:08:10', '1');

-- ----------------------------
-- Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `SR_ID` varchar(40) NOT NULL DEFAULT '',
  `SR_NAME` varchar(50) DEFAULT NULL,
  `SR_ORDER` decimal(5,0) DEFAULT NULL,
  `SR_DESC` varchar(200) DEFAULT NULL,
  `SR_PID` varchar(40) DEFAULT NULL,
  `SR_STATUS` varchar(2) DEFAULT NULL,
  `SR_VERSION` decimal(5,0) DEFAULT NULL,
  `SR_DR` varchar(1) DEFAULT NULL,
  `SR_TS` varchar(19) DEFAULT NULL,
  `SR_SO_ORGID` varchar(40) DEFAULT NULL,
  `SR_CODE` varchar(50) DEFAULT NULL,
  `SR_USERID` varchar(50) DEFAULT NULL,
  `SR_ROLETYPE` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`SR_ID`),
  UNIQUE KEY `SYS_C0035338` (`SR_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1002000001', '超级管理员', '0', null, null, '1', '6', '1', '2014-07-23 12:00:13', '000001', '1001', null, null);

-- ----------------------------
-- Table structure for `sys_role_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `SRM_ID` varchar(40) DEFAULT NULL,
  `SRM_ROLEID` varchar(40) DEFAULT NULL,
  `SRM_MENUID` varchar(40) DEFAULT NULL,
  UNIQUE KEY `SYS_C0035340` (`SRM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('10040144017', '00025143216', 'transYsh_insert');
INSERT INTO `sys_role_menu` VALUES ('10040144018', '00025143216', 'transYsh_detailPage');
INSERT INTO `sys_role_menu` VALUES ('10040144019', '00025143216', 'transYsh_editPage');
INSERT INTO `sys_role_menu` VALUES ('100401440110', '00025143216', 'transYsh_addPage');
INSERT INTO `sys_role_menu` VALUES ('100401440111', '00025143216', 'transYsh_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('100401440112', '00025143216', 'transYsh_listPage');
INSERT INTO `sys_role_menu` VALUES ('100401440113', '00025143216', 'coupons');
INSERT INTO `sys_role_menu` VALUES ('100401440114', '00025143216', 'yshCoupon');
INSERT INTO `sys_role_menu` VALUES ('100401440115', '00025143216', 'yshCoupon_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('100401440116', '00025143216', 'yshCoupon_delete');
INSERT INTO `sys_role_menu` VALUES ('100401440117', '00025143216', 'yshCoupon_update');
INSERT INTO `sys_role_menu` VALUES ('100401440118', '00025143216', 'yshCoupon_insert');
INSERT INTO `sys_role_menu` VALUES ('100401440119', '00025143216', 'yshCoupon_detailPage');
INSERT INTO `sys_role_menu` VALUES ('100401440120', '00025143216', 'yshCoupon_editPage');
INSERT INTO `sys_role_menu` VALUES ('100401440121', '00025143216', 'yshCoupon_addPage');
INSERT INTO `sys_role_menu` VALUES ('100401440122', '00025143216', 'yshCoupon_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('100401440123', '00025143216', 'yshCoupon_listPage');
INSERT INTO `sys_role_menu` VALUES ('100401440124', '00025143216', 'yshCoupon3');
INSERT INTO `sys_role_menu` VALUES ('100401440125', '00025143216', 'yshCoupon2');
INSERT INTO `sys_role_menu` VALUES ('100401440126', '00025143216', 'yshCoupon1');
INSERT INTO `sys_role_menu` VALUES ('100401440127', '00025143216', 'yshProgram');
INSERT INTO `sys_role_menu` VALUES ('100401440128', '00025143216', 'yshProgram_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('100401440129', '00025143216', 'yshProgram_delete');
INSERT INTO `sys_role_menu` VALUES ('100401440130', '00025143216', 'yshProgram_update');
INSERT INTO `sys_role_menu` VALUES ('100401440131', '00025143216', 'yshProgram_insert');
INSERT INTO `sys_role_menu` VALUES ('100401440132', '00025143216', 'yshProgram_detailPage');
INSERT INTO `sys_role_menu` VALUES ('100401440133', '00025143216', 'yshProgram_editPage');
INSERT INTO `sys_role_menu` VALUES ('100401440134', '00025143216', 'yshProgram_addPage');
INSERT INTO `sys_role_menu` VALUES ('100401440135', '00025143216', 'yshProgram_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('100401440136', '00025143216', 'yshProgram_listPage');
INSERT INTO `sys_role_menu` VALUES ('100401440137', '00025143216', 'user');
INSERT INTO `sys_role_menu` VALUES ('100401440138', '00025143216', 'userMerchant');
INSERT INTO `sys_role_menu` VALUES ('100401440139', '00025143216', 'userMerchant_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('100401440140', '00025143216', 'userMerchant_delete');
INSERT INTO `sys_role_menu` VALUES ('100401440141', '00025143216', 'userMerchant_update');
INSERT INTO `sys_role_menu` VALUES ('100401440142', '00025143216', 'userMerchant_insert');
INSERT INTO `sys_role_menu` VALUES ('100401440143', '00025143216', 'userMerchant_detailPage');
INSERT INTO `sys_role_menu` VALUES ('100401440144', '00025143216', 'userMerchant_editPage');
INSERT INTO `sys_role_menu` VALUES ('100401440145', '00025143216', 'userMerchant_addPage');
INSERT INTO `sys_role_menu` VALUES ('100401440146', '00025143216', 'userMerchant_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('100401440147', '00025143216', 'userMerchant_listPage');
INSERT INTO `sys_role_menu` VALUES ('100401440148', '00025143216', 'userCustomer');
INSERT INTO `sys_role_menu` VALUES ('100401440149', '00025143216', 'userCustomer_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('100401440150', '00025143216', 'userCustomer_delete');
INSERT INTO `sys_role_menu` VALUES ('100401440151', '00025143216', 'userCustomer_update');
INSERT INTO `sys_role_menu` VALUES ('100401440152', '00025143216', 'userCustomer_insert');
INSERT INTO `sys_role_menu` VALUES ('100401440153', '00025143216', 'userCustomer_detailPage');
INSERT INTO `sys_role_menu` VALUES ('100401440154', '00025143216', 'userCustomer_editPage');
INSERT INTO `sys_role_menu` VALUES ('100401440155', '00025143216', 'userCustomer_addPage');
INSERT INTO `sys_role_menu` VALUES ('100401440156', '00025143216', 'userCustomer_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('100401440157', '00025143216', 'userCustomer_listPage');
INSERT INTO `sys_role_menu` VALUES ('100401440158', '00025143216', 'userAgent');
INSERT INTO `sys_role_menu` VALUES ('100401440159', '00025143216', 'userAgent_detailPage');
INSERT INTO `sys_role_menu` VALUES ('100401440160', '00025143216', 'userAgent_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('100401440161', '00025143216', 'userAgent_delete');
INSERT INTO `sys_role_menu` VALUES ('100401440162', '00025143216', 'userAgent_update');
INSERT INTO `sys_role_menu` VALUES ('100401440163', '00025143216', 'userAgent_insert');
INSERT INTO `sys_role_menu` VALUES ('100401440164', '00025143216', 'userAgent_editPage');
INSERT INTO `sys_role_menu` VALUES ('100401440165', '00025143216', 'userAgent_addPage');
INSERT INTO `sys_role_menu` VALUES ('100401440166', '00025143216', 'userAgent_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('100401440167', '00025143216', 'userAgent_listPage');
INSERT INTO `sys_role_menu` VALUES ('100401440168', '00025143216', '00040050015');
INSERT INTO `sys_role_menu` VALUES ('100401440169', '00025143216', 'glAccountDetail');
INSERT INTO `sys_role_menu` VALUES ('100401440170', '00025143216', 'glAccountDetail_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('100401440171', '00025143216', 'glAccountDetail_delete');
INSERT INTO `sys_role_menu` VALUES ('100401440172', '00025143216', 'glAccountDetail_update');
INSERT INTO `sys_role_menu` VALUES ('100401440173', '00025143216', 'glAccountDetail_insert');
INSERT INTO `sys_role_menu` VALUES ('100401440174', '00025143216', 'glAccountDetail_detailPage');
INSERT INTO `sys_role_menu` VALUES ('100401440175', '00025143216', 'glAccountDetail_editPage');
INSERT INTO `sys_role_menu` VALUES ('100401440176', '00025143216', 'glAccountDetail_addPage');
INSERT INTO `sys_role_menu` VALUES ('100401440177', '00025143216', 'glAccountDetail_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('100401440178', '00025143216', 'glAccountDetail_listPage');
INSERT INTO `sys_role_menu` VALUES ('100401440179', '00025143216', 'glAccount');
INSERT INTO `sys_role_menu` VALUES ('100401440180', '00025143216', 'glAccount_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('100401440181', '00025143216', 'glAccount_delete');
INSERT INTO `sys_role_menu` VALUES ('100401440182', '00025143216', 'glAccount_update');
INSERT INTO `sys_role_menu` VALUES ('100401440183', '00025143216', 'glAccount_insert');
INSERT INTO `sys_role_menu` VALUES ('100401440184', '00025143216', 'glAccount_detailPage');
INSERT INTO `sys_role_menu` VALUES ('100401440185', '00025143216', 'glAccount_editPage');
INSERT INTO `sys_role_menu` VALUES ('100401440186', '00025143216', 'glAccount_addPage');
INSERT INTO `sys_role_menu` VALUES ('100401440187', '00025143216', 'glAccount_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('100401440188', '00025143216', 'glAccount_listPage');
INSERT INTO `sys_role_menu` VALUES ('100401440189', '00025143216', 'base');
INSERT INTO `sys_role_menu` VALUES ('100401440190', '00025143216', 'confUserFee');
INSERT INTO `sys_role_menu` VALUES ('100401440191', '00025143216', 'confUserFee_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('100401440192', '00025143216', 'confUserFee_delete');
INSERT INTO `sys_role_menu` VALUES ('100401440193', '00025143216', 'confUserFee_update');
INSERT INTO `sys_role_menu` VALUES ('100401440194', '00025143216', 'confUserFee_insert');
INSERT INTO `sys_role_menu` VALUES ('100401440195', '00025143216', 'confUserFee_detailPage');
INSERT INTO `sys_role_menu` VALUES ('100401440196', '00025143216', 'confUserFee_editPage');
INSERT INTO `sys_role_menu` VALUES ('100401440197', '00025143216', 'confUserFee_addPage');
INSERT INTO `sys_role_menu` VALUES ('100401440198', '00025143216', 'confUserFee_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('100401440199', '00025143216', 'confUserFee_listPage');
INSERT INTO `sys_role_menu` VALUES ('1004014401100', '00025143216', 'confBankAccount');
INSERT INTO `sys_role_menu` VALUES ('1004014401101', '00025143216', 'confBankAccount_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('1004014401102', '00025143216', 'confBankAccount_delete');
INSERT INTO `sys_role_menu` VALUES ('1004014401103', '00025143216', 'confBankAccount_update');
INSERT INTO `sys_role_menu` VALUES ('1004014401104', '00025143216', 'confBankAccount_insert');
INSERT INTO `sys_role_menu` VALUES ('1004014401105', '00025143216', 'confBankAccount_detailPage');
INSERT INTO `sys_role_menu` VALUES ('1004014401106', '00025143216', 'confBankAccount_editPage');
INSERT INTO `sys_role_menu` VALUES ('1004014401107', '00025143216', 'confBankAccount_addPage');
INSERT INTO `sys_role_menu` VALUES ('1406103115', '1406102811', '1406082000154');
INSERT INTO `sys_role_menu` VALUES ('1406103116', '1406102811', '1000000000859');
INSERT INTO `sys_role_menu` VALUES ('1406103117', '1406102811', '1000000004870');
INSERT INTO `sys_role_menu` VALUES ('1406103118', '1406102811', '1000000400804');
INSERT INTO `sys_role_menu` VALUES ('1406103119', '1406102811', '1000000400848');
INSERT INTO `sys_role_menu` VALUES ('14061031110', '1406102811', '1000000400826');
INSERT INTO `sys_role_menu` VALUES ('14061031111', '1406102811', '100200044284');
INSERT INTO `sys_role_menu` VALUES ('14061031112', '1406102811', '1000000000892');
INSERT INTO `sys_role_menu` VALUES ('14061031113', '1406102811', '1000001004903');
INSERT INTO `sys_role_menu` VALUES ('1004014401108', '00025143216', 'confBankAccount_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('1004014401109', '00025143216', 'confBankAccount_listPage');
INSERT INTO `sys_role_menu` VALUES ('1004014401110', '00025143216', 'baseBusinessType');
INSERT INTO `sys_role_menu` VALUES ('1004014401111', '00025143216', 'baseBusinessType_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('1004014401112', '00025143216', 'baseBusinessType_delete');
INSERT INTO `sys_role_menu` VALUES ('1004014401113', '00025143216', 'baseBusinessType_update');
INSERT INTO `sys_role_menu` VALUES ('1004014401114', '00025143216', 'baseBusinessType_insert');
INSERT INTO `sys_role_menu` VALUES ('1004014401115', '00025143216', 'baseBusinessType_detailPage');
INSERT INTO `sys_role_menu` VALUES ('1004014401116', '00025143216', 'baseBusinessType_editPage');
INSERT INTO `sys_role_menu` VALUES ('1004014401117', '00025143216', 'baseBusinessType_addPage');
INSERT INTO `sys_role_menu` VALUES ('1004014401118', '00025143216', 'baseBusinessType_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('1004014401119', '00025143216', 'baseBusinessType_listPage');
INSERT INTO `sys_role_menu` VALUES ('1004014401120', '00025143216', 'baseBusinessArea');
INSERT INTO `sys_role_menu` VALUES ('1004014401121', '00025143216', 'baseNotice');
INSERT INTO `sys_role_menu` VALUES ('1004014401122', '00025143216', 'system');
INSERT INTO `sys_role_menu` VALUES ('1004014401123', '00025143216', 'system_priv');
INSERT INTO `sys_role_menu` VALUES ('1004014401124', '00025143216', 'system_priv_user');
INSERT INTO `sys_role_menu` VALUES ('1004014401125', '00025143216', 'system_priv_role');
INSERT INTO `sys_role_menu` VALUES ('1005422200', '0000040403402010', '1');
INSERT INTO `sys_role_menu` VALUES ('1005422201', '0000040403402010', 'merchant_1002');
INSERT INTO `sys_role_menu` VALUES ('1005422202', '0000040403402010', 'userMerchant');
INSERT INTO `sys_role_menu` VALUES ('1005422203', '0000040403402010', 'userMerchant_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('1005422204', '0000040403402010', 'userMerchant_delete');
INSERT INTO `sys_role_menu` VALUES ('1005422205', '0000040403402010', 'userMerchant_update');
INSERT INTO `sys_role_menu` VALUES ('1005422206', '0000040403402010', 'userMerchant_insert');
INSERT INTO `sys_role_menu` VALUES ('1005422207', '0000040403402010', 'userMerchant_detailPage');
INSERT INTO `sys_role_menu` VALUES ('1005422208', '0000040403402010', 'userMerchant_editPage');
INSERT INTO `sys_role_menu` VALUES ('1005422209', '0000040403402010', 'userMerchant_addPage');
INSERT INTO `sys_role_menu` VALUES ('10054222010', '0000040403402010', 'userMerchant_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('10054222011', '0000040403402010', 'userMerchant_listPage');
INSERT INTO `sys_role_menu` VALUES ('10054222012', '0000040403402010', 'confUserFee');
INSERT INTO `sys_role_menu` VALUES ('10054222013', '0000040403402010', 'confUserFee_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('10054222014', '0000040403402010', 'confUserFee_delete');
INSERT INTO `sys_role_menu` VALUES ('10054222015', '0000040403402010', 'confUserFee_update');
INSERT INTO `sys_role_menu` VALUES ('10054222016', '0000040403402010', 'confUserFee_insert');
INSERT INTO `sys_role_menu` VALUES ('10054222017', '0000040403402010', 'confUserFee_detailPage');
INSERT INTO `sys_role_menu` VALUES ('10054222018', '0000040403402010', 'confUserFee_editPage');
INSERT INTO `sys_role_menu` VALUES ('10054222019', '0000040403402010', 'confUserFee_addPage');
INSERT INTO `sys_role_menu` VALUES ('10054222020', '0000040403402010', 'confUserFee_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('10054222021', '0000040403402010', 'confUserFee_listPage');
INSERT INTO `sys_role_menu` VALUES ('10054222022', '0000040403402010', '0000200006');
INSERT INTO `sys_role_menu` VALUES ('10054222023', '0000040403402010', '00002000013');
INSERT INTO `sys_role_menu` VALUES ('10054222024', '0000040403402010', '00002000014');
INSERT INTO `sys_role_menu` VALUES ('10054222025', '0000040403402010', '00002000015');
INSERT INTO `sys_role_menu` VALUES ('10054222026', '0000040403402010', '00002000016');
INSERT INTO `sys_role_menu` VALUES ('10054222027', '0000040403402010', '00002000017');
INSERT INTO `sys_role_menu` VALUES ('10054222028', '0000040403402010', '00002000018');
INSERT INTO `sys_role_menu` VALUES ('10054222029', '0000040403402010', '00002000019');
INSERT INTO `sys_role_menu` VALUES ('10054222030', '0000040403402010', '00002000020');
INSERT INTO `sys_role_menu` VALUES ('10054222031', '0000040403402010', '00002000021');
INSERT INTO `sys_role_menu` VALUES ('10054222032', '0000040403402010', 'confBankAccount');
INSERT INTO `sys_role_menu` VALUES ('10054222033', '0000040403402010', 'confBankAccount_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('10054222034', '0000040403402010', 'confBankAccount_delete');
INSERT INTO `sys_role_menu` VALUES ('10054222035', '0000040403402010', 'confBankAccount_update');
INSERT INTO `sys_role_menu` VALUES ('10054222036', '0000040403402010', 'confBankAccount_insert');
INSERT INTO `sys_role_menu` VALUES ('10054222037', '0000040403402010', 'confBankAccount_detailPage');
INSERT INTO `sys_role_menu` VALUES ('10054222038', '0000040403402010', 'confBankAccount_editPage');
INSERT INTO `sys_role_menu` VALUES ('10054222039', '0000040403402010', 'confBankAccount_addPage');
INSERT INTO `sys_role_menu` VALUES ('10054222040', '0000040403402010', 'confBankAccount_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('10054222041', '0000040403402010', 'confBankAccount_listPage');
INSERT INTO `sys_role_menu` VALUES ('10054222042', '0000040403402010', 'userManagerInfo');
INSERT INTO `sys_role_menu` VALUES ('10054222043', '0000040403402010', 'userManagerInfo_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('10054222044', '0000040403402010', 'userManagerInfo_delete');
INSERT INTO `sys_role_menu` VALUES ('10054222045', '0000040403402010', 'userManagerInfo_update');
INSERT INTO `sys_role_menu` VALUES ('10054222046', '0000040403402010', 'userManagerInfo_insert');
INSERT INTO `sys_role_menu` VALUES ('10054222047', '0000040403402010', 'userManagerInfo_detailPage');
INSERT INTO `sys_role_menu` VALUES ('10054222048', '0000040403402010', 'userManagerInfo_editPage');
INSERT INTO `sys_role_menu` VALUES ('10054222049', '0000040403402010', 'userManagerInfo_addPage');
INSERT INTO `sys_role_menu` VALUES ('10054222050', '0000040403402010', 'userManagerInfo_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('10054222051', '0000040403402010', 'userManagerInfo_listPage');
INSERT INTO `sys_role_menu` VALUES ('10054222052', '0000040403402010', 'rptMerchantJs');
INSERT INTO `sys_role_menu` VALUES ('10054222053', '0000040403402010', 'rptMerchantJs_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('10054222054', '0000040403402010', 'rptMerchantJs_delete');
INSERT INTO `sys_role_menu` VALUES ('10054222055', '0000040403402010', 'rptMerchantJs_update');
INSERT INTO `sys_role_menu` VALUES ('10054222056', '0000040403402010', 'rptMerchantJs_insert');
INSERT INTO `sys_role_menu` VALUES ('10054222057', '0000040403402010', 'rptMerchantJs_detailPage');
INSERT INTO `sys_role_menu` VALUES ('10054222058', '0000040403402010', 'rptMerchantJs_editPage');
INSERT INTO `sys_role_menu` VALUES ('10054222059', '0000040403402010', 'rptMerchantJs_addPage');
INSERT INTO `sys_role_menu` VALUES ('10054222060', '0000040403402010', 'rptMerchantJs_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('10054222061', '0000040403402010', 'rptMerchantJs_listPage');
INSERT INTO `sys_role_menu` VALUES ('10054222062', '0000040403402010', 'user');
INSERT INTO `sys_role_menu` VALUES ('10054222063', '0000040403402010', 'userAgent');
INSERT INTO `sys_role_menu` VALUES ('10054222064', '0000040403402010', 'userAgent_detailPage');
INSERT INTO `sys_role_menu` VALUES ('10054222065', '0000040403402010', 'userAgent_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('10054222066', '0000040403402010', 'userAgent_delete');
INSERT INTO `sys_role_menu` VALUES ('10054222067', '0000040403402010', 'userAgent_update');
INSERT INTO `sys_role_menu` VALUES ('10054222068', '0000040403402010', 'userAgent_insert');
INSERT INTO `sys_role_menu` VALUES ('10054222069', '0000040403402010', 'userAgent_editPage');
INSERT INTO `sys_role_menu` VALUES ('10054222070', '0000040403402010', 'userAgent_addPage');
INSERT INTO `sys_role_menu` VALUES ('10054222071', '0000040403402010', 'userAgent_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('10054222072', '0000040403402010', 'userAgent_listPage');
INSERT INTO `sys_role_menu` VALUES ('10054222073', '0000040403402010', '10060100006');
INSERT INTO `sys_role_menu` VALUES ('10054222074', '0000040403402010', '00040050015');
INSERT INTO `sys_role_menu` VALUES ('10054222075', '0000040403402010', 'userCustomer');
INSERT INTO `sys_role_menu` VALUES ('10054222076', '0000040403402010', 'userCustomer_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('10054222077', '0000040403402010', 'userCustomer_delete');
INSERT INTO `sys_role_menu` VALUES ('10054222078', '0000040403402010', 'userCustomer_update');
INSERT INTO `sys_role_menu` VALUES ('10054222079', '0000040403402010', 'userCustomer_insert');
INSERT INTO `sys_role_menu` VALUES ('10054222080', '0000040403402010', 'userCustomer_detailPage');
INSERT INTO `sys_role_menu` VALUES ('10054222081', '0000040403402010', 'userCustomer_editPage');
INSERT INTO `sys_role_menu` VALUES ('10054222082', '0000040403402010', 'userCustomer_addPage');
INSERT INTO `sys_role_menu` VALUES ('10054222083', '0000040403402010', 'userCustomer_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('10054222084', '0000040403402010', 'userCustomer_listPage');
INSERT INTO `sys_role_menu` VALUES ('10054222085', '0000040403402010', 'glAccount');
INSERT INTO `sys_role_menu` VALUES ('10054222086', '0000040403402010', 'glAccount_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('10054222087', '0000040403402010', 'glAccount_delete');
INSERT INTO `sys_role_menu` VALUES ('10054222088', '0000040403402010', 'glAccount_update');
INSERT INTO `sys_role_menu` VALUES ('10054222089', '0000040403402010', 'glAccount_insert');
INSERT INTO `sys_role_menu` VALUES ('10054222090', '0000040403402010', 'glAccount_detailPage');
INSERT INTO `sys_role_menu` VALUES ('10054222091', '0000040403402010', 'glAccount_editPage');
INSERT INTO `sys_role_menu` VALUES ('10054222092', '0000040403402010', 'glAccount_addPage');
INSERT INTO `sys_role_menu` VALUES ('10054222093', '0000040403402010', 'glAccount_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('10054222094', '0000040403402010', 'glAccount_listPage');
INSERT INTO `sys_role_menu` VALUES ('10054222095', '0000040403402010', 'glAccountDetail');
INSERT INTO `sys_role_menu` VALUES ('10054222096', '0000040403402010', 'glAccountDetail_delete');
INSERT INTO `sys_role_menu` VALUES ('10054222097', '0000040403402010', 'glAccountDetail_update');
INSERT INTO `sys_role_menu` VALUES ('10054222098', '0000040403402010', 'glAccountDetail_insert');
INSERT INTO `sys_role_menu` VALUES ('10054222099', '0000040403402010', 'glAccountDetail_detailPage');
INSERT INTO `sys_role_menu` VALUES ('100542220100', '0000040403402010', 'glAccountDetail_editPage');
INSERT INTO `sys_role_menu` VALUES ('100542220101', '0000040403402010', 'glAccountDetail_addPage');
INSERT INTO `sys_role_menu` VALUES ('100542220102', '0000040403402010', 'glAccountDetail_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('100542220103', '0000040403402010', 'glAccountDetail_listPage');
INSERT INTO `sys_role_menu` VALUES ('100542220104', '0000040403402010', 'glAccountDetail_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('100542220105', '0000040403402010', 'glRecharge');
INSERT INTO `sys_role_menu` VALUES ('100542220106', '0000040403402010', 'glRecharge_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('100542220107', '0000040403402010', 'glRecharge_delete');
INSERT INTO `sys_role_menu` VALUES ('100542220108', '0000040403402010', 'glRecharge_update');
INSERT INTO `sys_role_menu` VALUES ('100542220109', '0000040403402010', 'glRecharge_insert');
INSERT INTO `sys_role_menu` VALUES ('100542220110', '0000040403402010', 'glRecharge_detailPage');
INSERT INTO `sys_role_menu` VALUES ('100542220111', '0000040403402010', 'glRecharge_editPage');
INSERT INTO `sys_role_menu` VALUES ('100542220112', '0000040403402010', 'glRecharge_addPage');
INSERT INTO `sys_role_menu` VALUES ('100542220113', '0000040403402010', 'glRecharge_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('100542220114', '0000040403402010', 'glRecharge_listPage');
INSERT INTO `sys_role_menu` VALUES ('100542220115', '0000040403402010', '1000504016');
INSERT INTO `sys_role_menu` VALUES ('100542220116', '0000040403402010', '100200046273');
INSERT INTO `sys_role_menu` VALUES ('100542220117', '0000040403402010', '00002442084');
INSERT INTO `sys_role_menu` VALUES ('100542220118', '0000040403402010', '00002440683');
INSERT INTO `sys_role_menu` VALUES ('100542220119', '0000040403402010', '00002440082');
INSERT INTO `sys_role_menu` VALUES ('100542220120', '0000040403402010', '00002440681');
INSERT INTO `sys_role_menu` VALUES ('100542220121', '0000040403402010', '00002442379');
INSERT INTO `sys_role_menu` VALUES ('10001044228', '14042101892', '1406082000154');
INSERT INTO `sys_role_menu` VALUES ('10001044229', '14042101892', '1000000000859');
INSERT INTO `sys_role_menu` VALUES ('100010442210', '14042101892', '1000000004870');
INSERT INTO `sys_role_menu` VALUES ('100010442211', '14042101892', '1000000400804');
INSERT INTO `sys_role_menu` VALUES ('100010442212', '14042101892', '1000000400848');
INSERT INTO `sys_role_menu` VALUES ('100010442213', '14042101892', '1000000400826');
INSERT INTO `sys_role_menu` VALUES ('100010442214', '14042101892', '100200044284');
INSERT INTO `sys_role_menu` VALUES ('100010442215', '14042101892', '000520400026');
INSERT INTO `sys_role_menu` VALUES ('100010442216', '14042101892', '1000000000892');
INSERT INTO `sys_role_menu` VALUES ('100010442217', '14042101892', '1000001004903');
INSERT INTO `sys_role_menu` VALUES ('0007400180', '0000041000134102', '1');
INSERT INTO `sys_role_menu` VALUES ('0007400181', '0000041000134102', 'merchant_1002');
INSERT INTO `sys_role_menu` VALUES ('0007400182', '0000041000134102', 'confUserFee');
INSERT INTO `sys_role_menu` VALUES ('0007400183', '0000041000134102', 'confUserFee_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('0007400184', '0000041000134102', 'confUserFee_delete');
INSERT INTO `sys_role_menu` VALUES ('0007400185', '0000041000134102', 'confUserFee_update');
INSERT INTO `sys_role_menu` VALUES ('0007400186', '0000041000134102', 'confUserFee_insert');
INSERT INTO `sys_role_menu` VALUES ('0007400187', '0000041000134102', 'confUserFee_detailPage');
INSERT INTO `sys_role_menu` VALUES ('0007400188', '0000041000134102', 'confUserFee_editPage');
INSERT INTO `sys_role_menu` VALUES ('0007400189', '0000041000134102', 'confUserFee_addPage');
INSERT INTO `sys_role_menu` VALUES ('00074001810', '0000041000134102', 'confUserFee_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('00074001811', '0000041000134102', 'confUserFee_listPage');
INSERT INTO `sys_role_menu` VALUES ('100542220122', '0000040403402010', '00002442777');
INSERT INTO `sys_role_menu` VALUES ('100542220123', '0000040403402010', '00002442376');
INSERT INTO `sys_role_menu` VALUES ('100542220124', '0000040403402010', '00002440075');
INSERT INTO `sys_role_menu` VALUES ('100542220125', '0000040403402010', '00002440073');
INSERT INTO `sys_role_menu` VALUES ('100542220126', '0000040403402010', 'trans');
INSERT INTO `sys_role_menu` VALUES ('100542220127', '0000040403402010', 'transYsh');
INSERT INTO `sys_role_menu` VALUES ('100542220128', '0000040403402010', 'transYsh_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('100101100247', '1002210300428', '1406082020165');
INSERT INTO `sys_role_menu` VALUES ('100101100248', '1002210300428', '100618010321');
INSERT INTO `sys_role_menu` VALUES ('100101100249', '1002210300428', '100618019322');
INSERT INTO `sys_role_menu` VALUES ('100101100250', '1002210300428', '100650600122');
INSERT INTO `sys_role_menu` VALUES ('100101100251', '1002210300428', '100618000323');
INSERT INTO `sys_role_menu` VALUES ('100101100252', '1002210300428', '100618001324');
INSERT INTO `sys_role_menu` VALUES ('1001402120498', '0000031411100903', 'confBankAccount_insert');
INSERT INTO `sys_role_menu` VALUES ('1001402120499', '0000031411100903', 'confBankAccount_detailPage');
INSERT INTO `sys_role_menu` VALUES ('1001402120500', '0000031411100903', 'confBankAccount_editPage');
INSERT INTO `sys_role_menu` VALUES ('100402003121', '00021000000', '1');
INSERT INTO `sys_role_menu` VALUES ('100402003122', '00021000000', 'merchant_1002');
INSERT INTO `sys_role_menu` VALUES ('100402003123', '00021000000', 'userMerchant');
INSERT INTO `sys_role_menu` VALUES ('100402003124', '00021000000', 'userMerchant_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('14100141134', '0000050400000401', '1406082000154');
INSERT INTO `sys_role_menu` VALUES ('14100141135', '0000050400000401', '100840310044');
INSERT INTO `sys_role_menu` VALUES ('14100141136', '0000050400000401', '1000000400848');
INSERT INTO `sys_role_menu` VALUES ('14100141137', '0000050400000401', '1000000400804');
INSERT INTO `sys_role_menu` VALUES ('14100141138', '0000050400000401', '1000000400826');
INSERT INTO `sys_role_menu` VALUES ('14100141139', '0000050400000401', '1000000000859');
INSERT INTO `sys_role_menu` VALUES ('14100141140', '0000050400000401', '1000000004870');
INSERT INTO `sys_role_menu` VALUES ('14100141141', '0000050400000401', '100840305080');
INSERT INTO `sys_role_menu` VALUES ('14100141142', '0000050400000401', '100840401092');
INSERT INTO `sys_role_menu` VALUES ('14100141143', '0000050400000401', '100840311086');
INSERT INTO `sys_role_menu` VALUES ('14100141144', '0000050400000401', '100840401098');
INSERT INTO `sys_role_menu` VALUES ('14100141145', '0000050400000401', '100200044284');
INSERT INTO `sys_role_menu` VALUES ('14100141146', '0000050400000401', '1000000000892');
INSERT INTO `sys_role_menu` VALUES ('14100141147', '0000050400000401', '1000001004903');
INSERT INTO `sys_role_menu` VALUES ('100010400030', '00000114013034080', '1406082000154');
INSERT INTO `sys_role_menu` VALUES ('100010400031', '00000114013034080', '100840310044');
INSERT INTO `sys_role_menu` VALUES ('100010400032', '00000114013034080', '1000000400848');
INSERT INTO `sys_role_menu` VALUES ('100010400033', '00000114013034080', '1000000400804');
INSERT INTO `sys_role_menu` VALUES ('100010400034', '00000114013034080', '1000000400826');
INSERT INTO `sys_role_menu` VALUES ('100010400035', '00000114013034080', '1000000000859');
INSERT INTO `sys_role_menu` VALUES ('100010400036', '00000114013034080', '1000000004870');
INSERT INTO `sys_role_menu` VALUES ('100010400037', '00000114013034080', '100840305080');
INSERT INTO `sys_role_menu` VALUES ('100010400038', '00000114013034080', '100840401092');
INSERT INTO `sys_role_menu` VALUES ('100010400039', '00000114013034080', '100840311086');
INSERT INTO `sys_role_menu` VALUES ('100010400040', '00000114013034080', '100840401098');
INSERT INTO `sys_role_menu` VALUES ('100010400041', '00000114013034080', '100200044284');
INSERT INTO `sys_role_menu` VALUES ('100010400042', '00000114013034080', '1000000000892');
INSERT INTO `sys_role_menu` VALUES ('100010400043', '00000114013034080', '1000001004903');
INSERT INTO `sys_role_menu` VALUES ('1001402120478', '0000031411100903', '1');
INSERT INTO `sys_role_menu` VALUES ('1001402120479', '0000031411100903', 'merchant_1002');
INSERT INTO `sys_role_menu` VALUES ('1001402120480', '0000031411100903', 'userMerchant');
INSERT INTO `sys_role_menu` VALUES ('1001402120481', '0000031411100903', 'userMerchant_detailPage');
INSERT INTO `sys_role_menu` VALUES ('1001402120482', '0000031411100903', 'userMerchant_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('1001402120483', '0000031411100903', 'userMerchant_listPage');
INSERT INTO `sys_role_menu` VALUES ('1001402120484', '0000031411100903', 'confUserFee');
INSERT INTO `sys_role_menu` VALUES ('1001402120485', '0000031411100903', 'confUserFee_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('1001402120486', '0000031411100903', 'confUserFee_delete');
INSERT INTO `sys_role_menu` VALUES ('1001402120487', '0000031411100903', 'confUserFee_update');
INSERT INTO `sys_role_menu` VALUES ('1001402120488', '0000031411100903', 'confUserFee_insert');
INSERT INTO `sys_role_menu` VALUES ('1001402120489', '0000031411100903', 'confUserFee_detailPage');
INSERT INTO `sys_role_menu` VALUES ('1001402120490', '0000031411100903', 'confUserFee_editPage');
INSERT INTO `sys_role_menu` VALUES ('1001402120491', '0000031411100903', 'confUserFee_addPage');
INSERT INTO `sys_role_menu` VALUES ('1001402120492', '0000031411100903', 'confUserFee_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('1001402120493', '0000031411100903', 'confUserFee_listPage');
INSERT INTO `sys_role_menu` VALUES ('1001402120494', '0000031411100903', 'confBankAccount');
INSERT INTO `sys_role_menu` VALUES ('1001402120495', '0000031411100903', 'confBankAccount_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('1001402120496', '0000031411100903', 'confBankAccount_delete');
INSERT INTO `sys_role_menu` VALUES ('1001402120497', '0000031411100903', 'confBankAccount_update');
INSERT INTO `sys_role_menu` VALUES ('100602380569', '140000100215', 'glAccountDetail_detailPage');
INSERT INTO `sys_role_menu` VALUES ('100602380570', '140000100215', 'glAccountDetail_editPage');
INSERT INTO `sys_role_menu` VALUES ('100602380571', '140000100215', 'glAccountDetail_addPage');
INSERT INTO `sys_role_menu` VALUES ('100602380572', '140000100215', 'glAccountDetail_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('100602380573', '140000100215', 'glAccountDetail_listPage');
INSERT INTO `sys_role_menu` VALUES ('100602380574', '140000100215', 'glAccountDetail_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('100602380575', '140000100215', 'trans');
INSERT INTO `sys_role_menu` VALUES ('100602380576', '140000100215', 'transYsh');
INSERT INTO `sys_role_menu` VALUES ('100602380577', '140000100215', 'transYsh_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('100602380578', '140000100215', 'transYsh_delete');
INSERT INTO `sys_role_menu` VALUES ('100602380579', '140000100215', 'transYsh_update');
INSERT INTO `sys_role_menu` VALUES ('100602380580', '140000100215', 'transYsh_insert');
INSERT INTO `sys_role_menu` VALUES ('100602380581', '140000100215', 'transYsh_detailPage');
INSERT INTO `sys_role_menu` VALUES ('100602380582', '140000100215', 'transYsh_editPage');
INSERT INTO `sys_role_menu` VALUES ('100602380583', '140000100215', 'transYsh_addPage');
INSERT INTO `sys_role_menu` VALUES ('100602380584', '140000100215', 'transYsh_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('100602380585', '140000100215', 'transYsh_listPage');
INSERT INTO `sys_role_menu` VALUES ('100602380586', '140000100215', '000000201049');
INSERT INTO `sys_role_menu` VALUES ('100602380587', '140000100215', 'yshProgram');
INSERT INTO `sys_role_menu` VALUES ('100602380588', '140000100215', 'yshProgram_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('100602380589', '140000100215', 'yshProgram_delete');
INSERT INTO `sys_role_menu` VALUES ('100602380590', '140000100215', 'yshProgram_update');
INSERT INTO `sys_role_menu` VALUES ('100602380591', '140000100215', 'yshProgram_insert');
INSERT INTO `sys_role_menu` VALUES ('100602380592', '140000100215', 'yshProgram_detailPage');
INSERT INTO `sys_role_menu` VALUES ('100602380593', '140000100215', 'yshProgram_editPage');
INSERT INTO `sys_role_menu` VALUES ('100602380594', '140000100215', 'yshProgram_addPage');
INSERT INTO `sys_role_menu` VALUES ('100602380595', '140000100215', 'yshProgram_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('100602380596', '140000100215', 'yshProgram_listPage');
INSERT INTO `sys_role_menu` VALUES ('100602380597', '140000100215', 'coupons');
INSERT INTO `sys_role_menu` VALUES ('100602380598', '140000100215', 'yshCoupon1');
INSERT INTO `sys_role_menu` VALUES ('100602380599', '140000100215', 'yshCoupon2');
INSERT INTO `sys_role_menu` VALUES ('1006023805100', '140000100215', 'yshCoupon3');
INSERT INTO `sys_role_menu` VALUES ('1006023805101', '140000100215', 'yshCoupon');
INSERT INTO `sys_role_menu` VALUES ('1006023805102', '140000100215', 'yshCoupon_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('1006023805103', '140000100215', 'yshCoupon_delete');
INSERT INTO `sys_role_menu` VALUES ('1006023805104', '140000100215', 'yshCoupon_update');
INSERT INTO `sys_role_menu` VALUES ('1006023805105', '140000100215', 'yshCoupon_insert');
INSERT INTO `sys_role_menu` VALUES ('1006023805106', '140000100215', 'yshCoupon_detailPage');
INSERT INTO `sys_role_menu` VALUES ('1006023805107', '140000100215', 'yshCoupon_editPage');
INSERT INTO `sys_role_menu` VALUES ('1006023805108', '140000100215', 'yshCoupon_addPage');
INSERT INTO `sys_role_menu` VALUES ('1006023805109', '140000100215', 'yshCoupon_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('1006023805110', '140000100215', 'yshCoupon_listPage');
INSERT INTO `sys_role_menu` VALUES ('1006023805111', '140000100215', 'base');
INSERT INTO `sys_role_menu` VALUES ('1006023805112', '140000100215', 'baseBusinessType');
INSERT INTO `sys_role_menu` VALUES ('1006023805113', '140000100215', 'baseBusinessType_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('1006023805114', '140000100215', 'baseBusinessType_delete');
INSERT INTO `sys_role_menu` VALUES ('1006023805115', '140000100215', 'baseBusinessType_update');
INSERT INTO `sys_role_menu` VALUES ('1006023805116', '140000100215', 'baseBusinessType_insert');
INSERT INTO `sys_role_menu` VALUES ('1006023805117', '140000100215', 'baseBusinessType_detailPage');
INSERT INTO `sys_role_menu` VALUES ('1006023805118', '140000100215', 'baseBusinessType_editPage');
INSERT INTO `sys_role_menu` VALUES ('1006023805119', '140000100215', 'baseBusinessType_addPage');
INSERT INTO `sys_role_menu` VALUES ('1006023805120', '140000100215', 'baseBusinessType_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('1006023805121', '140000100215', 'baseBusinessType_listPage');
INSERT INTO `sys_role_menu` VALUES ('1006023805122', '140000100215', 'baseBusinessArea');
INSERT INTO `sys_role_menu` VALUES ('1006023805123', '140000100215', 'system');
INSERT INTO `sys_role_menu` VALUES ('1006023805124', '140000100215', 'baseNotice');
INSERT INTO `sys_role_menu` VALUES ('1006023805125', '140000100215', 'system_priv');
INSERT INTO `sys_role_menu` VALUES ('1006023805126', '140000100215', 'system_priv_user');
INSERT INTO `sys_role_menu` VALUES ('1006023805127', '140000100215', 'system_priv_role');
INSERT INTO `sys_role_menu` VALUES ('1402601029', '140421020104', '1406082020165');
INSERT INTO `sys_role_menu` VALUES ('14026010210', '140421020104', '100618010321');
INSERT INTO `sys_role_menu` VALUES ('14026010211', '140421020104', '100618019322');
INSERT INTO `sys_role_menu` VALUES ('14026010212', '140421020104', '100618000323');
INSERT INTO `sys_role_menu` VALUES ('14026010213', '140421020104', '100618001324');
INSERT INTO `sys_role_menu` VALUES ('100032002113', '000004140054000013', '1');
INSERT INTO `sys_role_menu` VALUES ('100032002114', '000004140054000013', 'merchant_1002');
INSERT INTO `sys_role_menu` VALUES ('100032002115', '000004140054000013', 'userMerchant');
INSERT INTO `sys_role_menu` VALUES ('100032002116', '000004140054000013', 'userMerchant_insert');
INSERT INTO `sys_role_menu` VALUES ('100032002117', '000004140054000013', 'userMerchant_detailPage');
INSERT INTO `sys_role_menu` VALUES ('100032021018', '00000414005400080', '1');
INSERT INTO `sys_role_menu` VALUES ('100032021019', '00000414005400080', 'merchant_1002');
INSERT INTO `sys_role_menu` VALUES ('100032021020', '00000414005400080', 'confUserFee');
INSERT INTO `sys_role_menu` VALUES ('100032021021', '00000414005400080', 'confUserFee_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('100032002022', '00000414005400002', '1');
INSERT INTO `sys_role_menu` VALUES ('100032002023', '00000414005400002', 'merchant_1002');
INSERT INTO `sys_role_menu` VALUES ('100032002024', '00000414005400002', 'confUserFee');
INSERT INTO `sys_role_menu` VALUES ('100032002025', '00000414005400002', 'confUserFee_delete');
INSERT INTO `sys_role_menu` VALUES ('000804100402', '00000314081000020', 'userMerchant');
INSERT INTO `sys_role_menu` VALUES ('000804100403', '00000314081000020', 'userMerchant_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('000804100404', '00000314081000020', 'userMerchant_delete');
INSERT INTO `sys_role_menu` VALUES ('000804100405', '00000314081000020', 'userMerchant_update');
INSERT INTO `sys_role_menu` VALUES ('000804100406', '00000314081000020', 'userMerchant_insert');
INSERT INTO `sys_role_menu` VALUES ('000804100407', '00000314081000020', 'userMerchant_detailPage');
INSERT INTO `sys_role_menu` VALUES ('000804100408', '00000314081000020', 'userMerchant_editPage');
INSERT INTO `sys_role_menu` VALUES ('000804100409', '00000314081000020', 'userMerchant_addPage');
INSERT INTO `sys_role_menu` VALUES ('000804100410', '00000314081000020', 'userMerchant_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('000804100411', '00000314081000020', 'userMerchant_listPage');
INSERT INTO `sys_role_menu` VALUES ('000804100400', '00000314081000020', '1');
INSERT INTO `sys_role_menu` VALUES ('000804100401', '00000314081000020', 'merchant_1002');
INSERT INTO `sys_role_menu` VALUES ('000804100412', '00000314081000020', 'confUserFee');
INSERT INTO `sys_role_menu` VALUES ('000804100413', '00000314081000020', 'confUserFee_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('000804100414', '00000314081000020', 'confUserFee_delete');
INSERT INTO `sys_role_menu` VALUES ('000804100415', '00000314081000020', 'confUserFee_update');
INSERT INTO `sys_role_menu` VALUES ('000804100416', '00000314081000020', 'confUserFee_insert');
INSERT INTO `sys_role_menu` VALUES ('000804100417', '00000314081000020', 'confUserFee_detailPage');
INSERT INTO `sys_role_menu` VALUES ('000804100418', '00000314081000020', 'confUserFee_editPage');
INSERT INTO `sys_role_menu` VALUES ('000804100419', '00000314081000020', 'confUserFee_addPage');
INSERT INTO `sys_role_menu` VALUES ('000804100420', '00000314081000020', 'confUserFee_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('000804100421', '00000314081000020', 'confUserFee_listPage');
INSERT INTO `sys_role_menu` VALUES ('000804100422', '00000314081000020', 'confBankAccount');
INSERT INTO `sys_role_menu` VALUES ('000804100423', '00000314081000020', 'confBankAccount_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('000804100424', '00000314081000020', 'confBankAccount_delete');
INSERT INTO `sys_role_menu` VALUES ('000804100425', '00000314081000020', 'confBankAccount_update');
INSERT INTO `sys_role_menu` VALUES ('000804100426', '00000314081000020', 'confBankAccount_insert');
INSERT INTO `sys_role_menu` VALUES ('000804100427', '00000314081000020', 'confBankAccount_detailPage');
INSERT INTO `sys_role_menu` VALUES ('000804100428', '00000314081000020', 'confBankAccount_editPage');
INSERT INTO `sys_role_menu` VALUES ('000804100429', '00000314081000020', 'confBankAccount_addPage');
INSERT INTO `sys_role_menu` VALUES ('000804100430', '00000314081000020', 'confBankAccount_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('000804100431', '00000314081000020', 'confBankAccount_listPage');
INSERT INTO `sys_role_menu` VALUES ('000804100432', '00000314081000020', 'userManagerInfo');
INSERT INTO `sys_role_menu` VALUES ('000804100433', '00000314081000020', 'userManagerInfo_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('000804100434', '00000314081000020', 'userManagerInfo_delete');
INSERT INTO `sys_role_menu` VALUES ('000804100435', '00000314081000020', 'userManagerInfo_update');
INSERT INTO `sys_role_menu` VALUES ('000804100436', '00000314081000020', 'userManagerInfo_insert');
INSERT INTO `sys_role_menu` VALUES ('000804100437', '00000314081000020', 'userManagerInfo_detailPage');
INSERT INTO `sys_role_menu` VALUES ('000804100438', '00000314081000020', 'userManagerInfo_editPage');
INSERT INTO `sys_role_menu` VALUES ('000804100439', '00000314081000020', 'userManagerInfo_addPage');
INSERT INTO `sys_role_menu` VALUES ('000804100440', '00000314081000020', 'userManagerInfo_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('000804100441', '00000314081000020', 'userManagerInfo_listPage');
INSERT INTO `sys_role_menu` VALUES ('000804100442', '00000314081000020', 'rptMerchantJs');
INSERT INTO `sys_role_menu` VALUES ('000804100443', '00000314081000020', 'rptMerchantJs_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('000804100444', '00000314081000020', 'rptMerchantJs_delete');
INSERT INTO `sys_role_menu` VALUES ('000804100445', '00000314081000020', 'rptMerchantJs_update');
INSERT INTO `sys_role_menu` VALUES ('000804100446', '00000314081000020', 'rptMerchantJs_insert');
INSERT INTO `sys_role_menu` VALUES ('000804100447', '00000314081000020', 'rptMerchantJs_detailPage');
INSERT INTO `sys_role_menu` VALUES ('000804100448', '00000314081000020', 'rptMerchantJs_editPage');
INSERT INTO `sys_role_menu` VALUES ('000804100449', '00000314081000020', 'rptMerchantJs_addPage');
INSERT INTO `sys_role_menu` VALUES ('000804100450', '00000314081000020', 'rptMerchantJs_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('000804100451', '00000314081000020', 'rptMerchantJs_listPage');
INSERT INTO `sys_role_menu` VALUES ('000804100452', '00000314081000020', '0000200006');
INSERT INTO `sys_role_menu` VALUES ('000804100453', '00000314081000020', '00002000013');
INSERT INTO `sys_role_menu` VALUES ('000804100454', '00000314081000020', '00002000014');
INSERT INTO `sys_role_menu` VALUES ('000804100455', '00000314081000020', '00002000015');
INSERT INTO `sys_role_menu` VALUES ('000804100456', '00000314081000020', '00002000016');
INSERT INTO `sys_role_menu` VALUES ('000804100457', '00000314081000020', '00002000017');
INSERT INTO `sys_role_menu` VALUES ('000804100458', '00000314081000020', '00002000018');
INSERT INTO `sys_role_menu` VALUES ('000804100459', '00000314081000020', '00002000019');
INSERT INTO `sys_role_menu` VALUES ('000804100460', '00000314081000020', '00002000020');
INSERT INTO `sys_role_menu` VALUES ('100542220129', '0000040403402010', 'transYsh_delete');
INSERT INTO `sys_role_menu` VALUES ('100542220130', '0000040403402010', 'transYsh_update');
INSERT INTO `sys_role_menu` VALUES ('100542220131', '0000040403402010', 'transYsh_insert');
INSERT INTO `sys_role_menu` VALUES ('100542220132', '0000040403402010', 'transYsh_detailPage');
INSERT INTO `sys_role_menu` VALUES ('100542220133', '0000040403402010', 'transYsh_editPage');
INSERT INTO `sys_role_menu` VALUES ('100542220134', '0000040403402010', 'transYsh_addPage');
INSERT INTO `sys_role_menu` VALUES ('100542220135', '0000040403402010', 'transYsh_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('100542220136', '0000040403402010', 'transYsh_listPage');
INSERT INTO `sys_role_menu` VALUES ('100542220137', '0000040403402010', '000000201049');
INSERT INTO `sys_role_menu` VALUES ('100542220138', '0000040403402010', 'yshProgram');
INSERT INTO `sys_role_menu` VALUES ('100542220139', '0000040403402010', 'yshProgram_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('100542220140', '0000040403402010', 'yshProgram_delete');
INSERT INTO `sys_role_menu` VALUES ('100542220141', '0000040403402010', 'yshProgram_update');
INSERT INTO `sys_role_menu` VALUES ('100542220142', '0000040403402010', 'yshProgram_insert');
INSERT INTO `sys_role_menu` VALUES ('100542220143', '0000040403402010', 'yshProgram_detailPage');
INSERT INTO `sys_role_menu` VALUES ('100542220144', '0000040403402010', 'yshProgram_editPage');
INSERT INTO `sys_role_menu` VALUES ('100542220145', '0000040403402010', 'yshProgram_addPage');
INSERT INTO `sys_role_menu` VALUES ('100542220146', '0000040403402010', 'yshProgram_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('0000470105', '000024605476', '1');
INSERT INTO `sys_role_menu` VALUES ('100542220147', '0000040403402010', 'yshProgram_listPage');
INSERT INTO `sys_role_menu` VALUES ('100542220148', '0000040403402010', 'coupons');
INSERT INTO `sys_role_menu` VALUES ('100542220149', '0000040403402010', 'yshCoupon1');
INSERT INTO `sys_role_menu` VALUES ('100542220150', '0000040403402010', 'yshCoupon2');
INSERT INTO `sys_role_menu` VALUES ('100542220151', '0000040403402010', 'yshCoupon3');
INSERT INTO `sys_role_menu` VALUES ('100542220152', '0000040403402010', 'yshCoupon');
INSERT INTO `sys_role_menu` VALUES ('100542220153', '0000040403402010', 'yshCoupon_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('100542220154', '0000040403402010', 'yshCoupon_delete');
INSERT INTO `sys_role_menu` VALUES ('100542220155', '0000040403402010', 'yshCoupon_update');
INSERT INTO `sys_role_menu` VALUES ('100542220156', '0000040403402010', 'yshCoupon_insert');
INSERT INTO `sys_role_menu` VALUES ('100542220157', '0000040403402010', 'yshCoupon_detailPage');
INSERT INTO `sys_role_menu` VALUES ('100542220158', '0000040403402010', 'yshCoupon_editPage');
INSERT INTO `sys_role_menu` VALUES ('100542220159', '0000040403402010', 'yshCoupon_addPage');
INSERT INTO `sys_role_menu` VALUES ('100542220160', '0000040403402010', 'yshCoupon_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('100542220161', '0000040403402010', 'yshCoupon_listPage');
INSERT INTO `sys_role_menu` VALUES ('100542220162', '0000040403402010', 'base');
INSERT INTO `sys_role_menu` VALUES ('100542220163', '0000040403402010', 'baseBusinessType');
INSERT INTO `sys_role_menu` VALUES ('100542220164', '0000040403402010', 'baseBusinessType_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('100542220165', '0000040403402010', 'baseBusinessType_delete');
INSERT INTO `sys_role_menu` VALUES ('100542220166', '0000040403402010', 'baseBusinessType_update');
INSERT INTO `sys_role_menu` VALUES ('100542220167', '0000040403402010', 'baseBusinessType_insert');
INSERT INTO `sys_role_menu` VALUES ('100542220168', '0000040403402010', 'baseBusinessType_detailPage');
INSERT INTO `sys_role_menu` VALUES ('100542220169', '0000040403402010', 'baseBusinessType_editPage');
INSERT INTO `sys_role_menu` VALUES ('100542220170', '0000040403402010', 'baseBusinessType_addPage');
INSERT INTO `sys_role_menu` VALUES ('100542220171', '0000040403402010', 'baseBusinessType_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('100542220172', '0000040403402010', 'baseBusinessType_listPage');
INSERT INTO `sys_role_menu` VALUES ('100542220173', '0000040403402010', 'baseBusinessArea');
INSERT INTO `sys_role_menu` VALUES ('100542220174', '0000040403402010', 'system');
INSERT INTO `sys_role_menu` VALUES ('100542220175', '0000040403402010', 'baseNotice');
INSERT INTO `sys_role_menu` VALUES ('100542220176', '0000040403402010', 'system_priv');
INSERT INTO `sys_role_menu` VALUES ('100542220177', '0000040403402010', 'system_priv_user');
INSERT INTO `sys_role_menu` VALUES ('100542220178', '0000040403402010', 'system_priv_role');
INSERT INTO `sys_role_menu` VALUES ('0000470106', '000024605476', '00040050015');
INSERT INTO `sys_role_menu` VALUES ('0000470107', '000024605476', '1000504016');
INSERT INTO `sys_role_menu` VALUES ('00001062526', '00001040614', '1');
INSERT INTO `sys_role_menu` VALUES ('00001062527', '00001040614', 'base');
INSERT INTO `sys_role_menu` VALUES ('00001062528', '00001040614', 'baseBusinessArea');
INSERT INTO `sys_role_menu` VALUES ('10040144011', '00025143216', '1');
INSERT INTO `sys_role_menu` VALUES ('10040144012', '00025143216', 'trans');
INSERT INTO `sys_role_menu` VALUES ('10040144013', '00025143216', 'transYsh');
INSERT INTO `sys_role_menu` VALUES ('10040144014', '00025143216', 'transYsh_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('10040144015', '00025143216', 'transYsh_delete');
INSERT INTO `sys_role_menu` VALUES ('10040144016', '00025143216', 'transYsh_update');
INSERT INTO `sys_role_menu` VALUES ('10060238050', '140000100215', '1');
INSERT INTO `sys_role_menu` VALUES ('10060238051', '140000100215', 'merchant_1002');
INSERT INTO `sys_role_menu` VALUES ('10060238052', '140000100215', 'userMerchant');
INSERT INTO `sys_role_menu` VALUES ('10060238053', '140000100215', 'userMerchant_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('10060238054', '140000100215', 'userMerchant_delete');
INSERT INTO `sys_role_menu` VALUES ('10060238055', '140000100215', 'userMerchant_update');
INSERT INTO `sys_role_menu` VALUES ('10060238056', '140000100215', 'userMerchant_insert');
INSERT INTO `sys_role_menu` VALUES ('10060238057', '140000100215', 'userMerchant_detailPage');
INSERT INTO `sys_role_menu` VALUES ('10060238058', '140000100215', 'userMerchant_editPage');
INSERT INTO `sys_role_menu` VALUES ('10060238059', '140000100215', 'userMerchant_addPage');
INSERT INTO `sys_role_menu` VALUES ('100602380510', '140000100215', 'userMerchant_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('100602380511', '140000100215', 'userMerchant_listPage');
INSERT INTO `sys_role_menu` VALUES ('100602380512', '140000100215', 'confUserFee');
INSERT INTO `sys_role_menu` VALUES ('100602380513', '140000100215', 'confUserFee_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('100602380514', '140000100215', 'confUserFee_delete');
INSERT INTO `sys_role_menu` VALUES ('100602380515', '140000100215', 'confUserFee_update');
INSERT INTO `sys_role_menu` VALUES ('100602380516', '140000100215', 'confUserFee_insert');
INSERT INTO `sys_role_menu` VALUES ('100602380517', '140000100215', 'confUserFee_detailPage');
INSERT INTO `sys_role_menu` VALUES ('100602380518', '140000100215', 'confUserFee_editPage');
INSERT INTO `sys_role_menu` VALUES ('100602380519', '140000100215', 'confUserFee_addPage');
INSERT INTO `sys_role_menu` VALUES ('100602380520', '140000100215', 'confUserFee_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('100602380521', '140000100215', 'confUserFee_listPage');
INSERT INTO `sys_role_menu` VALUES ('100602380522', '140000100215', 'confBankAccount');
INSERT INTO `sys_role_menu` VALUES ('100602380523', '140000100215', 'confBankAccount_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('100602380524', '140000100215', 'confBankAccount_delete');
INSERT INTO `sys_role_menu` VALUES ('100602380525', '140000100215', 'confBankAccount_update');
INSERT INTO `sys_role_menu` VALUES ('100602380526', '140000100215', 'confBankAccount_insert');
INSERT INTO `sys_role_menu` VALUES ('100602380527', '140000100215', 'confBankAccount_detailPage');
INSERT INTO `sys_role_menu` VALUES ('100602380528', '140000100215', 'confBankAccount_editPage');
INSERT INTO `sys_role_menu` VALUES ('100602380529', '140000100215', 'confBankAccount_addPage');
INSERT INTO `sys_role_menu` VALUES ('100602380530', '140000100215', 'confBankAccount_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('100602380531', '140000100215', 'confBankAccount_listPage');
INSERT INTO `sys_role_menu` VALUES ('100602380532', '140000100215', 'user');
INSERT INTO `sys_role_menu` VALUES ('100602380533', '140000100215', 'userAgent');
INSERT INTO `sys_role_menu` VALUES ('100602380534', '140000100215', 'userAgent_detailPage');
INSERT INTO `sys_role_menu` VALUES ('100602380535', '140000100215', 'userAgent_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('100602380536', '140000100215', 'userAgent_delete');
INSERT INTO `sys_role_menu` VALUES ('100602380537', '140000100215', 'userAgent_update');
INSERT INTO `sys_role_menu` VALUES ('100602380538', '140000100215', 'userAgent_insert');
INSERT INTO `sys_role_menu` VALUES ('100602380539', '140000100215', 'userAgent_editPage');
INSERT INTO `sys_role_menu` VALUES ('100602380540', '140000100215', 'userAgent_addPage');
INSERT INTO `sys_role_menu` VALUES ('100602380541', '140000100215', 'userAgent_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('100602380542', '140000100215', 'userAgent_listPage');
INSERT INTO `sys_role_menu` VALUES ('100602380543', '140000100215', '10060100006');
INSERT INTO `sys_role_menu` VALUES ('100602380544', '140000100215', '00040050015');
INSERT INTO `sys_role_menu` VALUES ('100602380545', '140000100215', 'userCustomer');
INSERT INTO `sys_role_menu` VALUES ('100602380546', '140000100215', 'userCustomer_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('100602380547', '140000100215', 'userCustomer_delete');
INSERT INTO `sys_role_menu` VALUES ('100602380548', '140000100215', 'userCustomer_update');
INSERT INTO `sys_role_menu` VALUES ('100602380549', '140000100215', 'userCustomer_insert');
INSERT INTO `sys_role_menu` VALUES ('100602380550', '140000100215', 'userCustomer_detailPage');
INSERT INTO `sys_role_menu` VALUES ('100602380551', '140000100215', 'userCustomer_editPage');
INSERT INTO `sys_role_menu` VALUES ('100602380552', '140000100215', 'userCustomer_addPage');
INSERT INTO `sys_role_menu` VALUES ('100602380553', '140000100215', 'userCustomer_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('100602380554', '140000100215', 'userCustomer_listPage');
INSERT INTO `sys_role_menu` VALUES ('100602380555', '140000100215', 'glAccount');
INSERT INTO `sys_role_menu` VALUES ('100602380556', '140000100215', 'glAccount_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('100602380557', '140000100215', 'glAccount_delete');
INSERT INTO `sys_role_menu` VALUES ('100602380558', '140000100215', 'glAccount_update');
INSERT INTO `sys_role_menu` VALUES ('100602380559', '140000100215', 'glAccount_insert');
INSERT INTO `sys_role_menu` VALUES ('100602380560', '140000100215', 'glAccount_detailPage');
INSERT INTO `sys_role_menu` VALUES ('100602380561', '140000100215', 'glAccount_editPage');
INSERT INTO `sys_role_menu` VALUES ('100602380562', '140000100215', 'glAccount_addPage');
INSERT INTO `sys_role_menu` VALUES ('100602380563', '140000100215', 'glAccount_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('100602380564', '140000100215', 'glAccount_listPage');
INSERT INTO `sys_role_menu` VALUES ('100602380565', '140000100215', 'glAccountDetail');
INSERT INTO `sys_role_menu` VALUES ('100602380566', '140000100215', 'glAccountDetail_delete');
INSERT INTO `sys_role_menu` VALUES ('100602380567', '140000100215', 'glAccountDetail_update');
INSERT INTO `sys_role_menu` VALUES ('100602380568', '140000100215', 'glAccountDetail_insert');
INSERT INTO `sys_role_menu` VALUES ('14100902074756', '000003101208148018', '1406082000154');
INSERT INTO `sys_role_menu` VALUES ('14100902074757', '000003101208148018', '100840310044');
INSERT INTO `sys_role_menu` VALUES ('14100902074758', '000003101208148018', '1000000400848');
INSERT INTO `sys_role_menu` VALUES ('14100902074759', '000003101208148018', '1000000400804');
INSERT INTO `sys_role_menu` VALUES ('14100902074760', '000003101208148018', '1000000400826');
INSERT INTO `sys_role_menu` VALUES ('14100902074761', '000003101208148018', '1000000000859');
INSERT INTO `sys_role_menu` VALUES ('14100902074762', '000003101208148018', '1000000004870');
INSERT INTO `sys_role_menu` VALUES ('14100902074763', '000003101208148018', '100840305080');
INSERT INTO `sys_role_menu` VALUES ('14100902074764', '000003101208148018', '100840401092');
INSERT INTO `sys_role_menu` VALUES ('14100902074765', '000003101208148018', '100840311086');
INSERT INTO `sys_role_menu` VALUES ('14100902074766', '000003101208148018', '100840401098');
INSERT INTO `sys_role_menu` VALUES ('14100902074767', '000003101208148018', '100200044284');
INSERT INTO `sys_role_menu` VALUES ('14100902074768', '000003101208148018', '1000000000892');
INSERT INTO `sys_role_menu` VALUES ('14100902074769', '000003101208148018', '1000001004903');
INSERT INTO `sys_role_menu` VALUES ('1410220100511', '000003101402422212', '1');
INSERT INTO `sys_role_menu` VALUES ('1410220100512', '000003101402422212', 'merchant_1002');
INSERT INTO `sys_role_menu` VALUES ('1410220100513', '000003101402422212', 'userMerchant');
INSERT INTO `sys_role_menu` VALUES ('1410220100514', '000003101402422212', 'userMerchant_insert');
INSERT INTO `sys_role_menu` VALUES ('1410220100515', '000003101402422212', 'userMerchant_update');
INSERT INTO `sys_role_menu` VALUES ('1410220100516', '000003101402422212', 'userMerchant_listPage');
INSERT INTO `sys_role_menu` VALUES ('1410220100517', '000003101402422212', 'userMerchant_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('1410220100518', '000003101402422212', 'userMerchant_addPage');
INSERT INTO `sys_role_menu` VALUES ('1410220100519', '000003101402422212', 'userMerchant_editPage');
INSERT INTO `sys_role_menu` VALUES ('1410220100520', '000003101402422212', 'userMerchant_detailPage');
INSERT INTO `sys_role_menu` VALUES ('1410220100521', '000003101402422212', 'confUserFee');
INSERT INTO `sys_role_menu` VALUES ('1410220100522', '000003101402422212', 'confUserFee_listPage');
INSERT INTO `sys_role_menu` VALUES ('1410220100523', '000003101402422212', 'confUserFee_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('1410220100524', '000003101402422212', 'confUserFee_addPage');
INSERT INTO `sys_role_menu` VALUES ('1410220100525', '000003101402422212', 'confUserFee_editPage');
INSERT INTO `sys_role_menu` VALUES ('1410220100526', '000003101402422212', 'confUserFee_detailPage');
INSERT INTO `sys_role_menu` VALUES ('1410220100527', '000003101402422212', 'confUserFee_insert');
INSERT INTO `sys_role_menu` VALUES ('1410220100528', '000003101402422212', 'confUserFee_update');
INSERT INTO `sys_role_menu` VALUES ('1410220100529', '000003101402422212', 'confBankAccount');
INSERT INTO `sys_role_menu` VALUES ('1410220100530', '000003101402422212', 'confBankAccount_listPage');
INSERT INTO `sys_role_menu` VALUES ('1410220100531', '000003101402422212', 'confBankAccount_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('1410220100532', '000003101402422212', 'confBankAccount_addPage');
INSERT INTO `sys_role_menu` VALUES ('1410220100533', '000003101402422212', 'confBankAccount_editPage');
INSERT INTO `sys_role_menu` VALUES ('1410220100534', '000003101402422212', 'confBankAccount_detailPage');
INSERT INTO `sys_role_menu` VALUES ('1410220100535', '000003101402422212', 'confBankAccount_insert');
INSERT INTO `sys_role_menu` VALUES ('1410220100536', '000003101402422212', 'confBankAccount_update');
INSERT INTO `sys_role_menu` VALUES ('1410220100537', '000003101402422212', 'userManagerInfo');
INSERT INTO `sys_role_menu` VALUES ('1410220100538', '000003101402422212', 'userManagerInfo_listPage');
INSERT INTO `sys_role_menu` VALUES ('1410220100539', '000003101402422212', 'userManagerInfo_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('1410220100540', '000003101402422212', 'userManagerInfo_addPage');
INSERT INTO `sys_role_menu` VALUES ('1410220100541', '000003101402422212', 'userManagerInfo_editPage');
INSERT INTO `sys_role_menu` VALUES ('1410220100542', '000003101402422212', 'userManagerInfo_detailPage');
INSERT INTO `sys_role_menu` VALUES ('1410220100543', '000003101402422212', 'userManagerInfo_insert');
INSERT INTO `sys_role_menu` VALUES ('1410220100544', '000003101402422212', 'userManagerInfo_update');
INSERT INTO `sys_role_menu` VALUES ('1410220100545', '000003101402422212', 'rptMerchantJs');
INSERT INTO `sys_role_menu` VALUES ('1410220100546', '000003101402422212', 'rptMerchantJs_listPage');
INSERT INTO `sys_role_menu` VALUES ('1410220100547', '000003101402422212', 'rptMerchantJs_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('1410220100548', '000003101402422212', 'rptMerchantJs_addPage');
INSERT INTO `sys_role_menu` VALUES ('1410220100549', '000003101402422212', 'rptMerchantJs_editPage');
INSERT INTO `sys_role_menu` VALUES ('1410220100550', '000003101402422212', 'rptMerchantJs_detailPage');
INSERT INTO `sys_role_menu` VALUES ('1410220100551', '000003101402422212', 'rptMerchantJs_insert');
INSERT INTO `sys_role_menu` VALUES ('1410220100552', '000003101402422212', 'rptMerchantJs_update');
INSERT INTO `sys_role_menu` VALUES ('1410220100553', '000003101402422212', 'user');
INSERT INTO `sys_role_menu` VALUES ('1410220100554', '000003101402422212', 'userAgent');
INSERT INTO `sys_role_menu` VALUES ('1410220100555', '000003101402422212', 'userAgent_detailPage');
INSERT INTO `sys_role_menu` VALUES ('1410220100556', '000003101402422212', 'userAgent_listPage');
INSERT INTO `sys_role_menu` VALUES ('1410220100557', '000003101402422212', 'userAgent_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('1410220100558', '000003101402422212', 'userAgent_addPage');
INSERT INTO `sys_role_menu` VALUES ('1410220100559', '000003101402422212', 'userAgent_editPage');
INSERT INTO `sys_role_menu` VALUES ('1410220100560', '000003101402422212', 'userAgent_insert');
INSERT INTO `sys_role_menu` VALUES ('1410220100561', '000003101402422212', 'userAgent_update');
INSERT INTO `sys_role_menu` VALUES ('1410220100562', '000003101402422212', '00040050015');
INSERT INTO `sys_role_menu` VALUES ('1410220100563', '000003101402422212', 'userCustomer');
INSERT INTO `sys_role_menu` VALUES ('1410220100564', '000003101402422212', 'userCustomer_listPage');
INSERT INTO `sys_role_menu` VALUES ('1410220100565', '000003101402422212', 'userCustomer_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('1410220100566', '000003101402422212', 'userCustomer_addPage');
INSERT INTO `sys_role_menu` VALUES ('1410220100567', '000003101402422212', 'userCustomer_editPage');
INSERT INTO `sys_role_menu` VALUES ('1410220100568', '000003101402422212', 'userCustomer_detailPage');
INSERT INTO `sys_role_menu` VALUES ('000804100461', '00000314081000020', '00002000021');
INSERT INTO `sys_role_menu` VALUES ('000804100462', '00000314081000020', 'user');
INSERT INTO `sys_role_menu` VALUES ('000804100463', '00000314081000020', 'userAgent');
INSERT INTO `sys_role_menu` VALUES ('000804100464', '00000314081000020', 'userAgent_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('000804100465', '00000314081000020', 'userAgent_delete');
INSERT INTO `sys_role_menu` VALUES ('000804100466', '00000314081000020', 'userAgent_update');
INSERT INTO `sys_role_menu` VALUES ('000804100467', '00000314081000020', 'userAgent_insert');
INSERT INTO `sys_role_menu` VALUES ('000804100468', '00000314081000020', 'userAgent_editPage');
INSERT INTO `sys_role_menu` VALUES ('000804100469', '00000314081000020', 'userAgent_addPage');
INSERT INTO `sys_role_menu` VALUES ('000804100470', '00000314081000020', 'userAgent_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('000804100471', '00000314081000020', 'userAgent_listPage');
INSERT INTO `sys_role_menu` VALUES ('000804100472', '00000314081000020', 'userAgent_detailPage');
INSERT INTO `sys_role_menu` VALUES ('000804100473', '00000314081000020', '10060100006');
INSERT INTO `sys_role_menu` VALUES ('000804100474', '00000314081000020', '00040050015');
INSERT INTO `sys_role_menu` VALUES ('000804100475', '00000314081000020', 'userCustomer');
INSERT INTO `sys_role_menu` VALUES ('000804100476', '00000314081000020', 'userCustomer_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('000804100477', '00000314081000020', 'userCustomer_delete');
INSERT INTO `sys_role_menu` VALUES ('000804100478', '00000314081000020', 'userCustomer_update');
INSERT INTO `sys_role_menu` VALUES ('000804100479', '00000314081000020', 'userCustomer_insert');
INSERT INTO `sys_role_menu` VALUES ('000804100480', '00000314081000020', 'userCustomer_detailPage');
INSERT INTO `sys_role_menu` VALUES ('000804100481', '00000314081000020', 'userCustomer_editPage');
INSERT INTO `sys_role_menu` VALUES ('000804100482', '00000314081000020', 'userCustomer_addPage');
INSERT INTO `sys_role_menu` VALUES ('000804100483', '00000314081000020', 'userCustomer_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('000804100484', '00000314081000020', 'userCustomer_listPage');
INSERT INTO `sys_role_menu` VALUES ('000804100485', '00000314081000020', 'glAccount');
INSERT INTO `sys_role_menu` VALUES ('000804100486', '00000314081000020', 'glAccount_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('000804100487', '00000314081000020', 'glAccount_delete');
INSERT INTO `sys_role_menu` VALUES ('000804100488', '00000314081000020', 'glAccount_update');
INSERT INTO `sys_role_menu` VALUES ('000804100489', '00000314081000020', 'glAccount_insert');
INSERT INTO `sys_role_menu` VALUES ('000804100490', '00000314081000020', 'glAccount_detailPage');
INSERT INTO `sys_role_menu` VALUES ('000804100491', '00000314081000020', 'glAccount_editPage');
INSERT INTO `sys_role_menu` VALUES ('000804100492', '00000314081000020', 'glAccount_addPage');
INSERT INTO `sys_role_menu` VALUES ('000804100493', '00000314081000020', 'glAccount_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('000804100494', '00000314081000020', 'glAccount_listPage');
INSERT INTO `sys_role_menu` VALUES ('000804100495', '00000314081000020', 'glAccountDetail');
INSERT INTO `sys_role_menu` VALUES ('000804100496', '00000314081000020', 'glAccountDetail_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('000804100497', '00000314081000020', 'glAccountDetail_delete');
INSERT INTO `sys_role_menu` VALUES ('000804100498', '00000314081000020', 'glAccountDetail_update');
INSERT INTO `sys_role_menu` VALUES ('000804100499', '00000314081000020', 'glAccountDetail_insert');
INSERT INTO `sys_role_menu` VALUES ('000804100500', '00000314081000020', 'glAccountDetail_detailPage');
INSERT INTO `sys_role_menu` VALUES ('000804100501', '00000314081000020', 'glAccountDetail_editPage');
INSERT INTO `sys_role_menu` VALUES ('000804100502', '00000314081000020', 'glAccountDetail_addPage');
INSERT INTO `sys_role_menu` VALUES ('000804100503', '00000314081000020', 'glAccountDetail_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('000804100504', '00000314081000020', 'glAccountDetail_listPage');
INSERT INTO `sys_role_menu` VALUES ('000804100505', '00000314081000020', 'glRecharge');
INSERT INTO `sys_role_menu` VALUES ('000804100506', '00000314081000020', 'glRecharge_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('000804100507', '00000314081000020', 'glRecharge_delete');
INSERT INTO `sys_role_menu` VALUES ('000804100508', '00000314081000020', 'glRecharge_update');
INSERT INTO `sys_role_menu` VALUES ('000804100509', '00000314081000020', 'glRecharge_insert');
INSERT INTO `sys_role_menu` VALUES ('000804100510', '00000314081000020', 'glRecharge_detailPage');
INSERT INTO `sys_role_menu` VALUES ('000804100511', '00000314081000020', 'glRecharge_editPage');
INSERT INTO `sys_role_menu` VALUES ('000804100512', '00000314081000020', 'glRecharge_addPage');
INSERT INTO `sys_role_menu` VALUES ('000804100513', '00000314081000020', 'glRecharge_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('000804100514', '00000314081000020', 'glRecharge_listPage');
INSERT INTO `sys_role_menu` VALUES ('1410220100569', '000003101402422212', 'userCustomer_insert');
INSERT INTO `sys_role_menu` VALUES ('1410220100570', '000003101402422212', 'userCustomer_update');
INSERT INTO `sys_role_menu` VALUES ('1410220100571', '000003101402422212', 'glAccount');
INSERT INTO `sys_role_menu` VALUES ('000804100515', '00000314081000020', '100000208181');
INSERT INTO `sys_role_menu` VALUES ('000804100516', '00000314081000020', '1000504016');
INSERT INTO `sys_role_menu` VALUES ('000804100517', '00000314081000020', '100200046273');
INSERT INTO `sys_role_menu` VALUES ('000804100518', '00000314081000020', '00002442084');
INSERT INTO `sys_role_menu` VALUES ('000804100519', '00000314081000020', '00002440683');
INSERT INTO `sys_role_menu` VALUES ('000804100520', '00000314081000020', '00002440082');
INSERT INTO `sys_role_menu` VALUES ('000804100521', '00000314081000020', '00002440681');
INSERT INTO `sys_role_menu` VALUES ('000804100522', '00000314081000020', '00002442379');
INSERT INTO `sys_role_menu` VALUES ('000804100523', '00000314081000020', '00002442777');
INSERT INTO `sys_role_menu` VALUES ('000804100524', '00000314081000020', '00002442376');
INSERT INTO `sys_role_menu` VALUES ('000804100525', '00000314081000020', '00002440075');
INSERT INTO `sys_role_menu` VALUES ('000804100526', '00000314081000020', '00002440073');
INSERT INTO `sys_role_menu` VALUES ('000804100527', '00000314081000020', 'trans');
INSERT INTO `sys_role_menu` VALUES ('000804100528', '00000314081000020', 'transYsh');
INSERT INTO `sys_role_menu` VALUES ('000804100529', '00000314081000020', 'transYsh_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('000804100530', '00000314081000020', 'transYsh_delete');
INSERT INTO `sys_role_menu` VALUES ('000804100531', '00000314081000020', 'transYsh_update');
INSERT INTO `sys_role_menu` VALUES ('000804100532', '00000314081000020', 'transYsh_insert');
INSERT INTO `sys_role_menu` VALUES ('000804100533', '00000314081000020', 'transYsh_detailPage');
INSERT INTO `sys_role_menu` VALUES ('000804100534', '00000314081000020', 'transYsh_editPage');
INSERT INTO `sys_role_menu` VALUES ('000804100535', '00000314081000020', 'transYsh_addPage');
INSERT INTO `sys_role_menu` VALUES ('000804100536', '00000314081000020', 'transYsh_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('000804100537', '00000314081000020', 'transYsh_listPage');
INSERT INTO `sys_role_menu` VALUES ('000804100538', '00000314081000020', '000000201049');
INSERT INTO `sys_role_menu` VALUES ('000804100539', '00000314081000020', 'yshProgram');
INSERT INTO `sys_role_menu` VALUES ('000804100540', '00000314081000020', 'yshProgram_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('000804100541', '00000314081000020', 'yshProgram_delete');
INSERT INTO `sys_role_menu` VALUES ('000804100542', '00000314081000020', 'yshProgram_update');
INSERT INTO `sys_role_menu` VALUES ('000804100543', '00000314081000020', 'yshProgram_insert');
INSERT INTO `sys_role_menu` VALUES ('000804100544', '00000314081000020', 'yshProgram_detailPage');
INSERT INTO `sys_role_menu` VALUES ('000804100545', '00000314081000020', 'yshProgram_editPage');
INSERT INTO `sys_role_menu` VALUES ('000804100546', '00000314081000020', 'yshProgram_addPage');
INSERT INTO `sys_role_menu` VALUES ('000804100547', '00000314081000020', 'yshProgram_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('000804100548', '00000314081000020', 'yshProgram_listPage');
INSERT INTO `sys_role_menu` VALUES ('000804100549', '00000314081000020', 'coupons');
INSERT INTO `sys_role_menu` VALUES ('000804100550', '00000314081000020', 'yshCoupon1');
INSERT INTO `sys_role_menu` VALUES ('000804100551', '00000314081000020', 'yshCoupon2');
INSERT INTO `sys_role_menu` VALUES ('000804100552', '00000314081000020', 'yshCoupon3');
INSERT INTO `sys_role_menu` VALUES ('000804100553', '00000314081000020', 'yshCoupon');
INSERT INTO `sys_role_menu` VALUES ('000804100554', '00000314081000020', 'yshCoupon_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('000804100555', '00000314081000020', 'yshCoupon_delete');
INSERT INTO `sys_role_menu` VALUES ('000804100556', '00000314081000020', 'yshCoupon_update');
INSERT INTO `sys_role_menu` VALUES ('000804100557', '00000314081000020', 'yshCoupon_insert');
INSERT INTO `sys_role_menu` VALUES ('000804100558', '00000314081000020', 'yshCoupon_detailPage');
INSERT INTO `sys_role_menu` VALUES ('000804100559', '00000314081000020', 'yshCoupon_editPage');
INSERT INTO `sys_role_menu` VALUES ('000804100560', '00000314081000020', 'yshCoupon_addPage');
INSERT INTO `sys_role_menu` VALUES ('000804100561', '00000314081000020', 'yshCoupon_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('000804100562', '00000314081000020', 'yshCoupon_listPage');
INSERT INTO `sys_role_menu` VALUES ('000804100563', '00000314081000020', 'confBankCoupon');
INSERT INTO `sys_role_menu` VALUES ('000804100564', '00000314081000020', 'base');
INSERT INTO `sys_role_menu` VALUES ('000804100565', '00000314081000020', 'baseBusinessType');
INSERT INTO `sys_role_menu` VALUES ('000804100566', '00000314081000020', 'baseBusinessType_update');
INSERT INTO `sys_role_menu` VALUES ('000804100567', '00000314081000020', 'baseBusinessType_insert');
INSERT INTO `sys_role_menu` VALUES ('000804100568', '00000314081000020', 'baseBusinessType_detailPage');
INSERT INTO `sys_role_menu` VALUES ('000804100569', '00000314081000020', 'baseBusinessType_editPage');
INSERT INTO `sys_role_menu` VALUES ('000804100570', '00000314081000020', 'baseBusinessType_addPage');
INSERT INTO `sys_role_menu` VALUES ('000804100571', '00000314081000020', 'baseBusinessType_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('000804100572', '00000314081000020', 'baseBusinessType_listPage');
INSERT INTO `sys_role_menu` VALUES ('000804100573', '00000314081000020', 'baseBusinessType_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('000804100574', '00000314081000020', 'baseBusinessType_delete');
INSERT INTO `sys_role_menu` VALUES ('000804100575', '00000314081000020', 'baseBusinessArea');
INSERT INTO `sys_role_menu` VALUES ('000804100576', '00000314081000020', 'system');
INSERT INTO `sys_role_menu` VALUES ('000804100577', '00000314081000020', 'baseNotice');
INSERT INTO `sys_role_menu` VALUES ('000804100578', '00000314081000020', 'system_priv');
INSERT INTO `sys_role_menu` VALUES ('000804100579', '00000314081000020', 'system_priv_user');
INSERT INTO `sys_role_menu` VALUES ('000804100580', '00000314081000020', 'system_priv_role');
INSERT INTO `sys_role_menu` VALUES ('000804100581', '00000314081000020', 'system_priv_log');
INSERT INTO `sys_role_menu` VALUES ('1410220100572', '000003101402422212', 'glAccount_listPage');
INSERT INTO `sys_role_menu` VALUES ('1410220100573', '000003101402422212', 'glAccount_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('1410220100574', '000003101402422212', 'glAccount_addPage');
INSERT INTO `sys_role_menu` VALUES ('1410220100575', '000003101402422212', 'glAccount_editPage');
INSERT INTO `sys_role_menu` VALUES ('1410220100576', '000003101402422212', 'glAccount_detailPage');
INSERT INTO `sys_role_menu` VALUES ('1410220100577', '000003101402422212', 'glAccount_insert');
INSERT INTO `sys_role_menu` VALUES ('1410220100578', '000003101402422212', 'glAccount_update');
INSERT INTO `sys_role_menu` VALUES ('1410220100579', '000003101402422212', 'glAccountDetail');
INSERT INTO `sys_role_menu` VALUES ('1410220100580', '000003101402422212', 'glAccountDetail_listPage');
INSERT INTO `sys_role_menu` VALUES ('1410220100581', '000003101402422212', 'glAccountDetail_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('1410220100582', '000003101402422212', 'glAccountDetail_addPage');
INSERT INTO `sys_role_menu` VALUES ('1410220100583', '000003101402422212', 'glAccountDetail_editPage');
INSERT INTO `sys_role_menu` VALUES ('1410220100584', '000003101402422212', 'glAccountDetail_detailPage');
INSERT INTO `sys_role_menu` VALUES ('1410220100585', '000003101402422212', 'glAccountDetail_insert');
INSERT INTO `sys_role_menu` VALUES ('1410220100586', '000003101402422212', 'glAccountDetail_update');
INSERT INTO `sys_role_menu` VALUES ('1410220100587', '000003101402422212', 'glRecharge');
INSERT INTO `sys_role_menu` VALUES ('1410220100588', '000003101402422212', 'glRecharge_listPage');
INSERT INTO `sys_role_menu` VALUES ('1410220100589', '000003101402422212', 'glRecharge_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('1410220100590', '000003101402422212', 'glRecharge_addPage');
INSERT INTO `sys_role_menu` VALUES ('1410220100591', '000003101402422212', 'glRecharge_editPage');
INSERT INTO `sys_role_menu` VALUES ('1410220100592', '000003101402422212', 'glRecharge_detailPage');
INSERT INTO `sys_role_menu` VALUES ('1410220100593', '000003101402422212', 'glRecharge_insert');
INSERT INTO `sys_role_menu` VALUES ('1410220100594', '000003101402422212', 'glRecharge_update');
INSERT INTO `sys_role_menu` VALUES ('1410220100595', '000003101402422212', 'trans');
INSERT INTO `sys_role_menu` VALUES ('1410220100596', '000003101402422212', 'transYsh');
INSERT INTO `sys_role_menu` VALUES ('1410220100597', '000003101402422212', 'transYsh_listPage');
INSERT INTO `sys_role_menu` VALUES ('1410220100598', '000003101402422212', 'transYsh_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('1410220100599', '000003101402422212', 'transYsh_addPage');
INSERT INTO `sys_role_menu` VALUES ('1410220100600', '000003101402422212', 'transYsh_editPage');
INSERT INTO `sys_role_menu` VALUES ('1410220100601', '000003101402422212', 'transYsh_detailPage');
INSERT INTO `sys_role_menu` VALUES ('1410220100602', '000003101402422212', 'transYsh_insert');
INSERT INTO `sys_role_menu` VALUES ('1410220100603', '000003101402422212', 'transYsh_update');
INSERT INTO `sys_role_menu` VALUES ('1410220100604', '000003101402422212', '0000200006');
INSERT INTO `sys_role_menu` VALUES ('1410220100605', '000003101402422212', '00002000013');
INSERT INTO `sys_role_menu` VALUES ('1410220100606', '000003101402422212', '00002000014');
INSERT INTO `sys_role_menu` VALUES ('1410220100607', '000003101402422212', '000000201049');
INSERT INTO `sys_role_menu` VALUES ('1410220100608', '000003101402422212', 'yshProgram');
INSERT INTO `sys_role_menu` VALUES ('1410220100609', '000003101402422212', 'yshProgram_listPage');
INSERT INTO `sys_role_menu` VALUES ('1410220100610', '000003101402422212', 'yshProgram_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('1410220100611', '000003101402422212', 'yshProgram_addPage');
INSERT INTO `sys_role_menu` VALUES ('1410220100612', '000003101402422212', 'yshProgram_editPage');
INSERT INTO `sys_role_menu` VALUES ('1410220100613', '000003101402422212', 'yshProgram_detailPage');
INSERT INTO `sys_role_menu` VALUES ('1410220100614', '000003101402422212', 'yshProgram_insert');
INSERT INTO `sys_role_menu` VALUES ('1410220100615', '000003101402422212', 'yshProgram_update');
INSERT INTO `sys_role_menu` VALUES ('1410220100616', '000003101402422212', 'coupons');
INSERT INTO `sys_role_menu` VALUES ('1410220100617', '000003101402422212', 'yshCoupon1');
INSERT INTO `sys_role_menu` VALUES ('1410220100618', '000003101402422212', 'yshCoupon2');
INSERT INTO `sys_role_menu` VALUES ('1410220100619', '000003101402422212', 'yshCoupon3');
INSERT INTO `sys_role_menu` VALUES ('1410220100620', '000003101402422212', 'yshCoupon');
INSERT INTO `sys_role_menu` VALUES ('1410220100621', '000003101402422212', 'yshCoupon_listPage');
INSERT INTO `sys_role_menu` VALUES ('1410220100622', '000003101402422212', 'yshCoupon_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('1410220100623', '000003101402422212', 'yshCoupon_addPage');
INSERT INTO `sys_role_menu` VALUES ('1410220100624', '000003101402422212', 'yshCoupon_editPage');
INSERT INTO `sys_role_menu` VALUES ('1410220100625', '000003101402422212', 'yshCoupon_detailPage');
INSERT INTO `sys_role_menu` VALUES ('1410220100626', '000003101402422212', 'yshCoupon_insert');
INSERT INTO `sys_role_menu` VALUES ('1410220100627', '000003101402422212', 'yshCoupon_update');
INSERT INTO `sys_role_menu` VALUES ('1410220100628', '000003101402422212', 'confBankCoupon');
INSERT INTO `sys_role_menu` VALUES ('1410220100629', '000003101402422212', 'base');
INSERT INTO `sys_role_menu` VALUES ('1410220100630', '000003101402422212', 'baseBusinessArea');
INSERT INTO `sys_role_menu` VALUES ('1410220100631', '000003101402422212', 'system');
INSERT INTO `sys_role_menu` VALUES ('1410220100632', '000003101402422212', 'baseNotice');
INSERT INTO `sys_role_menu` VALUES ('1001402120501', '0000031411100903', 'confBankAccount_addPage');
INSERT INTO `sys_role_menu` VALUES ('100402003125', '00021000000', 'userMerchant_delete');
INSERT INTO `sys_role_menu` VALUES ('100402003126', '00021000000', 'userMerchant_update');
INSERT INTO `sys_role_menu` VALUES ('100402003127', '00021000000', 'userMerchant_insert');
INSERT INTO `sys_role_menu` VALUES ('100402003128', '00021000000', 'userMerchant_detailPage');
INSERT INTO `sys_role_menu` VALUES ('100402003129', '00021000000', 'userMerchant_editPage');
INSERT INTO `sys_role_menu` VALUES ('100402003130', '00021000000', 'userMerchant_addPage');
INSERT INTO `sys_role_menu` VALUES ('1409801742', '00000310000000070', '1');
INSERT INTO `sys_role_menu` VALUES ('1409801743', '00000310000000070', 'merchant_1002');
INSERT INTO `sys_role_menu` VALUES ('1409801744', '00000310000000070', 'userMerchant');
INSERT INTO `sys_role_menu` VALUES ('1409801745', '00000310000000070', 'userMerchant_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('1409801746', '00000310000000070', 'userMerchant_delete');
INSERT INTO `sys_role_menu` VALUES ('1409801747', '00000310000000070', 'userMerchant_update');
INSERT INTO `sys_role_menu` VALUES ('1001402120502', '0000031411100903', 'confBankAccount_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('14100100117', '0000050401010065', '1406082000154');
INSERT INTO `sys_role_menu` VALUES ('14100100118', '0000050401010065', '100840310044');
INSERT INTO `sys_role_menu` VALUES ('14100100119', '0000050401010065', '1000000400848');
INSERT INTO `sys_role_menu` VALUES ('14100100120', '0000050401010065', '1000000400804');
INSERT INTO `sys_role_menu` VALUES ('14100100121', '0000050401010065', '1000000400826');
INSERT INTO `sys_role_menu` VALUES ('14100100122', '0000050401010065', '1000000000859');
INSERT INTO `sys_role_menu` VALUES ('14100100123', '0000050401010065', '1000000004870');
INSERT INTO `sys_role_menu` VALUES ('14100100124', '0000050401010065', '100840305080');
INSERT INTO `sys_role_menu` VALUES ('1008010610264', '00000414005420809', '1');
INSERT INTO `sys_role_menu` VALUES ('1008010610265', '00000414005420809', 'system');
INSERT INTO `sys_role_menu` VALUES ('1008010610266', '00000414005420809', 'baseNotice');
INSERT INTO `sys_role_menu` VALUES ('1008010610267', '00000414005420809', 'system_priv');
INSERT INTO `sys_role_menu` VALUES ('1008010610268', '00000414005420809', 'system_priv_user');
INSERT INTO `sys_role_menu` VALUES ('1008010610269', '00000414005420809', 'system_priv_role');
INSERT INTO `sys_role_menu` VALUES ('1008010610270', '00000414005420809', 'system_priv_log');
INSERT INTO `sys_role_menu` VALUES ('1008010610271', '00000414005420809', 'system_conf');
INSERT INTO `sys_role_menu` VALUES ('1008010610272', '00000414005420809', 'system_conf_data');
INSERT INTO `sys_role_menu` VALUES ('1008010610273', '00000414005420809', 'sysPdlevel');
INSERT INTO `sys_role_menu` VALUES ('1008010610274', '00000414005420809', 'sysSystem');
INSERT INTO `sys_role_menu` VALUES ('1008010610275', '00000414005420809', 'system_conf_datatype');
INSERT INTO `sys_role_menu` VALUES ('1008010610276', '00000414005420809', '9');
INSERT INTO `sys_role_menu` VALUES ('1409801748', '00000310000000070', 'userMerchant_insert');
INSERT INTO `sys_role_menu` VALUES ('1409801749', '00000310000000070', 'userMerchant_detailPage');
INSERT INTO `sys_role_menu` VALUES ('1001402120503', '0000031411100903', 'confBankAccount_listPage');
INSERT INTO `sys_role_menu` VALUES ('14100100125', '0000050401010065', '100840401092');
INSERT INTO `sys_role_menu` VALUES ('14100100126', '0000050401010065', '100840311086');
INSERT INTO `sys_role_menu` VALUES ('14100100127', '0000050401010065', '100840401098');
INSERT INTO `sys_role_menu` VALUES ('14100100128', '0000050401010065', '100200044284');
INSERT INTO `sys_role_menu` VALUES ('14100100129', '0000050401010065', '1000000000892');
INSERT INTO `sys_role_menu` VALUES ('14100100130', '0000050401010065', '1000001004903');
INSERT INTO `sys_role_menu` VALUES ('100400003393', '100221016064', '1');
INSERT INTO `sys_role_menu` VALUES ('100400003394', '100221016064', 'user');
INSERT INTO `sys_role_menu` VALUES ('100400003395', '100221016064', 'userAgent');
INSERT INTO `sys_role_menu` VALUES ('100400003396', '100221016064', 'userAgent_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('100400003397', '100221016064', 'userAgent_delete');
INSERT INTO `sys_role_menu` VALUES ('100400003398', '100221016064', 'userAgent_update');
INSERT INTO `sys_role_menu` VALUES ('100400003399', '100221016064', 'userAgent_insert');
INSERT INTO `sys_role_menu` VALUES ('100400003400', '100221016064', 'userAgent_editPage');
INSERT INTO `sys_role_menu` VALUES ('100400003401', '100221016064', 'userAgent_addPage');
INSERT INTO `sys_role_menu` VALUES ('100400003402', '100221016064', 'userAgent_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('100400003403', '100221016064', 'userAgent_listPage');
INSERT INTO `sys_role_menu` VALUES ('100400003404', '100221016064', 'userAgent_detailPage');
INSERT INTO `sys_role_menu` VALUES ('100400003405', '100221016064', '0000200006');
INSERT INTO `sys_role_menu` VALUES ('100400003406', '100221016064', '00002000013');
INSERT INTO `sys_role_menu` VALUES ('100400003407', '100221016064', '00002000014');
INSERT INTO `sys_role_menu` VALUES ('100400003408', '100221016064', 'base');
INSERT INTO `sys_role_menu` VALUES ('100400003409', '100221016064', 'baseBusinessType');
INSERT INTO `sys_role_menu` VALUES ('100400003410', '100221016064', 'baseBusinessType_update');
INSERT INTO `sys_role_menu` VALUES ('100400003411', '100221016064', 'baseBusinessType_insert');
INSERT INTO `sys_role_menu` VALUES ('100400003412', '100221016064', 'baseBusinessType_detailPage');
INSERT INTO `sys_role_menu` VALUES ('100400003413', '100221016064', 'baseBusinessType_editPage');
INSERT INTO `sys_role_menu` VALUES ('100400003414', '100221016064', 'baseBusinessType_addPage');
INSERT INTO `sys_role_menu` VALUES ('100400003415', '100221016064', 'baseBusinessType_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('100400003416', '100221016064', 'baseBusinessType_listPage');
INSERT INTO `sys_role_menu` VALUES ('100400003417', '100221016064', 'baseBusinessType_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('100400003418', '100221016064', 'baseBusinessType_delete');
INSERT INTO `sys_role_menu` VALUES ('100400003419', '100221016064', 'baseBusinessArea');
INSERT INTO `sys_role_menu` VALUES ('100400003420', '100221016064', '1406082000154');
INSERT INTO `sys_role_menu` VALUES ('100400003421', '100221016064', '100840310044');
INSERT INTO `sys_role_menu` VALUES ('100400003422', '100221016064', '1000000400848');
INSERT INTO `sys_role_menu` VALUES ('100400003423', '100221016064', '1000000400804');
INSERT INTO `sys_role_menu` VALUES ('100400003424', '100221016064', '1000000400826');
INSERT INTO `sys_role_menu` VALUES ('100400003425', '100221016064', '1000000000859');
INSERT INTO `sys_role_menu` VALUES ('100400003426', '100221016064', '1000000004870');
INSERT INTO `sys_role_menu` VALUES ('100400003427', '100221016064', '100840305080');
INSERT INTO `sys_role_menu` VALUES ('100400003428', '100221016064', '100840401092');
INSERT INTO `sys_role_menu` VALUES ('100400003429', '100221016064', '100840311086');
INSERT INTO `sys_role_menu` VALUES ('100400003430', '100221016064', '100840401098');
INSERT INTO `sys_role_menu` VALUES ('100400003431', '100221016064', '100200044284');
INSERT INTO `sys_role_menu` VALUES ('100400003432', '100221016064', '1000000000892');
INSERT INTO `sys_role_menu` VALUES ('100400003433', '100221016064', '1000001004903');
INSERT INTO `sys_role_menu` VALUES ('100101006222', '1002211100149', '1406082020165');
INSERT INTO `sys_role_menu` VALUES ('100101006223', '1002211100149', '100618010321');
INSERT INTO `sys_role_menu` VALUES ('100101006224', '1002211100149', '100618019322');
INSERT INTO `sys_role_menu` VALUES ('100101006225', '1002211100149', '100650600122');
INSERT INTO `sys_role_menu` VALUES ('100101006226', '1002211100149', '100618000323');
INSERT INTO `sys_role_menu` VALUES ('100101006227', '1002211100149', '100618001324');
INSERT INTO `sys_role_menu` VALUES ('100402003131', '00021000000', 'userMerchant_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('100402003132', '00021000000', 'userMerchant_listPage');
INSERT INTO `sys_role_menu` VALUES ('100402003133', '00021000000', 'confUserFee');
INSERT INTO `sys_role_menu` VALUES ('100402003134', '00021000000', 'confUserFee_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('100402003135', '00021000000', 'confUserFee_delete');
INSERT INTO `sys_role_menu` VALUES ('100402003136', '00021000000', 'confUserFee_update');
INSERT INTO `sys_role_menu` VALUES ('100402003137', '00021000000', 'confUserFee_insert');
INSERT INTO `sys_role_menu` VALUES ('100402003138', '00021000000', 'confUserFee_detailPage');
INSERT INTO `sys_role_menu` VALUES ('100402003139', '00021000000', 'confUserFee_editPage');
INSERT INTO `sys_role_menu` VALUES ('100402003140', '00021000000', 'confUserFee_addPage');
INSERT INTO `sys_role_menu` VALUES ('100402003141', '00021000000', 'confUserFee_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('100402003142', '00021000000', 'confUserFee_listPage');
INSERT INTO `sys_role_menu` VALUES ('100402003143', '00021000000', 'confBankAccount');
INSERT INTO `sys_role_menu` VALUES ('100402003144', '00021000000', 'confBankAccount_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('100402003145', '00021000000', 'confBankAccount_delete');
INSERT INTO `sys_role_menu` VALUES ('100402003146', '00021000000', 'confBankAccount_update');
INSERT INTO `sys_role_menu` VALUES ('100402003147', '00021000000', 'confBankAccount_insert');
INSERT INTO `sys_role_menu` VALUES ('100402003148', '00021000000', 'confBankAccount_detailPage');
INSERT INTO `sys_role_menu` VALUES ('100402003149', '00021000000', 'confBankAccount_editPage');
INSERT INTO `sys_role_menu` VALUES ('100402003150', '00021000000', 'confBankAccount_addPage');
INSERT INTO `sys_role_menu` VALUES ('100402003151', '00021000000', 'confBankAccount_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('100402003152', '00021000000', 'confBankAccount_listPage');
INSERT INTO `sys_role_menu` VALUES ('100402003153', '00021000000', 'userManagerInfo');
INSERT INTO `sys_role_menu` VALUES ('100402003154', '00021000000', 'userManagerInfo_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('100402003155', '00021000000', 'userManagerInfo_delete');
INSERT INTO `sys_role_menu` VALUES ('100402003156', '00021000000', 'userManagerInfo_update');
INSERT INTO `sys_role_menu` VALUES ('100402003157', '00021000000', 'userManagerInfo_insert');
INSERT INTO `sys_role_menu` VALUES ('100402003158', '00021000000', 'userManagerInfo_detailPage');
INSERT INTO `sys_role_menu` VALUES ('100402003159', '00021000000', 'userManagerInfo_editPage');
INSERT INTO `sys_role_menu` VALUES ('100402003160', '00021000000', 'userManagerInfo_addPage');
INSERT INTO `sys_role_menu` VALUES ('100402003161', '00021000000', 'userManagerInfo_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('100402003162', '00021000000', 'userManagerInfo_listPage');
INSERT INTO `sys_role_menu` VALUES ('100402003163', '00021000000', 'rptMerchantJs');
INSERT INTO `sys_role_menu` VALUES ('100402003164', '00021000000', 'rptMerchantJs_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('000800152171', '0000071000009004', '1406082020165');
INSERT INTO `sys_role_menu` VALUES ('000800152172', '0000071000009004', '100618010321');
INSERT INTO `sys_role_menu` VALUES ('000800152173', '0000071000009004', '100618019322');
INSERT INTO `sys_role_menu` VALUES ('000800152174', '0000071000009004', '100618000323');
INSERT INTO `sys_role_menu` VALUES ('000800152175', '0000071000009004', '100618001324');
INSERT INTO `sys_role_menu` VALUES ('100402003165', '00021000000', 'rptMerchantJs_delete');
INSERT INTO `sys_role_menu` VALUES ('100402003166', '00021000000', 'rptMerchantJs_update');
INSERT INTO `sys_role_menu` VALUES ('100402003167', '00021000000', 'rptMerchantJs_insert');
INSERT INTO `sys_role_menu` VALUES ('100402003168', '00021000000', 'rptMerchantJs_detailPage');
INSERT INTO `sys_role_menu` VALUES ('100402003169', '00021000000', 'rptMerchantJs_editPage');
INSERT INTO `sys_role_menu` VALUES ('100402003170', '00021000000', 'rptMerchantJs_addPage');
INSERT INTO `sys_role_menu` VALUES ('100402003171', '00021000000', 'rptMerchantJs_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('100402003172', '00021000000', 'rptMerchantJs_listPage');
INSERT INTO `sys_role_menu` VALUES ('100402003173', '00021000000', 'user');
INSERT INTO `sys_role_menu` VALUES ('100402003174', '00021000000', 'userAgent');
INSERT INTO `sys_role_menu` VALUES ('100402003175', '00021000000', 'userAgent_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('100402003176', '00021000000', 'userAgent_delete');
INSERT INTO `sys_role_menu` VALUES ('100402003177', '00021000000', 'userAgent_update');
INSERT INTO `sys_role_menu` VALUES ('100402003178', '00021000000', 'userAgent_insert');
INSERT INTO `sys_role_menu` VALUES ('100402003179', '00021000000', 'userAgent_editPage');
INSERT INTO `sys_role_menu` VALUES ('100402003180', '00021000000', 'userAgent_addPage');
INSERT INTO `sys_role_menu` VALUES ('100402003181', '00021000000', 'userAgent_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('100402003182', '00021000000', 'userAgent_listPage');
INSERT INTO `sys_role_menu` VALUES ('100402003183', '00021000000', 'userAgent_detailPage');
INSERT INTO `sys_role_menu` VALUES ('100402003184', '00021000000', '00040050015');
INSERT INTO `sys_role_menu` VALUES ('100402003185', '00021000000', 'userCustomer');
INSERT INTO `sys_role_menu` VALUES ('100402003186', '00021000000', 'userCustomer_editPage');
INSERT INTO `sys_role_menu` VALUES ('100402003187', '00021000000', 'userCustomer_addPage');
INSERT INTO `sys_role_menu` VALUES ('100402003188', '00021000000', 'userCustomer_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('100402003189', '00021000000', 'userCustomer_listPage');
INSERT INTO `sys_role_menu` VALUES ('100402003190', '00021000000', 'userCustomer_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('100402003191', '00021000000', 'userCustomer_delete');
INSERT INTO `sys_role_menu` VALUES ('100402003192', '00021000000', 'userCustomer_update');
INSERT INTO `sys_role_menu` VALUES ('100402003193', '00021000000', 'userCustomer_insert');
INSERT INTO `sys_role_menu` VALUES ('100402003194', '00021000000', 'userCustomer_detailPage');
INSERT INTO `sys_role_menu` VALUES ('100402003195', '00021000000', 'glAccount');
INSERT INTO `sys_role_menu` VALUES ('100402003196', '00021000000', 'glAccount_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('100402003197', '00021000000', 'glAccount_delete');
INSERT INTO `sys_role_menu` VALUES ('100402003198', '00021000000', 'glAccount_update');
INSERT INTO `sys_role_menu` VALUES ('100402003199', '00021000000', 'glAccount_insert');
INSERT INTO `sys_role_menu` VALUES ('100402003200', '00021000000', 'glAccount_detailPage');
INSERT INTO `sys_role_menu` VALUES ('100402003201', '00021000000', 'glAccount_editPage');
INSERT INTO `sys_role_menu` VALUES ('100402003202', '00021000000', 'glAccount_addPage');
INSERT INTO `sys_role_menu` VALUES ('100402003203', '00021000000', 'glAccount_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('100402003204', '00021000000', 'glAccount_listPage');
INSERT INTO `sys_role_menu` VALUES ('100402003205', '00021000000', 'glAccountDetail');
INSERT INTO `sys_role_menu` VALUES ('100402003206', '00021000000', 'glAccountDetail_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('100402003207', '00021000000', 'glAccountDetail_delete');
INSERT INTO `sys_role_menu` VALUES ('100402003208', '00021000000', 'glAccountDetail_update');
INSERT INTO `sys_role_menu` VALUES ('100402003209', '00021000000', 'glAccountDetail_insert');
INSERT INTO `sys_role_menu` VALUES ('100402003210', '00021000000', 'glAccountDetail_detailPage');
INSERT INTO `sys_role_menu` VALUES ('100402003211', '00021000000', 'glAccountDetail_editPage');
INSERT INTO `sys_role_menu` VALUES ('100402003212', '00021000000', 'glAccountDetail_addPage');
INSERT INTO `sys_role_menu` VALUES ('100402003213', '00021000000', 'glAccountDetail_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('100402003214', '00021000000', 'glAccountDetail_listPage');
INSERT INTO `sys_role_menu` VALUES ('100402003215', '00021000000', 'glRecharge');
INSERT INTO `sys_role_menu` VALUES ('100402003216', '00021000000', 'glRecharge_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('100402003217', '00021000000', 'glRecharge_delete');
INSERT INTO `sys_role_menu` VALUES ('100402003218', '00021000000', 'glRecharge_update');
INSERT INTO `sys_role_menu` VALUES ('100402003219', '00021000000', 'glRecharge_insert');
INSERT INTO `sys_role_menu` VALUES ('100402003220', '00021000000', 'glRecharge_detailPage');
INSERT INTO `sys_role_menu` VALUES ('100402003221', '00021000000', 'glRecharge_editPage');
INSERT INTO `sys_role_menu` VALUES ('100402003222', '00021000000', 'glRecharge_addPage');
INSERT INTO `sys_role_menu` VALUES ('100402003223', '00021000000', 'glRecharge_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('100402003224', '00021000000', 'glRecharge_listPage');
INSERT INTO `sys_role_menu` VALUES ('100402003225', '00021000000', '100000208181');
INSERT INTO `sys_role_menu` VALUES ('100402003226', '00021000000', '1000504016');
INSERT INTO `sys_role_menu` VALUES ('100402003227', '00021000000', '100200046273');
INSERT INTO `sys_role_menu` VALUES ('100402003228', '00021000000', '00002442084');
INSERT INTO `sys_role_menu` VALUES ('100402003229', '00021000000', '00002440683');
INSERT INTO `sys_role_menu` VALUES ('100402003230', '00021000000', '00002440082');
INSERT INTO `sys_role_menu` VALUES ('100402003231', '00021000000', '00002440681');
INSERT INTO `sys_role_menu` VALUES ('100402003232', '00021000000', '00002442379');
INSERT INTO `sys_role_menu` VALUES ('100402003233', '00021000000', '00002442777');
INSERT INTO `sys_role_menu` VALUES ('100402003234', '00021000000', '00002442376');
INSERT INTO `sys_role_menu` VALUES ('100402003235', '00021000000', '00002440075');
INSERT INTO `sys_role_menu` VALUES ('1000000015', '00000110000930342', '1');
INSERT INTO `sys_role_menu` VALUES ('1000000016', '00000110000930342', 'trans');
INSERT INTO `sys_role_menu` VALUES ('1000000017', '00000110000930342', 'transYsh');
INSERT INTO `sys_role_menu` VALUES ('1000000018', '00000110000930342', 'transYsh_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('1000000019', '00000110000930342', 'transYsh_delete');
INSERT INTO `sys_role_menu` VALUES ('10000000110', '00000110000930342', 'transYsh_update');
INSERT INTO `sys_role_menu` VALUES ('10000000111', '00000110000930342', 'transYsh_insert');
INSERT INTO `sys_role_menu` VALUES ('10000000112', '00000110000930342', 'transYsh_detailPage');
INSERT INTO `sys_role_menu` VALUES ('10000000113', '00000110000930342', 'transYsh_editPage');
INSERT INTO `sys_role_menu` VALUES ('10000000114', '00000110000930342', 'transYsh_addPage');
INSERT INTO `sys_role_menu` VALUES ('10000000115', '00000110000930342', 'transYsh_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('10000000116', '00000110000930342', 'transYsh_listPage');
INSERT INTO `sys_role_menu` VALUES ('10000000117', '00000110000930342', '1406082020165');
INSERT INTO `sys_role_menu` VALUES ('10000000118', '00000110000930342', '100618010321');
INSERT INTO `sys_role_menu` VALUES ('10000000119', '00000110000930342', '100618019322');
INSERT INTO `sys_role_menu` VALUES ('10000000120', '00000110000930342', '100650600122');
INSERT INTO `sys_role_menu` VALUES ('10000000121', '00000110000930342', '100618000323');
INSERT INTO `sys_role_menu` VALUES ('10000000122', '00000110000930342', '100618001324');
INSERT INTO `sys_role_menu` VALUES ('1001402120504', '0000031411100903', 'userManagerInfo');
INSERT INTO `sys_role_menu` VALUES ('1001402120505', '0000031411100903', 'userManagerInfo_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('100402003236', '00021000000', '00002440073');
INSERT INTO `sys_role_menu` VALUES ('100402003237', '00021000000', 'trans');
INSERT INTO `sys_role_menu` VALUES ('100402003238', '00021000000', 'transYsh');
INSERT INTO `sys_role_menu` VALUES ('100402003239', '00021000000', 'transYsh_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('100402003240', '00021000000', 'transYsh_delete');
INSERT INTO `sys_role_menu` VALUES ('100402003241', '00021000000', 'transYsh_update');
INSERT INTO `sys_role_menu` VALUES ('100402003242', '00021000000', 'transYsh_insert');
INSERT INTO `sys_role_menu` VALUES ('100402003243', '00021000000', 'transYsh_detailPage');
INSERT INTO `sys_role_menu` VALUES ('100402003244', '00021000000', 'transYsh_editPage');
INSERT INTO `sys_role_menu` VALUES ('100402003245', '00021000000', 'transYsh_addPage');
INSERT INTO `sys_role_menu` VALUES ('100402003246', '00021000000', 'transYsh_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('100402003247', '00021000000', 'transYsh_listPage');
INSERT INTO `sys_role_menu` VALUES ('100402003248', '00021000000', '0000200006');
INSERT INTO `sys_role_menu` VALUES ('100402003249', '00021000000', '00002000013');
INSERT INTO `sys_role_menu` VALUES ('100402003250', '00021000000', '00002000014');
INSERT INTO `sys_role_menu` VALUES ('100402003251', '00021000000', '000000201049');
INSERT INTO `sys_role_menu` VALUES ('100402003252', '00021000000', 'yshProgram');
INSERT INTO `sys_role_menu` VALUES ('100402003253', '00021000000', 'yshProgram_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('100402003254', '00021000000', 'yshProgram_delete');
INSERT INTO `sys_role_menu` VALUES ('100402003255', '00021000000', 'yshProgram_update');
INSERT INTO `sys_role_menu` VALUES ('100402003256', '00021000000', 'yshProgram_insert');
INSERT INTO `sys_role_menu` VALUES ('100402003257', '00021000000', 'yshProgram_detailPage');
INSERT INTO `sys_role_menu` VALUES ('100402003258', '00021000000', 'yshProgram_editPage');
INSERT INTO `sys_role_menu` VALUES ('100402003259', '00021000000', 'yshProgram_addPage');
INSERT INTO `sys_role_menu` VALUES ('100402003260', '00021000000', 'yshProgram_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('100402003261', '00021000000', 'yshProgram_listPage');
INSERT INTO `sys_role_menu` VALUES ('100402003262', '00021000000', 'coupons');
INSERT INTO `sys_role_menu` VALUES ('100402003263', '00021000000', 'yshCoupon1');
INSERT INTO `sys_role_menu` VALUES ('100402003264', '00021000000', 'yshCoupon2');
INSERT INTO `sys_role_menu` VALUES ('100402003265', '00021000000', 'yshCoupon3');
INSERT INTO `sys_role_menu` VALUES ('100402003266', '00021000000', 'yshCoupon');
INSERT INTO `sys_role_menu` VALUES ('100402003267', '00021000000', 'yshCoupon_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('100402003268', '00021000000', 'yshCoupon_listPage');
INSERT INTO `sys_role_menu` VALUES ('100402003269', '00021000000', 'yshCoupon_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('100402003270', '00021000000', 'yshCoupon_delete');
INSERT INTO `sys_role_menu` VALUES ('100402003271', '00021000000', 'yshCoupon_update');
INSERT INTO `sys_role_menu` VALUES ('100402003272', '00021000000', 'yshCoupon_insert');
INSERT INTO `sys_role_menu` VALUES ('100402003273', '00021000000', 'yshCoupon_detailPage');
INSERT INTO `sys_role_menu` VALUES ('100402003274', '00021000000', 'yshCoupon_editPage');
INSERT INTO `sys_role_menu` VALUES ('100402003275', '00021000000', 'yshCoupon_addPage');
INSERT INTO `sys_role_menu` VALUES ('100402003276', '00021000000', 'confBankCoupon');
INSERT INTO `sys_role_menu` VALUES ('100402003277', '00021000000', 'base');
INSERT INTO `sys_role_menu` VALUES ('100402003278', '00021000000', 'baseBusinessArea');
INSERT INTO `sys_role_menu` VALUES ('100402003279', '00021000000', 'system');
INSERT INTO `sys_role_menu` VALUES ('100402003280', '00021000000', 'baseNotice');
INSERT INTO `sys_role_menu` VALUES ('100402003281', '00021000000', 'system_priv');
INSERT INTO `sys_role_menu` VALUES ('100402003282', '00021000000', 'system_priv_user');
INSERT INTO `sys_role_menu` VALUES ('100402003283', '00021000000', 'system_priv_role');
INSERT INTO `sys_role_menu` VALUES ('100402003284', '00021000000', 'system_priv_log');
INSERT INTO `sys_role_menu` VALUES ('100402003285', '00021000000', 'system_conf');
INSERT INTO `sys_role_menu` VALUES ('100402003286', '00021000000', 'system_conf_data');
INSERT INTO `sys_role_menu` VALUES ('100402003287', '00021000000', 'sysPdlevel');
INSERT INTO `sys_role_menu` VALUES ('100402003288', '00021000000', 'sysSystem');
INSERT INTO `sys_role_menu` VALUES ('100402003289', '00021000000', 'system_conf_datatype');
INSERT INTO `sys_role_menu` VALUES ('100402003290', '00021000000', '9');
INSERT INTO `sys_role_menu` VALUES ('14098017410', '00000310000000070', 'userMerchant_editPage');
INSERT INTO `sys_role_menu` VALUES ('14098017411', '00000310000000070', 'userMerchant_addPage');
INSERT INTO `sys_role_menu` VALUES ('14098017412', '00000310000000070', 'userMerchant_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('14098017413', '00000310000000070', 'userMerchant_listPage');
INSERT INTO `sys_role_menu` VALUES ('14098017414', '00000310000000070', 'confUserFee');
INSERT INTO `sys_role_menu` VALUES ('14098017415', '00000310000000070', 'confUserFee_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('14098017416', '00000310000000070', 'confUserFee_delete');
INSERT INTO `sys_role_menu` VALUES ('14098017417', '00000310000000070', 'confUserFee_update');
INSERT INTO `sys_role_menu` VALUES ('14098017418', '00000310000000070', 'confUserFee_insert');
INSERT INTO `sys_role_menu` VALUES ('14098017419', '00000310000000070', 'confUserFee_detailPage');
INSERT INTO `sys_role_menu` VALUES ('14098017420', '00000310000000070', 'confUserFee_editPage');
INSERT INTO `sys_role_menu` VALUES ('14098017421', '00000310000000070', 'confUserFee_addPage');
INSERT INTO `sys_role_menu` VALUES ('14098017422', '00000310000000070', 'confUserFee_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('14098017423', '00000310000000070', 'confUserFee_listPage');
INSERT INTO `sys_role_menu` VALUES ('14098017424', '00000310000000070', 'confBankAccount');
INSERT INTO `sys_role_menu` VALUES ('14098017425', '00000310000000070', 'confBankAccount_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('14098017426', '00000310000000070', 'confBankAccount_delete');
INSERT INTO `sys_role_menu` VALUES ('14098017427', '00000310000000070', 'confBankAccount_update');
INSERT INTO `sys_role_menu` VALUES ('14098017428', '00000310000000070', 'confBankAccount_insert');
INSERT INTO `sys_role_menu` VALUES ('14098017429', '00000310000000070', 'confBankAccount_detailPage');
INSERT INTO `sys_role_menu` VALUES ('14098017430', '00000310000000070', 'confBankAccount_editPage');
INSERT INTO `sys_role_menu` VALUES ('14098017431', '00000310000000070', 'confBankAccount_addPage');
INSERT INTO `sys_role_menu` VALUES ('14098017432', '00000310000000070', 'confBankAccount_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('14098017433', '00000310000000070', 'confBankAccount_listPage');
INSERT INTO `sys_role_menu` VALUES ('14098017434', '00000310000000070', 'userManagerInfo');
INSERT INTO `sys_role_menu` VALUES ('14098017435', '00000310000000070', 'userManagerInfo_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('14098017436', '00000310000000070', 'userManagerInfo_delete');
INSERT INTO `sys_role_menu` VALUES ('14098017437', '00000310000000070', 'userManagerInfo_update');
INSERT INTO `sys_role_menu` VALUES ('14098017438', '00000310000000070', 'userManagerInfo_insert');
INSERT INTO `sys_role_menu` VALUES ('14098017439', '00000310000000070', 'userManagerInfo_detailPage');
INSERT INTO `sys_role_menu` VALUES ('14098017440', '00000310000000070', 'userManagerInfo_editPage');
INSERT INTO `sys_role_menu` VALUES ('14098017441', '00000310000000070', 'userManagerInfo_addPage');
INSERT INTO `sys_role_menu` VALUES ('14098017442', '00000310000000070', 'userManagerInfo_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('14098017443', '00000310000000070', 'userManagerInfo_listPage');
INSERT INTO `sys_role_menu` VALUES ('14098017444', '00000310000000070', 'rptMerchantJs');
INSERT INTO `sys_role_menu` VALUES ('14098017445', '00000310000000070', 'rptMerchantJs_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('14098017446', '00000310000000070', 'rptMerchantJs_delete');
INSERT INTO `sys_role_menu` VALUES ('14098017447', '00000310000000070', 'rptMerchantJs_update');
INSERT INTO `sys_role_menu` VALUES ('14098017448', '00000310000000070', 'rptMerchantJs_insert');
INSERT INTO `sys_role_menu` VALUES ('14098017449', '00000310000000070', 'rptMerchantJs_detailPage');
INSERT INTO `sys_role_menu` VALUES ('14098017450', '00000310000000070', 'rptMerchantJs_editPage');
INSERT INTO `sys_role_menu` VALUES ('14098017451', '00000310000000070', 'rptMerchantJs_addPage');
INSERT INTO `sys_role_menu` VALUES ('14098017452', '00000310000000070', 'rptMerchantJs_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('14098017453', '00000310000000070', 'rptMerchantJs_listPage');
INSERT INTO `sys_role_menu` VALUES ('14098017454', '00000310000000070', '0000200006');
INSERT INTO `sys_role_menu` VALUES ('14098017455', '00000310000000070', '00002000013');
INSERT INTO `sys_role_menu` VALUES ('14098017456', '00000310000000070', '00002000014');
INSERT INTO `sys_role_menu` VALUES ('14098017457', '00000310000000070', '00002000015');
INSERT INTO `sys_role_menu` VALUES ('14098017458', '00000310000000070', '00002000016');
INSERT INTO `sys_role_menu` VALUES ('14098017459', '00000310000000070', '00002000017');
INSERT INTO `sys_role_menu` VALUES ('14098017460', '00000310000000070', '00002000018');
INSERT INTO `sys_role_menu` VALUES ('14098017461', '00000310000000070', '00002000019');
INSERT INTO `sys_role_menu` VALUES ('14098017462', '00000310000000070', '00002000020');
INSERT INTO `sys_role_menu` VALUES ('14098017463', '00000310000000070', '00002000021');
INSERT INTO `sys_role_menu` VALUES ('14098017464', '00000310000000070', 'user');
INSERT INTO `sys_role_menu` VALUES ('14098017465', '00000310000000070', 'userAgent');
INSERT INTO `sys_role_menu` VALUES ('14098017466', '00000310000000070', 'userAgent_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('14098017467', '00000310000000070', 'userAgent_delete');
INSERT INTO `sys_role_menu` VALUES ('14098017468', '00000310000000070', 'userAgent_update');
INSERT INTO `sys_role_menu` VALUES ('14098017474', '00000310000000070', 'userAgent_detailPage');
INSERT INTO `sys_role_menu` VALUES ('14098017475', '00000310000000070', '10060100006');
INSERT INTO `sys_role_menu` VALUES ('14098017476', '00000310000000070', '00040050015');
INSERT INTO `sys_role_menu` VALUES ('14098017477', '00000310000000070', 'userCustomer');
INSERT INTO `sys_role_menu` VALUES ('14098017478', '00000310000000070', 'userCustomer_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('14098017479', '00000310000000070', 'userCustomer_delete');
INSERT INTO `sys_role_menu` VALUES ('14098017480', '00000310000000070', 'userCustomer_update');
INSERT INTO `sys_role_menu` VALUES ('14098017481', '00000310000000070', 'userCustomer_insert');
INSERT INTO `sys_role_menu` VALUES ('14098017482', '00000310000000070', 'userCustomer_detailPage');
INSERT INTO `sys_role_menu` VALUES ('14098017483', '00000310000000070', 'userCustomer_editPage');
INSERT INTO `sys_role_menu` VALUES ('14098017484', '00000310000000070', 'userCustomer_addPage');
INSERT INTO `sys_role_menu` VALUES ('14098017485', '00000310000000070', 'userCustomer_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('14098017486', '00000310000000070', 'userCustomer_listPage');
INSERT INTO `sys_role_menu` VALUES ('14098017487', '00000310000000070', 'glAccount');
INSERT INTO `sys_role_menu` VALUES ('14098017488', '00000310000000070', 'glAccount_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('14098017489', '00000310000000070', 'glAccount_delete');
INSERT INTO `sys_role_menu` VALUES ('14098017490', '00000310000000070', 'glAccount_update');
INSERT INTO `sys_role_menu` VALUES ('14098017491', '00000310000000070', 'glAccount_insert');
INSERT INTO `sys_role_menu` VALUES ('14098017492', '00000310000000070', 'glAccount_detailPage');
INSERT INTO `sys_role_menu` VALUES ('14098017493', '00000310000000070', 'glAccount_editPage');
INSERT INTO `sys_role_menu` VALUES ('14098017494', '00000310000000070', 'glAccount_addPage');
INSERT INTO `sys_role_menu` VALUES ('14098017495', '00000310000000070', 'glAccount_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('14098017496', '00000310000000070', 'glAccount_listPage');
INSERT INTO `sys_role_menu` VALUES ('14098017497', '00000310000000070', 'glAccountDetail');
INSERT INTO `sys_role_menu` VALUES ('14098017498', '00000310000000070', 'glAccountDetail_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('14098017499', '00000310000000070', 'glAccountDetail_delete');
INSERT INTO `sys_role_menu` VALUES ('140980174100', '00000310000000070', 'glAccountDetail_update');
INSERT INTO `sys_role_menu` VALUES ('140980174101', '00000310000000070', 'glAccountDetail_insert');
INSERT INTO `sys_role_menu` VALUES ('140980174102', '00000310000000070', 'glAccountDetail_detailPage');
INSERT INTO `sys_role_menu` VALUES ('140980174103', '00000310000000070', 'glAccountDetail_editPage');
INSERT INTO `sys_role_menu` VALUES ('140980174104', '00000310000000070', 'glAccountDetail_addPage');
INSERT INTO `sys_role_menu` VALUES ('140980174105', '00000310000000070', 'glAccountDetail_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('140980174106', '00000310000000070', 'glAccountDetail_listPage');
INSERT INTO `sys_role_menu` VALUES ('140980174107', '00000310000000070', 'glRecharge');
INSERT INTO `sys_role_menu` VALUES ('140980174108', '00000310000000070', 'glRecharge_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('140980174109', '00000310000000070', 'glRecharge_delete');
INSERT INTO `sys_role_menu` VALUES ('140980174110', '00000310000000070', 'glRecharge_update');
INSERT INTO `sys_role_menu` VALUES ('140980174111', '00000310000000070', 'glRecharge_insert');
INSERT INTO `sys_role_menu` VALUES ('140980174112', '00000310000000070', 'glRecharge_detailPage');
INSERT INTO `sys_role_menu` VALUES ('140980174113', '00000310000000070', 'glRecharge_editPage');
INSERT INTO `sys_role_menu` VALUES ('140980174114', '00000310000000070', 'glRecharge_addPage');
INSERT INTO `sys_role_menu` VALUES ('140980174115', '00000310000000070', 'glRecharge_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('140980174116', '00000310000000070', 'glRecharge_listPage');
INSERT INTO `sys_role_menu` VALUES ('140980174117', '00000310000000070', '100000208181');
INSERT INTO `sys_role_menu` VALUES ('140980174118', '00000310000000070', '1000504016');
INSERT INTO `sys_role_menu` VALUES ('140980174119', '00000310000000070', '100200046273');
INSERT INTO `sys_role_menu` VALUES ('140980174120', '00000310000000070', '00002442084');
INSERT INTO `sys_role_menu` VALUES ('140980174121', '00000310000000070', '00002440683');
INSERT INTO `sys_role_menu` VALUES ('140980174122', '00000310000000070', '00002440082');
INSERT INTO `sys_role_menu` VALUES ('140980174123', '00000310000000070', '00002440681');
INSERT INTO `sys_role_menu` VALUES ('140980174124', '00000310000000070', '00002442379');
INSERT INTO `sys_role_menu` VALUES ('140980174125', '00000310000000070', '00002442777');
INSERT INTO `sys_role_menu` VALUES ('140980174126', '00000310000000070', '00002442376');
INSERT INTO `sys_role_menu` VALUES ('140980174127', '00000310000000070', '00002440075');
INSERT INTO `sys_role_menu` VALUES ('140980174128', '00000310000000070', '00002440073');
INSERT INTO `sys_role_menu` VALUES ('140980174129', '00000310000000070', 'trans');
INSERT INTO `sys_role_menu` VALUES ('140980174130', '00000310000000070', 'transYsh');
INSERT INTO `sys_role_menu` VALUES ('140980174131', '00000310000000070', 'transYsh_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('140980174132', '00000310000000070', 'transYsh_delete');
INSERT INTO `sys_role_menu` VALUES ('140980174133', '00000310000000070', 'transYsh_update');
INSERT INTO `sys_role_menu` VALUES ('140980174134', '00000310000000070', 'transYsh_insert');
INSERT INTO `sys_role_menu` VALUES ('140980174135', '00000310000000070', 'transYsh_detailPage');
INSERT INTO `sys_role_menu` VALUES ('140980174136', '00000310000000070', 'transYsh_editPage');
INSERT INTO `sys_role_menu` VALUES ('140980174137', '00000310000000070', 'transYsh_addPage');
INSERT INTO `sys_role_menu` VALUES ('140980174138', '00000310000000070', 'transYsh_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('140980174139', '00000310000000070', 'transYsh_listPage');
INSERT INTO `sys_role_menu` VALUES ('140980174140', '00000310000000070', '000000201049');
INSERT INTO `sys_role_menu` VALUES ('140980174141', '00000310000000070', 'yshProgram');
INSERT INTO `sys_role_menu` VALUES ('140980174142', '00000310000000070', 'yshProgram_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('140980174143', '00000310000000070', 'yshProgram_delete');
INSERT INTO `sys_role_menu` VALUES ('140980174144', '00000310000000070', 'yshProgram_update');
INSERT INTO `sys_role_menu` VALUES ('140980174145', '00000310000000070', 'yshProgram_insert');
INSERT INTO `sys_role_menu` VALUES ('140980174146', '00000310000000070', 'yshProgram_detailPage');
INSERT INTO `sys_role_menu` VALUES ('140980174147', '00000310000000070', 'yshProgram_editPage');
INSERT INTO `sys_role_menu` VALUES ('140980174148', '00000310000000070', 'yshProgram_addPage');
INSERT INTO `sys_role_menu` VALUES ('140980174149', '00000310000000070', 'yshProgram_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('140980174150', '00000310000000070', 'yshProgram_listPage');
INSERT INTO `sys_role_menu` VALUES ('140980174151', '00000310000000070', 'coupons');
INSERT INTO `sys_role_menu` VALUES ('140980174152', '00000310000000070', 'yshCoupon1');
INSERT INTO `sys_role_menu` VALUES ('140980174153', '00000310000000070', 'yshCoupon2');
INSERT INTO `sys_role_menu` VALUES ('140980174154', '00000310000000070', 'yshCoupon3');
INSERT INTO `sys_role_menu` VALUES ('140980174155', '00000310000000070', 'yshCoupon');
INSERT INTO `sys_role_menu` VALUES ('140980174156', '00000310000000070', 'yshCoupon_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('140980174157', '00000310000000070', 'yshCoupon_delete');
INSERT INTO `sys_role_menu` VALUES ('140980174158', '00000310000000070', 'yshCoupon_update');
INSERT INTO `sys_role_menu` VALUES ('140980174159', '00000310000000070', 'yshCoupon_insert');
INSERT INTO `sys_role_menu` VALUES ('140980174160', '00000310000000070', 'yshCoupon_detailPage');
INSERT INTO `sys_role_menu` VALUES ('140980174161', '00000310000000070', 'yshCoupon_editPage');
INSERT INTO `sys_role_menu` VALUES ('140980174162', '00000310000000070', 'yshCoupon_addPage');
INSERT INTO `sys_role_menu` VALUES ('140980174163', '00000310000000070', 'yshCoupon_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('140980174164', '00000310000000070', 'yshCoupon_listPage');
INSERT INTO `sys_role_menu` VALUES ('140980174165', '00000310000000070', 'confBankCoupon');
INSERT INTO `sys_role_menu` VALUES ('140980174166', '00000310000000070', 'conf');
INSERT INTO `sys_role_menu` VALUES ('140980174167', '00000310000000070', 'confLadderPrice');
INSERT INTO `sys_role_menu` VALUES ('140980174168', '00000310000000070', 'confLadderPrice_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('140980174169', '00000310000000070', 'confLadderPrice_delete');
INSERT INTO `sys_role_menu` VALUES ('140980174170', '00000310000000070', 'confLadderPrice_update');
INSERT INTO `sys_role_menu` VALUES ('140980174171', '00000310000000070', 'confLadderPrice_insert');
INSERT INTO `sys_role_menu` VALUES ('140980174172', '00000310000000070', 'confLadderPrice_detailPage');
INSERT INTO `sys_role_menu` VALUES ('140980174173', '00000310000000070', 'confLadderPrice_editPage');
INSERT INTO `sys_role_menu` VALUES ('140980174174', '00000310000000070', 'confLadderPrice_addPage');
INSERT INTO `sys_role_menu` VALUES ('140980174175', '00000310000000070', 'confLadderPrice_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('140980174176', '00000310000000070', 'confLadderPrice_listPage');
INSERT INTO `sys_role_menu` VALUES ('140980174177', '00000310000000070', 'sysFileIndex');
INSERT INTO `sys_role_menu` VALUES ('140980174178', '00000310000000070', 'sysFileIndex_update');
INSERT INTO `sys_role_menu` VALUES ('140980174179', '00000310000000070', 'sysFileIndex_insert');
INSERT INTO `sys_role_menu` VALUES ('140980174180', '00000310000000070', 'sysFileIndex_detailPage');
INSERT INTO `sys_role_menu` VALUES ('140980174181', '00000310000000070', 'sysFileIndex_editPage');
INSERT INTO `sys_role_menu` VALUES ('140980174182', '00000310000000070', 'sysFileIndex_addPage');
INSERT INTO `sys_role_menu` VALUES ('140980174183', '00000310000000070', 'sysFileIndex_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('140980174184', '00000310000000070', 'sysFileIndex_listPage');
INSERT INTO `sys_role_menu` VALUES ('140980174185', '00000310000000070', 'sysFileIndex_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('140980174186', '00000310000000070', 'sysFileIndex_delete');
INSERT INTO `sys_role_menu` VALUES ('140980174187', '00000310000000070', 'confBusiness');
INSERT INTO `sys_role_menu` VALUES ('140980174188', '00000310000000070', 'confBusiness_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('140980174189', '00000310000000070', 'confBusiness_delete');
INSERT INTO `sys_role_menu` VALUES ('140980174190', '00000310000000070', 'confBusiness_update');
INSERT INTO `sys_role_menu` VALUES ('140980174191', '00000310000000070', 'confBusiness_insert');
INSERT INTO `sys_role_menu` VALUES ('140980174192', '00000310000000070', 'confBusiness_detailPage');
INSERT INTO `sys_role_menu` VALUES ('140980174193', '00000310000000070', 'confBusiness_editPage');
INSERT INTO `sys_role_menu` VALUES ('140980174194', '00000310000000070', 'confBusiness_addPage');
INSERT INTO `sys_role_menu` VALUES ('140980174195', '00000310000000070', 'confBusiness_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('140980174196', '00000310000000070', 'confBusiness_listPage');
INSERT INTO `sys_role_menu` VALUES ('140980174197', '00000310000000070', 'baseCardBin');
INSERT INTO `sys_role_menu` VALUES ('140980174198', '00000310000000070', 'baseFinAgency');
INSERT INTO `sys_role_menu` VALUES ('140980174199', '00000310000000070', 'basePlatArea');
INSERT INTO `sys_role_menu` VALUES ('140980174200', '00000310000000070', 'baseChannelCost');
INSERT INTO `sys_role_menu` VALUES ('140980174201', '00000310000000070', '1400821000441');
INSERT INTO `sys_role_menu` VALUES ('140980174202', '00000310000000070', 'baseMcc');
INSERT INTO `sys_role_menu` VALUES ('14098017469', '00000310000000070', 'userAgent_insert');
INSERT INTO `sys_role_menu` VALUES ('14098017470', '00000310000000070', 'userAgent_editPage');
INSERT INTO `sys_role_menu` VALUES ('14098017471', '00000310000000070', 'userAgent_addPage');
INSERT INTO `sys_role_menu` VALUES ('14098017472', '00000310000000070', 'userAgent_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('14098017473', '00000310000000070', 'userAgent_listPage');
INSERT INTO `sys_role_menu` VALUES ('140980174203', '00000310000000070', '00010040019');
INSERT INTO `sys_role_menu` VALUES ('140980174204', '00000310000000070', 'base');
INSERT INTO `sys_role_menu` VALUES ('140980174205', '00000310000000070', 'baseBusinessType');
INSERT INTO `sys_role_menu` VALUES ('140980174206', '00000310000000070', 'baseBusinessType_update');
INSERT INTO `sys_role_menu` VALUES ('140980174207', '00000310000000070', 'baseBusinessType_insert');
INSERT INTO `sys_role_menu` VALUES ('140980174208', '00000310000000070', 'baseBusinessType_detailPage');
INSERT INTO `sys_role_menu` VALUES ('140980174209', '00000310000000070', 'baseBusinessType_editPage');
INSERT INTO `sys_role_menu` VALUES ('140980174210', '00000310000000070', 'baseBusinessType_addPage');
INSERT INTO `sys_role_menu` VALUES ('140980174211', '00000310000000070', 'baseBusinessType_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('140980174212', '00000310000000070', 'baseBusinessType_listPage');
INSERT INTO `sys_role_menu` VALUES ('140980174213', '00000310000000070', 'baseBusinessType_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('140980174214', '00000310000000070', 'baseBusinessType_delete');
INSERT INTO `sys_role_menu` VALUES ('140980174215', '00000310000000070', 'baseBusinessArea');
INSERT INTO `sys_role_menu` VALUES ('140980174216', '00000310000000070', 'system');
INSERT INTO `sys_role_menu` VALUES ('140980174217', '00000310000000070', 'baseNotice');
INSERT INTO `sys_role_menu` VALUES ('140980174218', '00000310000000070', 'system_priv');
INSERT INTO `sys_role_menu` VALUES ('140980174219', '00000310000000070', 'system_priv_user');
INSERT INTO `sys_role_menu` VALUES ('140980174220', '00000310000000070', 'system_priv_role');
INSERT INTO `sys_role_menu` VALUES ('140980174221', '00000310000000070', 'system_priv_log');
INSERT INTO `sys_role_menu` VALUES ('140980174222', '00000310000000070', 'system_conf');
INSERT INTO `sys_role_menu` VALUES ('140980174223', '00000310000000070', 'system_conf_data');
INSERT INTO `sys_role_menu` VALUES ('140980174224', '00000310000000070', 'sysPdlevel');
INSERT INTO `sys_role_menu` VALUES ('140980174225', '00000310000000070', 'sysSystem');
INSERT INTO `sys_role_menu` VALUES ('140980174226', '00000310000000070', 'system_conf_datatype');
INSERT INTO `sys_role_menu` VALUES ('140980174227', '00000310000000070', '9');
INSERT INTO `sys_role_menu` VALUES ('140980174228', '00000310000000070', '1406082020165');
INSERT INTO `sys_role_menu` VALUES ('140980174229', '00000310000000070', '100618010321');
INSERT INTO `sys_role_menu` VALUES ('140980174230', '00000310000000070', '100618019322');
INSERT INTO `sys_role_menu` VALUES ('140980174231', '00000310000000070', '100650600122');
INSERT INTO `sys_role_menu` VALUES ('140980174232', '00000310000000070', '100618000323');
INSERT INTO `sys_role_menu` VALUES ('140980174233', '00000310000000070', '100618001324');
INSERT INTO `sys_role_menu` VALUES ('140980174234', '00000310000000070', '1406082000154');
INSERT INTO `sys_role_menu` VALUES ('140980174235', '00000310000000070', '100840310044');
INSERT INTO `sys_role_menu` VALUES ('140980174236', '00000310000000070', '1000000400848');
INSERT INTO `sys_role_menu` VALUES ('140980174237', '00000310000000070', '1000000400804');
INSERT INTO `sys_role_menu` VALUES ('140980174238', '00000310000000070', '1000000400826');
INSERT INTO `sys_role_menu` VALUES ('140980174239', '00000310000000070', '1000000000859');
INSERT INTO `sys_role_menu` VALUES ('140980174240', '00000310000000070', '1000000004870');
INSERT INTO `sys_role_menu` VALUES ('140980174241', '00000310000000070', '100840305080');
INSERT INTO `sys_role_menu` VALUES ('140980174242', '00000310000000070', '100840401092');
INSERT INTO `sys_role_menu` VALUES ('140980174243', '00000310000000070', '100840311086');
INSERT INTO `sys_role_menu` VALUES ('140980174244', '00000310000000070', '100840401098');
INSERT INTO `sys_role_menu` VALUES ('140980174245', '00000310000000070', '100200044284');
INSERT INTO `sys_role_menu` VALUES ('140980174246', '00000310000000070', '1000000000892');
INSERT INTO `sys_role_menu` VALUES ('140980174247', '00000310000000070', '1000001004903');
INSERT INTO `sys_role_menu` VALUES ('140980174248', '00000310000000070', 'system_1001');
INSERT INTO `sys_role_menu` VALUES ('140980174249', '00000310000000070', 'system_priv_1001');
INSERT INTO `sys_role_menu` VALUES ('140980174250', '00000310000000070', 'system_priv_org_1001');
INSERT INTO `sys_role_menu` VALUES ('140980174251', '00000310000000070', 'system_priv_user_1001');
INSERT INTO `sys_role_menu` VALUES ('140980174252', '00000310000000070', 'system_priv_role_1001');
INSERT INTO `sys_role_menu` VALUES ('140980174253', '00000310000000070', 'system_priv_menu_1001');
INSERT INTO `sys_role_menu` VALUES ('140980174254', '00000310000000070', 'system_priv_log_1001');
INSERT INTO `sys_role_menu` VALUES ('140980174255', '00000310000000070', 'system_conf_1001');
INSERT INTO `sys_role_menu` VALUES ('140980174256', '00000310000000070', 'system_conf_data_1001');
INSERT INTO `sys_role_menu` VALUES ('140980174257', '00000310000000070', 'system_conf_pwd_1001');
INSERT INTO `sys_role_menu` VALUES ('140980174258', '00000310000000070', 'system_priv_system_1001');
INSERT INTO `sys_role_menu` VALUES ('140980174259', '00000310000000070', 'system_conf_datatype_1001');
INSERT INTO `sys_role_menu` VALUES ('140980174260', '00000310000000070', 'system_conf_blackip_1001');
INSERT INTO `sys_role_menu` VALUES ('10051090684', '0002101002130', '1');
INSERT INTO `sys_role_menu` VALUES ('10051090685', '0002101002130', 'conf');
INSERT INTO `sys_role_menu` VALUES ('10051090686', '0002101002130', 'confLadderPrice');
INSERT INTO `sys_role_menu` VALUES ('10051090687', '0002101002130', 'confLadderPrice_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('10051090688', '0002101002130', 'confLadderPrice_delete');
INSERT INTO `sys_role_menu` VALUES ('10051090689', '0002101002130', 'confLadderPrice_update');
INSERT INTO `sys_role_menu` VALUES ('10051090690', '0002101002130', 'confLadderPrice_insert');
INSERT INTO `sys_role_menu` VALUES ('10051090691', '0002101002130', 'confLadderPrice_detailPage');
INSERT INTO `sys_role_menu` VALUES ('10051090692', '0002101002130', 'confLadderPrice_editPage');
INSERT INTO `sys_role_menu` VALUES ('10051090693', '0002101002130', 'confLadderPrice_addPage');
INSERT INTO `sys_role_menu` VALUES ('10051090694', '0002101002130', 'confLadderPrice_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('10051090695', '0002101002130', 'confLadderPrice_listPage');
INSERT INTO `sys_role_menu` VALUES ('10051090696', '0002101002130', 'sysFileIndex');
INSERT INTO `sys_role_menu` VALUES ('10051090697', '0002101002130', 'sysFileIndex_update');
INSERT INTO `sys_role_menu` VALUES ('10051090698', '0002101002130', 'sysFileIndex_insert');
INSERT INTO `sys_role_menu` VALUES ('10051090699', '0002101002130', 'sysFileIndex_detailPage');
INSERT INTO `sys_role_menu` VALUES ('100510906100', '0002101002130', 'sysFileIndex_editPage');
INSERT INTO `sys_role_menu` VALUES ('100510906101', '0002101002130', 'sysFileIndex_addPage');
INSERT INTO `sys_role_menu` VALUES ('100510906102', '0002101002130', 'sysFileIndex_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('100510906103', '0002101002130', 'sysFileIndex_listPage');
INSERT INTO `sys_role_menu` VALUES ('100510906104', '0002101002130', 'sysFileIndex_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('100510906105', '0002101002130', 'sysFileIndex_delete');
INSERT INTO `sys_role_menu` VALUES ('100510906106', '0002101002130', 'confBusiness');
INSERT INTO `sys_role_menu` VALUES ('100510906107', '0002101002130', 'confBusiness_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('100510906108', '0002101002130', 'confBusiness_delete');
INSERT INTO `sys_role_menu` VALUES ('100510906109', '0002101002130', 'confBusiness_update');
INSERT INTO `sys_role_menu` VALUES ('100510906110', '0002101002130', 'confBusiness_insert');
INSERT INTO `sys_role_menu` VALUES ('100510906111', '0002101002130', 'confBusiness_detailPage');
INSERT INTO `sys_role_menu` VALUES ('100510906112', '0002101002130', 'confBusiness_editPage');
INSERT INTO `sys_role_menu` VALUES ('100510906113', '0002101002130', 'confBusiness_addPage');
INSERT INTO `sys_role_menu` VALUES ('100510906114', '0002101002130', 'confBusiness_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('100510906115', '0002101002130', 'confBusiness_listPage');
INSERT INTO `sys_role_menu` VALUES ('100510906116', '0002101002130', 'baseCardBin');
INSERT INTO `sys_role_menu` VALUES ('100510906117', '0002101002130', 'baseFinAgency');
INSERT INTO `sys_role_menu` VALUES ('100510906118', '0002101002130', 'basePlatArea');
INSERT INTO `sys_role_menu` VALUES ('100510906119', '0002101002130', 'baseChannelCost');
INSERT INTO `sys_role_menu` VALUES ('100510906120', '0002101002130', 'baseMcc');
INSERT INTO `sys_role_menu` VALUES ('100510906121', '0002101002130', 'system');
INSERT INTO `sys_role_menu` VALUES ('100510906122', '0002101002130', 'system_priv');
INSERT INTO `sys_role_menu` VALUES ('100510906123', '0002101002130', 'system_priv_user');
INSERT INTO `sys_role_menu` VALUES ('100510906124', '0002101002130', 'system_priv_role');
INSERT INTO `sys_role_menu` VALUES ('100510906125', '0002101002130', 'system_priv_log');
INSERT INTO `sys_role_menu` VALUES ('100510906126', '0002101002130', 'system_conf');
INSERT INTO `sys_role_menu` VALUES ('100510906127', '0002101002130', 'system_conf_data');
INSERT INTO `sys_role_menu` VALUES ('100510906128', '0002101002130', 'sysPdlevel');
INSERT INTO `sys_role_menu` VALUES ('100510906129', '0002101002130', 'sysSystem');
INSERT INTO `sys_role_menu` VALUES ('100510906130', '0002101002130', 'system_conf_datatype');
INSERT INTO `sys_role_menu` VALUES ('100510906131', '0002101002130', '9');
INSERT INTO `sys_role_menu` VALUES ('100510906132', '0002101002130', 'system_1001');
INSERT INTO `sys_role_menu` VALUES ('100510906133', '0002101002130', 'system_conf_1001');
INSERT INTO `sys_role_menu` VALUES ('100510906134', '0002101002130', 'system_conf_data_1001');
INSERT INTO `sys_role_menu` VALUES ('100510906135', '0002101002130', 'system_conf_pwd_1001');
INSERT INTO `sys_role_menu` VALUES ('100510906136', '0002101002130', 'system_priv_system_1001');
INSERT INTO `sys_role_menu` VALUES ('100510906137', '0002101002130', 'system_conf_datatype_1001');
INSERT INTO `sys_role_menu` VALUES ('100510906138', '0002101002130', 'system_conf_blackip_1001');
INSERT INTO `sys_role_menu` VALUES ('100510906139', '0002101002130', 'system_priv_1001');
INSERT INTO `sys_role_menu` VALUES ('100510906140', '0002101002130', 'system_priv_org_1001');
INSERT INTO `sys_role_menu` VALUES ('100510906141', '0002101002130', 'system_priv_user_1001');
INSERT INTO `sys_role_menu` VALUES ('100510906142', '0002101002130', 'system_priv_role_1001');
INSERT INTO `sys_role_menu` VALUES ('100510906143', '0002101002130', 'system_priv_menu_1001');
INSERT INTO `sys_role_menu` VALUES ('100510906144', '0002101002130', 'system_priv_log_1001');
INSERT INTO `sys_role_menu` VALUES ('1001402120506', '0000031411100903', 'userManagerInfo_delete');
INSERT INTO `sys_role_menu` VALUES ('1001402120507', '0000031411100903', 'userManagerInfo_update');
INSERT INTO `sys_role_menu` VALUES ('1001402120508', '0000031411100903', 'userManagerInfo_insert');
INSERT INTO `sys_role_menu` VALUES ('1001402120509', '0000031411100903', 'userManagerInfo_detailPage');
INSERT INTO `sys_role_menu` VALUES ('1001402120510', '0000031411100903', 'userManagerInfo_editPage');
INSERT INTO `sys_role_menu` VALUES ('1001402120511', '0000031411100903', 'userManagerInfo_addPage');
INSERT INTO `sys_role_menu` VALUES ('1001402120512', '0000031411100903', 'userManagerInfo_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('1001402120513', '0000031411100903', 'userManagerInfo_listPage');
INSERT INTO `sys_role_menu` VALUES ('1001402120514', '0000031411100903', 'rptMerchantJs');
INSERT INTO `sys_role_menu` VALUES ('1001402120515', '0000031411100903', 'rptMerchantJs_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('1001402120516', '0000031411100903', 'rptMerchantJs_delete');
INSERT INTO `sys_role_menu` VALUES ('1001402120517', '0000031411100903', 'rptMerchantJs_update');
INSERT INTO `sys_role_menu` VALUES ('1001402120518', '0000031411100903', 'rptMerchantJs_insert');
INSERT INTO `sys_role_menu` VALUES ('1001402120519', '0000031411100903', 'rptMerchantJs_detailPage');
INSERT INTO `sys_role_menu` VALUES ('1001402120520', '0000031411100903', 'rptMerchantJs_editPage');
INSERT INTO `sys_role_menu` VALUES ('1001402120521', '0000031411100903', 'rptMerchantJs_addPage');
INSERT INTO `sys_role_menu` VALUES ('1001402120522', '0000031411100903', 'rptMerchantJs_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('1001402120523', '0000031411100903', 'rptMerchantJs_listPage');
INSERT INTO `sys_role_menu` VALUES ('1001402120524', '0000031411100903', 'user');
INSERT INTO `sys_role_menu` VALUES ('1001402120525', '0000031411100903', 'userAgent');
INSERT INTO `sys_role_menu` VALUES ('1001402120526', '0000031411100903', 'userAgent_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('1001402120527', '0000031411100903', 'userAgent_listPage');
INSERT INTO `sys_role_menu` VALUES ('1001402120528', '0000031411100903', 'userAgent_detailPage');
INSERT INTO `sys_role_menu` VALUES ('1001402120529', '0000031411100903', '00040050015');
INSERT INTO `sys_role_menu` VALUES ('1001402120530', '0000031411100903', 'userCustomer');
INSERT INTO `sys_role_menu` VALUES ('1001402120531', '0000031411100903', 'userCustomer_detailPage');
INSERT INTO `sys_role_menu` VALUES ('1001402120532', '0000031411100903', 'userCustomer_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('1001402120533', '0000031411100903', 'userCustomer_listPage');
INSERT INTO `sys_role_menu` VALUES ('1001402120534', '0000031411100903', 'glAccount');
INSERT INTO `sys_role_menu` VALUES ('1001402120535', '0000031411100903', 'glAccount_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('1001402120536', '0000031411100903', 'glAccount_delete');
INSERT INTO `sys_role_menu` VALUES ('1001402120537', '0000031411100903', 'glAccount_update');
INSERT INTO `sys_role_menu` VALUES ('1001402120538', '0000031411100903', 'glAccount_insert');
INSERT INTO `sys_role_menu` VALUES ('1001402120539', '0000031411100903', 'glAccount_detailPage');
INSERT INTO `sys_role_menu` VALUES ('1001402120540', '0000031411100903', 'glAccount_editPage');
INSERT INTO `sys_role_menu` VALUES ('1001402120541', '0000031411100903', 'glAccount_addPage');
INSERT INTO `sys_role_menu` VALUES ('1001402120542', '0000031411100903', 'glAccount_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('1001402120543', '0000031411100903', 'glAccount_listPage');
INSERT INTO `sys_role_menu` VALUES ('1001402120544', '0000031411100903', 'glAccountDetail');
INSERT INTO `sys_role_menu` VALUES ('1001402120545', '0000031411100903', 'glAccountDetail_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('1001402120546', '0000031411100903', 'glAccountDetail_delete');
INSERT INTO `sys_role_menu` VALUES ('1001402120547', '0000031411100903', 'glAccountDetail_update');
INSERT INTO `sys_role_menu` VALUES ('1001402120548', '0000031411100903', 'glAccountDetail_insert');
INSERT INTO `sys_role_menu` VALUES ('1001402120549', '0000031411100903', 'glAccountDetail_detailPage');
INSERT INTO `sys_role_menu` VALUES ('1001402120550', '0000031411100903', 'glAccountDetail_editPage');
INSERT INTO `sys_role_menu` VALUES ('1001402120551', '0000031411100903', 'glAccountDetail_addPage');
INSERT INTO `sys_role_menu` VALUES ('1001402120552', '0000031411100903', 'glAccountDetail_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('1001402120553', '0000031411100903', 'glAccountDetail_listPage');
INSERT INTO `sys_role_menu` VALUES ('1001402120554', '0000031411100903', 'glRecharge');
INSERT INTO `sys_role_menu` VALUES ('1001402120555', '0000031411100903', 'glRecharge_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('1001402120556', '0000031411100903', 'glRecharge_delete');
INSERT INTO `sys_role_menu` VALUES ('1001402120557', '0000031411100903', 'glRecharge_update');
INSERT INTO `sys_role_menu` VALUES ('1001402120558', '0000031411100903', 'glRecharge_insert');
INSERT INTO `sys_role_menu` VALUES ('1001402120559', '0000031411100903', 'glRecharge_detailPage');
INSERT INTO `sys_role_menu` VALUES ('1001402120560', '0000031411100903', 'glRecharge_editPage');
INSERT INTO `sys_role_menu` VALUES ('1001402120561', '0000031411100903', 'glRecharge_addPage');
INSERT INTO `sys_role_menu` VALUES ('1001402120562', '0000031411100903', 'glRecharge_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('1001402120563', '0000031411100903', 'glRecharge_listPage');
INSERT INTO `sys_role_menu` VALUES ('1001402120564', '0000031411100903', '100000208181');
INSERT INTO `sys_role_menu` VALUES ('1001402120565', '0000031411100903', '1000504016');
INSERT INTO `sys_role_menu` VALUES ('1001402120566', '0000031411100903', '100200046273');
INSERT INTO `sys_role_menu` VALUES ('1001402120567', '0000031411100903', '00002442084');
INSERT INTO `sys_role_menu` VALUES ('1001402120568', '0000031411100903', '00002440683');
INSERT INTO `sys_role_menu` VALUES ('1001402120569', '0000031411100903', '00002440082');
INSERT INTO `sys_role_menu` VALUES ('1001402120570', '0000031411100903', '00002440681');
INSERT INTO `sys_role_menu` VALUES ('1001402120571', '0000031411100903', '00002442379');
INSERT INTO `sys_role_menu` VALUES ('1001402120572', '0000031411100903', '00002442777');
INSERT INTO `sys_role_menu` VALUES ('1001402120573', '0000031411100903', '00002442376');
INSERT INTO `sys_role_menu` VALUES ('1001402120574', '0000031411100903', '00002440075');
INSERT INTO `sys_role_menu` VALUES ('1001402120575', '0000031411100903', '00002440073');
INSERT INTO `sys_role_menu` VALUES ('1001402120576', '0000031411100903', 'trans');
INSERT INTO `sys_role_menu` VALUES ('1001402120577', '0000031411100903', 'transYsh');
INSERT INTO `sys_role_menu` VALUES ('1001402120578', '0000031411100903', 'transYsh_detailPage');
INSERT INTO `sys_role_menu` VALUES ('1001402120579', '0000031411100903', 'transYsh_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('1001402120580', '0000031411100903', 'transYsh_listPage');
INSERT INTO `sys_role_menu` VALUES ('1001402120581', '0000031411100903', '0000200006');
INSERT INTO `sys_role_menu` VALUES ('1001402120582', '0000031411100903', '00002000013');
INSERT INTO `sys_role_menu` VALUES ('1001402120583', '0000031411100903', '000000201049');
INSERT INTO `sys_role_menu` VALUES ('1001402120584', '0000031411100903', 'yshProgram');
INSERT INTO `sys_role_menu` VALUES ('1001402120585', '0000031411100903', 'yshProgram_detailPage');
INSERT INTO `sys_role_menu` VALUES ('1001402120586', '0000031411100903', 'yshProgram_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('1001402120587', '0000031411100903', 'yshProgram_listPage');
INSERT INTO `sys_role_menu` VALUES ('1001402120588', '0000031411100903', 'coupons');
INSERT INTO `sys_role_menu` VALUES ('1001402120589', '0000031411100903', 'yshCoupon1');
INSERT INTO `sys_role_menu` VALUES ('1001402120590', '0000031411100903', 'yshCoupon2');
INSERT INTO `sys_role_menu` VALUES ('1001402120591', '0000031411100903', 'yshCoupon3');
INSERT INTO `sys_role_menu` VALUES ('1001402120592', '0000031411100903', 'yshCoupon');
INSERT INTO `sys_role_menu` VALUES ('1001402120593', '0000031411100903', 'yshCoupon_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('1001402120594', '0000031411100903', 'yshCoupon_delete');
INSERT INTO `sys_role_menu` VALUES ('1001402120595', '0000031411100903', 'yshCoupon_update');
INSERT INTO `sys_role_menu` VALUES ('1001402120596', '0000031411100903', 'yshCoupon_insert');
INSERT INTO `sys_role_menu` VALUES ('1001402120597', '0000031411100903', 'yshCoupon_detailPage');
INSERT INTO `sys_role_menu` VALUES ('1001402120598', '0000031411100903', 'yshCoupon_editPage');
INSERT INTO `sys_role_menu` VALUES ('1001402120599', '0000031411100903', 'yshCoupon_addPage');
INSERT INTO `sys_role_menu` VALUES ('1001402120600', '0000031411100903', 'yshCoupon_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('1001402120601', '0000031411100903', 'yshCoupon_listPage');
INSERT INTO `sys_role_menu` VALUES ('1001402120602', '0000031411100903', 'confBankCoupon');
INSERT INTO `sys_role_menu` VALUES ('1001402120603', '0000031411100903', 'base');
INSERT INTO `sys_role_menu` VALUES ('1001402120604', '0000031411100903', 'baseBusinessType');
INSERT INTO `sys_role_menu` VALUES ('1001402120605', '0000031411100903', 'baseBusinessType_detailPage');
INSERT INTO `sys_role_menu` VALUES ('1001402120606', '0000031411100903', 'baseBusinessType_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('1001402120607', '0000031411100903', 'baseBusinessType_listPage');
INSERT INTO `sys_role_menu` VALUES ('1001402120608', '0000031411100903', 'baseBusinessArea');
INSERT INTO `sys_role_menu` VALUES ('00110570051', '0000011400002300', '00110000820');
INSERT INTO `sys_role_menu` VALUES ('00110570052', '0000011400002300', '00110000029');
INSERT INTO `sys_role_menu` VALUES ('00110570053', '0000011400002300', '141045030118');
INSERT INTO `sys_role_menu` VALUES ('00110570054', '0000011400002300', '001100300118');
INSERT INTO `sys_role_menu` VALUES ('00110570055', '0000011400002300', '0011100001064');
INSERT INTO `sys_role_menu` VALUES ('00110570056', '0000011400002300', '1411023000329');
INSERT INTO `sys_role_menu` VALUES ('00110570057', '0000011400002300', '1411023000335');
INSERT INTO `sys_role_menu` VALUES ('00110570058', '0000011400002300', '141000208371');
INSERT INTO `sys_role_menu` VALUES ('00110570059', '0000011400002300', '1411023600317');
INSERT INTO `sys_role_menu` VALUES ('00110570060', '0000011400002300', '1411023000323');
INSERT INTO `sys_role_menu` VALUES ('00110570061', '0000011400002300', '141000200777');
INSERT INTO `sys_role_menu` VALUES ('00110570062', '0000011400002300', '1410002001638');
INSERT INTO `sys_role_menu` VALUES ('00110570063', '0000011400002300', '1410003006644');
INSERT INTO `sys_role_menu` VALUES ('00110570064', '0000011400002300', '1400700410346');
INSERT INTO `sys_role_menu` VALUES ('00110570065', '0000011400002300', '1400700010624');
INSERT INTO `sys_role_menu` VALUES ('00110570066', '0000011400002300', '001106424588');
INSERT INTO `sys_role_menu` VALUES ('00110570067', '0000011400002300', '001100300127');
INSERT INTO `sys_role_menu` VALUES ('00110570068', '0000011400002300', '00110000038');
INSERT INTO `sys_role_menu` VALUES ('00110570069', '0000011400002300', '001102100453');
INSERT INTO `sys_role_menu` VALUES ('00110570070', '0000011400002300', '140068040034');
INSERT INTO `sys_role_menu` VALUES ('00110570071', '0000011400002300', '140068041049');
INSERT INTO `sys_role_menu` VALUES ('00110570072', '0000011400002300', '001102200462');
INSERT INTO `sys_role_menu` VALUES ('00110570073', '0000011400002300', '00110000056');
INSERT INTO `sys_role_menu` VALUES ('00110570074', '0000011400002300', '00110000065');
INSERT INTO `sys_role_menu` VALUES ('00110570075', '0000011400002300', '00110030092');
INSERT INTO `sys_role_menu` VALUES ('00110570076', '0000011400002300', '001100300101');
INSERT INTO `sys_role_menu` VALUES ('00110570077', '0000011400002300', '141102140018');
INSERT INTO `sys_role_menu` VALUES ('141000204740', '00000310148020228', '1');
INSERT INTO `sys_role_menu` VALUES ('141000204741', '00000310148020228', 'merchant_1002');
INSERT INTO `sys_role_menu` VALUES ('141000204742', '00000310148020228', 'userMerchant');
INSERT INTO `sys_role_menu` VALUES ('141000204743', '00000310148020228', 'userMerchant_insert');
INSERT INTO `sys_role_menu` VALUES ('141000204744', '00000310148020228', 'userMerchant_update');
INSERT INTO `sys_role_menu` VALUES ('141000204745', '00000310148020228', 'userMerchant_delete');
INSERT INTO `sys_role_menu` VALUES ('141000204746', '00000310148020228', 'userMerchant_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('141000204747', '00000310148020228', 'userMerchant_listPage');
INSERT INTO `sys_role_menu` VALUES ('141000204748', '00000310148020228', 'userMerchant_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('141000204749', '00000310148020228', 'userMerchant_addPage');
INSERT INTO `sys_role_menu` VALUES ('141000204750', '00000310148020228', 'userMerchant_editPage');
INSERT INTO `sys_role_menu` VALUES ('141000204751', '00000310148020228', 'userMerchant_detailPage');
INSERT INTO `sys_role_menu` VALUES ('141000204752', '00000310148020228', 'confUserFee');
INSERT INTO `sys_role_menu` VALUES ('1400001400534', '000003101208100017', '1');
INSERT INTO `sys_role_menu` VALUES ('1400001400535', '000003101208100017', 'system');
INSERT INTO `sys_role_menu` VALUES ('1400001400536', '000003101208100017', 'baseNotice');
INSERT INTO `sys_role_menu` VALUES ('1400001400537', '000003101208100017', 'system_priv');
INSERT INTO `sys_role_menu` VALUES ('1400001400538', '000003101208100017', 'system_priv_user');
INSERT INTO `sys_role_menu` VALUES ('1400001400539', '000003101208100017', 'system_priv_role');
INSERT INTO `sys_role_menu` VALUES ('1400001400540', '000003101208100017', 'system_conf');
INSERT INTO `sys_role_menu` VALUES ('1400001400541', '000003101208100017', 'system_conf_data');
INSERT INTO `sys_role_menu` VALUES ('1400001400542', '000003101208100017', 'sysPdlevel');
INSERT INTO `sys_role_menu` VALUES ('1400001400543', '000003101208100017', 'sysSystem');
INSERT INTO `sys_role_menu` VALUES ('1400001400544', '000003101208100017', 'system_conf_datatype');
INSERT INTO `sys_role_menu` VALUES ('1400001400545', '000003101208100017', '9');
INSERT INTO `sys_role_menu` VALUES ('141000204753', '00000310148020228', 'confUserFee_listPage');
INSERT INTO `sys_role_menu` VALUES ('141000204754', '00000310148020228', 'confUserFee_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('141000204755', '00000310148020228', 'confUserFee_addPage');
INSERT INTO `sys_role_menu` VALUES ('141000204756', '00000310148020228', 'confUserFee_editPage');
INSERT INTO `sys_role_menu` VALUES ('141000204757', '00000310148020228', 'confUserFee_detailPage');
INSERT INTO `sys_role_menu` VALUES ('141000204758', '00000310148020228', 'confUserFee_insert');
INSERT INTO `sys_role_menu` VALUES ('141000204759', '00000310148020228', 'confUserFee_update');
INSERT INTO `sys_role_menu` VALUES ('141000204760', '00000310148020228', 'confUserFee_delete');
INSERT INTO `sys_role_menu` VALUES ('141000204761', '00000310148020228', 'confUserFee_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('141000204762', '00000310148020228', 'confBankAccount');
INSERT INTO `sys_role_menu` VALUES ('141000204763', '00000310148020228', 'confBankAccount_listPage');
INSERT INTO `sys_role_menu` VALUES ('141000204764', '00000310148020228', 'confBankAccount_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('141000204765', '00000310148020228', 'confBankAccount_addPage');
INSERT INTO `sys_role_menu` VALUES ('141000204766', '00000310148020228', 'confBankAccount_editPage');
INSERT INTO `sys_role_menu` VALUES ('141000204767', '00000310148020228', 'confBankAccount_detailPage');
INSERT INTO `sys_role_menu` VALUES ('141000204768', '00000310148020228', 'confBankAccount_insert');
INSERT INTO `sys_role_menu` VALUES ('141000204769', '00000310148020228', 'confBankAccount_update');
INSERT INTO `sys_role_menu` VALUES ('141000204770', '00000310148020228', 'confBankAccount_delete');
INSERT INTO `sys_role_menu` VALUES ('141000204771', '00000310148020228', 'confBankAccount_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('141000204772', '00000310148020228', 'userManagerInfo');
INSERT INTO `sys_role_menu` VALUES ('141000204773', '00000310148020228', 'userManagerInfo_listPage');
INSERT INTO `sys_role_menu` VALUES ('141000204774', '00000310148020228', 'userManagerInfo_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('141000204775', '00000310148020228', 'userManagerInfo_addPage');
INSERT INTO `sys_role_menu` VALUES ('141000204776', '00000310148020228', 'userManagerInfo_editPage');
INSERT INTO `sys_role_menu` VALUES ('141000204777', '00000310148020228', 'userManagerInfo_detailPage');
INSERT INTO `sys_role_menu` VALUES ('141000204778', '00000310148020228', 'userManagerInfo_insert');
INSERT INTO `sys_role_menu` VALUES ('141000204779', '00000310148020228', 'userManagerInfo_update');
INSERT INTO `sys_role_menu` VALUES ('141000204780', '00000310148020228', 'userManagerInfo_delete');
INSERT INTO `sys_role_menu` VALUES ('141000204781', '00000310148020228', 'userManagerInfo_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('141000204782', '00000310148020228', 'rptMerchantJs');
INSERT INTO `sys_role_menu` VALUES ('141000204783', '00000310148020228', 'rptMerchantJs_listPage');
INSERT INTO `sys_role_menu` VALUES ('141000204784', '00000310148020228', 'rptMerchantJs_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('141000204785', '00000310148020228', 'rptMerchantJs_addPage');
INSERT INTO `sys_role_menu` VALUES ('141000204786', '00000310148020228', 'rptMerchantJs_editPage');
INSERT INTO `sys_role_menu` VALUES ('141000204787', '00000310148020228', 'rptMerchantJs_detailPage');
INSERT INTO `sys_role_menu` VALUES ('141000204788', '00000310148020228', 'rptMerchantJs_insert');
INSERT INTO `sys_role_menu` VALUES ('141000204789', '00000310148020228', 'rptMerchantJs_update');
INSERT INTO `sys_role_menu` VALUES ('141000204790', '00000310148020228', 'rptMerchantJs_delete');
INSERT INTO `sys_role_menu` VALUES ('141000204791', '00000310148020228', 'rptMerchantJs_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('141000204792', '00000310148020228', 'user');
INSERT INTO `sys_role_menu` VALUES ('141000204793', '00000310148020228', 'userAgent');
INSERT INTO `sys_role_menu` VALUES ('141000204794', '00000310148020228', 'userAgent_detailPage');
INSERT INTO `sys_role_menu` VALUES ('141000204795', '00000310148020228', 'userAgent_listPage');
INSERT INTO `sys_role_menu` VALUES ('141000204796', '00000310148020228', 'userAgent_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('141000204797', '00000310148020228', 'userAgent_addPage');
INSERT INTO `sys_role_menu` VALUES ('141000204798', '00000310148020228', 'userAgent_editPage');
INSERT INTO `sys_role_menu` VALUES ('141000204799', '00000310148020228', 'userAgent_insert');
INSERT INTO `sys_role_menu` VALUES ('1410002047100', '00000310148020228', 'userAgent_update');
INSERT INTO `sys_role_menu` VALUES ('1410002047101', '00000310148020228', 'userAgent_delete');
INSERT INTO `sys_role_menu` VALUES ('1410002047102', '00000310148020228', 'userAgent_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('1410002047103', '00000310148020228', '00040050015');
INSERT INTO `sys_role_menu` VALUES ('1410002047104', '00000310148020228', 'userCustomer');
INSERT INTO `sys_role_menu` VALUES ('1410002047105', '00000310148020228', 'userCustomer_listPage');
INSERT INTO `sys_role_menu` VALUES ('1410002047106', '00000310148020228', 'userCustomer_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('1410002047107', '00000310148020228', 'userCustomer_addPage');
INSERT INTO `sys_role_menu` VALUES ('1410002047108', '00000310148020228', 'userCustomer_editPage');
INSERT INTO `sys_role_menu` VALUES ('1410002047109', '00000310148020228', 'userCustomer_detailPage');
INSERT INTO `sys_role_menu` VALUES ('1410002047110', '00000310148020228', 'userCustomer_insert');
INSERT INTO `sys_role_menu` VALUES ('1410002047111', '00000310148020228', 'userCustomer_update');
INSERT INTO `sys_role_menu` VALUES ('1410002047112', '00000310148020228', 'userCustomer_delete');
INSERT INTO `sys_role_menu` VALUES ('1410002047113', '00000310148020228', 'userCustomer_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('1410002047114', '00000310148020228', 'glAccount');
INSERT INTO `sys_role_menu` VALUES ('1410002047115', '00000310148020228', 'glAccount_listPage');
INSERT INTO `sys_role_menu` VALUES ('1410002047116', '00000310148020228', 'glAccount_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('1410002047117', '00000310148020228', 'glAccount_addPage');
INSERT INTO `sys_role_menu` VALUES ('1410002047118', '00000310148020228', 'glAccount_editPage');
INSERT INTO `sys_role_menu` VALUES ('1410002047119', '00000310148020228', 'glAccount_detailPage');
INSERT INTO `sys_role_menu` VALUES ('1410002047120', '00000310148020228', 'glAccount_insert');
INSERT INTO `sys_role_menu` VALUES ('1410002047121', '00000310148020228', 'glAccount_update');
INSERT INTO `sys_role_menu` VALUES ('1410002047122', '00000310148020228', 'glAccount_delete');
INSERT INTO `sys_role_menu` VALUES ('1410002047123', '00000310148020228', 'glAccount_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('1410002047124', '00000310148020228', 'glAccountDetail');
INSERT INTO `sys_role_menu` VALUES ('1410002047125', '00000310148020228', 'glAccountDetail_listPage');
INSERT INTO `sys_role_menu` VALUES ('1410002047126', '00000310148020228', 'glAccountDetail_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('1410002047127', '00000310148020228', 'glAccountDetail_addPage');
INSERT INTO `sys_role_menu` VALUES ('1410002047128', '00000310148020228', 'glAccountDetail_editPage');
INSERT INTO `sys_role_menu` VALUES ('1410002047129', '00000310148020228', 'glAccountDetail_detailPage');
INSERT INTO `sys_role_menu` VALUES ('1410002047130', '00000310148020228', 'glAccountDetail_insert');
INSERT INTO `sys_role_menu` VALUES ('1410002047131', '00000310148020228', 'glAccountDetail_update');
INSERT INTO `sys_role_menu` VALUES ('1410002047132', '00000310148020228', 'glAccountDetail_delete');
INSERT INTO `sys_role_menu` VALUES ('1410002047133', '00000310148020228', 'glAccountDetail_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('1410002047134', '00000310148020228', 'glRecharge');
INSERT INTO `sys_role_menu` VALUES ('1410002047135', '00000310148020228', 'glRecharge_listPage');
INSERT INTO `sys_role_menu` VALUES ('1410002047136', '00000310148020228', 'glRecharge_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('1410002047137', '00000310148020228', 'glRecharge_addPage');
INSERT INTO `sys_role_menu` VALUES ('1410002047138', '00000310148020228', 'glRecharge_editPage');
INSERT INTO `sys_role_menu` VALUES ('1410002047139', '00000310148020228', 'glRecharge_detailPage');
INSERT INTO `sys_role_menu` VALUES ('1410002047140', '00000310148020228', 'glRecharge_insert');
INSERT INTO `sys_role_menu` VALUES ('1410002047141', '00000310148020228', 'glRecharge_update');
INSERT INTO `sys_role_menu` VALUES ('1410002047142', '00000310148020228', 'glRecharge_delete');
INSERT INTO `sys_role_menu` VALUES ('1410002047143', '00000310148020228', 'glRecharge_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('1410002047144', '00000310148020228', '100000208181');
INSERT INTO `sys_role_menu` VALUES ('1410002047145', '00000310148020228', '1000504016');
INSERT INTO `sys_role_menu` VALUES ('1410002047146', '00000310148020228', '100200046273');
INSERT INTO `sys_role_menu` VALUES ('1410002047147', '00000310148020228', '00002440073');
INSERT INTO `sys_role_menu` VALUES ('1410002047148', '00000310148020228', '00002440075');
INSERT INTO `sys_role_menu` VALUES ('1410002047149', '00000310148020228', '00002442376');
INSERT INTO `sys_role_menu` VALUES ('1410002047150', '00000310148020228', '00002442777');
INSERT INTO `sys_role_menu` VALUES ('1410002047151', '00000310148020228', '00002442379');
INSERT INTO `sys_role_menu` VALUES ('1410002047152', '00000310148020228', '00002440681');
INSERT INTO `sys_role_menu` VALUES ('1410002047153', '00000310148020228', '00002440082');
INSERT INTO `sys_role_menu` VALUES ('1410002047154', '00000310148020228', '00002440683');
INSERT INTO `sys_role_menu` VALUES ('1410002047155', '00000310148020228', '00002442084');
INSERT INTO `sys_role_menu` VALUES ('1410002047156', '00000310148020228', 'trans');
INSERT INTO `sys_role_menu` VALUES ('1410002047157', '00000310148020228', 'transYsh');
INSERT INTO `sys_role_menu` VALUES ('1410002047158', '00000310148020228', 'transYsh_listPage');
INSERT INTO `sys_role_menu` VALUES ('1410002047159', '00000310148020228', 'transYsh_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('1410002047160', '00000310148020228', 'transYsh_addPage');
INSERT INTO `sys_role_menu` VALUES ('1410002047161', '00000310148020228', 'transYsh_editPage');
INSERT INTO `sys_role_menu` VALUES ('1410002047162', '00000310148020228', 'transYsh_detailPage');
INSERT INTO `sys_role_menu` VALUES ('1410002047163', '00000310148020228', 'transYsh_insert');
INSERT INTO `sys_role_menu` VALUES ('1410002047164', '00000310148020228', 'transYsh_update');
INSERT INTO `sys_role_menu` VALUES ('1410002047165', '00000310148020228', 'transYsh_delete');
INSERT INTO `sys_role_menu` VALUES ('1410002047166', '00000310148020228', 'transYsh_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('1410002047167', '00000310148020228', '0000200006');
INSERT INTO `sys_role_menu` VALUES ('1410002047168', '00000310148020228', '00002000013');
INSERT INTO `sys_role_menu` VALUES ('1410002047169', '00000310148020228', '00002000014');
INSERT INTO `sys_role_menu` VALUES ('1410002047170', '00000310148020228', '000000201049');
INSERT INTO `sys_role_menu` VALUES ('1410002047171', '00000310148020228', 'yshProgram');
INSERT INTO `sys_role_menu` VALUES ('1410002047172', '00000310148020228', 'yshProgram_listPage');
INSERT INTO `sys_role_menu` VALUES ('1410002047173', '00000310148020228', 'yshProgram_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('1410002047174', '00000310148020228', 'yshProgram_addPage');
INSERT INTO `sys_role_menu` VALUES ('1410002047175', '00000310148020228', 'yshProgram_editPage');
INSERT INTO `sys_role_menu` VALUES ('1410002047176', '00000310148020228', 'yshProgram_detailPage');
INSERT INTO `sys_role_menu` VALUES ('1410002047177', '00000310148020228', 'yshProgram_insert');
INSERT INTO `sys_role_menu` VALUES ('1410002047178', '00000310148020228', 'yshProgram_update');
INSERT INTO `sys_role_menu` VALUES ('1410002047179', '00000310148020228', 'yshProgram_delete');
INSERT INTO `sys_role_menu` VALUES ('1410002047180', '00000310148020228', 'yshProgram_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('1410002047181', '00000310148020228', 'coupons');
INSERT INTO `sys_role_menu` VALUES ('1410002047182', '00000310148020228', 'yshCoupon1');
INSERT INTO `sys_role_menu` VALUES ('1410002047183', '00000310148020228', 'yshCoupon2');
INSERT INTO `sys_role_menu` VALUES ('1410002047184', '00000310148020228', 'yshCoupon3');
INSERT INTO `sys_role_menu` VALUES ('1410002047185', '00000310148020228', 'yshCoupon');
INSERT INTO `sys_role_menu` VALUES ('1410002047186', '00000310148020228', 'yshCoupon_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('1410002047187', '00000310148020228', 'yshCoupon_listPage');
INSERT INTO `sys_role_menu` VALUES ('1410002047188', '00000310148020228', 'yshCoupon_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('1410002047189', '00000310148020228', 'yshCoupon_addPage');
INSERT INTO `sys_role_menu` VALUES ('1410002047190', '00000310148020228', 'yshCoupon_editPage');
INSERT INTO `sys_role_menu` VALUES ('1410002047191', '00000310148020228', 'yshCoupon_detailPage');
INSERT INTO `sys_role_menu` VALUES ('1410002047192', '00000310148020228', 'yshCoupon_insert');
INSERT INTO `sys_role_menu` VALUES ('1410002047193', '00000310148020228', 'yshCoupon_update');
INSERT INTO `sys_role_menu` VALUES ('1410002047194', '00000310148020228', 'yshCoupon_delete');
INSERT INTO `sys_role_menu` VALUES ('1410002047195', '00000310148020228', 'confBankCoupon');
INSERT INTO `sys_role_menu` VALUES ('1410002047196', '00000310148020228', 'base');
INSERT INTO `sys_role_menu` VALUES ('1410002047197', '00000310148020228', 'baseBusinessType');
INSERT INTO `sys_role_menu` VALUES ('1410002047198', '00000310148020228', 'baseBusinessType_delete');
INSERT INTO `sys_role_menu` VALUES ('1410002047199', '00000310148020228', 'baseBusinessType_deleteMulti');
INSERT INTO `sys_role_menu` VALUES ('1410002047200', '00000310148020228', 'baseBusinessType_listPage');
INSERT INTO `sys_role_menu` VALUES ('1410002047201', '00000310148020228', 'baseBusinessType_dataGrid');
INSERT INTO `sys_role_menu` VALUES ('1410002047202', '00000310148020228', 'baseBusinessType_addPage');
INSERT INTO `sys_role_menu` VALUES ('1410002047203', '00000310148020228', 'baseBusinessType_editPage');
INSERT INTO `sys_role_menu` VALUES ('1410002047204', '00000310148020228', 'baseBusinessType_detailPage');
INSERT INTO `sys_role_menu` VALUES ('1410002047205', '00000310148020228', 'baseBusinessType_insert');
INSERT INTO `sys_role_menu` VALUES ('1410002047206', '00000310148020228', 'baseBusinessType_update');
INSERT INTO `sys_role_menu` VALUES ('1410002047207', '00000310148020228', 'baseBusinessArea');
INSERT INTO `sys_role_menu` VALUES ('1410002047208', '00000310148020228', 'system');
INSERT INTO `sys_role_menu` VALUES ('1410002047209', '00000310148020228', 'baseNotice');
INSERT INTO `sys_role_menu` VALUES ('1410002047210', '00000310148020228', 'system_priv');
INSERT INTO `sys_role_menu` VALUES ('1410002047211', '00000310148020228', 'system_priv_user');
INSERT INTO `sys_role_menu` VALUES ('1410002047212', '00000310148020228', 'system_priv_role');
INSERT INTO `sys_role_menu` VALUES ('1410002047213', '00000310148020228', 'system_priv_log');
INSERT INTO `sys_role_menu` VALUES ('1410002047214', '00000310148020228', 'system_conf');
INSERT INTO `sys_role_menu` VALUES ('1410002047215', '00000310148020228', 'system_conf_data');
INSERT INTO `sys_role_menu` VALUES ('1410002047216', '00000310148020228', 'sysPdlevel');
INSERT INTO `sys_role_menu` VALUES ('1410002047217', '00000310148020228', 'sysSystem');
INSERT INTO `sys_role_menu` VALUES ('1410002047218', '00000310148020228', 'system_conf_datatype');
INSERT INTO `sys_role_menu` VALUES ('1410002047219', '00000310148020228', '9');
INSERT INTO `sys_role_menu` VALUES ('1410020005241', '000003101402420211', '1406082000154');
INSERT INTO `sys_role_menu` VALUES ('1410020005242', '000003101402420211', '100840310044');
INSERT INTO `sys_role_menu` VALUES ('1410020005243', '000003101402420211', '1000000400848');
INSERT INTO `sys_role_menu` VALUES ('1410020005244', '000003101402420211', '1000000400804');
INSERT INTO `sys_role_menu` VALUES ('1410020005245', '000003101402420211', '1000000400826');
INSERT INTO `sys_role_menu` VALUES ('1410020005246', '000003101402420211', '1000000000859');
INSERT INTO `sys_role_menu` VALUES ('1410020005247', '000003101402420211', '1000000004870');
INSERT INTO `sys_role_menu` VALUES ('1410020005248', '000003101402420211', '100840305080');
INSERT INTO `sys_role_menu` VALUES ('1410020005249', '000003101402420211', '100840401092');
INSERT INTO `sys_role_menu` VALUES ('1410020005250', '000003101402420211', '100840311086');
INSERT INTO `sys_role_menu` VALUES ('1410020005251', '000003101402420211', '100840401098');
INSERT INTO `sys_role_menu` VALUES ('1410020005252', '000003101402420211', '100200044284');
INSERT INTO `sys_role_menu` VALUES ('1410020005253', '000003101402420211', '1000000000892');
INSERT INTO `sys_role_menu` VALUES ('1410020005254', '000003101402420211', '1000001004903');
INSERT INTO `sys_role_menu` VALUES ('1410086043', '0000050400000460', '1406082020165');
INSERT INTO `sys_role_menu` VALUES ('1410086044', '0000050400000460', '100618010321');
INSERT INTO `sys_role_menu` VALUES ('1410086045', '0000050400000460', '100618019322');
INSERT INTO `sys_role_menu` VALUES ('1410086046', '0000050400000460', '100650600122');
INSERT INTO `sys_role_menu` VALUES ('1410086047', '0000050400000460', '100618000323');
INSERT INTO `sys_role_menu` VALUES ('1410086048', '0000050400000460', '100618001324');
INSERT INTO `sys_role_menu` VALUES ('1400001000244', '0000031400160120', '1406082000154');
INSERT INTO `sys_role_menu` VALUES ('1400001000245', '0000031400160120', '100840310044');
INSERT INTO `sys_role_menu` VALUES ('1400001000246', '0000031400160120', '1000000400848');
INSERT INTO `sys_role_menu` VALUES ('1400001000247', '0000031400160120', '1000000400804');
INSERT INTO `sys_role_menu` VALUES ('1400001000248', '0000031400160120', '1000000400826');
INSERT INTO `sys_role_menu` VALUES ('1400001000249', '0000031400160120', '1000000000859');
INSERT INTO `sys_role_menu` VALUES ('1400001000250', '0000031400160120', '1000000004870');
INSERT INTO `sys_role_menu` VALUES ('1400001000251', '0000031400160120', '100840305080');
INSERT INTO `sys_role_menu` VALUES ('1400001000252', '0000031400160120', '100840401092');
INSERT INTO `sys_role_menu` VALUES ('1400001000253', '0000031400160120', '100840311086');
INSERT INTO `sys_role_menu` VALUES ('1400001000254', '0000031400160120', '100840401098');
INSERT INTO `sys_role_menu` VALUES ('1400001000255', '0000031400160120', '100200044284');
INSERT INTO `sys_role_menu` VALUES ('1400001000256', '0000031400160120', '1000000000892');
INSERT INTO `sys_role_menu` VALUES ('1400001000257', '0000031400160120', '1000001004903');
INSERT INTO `sys_role_menu` VALUES ('14100125191', '0000050408011026', '1406082000154');
INSERT INTO `sys_role_menu` VALUES ('14100125192', '0000050408011026', '100840310044');
INSERT INTO `sys_role_menu` VALUES ('14100125193', '0000050408011026', '1000000400848');
INSERT INTO `sys_role_menu` VALUES ('14100125194', '0000050408011026', '1000000400804');
INSERT INTO `sys_role_menu` VALUES ('14100125195', '0000050408011026', '1000000400826');
INSERT INTO `sys_role_menu` VALUES ('14100125196', '0000050408011026', '1000000000859');
INSERT INTO `sys_role_menu` VALUES ('14100125197', '0000050408011026', '1000000004870');
INSERT INTO `sys_role_menu` VALUES ('14100125198', '0000050408011026', '100840305080');
INSERT INTO `sys_role_menu` VALUES ('14100125199', '0000050408011026', '100840401092');
INSERT INTO `sys_role_menu` VALUES ('14100125200', '0000050408011026', '100840311086');
INSERT INTO `sys_role_menu` VALUES ('14100125201', '0000050408011026', '100840401098');
INSERT INTO `sys_role_menu` VALUES ('14100125202', '0000050408011026', '100200044284');
INSERT INTO `sys_role_menu` VALUES ('14100125203', '0000050408011026', '1000000000892');
INSERT INTO `sys_role_menu` VALUES ('14100125204', '0000050408011026', '1000001004903');
INSERT INTO `sys_role_menu` VALUES ('10000026259', '00000100080060030', '00110000056');
INSERT INTO `sys_role_menu` VALUES ('10000026260', '00000100080060030', 'system_priv_user');
INSERT INTO `sys_role_menu` VALUES ('10000026261', '00000100080060030', '1000000400848');
INSERT INTO `sys_role_menu` VALUES ('10000026262', '00000100080060030', 'system_1001');
INSERT INTO `sys_role_menu` VALUES ('10000026263', '00000100080060030', 'system_conf_1001');
INSERT INTO `sys_role_menu` VALUES ('10000026264', '00000100080060030', 'system_conf_data_1001');
INSERT INTO `sys_role_menu` VALUES ('10000026265', '00000100080060030', '00006020111');
INSERT INTO `sys_role_menu` VALUES ('10000026266', '00000100080060030', 'system_priv_1001');
INSERT INTO `sys_role_menu` VALUES ('10000026267', '00000100080060030', 'system_priv_org_1001');
INSERT INTO `sys_role_menu` VALUES ('10000026268', '00000100080060030', 'system_priv_user_1001');
INSERT INTO `sys_role_menu` VALUES ('10000026269', '00000100080060030', 'system_priv_role_1001');
INSERT INTO `sys_role_menu` VALUES ('10000026270', '00000100080060030', 'system_priv_menu_1001');
INSERT INTO `sys_role_menu` VALUES ('10000026271', '00000100080060030', 'system_priv_log_1001');
INSERT INTO `sys_role_menu` VALUES ('10000026272', '00000100080060030', '10000024027');
INSERT INTO `sys_role_menu` VALUES ('10000026273', '00000100080060030', '10000024033');
INSERT INTO `sys_role_menu` VALUES ('10000026185', '00000110204035100', '00110000056');
INSERT INTO `sys_role_menu` VALUES ('10000026186', '00000110204035100', 'system_priv_user');
INSERT INTO `sys_role_menu` VALUES ('10000026187', '00000110204035100', '1000000400848');
INSERT INTO `sys_role_menu` VALUES ('10000026188', '00000110204035100', 'system_1001');
INSERT INTO `sys_role_menu` VALUES ('10000026189', '00000110204035100', 'system_conf_1001');
INSERT INTO `sys_role_menu` VALUES ('10000026190', '00000110204035100', 'system_conf_data_1001');
INSERT INTO `sys_role_menu` VALUES ('10000026191', '00000110204035100', 'system_priv_system_1001');
INSERT INTO `sys_role_menu` VALUES ('10000026192', '00000110204035100', '00006020111');
INSERT INTO `sys_role_menu` VALUES ('10000026193', '00000110204035100', '000060280102');
INSERT INTO `sys_role_menu` VALUES ('10000026194', '00000110204035100', 'system_conf_datatype_1001');
INSERT INTO `sys_role_menu` VALUES ('10000026195', '00000110204035100', '00006021117');
INSERT INTO `sys_role_menu` VALUES ('10000026196', '00000110204035100', 'system_priv_1001');
INSERT INTO `sys_role_menu` VALUES ('10000026197', '00000110204035100', 'system_priv_org_1001');
INSERT INTO `sys_role_menu` VALUES ('10000026198', '00000110204035100', 'system_priv_user_1001');
INSERT INTO `sys_role_menu` VALUES ('10000026199', '00000110204035100', 'system_priv_role_1001');
INSERT INTO `sys_role_menu` VALUES ('100000261100', '00000110204035100', 'system_priv_menu_1001');
INSERT INTO `sys_role_menu` VALUES ('100000261101', '00000110204035100', 'system_priv_log_1001');
INSERT INTO `sys_role_menu` VALUES ('100000261102', '00000110204035100', '10000024027');
INSERT INTO `sys_role_menu` VALUES ('100000261103', '00000110204035100', '10000024033');
INSERT INTO `sys_role_menu` VALUES ('000010104108', '0000011000101840', '00110000056');
INSERT INTO `sys_role_menu` VALUES ('000010104109', '0000011000101840', 'system_priv_user');
INSERT INTO `sys_role_menu` VALUES ('000010104110', '0000011000101840', '141045030118');
INSERT INTO `sys_role_menu` VALUES ('000010104111', '0000011000101840', 'system_1001');
INSERT INTO `sys_role_menu` VALUES ('000010104112', '0000011000101840', 'system_conf_1001');
INSERT INTO `sys_role_menu` VALUES ('000010104113', '0000011000101840', 'system_conf_data_1001');
INSERT INTO `sys_role_menu` VALUES ('000010104114', '0000011000101840', '00006020111');
INSERT INTO `sys_role_menu` VALUES ('000010104115', '0000011000101840', '00006021117');
INSERT INTO `sys_role_menu` VALUES ('000010104116', '0000011000101840', 'system_priv_1001');
INSERT INTO `sys_role_menu` VALUES ('000010104117', '0000011000101840', 'system_priv_org_1001');
INSERT INTO `sys_role_menu` VALUES ('000010104118', '0000011000101840', 'system_priv_user_1001');
INSERT INTO `sys_role_menu` VALUES ('000010104119', '0000011000101840', 'system_priv_role_1001');
INSERT INTO `sys_role_menu` VALUES ('000010104120', '0000011000101840', '1000000400848');
INSERT INTO `sys_role_menu` VALUES ('000010104121', '0000011000101840', '00110000029');
INSERT INTO `sys_role_menu` VALUES ('000010104122', '0000011000101840', '00110000038');
INSERT INTO `sys_role_menu` VALUES ('000010104123', '0000011000101840', '1406082020165');
INSERT INTO `sys_role_menu` VALUES ('000010104124', '0000011000101840', 'system_conf_datatype');
INSERT INTO `sys_role_menu` VALUES ('000010104125', '0000011000101840', 'system_conf_data');
INSERT INTO `sys_role_menu` VALUES ('000010104126', '0000011000101840', '100002200325');
INSERT INTO `sys_role_menu` VALUES ('000010104127', '0000011000101840', 'sysSystem');
INSERT INTO `sys_role_menu` VALUES ('000010104128', '0000011000101840', '10008603008');
INSERT INTO `sys_role_menu` VALUES ('000010104129', '0000011000101840', '14001028509');
INSERT INTO `sys_role_menu` VALUES ('000010104130', '0000011000101840', '140010305016_1');
INSERT INTO `sys_role_menu` VALUES ('000010104131', '0000011000101840', '1406082000154');
INSERT INTO `sys_role_menu` VALUES ('000010104132', '0000011000101840', '1000000400804');
INSERT INTO `sys_role_menu` VALUES ('000010104133', '0000011000101840', '1000000400826');
INSERT INTO `sys_role_menu` VALUES ('000010104134', '0000011000101840', '1000000004870');
INSERT INTO `sys_role_menu` VALUES ('000010104135', '0000011000101840', 'system_1001');
INSERT INTO `sys_role_menu` VALUES ('000010104136', '0000011000101840', 'system_conf_1001');
INSERT INTO `sys_role_menu` VALUES ('000010104137', '0000011000101840', 'system_conf_data_1001');
INSERT INTO `sys_role_menu` VALUES ('000010104138', '0000011000101840', '00006020111');
INSERT INTO `sys_role_menu` VALUES ('000010104139', '0000011000101840', '00006021117');
INSERT INTO `sys_role_menu` VALUES ('000010104140', '0000011000101840', 'system_priv_1001');
INSERT INTO `sys_role_menu` VALUES ('000010104141', '0000011000101840', 'system_priv_org_1001');
INSERT INTO `sys_role_menu` VALUES ('000010104142', '0000011000101840', 'system_priv_user_1001');
INSERT INTO `sys_role_menu` VALUES ('000010104143', '0000011000101840', 'system_priv_role_1001');
INSERT INTO `sys_role_menu` VALUES ('1421810001264', '0000000214001020100', '14211442067');
INSERT INTO `sys_role_menu` VALUES ('1421810001265', '0000000214001020100', '14211443078');
INSERT INTO `sys_role_menu` VALUES ('1421810001266', '0000000214001020100', 'userManagerInfo');
INSERT INTO `sys_role_menu` VALUES ('1421810001267', '0000000214001020100', '1421810111240');
INSERT INTO `sys_role_menu` VALUES ('1421810001268', '0000000214001020100', '1421810016249');
INSERT INTO `sys_role_menu` VALUES ('1421810001269', '0000000214001020100', 'coupons');
INSERT INTO `sys_role_menu` VALUES ('1421810001270', '0000000214001020100', 'yshCoupon1');
INSERT INTO `sys_role_menu` VALUES ('1421810001271', '0000000214001020100', 'yshCoupon2');
INSERT INTO `sys_role_menu` VALUES ('1421810001272', '0000000214001020100', 'yshCoupon3');
INSERT INTO `sys_role_menu` VALUES ('00020000043', '000000011401004050', '14211441153');
INSERT INTO `sys_role_menu` VALUES ('00020000044', '000000011401004050', 'yshProgram');
INSERT INTO `sys_role_menu` VALUES ('00020000045', '000000011401004050', 'transYsh');
INSERT INTO `sys_role_menu` VALUES ('00020000046', '000000011401004050', '00020001230');
INSERT INTO `sys_role_menu` VALUES ('100070014092', '00000114040040000', '1440100008');
INSERT INTO `sys_role_menu` VALUES ('100070014093', '00000114040040000', '14401001114');
INSERT INTO `sys_role_menu` VALUES ('100070014094', '00000114040040000', '004000015814');
INSERT INTO `sys_role_menu` VALUES ('100070014095', '00000114040040000', '004000010088');
INSERT INTO `sys_role_menu` VALUES ('100070014096', '00000114040040000', '10000000029');
INSERT INTO `sys_role_menu` VALUES ('100070014097', '00000114040040000', '1040044214');
INSERT INTO `sys_role_menu` VALUES ('100070014098', '00000114040040000', '1040044099');
INSERT INTO `sys_role_menu` VALUES ('100070014099', '00000114040040000', '1000100010140');
INSERT INTO `sys_role_menu` VALUES ('1000700140100', '00000114040040000', '10000601408');
INSERT INTO `sys_role_menu` VALUES ('1000700140101', '00000114040040000', '10001210008');
INSERT INTO `sys_role_menu` VALUES ('1000700140102', '00000114040040000', '0400110009');
INSERT INTO `sys_role_menu` VALUES ('1000700140103', '00000114040040000', '00110000056');
INSERT INTO `sys_role_menu` VALUES ('1000700140104', '00000114040040000', 'system_priv_user');
INSERT INTO `sys_role_menu` VALUES ('1000700140105', '00000114040040000', '1000000400848');
INSERT INTO `sys_role_menu` VALUES ('1000700140106', '00000114040040000', '00110000029');
INSERT INTO `sys_role_menu` VALUES ('1000700140107', '00000114040040000', '14001028509');
INSERT INTO `sys_role_menu` VALUES ('1000700140108', '00000114040040000', '10240030009');
INSERT INTO `sys_role_menu` VALUES ('1000700140109', '00000114040040000', '00110000038');
INSERT INTO `sys_role_menu` VALUES ('1000700140110', '00000114040040000', '1406082020165');
INSERT INTO `sys_role_menu` VALUES ('1000700140111', '00000114040040000', 'system_conf_datatype');
INSERT INTO `sys_role_menu` VALUES ('1000700140112', '00000114040040000', 'system_conf_data');
INSERT INTO `sys_role_menu` VALUES ('1000700140113', '00000114040040000', '100002200325');
INSERT INTO `sys_role_menu` VALUES ('1000700140114', '00000114040040000', 'sysSystem');
INSERT INTO `sys_role_menu` VALUES ('1000700140115', '00000114040040000', '10008603008');
INSERT INTO `sys_role_menu` VALUES ('1000700140116', '00000114040040000', '00044306047');
INSERT INTO `sys_role_menu` VALUES ('1000700140117', '00000114040040000', '1406082000154');
INSERT INTO `sys_role_menu` VALUES ('1000700140118', '00000114040040000', '1000000400804');
INSERT INTO `sys_role_menu` VALUES ('1000700140119', '00000114040040000', '1000000400826');
INSERT INTO `sys_role_menu` VALUES ('1000700140120', '00000114040040000', '1000001004903');
INSERT INTO `sys_role_menu` VALUES ('1000700140121', '00000114040040000', 'system_1001');
INSERT INTO `sys_role_menu` VALUES ('1000700140122', '00000114040040000', 'system_conf_1001');
INSERT INTO `sys_role_menu` VALUES ('1000700140123', '00000114040040000', '000060280102');
INSERT INTO `sys_role_menu` VALUES ('1000700140124', '00000114040040000', '00006020111');
INSERT INTO `sys_role_menu` VALUES ('1000700140125', '00000114040040000', '00006021117');
INSERT INTO `sys_role_menu` VALUES ('1000700140126', '00000114040040000', '100000190135');
INSERT INTO `sys_role_menu` VALUES ('1000700140127', '00000114040040000', 'system_conf_data_1001');
INSERT INTO `sys_role_menu` VALUES ('1000700140128', '00000114040040000', 'system_priv_1001');
INSERT INTO `sys_role_menu` VALUES ('1000700140129', '00000114040040000', 'system_priv_org_1001');
INSERT INTO `sys_role_menu` VALUES ('1000700140130', '00000114040040000', 'system_priv_user_1001');
INSERT INTO `sys_role_menu` VALUES ('000600030146', '1002000001', 'system_1001');
INSERT INTO `sys_role_menu` VALUES ('000600030147', '1002000001', 'system_conf_1001');
INSERT INTO `sys_role_menu` VALUES ('000600030148', '1002000001', 'system_conf_data_1001');
INSERT INTO `sys_role_menu` VALUES ('000600030149', '1002000001', 'system_conf_datatype_1001');
INSERT INTO `sys_role_menu` VALUES ('000600030150', '1002000001', 'system_priv_1001');
INSERT INTO `sys_role_menu` VALUES ('000600030151', '1002000001', 'system_priv_org_1001');
INSERT INTO `sys_role_menu` VALUES ('000600030152', '1002000001', 'system_priv_user_1001');
INSERT INTO `sys_role_menu` VALUES ('000600030153', '1002000001', 'system_priv_role_1001');
INSERT INTO `sys_role_menu` VALUES ('000600030154', '1002000001', 'system_priv_menu_1001');
INSERT INTO `sys_role_menu` VALUES ('000600030155', '1002000001', 'system_priv_log_1001');
INSERT INTO `sys_role_menu` VALUES ('000600030156', '1002000001', '14004001019');
INSERT INTO `sys_role_menu` VALUES ('000600030157', '1002000001', 'system_priv_system_1001');
INSERT INTO `sys_role_menu` VALUES ('000600030158', '1002000001', '10000024027');
INSERT INTO `sys_role_menu` VALUES ('000600030159', '1002000001', '10000024033');

-- ----------------------------
-- Table structure for `sys_system`
-- ----------------------------
DROP TABLE IF EXISTS `sys_system`;
CREATE TABLE `sys_system` (
  `SS_ID` varchar(40) DEFAULT NULL,
  `SS_URL` varchar(250) DEFAULT NULL,
  `SS_NAME` varchar(50) DEFAULT NULL,
  `SS_TS` varchar(19) DEFAULT NULL,
  `SS_DESC` text,
  `SS_ADDUSER` varchar(40) DEFAULT NULL,
  `SS_ADDDATE` varchar(19) DEFAULT NULL,
  `SS_MODIFYUSER` varchar(40) DEFAULT NULL,
  `SS_MODIFYDATE` varchar(19) DEFAULT NULL,
  `SS_DELETEUSER` varchar(40) DEFAULT NULL,
  `SS_DELETEDATE` varchar(19) DEFAULT NULL,
  `SS_VERSION` decimal(10,0) DEFAULT NULL,
  `SS_DR` varchar(1) DEFAULT NULL,
  `SS_CODE` varchar(50) DEFAULT NULL,
  UNIQUE KEY `SYS_C0035342` (`SS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_system
-- ----------------------------
INSERT INTO `sys_system` VALUES ('1001', null, '系统管理平台', '2014-07-23 10:11:02', null, '140164722000', '2014-07-23 10:11:02', '140164722000', '2014-07-23 13:29:10', null, null, '3', '1', '1001');
INSERT INTO `sys_system` VALUES ('1002', null, '物业管理平台', '2014-07-23 10:12:02', null, '140164722000', '2014-07-23 10:12:02', '100402116118', '2015-01-14 00:24:56', null, null, '2', '1', '1002');
INSERT INTO `sys_system` VALUES ('1003', null, '代理商平台', '2014-07-23 10:12:22', null, '140164722000', '2014-07-23 10:12:22', null, null, '100402116118', '2014-12-27 18:27:09', '1', '0', '1003');
INSERT INTO `sys_system` VALUES ('1004', null, '商户CRM平台', '2014-07-23 10:12:37', null, '140164722000', '2014-07-23 10:12:37', null, null, '100402116118', '2014-12-27 18:27:06', '1', '0', '1004');
INSERT INTO `sys_system` VALUES ('1006', null, '代付平台', '2014-09-29 10:27:18', null, '100402116118', '2014-09-29 10:27:18', null, null, '100402116118', '2014-12-27 18:26:59', '1', '0', '1006');
INSERT INTO `sys_system` VALUES ('1007', null, '易淘客系统', '2014-09-25 12:00:00', null, '1002000020', '2014-09-25 12:00:00', null, null, '100402116118', '2014-12-27 18:26:55', '1', '0', '1007');
INSERT INTO `sys_system` VALUES ('1005', null, '多渠道系统', '2014-08-26 04:40:09', null, '100402116118', '2014-08-26 04:40:09', null, null, '100402116118', '2014-12-27 18:27:03', '1', '0', '1005');
INSERT INTO `sys_system` VALUES ('14211443121', null, '商家管理平台', '2015-01-14 00:25:10', null, '100402116118', '2015-01-14 00:25:10', null, null, null, null, '1', '1', '1003');

-- ----------------------------
-- Table structure for `sys_uppd_log`
-- ----------------------------
DROP TABLE IF EXISTS `sys_uppd_log`;
CREATE TABLE `sys_uppd_log` (
  `SUL_ID` varchar(20) DEFAULT NULL,
  `SUL_CREATID` varchar(30) DEFAULT NULL,
  `SUL_UPTIME` varchar(19) DEFAULT NULL,
  `SUL_OLDPD` varchar(128) DEFAULT NULL,
  `SUL_NEWPD` varchar(128) DEFAULT NULL,
  `SUL_INSERTTIME` varchar(19) DEFAULT NULL,
  `SUL_SP_ID` varchar(10) DEFAULT NULL,
  `SUL_DESC` text,
  UNIQUE KEY `SYS_C0035344` (`SUL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_uppd_log
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `SU_ID` varchar(40) NOT NULL DEFAULT '',
  `SU_LOGINNAME` varchar(36) DEFAULT NULL,
  `SU_NAME` varchar(50) DEFAULT NULL,
  `SU_PWD` varchar(128) DEFAULT NULL,
  `SU_SEX` varchar(4) DEFAULT NULL,
  `SU_EMAIL` varchar(50) DEFAULT NULL,
  `SU_ORGID` varchar(40) DEFAULT NULL,
  `SU_STARTDATE` varchar(19) DEFAULT NULL,
  `SU_ENDDATE` varchar(19) DEFAULT NULL,
  `SU_USERTYPE` varchar(10) DEFAULT NULL,
  `SU_CREATEDATETIME` varchar(19) DEFAULT NULL,
  `SU_MODIFYDATETIME` varchar(19) DEFAULT NULL,
  `SU_VERSION` decimal(10,0) DEFAULT NULL,
  `SU_ERRORNUM` varchar(1) DEFAULT NULL,
  `SU_LASTLOGINDATA` varchar(19) DEFAULT NULL,
  `SU_DR` varchar(1) DEFAULT NULL,
  `SU_TS` varchar(19) DEFAULT NULL,
  `SU_PHONE` varchar(11) DEFAULT NULL,
  `SU_ROLE` varchar(2) DEFAULT NULL,
  `SU_USERID` varchar(40) DEFAULT NULL,
  `SU_PAY_PWD` varchar(100) DEFAULT NULL,
  `su_procice` varchar(10) DEFAULT NULL,
  `su_city` varchar(10) DEFAULT NULL,
  `su_district` varchar(10) DEFAULT NULL,
  `su_wx` varchar(50) DEFAULT NULL,
  `su_qq` varchar(10) DEFAULT NULL,
  `su_wb` varchar(10) DEFAULT NULL,
  `su_wxid` varchar(100) DEFAULT NULL,
  `su_Token` varchar(50) DEFAULT NULL,
  `su_address` varchar(50) DEFAULT NULL,
  `su_isauth` varchar(1) DEFAULT '1',
  `su_storeid` varchar(50) DEFAULT NULL,
  `SU_STATUS` varchar(2) DEFAULT NULL,
  `su_communityid` varchar(50) DEFAULT NULL,
  `su_headimgurl` varchar(200) DEFAULT NULL,
  `su_openid` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`SU_ID`),
  UNIQUE KEY `SYS_C0035346` (`SU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('000001100000401404157570271661673322', 'fenglt', '冯利涛', '21b95a0f90138767b0fd324e6be3457b', 'F', null, '00000001', '2014-12-29', null, '01', null, '2015-04-17 17:18:17', '98', null, null, '1', '2014-12-29 21:02:22', '15801403629', '1', '00000001', null, null, null, null, null, null, null, null, null, null, null, null, '0', null, null, null);
INSERT INTO `sys_user` VALUES ('000001100000405412861836002266015648', 'xiaoy', '小勇', 'ca4c9d1c49e77490ae96782eef7b0057', 'M', null, '00000001', '2014-12-29', null, '01', '2015-01-11 21:06:51', '2015-04-17 17:40:50', '9', null, '2015-05-26 11:20:34', '1', '2014-12-29 21:09:09', '15801403629', '1', '00000001', null, null, null, null, null, null, null, null, null, null, '1', null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('000001100110422270040115560424664137', 'dev1', '开发账号', 'c4ca4238a0b923820dcc509a6f75849b', 'M', null, '00000001', '2014-12-29', null, '01', '2014-12-29 17:44:27', '2014-12-29 17:44:50', '5', null, '2015-07-13 13:46:51', '1', '2014-12-29 17:44:27', '15801403629', '1', '00000001', null, null, null, null, null, null, null, null, null, null, '1', null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('000001110205201200582755172471127267', 'cora', 'cora', 'c4ca4238a0b923820dcc509a6f75849b', 'F', null, '00000001', '2015-01-06', null, '07', '2015-01-11 20:19:05', '2015-01-11 20:19:05', '3', null, '2015-01-11 20:19:05', '1', '2015-01-06 14:58:48', '15801403629', '1', '00000001', null, null, null, null, null, null, null, null, null, null, '1', null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('000001114180004301605864778012268240', 'abcdef', '张飞', 'c4ca4238a0b923820dcc509a6f75849b', 'M', 'jerry1550@163.com', '00000001', '2014-12-10', null, '01', '2015-02-28 16:54:04', '2015-02-28 16:54:04', '5', null, '2015-02-28 16:54:04', '1', '2014-12-11 17:33:59', '15801403628', '1', '00000001', null, null, null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('010000191800403704203773516085032447', 'zhangfei_163com', '张飞', 'c4ca4238a0b923820dcc509a6f75849b', 'M', 'zhangfei@163.com', '00000002', '2015-03-04', null, '03', null, '2015-03-04 13:22:30', '9', null, '2015-03-09 12:15:58', '1', '2015-01-25 21:19:48', '18501403629', '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('010001821100013318450041072577220060', 'dengh', '邓宏', '21218cca77804d2ba1922c33e0151105', 'F', null, '00000001', '2015-03-10', null, '01', '2015-03-10 01:25:05', null, '53', null, '2015-05-27 10:50:24', '1', '2015-03-10 01:25:05', null, '1', '00000001', null, null, null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('010002000400158544688567324456716000', 'liqh', '李庆华', '21218cca77804d2ba1922c33e0151105', 'M', null, '00000001', '2015-03-11', null, '01', '2015-03-11 18:13:10', null, '3', null, '2015-03-17 23:51:42', '1', '2015-03-11 18:13:10', null, '1', '00000001', null, null, null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('010002000420015801360175364525316675', 'luhy', '卢海影', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000001', '2015-03-11', null, '01', '2015-03-11 18:12:05', '2015-05-06 13:45:08', '72', null, '2015-07-10 13:30:08', '1', '2015-03-11 18:12:05', null, '1', '00000001', null, null, null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('010020001420841317634443621731363100', 'abc85', '张飞', 'c4ca4238a0b923820dcc509a6f75849b', 'M', 'jerry@163.com', '00000001', '2015-01-11', null, '03', '2015-01-25 21:14:58', '2015-01-25 21:14:58', '2', null, '2015-01-25 21:14:58', '1', '2015-01-11 21:09:27', '15801403620', null, '00000001', null, null, null, null, '1xxxx', null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('011400100400216271352676260615883602', 'yuanzeng', 'yuanzeng', '21218cca77804d2ba1922c33e0151105', 'M', null, '00000001', '2015-08-28', null, '01', null, '2015-08-28 14:02:38', '3', null, '2015-08-28 14:11:42', '1', '2015-08-28 14:01:37', null, '1', '00000001', null, null, null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('011404110565074035726573136643034815', 'liutao', '刘涛', '21218cca77804d2ba1922c33e0151105', 'M', null, '00000001', '2015-02-28', null, '01', '2015-02-28 16:56:15', '2015-02-28 16:56:15', '1', null, '2015-02-28 16:56:15', '1', '2015-02-28 16:56:15', null, '2', '00000001', null, null, null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('030000010007076573804283000121324821', '4444444444', '4444444', 'c4ca4238a0b923820dcc509a6f75849b', 'M', 'jackcora@156.com', '00000002', '2015-03-04', null, '03', null, '2015-03-04 13:22:44', '2', null, null, '1', '2015-01-25 21:23:37', '15801403659', '2', '030401240030853158855688234400617372', null, null, null, null, 'xxxxx', null, null, null, null, null, null, null, '1', '040000200140080711372488643084342874', null, null);
INSERT INTO `sys_user` VALUES ('030400114000528580516328755142258046', 'cora_abc', '张丽君', 'c4ca4238a0b923820dcc509a6f75849b', 'F', null, '00000002', '2015-03-04', null, '03', null, '2015-03-04 13:23:01', '3', null, null, '1', '2015-01-25 22:00:03', '18611007180', '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('031002004045073545302386856442306810', 'xiaoy_1', '小袁', 'c4ca4238a0b923820dcc509a6f75849b', 'M', null, '00000002', '2015-01-31', null, '03', '2015-01-31 14:04:15', '2015-02-05 20:14:27', '7', null, '2015-03-09 12:15:02', '1', '2015-01-31 14:04:15', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('031400100012002766287237883658070605', 'lidechai', '李德才', 'c4ca4238a0b923820dcc509a6f75849b', 'M', null, '00000002', '2015-03-04', null, '03', null, '2015-03-04 13:24:38', '3', null, null, '1', '2015-01-25 23:15:37', '18911005689', '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('031422412650026812544507382223205804', 'guosl', '郭胜利', 'c4ca4238a0b923820dcc509a6f75849b', 'M', null, '00000002', '2015-03-04', null, '03', null, '2015-03-04 13:24:52', '3', null, null, '1', '2015-01-31 16:24:34', null, '2', '031420042100063142723108226767327468', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040420020700625101077141754028101641', null, null);
INSERT INTO `sys_user` VALUES ('041020300040027480146814618105675056', 'bj00001', 'bj00001', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 15:41:07', '2015-05-04 11:54:05', '104', null, '2015-05-29 10:54:27', '1', '2015-03-03 15:41:07', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041020300040126074310156877872854518', 'bj00002', 'bj00002', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 15:41:07', null, '8', null, '2015-05-06 10:47:06', '1', '2015-03-03 15:41:07', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041020300040240758516078581406075233', 'bj00003', 'bj00003', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 15:41:07', null, '2', null, '2015-05-04 11:48:55', '1', '2015-03-03 15:41:07', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041020300048362567104464721353416067', 'bj00004', 'bj00004', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 15:41:08', null, '1', null, null, '1', '2015-03-03 15:41:08', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041020300048422620703528688663427837', 'bj00005', 'bj00005', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 15:41:08', null, '1', null, null, '1', '2015-03-03 15:41:08', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041020300048562540111868488538610241', 'bj00006', 'bj00006', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 15:41:08', '2015-03-05 02:30:10', '10', null, '2015-03-05 02:29:35', '1', '2015-03-03 15:41:08', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041020300048680051283582241047606608', 'bj00007', 'bj00007', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 15:41:08', null, '1', null, null, '1', '2015-03-03 15:41:08', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041020300048732306411243506777620378', 'bj00008', 'bj00008', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 15:41:09', '2015-03-05 02:06:43', '4', null, '2015-03-10 16:11:48', '1', '2015-03-03 15:41:09', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041020300048832737460353201385604563', 'bj00009', 'bj00009', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 15:41:09', null, '3', null, '2015-05-17 19:17:46', '1', '2015-03-03 15:41:09', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041020300048980677221570338647822481', 'bj00010', 'bj00010', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 15:41:09', null, '2', null, '2015-04-14 16:47:17', '1', '2015-03-03 15:41:09', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091000034070584652360875132527', 'bj00011', 'bj00011', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:01', null, '2', null, '2015-05-20 09:48:33', '1', '2015-03-03 22:42:01', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091000105833617271530016666074', 'bj00021', 'bj00021', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:04', null, '1', null, null, '1', '2015-03-03 22:42:04', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091000118308146554316425147560', 'bj00022', 'bj00022', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:04', null, '1', null, null, '1', '2015-03-03 22:42:04', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091000127825244643263658266068', 'bj00023', 'bj00023', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:04', null, '1', null, null, '1', '2015-03-03 22:42:04', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091000138145714062837305184856', 'bj00024', 'bj00024', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:04', null, '1', null, null, '1', '2015-03-03 22:42:04', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091000147122475250558257855112', 'bj00025', 'bj00025', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:04', null, '1', null, null, '1', '2015-03-03 22:42:04', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091000155511186514077741473546', 'bj00026', 'bj00026', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:05', null, '1', null, null, '1', '2015-03-03 22:42:05', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091000161445052441127261585736', 'bj00027', 'bj00027', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:05', null, '1', null, null, '1', '2015-03-03 22:42:05', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091000178705877614681788205111', 'bj00028', 'bj00028', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:05', null, '1', null, null, '1', '2015-03-03 22:42:05', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091000180067167716842755444654', 'bj00012', 'bj00012', '8ddcff3a80f4189ca1c9d4d902c3c909', 'M', null, '00000002', '2015-05-20', null, '04', null, '2015-05-20 13:13:10', '4', null, null, '1', '2015-03-03 22:42:01', null, '2', '031430010008645647476736143717105037', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040400000441015480513621785508131131', null, null);
INSERT INTO `sys_user` VALUES ('041025091000187536114380504476687624', 'bj00029', 'bj00029', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:05', null, '1', null, null, '1', '2015-03-03 22:42:05', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091000196030025062121226142624', 'bj00030', 'bj00030', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:05', null, '1', null, null, '1', '2015-03-03 22:42:05', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091000207261654272223305467527', 'bj00031', 'bj00031', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:05', null, '1', null, null, '1', '2015-03-03 22:42:05', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091000210306588374364552140508', 'bj00013', 'bj00013', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:01', null, '1', null, null, '1', '2015-03-03 22:42:01', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091000211008646867112858543261', 'bj00032', 'bj00032', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:05', null, '1', null, null, '1', '2015-03-03 22:42:05', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091000225347248610638554613357', 'bj00033', 'bj00033', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-27', null, '04', null, '2015-03-27 13:08:47', '5', null, null, '1', '2015-03-03 22:42:06', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091000238127575374521566126424', 'bj00034', 'bj00034', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:06', null, '1', null, null, '1', '2015-03-03 22:42:06', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091000245614713316518258227372', 'bj00035', 'bj00035', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:06', null, '1', null, null, '1', '2015-03-03 22:42:06', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091000258205446024354011555630', 'bj00036', 'bj00036', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:06', null, '1', null, null, '1', '2015-03-03 22:42:06', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091000266204862011812007453006', 'bj00037', 'bj00037', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:06', null, '1', null, null, '1', '2015-03-03 22:42:06', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091000276306606210176487763218', 'bj00038', 'bj00038', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:07', null, '1', null, null, '1', '2015-03-03 22:42:07', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091000279275888220720507873108', 'bj00290', 'bj00290', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:00', null, '1', null, null, '1', '2015-03-03 22:43:00', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091000280172138622632013674421', 'bj00291', 'bj00291', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:00', null, '1', null, null, '1', '2015-03-03 22:43:00', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091000281148828368145337257506', 'bj00292', 'bj00292', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:00', null, '1', null, null, '1', '2015-03-03 22:43:00', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091000282376321882883326744231', 'bj00293', 'bj00293', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:00', null, '1', null, null, '1', '2015-03-03 22:43:00', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091000283354700205316138824040', 'bj00294', 'bj00294', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:00', null, '1', null, null, '1', '2015-03-03 22:43:00', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091000284378623641084858453240', 'bj00295', 'bj00295', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:00', null, '1', null, null, '1', '2015-03-03 22:43:00', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091000285802011265450473854850', 'bj00296', 'bj00296', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:00', null, '1', null, null, '1', '2015-03-03 22:43:00', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091000286054451031346381503355', 'bj00039', 'bj00039', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:07', null, '1', null, null, '1', '2015-03-03 22:42:07', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091000286120146255168347181551', 'bj00297', 'bj00297', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:01', null, '1', null, null, '1', '2015-03-03 22:43:01', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091000287671052410880123341410', 'bj00298', 'bj00298', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:01', null, '1', null, null, '1', '2015-03-03 22:43:01', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091000288743167214010830872712', 'bj00299', 'bj00299', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:01', null, '1', null, null, '1', '2015-03-03 22:43:01', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091000289557816333346243504411', 'bj00300', 'bj00300', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:01', null, '1', null, null, '1', '2015-03-03 22:43:01', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091000290782360773017244274846', 'bj00301', 'bj00301', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:01', null, '1', null, null, '1', '2015-03-03 22:43:01', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091000291118513334151336507844', 'bj00302', 'bj00302', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:02', null, '1', null, null, '1', '2015-03-03 22:43:02', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091000291808031647888452107744', 'bj00040', 'bj00040', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:07', null, '1', null, null, '1', '2015-03-03 22:42:07', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091000292007718042305312423158', 'bj00303', 'bj00303', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:02', null, '1', null, null, '1', '2015-03-03 22:43:02', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091000293006745226815365278882', 'bj00304', 'bj00304', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:02', null, '1', null, null, '1', '2015-03-03 22:43:02', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091000294811237155851062036373', 'bj00305', 'bj00305', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:02', null, '1', null, null, '1', '2015-03-03 22:43:02', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091000295862063614760864422363', 'bj00306', 'bj00306', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:02', null, '1', null, null, '1', '2015-03-03 22:43:02', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091000296427314538575335144137', 'bj00307', 'bj00307', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:03', null, '1', null, null, '1', '2015-03-03 22:43:03', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091000297424716303575522362233', 'bj00308', 'bj00308', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:03', null, '1', null, null, '1', '2015-03-03 22:43:03', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091000298366635601630555378447', 'bj00309', 'bj00309', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:03', null, '1', null, null, '1', '2015-03-03 22:43:03', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091000299245303570381350641716', 'bj00310', 'bj00310', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:04', null, '2', null, '2015-05-28 14:38:52', '1', '2015-03-03 22:43:04', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091000300217281557402377263402', 'bj00311', 'bj00311', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:04', null, '1', null, null, '1', '2015-03-03 22:43:04', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091000301107517870207326656875', 'bj00312', 'bj00312', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:04', null, '1', null, null, '1', '2015-03-03 22:43:04', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091000302643066845624784130014', 'bj00313', 'bj00313', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:04', null, '1', null, null, '1', '2015-03-03 22:43:04', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091000303264513683035765253638', 'bj00041', 'bj00041', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-09', null, '04', null, '2015-03-09 17:47:48', '4', null, '2015-05-29 16:40:23', '1', '2015-03-03 22:42:07', null, '2', '030004800001657778603648456415275640', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040024010111120062157235580457282441', null, null);
INSERT INTO `sys_user` VALUES ('041025091000303366381585107853443107', 'bj00314', 'bj00314', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:04', null, '1', null, null, '1', '2015-03-03 22:43:04', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091000304064745345424501384081', 'bj00315', 'bj00315', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:04', null, '1', null, null, '1', '2015-03-03 22:43:04', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091000305414076415152544436556', 'bj00316', 'bj00316', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:05', null, '1', null, null, '1', '2015-03-03 22:43:05', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091000306816528386365584252888', 'bj00317', 'bj00317', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:05', null, '1', null, null, '1', '2015-03-03 22:43:05', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091000307040835163611726573653', 'bj00318', 'bj00318', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:05', null, '1', null, null, '1', '2015-03-03 22:43:05', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091000308773462257611408006731', 'bj00319', 'bj00319', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:05', null, '1', null, null, '1', '2015-03-03 22:43:05', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091000309582346547241437467132', 'bj00320', 'bj00320', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:05', null, '1', null, null, '1', '2015-03-03 22:43:05', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091000310322541715341647343628', 'bj00321', 'bj00321', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:05', null, '1', null, null, '1', '2015-03-03 22:43:05', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091000311531680454078708024283', 'bj00322', 'bj00322', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:05', null, '1', null, null, '1', '2015-03-03 22:43:05', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091000312673857357735641046132', 'bj00323', 'bj00323', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:06', null, '1', null, null, '1', '2015-03-03 22:43:06', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091000313570882153042401774488', 'bj00324', 'bj00324', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:06', null, '1', null, null, '1', '2015-03-03 22:43:06', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091000314058836402415213314226', 'bj00325', 'bj00325', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:06', null, '1', null, null, '1', '2015-03-03 22:43:06', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091000314831617780845524825772', 'bj00042', 'bj00042', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-05-05', null, '04', null, '2015-05-05 13:38:14', '2', null, null, '1', '2015-03-03 22:42:07', null, '2', '031430804005674338430584753147824311', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040400004046676814213781648816081578', null, null);
INSERT INTO `sys_user` VALUES ('041025091000315828012172243676075848', 'bj00326', 'bj00326', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:06', null, '1', null, null, '1', '2015-03-03 22:43:06', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091000316587404117374686405001', 'bj00327', 'bj00327', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:06', null, '1', null, null, '1', '2015-03-03 22:43:06', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091000317067488432685531402238', 'bj00328', 'bj00328', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:06', null, '1', null, null, '1', '2015-03-03 22:43:06', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091000318757186684373734368537', 'bj00329', 'bj00329', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:07', null, '1', null, null, '1', '2015-03-03 22:43:07', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091000319041187658681201103430', 'bj00330', 'bj00330', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:07', null, '1', null, null, '1', '2015-03-03 22:43:07', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091000320868453578284007020276', 'bj00331', 'bj00331', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:07', null, '1', null, null, '1', '2015-03-03 22:43:07', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091000321106415667604358540218', 'bj00332', 'bj00332', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:08', null, '1', null, null, '1', '2015-03-03 22:43:08', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091000322385512764273004031502', 'bj00333', 'bj00333', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:08', null, '1', null, null, '1', '2015-03-03 22:43:08', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091000323764044366346702181233', 'bj00334', 'bj00334', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:08', null, '1', null, null, '1', '2015-03-03 22:43:08', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091000324538750651472581122501', 'bj00335', 'bj00335', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:08', null, '1', null, null, '1', '2015-03-03 22:43:08', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091000325224384458821840871265', 'bj00336', 'bj00336', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:08', null, '1', null, null, '1', '2015-03-03 22:43:08', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091000326176861381262275171017', 'bj00337', 'bj00337', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:09', null, '1', null, null, '1', '2015-03-03 22:43:09', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091000327466553886337300628813', 'bj00338', 'bj00338', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:09', null, '1', null, null, '1', '2015-03-03 22:43:09', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091000327806254760565215235662', 'bj00043', 'bj00043', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:08', null, '1', null, null, '1', '2015-03-03 22:42:08', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091000328510883320377620071453', 'bj00339', 'bj00339', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:09', null, '1', null, null, '1', '2015-03-03 22:43:09', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091000329606220535370441322677', 'bj00340', 'bj00340', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:09', null, '1', null, null, '1', '2015-03-03 22:43:09', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091000330874524850662887258666', 'bj00341', 'bj00341', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:09', null, '1', null, null, '1', '2015-03-03 22:43:09', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091000338070654171816170343326', 'bj00044', 'bj00044', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-10', null, '04', null, '2015-03-10 00:20:09', '6', null, '2015-03-16 00:50:45', '1', '2015-03-03 22:42:08', null, '2', '030004901013813737814041042307407048', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040024112131254006653230685873620136', null, null);
INSERT INTO `sys_user` VALUES ('041025091000344225204727741546378536', 'bj00045', 'bj00045', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:08', null, '1', null, null, '1', '2015-03-03 22:42:08', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091000358868346315161677465714', 'bj00046', 'bj00046', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:08', null, '1', null, null, '1', '2015-03-03 22:42:08', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091000364071634340821625647240', 'bj00047', 'bj00047', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:08', null, '1', null, null, '1', '2015-03-03 22:42:08', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091000378281584071757738054060', 'bj00048', 'bj00048', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:08', null, '1', null, null, '1', '2015-03-03 22:42:08', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091000385048213561274316341415', 'bj00049', 'bj00049', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:08', null, '1', null, null, '1', '2015-03-03 22:42:08', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091000385544488828604071101445', 'bj00014', 'bj00014', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:01', null, '1', null, null, '1', '2015-03-03 22:42:01', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091000398558724273632188256708', 'bj00050', 'bj00050', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-04-17', null, '04', null, '2015-04-17 11:38:30', '3', null, '2015-04-22 14:50:45', '1', '2015-03-03 22:42:09', null, '2', '031420000000070384386444846063606503', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040400001440833876385887002487356864', null, null);
INSERT INTO `sys_user` VALUES ('041025091000406676643331202487013538', 'bj00051', 'bj00051', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-04-27', null, '04', null, '2015-04-27 16:37:54', '3', null, '2015-04-27 17:02:43', '1', '2015-03-03 22:42:09', null, '2', '031430000022766118607711020575024210', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040400101003601522556231680203416875', null, null);
INSERT INTO `sys_user` VALUES ('041025091000418342571305482064864806', 'bj00052', 'bj00052', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-04-27', null, '04', null, '2015-04-27 16:53:11', '3', null, '2015-04-27 17:14:11', '1', '2015-03-03 22:42:09', null, '2', '031430004023542567657067601821062841', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040400104444055505360132330501587547', null, null);
INSERT INTO `sys_user` VALUES ('041025091000428830105032026480340815', 'bj00053', 'bj00053', 'd964173dc44da83eeafa3aebbee9a1a0', 'M', null, '00000002', '2015-04-28', null, '04', null, '2015-04-28 10:35:16', '5', null, '2015-04-28 10:37:31', '1', '2015-03-03 22:42:09', null, '2', '031430004004338357182365204360346752', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040400105005014872255061422117030605', null, null);
INSERT INTO `sys_user` VALUES ('041025091000435760575052026467554483', 'bj00054', 'bj00054', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:09', null, '1', null, null, '1', '2015-03-03 22:42:09', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091000445331406186834831422440', 'bj00055', 'bj00055', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-05-28', null, '04', null, '2015-05-28 15:36:09', '5', null, '2015-05-28 15:39:01', '1', '2015-03-03 22:42:09', null, '2', '031430010021454232352178570721057486', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040400500402333211858712515347483574', null, null);
INSERT INTO `sys_user` VALUES ('041025091000480850637566872876140443', 'bj00015', 'bj00015', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:02', null, '1', null, null, '1', '2015-03-03 22:42:02', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091000567253278816488044422757', 'bj00016', 'bj00016', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:02', null, '1', null, null, '1', '2015-03-03 22:42:02', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091000636852315438616824722818', 'bj00017', 'bj00017', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:02', null, '1', null, null, '1', '2015-03-03 22:42:02', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091000760170383172132730787003', 'bj00018', 'bj00018', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:03', null, '1', null, null, '1', '2015-03-03 22:42:03', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091000832643881501657417708805', 'bj00019', 'bj00019', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:03', null, '1', null, null, '1', '2015-03-03 22:42:03', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091000964226835166646214300484', 'bj00020', 'bj00020', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:03', null, '1', null, null, '1', '2015-03-03 22:42:03', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091010331030082545025154085037', 'bj00342', 'bj00342', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:10', null, '1', null, null, '1', '2015-03-03 22:43:10', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091010332080352226672045547820', 'bj00343', 'bj00343', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:10', null, '1', null, null, '1', '2015-03-03 22:43:10', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091010333681658327523445600617', 'bj00344', 'bj00344', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:10', null, '1', null, null, '1', '2015-03-03 22:43:10', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091010334773606310107634812386', 'bj00345', 'bj00345', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:10', null, '1', null, null, '1', '2015-03-03 22:43:10', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091010335205767586016581653117', 'bj00346', 'bj00346', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:11', null, '1', null, null, '1', '2015-03-03 22:43:11', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091010336035457376317541167107', 'bj00347', 'bj00347', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:11', null, '1', null, null, '1', '2015-03-03 22:43:11', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091010337041633787844744560346', 'bj00348', 'bj00348', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:11', null, '1', null, null, '1', '2015-03-03 22:43:11', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091010338014031326771528660285', 'bj00349', 'bj00349', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:11', null, '1', null, null, '1', '2015-03-03 22:43:11', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091010339701841271336458053467', 'bj00350', 'bj00350', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:11', null, '1', null, null, '1', '2015-03-03 22:43:11', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091010340317780154860403886141', 'bj00351', 'bj00351', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:11', null, '1', null, null, '1', '2015-03-03 22:43:11', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091010341770112383200270028427', 'bj00352', 'bj00352', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:12', null, '1', null, null, '1', '2015-03-03 22:43:12', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091010342143263167235763720382', 'bj00353', 'bj00353', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:12', null, '1', null, null, '1', '2015-03-03 22:43:12', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091010343882302668801747770683', 'bj00354', 'bj00354', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:13', null, '1', null, null, '1', '2015-03-03 22:43:13', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091010344472274303620145734343', 'bj00355', 'bj00355', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:13', null, '1', null, null, '1', '2015-03-03 22:43:13', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091010345854405616505256601261', 'bj00356', 'bj00356', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:13', null, '1', null, null, '1', '2015-03-03 22:43:13', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091010346252214616661156443402', 'bj00357', 'bj00357', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:13', null, '1', null, null, '1', '2015-03-03 22:43:13', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091010347282603553731575015716', 'bj00358', 'bj00358', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:13', null, '1', null, null, '1', '2015-03-03 22:43:13', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091010348031337573632127038743', 'bj00359', 'bj00359', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:14', null, '1', null, null, '1', '2015-03-03 22:43:14', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091010349608210077122213554271', 'bj00360', 'bj00360', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:14', null, '1', null, null, '1', '2015-03-03 22:43:14', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091010350457508354278301012672', 'bj00361', 'bj00361', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:15', null, '1', null, null, '1', '2015-03-03 22:43:15', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091010351662215580775577467663', 'bj00362', 'bj00362', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:15', null, '1', null, null, '1', '2015-03-03 22:43:15', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091010352777652512045788728733', 'bj00363', 'bj00363', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:15', null, '1', null, null, '1', '2015-03-03 22:43:15', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091010353038641851175135050885', 'bj00364', 'bj00364', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:15', null, '1', null, null, '1', '2015-03-03 22:43:15', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091010354755062857661787186164', 'bj00365', 'bj00365', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:15', null, '1', null, null, '1', '2015-03-03 22:43:15', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091010355070746848406777421825', 'bj00366', 'bj00366', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:15', null, '1', null, null, '1', '2015-03-03 22:43:15', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091010356553323600412185884201', 'bj00367', 'bj00367', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:15', null, '1', null, null, '1', '2015-03-03 22:43:15', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091010357005804065720326603755', 'bj00368', 'bj00368', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:16', null, '1', null, null, '1', '2015-03-03 22:43:16', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091010358473805804622680716088', 'bj00369', 'bj00369', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:16', null, '1', null, null, '1', '2015-03-03 22:43:16', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091010359530365105577657813255', 'bj00370', 'bj00370', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:16', null, '1', null, null, '1', '2015-03-03 22:43:16', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091010360625605107816024683352', 'bj00371', 'bj00371', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:16', null, '1', null, null, '1', '2015-03-03 22:43:16', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091010361377228356716205378883', 'bj00372', 'bj00372', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:16', null, '1', null, null, '1', '2015-03-03 22:43:16', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091010362102048684086372070678', 'bj00373', 'bj00373', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:16', null, '1', null, null, '1', '2015-03-03 22:43:16', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091010363372013215583734325536', 'bj00374', 'bj00374', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:17', null, '1', null, null, '1', '2015-03-03 22:43:17', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091010364037356473586043081165', 'bj00375', 'bj00375', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:17', null, '1', null, null, '1', '2015-03-03 22:43:17', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091010365844802562067788558375', 'bj00376', 'bj00376', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:17', null, '1', null, null, '1', '2015-03-03 22:43:17', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091010366654247182438434605736', 'bj00377', 'bj00377', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:17', null, '1', null, null, '1', '2015-03-03 22:43:17', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091010367125860453454547752308', 'bj00378', 'bj00378', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:17', null, '1', null, null, '1', '2015-03-03 22:43:17', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091010368507063740655162075565', 'bj00379', 'bj00379', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:17', null, '1', null, null, '1', '2015-03-03 22:43:17', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091010369111642167576006076480', 'bj00380', 'bj00380', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:18', null, '1', null, null, '1', '2015-03-03 22:43:18', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091010370505471408743718215277', 'bj00381', 'bj00381', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:18', null, '1', null, null, '1', '2015-03-03 22:43:18', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091010371006804225630388312184', 'bj00382', 'bj00382', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:18', null, '1', null, null, '1', '2015-03-03 22:43:18', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091010372246520233435811822306', 'bj00383', 'bj00383', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:18', null, '1', null, null, '1', '2015-03-03 22:43:18', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091010373114481337322765243860', 'bj00384', 'bj00384', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:19', null, '1', null, null, '1', '2015-03-03 22:43:19', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091010452316476735334025024233', 'bj00056', 'bj00056', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:10', null, '1', null, null, '1', '2015-03-03 22:42:10', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091010463876543054650476510145', 'bj00057', 'bj00057', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:10', null, '1', null, null, '1', '2015-03-03 22:42:10', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091010474614585467508286834545', 'bj00058', 'bj00058', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:10', null, '1', null, null, '1', '2015-03-03 22:42:10', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091010485463777775260338151531', 'bj00059', 'bj00059', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:10', null, '1', null, null, '1', '2015-03-03 22:42:10', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091010498601577024301865713824', 'bj00060', 'bj00060', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:10', null, '1', null, null, '1', '2015-03-03 22:42:10', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091010500663511883247667203336', 'bj00061', 'bj00061', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:11', null, '1', null, null, '1', '2015-03-03 22:42:11', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091010515307121528807245155752', 'bj00062', 'bj00062', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:11', null, '1', null, null, '1', '2015-03-03 22:42:11', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091010522460287445673276811818', 'bj00063', 'bj00063', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:11', null, '1', null, null, '1', '2015-03-03 22:42:11', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091010536364584110041764024252', 'bj00064', 'bj00064', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:11', null, '1', null, null, '1', '2015-03-03 22:42:11', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091010544684520346170300023238', 'bj00065', 'bj00065', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:11', null, '1', null, null, '1', '2015-03-03 22:42:11', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091010558517687172536186818235', 'bj00066', 'bj00066', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:11', null, '1', null, null, '1', '2015-03-03 22:42:11', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091010561017424308426077215872', 'bj00067', 'bj00067', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:12', null, '1', null, null, '1', '2015-03-03 22:42:12', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091010573585038724581545611036', 'bj00068', 'bj00068', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:12', null, '1', null, null, '1', '2015-03-03 22:42:12', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091010584500747428280352320677', 'bj00069', 'bj00069', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:12', null, '1', null, null, '1', '2015-03-03 22:42:12', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091010596501445402608325460640', 'bj00070', 'bj00070', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:12', null, '1', null, null, '1', '2015-03-03 22:42:12', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091010606747143652875323048856', 'bj00071', 'bj00071', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:12', null, '1', null, null, '1', '2015-03-03 22:42:12', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091010618338884082668136504743', 'bj00072', 'bj00072', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:12', null, '1', null, null, '1', '2015-03-03 22:42:12', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091010621417616546253505545444', 'bj00073', 'bj00073', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:12', null, '1', null, null, '1', '2015-03-03 22:42:12', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091010637751626452788072825226', 'bj00074', 'bj00074', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:13', null, '1', null, null, '1', '2015-03-03 22:42:13', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091010644616476386384877122466', 'bj00075', 'bj00075', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:13', null, '1', null, null, '1', '2015-03-03 22:42:13', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091010655632880565415474006301', 'bj00076', 'bj00076', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:13', null, '1', null, null, '1', '2015-03-03 22:42:13', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091010660820073510754780568214', 'bj00077', 'bj00077', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:13', null, '1', null, null, '1', '2015-03-03 22:42:13', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091010673720466014378758642758', 'bj00078', 'bj00078', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:13', null, '1', null, null, '1', '2015-03-03 22:42:13', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091010681276618433070510648256', 'bj00079', 'bj00079', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:14', null, '1', null, null, '1', '2015-03-03 22:42:14', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091010698873551014113086033518', 'bj00080', 'bj00080', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:14', null, '1', null, null, '1', '2015-03-03 22:42:14', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091010705007773043118661467572', 'bj00081', 'bj00081', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:14', null, '1', null, null, '1', '2015-03-03 22:42:14', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091010714086277071641452885223', 'bj00082', 'bj00082', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:14', null, '1', null, null, '1', '2015-03-03 22:42:14', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091010721042460733568334343482', 'bj00083', 'bj00083', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:14', null, '1', null, null, '1', '2015-03-03 22:42:14', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091010738488686543200123168181', 'bj00084', 'bj00084', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:15', null, '1', null, null, '1', '2015-03-03 22:42:15', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091010746141146715727338330121', 'bj00085', 'bj00085', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:15', null, '1', null, null, '1', '2015-03-03 22:42:15', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091010755180447366516326088452', 'bj00086', 'bj00086', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:15', null, '1', null, null, '1', '2015-03-03 22:42:15', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091010765751738623767461162035', 'bj00087', 'bj00087', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:15', null, '1', null, null, '1', '2015-03-03 22:42:15', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091010774655502717704235118702', 'bj00088', 'bj00088', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:16', null, '1', null, null, '1', '2015-03-03 22:42:16', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091010783273848048014158747384', 'bj00089', 'bj00089', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:16', null, '1', null, null, '1', '2015-03-03 22:42:16', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091010797338416605514308238413', 'bj00090', 'bj00090', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:16', null, '1', null, null, '1', '2015-03-03 22:42:16', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091010808717635528378535512454', 'bj00091', 'bj00091', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:16', null, '1', null, null, '1', '2015-03-03 22:42:16', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091010811761151515533785100830', 'bj00092', 'bj00092', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:16', null, '1', null, null, '1', '2015-03-03 22:42:16', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091010828886133501506236005446', 'bj00093', 'bj00093', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:17', null, '1', null, null, '1', '2015-03-03 22:42:17', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091010833315017018837832474013', 'bj00094', 'bj00094', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:18', null, '1', null, null, '1', '2015-03-03 22:42:18', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091010848754527656867140812567', 'bj00095', 'bj00095', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:18', null, '1', null, null, '1', '2015-03-03 22:42:18', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091010857518146088870407152111', 'bj00096', 'bj00096', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:18', null, '1', null, null, '1', '2015-03-03 22:42:18', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091010860622082182380731650487', 'bj00097', 'bj00097', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:18', null, '1', null, null, '1', '2015-03-03 22:42:18', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091010873835503340375011515725', 'bj00098', 'bj00098', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:18', null, '1', null, null, '1', '2015-03-03 22:42:18', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091010887628004171863733204124', 'bj00099', 'bj00099', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:19', null, '1', null, null, '1', '2015-03-03 22:42:19', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091010898787071233686448805837', 'bj00100', 'bj00100', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:19', null, '1', null, null, '1', '2015-03-03 22:42:19', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091010904105825130618575162121', 'bj00101', 'bj00101', '01cfa6de571fb266dc4f0a783989f91f', 'M', null, '00000002', '2015-04-09', null, '04', null, '2015-04-09 15:33:06', '6', null, '2015-04-09 15:46:41', '1', '2015-03-03 22:42:19', null, '2', '031408064000643270328072514052702252', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040028040157504053478603364142250100', null, null);
INSERT INTO `sys_user` VALUES ('041025091010912754772821541027264684', 'bj00102', 'bj00102', 'a156a707c5951dd83f0aae71f0f9ea81', 'M', null, '00000002', '2015-04-09', null, '04', null, '2015-04-09 15:40:47', '4', null, '2015-04-09 15:40:15', '1', '2015-03-03 22:42:19', null, '2', '031408064000643270328072514052702252', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040028040126270618058053160506483288', null, null);
INSERT INTO `sys_user` VALUES ('041025091010924783241816501520638238', 'bj00103', 'bj00103', 'c089abe2a31fce0354226f8bb06f9232', 'M', null, '00000002', '2015-04-09', null, '04', null, '2015-04-09 15:49:36', '4', null, '2015-04-09 15:48:57', '1', '2015-03-03 22:42:19', null, '2', '031408064000643270328072514052702252', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040028041049860616618777434201701083', null, null);
INSERT INTO `sys_user` VALUES ('041025091010934525462674428177004728', 'bj00104', 'bj00104', 'ce985f8f758699ca4496d7a19c3e3f91', 'M', null, '00000002', '2015-04-09', null, '04', null, '2015-04-09 15:51:38', '4', null, '2015-04-09 15:51:13', '1', '2015-03-03 22:42:19', null, '2', '031408064000643270328072514052702252', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040028040978254012228263362543675062', null, null);
INSERT INTO `sys_user` VALUES ('041025091010947107815672266272144652', 'bj00105', 'bj00105', 'b1575c083e852117a6fdf81b952cffd0', 'M', null, '00000002', '2015-04-09', null, '04', null, '2015-04-09 18:00:30', '7', null, '2015-04-13 09:26:10', '1', '2015-03-03 22:42:19', null, '2', '031408073305700766144418088330354713', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040028041001086380822554605675623304', null, null);
INSERT INTO `sys_user` VALUES ('041025091040100026027673540176758681', 'bj00111', 'bj00111', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:21', null, '1', null, null, '1', '2015-03-03 22:42:21', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091040101187288624660715357823', 'bj00112', 'bj00112', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:21', null, '1', null, null, '1', '2015-03-03 22:42:21', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091040102086707882527121473615', 'bj00113', 'bj00113', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:21', null, '1', null, null, '1', '2015-03-03 22:42:21', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091040103005645754300053484742', 'bj00114', 'bj00114', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:21', null, '1', null, null, '1', '2015-03-03 22:42:21', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091040104660388565354117636073', 'bj00115', 'bj00115', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:21', null, '1', null, null, '1', '2015-03-03 22:42:21', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091040105536460401537877047811', 'bj00116', 'bj00116', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:21', null, '1', null, null, '1', '2015-03-03 22:42:21', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091040106428748707118367477684', 'bj00117', 'bj00117', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:21', null, '1', null, null, '1', '2015-03-03 22:42:21', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091040107571046380505307608604', 'bj00118', 'bj00118', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:22', null, '1', null, null, '1', '2015-03-03 22:42:22', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091040108360680370088876768017', 'bj00119', 'bj00119', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:22', null, '1', null, null, '1', '2015-03-03 22:42:22', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091040109786385576182745475713', 'bj00120', 'bj00120', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:22', null, '1', null, null, '1', '2015-03-03 22:42:22', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091040110383105856133510237860', 'bj00121', 'bj00121', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:22', null, '1', null, null, '1', '2015-03-03 22:42:22', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091040111663734648628681757333', 'bj00122', 'bj00122', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:24', null, '1', null, null, '1', '2015-03-03 22:42:24', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091040112716203732701207010772', 'bj00123', 'bj00123', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:24', null, '1', null, null, '1', '2015-03-03 22:42:24', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091040113762857467085283000308', 'bj00124', 'bj00124', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:24', null, '1', null, null, '1', '2015-03-03 22:42:24', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091040114521258184156511000507', 'bj00125', 'bj00125', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:24', null, '1', null, null, '1', '2015-03-03 22:42:24', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091040115340038381886860431251', 'bj00126', 'bj00126', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:24', null, '1', null, null, '1', '2015-03-03 22:42:24', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091040116056877536375581112326', 'bj00127', 'bj00127', 'f84c9671afe3796d28985ce81cd1d7ee', 'M', null, '00000002', '2015-03-18', null, '04', null, '2015-03-18 22:51:30', '7', null, '2015-03-18 17:12:13', '1', '2015-03-03 22:42:24', null, '2', '030000010011135245245424803362123868', null, null, null, null, null, null, null, null, null, null, null, null, '1', '041406000218141084272848082305862856', null, null);
INSERT INTO `sys_user` VALUES ('041025091040117611648217028777528851', 'bj00128', 'bj00128', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:25', null, '1', null, null, '1', '2015-03-03 22:42:25', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091040118654670773302840772478', 'bj00129', 'bj00129', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:25', null, '1', null, null, '1', '2015-03-03 22:42:25', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091040119510827225327628707862', 'bj00130', 'bj00130', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:25', null, '1', null, null, '1', '2015-03-03 22:42:25', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091040120306366246627032746231', 'bj00131', 'bj00131', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:25', null, '1', null, null, '1', '2015-03-03 22:42:25', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091040121774736745827317667518', 'bj00132', 'bj00132', 'c33367701511b4f6020ec61ded352059', 'M', null, '00000002', '2015-03-12', null, '04', null, '2015-03-12 23:23:57', '6', null, '2015-03-12 23:44:09', '1', '2015-03-03 22:42:25', null, '2', '031420050500056067328278418137728416', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040424010400062318235330270770276050', null, null);
INSERT INTO `sys_user` VALUES ('041025091040122502211628321825484458', 'bj00133', 'bj00133', '514a4dfbd0c50eb627f3f6024e49a460', 'M', null, '00000002', '2015-03-24', null, '04', null, '2015-03-24 11:03:38', '8', null, '2015-03-24 11:02:40', '1', '2015-03-03 22:42:25', null, '2', '031401065001042621073005644643614782', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040021041170182550778873870310586732', null, null);
INSERT INTO `sys_user` VALUES ('041025091040123252280616154705575451', 'bj00134', 'bj00134', '518d24035c95331221a1e8039b0712af', 'M', null, '00000002', '2015-03-26', null, '04', null, '2015-03-26 16:07:40', '5', null, '2015-03-26 16:06:28', '1', '2015-03-03 22:42:26', null, '2', '031401256004275332886463360020323006', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040021240902023202041563416403644451', null, null);
INSERT INTO `sys_user` VALUES ('041025091040124685338334813567730730', 'bj00135', 'bj00135', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:26', null, '3', null, '2015-03-30 16:18:00', '1', '2015-03-03 22:42:26', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091040125237446331681755024825', 'bj00136', 'bj00136', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:26', null, '1', null, null, '1', '2015-03-03 22:42:26', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091040126247341326847256281175', 'bj00137', 'bj00137', 'c33367701511b4f6020ec61ded352059', 'M', null, '00000002', '2015-05-28', null, '04', null, '2015-05-28 15:50:43', '7', null, '2015-05-28 15:55:57', '1', '2015-03-03 22:42:26', null, '2', '031430014001362501568362348122036848', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040400505442260556743530452208666673', null, null);
INSERT INTO `sys_user` VALUES ('041025091040127230631585465778313864', 'bj00138', 'bj00138', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:26', null, '1', null, null, '1', '2015-03-03 22:42:26', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091040128643347822814681187183', 'bj00139', 'bj00139', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:27', null, '1', null, null, '1', '2015-03-03 22:42:27', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091040129715144465730231582775', 'bj00140', 'bj00140', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:27', null, '1', null, null, '1', '2015-03-03 22:42:27', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091040130415347444620503634766', 'bj00141', 'bj00141', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:27', null, '1', null, null, '1', '2015-03-03 22:42:27', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091040131780038741883855042420', 'bj00142', 'bj00142', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:27', null, '1', null, null, '1', '2015-03-03 22:42:27', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091040132637217747455728504262', 'bj00143', 'bj00143', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:28', null, '1', null, null, '1', '2015-03-03 22:42:28', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091040133768013846624128127121', 'bj00144', 'bj00144', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:28', null, '1', null, null, '1', '2015-03-03 22:42:28', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091040134323341320136677404607', 'bj00145', 'bj00145', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:28', null, '1', null, null, '1', '2015-03-03 22:42:28', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091040135011552541244533817186', 'bj00146', 'bj00146', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:28', null, '1', null, null, '1', '2015-03-03 22:42:28', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091040136087810427156587643847', 'bj00147', 'bj00147', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:29', null, '1', null, null, '1', '2015-03-03 22:42:29', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091040137030657461107316105727', 'bj00148', 'bj00148', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:29', null, '1', null, null, '1', '2015-03-03 22:42:29', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091040138004532601714130636081', 'bj00149', 'bj00149', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:29', null, '1', null, null, '1', '2015-03-03 22:42:29', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091040139836640713352020418766', 'bj00150', 'bj00150', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:29', null, '1', null, null, '1', '2015-03-03 22:42:29', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091040140357221375252665030503', 'bj00151', 'bj00151', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:29', null, '1', null, null, '1', '2015-03-03 22:42:29', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091040184602248842215842615010', 'bj00195', 'bj00195', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:40', null, '1', null, null, '1', '2015-03-03 22:42:40', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091040185133561273662362821301', 'bj00196', 'bj00196', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:40', null, '1', null, null, '1', '2015-03-03 22:42:40', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091040186548125487324317373882', 'bj00197', 'bj00197', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:40', null, '1', null, null, '1', '2015-03-03 22:42:40', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091040187858388187053075170446', 'bj00198', 'bj00198', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:40', null, '1', null, null, '1', '2015-03-03 22:42:40', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091040188310018167268480236342', 'bj00199', 'bj00199', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:41', null, '1', null, null, '1', '2015-03-03 22:42:41', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091040189722442753353057233524', 'bj00200', 'bj00200', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:41', null, '1', null, null, '1', '2015-03-03 22:42:41', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091040190481781467212560720268', 'bj00201', 'bj00201', '4f72f84987897e36fb5d5abc1d689db3', 'M', null, '00000002', '2015-03-18', null, '04', null, '2015-03-18 22:22:53', '5', null, '2015-03-18 22:25:02', '1', '2015-03-03 22:42:41', null, '2', '030000000420502668237471131761207860', null, null, null, null, null, null, null, null, null, null, null, null, '1', '041406008501032337088701127476386220', null, null);
INSERT INTO `sys_user` VALUES ('041025091040191105112747880603540244', 'bj00202', 'bj00202', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-19', null, '04', null, '2015-03-19 11:37:14', '7', null, '2015-03-20 16:39:01', '1', '2015-03-03 22:42:41', null, '2', '031406001081035138255700275251426858', null, null, null, null, null, null, null, null, null, null, null, null, '1', '041406500014053606126022374103570081', null, null);
INSERT INTO `sys_user` VALUES ('041025091040192833040688460284313088', 'bj00203', 'bj00203', '879fb778bc7a15a9314be19b62824f6e', 'M', null, '00000002', '2015-05-18', null, '04', null, '2015-05-18 14:34:50', '7', null, null, '1', '2015-03-03 22:42:41', null, '2', '031430810006816763182686255167218845', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040400100447880465606657126081717520', null, null);
INSERT INTO `sys_user` VALUES ('041025091040193187886032847534812108', 'bj00204', 'bj00204', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:42', null, '1', null, null, '1', '2015-03-03 22:42:42', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091040194603021550673037032571', 'bj00205', 'bj00205', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:42', null, '1', null, null, '1', '2015-03-03 22:42:42', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091040195444618538138545754563', 'bj00206', 'bj00206', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:42', null, '1', null, null, '1', '2015-03-03 22:42:42', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091040196745206062024558717173', 'bj00207', 'bj00207', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:42', null, '1', null, null, '1', '2015-03-03 22:42:42', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091040197777703861115681343573', 'bj00208', 'bj00208', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:42', null, '1', null, null, '1', '2015-03-03 22:42:42', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091040198537642714077440638381', 'bj00209', 'bj00209', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:42', null, '1', null, null, '1', '2015-03-03 22:42:42', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091040199334008041673287543626', 'bj00210', 'bj00210', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:42', null, '1', null, null, '1', '2015-03-03 22:42:42', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091040200651545128213047438563', 'bj00211', 'bj00211', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:43', null, '1', null, null, '1', '2015-03-03 22:42:43', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091040201463167003025872600322', 'bj00212', 'bj00212', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:43', null, '1', null, null, '1', '2015-03-03 22:42:43', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091040202231746858610748218078', 'bj00213', 'bj00213', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:43', null, '1', null, null, '1', '2015-03-03 22:42:43', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091040203265711408857182042536', 'bj00214', 'bj00214', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:43', null, '1', null, null, '1', '2015-03-03 22:42:43', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091040204207822310333188445300', 'bj00215', 'bj00215', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:43', null, '1', null, null, '1', '2015-03-03 22:42:43', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091040205312443031452512657335', 'bj00216', 'bj00216', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:43', null, '1', null, null, '1', '2015-03-03 22:42:43', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091040206581530073417886551683', 'bj00217', 'bj00217', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:43', null, '1', null, null, '1', '2015-03-03 22:42:43', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091040207352487446130188737685', 'bj00218', 'bj00218', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:44', null, '1', null, null, '1', '2015-03-03 22:42:44', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091040208027064138160785328503', 'bj00219', 'bj00219', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:44', null, '1', null, null, '1', '2015-03-03 22:42:44', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091040209050301755765261657524', 'bj00220', 'bj00220', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:44', null, '1', null, null, '1', '2015-03-03 22:42:44', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091040210618401842257212416108', 'bj00221', 'bj00221', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:44', null, '1', null, null, '1', '2015-03-03 22:42:44', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091040211822127860616578227848', 'bj00222', 'bj00222', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:44', null, '1', null, null, '1', '2015-03-03 22:42:44', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091040212635362422617844302152', 'bj00223', 'bj00223', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:44', null, '1', null, null, '1', '2015-03-03 22:42:44', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091040213436743756171217244511', 'bj00224', 'bj00224', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:44', null, '1', null, null, '1', '2015-03-03 22:42:44', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091040214325720155423005031723', 'bj00225', 'bj00225', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:45', null, '1', null, null, '1', '2015-03-03 22:42:45', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091040215770886408381172250423', 'bj00226', 'bj00226', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:45', null, '1', null, null, '1', '2015-03-03 22:42:45', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091040216766687452070164448131', 'bj00227', 'bj00227', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:45', null, '1', null, null, '1', '2015-03-03 22:42:45', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091040217702103355812127360782', 'bj00228', 'bj00228', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:45', null, '1', null, null, '1', '2015-03-03 22:42:45', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091040218048701360052224554852', 'bj00229', 'bj00229', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:46', null, '1', null, null, '1', '2015-03-03 22:42:46', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091040219037610120566774413174', 'bj00230', 'bj00230', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:46', null, '1', null, null, '1', '2015-03-03 22:42:46', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091040220202388641617135224043', 'bj00231', 'bj00231', '081df107a4559e1520aa32aae12c25e6', 'M', null, '00000002', '2015-03-18', null, '04', null, '2015-03-18 16:57:48', '4', null, '2015-03-18 16:57:26', '1', '2015-03-03 22:42:46', null, '2', '031000600040083835686128212618711751', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040022028010318363671434431345577734', null, null);
INSERT INTO `sys_user` VALUES ('041025091040221824522057444661422213', 'bj00232', 'bj00232', '27e3625ce4cabc47feeb0e5c08c7cb89', 'M', null, '00000002', '2015-03-27', null, '04', null, '2015-03-27 10:33:15', '8', null, '2015-03-30 15:09:11', '1', '2015-03-03 22:42:46', null, '2', '031401023000307758483008076544305371', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040021001003876805638523815542125063', null, null);
INSERT INTO `sys_user` VALUES ('041025091040222847861163767208113058', 'bj00233', 'bj00233', 'be8ea939bd4f1c9bb5e24046a2386e2c', 'M', null, '00000002', '2015-03-27', null, '04', null, '2015-03-27 13:08:14', '6', null, null, '1', '2015-03-03 22:42:46', null, '2', '031401032005440124486402378345138308', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040021000164125275562548016760345803', null, null);
INSERT INTO `sys_user` VALUES ('041025091040223405433200014583046736', 'bj00234', 'bj00234', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-04-04', null, '04', null, '2015-04-04 15:47:04', '10', null, '2015-04-04 17:53:49', '1', '2015-03-03 22:42:46', null, '2', '031408033305581418061750001030083731', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040028001015607621801801360524755508', null, null);
INSERT INTO `sys_user` VALUES ('041025091040224616716618504568622474', 'bj00235', 'bj00235', 'ec580792aa15d258e55f2c6278f2d8e5', 'M', null, '00000002', '2015-04-14', null, '04', null, '2015-04-14 11:20:28', '5', null, '2015-04-14 11:16:52', '1', '2015-03-03 22:42:46', null, '2', '031408001004817316620855750504770643', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040028001171187247345356038730587436', null, null);
INSERT INTO `sys_user` VALUES ('041025091040225134034310664774023503', 'bj00236', 'bj00236', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-04-23', null, '04', null, '2015-04-23 15:37:36', '6', null, '2015-04-23 15:42:28', '1', '2015-03-03 22:42:47', null, '2', '031420010001713313047265835867136688', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040400504002606310376204617827441847', null, null);
INSERT INTO `sys_user` VALUES ('041025091040226020066650217804731214', 'bj00237', 'bj00237', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-04-23', null, '04', null, '2015-04-23 15:37:26', '10', null, '2015-04-23 15:39:12', '1', '2015-03-03 22:42:47', null, '2', '031420010001713313047265835867136688', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040400501401135035471663685664638505', null, null);
INSERT INTO `sys_user` VALUES ('041025091040227117341475173772451778', 'bj00238', 'bj00238', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-05-18', null, '04', null, '2015-05-18 14:27:02', '3', null, '2015-05-18 14:27:24', '1', '2015-03-03 22:42:47', null, '2', '031430810007562684852830074483044171', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040400100009564747118672347538408380', null, null);
INSERT INTO `sys_user` VALUES ('041025091040228332355278038621234776', 'bj00239', 'bj00239', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-05-21', null, '04', null, '2015-05-21 11:03:10', '3', null, '2015-05-21 11:05:56', '1', '2015-03-03 22:42:48', null, '2', '031430014029124857282261646258506364', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040400105041366610518140342310731688', null, null);
INSERT INTO `sys_user` VALUES ('041025091040229327411827667167043580', 'bj00240', 'bj00240', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-05-21', null, '04', null, '2015-05-21 11:01:19', '3', null, '2015-05-21 11:09:35', '1', '2015-03-03 22:42:48', null, '2', '031430014029124857282261646258506364', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040400105041213670814712162317510265', null, null);
INSERT INTO `sys_user` VALUES ('041025091040230200631572414573607536', 'bj00241', 'bj00241', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-05-21', null, '04', null, '2015-05-21 10:59:40', '3', null, '2015-05-25 16:26:09', '1', '2015-03-03 22:42:48', null, '2', '031430014029124857282261646258506364', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040400105041154405111856513867145112', null, null);
INSERT INTO `sys_user` VALUES ('041025091040231410037113887278614308', 'bj00242', 'bj00242', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:48', null, '1', null, null, '1', '2015-03-03 22:42:48', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091040232368016866774318323644', 'bj00243', 'bj00243', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:48', null, '1', null, null, '1', '2015-03-03 22:42:48', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091040233563401365545727841871', 'bj00244', 'bj00244', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:48', null, '1', null, null, '1', '2015-03-03 22:42:48', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091040234416552413418106888705', 'bj00245', 'bj00245', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:48', null, '1', null, null, '1', '2015-03-03 22:42:48', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091040235168123730665334734448', 'bj00246', 'bj00246', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:49', null, '1', null, null, '1', '2015-03-03 22:42:49', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091040236103347584237733421663', 'bj00247', 'bj00247', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:49', null, '1', null, null, '1', '2015-03-03 22:42:49', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091040237440536526011882718047', 'bj00248', 'bj00248', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:49', null, '1', null, null, '1', '2015-03-03 22:42:49', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091040238140762244814667531137', 'bj00249', 'bj00249', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:49', null, '1', null, null, '1', '2015-03-03 22:42:49', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091040239652011011888065426803', 'bj00250', 'bj00250', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:49', null, '1', null, null, '1', '2015-03-03 22:42:49', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091040955547551703111557453632', 'bj00106', 'bj00106', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:20', null, '1', null, null, '1', '2015-03-03 22:42:20', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091040966101154286281872612758', 'bj00107', 'bj00107', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:20', null, '1', null, null, '1', '2015-03-03 22:42:20', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091040975107715612575330377185', 'bj00108', 'bj00108', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:20', null, '1', null, null, '1', '2015-03-03 22:42:20', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091040985258784206150204088602', 'bj00109', 'bj00109', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:20', null, '1', null, null, '1', '2015-03-03 22:42:20', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091040997623467305205821567163', 'bj00110', 'bj00110', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:20', null, '1', null, null, '1', '2015-03-03 22:42:20', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091050141421277786758873140461', 'bj00152', 'bj00152', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:30', null, '1', null, null, '1', '2015-03-03 22:42:30', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091050142488452876640355144426', 'bj00153', 'bj00153', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:31', null, '1', null, null, '1', '2015-03-03 22:42:31', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091050143267253400103607386883', 'bj00154', 'bj00154', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:31', null, '1', null, null, '1', '2015-03-03 22:42:31', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091050144413852480325801710776', 'bj00155', 'bj00155', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:31', null, '1', null, null, '1', '2015-03-03 22:42:31', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091050145120305013335251560741', 'bj00156', 'bj00156', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:31', null, '1', null, null, '1', '2015-03-03 22:42:31', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091050146355813243716705631324', 'bj00157', 'bj00157', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:31', null, '1', null, null, '1', '2015-03-03 22:42:31', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091050147031775853056116825267', 'bj00158', 'bj00158', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:32', null, '1', null, null, '1', '2015-03-03 22:42:32', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091050148353156674655576235315', 'bj00159', 'bj00159', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:32', null, '1', null, null, '1', '2015-03-03 22:42:32', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091050149413683757843287451673', 'bj00160', 'bj00160', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:32', null, '1', null, null, '1', '2015-03-03 22:42:32', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091050150653554032615178361511', 'bj00161', 'bj00161', '23a5969ddbcb45372c6539d945b2925d', 'M', null, '00000002', '2015-03-24', null, '04', null, '2015-03-24 14:16:02', '5', null, '2015-03-24 14:15:22', '1', '2015-03-03 22:42:32', null, '2', '031401076101120041481286181030706535', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040021040061711433483020817212732032', null, null);
INSERT INTO `sys_user` VALUES ('041025091050151844720324437226775848', 'bj00162', 'bj00162', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:32', null, '1', null, null, '1', '2015-03-03 22:42:32', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091050152246666600854431473665', 'bj00163', 'bj00163', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:33', null, '1', null, null, '1', '2015-03-03 22:42:33', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091050153831276013761536350423', 'bj00164', 'bj00164', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:33', null, '1', null, null, '1', '2015-03-03 22:42:33', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091050154577070734665871073560', 'bj00165', 'bj00165', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:33', null, '1', null, null, '1', '2015-03-03 22:42:33', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091050155758014485648542364435', 'bj00166', 'bj00166', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:33', null, '1', null, null, '1', '2015-03-03 22:42:33', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091050156841704516834874067164', 'bj00167', 'bj00167', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:33', null, '1', null, null, '1', '2015-03-03 22:42:33', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091050157324857222766116876277', 'bj00168', 'bj00168', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:34', null, '1', null, null, '1', '2015-03-03 22:42:34', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091050158380001465470465485733', 'bj00169', 'bj00169', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:35', null, '1', null, null, '1', '2015-03-03 22:42:35', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091050159165612022023447783550', 'bj00170', 'bj00170', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:35', null, '1', null, null, '1', '2015-03-03 22:42:35', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091050160326714407331655363462', 'bj00171', 'bj00171', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:35', null, '1', null, null, '1', '2015-03-03 22:42:35', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091050161483541133180314638153', 'bj00172', 'bj00172', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:35', null, '1', null, null, '1', '2015-03-03 22:42:35', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091050162521461172043354645762', 'bj00173', 'bj00173', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:36', null, '1', null, null, '1', '2015-03-03 22:42:36', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091050163017375120434022812141', 'bj00174', 'bj00174', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:36', null, '1', null, null, '1', '2015-03-03 22:42:36', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091050164283107767673772500068', 'bj00175', 'bj00175', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:36', null, '1', null, null, '1', '2015-03-03 22:42:36', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091050165367673485651228285836', 'bj00176', 'bj00176', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:36', null, '1', null, null, '1', '2015-03-03 22:42:36', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091050166383152110284340664203', 'bj00177', 'bj00177', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:36', null, '1', null, null, '1', '2015-03-03 22:42:36', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091050167258675005708825515851', 'bj00178', 'bj00178', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:36', null, '1', null, null, '1', '2015-03-03 22:42:36', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091050168377270063058631201680', 'bj00179', 'bj00179', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:37', null, '1', null, null, '1', '2015-03-03 22:42:37', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091050169778162534455074007583', 'bj00180', 'bj00180', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:37', null, '1', null, null, '1', '2015-03-03 22:42:37', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091050170334481732832106723347', 'bj00181', 'bj00181', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:37', null, '1', null, null, '1', '2015-03-03 22:42:37', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091050171687702675177176630841', 'bj00182', 'bj00182', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:37', null, '1', null, null, '1', '2015-03-03 22:42:37', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091050172252275561847764138010', 'bj00183', 'bj00183', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:37', null, '1', null, null, '1', '2015-03-03 22:42:37', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091050173806277402406410646745', 'bj00184', 'bj00184', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:38', null, '1', null, null, '1', '2015-03-03 22:42:38', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091050174827111740300430015123', 'bj00185', 'bj00185', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:38', null, '1', null, null, '1', '2015-03-03 22:42:38', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091050175785606070451407206211', 'bj00186', 'bj00186', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:38', null, '1', null, null, '1', '2015-03-03 22:42:38', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091050176374456776730875100338', 'bj00187', 'bj00187', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:38', null, '1', null, null, '1', '2015-03-03 22:42:38', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091050177085517078503660586787', 'bj00188', 'bj00188', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:38', null, '1', null, null, '1', '2015-03-03 22:42:38', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091050178241608041270611438763', 'bj00189', 'bj00189', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:38', null, '1', null, null, '1', '2015-03-03 22:42:38', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091050179636667887034731135127', 'bj00190', 'bj00190', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:38', null, '1', null, null, '1', '2015-03-03 22:42:38', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091050180514668083551708520327', 'bj00191', 'bj00191', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:39', null, '1', null, null, '1', '2015-03-03 22:42:39', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091050181353651314843552850782', 'bj00192', 'bj00192', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:39', null, '1', null, null, '1', '2015-03-03 22:42:39', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091050182315635538412851358760', 'bj00193', 'bj00193', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:39', null, '1', null, null, '1', '2015-03-03 22:42:39', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091050183347562502061020124850', 'bj00194', 'bj00194', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:39', null, '1', null, null, '1', '2015-03-03 22:42:39', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091050240554347753156877807628', 'bj00251', 'bj00251', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:50', null, '1', null, null, '1', '2015-03-03 22:42:50', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091050241641376207141716444657', 'bj00252', 'bj00252', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:50', null, '1', null, null, '1', '2015-03-03 22:42:50', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091050242713573888607251584870', 'bj00253', 'bj00253', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:50', null, '1', null, null, '1', '2015-03-03 22:42:50', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091050243618106371580655782740', 'bj00254', 'bj00254', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:51', null, '1', null, null, '1', '2015-03-03 22:42:51', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091050244585350728720255088451', 'bj00255', 'bj00255', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:51', null, '1', null, null, '1', '2015-03-03 22:42:51', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091050245621575270347037725244', 'bj00256', 'bj00256', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:52', null, '1', null, null, '1', '2015-03-03 22:42:52', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091050246487223263373287224284', 'bj00257', 'bj00257', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:52', null, '1', null, null, '1', '2015-03-03 22:42:52', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091050247327384841831600860311', 'bj00258', 'bj00258', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:52', null, '1', null, null, '1', '2015-03-03 22:42:52', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091050248222483228052866277812', 'bj00259', 'bj00259', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:53', null, '1', null, null, '1', '2015-03-03 22:42:53', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091050249157458087432875330240', 'bj00260', 'bj00260', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:53', null, '1', null, null, '1', '2015-03-03 22:42:53', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091050250832338251467731100553', 'bj00261', 'bj00261', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-05-27', null, '04', null, '2015-05-27 12:51:55', '3', null, null, '1', '2015-03-03 22:42:53', null, '2', '031420000000070384386444846063606503', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040400500001422366673840157248330830', null, null);
INSERT INTO `sys_user` VALUES ('041025091050251307637632626753758027', 'bj00262', 'bj00262', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-05-27', null, '04', null, '2015-05-27 13:15:50', '2', null, null, '1', '2015-03-03 22:42:54', null, '2', '031430000021244343387054645081083185', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040400501402111358160585368076677706', null, null);
INSERT INTO `sys_user` VALUES ('041025091050252738165581478166523886', 'bj00263', 'bj00263', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-05-27', null, '04', null, '2015-05-27 13:13:25', '2', null, null, '1', '2015-03-03 22:42:54', null, '2', '031430000001183475621650602405276735', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040400501402070248681015434271188763', null, null);
INSERT INTO `sys_user` VALUES ('041025091050253785678384053417086763', 'bj00264', 'bj00264', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-05-27', null, '04', null, '2015-05-27 13:12:04', '2', null, null, '1', '2015-03-03 22:42:54', null, '2', '031430000001183475621650602405276735', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040400501401962248662537515455877702', null, null);
INSERT INTO `sys_user` VALUES ('041025091050254811115347126356561201', 'bj00265', 'bj00265', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-05-27', null, '04', null, '2015-05-27 13:06:04', '2', null, null, '1', '2015-03-03 22:42:54', null, '2', '031430000001022447338816582282370150', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040400501041541325048648228502026746', null, null);
INSERT INTO `sys_user` VALUES ('041025091050255811766451551880336805', 'bj00266', 'bj00266', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:54', null, '1', null, null, '1', '2015-03-03 22:42:54', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091050256247424851118006322577', 'bj00267', 'bj00267', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:54', null, '1', null, null, '1', '2015-03-03 22:42:54', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091050257358035861811088036651', 'bj00268', 'bj00268', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:54', null, '1', null, null, '1', '2015-03-03 22:42:54', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091050258145203622038342327413', 'bj00269', 'bj00269', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:55', null, '1', null, null, '1', '2015-03-03 22:42:55', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091050259461852737347167431852', 'bj00270', 'bj00270', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:55', null, '1', null, null, '1', '2015-03-03 22:42:55', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091050260734853774324067823007', 'bj00271', 'bj00271', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:55', null, '1', null, null, '1', '2015-03-03 22:42:55', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091050261802243202553244844042', 'bj00272', 'bj00272', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:56', null, '1', null, null, '1', '2015-03-03 22:42:56', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091050262067704761055252162221', 'bj00273', 'bj00273', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:56', null, '1', null, null, '1', '2015-03-03 22:42:56', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091050263571185478670354203101', 'bj00274', 'bj00274', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:56', null, '1', null, null, '1', '2015-03-03 22:42:56', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091050264203510214455804200076', 'bj00275', 'bj00275', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:56', null, '1', null, null, '1', '2015-03-03 22:42:56', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091050265112816615601631353242', 'bj00276', 'bj00276', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:56', null, '1', null, null, '1', '2015-03-03 22:42:56', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091050266868177308334068803153', 'bj00277', 'bj00277', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:57', null, '1', null, null, '1', '2015-03-03 22:42:57', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091050267750213427576377028300', 'bj00278', 'bj00278', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:57', null, '1', null, null, '1', '2015-03-03 22:42:57', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091050268874080223463338622645', 'bj00279', 'bj00279', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:57', null, '1', null, null, '1', '2015-03-03 22:42:57', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091050269458681841678767112035', 'bj00280', 'bj00280', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:58', null, '1', null, null, '1', '2015-03-03 22:42:58', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091050270761322242787174706611', 'bj00281', 'bj00281', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:58', null, '1', null, null, '1', '2015-03-03 22:42:58', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091050271784452875887402355163', 'bj00282', 'bj00282', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:58', null, '1', null, null, '1', '2015-03-03 22:42:58', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091050272762548180764352173257', 'bj00283', 'bj00283', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:58', null, '1', null, null, '1', '2015-03-03 22:42:58', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091050273484048778271032706532', 'bj00284', 'bj00284', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:59', null, '1', null, null, '1', '2015-03-03 22:42:59', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091050274324341453158245603445', 'bj00285', 'bj00285', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:59', null, '1', null, null, '1', '2015-03-03 22:42:59', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091050275160775605065405401032', 'bj00286', 'bj00286', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:59', null, '1', null, null, '1', '2015-03-03 22:42:59', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091050276130338006721467331117', 'bj00287', 'bj00287', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:59', null, '1', null, null, '1', '2015-03-03 22:42:59', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091050277016818178570276281882', 'bj00288', 'bj00288', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:59', null, '1', null, null, '1', '2015-03-03 22:42:59', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091050278063538631255104800454', 'bj00289', 'bj00289', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:42:59', null, '1', null, null, '1', '2015-03-03 22:42:59', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091800374000006164158354713166', 'bj00385', 'bj00385', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:20', null, '1', null, null, '1', '2015-03-03 22:43:20', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091800375263535106073743328130', 'bj00386', 'bj00386', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:20', null, '1', null, null, '1', '2015-03-03 22:43:20', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091800376841341120134711624766', 'bj00387', 'bj00387', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:20', null, '1', null, null, '1', '2015-03-03 22:43:20', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091800377243620848178228321242', 'bj00388', 'bj00388', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:20', null, '1', null, null, '1', '2015-03-03 22:43:20', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091800378222482175044136335752', 'bj00389', 'bj00389', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:20', null, '1', null, null, '1', '2015-03-03 22:43:20', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091800379261631146215601328282', 'bj00390', 'bj00390', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:20', null, '1', null, null, '1', '2015-03-03 22:43:20', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091800380211017177003237632016', 'bj00391', 'bj00391', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:20', null, '1', null, null, '1', '2015-03-03 22:43:20', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091800381107047171546221875735', 'bj00392', 'bj00392', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:21', null, '1', null, null, '1', '2015-03-03 22:43:21', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091800382556357475646560143087', 'bj00393', 'bj00393', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:21', null, '1', null, null, '1', '2015-03-03 22:43:21', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091800383518221175364335282452', 'bj00394', 'bj00394', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:21', null, '1', null, null, '1', '2015-03-03 22:43:21', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091800384720841775246516123470', 'bj00395', 'bj00395', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:21', null, '1', null, null, '1', '2015-03-03 22:43:21', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091800385770035020231554665137', 'bj00396', 'bj00396', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:21', null, '1', null, null, '1', '2015-03-03 22:43:21', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091800386041403344235051821377', 'bj00397', 'bj00397', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:21', null, '1', null, null, '1', '2015-03-03 22:43:21', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091800387416611706410666663648', 'bj00398', 'bj00398', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:21', null, '1', null, null, '1', '2015-03-03 22:43:21', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091800388011247000361357380748', 'bj00399', 'bj00399', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:22', null, '1', null, null, '1', '2015-03-03 22:43:22', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091800389210758560744507465386', 'bj00400', 'bj00400', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:22', null, '1', null, null, '1', '2015-03-03 22:43:22', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091800390320341878587637726512', 'bj00401', 'bj00401', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:22', null, '1', null, null, '1', '2015-03-03 22:43:22', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091800391355242845807240355364', 'bj00402', 'bj00402', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:22', null, '1', null, null, '1', '2015-03-03 22:43:22', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091800392087885287870117286185', 'bj00403', 'bj00403', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:22', null, '1', null, null, '1', '2015-03-03 22:43:22', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091800393433731403164062224783', 'bj00404', 'bj00404', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:23', null, '1', null, null, '1', '2015-03-03 22:43:23', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091800394835815628411507776200', 'bj00405', 'bj00405', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:23', null, '1', null, null, '1', '2015-03-03 22:43:23', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091800395685801824545857227540', 'bj00406', 'bj00406', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:23', null, '1', null, null, '1', '2015-03-03 22:43:23', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091800396111853253043156165303', 'bj00407', 'bj00407', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:23', null, '1', null, null, '1', '2015-03-03 22:43:23', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091800397746312467177485533102', 'bj00408', 'bj00408', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:23', null, '1', null, null, '1', '2015-03-03 22:43:23', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091800398538871205853622717370', 'bj00409', 'bj00409', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:24', null, '1', null, null, '1', '2015-03-03 22:43:24', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091800399541875068745411702273', 'bj00410', 'bj00410', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:24', null, '1', null, null, '1', '2015-03-03 22:43:24', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091800400156678856277822615685', 'bj00411', 'bj00411', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:24', null, '1', null, null, '1', '2015-03-03 22:43:24', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091800401087104466658203832761', 'bj00412', 'bj00412', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:24', null, '1', null, null, '1', '2015-03-03 22:43:24', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091800402148044075638642441784', 'bj00413', 'bj00413', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:24', null, '1', null, null, '1', '2015-03-03 22:43:24', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091800403305430457853521171121', 'bj00414', 'bj00414', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:25', null, '1', null, null, '1', '2015-03-03 22:43:25', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091800404031502364574151573326', 'bj00415', 'bj00415', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:25', null, '1', null, null, '1', '2015-03-03 22:43:25', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091800405272236342304287264752', 'bj00416', 'bj00416', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:25', null, '1', null, null, '1', '2015-03-03 22:43:25', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091800406020265482437566682716', 'bj00417', 'bj00417', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:25', null, '1', null, null, '1', '2015-03-03 22:43:25', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091800407252354850745744260014', 'bj00418', 'bj00418', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:25', null, '1', null, null, '1', '2015-03-03 22:43:25', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091800408428844668777206235077', 'bj00419', 'bj00419', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:25', null, '1', null, null, '1', '2015-03-03 22:43:25', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091800409582327831116208485258', 'bj00420', 'bj00420', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:25', null, '1', null, null, '1', '2015-03-03 22:43:25', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091800410362170152353305377022', 'bj00421', 'bj00421', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:26', null, '1', null, null, '1', '2015-03-03 22:43:26', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091800411565485651841644168343', 'bj00422', 'bj00422', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:26', null, '1', null, null, '1', '2015-03-03 22:43:26', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091800412087220681758453213118', 'bj00423', 'bj00423', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:26', null, '1', null, null, '1', '2015-03-03 22:43:26', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091800413513518880116040050284', 'bj00424', 'bj00424', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:26', null, '1', null, null, '1', '2015-03-03 22:43:26', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091800414210778234561415365656', 'bj00425', 'bj00425', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:26', null, '1', null, null, '1', '2015-03-03 22:43:26', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091800415478876408664472054058', 'bj00426', 'bj00426', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:26', null, '1', null, null, '1', '2015-03-03 22:43:26', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091800416373421502433110860071', 'bj00427', 'bj00427', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:26', null, '1', null, null, '1', '2015-03-03 22:43:26', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091800417336147782887677328231', 'bj00428', 'bj00428', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:27', null, '1', null, null, '1', '2015-03-03 22:43:27', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091800418073605641844780348734', 'bj00429', 'bj00429', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:27', null, '1', null, null, '1', '2015-03-03 22:43:27', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091800419010467316588661405710', 'bj00430', 'bj00430', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:27', null, '1', null, null, '1', '2015-03-03 22:43:27', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091800420020805372364063075437', 'bj00431', 'bj00431', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:27', null, '1', null, null, '1', '2015-03-03 22:43:27', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091800421208257378856618485237', 'bj00432', 'bj00432', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:27', null, '1', null, null, '1', '2015-03-03 22:43:27', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091800422776088010310108215333', 'bj00433', 'bj00433', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:27', null, '1', null, null, '1', '2015-03-03 22:43:27', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091800423216824665625145445468', 'bj00434', 'bj00434', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:27', null, '1', null, null, '1', '2015-03-03 22:43:27', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091800424750128340747250004367', 'bj00435', 'bj00435', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:28', null, '1', null, null, '1', '2015-03-03 22:43:28', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091800425057468083307146067003', 'bj00436', 'bj00436', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:28', null, '1', null, null, '1', '2015-03-03 22:43:28', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091800426721416082546018527781', 'bj00437', 'bj00437', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:28', null, '1', null, null, '1', '2015-03-03 22:43:28', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091800427787611884632068137635', 'bj00438', 'bj00438', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:28', null, '1', null, null, '1', '2015-03-03 22:43:28', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091800428310211636608282342065', 'bj00439', 'bj00439', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:28', null, '1', null, null, '1', '2015-03-03 22:43:28', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091800429104866223077271206613', 'bj00440', 'bj00440', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:28', null, '1', null, null, '1', '2015-03-03 22:43:28', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091800430882004456772510471537', 'bj00441', 'bj00441', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:29', null, '1', null, null, '1', '2015-03-03 22:43:29', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091800431616620323642462251044', 'bj00442', 'bj00442', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:29', null, '1', null, null, '1', '2015-03-03 22:43:29', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091800432633688450780258443716', 'bj00443', 'bj00443', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:29', null, '1', null, null, '1', '2015-03-03 22:43:29', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091800433821322825272600346083', 'bj00444', 'bj00444', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:29', null, '1', null, null, '1', '2015-03-03 22:43:29', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091800434045568512133882118585', 'bj00445', 'bj00445', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:29', null, '1', null, null, '1', '2015-03-03 22:43:29', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091800435587868672282456831057', 'bj00446', 'bj00446', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:29', null, '1', null, null, '1', '2015-03-03 22:43:29', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091800485375688208187580821408', 'bj00496', 'bj00496', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-04', null, '04', null, '2015-03-04 21:48:39', '2', null, null, '1', '2015-03-03 22:43:40', null, '2', '031420042100063142723108226767327468', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040420020700625101077141754028101641', null, null);
INSERT INTO `sys_user` VALUES ('041025091800486207307518108006765810', 'bj00497', 'bj00497', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:40', null, '1', null, null, '1', '2015-03-03 22:43:40', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091800487416564140102555377310', 'bj00498', 'bj00498', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:40', null, '1', null, null, '1', '2015-03-03 22:43:40', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091800488177026352302333260134', 'bj00499', 'bj00499', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:40', null, '1', null, null, '1', '2015-03-03 22:43:40', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091800489844427471472423083431', 'bj00500', 'bj00500', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:40', null, '3', null, '2015-03-03 23:10:43', '1', '2015-03-03 22:43:40', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091810436386414488546114625645', 'bj00447', 'bj00447', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:30', null, '1', null, null, '1', '2015-03-03 22:43:30', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091810437047775705634260708331', 'bj00448', 'bj00448', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:30', null, '1', null, null, '1', '2015-03-03 22:43:30', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091810438315071541386746224070', 'bj00449', 'bj00449', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:30', null, '1', null, null, '1', '2015-03-03 22:43:30', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091810439270116122806542581334', 'bj00450', 'bj00450', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:30', null, '1', null, null, '1', '2015-03-03 22:43:30', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091810440672008042477857146324', 'bj00451', 'bj00451', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:30', null, '1', null, null, '1', '2015-03-03 22:43:30', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091810441330230254282657288686', 'bj00452', 'bj00452', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:31', null, '1', null, null, '1', '2015-03-03 22:43:31', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091810442757426043604370810614', 'bj00453', 'bj00453', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:31', null, '1', null, null, '1', '2015-03-03 22:43:31', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091810443284405422437484026002', 'bj00454', 'bj00454', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:31', null, '1', null, null, '1', '2015-03-03 22:43:31', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091810444500442448808208051542', 'bj00455', 'bj00455', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:31', null, '1', null, null, '1', '2015-03-03 22:43:31', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091810445104471846362508263235', 'bj00456', 'bj00456', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:31', null, '1', null, null, '1', '2015-03-03 22:43:31', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091810446408007741376160713721', 'bj00457', 'bj00457', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:32', null, '1', null, null, '1', '2015-03-03 22:43:32', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091810447644447870603520212001', 'bj00458', 'bj00458', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:32', null, '1', null, null, '1', '2015-03-03 22:43:32', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091810448832856430876254603488', 'bj00459', 'bj00459', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:32', null, '1', null, null, '1', '2015-03-03 22:43:32', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091810449182736848163548232386', 'bj00460', 'bj00460', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:33', null, '1', null, null, '1', '2015-03-03 22:43:33', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091810450187525422413860051343', 'bj00461', 'bj00461', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:33', null, '1', null, null, '1', '2015-03-03 22:43:33', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091810451318700627774085817517', 'bj00462', 'bj00462', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:33', null, '1', null, null, '1', '2015-03-03 22:43:33', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091810452726671408034210173828', 'bj00463', 'bj00463', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:33', null, '1', null, null, '1', '2015-03-03 22:43:33', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091810453177017585388647268606', 'bj00464', 'bj00464', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:33', null, '1', null, null, '1', '2015-03-03 22:43:33', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091810454604338234011405178138', 'bj00465', 'bj00465', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:34', null, '1', null, null, '1', '2015-03-03 22:43:34', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091810455477844545071268863265', 'bj00466', 'bj00466', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:34', null, '1', null, null, '1', '2015-03-03 22:43:34', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091810456076633226262764848386', 'bj00467', 'bj00467', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:35', null, '1', null, null, '1', '2015-03-03 22:43:35', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091810457153716857105872167704', 'bj00468', 'bj00468', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:35', null, '1', null, null, '1', '2015-03-03 22:43:35', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091810458465211516767325740406', 'bj00469', 'bj00469', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:35', null, '1', null, null, '1', '2015-03-03 22:43:35', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091810459071817082325575330101', 'bj00470', 'bj00470', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:35', null, '1', null, null, '1', '2015-03-03 22:43:35', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091810460741388054733772252888', 'bj00471', 'bj00471', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:35', null, '1', null, null, '1', '2015-03-03 22:43:35', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091810461335741354183446565636', 'bj00472', 'bj00472', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:35', null, '1', null, null, '1', '2015-03-03 22:43:35', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091810462814544107452648588033', 'bj00473', 'bj00473', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:35', null, '1', null, null, '1', '2015-03-03 22:43:35', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091810463076126547878504131531', 'bj00474', 'bj00474', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:36', null, '1', null, null, '1', '2015-03-03 22:43:36', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091810464078801403688887632230', 'bj00475', 'bj00475', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:36', null, '1', null, null, '1', '2015-03-03 22:43:36', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091810465000650061160825517226', 'bj00476', 'bj00476', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:36', null, '1', null, null, '1', '2015-03-03 22:43:36', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091810466835618380163161642740', 'bj00477', 'bj00477', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:36', null, '1', null, null, '1', '2015-03-03 22:43:36', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091810467544634526544370465573', 'bj00478', 'bj00478', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:36', null, '1', null, null, '1', '2015-03-03 22:43:36', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091810468812045213685252058342', 'bj00479', 'bj00479', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:36', null, '1', null, null, '1', '2015-03-03 22:43:36', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091810469571231785816322183587', 'bj00480', 'bj00480', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:37', null, '1', null, null, '1', '2015-03-03 22:43:37', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091810470386671825188165872415', 'bj00481', 'bj00481', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:37', null, '1', null, null, '1', '2015-03-03 22:43:37', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091810471257662860142830882526', 'bj00482', 'bj00482', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:37', null, '1', null, null, '1', '2015-03-03 22:43:37', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091810472023516801311541533304', 'bj00483', 'bj00483', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:37', null, '1', null, null, '1', '2015-03-03 22:43:37', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091810473738628681886286705143', 'bj00484', 'bj00484', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:37', null, '1', null, null, '1', '2015-03-03 22:43:37', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091810474013315411056228454783', 'bj00485', 'bj00485', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:37', null, '1', null, null, '1', '2015-03-03 22:43:37', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091810475476826155525228570075', 'bj00486', 'bj00486', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:37', null, '1', null, null, '1', '2015-03-03 22:43:37', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091810476847447874153205753780', 'bj00487', 'bj00487', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:38', null, '1', null, null, '1', '2015-03-03 22:43:38', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091810477586474327427418201625', 'bj00488', 'bj00488', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:38', null, '1', null, null, '1', '2015-03-03 22:43:38', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091810478843461322823722802162', 'bj00489', 'bj00489', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:38', null, '1', null, null, '1', '2015-03-03 22:43:38', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091810479426754582035813824424', 'bj00490', 'bj00490', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:38', null, '1', null, null, '1', '2015-03-03 22:43:38', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091810480412518322342216435605', 'bj00491', 'bj00491', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:38', null, '1', null, null, '1', '2015-03-03 22:43:38', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091810481582637871282671644684', 'bj00492', 'bj00492', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:39', null, '1', null, null, '1', '2015-03-03 22:43:39', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091810482301674326532752341283', 'bj00493', 'bj00493', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:39', null, '1', null, null, '1', '2015-03-03 22:43:39', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091810483576853341483621783858', 'bj00494', 'bj00494', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:39', null, '1', null, null, '1', '2015-03-03 22:43:39', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('041025091810484101106030218205211373', 'bj00495', 'bj00495', 'e10adc3949ba59abbe56e057f20f883e', 'M', null, '00000002', '2015-03-03', null, '04', '2015-03-03 22:43:39', null, '1', null, null, '1', '2015-03-03 22:43:39', null, '2', '030401240030853158855688234400617372', null, null, null, null, null, null, null, null, null, null, null, null, '1', '040000200041162332572178166010672034', null, null);
INSERT INTO `sys_user` VALUES ('070020001025334806701465702848151207', 'ukato', 'ukato', '7d6b90fe56362dee8e77d15f0314ec64', null, '282429164', '00000001', '2015-04-27', null, '07', '2015-04-27 11:37:10', null, '1', null, null, '1', '2015-04-27 11:37:10', null, '2', null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('070020001404188777550776152018420303', 'wei', 'wei', 'e10adc3949ba59abbe56e057f20f883e', null, '1005993936@qq.com', '00000001', '2015-04-27', null, '07', '2015-04-27 00:26:28', null, '1', null, null, '1', '2015-04-27 00:26:28', null, '2', null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('070020002066068485148601077520088830', '吃饭睡觉打老王', '吃饭睡觉打老王', 'cd243fb85b4d09ab84e1be93e032a8f3', null, 'jove_jiu@163.com', '00000001', '2015-04-27', null, '07', '2015-04-27 11:42:47', null, '1', null, null, '1', '2015-04-27 11:42:47', null, '2', null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('070020013061550004184816408828666278', 'WZb', 'WZb', 'e10adc3949ba59abbe56e057f20f883e', null, '', '00000001', '2015-05-21', null, '07', '2015-05-21 11:02:58', null, '1', null, null, '1', '2015-05-21 11:02:58', null, '2', null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('070020013401625184686416485243187387', '呵呵', '呵呵', 'e10adc3949ba59abbe56e057f20f883e', null, '', '00000001', '2015-05-21', null, '07', '2015-05-21 11:04:43', null, '1', null, null, '1', '2015-05-21 11:04:43', null, '2', null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('070020013401716707066375151655785571', '天天酷跑', '天天酷跑', 'e10adc3949ba59abbe56e057f20f883e', null, '', '00000001', '2015-05-21', null, '07', '2015-05-21 11:04:55', null, '1', null, null, '1', '2015-05-21 11:04:55', null, '2', null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('070020082461422531051883527885620330', '豆豆丁', '豆豆丁', 'e10adc3949ba59abbe56e057f20f883e', null, '459876120@qq.com', '00000001', '2015-05-20', null, '07', '2015-05-20 08:44:30', null, '1', null, null, '1', '2015-05-20 08:44:30', null, '2', null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('070020092407600882804728422540326834', '风之子', '风之子', 'fa1df667d40288e6baf41d5b84249135', null, 'xq_123654@163.com', '00000001', '2015-04-28', null, '07', '2015-04-28 11:43:18', null, '1', null, null, '1', '2015-04-28 11:43:18', null, '2', null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('070020093048705754548137388825110772', '亲亲燕子', '亲亲燕子', '0f9509d910365760740d62ce09cfeab4', null, '943661408@qq.com', '00000001', '2015-04-28', null, '07', '2015-04-28 12:05:52', null, '1', null, null, '1', '2015-04-28 12:05:52', null, '2', null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('070020283409247846635142327808546562', '闫', '闫', 'e940d5d9f217b552a1aa5245f2ec2510', null, 'jovejiu@163.com', '00000001', '2015-04-29', null, '07', '2015-04-29 14:05:11', null, '1', null, null, '1', '2015-04-29 14:05:11', null, '2', null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('070020612001087634045527450726845258', '福', '福', 'e940d5d9f217b552a1aa5245f2ec2510', null, 'jove_422@163.com', '00000001', '2015-05-04', null, '07', '2015-05-04 12:04:57', null, '1', null, null, '1', '2015-05-04 12:04:57', null, '2', null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('070020690061120833855163775100024730', 'zboshow', 'zboshow', 'b87238067cc23397bb3354f7b02aff43', null, '53757441@qq.com', '00000001', '2015-05-05', null, '07', '2015-05-05 11:56:00', null, '1', null, null, '1', '2015-05-05 11:56:00', null, '2', null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('070021010401370560075776470576007571', '杨', '杨', 'e10adc3949ba59abbe56e057f20f883e', null, '', '00000001', '2015-05-18', null, '07', '2015-05-18 14:31:35', null, '1', null, null, '1', '2015-05-18 14:31:35', null, '2', null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('070021083041240274042867363526215720', 'appdesk', 'appdesk', 'e10adc3949ba59abbe56e057f20f883e', null, 'wuye@163.cm', '00000001', '2015-05-08', null, '07', '2015-05-08 20:10:58', null, '1', null, null, '1', '2015-05-08 20:10:58', null, '2', null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('070021601460476807755426673825352075', 'tyh1128', 'tyh1128', '496741629bf8be75578ec8032c1b530d', null, '172057168@qq.com', '00000001', '2015-04-21', null, '07', '2015-04-21 16:39:30', null, '1', null, null, '1', '2015-04-21 16:39:30', null, '2', null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('070021610001305174034883267460700607', 'l1527', 'l1527', 'f84eb6727be858ecdf1004625fe575ab', null, '', '00000001', '2015-04-22', null, '07', '2015-04-22 21:43:15', null, '1', null, null, '1', '2015-04-22 21:43:15', null, '2', null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('070021611043404346564522446682548507', 'gg', 'gg', '2cb114991bd3908f5a0da999fba15fe7', null, '', '00000001', '2015-04-23', null, '07', '2015-04-23 15:44:12', null, '1', null, null, '1', '2015-04-23 15:44:12', null, '2', null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('070021613402255767065808245048832344', 'cy', 'cy', '2cb114991bd3908f5a0da999fba15fe7', null, '', '00000001', '2015-04-23', null, '07', '2015-04-23 15:21:34', null, '1', null, null, '1', '2015-04-23 15:21:34', null, '2', null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('070022600000766507276424551178647433', 'idina66', 'idina66', '31a9ea40a214c756178b08a7f22ebf63', null, '13911906763@139.com', '00000001', '2015-03-18', null, '07', '2015-03-18 22:29:48', null, '1', null, null, '1', '2015-03-18 22:29:48', null, '2', null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('070420112080847566128100152766037824', 'cs5', 'cs5', '698d51a19d8a121ce581499d7b701668', null, 'cs5@163.com', '00000001', '2015-03-10', null, '07', '2015-03-10 21:18:09', null, '1', null, null, '1', '2015-03-10 21:18:09', null, '2', null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('071001400041860147657816341875720653', 'def123', 'def123', '21218cca77804d2ba1922c33e0151105', null, 'aaa@163cora', '00000001', '2015-03-05', null, '07', '2015-03-05 15:30:43', null, '1', null, null, '1', '2015-03-05 15:30:43', null, '2', null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('071001400050375708168827156727687224', 'abc789', 'abc789', '21218cca77804d2ba1922c33e0151105', null, '222@163.com', '00000001', '2015-03-05', null, '07', '2015-03-05 15:29:35', null, '1', null, null, '1', '2015-03-05 15:29:35', null, '2', null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('071005181018000017114660187862525081', 'cs1', 'cs1', '21218cca77804d2ba1922c33e0151105', null, 'cs1@163.com', '00000001', '2015-03-10', null, '07', '2015-03-10 20:05:18', null, '1', null, null, '1', '2015-03-10 20:05:18', null, '2', null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('071006011200027486338055232585488783', 'dzwind', 'dzwind', '31d66b32352f165cb72b5fd946dbf415', null, '111111@sina.com', '00000001', '2015-03-11', null, '07', '2015-03-11 14:27:03', null, '1', null, null, '1', '2015-03-11 14:27:03', null, '2', null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('071006011480160484656053518503720571', 'dzwind1', 'dzwind1', '31d66b32352f165cb72b5fd946dbf415', null, '1111111@sina.com', '00000001', '2015-03-11', null, '07', '2015-03-11 14:31:20', null, '1', null, null, '1', '2015-03-11 14:31:20', null, '2', null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('071006080050665732504042303684132153', '注册', '注册', 'ac883542d6f5f3299ae59d1c6012eb47', null, '1478@qq.com', '00000001', '2015-03-11', null, '07', '2015-03-11 22:04:17', null, '1', null, null, '1', '2015-03-11 22:04:17', null, '2', null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('071024011860458884080883480230140476', 'admin', 'admin', 'c4ca4238a0b923820dcc509a6f75849b', null, '', '00000001', '2015-03-03', null, '07', '2015-03-03 18:51:17', null, '19', null, '2015-07-13 14:43:10', '1', '2015-03-03 18:51:17', null, '2', null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('071024090001177727105267328265404376', 'cs2', 'cs2', '21218cca77804d2ba1922c33e0151105', null, 'cs2@163.com', '00000001', '2015-03-10', null, '07', '2015-03-10 20:31:09', null, '1', null, null, '1', '2015-03-10 20:31:09', null, '2', null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('071024090101056021728043302782063250', 'cs', 'cs', '21218cca77804d2ba1922c33e0151105', null, 'cs@15.com', '00000001', '2015-03-10', null, '07', '2015-03-10 20:21:51', null, '1', null, null, '1', '2015-03-10 20:21:51', null, '2', null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('071024514000077730316453215542708601', '111', '111', '21218cca77804d2ba1922c33e0151105', null, '1231231@qq.com', '00000001', '2015-03-05', null, '07', '2015-03-05 14:19:55', null, '1', null, null, '1', '2015-03-05 14:19:55', null, '2', null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('071400134020002004227844084835030318', '樱桃', '樱桃', 'c8a2c196cbed119ea38374f6fd0324b2', null, 'gsx_630@163.com', '00000001', '2015-03-19', null, '07', '2015-03-19 11:47:05', null, '1', null, null, '1', '2015-03-19 11:47:05', null, '2', null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('071401400404071861065152617782444485', 'cora123', 'cora123', 'c4ca4238a0b923820dcc509a6f75849b', null, 'cora@163.com', '00000001', '2015-03-04', null, '07', '2015-03-04 23:04:44', null, '1', null, null, '1', '2015-03-04 23:04:44', null, '2', null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('071402044390023302365653233123524185', 'figo1234', 'figo1234', 'b59c67bf196a4758191e42f76670ceba', null, 'jackcora@163.com', '00000001', '2015-02-13', null, '07', '2015-02-13 00:09:50', '2015-02-13 00:09:50', '1', null, '2015-02-13 00:09:50', '1', '2015-02-13 00:09:50', null, '2', null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('071404100400266456702060235860048871', 'nashop', 'nashop', '88204f943216f40a85da317de38bc3d7', null, 'nashop@126.com', '00000001', '2015-03-13', null, '07', '2015-03-13 01:16:40', null, '1', null, null, '1', '2015-03-13 01:16:40', null, '2', null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('071404120021131411458178710413632325', '唱游', '唱游', 'f80111b84e2412bd4edfc5c4b7fdfca2', null, '723749296@qq.com', '00000001', '2015-03-12', null, '07', '2015-03-12 21:28:41', null, '1', null, null, '1', '2015-03-12 21:28:41', null, '2', null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('071404120060067286732538817654342300', 'e?zr', 'e?zr', 'e10adc3949ba59abbe56e057f20f883e', null, 'ezr@shequkuaixian.com', '00000001', '2015-03-12', null, '07', '2015-03-12 21:27:40', null, '1', null, null, '1', '2015-03-12 21:27:40', null, '2', null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('071420180113277550121541436132402008', '留意额', '留意额', '21218cca77804d2ba1922c33e0151105', null, '59166954@qq.com', '00000001', '2015-03-10', null, '07', '2015-03-10 20:23:13', null, '1', null, null, '1', '2015-03-10 20:23:13', null, '2', null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('071420181011372388561147303840215203', '段玉海', '段玉海', '21218cca77804d2ba1922c33e0151105', null, '549307174', '00000001', '2015-03-10', null, '07', '2015-03-10 21:57:19', null, '1', null, null, '1', '2015-03-10 21:57:19', null, '2', null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('071420483115000243303854277633834283', 'yuanzz', 'yuanzz', '21218cca77804d2ba1922c33e0151105', null, 'zezhy@qq.com', '00000001', '2015-03-07', null, '07', '2015-03-07 07:05:55', null, '1', null, null, '1', '2015-03-07 07:05:55', null, '2', null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('071420501111135347155307532873112606', 'nt030', 'nt030', '21218cca77804d2ba1922c33e0151105', null, 'nt030@qq.com', '00000001', '2015-03-07', null, '07', '2015-03-07 17:11:51', null, '1', null, null, '1', '2015-03-07 17:11:51', null, '2', null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('071421000910006285441423484500424230', 'Foolfrog', 'Foolfrog', '397b352fadebc19763473787a19f48c2', null, 'weierce@hotmail.com', '00000001', '2015-03-23', null, '07', '2015-03-23 11:39:50', null, '1', null, null, '1', '2015-03-23 11:39:50', null, '2', null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('071421010011087688832615238001730306', 'wangjunwei', 'wangjunwei', 'c44a471bd78cc6c2fea32b9fe028d30a', null, 'wangjunwei2002@126.com', '00000001', '2015-03-30', null, '07', '2015-03-30 12:57:30', null, '1', null, null, '1', '2015-03-30 12:57:30', null, '2', null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('071421010111137101620558217468848723', 'zhuangzhuangma', 'zhuangzhuangma', '1e38bb4cfe118128b2fcc67cbc0bbdd7', null, 'hanxiaoyu1970@sina.com', '00000001', '2015-03-30', null, '07', '2015-03-30 13:31:57', null, '1', null, null, '1', '2015-03-30 13:31:57', null, '2', null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('071421020816481381854737371346535385', '奇奇', '奇奇', '27e3625ce4cabc47feeb0e5c08c7cb89', null, '1342683944@qq.com', '00000001', '2015-03-27', null, '07', '2015-03-27 10:37:58', null, '1', null, null, '1', '2015-03-27 10:37:58', null, '2', null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('071421020907564762456540812645040247', '逗叔', '逗叔', '8438165e8d778864f86c1db4a3c105fa', null, '1198533680@qq.com', '00000001', '2015-03-27', null, '07', '2015-03-27 11:29:06', null, '1', null, null, '1', '2015-03-27 11:29:06', null, '2', null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('071421030808065710641256816864020427', '冷漠', '冷漠', '670b14728ad9902aecba32e22fa4f6bd', null, '', '00000001', '2015-03-27', null, '07', '2015-03-27 13:08:05', null, '1', null, null, '1', '2015-03-27 13:08:05', null, '2', null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('071421050001331720116253204441524262', '东丽温泉家园', '东丽温泉家园', '5e934c0e5b787b56aa8647846a120fe4', null, '903747947@qq.com', '00000001', '2015-04-01', null, '07', '2015-04-01 09:23:43', null, '1', null, null, '1', '2015-04-01 09:23:43', null, '2', null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('071421100111130756156713203624101212', '李军', '李军', '7946461f0170fccde8ff5f28c0791e1d', null, '1279341195@qq.com', '00000001', '2015-03-23', null, '07', '2015-03-23 16:45:36', null, '1', null, null, '1', '2015-03-23 16:45:36', null, '2', null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('071421110112072541514158003876827538', '宗扬', '宗扬', '23da39b4df4d8b2cbdd976edd4df4301', null, '13688661985@126.com', '00000001', '2015-03-23', null, '07', '2015-03-23 21:26:34', null, '1', null, null, '1', '2015-03-23 21:26:34', null, '2', null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('071421110911255488686255638188838636', 'q?q?q', 'q?q?q', '698d51a19d8a121ce581499d7b701668', null, 'aaa@sina.com', '00000001', '2015-03-31', null, '07', '2015-03-31 16:36:15', null, '1', null, null, '1', '2015-03-31 16:36:15', null, '2', null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('071421130019646104031500444018372568', 'yzz', 'yzz', '44321627aa773dc17880c435a21ccec5', null, '409238207@qq.com', '00000001', '2015-03-28', null, '07', '2015-03-28 17:24:51', null, '1', null, null, '1', '2015-03-28 17:24:51', null, '2', null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('071421130101465258478225377770846171', 'wang84266213', 'wang84266213', '5de941d374d41e881a99c304c9cf973f', null, '84266213@qq.com', '00000001', '2015-04-02', null, '07', '2015-04-02 08:23:04', null, '1', null, null, '1', '2015-04-02 08:23:04', null, '2', null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('071421130814364644148864417234140518', 'jackcora', 'jackcora', '96e79218965eb72c92a549dd5a330112', null, '', '00000001', '2015-03-26', null, '07', '2015-03-26 10:44:30', null, '1', null, null, '1', '2015-03-26 10:44:30', null, '2', null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('071421130815352218206626125870663731', 'jackcora', 'jackcora', '96e79218965eb72c92a549dd5a330112', null, '', '00000001', '2015-03-26', null, '07', '2015-03-26 10:44:30', null, '1', null, null, '1', '2015-03-26 10:44:30', null, '2', null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('071421160101528527040808337147006528', '张晓亚', '张晓亚', 'e10adc3949ba59abbe56e057f20f883e', null, 'xiaoyazhang@shequkuaixian.com', '00000001', '2015-04-02', null, '07', '2015-04-02 17:49:46', null, '1', null, null, '1', '2015-04-02 17:49:46', null, '2', null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('071421170913374787854873720861054655', '蛋炒饭', '蛋炒饭', '94afab3fd4045066408e672baca5d45a', null, 'huiyuan480@sohu.com', '00000001', '2015-03-24', null, '07', '2015-03-24 14:36:17', null, '1', null, null, '1', '2015-03-24 14:36:17', null, '2', null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('071422001011457808721238748460553611', '古', '古', '21218cca77804d2ba1922c33e0151105', null, '', '00000001', '2015-03-10', null, '07', '2015-03-10 23:31:31', null, '1', null, null, '1', '2015-03-10 23:31:31', null, '2', null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('071426421000461324708713772841162636', '王芳', '王芳', '6de2f8b8a1d789308f24e649f6527372', null, '1342821893', '00000001', '2015-03-18', null, '07', '2015-03-18 17:08:15', null, '1', null, null, '1', '2015-03-18 17:08:15', null, '2', null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('071426430001176843330002485388077088', '静心', '静心', 'b1b3a8248deba1deec9afc1b2505dfab', null, 'wxl830928@sina.com', '00000001', '2015-03-18', null, '07', '2015-03-18 17:20:07', null, '1', null, null, '1', '2015-03-18 17:20:07', null, '2', null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('071428000112631543268334822637051753', '圣人', '圣人', 'e10adc3949ba59abbe56e057f20f883e', null, 'jjl116@163.com', '00000001', '2015-04-13', null, '07', '2015-04-13 09:33:15', null, '1', null, null, '1', '2015-04-13 09:33:15', null, '2', null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('071428040002451647767710425345406571', '徐强', '徐强', 'fa50d425e6846f4ea4256f3772a2e081', null, '56288290@qq.com', '00000001', '2015-04-10', null, '07', '2015-04-10 14:57:01', null, '1', null, null, '1', '2015-04-10 14:57:01', null, '2', null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('071428040002532708846420828076267876', '徐强', '徐强', 'fa50d425e6846f4ea4256f3772a2e081', null, '56288290@qq.com', '00000001', '2015-04-10', null, '07', '2015-04-10 14:57:01', null, '1', null, null, '1', '2015-04-10 14:57:01', null, '2', null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('071428070801704658063514345121235227', '王琢', '王琢', 'deedb0b4980af99cbf8ff5126f18d56c', null, 'ny_wangzhuo@163.com', '00000001', '2015-04-08', null, '07', '2015-04-08 14:17:22', null, '1', null, null, '1', '2015-04-08 14:17:22', null, '2', null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('071428100002886568423614406645222348', '蔡', '蔡', 'e807f1fcf82d132f9bb018ca6738a19f', null, '2669347432qq@.com', '00000001', '2015-04-14', null, '07', '2015-04-14 11:27:07', null, '1', null, null, '1', '2015-04-14 11:27:07', null, '2', null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('071428100012222566578685537836270204', 'webdesk', 'webdesk', '099b3b060154898840f0ebdfb46ec78f', null, 'webdesk@163.com', '00000001', '2015-04-09', null, '07', '2015-04-09 20:27:35', null, '1', null, null, '1', '2015-04-09 20:27:35', null, '2', null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('071428100112778658181774761343647034', '泡沫', '泡沫', 'e807f1fcf82d132f9bb018ca6738a19f', null, '378678138qq@.com', '00000001', '2015-04-14', null, '07', '2015-04-14 11:16:16', null, '1', null, null, '1', '2015-04-14 11:16:16', null, '2', null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('071428110802331817281715108205276780', 'hujiangai', 'hujiangai', 'e10adc3949ba59abbe56e057f20f883e', null, 'hujiangai@sohu.com', '00000001', '2015-04-09', null, '07', '2015-04-09 23:54:25', null, '1', null, null, '1', '2015-04-09 23:54:25', null, '2', null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('071428140111684852340861886661525732', '西瓜面包', '西瓜面包', 'e10adc3949ba59abbe56e057f20f883e', null, '12366@126.com', '00000001', '2015-04-04', null, '07', '2015-04-04 17:51:55', null, '1', null, null, '1', '2015-04-04 17:51:55', null, '2', null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('071428160002132725647844113574806005', 'Lily', 'Lily', 'e10adc3949ba59abbe56e057f20f883e', null, 'qianqu123@sina.com', '00000001', '2015-04-09', null, '07', '2015-04-09 15:56:40', null, '1', null, null, '1', '2015-04-09 15:56:40', null, '2', null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('071428160012016767761864107753507760', 'Sunny', 'Sunny', 'e10adc3949ba59abbe56e057f20f883e', null, 'sunny001@163.com', '00000001', '2015-04-09', null, '07', '2015-04-09 15:54:38', null, '1', null, null, '1', '2015-04-09 15:54:38', null, '2', null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('071428160101908250356176676701700464', '小六', '小六', 'b1b3a8248deba1deec9afc1b2505dfab', null, 'xiaoliuq@qq.com', '00000001', '2015-04-09', null, '07', '2015-04-09 15:45:23', null, '1', null, null, '1', '2015-04-09 15:45:23', null, '2', null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('071428160911858441185266614727674728', '857816953', '857816953', '82c3279bbf7d3bccea3754f80e848895', null, '857816953@qq.com', '00000001', '2015-04-09', null, '07', '2015-04-09 15:35:38', null, '1', null, null, '1', '2015-04-09 15:35:38', null, '2', null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('071429140112946201166845811546366042', 'bessie wu', 'bessie wu', '8f77ef05807bd557175b106db7ff1403', null, '', '00000001', '2015-04-16', null, '07', '2015-04-16 09:46:34', null, '1', null, null, '1', '2015-04-16 09:46:34', null, '2', null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('100402116118', 'super', '超级管理员', 'c81e728d9d4c2f636f067f89cc14862c', 'M', 'super@163.com', '00000001', '2014-07-23 21:18:33', null, '01', '2015-01-11 20:57:21', '2015-03-05 05:45:21', '350', null, '2015-11-02 14:34:22', '1', '2014-07-23 21:19:29', '13888888888', '0', '00000001', null, null, null, null, null, null, null, null, null, null, '1', null, '1', null, null, null);

-- ----------------------------
-- Table structure for `sys_user_org`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_org`;
CREATE TABLE `sys_user_org` (
  `SUO_ID` varchar(40) DEFAULT NULL,
  `SUO_USERID` varchar(40) DEFAULT NULL,
  `SUO_ORGID` varchar(40) DEFAULT NULL,
  `SUO_ADDUSER` varchar(50) DEFAULT NULL,
  `SUO_ADDDATE` varchar(19) DEFAULT NULL,
  `SUO_MODIFYUSER` varchar(50) DEFAULT NULL,
  `SUO_MODIFYDATE` varchar(19) DEFAULT NULL,
  `SUO_DELETEUSER` varchar(50) DEFAULT NULL,
  `SUO_DELETEDATE` varchar(19) DEFAULT NULL,
  `SUO_TS` varchar(19) DEFAULT NULL,
  `SUO_DR` varchar(1) DEFAULT NULL,
  `SUO_VERSION` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_org
-- ----------------------------
INSERT INTO `sys_user_org` VALUES ('1410202123657', '000003110002341221478827435471646786', '000003', null, null, null, null, null, null, '2014-11-18 11:55:23', '1', '1');
INSERT INTO `sys_user_org` VALUES ('1000245123235', '000003104110214412212151803060654473', '000003', null, null, null, null, null, null, '2014-11-06 12:18:47', '1', '1');
INSERT INTO `sys_user_org` VALUES ('1000245103124', '1006100403', '000001', null, null, null, null, null, null, '2014-11-06 11:49:40', '1', '1');
INSERT INTO `sys_user_org` VALUES ('1000245103125', '1006100403', '000003', null, null, null, null, null, null, '2014-11-06 11:49:40', '1', '1');
INSERT INTO `sys_user_org` VALUES ('1410086116', '000005110100040880434816277508710601', '000005', null, null, null, null, null, null, '2014-11-20 20:22:17', '1', '1');
INSERT INTO `sys_user_org` VALUES ('14100100116', '000005110101450011772618310740361353', '000005', null, null, null, null, null, null, '2014-11-26 22:07:09', '1', '1');
INSERT INTO `sys_user_org` VALUES ('1000101101808', '000003104100010006648643745830512464', '000001', null, null, null, null, null, null, '2014-11-03 10:59:44', '1', '1');
INSERT INTO `sys_user_org` VALUES ('1000101101809', '000003104100010006648643745830512464', '000003', null, null, null, null, null, null, '2014-11-03 10:59:44', '1', '1');
INSERT INTO `sys_user_org` VALUES ('14100900207', '000005210101051414654580067313565780', '000005', null, null, null, null, null, null, '2014-12-10 16:07:29', '1', '1');
INSERT INTO `sys_user_org` VALUES ('141000252739', '000003110001036000156816655623087028', '000003', null, null, null, null, null, null, '2014-11-03 11:02:07', '1', '1');
INSERT INTO `sys_user_org` VALUES ('1410020501226', '000003210000044021731377545637376856', '000003', null, null, null, null, null, null, '2014-11-04 09:31:49', '1', '1');
INSERT INTO `sys_user_org` VALUES ('00210030137', '100402116118', '00000001', null, null, null, null, null, null, '2015-01-14 23:05:35', '1', '1');
INSERT INTO `sys_user_org` VALUES ('00210004181', '000001100000405412861836002266015648', '00000001', null, null, null, null, null, null, '2015-01-14 23:15:10', '1', '1');
INSERT INTO `sys_user_org` VALUES ('100124101198', '010020001420841317634443621731363100', '00000001', null, null, null, null, null, null, '2015-01-15 00:03:15', '1', '1');
INSERT INTO `sys_user_org` VALUES ('14200006864', '000001114180004301605864778012268240', '00000001', null, null, null, null, null, null, '2015-01-17 12:59:59', '1', '1');
INSERT INTO `sys_user_org` VALUES ('14011003535', '000001100000401404157570271661673322', '00000001', null, null, null, null, null, null, '2015-02-05 20:12:51', '1', '1');
INSERT INTO `sys_user_org` VALUES ('14058120411207', '010001821100013318450041072577220060', '00000001', null, null, null, null, null, null, '2015-03-10 21:10:51', '1', '1');
INSERT INTO `sys_user_org` VALUES ('100070006480', '011400100400216271352676260615883602', '00000001', null, null, null, null, null, null, '2015-08-28 14:07:47', '1', '1');

-- ----------------------------
-- Table structure for `sys_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `SUR_ID` varchar(40) NOT NULL DEFAULT '',
  `SUR_ROLEID` varchar(40) DEFAULT NULL,
  `SUR_USERID` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`SUR_ID`),
  UNIQUE KEY `SYS_C0035349` (`SUR_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('000004400082', '000000011401004050', '031422412650026812544507382223205804');
INSERT INTO `sys_user_role` VALUES ('000004402871', '000000011401004050', '031400100012002766287237883658070605');
INSERT INTO `sys_user_role` VALUES ('000004410028', '000000011401004050', '010000191800403704203773516085032447');
INSERT INTO `sys_user_role` VALUES ('000004410050', '000000011401004050', '030400114000528580516328755142258046');
INSERT INTO `sys_user_role` VALUES ('000004412039', '000000011401004050', '030000010007076573804283000121324821');
INSERT INTO `sys_user_role` VALUES ('00010442040', '00000100080060030', '000001100110422270040115560424664137');
INSERT INTO `sys_user_role` VALUES ('00044301023', '000000011401004050', '041025091800485375688208187580821408');
INSERT INTO `sys_user_role` VALUES ('002202084107', '000000011401004050', '041025091040220202388641617135224043');
INSERT INTO `sys_user_role` VALUES ('0024200000', '000000011401004050', '041020300040027480146814618105675056');
INSERT INTO `sys_user_role` VALUES ('0024200001', '000000011401004050', '041020300040126074310156877872854518');
INSERT INTO `sys_user_role` VALUES ('0024200002', '000000011401004050', '041020300040240758516078581406075233');
INSERT INTO `sys_user_role` VALUES ('0024200003', '000000011401004050', '041020300048362567104464721353416067');
INSERT INTO `sys_user_role` VALUES ('0024200004', '000000011401004050', '041020300048422620703528688663427837');
INSERT INTO `sys_user_role` VALUES ('0024200005', '000000011401004050', '041020300048562540111868488538610241');
INSERT INTO `sys_user_role` VALUES ('0024200006', '000000011401004050', '041020300048680051283582241047606608');
INSERT INTO `sys_user_role` VALUES ('0024200007', '000000011401004050', '041020300048732306411243506777620378');
INSERT INTO `sys_user_role` VALUES ('0024200008', '000000011401004050', '041020300048832737460353201385604563');
INSERT INTO `sys_user_role` VALUES ('0024200009', '000000011401004050', '041020300048980677221570338647822481');
INSERT INTO `sys_user_role` VALUES ('0400102202089', '000000011401004050', '041025091040223405433200014583046736');
INSERT INTO `sys_user_role` VALUES ('0400102213109', '000000011401004050', '041025091010947107815672266272144652');
INSERT INTO `sys_user_role` VALUES ('0400104002608', '000000011401004050', '041025091010912754772821541027264684');
INSERT INTO `sys_user_role` VALUES ('0400104002795', '000000011401004050', '041025091010924783241816501520638238');
INSERT INTO `sys_user_role` VALUES ('0400104012805', '000000011401004050', '041025091010934525462674428177004728');
INSERT INTO `sys_user_role` VALUES ('0400104382592', '000000011401004050', '041025091010904105825130618575162121');
INSERT INTO `sys_user_role` VALUES ('0400900203313', '000000011401004050', '041025091040224616716618504568622474');
INSERT INTO `sys_user_role` VALUES ('040418300373', '000000011401004050', '041025091010373114481337322765243860');
INSERT INTO `sys_user_role` VALUES ('040418300374', '000000011401004050', '041025091800374000006164158354713166');
INSERT INTO `sys_user_role` VALUES ('040418300375', '000000011401004050', '041025091800375263535106073743328130');
INSERT INTO `sys_user_role` VALUES ('040418300376', '000000011401004050', '041025091800376841341120134711624766');
INSERT INTO `sys_user_role` VALUES ('040418300377', '000000011401004050', '041025091800377243620848178228321242');
INSERT INTO `sys_user_role` VALUES ('040418300378', '000000011401004050', '041025091800378222482175044136335752');
INSERT INTO `sys_user_role` VALUES ('040418300379', '000000011401004050', '041025091800379261631146215601328282');
INSERT INTO `sys_user_role` VALUES ('040418300380', '000000011401004050', '041025091800380211017177003237632016');
INSERT INTO `sys_user_role` VALUES ('040418300381', '000000011401004050', '041025091800381107047171546221875735');
INSERT INTO `sys_user_role` VALUES ('040418300382', '000000011401004050', '041025091800382556357475646560143087');
INSERT INTO `sys_user_role` VALUES ('040418300383', '000000011401004050', '041025091800383518221175364335282452');
INSERT INTO `sys_user_role` VALUES ('040418300384', '000000011401004050', '041025091800384720841775246516123470');
INSERT INTO `sys_user_role` VALUES ('040418300385', '000000011401004050', '041025091800385770035020231554665137');
INSERT INTO `sys_user_role` VALUES ('040418300386', '000000011401004050', '041025091800386041403344235051821377');
INSERT INTO `sys_user_role` VALUES ('040418300387', '000000011401004050', '041025091800387416611706410666663648');
INSERT INTO `sys_user_role` VALUES ('040418300388', '000000011401004050', '041025091800388011247000361357380748');
INSERT INTO `sys_user_role` VALUES ('040418300389', '000000011401004050', '041025091800389210758560744507465386');
INSERT INTO `sys_user_role` VALUES ('040418300390', '000000011401004050', '041025091800390320341878587637726512');
INSERT INTO `sys_user_role` VALUES ('040418300391', '000000011401004050', '041025091800391355242845807240355364');
INSERT INTO `sys_user_role` VALUES ('040418300392', '000000011401004050', '041025091800392087885287870117286185');
INSERT INTO `sys_user_role` VALUES ('040418300393', '000000011401004050', '041025091800393433731403164062224783');
INSERT INTO `sys_user_role` VALUES ('040418300394', '000000011401004050', '041025091800394835815628411507776200');
INSERT INTO `sys_user_role` VALUES ('040418300395', '000000011401004050', '041025091800395685801824545857227540');
INSERT INTO `sys_user_role` VALUES ('040418300396', '000000011401004050', '041025091800396111853253043156165303');
INSERT INTO `sys_user_role` VALUES ('040418300397', '000000011401004050', '041025091800397746312467177485533102');
INSERT INTO `sys_user_role` VALUES ('040418300398', '000000011401004050', '041025091800398538871205853622717370');
INSERT INTO `sys_user_role` VALUES ('040418300399', '000000011401004050', '041025091800399541875068745411702273');
INSERT INTO `sys_user_role` VALUES ('040418300400', '000000011401004050', '041025091800400156678856277822615685');
INSERT INTO `sys_user_role` VALUES ('040418300401', '000000011401004050', '041025091800401087104466658203832761');
INSERT INTO `sys_user_role` VALUES ('040418300402', '000000011401004050', '041025091800402148044075638642441784');
INSERT INTO `sys_user_role` VALUES ('040418300403', '000000011401004050', '041025091800403305430457853521171121');
INSERT INTO `sys_user_role` VALUES ('040418300404', '000000011401004050', '041025091800404031502364574151573326');
INSERT INTO `sys_user_role` VALUES ('040418300405', '000000011401004050', '041025091800405272236342304287264752');
INSERT INTO `sys_user_role` VALUES ('040418300406', '000000011401004050', '041025091800406020265482437566682716');
INSERT INTO `sys_user_role` VALUES ('040418300407', '000000011401004050', '041025091800407252354850745744260014');
INSERT INTO `sys_user_role` VALUES ('040418300408', '000000011401004050', '041025091800408428844668777206235077');
INSERT INTO `sys_user_role` VALUES ('040418300409', '000000011401004050', '041025091800409582327831116208485258');
INSERT INTO `sys_user_role` VALUES ('040418300410', '000000011401004050', '041025091800410362170152353305377022');
INSERT INTO `sys_user_role` VALUES ('040418300411', '000000011401004050', '041025091800411565485651841644168343');
INSERT INTO `sys_user_role` VALUES ('040418300412', '000000011401004050', '041025091800412087220681758453213118');
INSERT INTO `sys_user_role` VALUES ('040418300413', '000000011401004050', '041025091800413513518880116040050284');
INSERT INTO `sys_user_role` VALUES ('040418300414', '000000011401004050', '041025091800414210778234561415365656');
INSERT INTO `sys_user_role` VALUES ('040418300415', '000000011401004050', '041025091800415478876408664472054058');
INSERT INTO `sys_user_role` VALUES ('040418300416', '000000011401004050', '041025091800416373421502433110860071');
INSERT INTO `sys_user_role` VALUES ('040418300417', '000000011401004050', '041025091800417336147782887677328231');
INSERT INTO `sys_user_role` VALUES ('040418300418', '000000011401004050', '041025091800418073605641844780348734');
INSERT INTO `sys_user_role` VALUES ('040418300419', '000000011401004050', '041025091800419010467316588661405710');
INSERT INTO `sys_user_role` VALUES ('040418300420', '000000011401004050', '041025091800420020805372364063075437');
INSERT INTO `sys_user_role` VALUES ('040418300421', '000000011401004050', '041025091800421208257378856618485237');
INSERT INTO `sys_user_role` VALUES ('040418300422', '000000011401004050', '041025091800422776088010310108215333');
INSERT INTO `sys_user_role` VALUES ('040418300423', '000000011401004050', '041025091800423216824665625145445468');
INSERT INTO `sys_user_role` VALUES ('040418300424', '000000011401004050', '041025091800424750128340747250004367');
INSERT INTO `sys_user_role` VALUES ('040418300425', '000000011401004050', '041025091800425057468083307146067003');
INSERT INTO `sys_user_role` VALUES ('040418300426', '000000011401004050', '041025091800426721416082546018527781');
INSERT INTO `sys_user_role` VALUES ('040418300427', '000000011401004050', '041025091800427787611884632068137635');
INSERT INTO `sys_user_role` VALUES ('040418300428', '000000011401004050', '041025091800428310211636608282342065');
INSERT INTO `sys_user_role` VALUES ('040418300429', '000000011401004050', '041025091800429104866223077271206613');
INSERT INTO `sys_user_role` VALUES ('040418300430', '000000011401004050', '041025091800430882004456772510471537');
INSERT INTO `sys_user_role` VALUES ('040418300431', '000000011401004050', '041025091800431616620323642462251044');
INSERT INTO `sys_user_role` VALUES ('040418300432', '000000011401004050', '041025091800432633688450780258443716');
INSERT INTO `sys_user_role` VALUES ('040418300433', '000000011401004050', '041025091800433821322825272600346083');
INSERT INTO `sys_user_role` VALUES ('040418300434', '000000011401004050', '041025091800434045568512133882118585');
INSERT INTO `sys_user_role` VALUES ('040418300435', '000000011401004050', '041025091800435587868672282456831057');
INSERT INTO `sys_user_role` VALUES ('040418300436', '000000011401004050', '041025091810436386414488546114625645');
INSERT INTO `sys_user_role` VALUES ('040418300437', '000000011401004050', '041025091810437047775705634260708331');
INSERT INTO `sys_user_role` VALUES ('040418300438', '000000011401004050', '041025091810438315071541386746224070');
INSERT INTO `sys_user_role` VALUES ('040418300439', '000000011401004050', '041025091810439270116122806542581334');
INSERT INTO `sys_user_role` VALUES ('040418300440', '000000011401004050', '041025091810440672008042477857146324');
INSERT INTO `sys_user_role` VALUES ('040418300441', '000000011401004050', '041025091810441330230254282657288686');
INSERT INTO `sys_user_role` VALUES ('040418300442', '000000011401004050', '041025091810442757426043604370810614');
INSERT INTO `sys_user_role` VALUES ('040418300443', '000000011401004050', '041025091810443284405422437484026002');
INSERT INTO `sys_user_role` VALUES ('040418300444', '000000011401004050', '041025091810444500442448808208051542');
INSERT INTO `sys_user_role` VALUES ('040418300445', '000000011401004050', '041025091810445104471846362508263235');
INSERT INTO `sys_user_role` VALUES ('040418300446', '000000011401004050', '041025091810446408007741376160713721');
INSERT INTO `sys_user_role` VALUES ('040418300447', '000000011401004050', '041025091810447644447870603520212001');
INSERT INTO `sys_user_role` VALUES ('040418300448', '000000011401004050', '041025091810448832856430876254603488');
INSERT INTO `sys_user_role` VALUES ('040418300449', '000000011401004050', '041025091810449182736848163548232386');
INSERT INTO `sys_user_role` VALUES ('040418300450', '000000011401004050', '041025091810450187525422413860051343');
INSERT INTO `sys_user_role` VALUES ('040418300451', '000000011401004050', '041025091810451318700627774085817517');
INSERT INTO `sys_user_role` VALUES ('040418300452', '000000011401004050', '041025091810452726671408034210173828');
INSERT INTO `sys_user_role` VALUES ('040418300453', '000000011401004050', '041025091810453177017585388647268606');
INSERT INTO `sys_user_role` VALUES ('040418300454', '000000011401004050', '041025091810454604338234011405178138');
INSERT INTO `sys_user_role` VALUES ('040418300455', '000000011401004050', '041025091810455477844545071268863265');
INSERT INTO `sys_user_role` VALUES ('040418300456', '000000011401004050', '041025091810456076633226262764848386');
INSERT INTO `sys_user_role` VALUES ('040418300457', '000000011401004050', '041025091810457153716857105872167704');
INSERT INTO `sys_user_role` VALUES ('040418300458', '000000011401004050', '041025091810458465211516767325740406');
INSERT INTO `sys_user_role` VALUES ('040418300459', '000000011401004050', '041025091810459071817082325575330101');
INSERT INTO `sys_user_role` VALUES ('040418300460', '000000011401004050', '041025091810460741388054733772252888');
INSERT INTO `sys_user_role` VALUES ('040418300461', '000000011401004050', '041025091810461335741354183446565636');
INSERT INTO `sys_user_role` VALUES ('040418300462', '000000011401004050', '041025091810462814544107452648588033');
INSERT INTO `sys_user_role` VALUES ('040418300463', '000000011401004050', '041025091810463076126547878504131531');
INSERT INTO `sys_user_role` VALUES ('040418300464', '000000011401004050', '041025091810464078801403688887632230');
INSERT INTO `sys_user_role` VALUES ('040418300465', '000000011401004050', '041025091810465000650061160825517226');
INSERT INTO `sys_user_role` VALUES ('040418300466', '000000011401004050', '041025091810466835618380163161642740');
INSERT INTO `sys_user_role` VALUES ('040418300467', '000000011401004050', '041025091810467544634526544370465573');
INSERT INTO `sys_user_role` VALUES ('040418300468', '000000011401004050', '041025091810468812045213685252058342');
INSERT INTO `sys_user_role` VALUES ('040418300469', '000000011401004050', '041025091810469571231785816322183587');
INSERT INTO `sys_user_role` VALUES ('040418300470', '000000011401004050', '041025091810470386671825188165872415');
INSERT INTO `sys_user_role` VALUES ('040418300471', '000000011401004050', '041025091810471257662860142830882526');
INSERT INTO `sys_user_role` VALUES ('040418300472', '000000011401004050', '041025091810472023516801311541533304');
INSERT INTO `sys_user_role` VALUES ('040418300473', '000000011401004050', '041025091810473738628681886286705143');
INSERT INTO `sys_user_role` VALUES ('040418300474', '000000011401004050', '041025091810474013315411056228454783');
INSERT INTO `sys_user_role` VALUES ('040418300475', '000000011401004050', '041025091810475476826155525228570075');
INSERT INTO `sys_user_role` VALUES ('040418300476', '000000011401004050', '041025091810476847447874153205753780');
INSERT INTO `sys_user_role` VALUES ('040418300477', '000000011401004050', '041025091810477586474327427418201625');
INSERT INTO `sys_user_role` VALUES ('040418300478', '000000011401004050', '041025091810478843461322823722802162');
INSERT INTO `sys_user_role` VALUES ('040418300479', '000000011401004050', '041025091810479426754582035813824424');
INSERT INTO `sys_user_role` VALUES ('040418300480', '000000011401004050', '041025091810480412518322342216435605');
INSERT INTO `sys_user_role` VALUES ('040418300481', '000000011401004050', '041025091810481582637871282671644684');
INSERT INTO `sys_user_role` VALUES ('040418300482', '000000011401004050', '041025091810482301674326532752341283');
INSERT INTO `sys_user_role` VALUES ('040418300483', '000000011401004050', '041025091810483576853341483621783858');
INSERT INTO `sys_user_role` VALUES ('040418300484', '000000011401004050', '041025091810484101106030218205211373');
INSERT INTO `sys_user_role` VALUES ('040418300486', '000000011401004050', '041025091800486207307518108006765810');
INSERT INTO `sys_user_role` VALUES ('040418300487', '000000011401004050', '041025091800487416564140102555377310');
INSERT INTO `sys_user_role` VALUES ('040418300488', '000000011401004050', '041025091800488177026352302333260134');
INSERT INTO `sys_user_role` VALUES ('040418300489', '000000011401004050', '041025091800489844427471472423083431');
INSERT INTO `sys_user_role` VALUES ('0404183700', '000000011401004050', '041025091000034070584652360875132527');
INSERT INTO `sys_user_role` VALUES ('04041837010', '000000011401004050', '041025091000105833617271530016666074');
INSERT INTO `sys_user_role` VALUES ('04041837011', '000000011401004050', '041025091000118308146554316425147560');
INSERT INTO `sys_user_role` VALUES ('04041837012', '000000011401004050', '041025091000127825244643263658266068');
INSERT INTO `sys_user_role` VALUES ('04041837013', '000000011401004050', '041025091000138145714062837305184856');
INSERT INTO `sys_user_role` VALUES ('04041837014', '000000011401004050', '041025091000147122475250558257855112');
INSERT INTO `sys_user_role` VALUES ('04041837015', '000000011401004050', '041025091000155511186514077741473546');
INSERT INTO `sys_user_role` VALUES ('04041837016', '000000011401004050', '041025091000161445052441127261585736');
INSERT INTO `sys_user_role` VALUES ('04041837017', '000000011401004050', '041025091000178705877614681788205111');
INSERT INTO `sys_user_role` VALUES ('04041837018', '000000011401004050', '041025091000187536114380504476687624');
INSERT INTO `sys_user_role` VALUES ('04041837019', '000000011401004050', '041025091000196030025062121226142624');
INSERT INTO `sys_user_role` VALUES ('0404183702', '000000011401004050', '041025091000210306588374364552140508');
INSERT INTO `sys_user_role` VALUES ('04041837020', '000000011401004050', '041025091000207261654272223305467527');
INSERT INTO `sys_user_role` VALUES ('04041837021', '000000011401004050', '041025091000211008646867112858543261');
INSERT INTO `sys_user_role` VALUES ('04041837023', '000000011401004050', '041025091000238127575374521566126424');
INSERT INTO `sys_user_role` VALUES ('04041837024', '000000011401004050', '041025091000245614713316518258227372');
INSERT INTO `sys_user_role` VALUES ('04041837025', '000000011401004050', '041025091000258205446024354011555630');
INSERT INTO `sys_user_role` VALUES ('04041837026', '000000011401004050', '041025091000266204862011812007453006');
INSERT INTO `sys_user_role` VALUES ('04041837027', '000000011401004050', '041025091000276306606210176487763218');
INSERT INTO `sys_user_role` VALUES ('040418370278', '000000011401004050', '041025091050278063538631255104800454');
INSERT INTO `sys_user_role` VALUES ('040418370279', '000000011401004050', '041025091000279275888220720507873108');
INSERT INTO `sys_user_role` VALUES ('04041837028', '000000011401004050', '041025091000286054451031346381503355');
INSERT INTO `sys_user_role` VALUES ('040418370280', '000000011401004050', '041025091000280172138622632013674421');
INSERT INTO `sys_user_role` VALUES ('040418370281', '000000011401004050', '041025091000281148828368145337257506');
INSERT INTO `sys_user_role` VALUES ('040418370282', '000000011401004050', '041025091000282376321882883326744231');
INSERT INTO `sys_user_role` VALUES ('040418370283', '000000011401004050', '041025091000283354700205316138824040');
INSERT INTO `sys_user_role` VALUES ('040418370284', '000000011401004050', '041025091000284378623641084858453240');
INSERT INTO `sys_user_role` VALUES ('040418370285', '000000011401004050', '041025091000285802011265450473854850');
INSERT INTO `sys_user_role` VALUES ('040418370286', '000000011401004050', '041025091000286120146255168347181551');
INSERT INTO `sys_user_role` VALUES ('040418370287', '000000011401004050', '041025091000287671052410880123341410');
INSERT INTO `sys_user_role` VALUES ('040418370288', '000000011401004050', '041025091000288743167214010830872712');
INSERT INTO `sys_user_role` VALUES ('040418370289', '000000011401004050', '041025091000289557816333346243504411');
INSERT INTO `sys_user_role` VALUES ('04041837029', '000000011401004050', '041025091000291808031647888452107744');
INSERT INTO `sys_user_role` VALUES ('040418370290', '000000011401004050', '041025091000290782360773017244274846');
INSERT INTO `sys_user_role` VALUES ('040418370291', '000000011401004050', '041025091000291118513334151336507844');
INSERT INTO `sys_user_role` VALUES ('040418370292', '000000011401004050', '041025091000292007718042305312423158');
INSERT INTO `sys_user_role` VALUES ('040418370293', '000000011401004050', '041025091000293006745226815365278882');
INSERT INTO `sys_user_role` VALUES ('040418370294', '000000011401004050', '041025091000294811237155851062036373');
INSERT INTO `sys_user_role` VALUES ('040418370295', '000000011401004050', '041025091000295862063614760864422363');
INSERT INTO `sys_user_role` VALUES ('040418370296', '000000011401004050', '041025091000296427314538575335144137');
INSERT INTO `sys_user_role` VALUES ('040418370297', '000000011401004050', '041025091000297424716303575522362233');
INSERT INTO `sys_user_role` VALUES ('040418370298', '000000011401004050', '041025091000298366635601630555378447');
INSERT INTO `sys_user_role` VALUES ('040418370299', '000000011401004050', '041025091000299245303570381350641716');
INSERT INTO `sys_user_role` VALUES ('0404183703', '000000011401004050', '041025091000385544488828604071101445');
INSERT INTO `sys_user_role` VALUES ('040418370300', '000000011401004050', '041025091000300217281557402377263402');
INSERT INTO `sys_user_role` VALUES ('040418370301', '000000011401004050', '041025091000301107517870207326656875');
INSERT INTO `sys_user_role` VALUES ('040418370302', '000000011401004050', '041025091000302643066845624784130014');
INSERT INTO `sys_user_role` VALUES ('040418370303', '000000011401004050', '041025091000303366381585107853443107');
INSERT INTO `sys_user_role` VALUES ('040418370304', '000000011401004050', '041025091000304064745345424501384081');
INSERT INTO `sys_user_role` VALUES ('040418370305', '000000011401004050', '041025091000305414076415152544436556');
INSERT INTO `sys_user_role` VALUES ('040418370306', '000000011401004050', '041025091000306816528386365584252888');
INSERT INTO `sys_user_role` VALUES ('040418370307', '000000011401004050', '041025091000307040835163611726573653');
INSERT INTO `sys_user_role` VALUES ('040418370308', '000000011401004050', '041025091000308773462257611408006731');
INSERT INTO `sys_user_role` VALUES ('040418370309', '000000011401004050', '041025091000309582346547241437467132');
INSERT INTO `sys_user_role` VALUES ('040418370310', '000000011401004050', '041025091000310322541715341647343628');
INSERT INTO `sys_user_role` VALUES ('040418370311', '000000011401004050', '041025091000311531680454078708024283');
INSERT INTO `sys_user_role` VALUES ('040418370312', '000000011401004050', '041025091000312673857357735641046132');
INSERT INTO `sys_user_role` VALUES ('040418370313', '000000011401004050', '041025091000313570882153042401774488');
INSERT INTO `sys_user_role` VALUES ('040418370314', '000000011401004050', '041025091000314058836402415213314226');
INSERT INTO `sys_user_role` VALUES ('040418370315', '000000011401004050', '041025091000315828012172243676075848');
INSERT INTO `sys_user_role` VALUES ('040418370316', '000000011401004050', '041025091000316587404117374686405001');
INSERT INTO `sys_user_role` VALUES ('040418370317', '000000011401004050', '041025091000317067488432685531402238');
INSERT INTO `sys_user_role` VALUES ('040418370318', '000000011401004050', '041025091000318757186684373734368537');
INSERT INTO `sys_user_role` VALUES ('040418370319', '000000011401004050', '041025091000319041187658681201103430');
INSERT INTO `sys_user_role` VALUES ('04041837032', '000000011401004050', '041025091000327806254760565215235662');
INSERT INTO `sys_user_role` VALUES ('040418370320', '000000011401004050', '041025091000320868453578284007020276');
INSERT INTO `sys_user_role` VALUES ('040418370321', '000000011401004050', '041025091000321106415667604358540218');
INSERT INTO `sys_user_role` VALUES ('040418370322', '000000011401004050', '041025091000322385512764273004031502');
INSERT INTO `sys_user_role` VALUES ('040418370323', '000000011401004050', '041025091000323764044366346702181233');
INSERT INTO `sys_user_role` VALUES ('040418370324', '000000011401004050', '041025091000324538750651472581122501');
INSERT INTO `sys_user_role` VALUES ('040418370325', '000000011401004050', '041025091000325224384458821840871265');
INSERT INTO `sys_user_role` VALUES ('040418370326', '000000011401004050', '041025091000326176861381262275171017');
INSERT INTO `sys_user_role` VALUES ('040418370327', '000000011401004050', '041025091000327466553886337300628813');
INSERT INTO `sys_user_role` VALUES ('040418370328', '000000011401004050', '041025091000328510883320377620071453');
INSERT INTO `sys_user_role` VALUES ('040418370329', '000000011401004050', '041025091000329606220535370441322677');
INSERT INTO `sys_user_role` VALUES ('040418370330', '000000011401004050', '041025091000330874524850662887258666');
INSERT INTO `sys_user_role` VALUES ('040418370331', '000000011401004050', '041025091010331030082545025154085037');
INSERT INTO `sys_user_role` VALUES ('040418370332', '000000011401004050', '041025091010332080352226672045547820');
INSERT INTO `sys_user_role` VALUES ('040418370333', '000000011401004050', '041025091010333681658327523445600617');
INSERT INTO `sys_user_role` VALUES ('040418370334', '000000011401004050', '041025091010334773606310107634812386');
INSERT INTO `sys_user_role` VALUES ('040418370335', '000000011401004050', '041025091010335205767586016581653117');
INSERT INTO `sys_user_role` VALUES ('040418370336', '000000011401004050', '041025091010336035457376317541167107');
INSERT INTO `sys_user_role` VALUES ('040418370337', '000000011401004050', '041025091010337041633787844744560346');
INSERT INTO `sys_user_role` VALUES ('040418370338', '000000011401004050', '041025091010338014031326771528660285');
INSERT INTO `sys_user_role` VALUES ('040418370339', '000000011401004050', '041025091010339701841271336458053467');
INSERT INTO `sys_user_role` VALUES ('04041837034', '000000011401004050', '041025091000344225204727741546378536');
INSERT INTO `sys_user_role` VALUES ('040418370340', '000000011401004050', '041025091010340317780154860403886141');
INSERT INTO `sys_user_role` VALUES ('040418370341', '000000011401004050', '041025091010341770112383200270028427');
INSERT INTO `sys_user_role` VALUES ('040418370342', '000000011401004050', '041025091010342143263167235763720382');
INSERT INTO `sys_user_role` VALUES ('040418370343', '000000011401004050', '041025091010343882302668801747770683');
INSERT INTO `sys_user_role` VALUES ('040418370344', '000000011401004050', '041025091010344472274303620145734343');
INSERT INTO `sys_user_role` VALUES ('040418370345', '000000011401004050', '041025091010345854405616505256601261');
INSERT INTO `sys_user_role` VALUES ('040418370346', '000000011401004050', '041025091010346252214616661156443402');
INSERT INTO `sys_user_role` VALUES ('040418370347', '000000011401004050', '041025091010347282603553731575015716');
INSERT INTO `sys_user_role` VALUES ('040418370348', '000000011401004050', '041025091010348031337573632127038743');
INSERT INTO `sys_user_role` VALUES ('040418370349', '000000011401004050', '041025091010349608210077122213554271');
INSERT INTO `sys_user_role` VALUES ('04041837035', '000000011401004050', '041025091000358868346315161677465714');
INSERT INTO `sys_user_role` VALUES ('040418370350', '000000011401004050', '041025091010350457508354278301012672');
INSERT INTO `sys_user_role` VALUES ('040418370351', '000000011401004050', '041025091010351662215580775577467663');
INSERT INTO `sys_user_role` VALUES ('040418370352', '000000011401004050', '041025091010352777652512045788728733');
INSERT INTO `sys_user_role` VALUES ('040418370353', '000000011401004050', '041025091010353038641851175135050885');
INSERT INTO `sys_user_role` VALUES ('040418370354', '000000011401004050', '041025091010354755062857661787186164');
INSERT INTO `sys_user_role` VALUES ('040418370355', '000000011401004050', '041025091010355070746848406777421825');
INSERT INTO `sys_user_role` VALUES ('040418370356', '000000011401004050', '041025091010356553323600412185884201');
INSERT INTO `sys_user_role` VALUES ('040418370357', '000000011401004050', '041025091010357005804065720326603755');
INSERT INTO `sys_user_role` VALUES ('040418370358', '000000011401004050', '041025091010358473805804622680716088');
INSERT INTO `sys_user_role` VALUES ('040418370359', '000000011401004050', '041025091010359530365105577657813255');
INSERT INTO `sys_user_role` VALUES ('04041837036', '000000011401004050', '041025091000364071634340821625647240');
INSERT INTO `sys_user_role` VALUES ('040418370360', '000000011401004050', '041025091010360625605107816024683352');
INSERT INTO `sys_user_role` VALUES ('040418370361', '000000011401004050', '041025091010361377228356716205378883');
INSERT INTO `sys_user_role` VALUES ('040418370362', '000000011401004050', '041025091010362102048684086372070678');
INSERT INTO `sys_user_role` VALUES ('040418370363', '000000011401004050', '041025091010363372013215583734325536');
INSERT INTO `sys_user_role` VALUES ('040418370364', '000000011401004050', '041025091010364037356473586043081165');
INSERT INTO `sys_user_role` VALUES ('040418370365', '000000011401004050', '041025091010365844802562067788558375');
INSERT INTO `sys_user_role` VALUES ('040418370366', '000000011401004050', '041025091010366654247182438434605736');
INSERT INTO `sys_user_role` VALUES ('040418370367', '000000011401004050', '041025091010367125860453454547752308');
INSERT INTO `sys_user_role` VALUES ('040418370368', '000000011401004050', '041025091010368507063740655162075565');
INSERT INTO `sys_user_role` VALUES ('040418370369', '000000011401004050', '041025091010369111642167576006076480');
INSERT INTO `sys_user_role` VALUES ('04041837037', '000000011401004050', '041025091000378281584071757738054060');
INSERT INTO `sys_user_role` VALUES ('040418370370', '000000011401004050', '041025091010370505471408743718215277');
INSERT INTO `sys_user_role` VALUES ('040418370371', '000000011401004050', '041025091010371006804225630388312184');
INSERT INTO `sys_user_role` VALUES ('040418370372', '000000011401004050', '041025091010372246520233435811822306');
INSERT INTO `sys_user_role` VALUES ('04041837038', '000000011401004050', '041025091000385048213561274316341415');
INSERT INTO `sys_user_role` VALUES ('0404183704', '000000011401004050', '041025091000480850637566872876140443');
INSERT INTO `sys_user_role` VALUES ('04041837043', '000000011401004050', '041025091000435760575052026467554483');
INSERT INTO `sys_user_role` VALUES ('04041837045', '000000011401004050', '041025091010452316476735334025024233');
INSERT INTO `sys_user_role` VALUES ('04041837046', '000000011401004050', '041025091010463876543054650476510145');
INSERT INTO `sys_user_role` VALUES ('04041837047', '000000011401004050', '041025091010474614585467508286834545');
INSERT INTO `sys_user_role` VALUES ('04041837048', '000000011401004050', '041025091010485463777775260338151531');
INSERT INTO `sys_user_role` VALUES ('04041837049', '000000011401004050', '041025091010498601577024301865713824');
INSERT INTO `sys_user_role` VALUES ('0404183705', '000000011401004050', '041025091000567253278816488044422757');
INSERT INTO `sys_user_role` VALUES ('04041837050', '000000011401004050', '041025091010500663511883247667203336');
INSERT INTO `sys_user_role` VALUES ('04041837051', '000000011401004050', '041025091010515307121528807245155752');
INSERT INTO `sys_user_role` VALUES ('04041837052', '000000011401004050', '041025091010522460287445673276811818');
INSERT INTO `sys_user_role` VALUES ('04041837053', '000000011401004050', '041025091010536364584110041764024252');
INSERT INTO `sys_user_role` VALUES ('04041837054', '000000011401004050', '041025091010544684520346170300023238');
INSERT INTO `sys_user_role` VALUES ('04041837055', '000000011401004050', '041025091010558517687172536186818235');
INSERT INTO `sys_user_role` VALUES ('04041837056', '000000011401004050', '041025091010561017424308426077215872');
INSERT INTO `sys_user_role` VALUES ('04041837057', '000000011401004050', '041025091010573585038724581545611036');
INSERT INTO `sys_user_role` VALUES ('04041837058', '000000011401004050', '041025091010584500747428280352320677');
INSERT INTO `sys_user_role` VALUES ('04041837059', '000000011401004050', '041025091010596501445402608325460640');
INSERT INTO `sys_user_role` VALUES ('0404183706', '000000011401004050', '041025091000636852315438616824722818');
INSERT INTO `sys_user_role` VALUES ('04041837060', '000000011401004050', '041025091010606747143652875323048856');
INSERT INTO `sys_user_role` VALUES ('04041837061', '000000011401004050', '041025091010618338884082668136504743');
INSERT INTO `sys_user_role` VALUES ('04041837062', '000000011401004050', '041025091010621417616546253505545444');
INSERT INTO `sys_user_role` VALUES ('04041837063', '000000011401004050', '041025091010637751626452788072825226');
INSERT INTO `sys_user_role` VALUES ('04041837064', '000000011401004050', '041025091010644616476386384877122466');
INSERT INTO `sys_user_role` VALUES ('04041837065', '000000011401004050', '041025091010655632880565415474006301');
INSERT INTO `sys_user_role` VALUES ('04041837066', '000000011401004050', '041025091010660820073510754780568214');
INSERT INTO `sys_user_role` VALUES ('04041837067', '000000011401004050', '041025091010673720466014378758642758');
INSERT INTO `sys_user_role` VALUES ('04041837068', '000000011401004050', '041025091010681276618433070510648256');
INSERT INTO `sys_user_role` VALUES ('04041837069', '000000011401004050', '041025091010698873551014113086033518');
INSERT INTO `sys_user_role` VALUES ('0404183707', '000000011401004050', '041025091000760170383172132730787003');
INSERT INTO `sys_user_role` VALUES ('04041837070', '000000011401004050', '041025091010705007773043118661467572');
INSERT INTO `sys_user_role` VALUES ('04041837071', '000000011401004050', '041025091010714086277071641452885223');
INSERT INTO `sys_user_role` VALUES ('04041837072', '000000011401004050', '041025091010721042460733568334343482');
INSERT INTO `sys_user_role` VALUES ('04041837073', '000000011401004050', '041025091010738488686543200123168181');
INSERT INTO `sys_user_role` VALUES ('04041837074', '000000011401004050', '041025091010746141146715727338330121');
INSERT INTO `sys_user_role` VALUES ('04041837075', '000000011401004050', '041025091010755180447366516326088452');
INSERT INTO `sys_user_role` VALUES ('04041837076', '000000011401004050', '041025091010765751738623767461162035');
INSERT INTO `sys_user_role` VALUES ('04041837077', '000000011401004050', '041025091010774655502717704235118702');
INSERT INTO `sys_user_role` VALUES ('04041837078', '000000011401004050', '041025091010783273848048014158747384');
INSERT INTO `sys_user_role` VALUES ('04041837079', '000000011401004050', '041025091010797338416605514308238413');
INSERT INTO `sys_user_role` VALUES ('0404183708', '000000011401004050', '041025091000832643881501657417708805');
INSERT INTO `sys_user_role` VALUES ('04041837080', '000000011401004050', '041025091010808717635528378535512454');
INSERT INTO `sys_user_role` VALUES ('04041837081', '000000011401004050', '041025091010811761151515533785100830');
INSERT INTO `sys_user_role` VALUES ('04041837082', '000000011401004050', '041025091010828886133501506236005446');
INSERT INTO `sys_user_role` VALUES ('04041837083', '000000011401004050', '041025091010833315017018837832474013');
INSERT INTO `sys_user_role` VALUES ('04041837084', '000000011401004050', '041025091010848754527656867140812567');
INSERT INTO `sys_user_role` VALUES ('04041837085', '000000011401004050', '041025091010857518146088870407152111');
INSERT INTO `sys_user_role` VALUES ('04041837086', '000000011401004050', '041025091010860622082182380731650487');
INSERT INTO `sys_user_role` VALUES ('04041837087', '000000011401004050', '041025091010873835503340375011515725');
INSERT INTO `sys_user_role` VALUES ('04041837088', '000000011401004050', '041025091010887628004171863733204124');
INSERT INTO `sys_user_role` VALUES ('04041837089', '000000011401004050', '041025091010898787071233686448805837');
INSERT INTO `sys_user_role` VALUES ('0404183709', '000000011401004050', '041025091000964226835166646214300484');
INSERT INTO `sys_user_role` VALUES ('040418374100', '000000011401004050', '041025091040100026027673540176758681');
INSERT INTO `sys_user_role` VALUES ('040418374101', '000000011401004050', '041025091040101187288624660715357823');
INSERT INTO `sys_user_role` VALUES ('040418374102', '000000011401004050', '041025091040102086707882527121473615');
INSERT INTO `sys_user_role` VALUES ('040418374103', '000000011401004050', '041025091040103005645754300053484742');
INSERT INTO `sys_user_role` VALUES ('040418374104', '000000011401004050', '041025091040104660388565354117636073');
INSERT INTO `sys_user_role` VALUES ('040418374105', '000000011401004050', '041025091040105536460401537877047811');
INSERT INTO `sys_user_role` VALUES ('040418374106', '000000011401004050', '041025091040106428748707118367477684');
INSERT INTO `sys_user_role` VALUES ('040418374107', '000000011401004050', '041025091040107571046380505307608604');
INSERT INTO `sys_user_role` VALUES ('040418374108', '000000011401004050', '041025091040108360680370088876768017');
INSERT INTO `sys_user_role` VALUES ('040418374109', '000000011401004050', '041025091040109786385576182745475713');
INSERT INTO `sys_user_role` VALUES ('040418374110', '000000011401004050', '041025091040110383105856133510237860');
INSERT INTO `sys_user_role` VALUES ('040418374111', '000000011401004050', '041025091040111663734648628681757333');
INSERT INTO `sys_user_role` VALUES ('040418374112', '000000011401004050', '041025091040112716203732701207010772');
INSERT INTO `sys_user_role` VALUES ('040418374113', '000000011401004050', '041025091040113762857467085283000308');
INSERT INTO `sys_user_role` VALUES ('040418374114', '000000011401004050', '041025091040114521258184156511000507');
INSERT INTO `sys_user_role` VALUES ('040418374115', '000000011401004050', '041025091040115340038381886860431251');
INSERT INTO `sys_user_role` VALUES ('040418374117', '000000011401004050', '041025091040117611648217028777528851');
INSERT INTO `sys_user_role` VALUES ('040418374118', '000000011401004050', '041025091040118654670773302840772478');
INSERT INTO `sys_user_role` VALUES ('040418374119', '000000011401004050', '041025091040119510827225327628707862');
INSERT INTO `sys_user_role` VALUES ('040418374120', '000000011401004050', '041025091040120306366246627032746231');
INSERT INTO `sys_user_role` VALUES ('040418374124', '000000011401004050', '041025091040124685338334813567730730');
INSERT INTO `sys_user_role` VALUES ('040418374125', '000000011401004050', '041025091040125237446331681755024825');
INSERT INTO `sys_user_role` VALUES ('040418374127', '000000011401004050', '041025091040127230631585465778313864');
INSERT INTO `sys_user_role` VALUES ('040418374128', '000000011401004050', '041025091040128643347822814681187183');
INSERT INTO `sys_user_role` VALUES ('040418374129', '000000011401004050', '041025091040129715144465730231582775');
INSERT INTO `sys_user_role` VALUES ('040418374130', '000000011401004050', '041025091040130415347444620503634766');
INSERT INTO `sys_user_role` VALUES ('040418374131', '000000011401004050', '041025091040131780038741883855042420');
INSERT INTO `sys_user_role` VALUES ('040418374132', '000000011401004050', '041025091040132637217747455728504262');
INSERT INTO `sys_user_role` VALUES ('040418374133', '000000011401004050', '041025091040133768013846624128127121');
INSERT INTO `sys_user_role` VALUES ('040418374134', '000000011401004050', '041025091040134323341320136677404607');
INSERT INTO `sys_user_role` VALUES ('040418374135', '000000011401004050', '041025091040135011552541244533817186');
INSERT INTO `sys_user_role` VALUES ('040418374136', '000000011401004050', '041025091040136087810427156587643847');
INSERT INTO `sys_user_role` VALUES ('040418374137', '000000011401004050', '041025091040137030657461107316105727');
INSERT INTO `sys_user_role` VALUES ('040418374138', '000000011401004050', '041025091040138004532601714130636081');
INSERT INTO `sys_user_role` VALUES ('040418374139', '000000011401004050', '041025091040139836640713352020418766');
INSERT INTO `sys_user_role` VALUES ('040418374140', '000000011401004050', '041025091040140357221375252665030503');
INSERT INTO `sys_user_role` VALUES ('040418374141', '000000011401004050', '041025091050141421277786758873140461');
INSERT INTO `sys_user_role` VALUES ('040418374142', '000000011401004050', '041025091050142488452876640355144426');
INSERT INTO `sys_user_role` VALUES ('040418374143', '000000011401004050', '041025091050143267253400103607386883');
INSERT INTO `sys_user_role` VALUES ('040418374144', '000000011401004050', '041025091050144413852480325801710776');
INSERT INTO `sys_user_role` VALUES ('040418374145', '000000011401004050', '041025091050145120305013335251560741');
INSERT INTO `sys_user_role` VALUES ('040418374146', '000000011401004050', '041025091050146355813243716705631324');
INSERT INTO `sys_user_role` VALUES ('040418374147', '000000011401004050', '041025091050147031775853056116825267');
INSERT INTO `sys_user_role` VALUES ('040418374148', '000000011401004050', '041025091050148353156674655576235315');
INSERT INTO `sys_user_role` VALUES ('040418374149', '000000011401004050', '041025091050149413683757843287451673');
INSERT INTO `sys_user_role` VALUES ('040418374151', '000000011401004050', '041025091050151844720324437226775848');
INSERT INTO `sys_user_role` VALUES ('040418374152', '000000011401004050', '041025091050152246666600854431473665');
INSERT INTO `sys_user_role` VALUES ('040418374153', '000000011401004050', '041025091050153831276013761536350423');
INSERT INTO `sys_user_role` VALUES ('040418374154', '000000011401004050', '041025091050154577070734665871073560');
INSERT INTO `sys_user_role` VALUES ('040418374155', '000000011401004050', '041025091050155758014485648542364435');
INSERT INTO `sys_user_role` VALUES ('040418374156', '000000011401004050', '041025091050156841704516834874067164');
INSERT INTO `sys_user_role` VALUES ('040418374157', '000000011401004050', '041025091050157324857222766116876277');
INSERT INTO `sys_user_role` VALUES ('040418374158', '000000011401004050', '041025091050158380001465470465485733');
INSERT INTO `sys_user_role` VALUES ('040418374159', '000000011401004050', '041025091050159165612022023447783550');
INSERT INTO `sys_user_role` VALUES ('040418374160', '000000011401004050', '041025091050160326714407331655363462');
INSERT INTO `sys_user_role` VALUES ('040418374161', '000000011401004050', '041025091050161483541133180314638153');
INSERT INTO `sys_user_role` VALUES ('040418374162', '000000011401004050', '041025091050162521461172043354645762');
INSERT INTO `sys_user_role` VALUES ('040418374163', '000000011401004050', '041025091050163017375120434022812141');
INSERT INTO `sys_user_role` VALUES ('040418374164', '000000011401004050', '041025091050164283107767673772500068');
INSERT INTO `sys_user_role` VALUES ('040418374165', '000000011401004050', '041025091050165367673485651228285836');
INSERT INTO `sys_user_role` VALUES ('040418374166', '000000011401004050', '041025091050166383152110284340664203');
INSERT INTO `sys_user_role` VALUES ('040418374167', '000000011401004050', '041025091050167258675005708825515851');
INSERT INTO `sys_user_role` VALUES ('040418374168', '000000011401004050', '041025091050168377270063058631201680');
INSERT INTO `sys_user_role` VALUES ('040418374169', '000000011401004050', '041025091050169778162534455074007583');
INSERT INTO `sys_user_role` VALUES ('040418374170', '000000011401004050', '041025091050170334481732832106723347');
INSERT INTO `sys_user_role` VALUES ('040418374171', '000000011401004050', '041025091050171687702675177176630841');
INSERT INTO `sys_user_role` VALUES ('040418374172', '000000011401004050', '041025091050172252275561847764138010');
INSERT INTO `sys_user_role` VALUES ('040418374173', '000000011401004050', '041025091050173806277402406410646745');
INSERT INTO `sys_user_role` VALUES ('040418374174', '000000011401004050', '041025091050174827111740300430015123');
INSERT INTO `sys_user_role` VALUES ('040418374175', '000000011401004050', '041025091050175785606070451407206211');
INSERT INTO `sys_user_role` VALUES ('040418374176', '000000011401004050', '041025091050176374456776730875100338');
INSERT INTO `sys_user_role` VALUES ('040418374177', '000000011401004050', '041025091050177085517078503660586787');
INSERT INTO `sys_user_role` VALUES ('040418374178', '000000011401004050', '041025091050178241608041270611438763');
INSERT INTO `sys_user_role` VALUES ('040418374179', '000000011401004050', '041025091050179636667887034731135127');
INSERT INTO `sys_user_role` VALUES ('040418374180', '000000011401004050', '041025091050180514668083551708520327');
INSERT INTO `sys_user_role` VALUES ('040418374181', '000000011401004050', '041025091050181353651314843552850782');
INSERT INTO `sys_user_role` VALUES ('040418374182', '000000011401004050', '041025091050182315635538412851358760');
INSERT INTO `sys_user_role` VALUES ('040418374183', '000000011401004050', '041025091050183347562502061020124850');
INSERT INTO `sys_user_role` VALUES ('040418374184', '000000011401004050', '041025091040184602248842215842615010');
INSERT INTO `sys_user_role` VALUES ('040418374185', '000000011401004050', '041025091040185133561273662362821301');
INSERT INTO `sys_user_role` VALUES ('040418374186', '000000011401004050', '041025091040186548125487324317373882');
INSERT INTO `sys_user_role` VALUES ('040418374187', '000000011401004050', '041025091040187858388187053075170446');
INSERT INTO `sys_user_role` VALUES ('040418374188', '000000011401004050', '041025091040188310018167268480236342');
INSERT INTO `sys_user_role` VALUES ('040418374189', '000000011401004050', '041025091040189722442753353057233524');
INSERT INTO `sys_user_role` VALUES ('040418374193', '000000011401004050', '041025091040193187886032847534812108');
INSERT INTO `sys_user_role` VALUES ('040418374194', '000000011401004050', '041025091040194603021550673037032571');
INSERT INTO `sys_user_role` VALUES ('040418374195', '000000011401004050', '041025091040195444618538138545754563');
INSERT INTO `sys_user_role` VALUES ('040418374196', '000000011401004050', '041025091040196745206062024558717173');
INSERT INTO `sys_user_role` VALUES ('040418374197', '000000011401004050', '041025091040197777703861115681343573');
INSERT INTO `sys_user_role` VALUES ('040418374198', '000000011401004050', '041025091040198537642714077440638381');
INSERT INTO `sys_user_role` VALUES ('040418374199', '000000011401004050', '041025091040199334008041673287543626');
INSERT INTO `sys_user_role` VALUES ('040418374200', '000000011401004050', '041025091040200651545128213047438563');
INSERT INTO `sys_user_role` VALUES ('040418374201', '000000011401004050', '041025091040201463167003025872600322');
INSERT INTO `sys_user_role` VALUES ('040418374202', '000000011401004050', '041025091040202231746858610748218078');
INSERT INTO `sys_user_role` VALUES ('040418374203', '000000011401004050', '041025091040203265711408857182042536');
INSERT INTO `sys_user_role` VALUES ('040418374204', '000000011401004050', '041025091040204207822310333188445300');
INSERT INTO `sys_user_role` VALUES ('040418374205', '000000011401004050', '041025091040205312443031452512657335');
INSERT INTO `sys_user_role` VALUES ('040418374206', '000000011401004050', '041025091040206581530073417886551683');
INSERT INTO `sys_user_role` VALUES ('040418374207', '000000011401004050', '041025091040207352487446130188737685');
INSERT INTO `sys_user_role` VALUES ('040418374208', '000000011401004050', '041025091040208027064138160785328503');
INSERT INTO `sys_user_role` VALUES ('040418374209', '000000011401004050', '041025091040209050301755765261657524');
INSERT INTO `sys_user_role` VALUES ('040418374210', '000000011401004050', '041025091040210618401842257212416108');
INSERT INTO `sys_user_role` VALUES ('040418374211', '000000011401004050', '041025091040211822127860616578227848');
INSERT INTO `sys_user_role` VALUES ('040418374212', '000000011401004050', '041025091040212635362422617844302152');
INSERT INTO `sys_user_role` VALUES ('040418374213', '000000011401004050', '041025091040213436743756171217244511');
INSERT INTO `sys_user_role` VALUES ('040418374214', '000000011401004050', '041025091040214325720155423005031723');
INSERT INTO `sys_user_role` VALUES ('040418374215', '000000011401004050', '041025091040215770886408381172250423');
INSERT INTO `sys_user_role` VALUES ('040418374216', '000000011401004050', '041025091040216766687452070164448131');
INSERT INTO `sys_user_role` VALUES ('040418374217', '000000011401004050', '041025091040217702103355812127360782');
INSERT INTO `sys_user_role` VALUES ('040418374218', '000000011401004050', '041025091040218048701360052224554852');
INSERT INTO `sys_user_role` VALUES ('040418374219', '000000011401004050', '041025091040219037610120566774413174');
INSERT INTO `sys_user_role` VALUES ('040418374231', '000000011401004050', '041025091040231410037113887278614308');
INSERT INTO `sys_user_role` VALUES ('040418374232', '000000011401004050', '041025091040232368016866774318323644');
INSERT INTO `sys_user_role` VALUES ('040418374233', '000000011401004050', '041025091040233563401365545727841871');
INSERT INTO `sys_user_role` VALUES ('040418374234', '000000011401004050', '041025091040234416552413418106888705');
INSERT INTO `sys_user_role` VALUES ('040418374235', '000000011401004050', '041025091040235168123730665334734448');
INSERT INTO `sys_user_role` VALUES ('040418374236', '000000011401004050', '041025091040236103347584237733421663');
INSERT INTO `sys_user_role` VALUES ('040418374237', '000000011401004050', '041025091040237440536526011882718047');
INSERT INTO `sys_user_role` VALUES ('040418374238', '000000011401004050', '041025091040238140762244814667531137');
INSERT INTO `sys_user_role` VALUES ('040418374239', '000000011401004050', '041025091040239652011011888065426803');
INSERT INTO `sys_user_role` VALUES ('040418374240', '000000011401004050', '041025091050240554347753156877807628');
INSERT INTO `sys_user_role` VALUES ('040418374241', '000000011401004050', '041025091050241641376207141716444657');
INSERT INTO `sys_user_role` VALUES ('040418374242', '000000011401004050', '041025091050242713573888607251584870');
INSERT INTO `sys_user_role` VALUES ('040418374243', '000000011401004050', '041025091050243618106371580655782740');
INSERT INTO `sys_user_role` VALUES ('040418374244', '000000011401004050', '041025091050244585350728720255088451');
INSERT INTO `sys_user_role` VALUES ('040418374245', '000000011401004050', '041025091050245621575270347037725244');
INSERT INTO `sys_user_role` VALUES ('040418374246', '000000011401004050', '041025091050246487223263373287224284');
INSERT INTO `sys_user_role` VALUES ('040418374247', '000000011401004050', '041025091050247327384841831600860311');
INSERT INTO `sys_user_role` VALUES ('040418374248', '000000011401004050', '041025091050248222483228052866277812');
INSERT INTO `sys_user_role` VALUES ('040418374249', '000000011401004050', '041025091050249157458087432875330240');
INSERT INTO `sys_user_role` VALUES ('040418374255', '000000011401004050', '041025091050255811766451551880336805');
INSERT INTO `sys_user_role` VALUES ('040418374256', '000000011401004050', '041025091050256247424851118006322577');
INSERT INTO `sys_user_role` VALUES ('040418374257', '000000011401004050', '041025091050257358035861811088036651');
INSERT INTO `sys_user_role` VALUES ('040418374258', '000000011401004050', '041025091050258145203622038342327413');
INSERT INTO `sys_user_role` VALUES ('040418374259', '000000011401004050', '041025091050259461852737347167431852');
INSERT INTO `sys_user_role` VALUES ('040418374260', '000000011401004050', '041025091050260734853774324067823007');
INSERT INTO `sys_user_role` VALUES ('040418374261', '000000011401004050', '041025091050261802243202553244844042');
INSERT INTO `sys_user_role` VALUES ('040418374262', '000000011401004050', '041025091050262067704761055252162221');
INSERT INTO `sys_user_role` VALUES ('040418374263', '000000011401004050', '041025091050263571185478670354203101');
INSERT INTO `sys_user_role` VALUES ('040418374264', '000000011401004050', '041025091050264203510214455804200076');
INSERT INTO `sys_user_role` VALUES ('040418374265', '000000011401004050', '041025091050265112816615601631353242');
INSERT INTO `sys_user_role` VALUES ('040418374266', '000000011401004050', '041025091050266868177308334068803153');
INSERT INTO `sys_user_role` VALUES ('040418374267', '000000011401004050', '041025091050267750213427576377028300');
INSERT INTO `sys_user_role` VALUES ('040418374268', '000000011401004050', '041025091050268874080223463338622645');
INSERT INTO `sys_user_role` VALUES ('040418374269', '000000011401004050', '041025091050269458681841678767112035');
INSERT INTO `sys_user_role` VALUES ('040418374270', '000000011401004050', '041025091050270761322242787174706611');
INSERT INTO `sys_user_role` VALUES ('040418374271', '000000011401004050', '041025091050271784452875887402355163');
INSERT INTO `sys_user_role` VALUES ('040418374272', '000000011401004050', '041025091050272762548180764352173257');
INSERT INTO `sys_user_role` VALUES ('040418374273', '000000011401004050', '041025091050273484048778271032706532');
INSERT INTO `sys_user_role` VALUES ('040418374274', '000000011401004050', '041025091050274324341453158245603445');
INSERT INTO `sys_user_role` VALUES ('040418374275', '000000011401004050', '041025091050275160775605065405401032');
INSERT INTO `sys_user_role` VALUES ('040418374276', '000000011401004050', '041025091050276130338006721467331117');
INSERT INTO `sys_user_role` VALUES ('040418374277', '000000011401004050', '041025091050277016818178570276281882');
INSERT INTO `sys_user_role` VALUES ('04041837495', '000000011401004050', '041025091040955547551703111557453632');
INSERT INTO `sys_user_role` VALUES ('04041837496', '000000011401004050', '041025091040966101154286281872612758');
INSERT INTO `sys_user_role` VALUES ('04041837497', '000000011401004050', '041025091040975107715612575330377185');
INSERT INTO `sys_user_role` VALUES ('04041837498', '000000011401004050', '041025091040985258784206150204088602');
INSERT INTO `sys_user_role` VALUES ('04041837499', '000000011401004050', '041025091040997623467305205821567163');
INSERT INTO `sys_user_role` VALUES ('040600209739', '000000011401004050', '041025091040222847861163767208113058');
INSERT INTO `sys_user_role` VALUES ('040600210595', '000000011401004050', '041025091040221824522057444661422213');
INSERT INTO `sys_user_role` VALUES ('040600210748', '000000011401004050', '041025091000225347248610638554613357');
INSERT INTO `sys_user_role` VALUES ('040610401214', '000000011401004050', '041025091040122502211628321825484458');
INSERT INTO `sys_user_role` VALUES ('040610611534', '000000011401004050', '041025091040123252280616154705575451');
INSERT INTO `sys_user_role` VALUES ('040610631286', '000000011401004050', '041025091050150653554032615178361511');
INSERT INTO `sys_user_role` VALUES ('100000001257', '000000011401004050', '041025091040116056877536375581112326');
INSERT INTO `sys_user_role` VALUES ('100000007152', '000000011401004050', '041025091040190481781467212560720268');
INSERT INTO `sys_user_role` VALUES ('1000101001761', '1002000001', '000003104100010006648643745830512464');
INSERT INTO `sys_user_role` VALUES ('1000101001762', '1002211100149', '000003104100010006648643745830512464');
INSERT INTO `sys_user_role` VALUES ('1000101001763', '00021000000', '000003104100010006648643745830512464');
INSERT INTO `sys_user_role` VALUES ('1000101001764', '100221016064', '000003104100010006648643745830512464');
INSERT INTO `sys_user_role` VALUES ('1000244033075', '00000114040040000', '1006100403');
INSERT INTO `sys_user_role` VALUES ('1000244033076', '1002211100149', '1006100403');
INSERT INTO `sys_user_role` VALUES ('1000244033077', '00021000000', '1006100403');
INSERT INTO `sys_user_role` VALUES ('1000244033078', '100221016064', '1006100403');
INSERT INTO `sys_user_role` VALUES ('100070010085', '00000114040040000', '011400100400216271352676260615883602');
INSERT INTO `sys_user_role` VALUES ('1001110600', '000000011401004050', '040020391400010132732311122041604707');
INSERT INTO `sys_user_role` VALUES ('1001110601', '000000011401004050', '040020391400183721334047557013074782');
INSERT INTO `sys_user_role` VALUES ('10011401400', '000000011401004050', '041400263140007557205504743828753332');
INSERT INTO `sys_user_role` VALUES ('1001241402104', '000000011401004050', '010020001420841317634443621731363100');
INSERT INTO `sys_user_role` VALUES ('100200402025', '000000011401004050', '031002004045073545302386856442306810');
INSERT INTO `sys_user_role` VALUES ('100400003438', '100221016064', '000001114100004500867671271774063630');
INSERT INTO `sys_user_role` VALUES ('100400003476', '1002211100149', '000005114100016400333344633313847117');
INSERT INTO `sys_user_role` VALUES ('100400003477', '00021000000', '000005114100016400333344633313847117');
INSERT INTO `sys_user_role` VALUES ('100400003478', '100221016064', '000005114100016400333344633313847117');
INSERT INTO `sys_user_role` VALUES ('100400003486', '1002211100149', '000005110100040880434816277508710601');
INSERT INTO `sys_user_role` VALUES ('100400003487', '00021000000', '000005110100040880434816277508710601');
INSERT INTO `sys_user_role` VALUES ('100400003488', '100221016064', '000005110100040880434816277508710601');
INSERT INTO `sys_user_role` VALUES ('100400003493', '1002211100149', '000005114100862411720165523341532300');
INSERT INTO `sys_user_role` VALUES ('100400003494', '00021000000', '000005114100862411720165523341532300');
INSERT INTO `sys_user_role` VALUES ('100400003495', '100221016064', '000005114100862411720165523341532300');
INSERT INTO `sys_user_role` VALUES ('102020000707', '000000011401004050', '041025091040226020066650217804731214');
INSERT INTO `sys_user_role` VALUES ('102020000717', '000000011401004050', '041025091040225134034310664774023503');
INSERT INTO `sys_user_role` VALUES ('102020010307', '00000114040040000', '000001100000405412861836002266015648');
INSERT INTO `sys_user_role` VALUES ('102020010308', '000000011401004050', '000001100000405412861836002266015648');
INSERT INTO `sys_user_role` VALUES ('102020010309', '0000000214001020100', '000001100000405412861836002266015648');
INSERT INTO `sys_user_role` VALUES ('10202019077', '000000011401004050', '041025091000398558724273632188256708');
INSERT INTO `sys_user_role` VALUES ('1022040691', '00000114040040000', '010002000420015801360175364525316675');
INSERT INTO `sys_user_role` VALUES ('1022040692', '000000011401004050', '010002000420015801360175364525316675');
INSERT INTO `sys_user_role` VALUES ('1022040693', '0000000214001020100', '010002000420015801360175364525316675');
INSERT INTO `sys_user_role` VALUES ('1026041400336', '000000011401004050', '041025091040121774736745827317667518');
INSERT INTO `sys_user_role` VALUES ('1030000001400', '000000011401004050', '041025091000314831617780845524825772');
INSERT INTO `sys_user_role` VALUES ('1030000023242', '000000011401004050', '041025091040227117341475173772451778');
INSERT INTO `sys_user_role` VALUES ('103000010912', '000000011401004050', '041025091000418342571305482064864806');
INSERT INTO `sys_user_role` VALUES ('1030000803328', '000000011401004050', '041025091040192833040688460284313088');
INSERT INTO `sys_user_role` VALUES ('1030003023549', '000000011401004050', '041025091040229327411827667167043580');
INSERT INTO `sys_user_role` VALUES ('1030003103524', '000000011401004050', '041025091040230200631572414573607536');
INSERT INTO `sys_user_role` VALUES ('1030003103576', '000000011401004050', '041025091040228332355278038621234776');
INSERT INTO `sys_user_role` VALUES ('103000382849', '000000011401004050', '041025091000406676643331202487013538');
INSERT INTO `sys_user_role` VALUES ('1030080103395', '000000011401004050', '041025091000180067167716842755444654');
INSERT INTO `sys_user_role` VALUES ('1030083801036', '000000011401004050', '041025091000428830105032026480340815');
INSERT INTO `sys_user_role` VALUES ('1030202103813', '000000011401004050', '041025091050250832338251467731100553');
INSERT INTO `sys_user_role` VALUES ('1030203003916', '000000011401004050', '041025091050252738165581478166523886');
INSERT INTO `sys_user_role` VALUES ('1030203103951', '000000011401004050', '041025091050251307637632626753758027');
INSERT INTO `sys_user_role` VALUES ('1030203123847', '000000011401004050', '041025091050254811115347126356561201');
INSERT INTO `sys_user_role` VALUES ('1030203123891', '000000011401004050', '041025091050253785678384053417086763');
INSERT INTO `sys_user_role` VALUES ('1030280124068', '000000011401004050', '041025091000445331406186834831422440');
INSERT INTO `sys_user_role` VALUES ('1030283004013', '000000011401004050', '041025091040126247341326847256281175');
INSERT INTO `sys_user_role` VALUES ('14021202062', '000000011401004050', '041025091040191105112747880603540244');
INSERT INTO `sys_user_role` VALUES ('14058100011029', '000000011401004050', '041025091000338070654171816170343326');
INSERT INTO `sys_user_role` VALUES ('1405814040827', '000000011401004050', '041025091000303264513683035765253638');
INSERT INTO `sys_user_role` VALUES ('14058420411106', '00000114040040000', '011404110565074035726573136643034815');
INSERT INTO `sys_user_role` VALUES ('141000251036', '1002211100149', '000003110001036000156816655623087028');
INSERT INTO `sys_user_role` VALUES ('141000251037', '00021000000', '000003110001036000156816655623087028');
INSERT INTO `sys_user_role` VALUES ('141000251038', '100221016064', '000003110001036000156816655623087028');
INSERT INTO `sys_user_role` VALUES ('14100100114', '0000050400000401', '000005110101450011772618310740361353');
INSERT INTO `sys_user_role` VALUES ('14100105208', '0000050400000401', '000005110180000012181515176385114625');
INSERT INTO `sys_user_role` VALUES ('14100126206', '0000050408011026', '000005210101051414654580067313565780');
INSERT INTO `sys_user_role` VALUES ('1410020502225', '100221016064', '000003210000044021731377545637376856');
INSERT INTO `sys_user_role` VALUES ('1410082410', '1002211100149', '000003104110214412212151803060654473');
INSERT INTO `sys_user_role` VALUES ('1410082411', '00021000000', '000003104110214412212151803060654473');
INSERT INTO `sys_user_role` VALUES ('1410082412', '100221016064', '000003104110214412212151803060654473');
INSERT INTO `sys_user_role` VALUES ('141008249', '00000114040040000', '000003104110214412212151803060654473');
INSERT INTO `sys_user_role` VALUES ('1410086542', '0000050400000401', '000005210144845400367443025740846351');
INSERT INTO `sys_user_role` VALUES ('1410202113656', '000003101402422212', '000003110002341221478827435471646786');
INSERT INTO `sys_user_role` VALUES ('14200000069', '000000011401004050', '000001114180004301605864778012268240');
INSERT INTO `sys_user_role` VALUES ('1420400652102', '00000110204035100', '000001110205201200582755172471127267');
INSERT INTO `sys_user_role` VALUES ('142114401157', '1002000001', '100402116118');
INSERT INTO `sys_user_role` VALUES ('142114401158', '0000000214001020100', '100402116118');
INSERT INTO `sys_user_role` VALUES ('142114401159', '000000011401004050', '100402116118');
INSERT INTO `sys_user_role` VALUES ('1426101101680', '1002000001', '010001821100013318450041072577220060');
INSERT INTO `sys_user_role` VALUES ('1426101101681', '0000011000101840', '010001821100013318450041072577220060');
INSERT INTO `sys_user_role` VALUES ('1426101101682', '00000114040040000', '010001821100013318450041072577220060');
INSERT INTO `sys_user_role` VALUES ('1426101101683', '00000100080060030', '010001821100013318450041072577220060');
INSERT INTO `sys_user_role` VALUES ('1426101101684', '000000011401004050', '010001821100013318450041072577220060');
INSERT INTO `sys_user_role` VALUES ('1426101111284', '1002000001', '010002000400158544688567324456716000');
INSERT INTO `sys_user_role` VALUES ('1426101111285', '00000114040040000', '010002000400158544688567324456716000');
INSERT INTO `sys_user_role` VALUES ('1426101111286', '000000011401004050', '010002000400158544688567324456716000');
INSERT INTO `sys_user_role` VALUES ('1426101111287', '0000000214001020100', '010002000400158544688567324456716000');
INSERT INTO `sys_user_role` VALUES ('1426101121724', '1002000001', '000001100000401404157570271661673322');
INSERT INTO `sys_user_role` VALUES ('1426101121725', '0000011000101840', '000001100000401404157570271661673322');
INSERT INTO `sys_user_role` VALUES ('1426101121726', '00000114040040000', '000001100000401404157570271661673322');
INSERT INTO `sys_user_role` VALUES ('1426101121727', '00000100080060030', '000001100000401404157570271661673322');
INSERT INTO `sys_user_role` VALUES ('1426101121728', '000000011401004050', '000001100000401404157570271661673322');
INSERT INTO `sys_user_role` VALUES ('1426101121729', '0000000214001020100', '000001100000401404157570271661673322');

-- ----------------------------
-- Table structure for `sys_user_unity`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_unity`;
CREATE TABLE `sys_user_unity` (
  `SUU_ID` varchar(50) NOT NULL DEFAULT '',
  `SUU_UB_ID` varchar(50) DEFAULT NULL,
  `SUU_UB_NAME` varchar(200) DEFAULT NULL,
  `SUU_UB_TYPE` varchar(2) DEFAULT NULL,
  `SUU_STATUS` varchar(2) DEFAULT NULL,
  `SUU_DR` varchar(1) DEFAULT NULL,
  `SUU_TS` varchar(19) DEFAULT NULL,
  `SUU_VERSION` decimal(10,0) DEFAULT NULL,
  `SUU_ADDUSER` varchar(80) DEFAULT NULL,
  `SUU_ADDDATE` varchar(19) DEFAULT NULL,
  `SUU_MODIFYUSER` varchar(80) DEFAULT NULL,
  `SUU_MODIFYDATE` varchar(19) DEFAULT NULL,
  `SUU_ORGID` varchar(6) DEFAULT NULL,
  `SUU_UB_LOGINNAME` varchar(80) DEFAULT NULL,
  `SUU_PARENTSID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SUU_ID`),
  UNIQUE KEY `PK_SUU_ID` (`SUU_ID`),
  KEY `IND_SUU_UB_ID` (`SUU_UB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_unity
-- ----------------------------
INSERT INTO `sys_user_unity` VALUES ('00000001', '00000001', '社区快线', '01', '1', '1', '2014-07-23 11:57:08', '9', null, null, null, null, '000000', '10001', null);
INSERT INTO `sys_user_unity` VALUES ('00000002', '00000002', '社区快线运营部', '1', '1', '1', '2014-12-27 18:19:15', '5', null, null, null, null, '000002', '10002', '000001');
INSERT INTO `sys_user_unity` VALUES ('030000000420502668237471131761207860', '030000000420502668237471131761207860', '北京同成中和物业管理有限公司', '06', '1', '1', '2015-03-18 22:21:05', '1', '000001100000401404157570271661673322', '2015-03-18 22:21:05', null, null, null, '北京同成中和物业管理有限公司', null);
INSERT INTO `sys_user_unity` VALUES ('030000010011135245245424803362123868', '030000010011135245245424803362123868', '北京市朝阳区欧陆经典万兴苑小区业主委员会', '03', '1', '1', '2015-03-18 22:49:58', '2', '000001100000401404157570271661673322', '2015-03-18 22:49:58', '000001100000401404157570271661673322', '2015-03-18 22:57:52', null, '北京市朝阳区欧陆经典万兴苑小区业主委员会', null);
INSERT INTO `sys_user_unity` VALUES ('030004141000406820381305853315302138', '030004141000406820381305853315302138', '美丽园', '06', '1', '0', '2015-03-09 17:36:53', '2', '000001100000401404157570271661673322', '2015-03-05 19:32:21', null, null, null, '美丽园', null);
INSERT INTO `sys_user_unity` VALUES ('030004800001657778603648456415275640', '030004800001657778603648456415275640', '北京首科万业物业管理有限公司', '06', '1', '1', '2015-03-09 17:40:27', '1', '000001100000401404157570271661673322', '2015-03-09 17:40:27', null, null, null, '北京首科万业物业管理有限公司', null);
INSERT INTO `sys_user_unity` VALUES ('030004900092458686288311725156076583', '030004900092458686288311725156076583', '临时数据库', '06', '1', '1', '2015-03-09 21:43:11', '1', '000001100000401404157570271661673322', '2015-03-09 21:43:11', null, null, null, '临时数据库', null);
INSERT INTO `sys_user_unity` VALUES ('030004901013813737814041042307407048', '030004901013813737814041042307407048', '北京双林物业管理有限公司', '06', '1', '1', '2015-03-10 00:18:36', '1', '000001100000401404157570271661673322', '2015-03-10 00:18:36', null, null, null, '北京双林物业管理有限公司', null);
INSERT INTO `sys_user_unity` VALUES ('030401240030853158855688234400617372', '030401240030853158855688234400617372', '临时数据库公司', '03', '1', '1', '2015-01-14 22:37:16', '7', null, null, '010001821100013318450041072577220060', '2015-03-09 22:12:23', null, '临时数据库公司', null);
INSERT INTO `sys_user_unity` VALUES ('031000600040083835686128212618711751', '031000600040083835686128212618711751', '北京育辉泽缘物业管理有限公司', '06', '1', '1', '2015-03-18 16:52:29', '1', '000001100000401404157570271661673322', '2015-03-18 16:52:29', null, null, null, '北京育辉泽缘物业管理有限公司', null);
INSERT INTO `sys_user_unity` VALUES ('031400140600032676702368277868832070', '031400140600032676702368277868832070', '11', '06', '1', '0', '2015-03-10 11:20:24', '2', '100402116118', '2015-03-10 11:20:14', null, null, null, '11', null);
INSERT INTO `sys_user_unity` VALUES ('031401023000307758483008076544305371', '031401023000307758483008076544305371', '北京市海淀区大河庄苑业主委员会', '06', '1', '1', '2015-03-27 10:30:32', '1', '000001100000401404157570271661673322', '2015-03-27 10:30:32', null, null, null, '北京市海淀区大河庄苑业主委员会', null);
INSERT INTO `sys_user_unity` VALUES ('031401032005440124486402378345138308', '031401032005440124486402378345138308', '北京泰宇物业管理有限公司崇文门分公司', '06', '1', '1', '2015-03-27 13:01:05', '1', '000001100000401404157570271661673322', '2015-03-27 13:01:05', null, null, null, '北京泰宇物业管理有限公司崇文门分公司', null);
INSERT INTO `sys_user_unity` VALUES ('031401065001042621073005644643614782', '031401065001042621073005644643614782', '北京新元天地物业管理有限公司', '06', '1', '1', '2015-03-24 10:50:01', '1', '000001100000401404157570271661673322', '2015-03-24 10:50:01', null, null, null, '北京新元天地物业管理有限公司', null);
INSERT INTO `sys_user_unity` VALUES ('031401076101120041481286181030706535', '031401076101120041481286181030706535', '北京颐中国际物业管理有限公司', '06', '1', '1', '2015-03-24 13:49:59', '1', '000001100000401404157570271661673322', '2015-03-24 13:49:59', null, null, null, '北京颐中国际物业管理有限公司', null);
INSERT INTO `sys_user_unity` VALUES ('031401256004275332886463360020323006', '031401256004275332886463360020323006', '北京城翔物业管理有限责任公司', '06', '1', '1', '2015-03-26 16:00:34', '1', '000001100000401404157570271661673322', '2015-03-26 16:00:34', null, null, null, '北京城翔物业管理有限责任公司', null);
INSERT INTO `sys_user_unity` VALUES ('031406001081035138255700275251426858', '031406001081035138255700275251426858', '北京鸿基佳和物业管理有限公司', '06', '1', '1', '2015-03-19 11:33:07', '1', '000001100000401404157570271661673322', '2015-03-19 11:33:07', null, null, null, '北京鸿基佳和物业管理有限公司', null);
INSERT INTO `sys_user_unity` VALUES ('031408001004817316620855750504770643', '031408001004817316620855750504770643', '北京德豪国际物业管理有限责任公司丰台分公司', '06', '1', '1', '2015-04-14 11:10:56', '1', '000001100000401404157570271661673322', '2015-04-14 11:10:56', null, null, null, '北京德豪国际物业管理有限责任公司丰台分公司', null);
INSERT INTO `sys_user_unity` VALUES ('031408033305581418061750001030083731', '031408033305581418061750001030083731', '北京市朝阳区观筑庭园小区业主委员会', '03', '1', '1', '2015-04-04 15:43:07', '2', '100402116118', '2015-04-04 15:43:07', '100402116118', '2015-04-04 15:45:48', null, '北京市朝阳区观筑庭园小区业主委员会', null);
INSERT INTO `sys_user_unity` VALUES ('031408064000643270328072514052702252', '031408064000643270328072514052702252', '北京东润明珠物业管理有限责任公司', '03', '1', '1', '2015-04-09 15:27:31', '3', '000001100000401404157570271661673322', '2015-04-09 15:27:30', '000001100000401404157570271661673322', '2015-04-09 15:59:18', null, '北京东润明珠物业管理有限责任公司', null);
INSERT INTO `sys_user_unity` VALUES ('031408073305700766144418088330354713', '031408073305700766144418088330354713', '北京美好物业管理有限公司', '06', '1', '1', '2015-04-09 17:55:35', '1', '000001100000401404157570271661673322', '2015-04-09 17:55:35', null, null, null, '北京美好物业管理有限公司', null);
INSERT INTO `sys_user_unity` VALUES ('031409230004970245365352660535332358', '031409230004970245365352660535332358', '战个痛', '06', '1', '0', '2015-04-17 10:35:38', '2', '010001821100013318450041072577220060', '2015-04-17 10:33:26', null, null, null, '战个痛', null);
INSERT INTO `sys_user_unity` VALUES ('031420000000070384386444846063606503', '031420000000070384386444846063606503', '北京首欣物业管理有限责任公司', '06', '1', '1', '2015-04-17 11:33:34', '1', '010001821100013318450041072577220060', '2015-04-17 11:33:34', null, null, null, '北京首欣物业管理有限责任公司', null);
INSERT INTO `sys_user_unity` VALUES ('031420010001713313047265835867136688', '031420010001713313047265835867136688', '第二房管所公租房物业办公室', '03', '1', '1', '2015-04-23 15:16:48', '2', '010002000420015801360175364525316675', '2015-04-23 15:16:48', '000001100000405412861836002266015648', '2015-04-23 15:29:46', null, '第二房管所公租房物业办公室', null);
INSERT INTO `sys_user_unity` VALUES ('031420042100063142723108226767327468', '031420042100063142723108226767327468', '中通物业公司', '06', '1', '0', '2015-03-12 22:45:18', '2', null, null, null, null, null, '中通物业公司', null);
INSERT INTO `sys_user_unity` VALUES ('031420050500056067328278418137728416', '031420050500056067328278418137728416', '北京世联理仕物业管理有限责任公司', '06', '1', '1', '2015-03-12 22:45:06', '1', '000001100000401404157570271661673322', '2015-03-12 22:45:06', null, null, null, '北京世联理仕物业管理有限责任公司', null);
INSERT INTO `sys_user_unity` VALUES ('031430000001022447338816582282370150', '031430000001022447338816582282370150', '北京市海淀区四季青镇比森里小区业主委员会', '06', '1', '1', '2015-05-27 12:54:11', '1', '010002000420015801360175364525316675', '2015-05-27 12:54:11', null, null, null, '北京市海淀区四季青镇比森里小区业主委员会', null);
INSERT INTO `sys_user_unity` VALUES ('031430000001183475621650602405276735', '031430000001183475621650602405276735', '北京昆和物业管理有限公司', '06', '1', '1', '2015-05-27 13:07:31', '1', '010002000420015801360175364525316675', '2015-05-27 13:07:31', null, null, null, '北京昆和物业管理有限公司', null);
INSERT INTO `sys_user_unity` VALUES ('031430000021244343387054645081083185', '031430000021244343387054645081083185', '海军润园小区管理办公室', '06', '1', '1', '2015-05-27 13:14:27', '1', '010002000420015801360175364525316675', '2015-05-27 13:14:27', null, null, null, '海军润园小区管理办公室', null);
INSERT INTO `sys_user_unity` VALUES ('031430000022766118607711020575024210', '031430000022766118607711020575024210', '北京鸿宇嘉盛物业管理有限公司', '06', '1', '1', '2015-04-27 16:35:25', '1', '010002000420015801360175364525316675', '2015-04-27 16:35:25', null, null, null, '北京鸿宇嘉盛物业管理有限公司', null);
INSERT INTO `sys_user_unity` VALUES ('031430004004338357182365204360346752', '031430004004338357182365204360346752', '北京市朝阳区国美第一城小区业户委员会', '06', '1', '1', '2015-04-28 10:22:20', '1', '010002000420015801360175364525316675', '2015-04-28 10:22:20', null, null, null, '北京市朝阳区国美第一城小区业户委员会', null);
INSERT INTO `sys_user_unity` VALUES ('031430004023542567657067601821062841', '031430004023542567657067601821062841', '北京霞光物业管理有限公司', '06', '1', '1', '2015-04-27 16:51:10', '1', '010002000420015801360175364525316675', '2015-04-27 16:51:10', null, null, null, '北京霞光物业管理有限公司', null);
INSERT INTO `sys_user_unity` VALUES ('031430010008645647476736143717105037', '031430010008645647476736143717105037', '北京瑞腾物业管理有限公司', '06', '1', '1', '2015-05-20 13:11:36', '1', '010002000420015801360175364525316675', '2015-05-20 13:11:36', null, null, null, '北京瑞腾物业管理有限公司', null);
INSERT INTO `sys_user_unity` VALUES ('031430010021454232352178570721057486', '031430010021454232352178570721057486', '北京华特物业管理发展有限公司朝阳分公司', '06', '1', '1', '2015-05-28 15:34:33', '1', '010002000420015801360175364525316675', '2015-05-28 15:34:33', null, null, null, '北京华特物业管理发展有限公司朝阳分公司', null);
INSERT INTO `sys_user_unity` VALUES ('031430014001362501568362348122036848', '031430014001362501568362348122036848', '北京中旗物业管理有限责任公司第二分公司', '03', '1', '1', '2015-05-28 15:16:45', '2', '010002000420015801360175364525316675', '2015-05-28 15:16:45', '010002000420015801360175364525316675', '2015-05-28 15:19:27', null, '北京中旗物业管理有限责任公司第二分公司', null);
INSERT INTO `sys_user_unity` VALUES ('031430014029124857282261646258506364', '031430014029124857282261646258506364', '北京东岳物业管理有限责任公司', '06', '1', '1', '2015-05-21 10:57:16', '1', '010002000420015801360175364525316675', '2015-05-21 10:57:16', null, null, null, '北京东岳物业管理有限责任公司', null);
INSERT INTO `sys_user_unity` VALUES ('031430804005674338430584753147824311', '031430804005674338430584753147824311', '北京天荣创兴物业管理有限公司', '06', '1', '1', '2015-05-05 13:36:40', '1', '010002000420015801360175364525316675', '2015-05-05 13:36:40', null, null, null, '北京天荣创兴物业管理有限公司', null);
INSERT INTO `sys_user_unity` VALUES ('031430810006816763182686255167218845', '031430810006816763182686255167218845', '南京新鸿运物业管理有限公司北京分公司', '06', '1', '1', '2015-05-07 11:48:14', '1', '010002000420015801360175364525316675', '2015-05-07 11:48:14', null, null, null, '南京新鸿运物业管理有限公司北京分公司', null);
INSERT INTO `sys_user_unity` VALUES ('031430810007562684852830074483044171', '031430810007562684852830074483044171', '北京玖玖港龙物业管理有限公司', '06', '1', '1', '2015-05-18 14:25:54', '1', '010002000420015801360175364525316675', '2015-05-18 14:25:54', null, null, null, '北京玖玖港龙物业管理有限公司', null);
INSERT INTO `sys_user_unity` VALUES ('040000200041162332572178166010672034', '040000200041162332572178166010672034', '临时公共小区', '03', '0', '0', '2015-03-06 23:58:46', '29', null, null, '000001100000401404157570271661673322', '2015-03-06 23:58:46', null, '临时公共小区', null);
INSERT INTO `sys_user_unity` VALUES ('040000200140080711372488643084342874', '040000200140080711372488643084342874', '云趣园社区', '04', '1', '0', '2015-03-06 23:58:43', '2', null, null, null, null, null, '云趣园社区', null);
INSERT INTO `sys_user_unity` VALUES ('040002104210750260608127673870827873', '040002104210750260608127673870827873', '龙华苑', '03', '1', '0', '2015-03-06 23:58:52', '4', null, null, null, null, null, '龙华苑', '030401240030853158855688234400617372');
INSERT INTO `sys_user_unity` VALUES ('040002106101052150047421561130572837', '040002106101052150047421561130572837', '风格派凯旋城', '04', '1', '0', '2015-03-17 18:09:38', '2', null, null, null, null, null, '风格派凯旋城', '031420050500056067328278418137728416');
INSERT INTO `sys_user_unity` VALUES ('040021000164125275562548016760345803', '040021000164125275562548016760345803', '本家润园C区', '04', '1', '1', '2015-03-27 13:02:45', '1', null, null, null, null, null, '本家润园C区', '031401032005440124486402378345138308');
INSERT INTO `sys_user_unity` VALUES ('040021001003876805638523815542125063', '040021001003876805638523815542125063', '大河庄苑', '04', '1', '1', '2015-03-27 10:31:29', '1', null, null, null, null, null, '大河庄苑', '031401023000307758483008076544305371');
INSERT INTO `sys_user_unity` VALUES ('040021040061711433483020817212732032', '040021040061711433483020817212732032', '东方雅苑', '04', '1', '1', '2015-03-24 13:51:01', '1', null, null, null, null, null, '东方雅苑', '031401076101120041481286181030706535');
INSERT INTO `sys_user_unity` VALUES ('040021041170182550778873870310586732', '040021041170182550778873870310586732', '天利园东方财富', '04', '1', '1', '2015-03-24 10:56:11', '1', null, null, null, null, null, '天利园东方财富', '031401065001042621073005644643614782');
INSERT INTO `sys_user_unity` VALUES ('040021240902023202041563416403644451', '040021240902023202041563416403644451', '万泉庄小区', '04', '1', '1', '2015-03-26 16:01:43', '1', null, null, null, null, null, '万泉庄小区', '031401256004275332886463360020323006');
INSERT INTO `sys_user_unity` VALUES ('040022028010318363671434431345577734', '040022028010318363671434431345577734', '中泰雅轩', '04', '1', '1', '2015-03-18 16:53:37', '1', null, null, null, null, null, '中泰雅轩', '031000600040083835686128212618711751');
INSERT INTO `sys_user_unity` VALUES ('040024010111120062157235580457282441', '040024010111120062157235580457282441', '首科花园C区', '03', '1', '1', '2015-03-09 17:41:56', '29', null, null, null, null, null, '首科花园C区', '030004800001657778603648456415275640');
INSERT INTO `sys_user_unity` VALUES ('040024112131254006653230685873620136', '040024112131254006653230685873620136', '双林苑小区', '03', '1', '1', '2015-03-10 00:19:32', '28', null, null, null, null, null, '双林苑小区', '030004901013813737814041042307407048');
INSERT INTO `sys_user_unity` VALUES ('040024450000776675240386354717480137', '040024450000776675240386354717480137', '7号公馆', '03', '1', '1', '2015-03-07 00:07:23', '27', null, null, null, null, null, '7号公馆', null);
INSERT INTO `sys_user_unity` VALUES ('040024450002024468842140447227125847', '040024450002024468842140447227125847', '10号名邸', '03', '1', '1', '2015-03-07 00:20:08', '26', null, null, null, null, null, '10号名邸', null);
INSERT INTO `sys_user_unity` VALUES ('040024450017734008674342764554878081', '040024450017734008674342764554878081', '爱这城', '03', '1', '1', '2015-03-07 00:30:13', '26', null, null, null, null, null, '爱这城', null);
INSERT INTO `sys_user_unity` VALUES ('040024450034463567557447117711818146', '040024450034463567557447117711818146', 'CBD总部公寓', '03', '1', '1', '2015-03-07 00:27:18', '26', null, null, null, null, null, 'CBD总部公寓', null);
INSERT INTO `sys_user_unity` VALUES ('040024450038866452550055673432472067', '040024450038866452550055673432472067', '安和园', '03', '1', '1', '2015-03-07 00:31:15', '26', null, null, null, null, null, '安和园', null);
INSERT INTO `sys_user_unity` VALUES ('040024450101888553375138063438458167', '040024450101888553375138063438458167', '10AM新坐标', '03', '1', '1', '2015-03-07 00:15:42', '26', null, null, null, null, null, '10AM新坐标', null);
INSERT INTO `sys_user_unity` VALUES ('040024450109741358428368556866073111', '040024450109741358428368556866073111', '安华南里', '03', '1', '1', '2015-03-07 00:32:22', '26', null, null, null, null, null, '安华南里', null);
INSERT INTO `sys_user_unity` VALUES ('040024450113383671620608567881353578', '040024450113383671620608567881353578', 'A派公寓', '03', '1', '1', '2015-03-07 00:25:52', '26', null, null, null, null, null, 'A派公寓', null);
INSERT INTO `sys_user_unity` VALUES ('040024450115332638050674824866724037', '040024450115332638050674824866724037', 'Fesco外企公寓', '03', '1', '1', '2015-03-07 00:28:30', '26', null, null, null, null, null, 'Fesco外企公寓', null);
INSERT INTO `sys_user_unity` VALUES ('040024450126406738608886085762222512', '040024450126406738608886085762222512', 'IMOMA社区', '03', '1', '1', '2015-03-07 00:29:23', '27', null, null, null, null, null, 'IMOMA社区', null);
INSERT INTO `sys_user_unity` VALUES ('040024460121040753744471640673023013', '040024460121040753744471640673023013', '安化南里', '03', '1', '1', '2015-03-07 00:42:09', '27', null, null, null, null, null, '安化南里', null);
INSERT INTO `sys_user_unity` VALUES ('040028001015607621801801360524755508', '040028001015607621801801360524755508', '观筑庭园', '04', '1', '1', '2015-04-04 15:44:52', '1', null, null, null, null, null, '观筑庭园', '031408033305581418061750001030083731');
INSERT INTO `sys_user_unity` VALUES ('040028001171187247345356038730587436', '040028001171187247345356038730587436', '金第润苑', '03', '1', '1', '2015-04-14 11:12:53', '2', null, null, null, null, null, '金第润苑', '031408001004817316620855750504770643');
INSERT INTO `sys_user_unity` VALUES ('040028040126270618058053160506483288', '040028040126270618058053160506483288', '一品亦庄', '03', '1', '1', '2015-04-09 15:28:47', '2', null, null, null, null, null, '一品亦庄', '031408064000643270328072514052702252');
INSERT INTO `sys_user_unity` VALUES ('040028040157504053478603364142250100', '040028040157504053478603364142250100', '新康家园', '03', '1', '1', '2015-04-09 15:32:30', '2', null, null, null, null, null, '新康家园', '031408064000643270328072514052702252');
INSERT INTO `sys_user_unity` VALUES ('040028040978254012228263362543675062', '040028040978254012228263362543675062', '听涛雅苑', '03', '1', '1', '2015-04-09 15:36:16', '2', null, null, null, null, null, '听涛雅苑', '031408064000643270328072514052702252');
INSERT INTO `sys_user_unity` VALUES ('040028041001086380822554605675623304', '040028041001086380822554605675623304', '圣淘沙', '04', '1', '1', '2015-04-09 17:56:44', '1', null, null, null, null, null, '圣淘沙', '031408073305700766144418088330354713');
INSERT INTO `sys_user_unity` VALUES ('040028041049860616618777434201701083', '040028041049860616618777434201701083', '南礼士路5号院', '03', '1', '1', '2015-04-09 15:37:28', '3', null, null, null, null, null, '南礼士路5号院', '031408064000643270328072514052702252');
INSERT INTO `sys_user_unity` VALUES ('040029200011236236822041052386054814', '040029200011236236822041052386054814', '123', '04', '1', '0', '2015-04-17 10:35:22', '2', null, null, null, null, null, '123', '031409230004970245365352660535332358');
INSERT INTO `sys_user_unity` VALUES ('040400000441015480513621785508131131', '040400000441015480513621785508131131', '碧兴园', '04', '1', '1', '2015-05-20 13:12:35', '1', null, null, null, null, null, '碧兴园', '031430010008645647476736143717105037');
INSERT INTO `sys_user_unity` VALUES ('040400001440833876385887002487356864', '040400001440833876385887002487356864', '御景山', '04', '1', '1', '2015-04-17 11:35:48', '1', null, null, null, null, null, '御景山', '031420000000070384386444846063606503');
INSERT INTO `sys_user_unity` VALUES ('040400004046676814213781648816081578', '040400004046676814213781648816081578', '天宫院小区', '04', '1', '1', '2015-05-05 13:37:55', '1', null, null, null, null, null, '天宫院小区', '031430804005674338430584753147824311');
INSERT INTO `sys_user_unity` VALUES ('040400100009564747118672347538408380', '040400100009564747118672347538408380', '晶都国际', '04', '1', '1', '2015-05-18 14:26:39', '1', null, null, null, null, null, '晶都国际', '031430810007562684852830074483044171');
INSERT INTO `sys_user_unity` VALUES ('040400100447880465606657126081717520', '040400100447880465606657126081717520', '锦秋家园', '04', '1', '1', '2015-05-07 11:49:37', '1', null, null, null, null, null, '锦秋家园', '031430810006816763182686255167218845');
INSERT INTO `sys_user_unity` VALUES ('040400100448480647744411177736721558', '040400100448480647744411177736721558', '锦秋家园', '04', '1', '0', '2015-05-18 14:34:37', '2', null, null, null, null, null, '锦秋家园', '031430810006816763182686255167218845');
INSERT INTO `sys_user_unity` VALUES ('040400101003601522556231680203416875', '040400101003601522556231680203416875', '光辉里小区', '04', '1', '1', '2015-04-27 16:36:55', '1', null, null, null, null, null, '光辉里小区', '031430000022766118607711020575024210');
INSERT INTO `sys_user_unity` VALUES ('040400104444055505360132330501587547', '040400104444055505360132330501587547', '富河园', '04', '1', '1', '2015-04-27 16:52:29', '1', null, null, null, null, null, '富河园', '031430004023542567657067601821062841');
INSERT INTO `sys_user_unity` VALUES ('040400105005014872255061422117030605', '040400105005014872255061422117030605', '国美第一城', '04', '1', '1', '2015-04-28 10:23:57', '1', null, null, null, null, null, '国美第一城', '031430004004338357182365204360346752');
INSERT INTO `sys_user_unity` VALUES ('040400105041154405111856513867145112', '040400105041154405111856513867145112', '日月东华 朝阳捷座', '04', '1', '1', '2015-05-21 10:59:19', '1', null, null, null, null, null, '日月东华 朝阳捷座', '031430014029124857282261646258506364');
INSERT INTO `sys_user_unity` VALUES ('040400105041213670814712162317510265', '040400105041213670814712162317510265', '十里堡南区 十里堡北区', '04', '1', '1', '2015-05-21 11:00:57', '1', null, null, null, null, null, '十里堡南区 十里堡北区', '031430014029124857282261646258506364');
INSERT INTO `sys_user_unity` VALUES ('040400105041366610518140342310731688', '040400105041366610518140342310731688', '核桃园小区', '04', '1', '1', '2015-05-21 11:02:38', '1', null, null, null, null, null, '核桃园小区', '031430014029124857282261646258506364');
INSERT INTO `sys_user_unity` VALUES ('040400500001422366673840157248330830', '040400500001422366673840157248330830', '时代庐峰', '04', '1', '1', '2015-05-27 12:51:34', '1', null, null, null, null, null, '时代庐峰', '031420000000070384386444846063606503');
INSERT INTO `sys_user_unity` VALUES ('040400500402333211858712515347483574', '040400500402333211858712515347483574', '富华家园', '04', '1', '1', '2015-05-28 15:35:38', '1', null, null, null, null, null, '富华家园', '031430010021454232352178570721057486');
INSERT INTO `sys_user_unity` VALUES ('040400501041541325048648228502026746', '040400501041541325048648228502026746', '碧森里小区', '04', '1', '1', '2015-05-27 13:05:42', '1', null, null, null, null, null, '碧森里小区', '031430000001022447338816582282370150');
INSERT INTO `sys_user_unity` VALUES ('040400501401135035471663685664638505', '040400501401135035471663685664638505', '筑华年', '04', '1', '1', '2015-04-23 15:18:49', '1', null, null, null, null, null, '筑华年', '031420010001713313047265835867136688');
INSERT INTO `sys_user_unity` VALUES ('040400501401962248662537515455877702', '040400501401962248662537515455877702', '美然动力街区', '04', '1', '1', '2015-05-27 13:11:37', '1', null, null, null, null, null, '美然动力街区', '031430000001183475621650602405276735');
INSERT INTO `sys_user_unity` VALUES ('040400501402070248681015434271188763', '040400501402070248681015434271188763', '美然动力街区一期', '04', '1', '1', '2015-05-27 13:13:08', '1', null, null, null, null, null, '美然动力街区一期', '031430000001183475621650602405276735');
INSERT INTO `sys_user_unity` VALUES ('040400501402111358160585368076677706', '040400501402111358160585368076677706', '海军小井润园二区', '04', '1', '1', '2015-05-27 13:15:34', '1', null, null, null, null, null, '海军小井润园二区', '031430000021244343387054645081083185');
INSERT INTO `sys_user_unity` VALUES ('040400504002606310376204617827441847', '040400504002606310376204617827441847', '华贸城福熙大道', '03', '1', '1', '2015-04-23 15:30:30', '2', null, null, null, null, null, '华贸城福熙大道', '031420010001713313047265835867136688');
INSERT INTO `sys_user_unity` VALUES ('040400505442260556743530452208666673', '040400505442260556743530452208666673', '星源公寓', '04', '1', '1', '2015-05-28 15:17:50', '1', null, null, null, null, null, '星源公寓', '031430014001362501568362348122036848');
INSERT INTO `sys_user_unity` VALUES ('040420020700625101077141754028101641', '040420020700625101077141754028101641', '流星花园', '03', '1', '0', '2015-03-12 22:46:57', '4', null, null, '000001100000401404157570271661673322', '2015-03-06 23:58:49', null, '流星花园', '031420042100063142723108226767327468');
INSERT INTO `sys_user_unity` VALUES ('040424010400062318235330270770276050', '040424010400062318235330270770276050', '风格派.凯旋城', '04', '1', '1', '2015-03-12 22:46:45', '1', null, null, null, null, null, '风格派.凯旋城', '031420050500056067328278418137728416');
INSERT INTO `sys_user_unity` VALUES ('041002000400052814756406722666721442', '041002000400052814756406722666721442', '回龙观镇社区', '03', '1', '1', '2015-01-24 19:25:19', '2', null, null, null, null, null, '回龙观镇社区', null);
INSERT INTO `sys_user_unity` VALUES ('041406000218141084272848082305862856', '041406000218141084272848082305862856', '欧陆经典万兴苑', '03', '1', '1', '2015-03-18 22:50:38', '2', null, null, null, null, null, '欧陆经典万兴苑', '030000010011135245245424803362123868');
INSERT INTO `sys_user_unity` VALUES ('041406008501032337088701127476386220', '041406008501032337088701127476386220', '自主城', '04', '1', '1', '2015-03-18 22:22:05', '1', null, null, null, null, null, '自主城', '030000000420502668237471131761207860');
INSERT INTO `sys_user_unity` VALUES ('041406500014053606126022374103570081', '041406500014053606126022374103570081', '扬州水乡', '04', '1', '1', '2015-03-19 11:35:54', '1', null, null, null, null, null, '扬州水乡', '031406001081035138255700275251426858');
INSERT INTO `sys_user_unity` VALUES ('050002010050042602440307467744277742', '050002010050042602440307467744277742', '111', '05', '1', '1', '2015-02-04 16:24:10', '1', '100402116118', '2015-02-04 16:24:10', null, null, '000000', '超级管理员', null);
INSERT INTO `sys_user_unity` VALUES ('050002021060567461365287607821154107', '050002021060567461365287607821154107', '11', '05', '1', '1', '2015-02-04 13:51:04', '1', '100402116118', '2015-02-04 13:51:04', null, null, '000000', '超级管理员', null);
INSERT INTO `sys_user_unity` VALUES ('050002021121884187224342820632307344', '050002021121884187224342820632307344', '22', '05', '1', '1', '2015-02-04 13:52:11', '1', '100402116118', '2015-02-04 13:52:11', null, null, '000000', '超级管理员', null);
INSERT INTO `sys_user_unity` VALUES ('050400020011315722146040480531428681', '050400020011315722146040480531428681', '2', '05', '1', '1', '2015-02-04 16:39:54', '2', '100402116118', '2015-02-04 16:39:54', '100402116118', '2015-03-10 20:32:41', '000000', '超级管理员', null);
INSERT INTO `sys_user_unity` VALUES ('050400020050558261728850053705124573', '050400020050558261728850053705124573', '111', '05', '1', '1', '2015-02-04 16:37:37', '1', '100402116118', '2015-02-04 16:37:37', null, null, '000000', '超级管理员', null);
INSERT INTO `sys_user_unity` VALUES ('051000000040531535607867310733321225', '051000000040531535607867310733321225', '1111', '05', '1', '1', '2015-02-04 13:34:05', '1', '100402116118', '2015-02-04 13:34:05', null, null, '000000', '超级管理员', null);
INSERT INTO `sys_user_unity` VALUES ('051000000102722280228303384336282136', '051000000102722280228303384336282136', '2222', '05', '1', '1', '2015-02-04 13:43:03', '1', '100402116118', '2015-02-04 13:43:03', null, null, '000000', '超级管理员', null);
INSERT INTO `sys_user_unity` VALUES ('051004144000816703808508351567381000', '051004144000816703808508351567381000', 'yzz', '05', '1', '1', '2015-03-10 08:37:08', '1', '100402116118', '2015-03-10 08:37:07', null, null, '000000', '超级管理员', null);
INSERT INTO `sys_user_unity` VALUES ('051020310004010786834282833330825622', '051020310004010786834282833330825622', '好乐迪', '05', '1', '1', '2015-02-07 19:54:25', '1', '100402116118', '2015-02-07 19:54:25', null, null, '000000', '超级管理员', null);
INSERT INTO `sys_user_unity` VALUES ('051022000202024556017202584576085500', '051022000202024556017202584576085500', '111', '05', '1', '1', '2015-01-31 15:43:22', '1', '100402116118', '2015-01-31 15:43:22', null, null, '000000', '超级管理员', null);
INSERT INTO `sys_user_unity` VALUES ('051402080810216835245613063754454684', '051402080810216835245613063754454684', '11111', '05', '1', '1', '2015-01-26 22:50:31', '1', '100402116118', '2015-01-26 22:50:31', null, null, '000000', '超级管理员', null);
INSERT INTO `sys_user_unity` VALUES ('060000002070573348078800845286200660', '060000002070573348078800845286200660', '2', '06', '1', '1', '2015-02-07 16:21:14', '3', null, null, null, null, null, '2', null);
INSERT INTO `sys_user_unity` VALUES ('060021028000566840832867607030583202', '060021028000566840832867607030583202', '111', '06', '1', '1', '2015-02-04 13:34:15', '1', null, null, null, null, null, '111', null);
INSERT INTO `sys_user_unity` VALUES ('060021028502502633531612618563237370', '060021028502502633531612618563237370', '22', '06', '1', '1', '2015-02-04 13:43:06', '1', null, null, null, null, null, '22', null);
INSERT INTO `sys_user_unity` VALUES ('060400000000307355726533785025866850', '060400000000307355726533785025866850', 'vvvvvvvvv', '06', '1', '1', '2015-02-07 18:16:46', '1', null, null, null, null, null, 'vvvvvvvvv', null);
INSERT INTO `sys_user_unity` VALUES ('060400410200717011128281188201615254', '060400410200717011128281188201615254', '132121', '06', '1', '1', '2015-01-31 15:43:22', '1', null, null, null, null, null, '132121', null);
INSERT INTO `sys_user_unity` VALUES ('060422020000563213655047476362015536', '060422020000563213655047476362015536', '11', '06', '1', '1', '2015-02-04 15:51:49', '2', null, null, null, null, null, '11', null);
INSERT INTO `sys_user_unity` VALUES ('061002080032154844010327231461608651', '061002080032154844010327231461608651', '11111', '06', '1', '1', '2015-01-26 22:57:52', '1', null, null, null, null, null, '11111', null);
INSERT INTO `sys_user_unity` VALUES ('061002080832064020635505725318074275', '061002080832064020635505725318074275', '111', '06', '1', '1', '2015-01-26 22:50:32', '1', null, null, null, null, null, '111', null);
INSERT INTO `sys_user_unity` VALUES ('061005000000014622552817485136341716', '061005000000014622552817485136341716', '11', '06', '1', '1', '2015-03-10 08:37:08', '1', null, null, null, null, null, '11', null);
INSERT INTO `sys_user_unity` VALUES ('061020000210070113583754310588478515', '061020000210070113583754310588478515', '1', '06', '1', '1', '2015-02-04 16:24:10', '1', null, null, null, null, null, '1', null);
INSERT INTO `sys_user_unity` VALUES ('061021000010058224671065861588705754', '061021000010058224671065861588705754', '1', '06', '1', '1', '2015-02-04 16:37:37', '4', null, null, null, null, null, '1', null);
INSERT INTO `sys_user_unity` VALUES ('061021000090103514441122161834468331', '061021000090103514441122161834468331', '2', '06', '1', '1', '2015-02-04 16:39:54', '4', null, null, null, null, null, '2', null);
INSERT INTO `sys_user_unity` VALUES ('061021001001685254005638651437721787', '061021001001685254005638651437721787', '2', '06', '1', '1', '2015-02-04 13:52:15', '1', null, null, null, null, null, '2', null);
INSERT INTO `sys_user_unity` VALUES ('061021001040354261277823435605772310', '061021001040354261277823435605772310', '11', '06', '1', '1', '2015-02-04 13:51:09', '1', null, null, null, null, null, '11', null);
INSERT INTO `sys_user_unity` VALUES ('061023110025013728037072157123885122', '061023110025013728037072157123885122', '好乐迪(百联徐汇店)', '06', '1', '1', '2015-02-07 19:54:25', '1', null, null, null, null, null, '好乐迪(百联徐汇店)', null);
INSERT INTO `sys_user_unity` VALUES ('061023110214182250736433486228480708', '061023110214182250736433486228480708', '好乐迪（回龙观店）', '06', '1', '1', '2015-02-07 19:57:36', '3', null, null, null, null, null, '好乐迪（回龙观店）', null);
