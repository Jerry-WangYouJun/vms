/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50130
Source Host           : localhost:3306
Source Database       : vms

Target Server Type    : MYSQL
Target Server Version : 50130
File Encoding         : 65001

Date: 2017-07-13 06:29:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `goods`
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
INSERT INTO `goods` VALUES ('1', '11', '红茶', '饮品', '11', '1', '11.00', '11');
INSERT INTO `goods` VALUES ('3', '2', '布丁', '点心', '222', '2', '222.00', '2');
INSERT INTO `goods` VALUES ('4', '3', '绿茶', '饮品', '33', '33', '33.00', '33');

-- ----------------------------
-- Table structure for `t_order`
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `orderNo` varchar(20) DEFAULT NULL,
  `orderDate` varchar(20) DEFAULT NULL,
  `pill` double(8,2) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `discount` double(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES ('8', '2', '112', '1', null, '233.00', '2', null);
INSERT INTO `t_order` VALUES ('9', '4', 'aacasd', '1', null, '110.00', '10', null);
INSERT INTO `t_order` VALUES ('10', '3', 'bb', '11', null, '233.00', '2', null);
INSERT INTO `t_order` VALUES ('11', '2', '112', '11', null, '454.00', '3', '1.00');
INSERT INTO `t_order` VALUES ('12', '3', 'aaaaaa', '11', null, '111.00', '1111', null);
INSERT INTO `t_order` VALUES ('13', null, 'm,nlkmjkl', '111', null, '11.00', '1', null);
INSERT INTO `t_order` VALUES ('14', null, 'hhh', '111', null, '11.00', '1', null);
INSERT INTO `t_order` VALUES ('15', '3', 'aaaaaaaaa', 'iuiui', null, '55.00', '5', null);
INSERT INTO `t_order` VALUES ('16', '2', '112', '1111', '2017-07-12', '21.00', '2', '1.00');

-- ----------------------------
-- Table structure for `t_order_detail`
-- ----------------------------
DROP TABLE IF EXISTS `t_order_detail`;
CREATE TABLE `t_order_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` int(11) DEFAULT NULL,
  `goodId` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_order_detail
-- ----------------------------
INSERT INTO `t_order_detail` VALUES ('3', '8', '1', '1');
INSERT INTO `t_order_detail` VALUES ('4', '8', '3', '1');
INSERT INTO `t_order_detail` VALUES ('17', '9', '1', '10');
INSERT INTO `t_order_detail` VALUES ('19', '13', '1', '1');
INSERT INTO `t_order_detail` VALUES ('20', '14', '1', '1');
INSERT INTO `t_order_detail` VALUES ('21', '15', '1', '5');
INSERT INTO `t_order_detail` VALUES ('22', '10', '1', '1');
INSERT INTO `t_order_detail` VALUES ('23', '10', '3', '1');
INSERT INTO `t_order_detail` VALUES ('26', '11', '1', '1');
INSERT INTO `t_order_detail` VALUES ('27', '11', '3', '2');
INSERT INTO `t_order_detail` VALUES ('28', '16', '1', '2');

-- ----------------------------
-- Table structure for `t_recharge`
-- ----------------------------
DROP TABLE IF EXISTS `t_recharge`;
CREATE TABLE `t_recharge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `finalMoney` double DEFAULT NULL,
  `actualMoney` double DEFAULT NULL,
  `giftMoney` double DEFAULT NULL,
  `totalMoney` double DEFAULT NULL,
  `creditPoints` int(11) DEFAULT NULL,
  `totalPoints` int(11) DEFAULT NULL,
  `rechargetime` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_recharge
-- ----------------------------
INSERT INTO `t_recharge` VALUES ('2', '2', null, '1', '2', '16', '1', '115', null);
INSERT INTO `t_recharge` VALUES ('3', '2', null, '1111', '111', null, '111', '222', null);
INSERT INTO `t_recharge` VALUES ('4', '3', null, '11', '111', null, '111', '112', null);
INSERT INTO `t_recharge` VALUES ('5', '3', null, '111', '111', null, '11', '134', null);
INSERT INTO `t_recharge` VALUES ('6', '2', null, '1', '1', '1', '1', '1', null);
INSERT INTO `t_recharge` VALUES ('7', '2', null, '10', '1', '12', '2', '113', null);
INSERT INTO `t_recharge` VALUES ('8', '2', null, '1', '1', '1', '1', '1', null);
INSERT INTO `t_recharge` VALUES ('9', '3', null, '1', '1', '16', '1', '115', '2017-07-12');
INSERT INTO `t_recharge` VALUES ('10', '2', null, '1', '1', '16', '1', '115', '2017-07-12');

-- ----------------------------
-- Table structure for `t_user`
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
INSERT INTO `t_user` VALUES ('2', '123', '112', '1', '2017-06-24', '1', '11', '1.000', '1', '111');
INSERT INTO `t_user` VALUES ('3', 'aaaa', 'aaaaaa', '0', '2017-06-16', 'aaa', 'aaa', '123.000', '123', '1');
INSERT INTO `t_user` VALUES ('4', '1', 'aacasd', null, '', '1', '1', '1.000', '1', '1');
