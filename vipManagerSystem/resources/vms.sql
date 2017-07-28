/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50130
Source Host           : localhost:3306
Source Database       : vms

Target Server Type    : MYSQL
Target Server Version : 50130
File Encoding         : 65001

Date: 2017-07-29 07:05:06
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
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('8', 'K03', '卡布奇诺', '咖啡', '350ml', '杯', '25.00', '');
INSERT INTO `goods` VALUES ('7', 'K02', '拿铁咖啡', '咖啡', '350ml', '杯', '25.00', '');
INSERT INTO `goods` VALUES ('6', 'K01', '美式咖啡', '咖啡', '350ml', '杯', '18.00', '');
INSERT INTO `goods` VALUES ('9', 'K04', '邦咖啡', '咖啡', '350ml', '杯', '35.00', '含酒精');
INSERT INTO `goods` VALUES ('11', 'L01', '蓝柑蜜柚', '冷饮', '500ml', '杯', '20.00', '');
INSERT INTO `goods` VALUES ('12', 'L02', '玫瑰青提', '冷饮', '350ml', '杯', '20.00', '');
INSERT INTO `goods` VALUES ('13', 'L03', '冻柠茶', '冷饮', '350ml', '杯', '20.00', '');
INSERT INTO `goods` VALUES ('14', 'L04', '手工奶茶', '冷饮', '500ml', '杯', '20.00', '');
INSERT INTO `goods` VALUES ('15', 'L05', '柠檬汁', '冷饮', '500ml', '杯', '18.00', '');
INSERT INTO `goods` VALUES ('16', 'L06', '芒果冰沙', '冷饮', '350ml', '杯', '20.00', '');
INSERT INTO `goods` VALUES ('17', 'C02', '英式红茶', '茶', '1L', '壶', '48.00', '');
INSERT INTO `goods` VALUES ('18', 'C01', '英式红茶（杯）', '茶', '350ml', '杯', '18.00', '');
INSERT INTO `goods` VALUES ('19', 'C03', '陈年普洱（杯）', '茶', '350ml', '杯', '25.00', '');
INSERT INTO `goods` VALUES ('20', 'C04', '陈年普洱', '茶', '1L', '壶', '68.00', '');
INSERT INTO `goods` VALUES ('21', 'C05', '金边玫瑰（杯）', '茶', '350ml', '杯', '25.00', '');
INSERT INTO `goods` VALUES ('22', 'C06', '金边玫瑰', '茶', '1L', '壶', '68.00', '');
INSERT INTO `goods` VALUES ('23', 'C07', '糯米香普（杯）', '茶', '350ml', '杯', '25.00', '');
INSERT INTO `goods` VALUES ('24', 'C08', '糯米香普', '茶', '1L', '壶', '68.00', '');
INSERT INTO `goods` VALUES ('25', 'S01', '泡鲁达', '特色', '350ml', '杯', '25.00', '');
INSERT INTO `goods` VALUES ('26', 'J01', '莫吉托', '特色', '350ml', '杯', '30.00', '');
INSERT INTO `goods` VALUES ('27', 'J02', '秀兰邓波', '特色', '350ml', '杯', '30.00', '');
INSERT INTO `goods` VALUES ('28', 'J03', '金汤力', '特色', '350ml', '杯', '30.00', '');
INSERT INTO `goods` VALUES ('29', 'J04', '长岛冰茶', '特色', '350ml', '杯', '35.00', '');

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
  `pillType` varchar(5) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `discount` double(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES ('3', null, '淡然', '201707280950', '2017-07-28', '45.00', '01', '2', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_order_detail
-- ----------------------------
INSERT INTO `t_order_detail` VALUES ('5', '3', '8', '1');
INSERT INTO `t_order_detail` VALUES ('6', '3', '11', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_recharge
-- ----------------------------
INSERT INTO `t_recharge` VALUES ('5', '13', null, '1500', '600', '2100', '15', '15', '2017-07-28');
INSERT INTO `t_recharge` VALUES ('6', '14', null, '1500', '500', '2000', '1500', '1500', '2017-07-29');
INSERT INTO `t_recharge` VALUES ('7', '15', null, '1500', '500', '2000', '100', '100', '2017-07-29');

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `VIP` varchar(20) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `sex` varchar(1) DEFAULT '1',
  `birthday` varchar(20) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `balance` double(8,3) DEFAULT '0.000' COMMENT '余额',
  `score` int(11) DEFAULT '0',
  `level` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('15', null, '麦克', '1', null, null, null, '2000.000', '100', null);
INSERT INTO `t_user` VALUES ('14', null, '麦克', '1', null, null, null, '2000.000', '1500', null);
INSERT INTO `t_user` VALUES ('13', '0001', '淡然', '0', '', '', '', null, null, '');
