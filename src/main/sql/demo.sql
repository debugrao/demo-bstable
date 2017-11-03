/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50525
Source Host           : localhost:3306
Source Database       : demo

Target Server Type    : MYSQL
Target Server Version : 50525
File Encoding         : 65001

Date: 2017-05-24 16:40:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `username` char(20) NOT NULL,
  `password` char(32) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `useable` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否可用(0禁用,1可用)',
  `addtime` datetime NOT NULL COMMENT '创建时间',
  `logintime` datetime DEFAULT NULL COMMENT '登陆时间',
  `loginip` varchar(15) DEFAULT NULL COMMENT '登陆IP',
  PRIMARY KEY (`id`),
  KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('15', 'ok77', 'e2137fae6eb8c807519b2645e433900d', 'meinv777@qq.com', '1', '2016-07-02 21:53:59', '2017-01-03 08:10:47', '162.247.96.40');
INSERT INTO `t_user` VALUES ('16', 'caizehua', 'e10adc3949ba59abbe56e057f20f883e', null, '1', '2016-09-29 17:21:05', '2017-04-25 19:11:40', '192.168.0.200');
INSERT INTO `t_user` VALUES ('17', 'ok666', '2cd31ce854ce6a763f801d761bee549d', '', '1', '2017-01-04 11:38:20', '2017-01-13 20:00:13', '113.87.160.102');
INSERT INTO `t_user` VALUES ('18', 'admin', '21232f297a57a5a743894a0e4a801fc3', null, '1', '2017-04-21 14:45:05', '2017-05-19 17:54:49', '192.168.0.200');
INSERT INTO `t_user` VALUES ('19', 'test', '96e79218965eb72c92a549dd5a330112', '', '1', '2017-05-04 11:14:31', null, null);
INSERT INTO `t_user` VALUES ('20', 'userJ4o51', '123456', 'J4o51@test.com', '1', '2017-05-04 15:22:46', null, null);
INSERT INTO `t_user` VALUES ('21', 'user3vSi8', '123456', '3vSi8@test.com', '1', '2017-05-04 15:23:34', null, null);
INSERT INTO `t_user` VALUES ('22', 'user9wJjI', '123456', '9wJjI@test.com', '1', '2017-05-04 15:33:19', null, null);
INSERT INTO `t_user` VALUES ('23', 'user2NLJB', '123456', '2NLJB@test.com', '1', '2017-05-04 17:00:12', null, null);
INSERT INTO `t_user` VALUES ('24', 'userjy208', '123456', 'jy208@test.com', '1', '2017-05-04 17:12:41', null, null);
INSERT INTO `t_user` VALUES ('25', 'userfKEIy', '123456', 'fKEIy@test.com', '1', '2017-05-04 17:36:30', null, null);
INSERT INTO `t_user` VALUES ('26', 'user59u9o', '123456', '59u9o@test.com', '1', '2017-05-04 17:42:22', null, null);
INSERT INTO `t_user` VALUES ('27', 'userB0VQP', '123456', 'B0VQP@test.com', '1', '2017-05-04 17:46:23', null, null);
INSERT INTO `t_user` VALUES ('28', 'usertP745', '123456', 'tP745@test.com', '1', '2017-05-04 17:56:57', null, null);
INSERT INTO `t_user` VALUES ('29', 'userNO3Dz', '123456', 'NO3Dz@test.com', '1', '2017-05-04 18:01:24', null, null);
INSERT INTO `t_user` VALUES ('30', 'userebT60', '123456', 'ebT60@test.com', '1', '2017-05-05 10:28:41', null, null);
INSERT INTO `t_user` VALUES ('31', 'userufXrw', '123456', 'ufXrw@test.com', '1', '2017-05-05 11:40:43', null, null);
INSERT INTO `t_user` VALUES ('32', 'usernK2R8', '123456', 'nK2R8@test.com', '1', '2017-05-05 14:12:59', null, null);
INSERT INTO `t_user` VALUES ('33', 'userb035J', '123456', 'b035J@test.com', '1', '2017-05-05 14:44:07', null, null);
