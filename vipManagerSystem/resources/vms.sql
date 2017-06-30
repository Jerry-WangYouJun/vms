/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : vms

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2017-06-30 17:32:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productno` varchar(20) DEFAULT NULL,
  `productname` varchar(20) DEFAULT NULL,
  `producttype` varchar(5) DEFAULT NULL,
  `productstandard` varchar(10) DEFAULT NULL,
  `unit` varchar(5) DEFAULT NULL,
  `price` double(10,2) DEFAULT NULL,
  `remark` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('1', '11', '11', '饮品', '11', '1', '11.00', '11');
INSERT INTO `goods` VALUES ('3', '2', '2', '点心', '222', '2', '222.00', '2');
INSERT INTO `goods` VALUES ('4', '3', '3', '饮品', '33', '33', '33.00', '33');

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `orderNo` varchar(20) DEFAULT NULL,
  `pill` double(8,2) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES ('7', '2', '1', '1.00', '1');
INSERT INTO `t_order` VALUES ('8', '2', '1', '1.00', '1');
INSERT INTO `t_order` VALUES ('9', '2', '1', '1.00', '1');
INSERT INTO `t_order` VALUES ('10', '3', '11', '466.00', '4');

-- ----------------------------
-- Table structure for t_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `t_order_detail`;
CREATE TABLE `t_order_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` int(11) DEFAULT NULL,
  `goodId` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_order_detail
-- ----------------------------
INSERT INTO `t_order_detail` VALUES ('1', '7', '1', null);
INSERT INTO `t_order_detail` VALUES ('2', '7', '3', null);
INSERT INTO `t_order_detail` VALUES ('3', '8', '1', null);
INSERT INTO `t_order_detail` VALUES ('4', '8', '3', null);
INSERT INTO `t_order_detail` VALUES ('5', '9', '1', null);
INSERT INTO `t_order_detail` VALUES ('6', '10', '1', '1');
INSERT INTO `t_order_detail` VALUES ('7', '10', '3', '2');
INSERT INTO `t_order_detail` VALUES ('8', '10', '1', '1');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `VIP` varchar(20) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `sex` varchar(1) DEFAULT NULL,
  `birthday` varchar(20) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `telephone` varchar(10) DEFAULT NULL,
  `balance` double(8,3) DEFAULT NULL COMMENT '余额',
  `score` int(11) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('2', '123', '112', '1', '2017-06-24', '1', '11', '1.000', '111', '111');
INSERT INTO `t_user` VALUES ('3', 'aaaa', 'aaaaaa', '0', '2017-06-16', 'aaa', 'aaa', '123.000', '123', '1');
INSERT INTO `t_user` VALUES ('4', '1', 'aacasd', null, '', '1', '1', '1.000', '1', '1');
