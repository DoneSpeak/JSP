/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50554
Source Host           : localhost:3306
Source Database       : simpleshop

Target Server Type    : MYSQL
Target Server Version : 50554
File Encoding         : 65001

Date: 2017-02-22 20:52:50
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `cid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) unsigned NOT NULL,
  `isbn` varchar(20) NOT NULL,
  `num` int(6) NOT NULL,
  PRIMARY KEY (`cid`),
  KEY `num` (`num`),
  KEY `uid` (`uid`),
  KEY `isbn` (`isbn`),
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`isbn`) REFERENCES `book` (`ISBN`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES ('1', '51', '9787115351531', '4');
INSERT INTO `cart` VALUES ('2', '52', '9787115388025', '4');
INSERT INTO `cart` VALUES ('4', '52', '9787115351531', '6');
INSERT INTO `cart` VALUES ('5', '51', '9787115388025', '1');
