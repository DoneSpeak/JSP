/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50554
Source Host           : localhost:3306
Source Database       : simpleshop

Target Server Type    : MYSQL
Target Server Version : 50554
File Encoding         : 65001

Date: 2017-02-22 20:52:34
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `ISBN` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `author` varchar(50) NOT NULL,
  `publish_company` varchar(50) NOT NULL,
  `publish_time` date NOT NULL,
  `intro` varchar(500) NOT NULL,
  `price` float(9,2) NOT NULL,
  `price_original` float(6,2) NOT NULL,
  `img` varchar(50) NOT NULL,
  PRIMARY KEY (`ISBN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES ('9787115318978', '图解TCP/IP', '[日]竹下隆史', '人民邮电出版社', '2013-07-01', 'https安全通道解析，nginx服务器精解宝典，http权威指南！', '47.40', '69.00', '9787115318978.jpg');
INSERT INTO `book` VALUES ('9787115351531', '图解HTTP', '[日]上野宣', '人民邮电出版社', '2014-05-01', '172张图解轻松入门从基础知识到最新动向，一本书掌握HTTP协议Web前端开发者必备，从基础知识到最新动向一网打尽', '38.70', '49.00', '9787115351531.jpg');
INSERT INTO `book` VALUES ('9787115388025', '图解机器学习', '[日]杉山将', '人民邮电出版社', '2015-04-01', '187张图解轻松入门，提供可执行的MATLAB程序代码，覆盖机器学习中的经典、用途的算法', '38.70', '49.00', '9787115388025.jpg');
INSERT INTO `book` VALUES ('9787115411259', '图解openFlow', '[日]晃通 宫永直树 岩田淳', '人民邮电出版社', '2016-01-01', '畅销书《图解TCP/IP》姊妹篇,189张图表轻松入门,从工作原理到应用实例，一本书掌握OpenFlow协议', '49.00', '49.00', '9787115411259.jpg');
