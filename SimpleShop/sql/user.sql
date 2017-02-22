/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50554
Source Host           : localhost:3306
Source Database       : simpleshop

Target Server Type    : MYSQL
Target Server Version : 50554
File Encoding         : 65001

Date: 2017-02-22 20:53:02
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('51', '夏天', 'fh58q2ea6thauof5ikg98fe2ciafh50r');
INSERT INTO `user` VALUES ('52', '夏末', 'fh58q2ea6thauof5ikg98fe2ciafh50r');
