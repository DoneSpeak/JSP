/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50554
Source Host           : localhost:3306
Source Database       : simpleshop

Target Server Type    : MYSQL
Target Server Version : 50554
File Encoding         : 65001

Date: 2017-02-19 03:34:08
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
  `state` char(1) NOT NULL,
  `img` varchar(50) NOT NULL,
  PRIMARY KEY (`ISBN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES ('9787115318978', '图解TCP/IP', '[日]竹下隆史', '人民邮电出版社', '2013-07-01', 'https安全通道解析，nginx服务器精解宝典，http权威指南！', '47.40', '69.00', 'n', '9787115318978.jpg');
INSERT INTO `book` VALUES ('9787115351531', '图解HTTP', '[日]上野宣', '人民邮电出版社', '2014-05-01', '172张图解轻松入门从基础知识到最新动向，一本书掌握HTTP协议Web前端开发者必备，从基础知识到最新动向一网打尽', '38.70', '49.00', 'n', '9787115351531.jpg');
INSERT INTO `book` VALUES ('9787115369796', '图解网站分析', '[日]小川卓', '人民邮电出版社', '2014-10-01', '《图解网站分析：让流量倍增的网站优化方法(修订版)》以图配文，结合实例详细讲解了如何利用从网站上获取的各种数据了解网站的运营状况，如何从数据中攫取最有用的信息，如何优化站点，创造更大的网站价值。《图解网站分析：让流量倍增的网站优化方法(修订版)》适合各类网站运营人员阅读。', '1.00', '69.00', 's', '9787115369796.jpg');
INSERT INTO `book` VALUES ('9787115388025', '图解机器学习', '[日]杉山将', '人民邮电出版社', '2015-04-01', '187张图解轻松入门，提供可执行的MATLAB程序代码，覆盖机器学习中的经典、用途的算法', '38.70', '49.00', 'n', '9787115388025.jpg');
INSERT INTO `book` VALUES ('9787115411259', '图解openFlow', '[日]晃通 宫永直树 岩田淳', '人民邮电出版社', '2016-01-01', '畅销书《图解TCP/IP》姊妹篇,189张图表轻松入门,从工作原理到应用实例，一本书掌握OpenFlow协议', '49.00', '49.00', 'n', '9787115411259.jpg');
INSERT INTO `book` VALUES ('9787115424914', '图解密码技术', '[日]结城浩', '人民邮电出版社', '2016-06-01', '本书以图配文的形式，详细讲解了6种重要的密码技术：对称密码、公钥密码、单向散列函数、消息认证码、数字签名和伪随机数生成器。 第1部分讲述了密码技术的历史沿革、对称密码、分组密码模式（包括ECB、CBC、CFB、OFB、CTR）、公钥密码、混合密码系统。第2部分重点介绍了认证方面的内容，涉及单向散列函数、消息认证码、数字签名、证书等。第3部分讲述了密钥、随机数、PGP、SSL/TLS 以及密码技术在现实生活中的应用。 第3版对旧版内容进行了大幅更新，并新增POODLE攻击、心脏出血漏洞、Superfish事件、SHA-3竞赛、Keccak、认证加密、椭圆曲线密码、比特币等内容。', '1.00', '89.00', 'k', '9787115424914.jpg');
