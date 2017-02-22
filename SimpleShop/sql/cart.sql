/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50554
Source Host           : localhost:3306
Source Database       : db_bookshop

Target Server Type    : MYSQL
Target Server Version : 50554
File Encoding         : 65001

Date: 2017-02-20 21:50:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_cart
-- ----------------------------
DROP TABLE IF EXISTS `tb_cart`;
CREATE TABLE `tb_cart` (
  `cid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) unsigned NOT NULL,
  `isbn` varchar(20) NOT NULL,
  `num` int(6) NOT NULL,
  PRIMARY KEY (`cid`),
  KEY `num` (`num`),
  KEY `uid` (`uid`),
  KEY `isbn` (`isbn`),
  CONSTRAINT `tb_cart_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `tb_user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tb_cart_ibfk_2` FOREIGN KEY (`isbn`) REFERENCES `tb_book` (`ISBN`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8;
