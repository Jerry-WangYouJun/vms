/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50130
Source Host           : localhost:3306
Source Database       : sfms

Target Server Type    : MYSQL
Target Server Version : 50130
File Encoding         : 65001

Date: 2017-05-10 22:35:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `department`
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `deptNo` varchar(255) DEFAULT NULL,
  `deptName` varchar(255) DEFAULT NULL,
  `deptTel` varchar(255) DEFAULT NULL,
  `deptDesc` varchar(255) DEFAULT NULL,
  `deptLeader` varchar(255) DEFAULT NULL,
  `parentDeptId` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('1', 'rw0001', '软件外包', null, '软外', 'admin', '4', null);
INSERT INTO `department` VALUES ('2', 'yd001', '移动互联', null, '软外', 'admin', '1', null);
INSERT INTO `department` VALUES ('3', 'dsj001', '大数据', null, '软外', 'admin', '1', null);
INSERT INTO `department` VALUES ('4', 'zcb001', '总裁办', null, '董事会', 'admin', null, null);
INSERT INTO `department` VALUES ('5', 'xmgl001', '项目管理部', '123', '23', 'admin', '4', '32');
INSERT INTO `department` VALUES ('15', '123aaa', '123aaa', '123aaa', '123aaa', '123aaaa', null, '1231232aaa');
INSERT INTO `department` VALUES ('16', '123', '1231', '231', '231', '123', null, '23123');
INSERT INTO `department` VALUES ('19', '123', '3123', '2312', '231', '123', null, '1231');
INSERT INTO `department` VALUES ('20', '123', '123', '312', '12', '123', null, '123');
INSERT INTO `department` VALUES ('21', '1111', '11', '', '', '', null, '');

-- ----------------------------
-- Table structure for `dictionary`
-- ----------------------------
DROP TABLE IF EXISTS `dictionary`;
CREATE TABLE `dictionary` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `dicNo` varchar(255) DEFAULT NULL,
  `dicType` varchar(255) DEFAULT NULL,
  `dicCode` varchar(255) DEFAULT NULL,
  `dicValue` varchar(255) DEFAULT NULL,
  `dicSort` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `validateFlag` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dictionary
-- ----------------------------
INSERT INTO `dictionary` VALUES ('1', 'province', '籍贯', 'SD', '山东', '', null, '0');
INSERT INTO `dictionary` VALUES ('2', 'province', '籍贯', 'JS', '江苏', null, null, '0');
INSERT INTO `dictionary` VALUES ('3', 'province', '籍贯', 'SH', '上海', null, null, '0');
INSERT INTO `dictionary` VALUES ('4', 'province', '籍贯', 'BJ', '北京', null, null, '0');
INSERT INTO `dictionary` VALUES ('5', 'sex', '性别', '0', '男', '', '', '0');
INSERT INTO `dictionary` VALUES ('6', 'sex', '性别', '1', '女', '', '', '0');
INSERT INTO `dictionary` VALUES ('7', 'province', '籍贯', 'SX', '山西', '', '', '0');
INSERT INTO `dictionary` VALUES ('8', 'stockState', '入库状态', '00', '创建', null, null, '0');
INSERT INTO `dictionary` VALUES ('9', 'stockState', '入库状态', '02', '记账', null, null, '0');
INSERT INTO `dictionary` VALUES ('10', 'productType', '饲料分类', '1型', '1型饲料', null, null, '0');
INSERT INTO `dictionary` VALUES ('11', 'productType', '饲料分类', '2型', '2型饲料', null, null, '0');

-- ----------------------------
-- Table structure for `goods`
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `productNo` varchar(255) DEFAULT NULL,
  `productName` varchar(255) DEFAULT NULL,
  `productType` varchar(255) DEFAULT NULL,
  `productStandard` varchar(255) DEFAULT NULL,
  `supplierId` varchar(255) DEFAULT NULL,
  `productDate` datetime DEFAULT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `price` decimal(19,2) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('1', 'JY_JAVA_0001', 'JAVA程序设计', 'office', '400*800', '2', '2015-10-16 00:00:00', '本', '68.80', ' ');
INSERT INTO `goods` VALUES ('2', 'SP_ZAO_0001', '青岛啤酒', 'drink', '500ml', '1', '2015-10-21 00:00:00', '箱', '998.99', ' ');
INSERT INTO `goods` VALUES ('3', 'SP_ZAO_0002', '青岛啤酒1', 'drink', '501ml', '4', '2015-10-21 00:00:00', '箱', '998.99', ' ');
INSERT INTO `goods` VALUES ('4', 'YL_2015-01', '医用纱布', 'medical', '3333*9999', '5', '2015-10-14 00:00:00', '袋', '13.80', ' ');
INSERT INTO `goods` VALUES ('5', 'SY_RICE_0001', '东北大米', '1型', '10', '1', '2016-04-30 00:00:00', '斤', '3.58', '');
INSERT INTO `goods` VALUES ('8', 'tttt111222', 'ttttt12222', '', 'tttt222222', null, '2016-05-09 00:00:00', '111222', '2222.00', '11111111122222');
INSERT INTO `goods` VALUES ('100', 'JY_JAVA_0001', 'JAVA程序设计', 'office', '400*800', '2', '2015-10-16 00:00:00', '本', '68.80', ' ');

-- ----------------------------
-- Table structure for `immune`
-- ----------------------------
DROP TABLE IF EXISTS `immune`;
CREATE TABLE `immune` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `immunename` varchar(50) DEFAULT NULL,
  `sheeptype` varchar(20) DEFAULT NULL,
  `immunetype` varchar(20) DEFAULT NULL,
  `intervals` varchar(20) DEFAULT NULL,
  `necessary` varchar(10) DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of immune
-- ----------------------------
INSERT INTO `immune` VALUES ('1', '疫苗001', '山羊', '羊三联四防疫苗', '11111', '1', '111');
INSERT INTO `immune` VALUES ('2', '1', '1', '口蹄疫疫苗', '1111', '1', '1');

-- ----------------------------
-- Table structure for `instock`
-- ----------------------------
DROP TABLE IF EXISTS `instock`;
CREATE TABLE `instock` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `instockNo` varchar(255) DEFAULT NULL,
  `stockId` varchar(255) DEFAULT NULL,
  `supplierId` varchar(255) DEFAULT NULL,
  `instockDate` datetime DEFAULT NULL,
  `instockState` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `goodId` varchar(25) DEFAULT NULL,
  `numbers` int(10) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of instock
-- ----------------------------
INSERT INTO `instock` VALUES ('15', 'RK201705092252009', '1', '1', null, '00', '', '8', '1111');
INSERT INTO `instock` VALUES ('16', 'RK201705092320815', '1', '1', null, '00', '', '1', '111');
INSERT INTO `instock` VALUES ('17', 'RK201705092344333', '1', '1', null, '00', '', '1', '111');
INSERT INTO `instock` VALUES ('18', 'RK201705102054587', '1', '1', null, '00', '222222', '1', '2222');

-- ----------------------------
-- Table structure for `instockdetail`
-- ----------------------------
DROP TABLE IF EXISTS `instockdetail`;
CREATE TABLE `instockdetail` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `instockId` varchar(255) DEFAULT NULL,
  `productNo` varchar(255) DEFAULT NULL,
  `productName` varchar(255) DEFAULT NULL,
  `productStandard` varchar(255) DEFAULT NULL,
  `productNum` decimal(19,2) DEFAULT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `price` decimal(19,2) DEFAULT NULL,
  `totalPrice` decimal(19,2) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of instockdetail
-- ----------------------------

-- ----------------------------
-- Table structure for `inventory`
-- ----------------------------
DROP TABLE IF EXISTS `inventory`;
CREATE TABLE `inventory` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `stockId` varchar(255) DEFAULT NULL,
  `productNo` varchar(255) DEFAULT NULL,
  `productName` varchar(255) DEFAULT NULL,
  `productStandard` varchar(255) DEFAULT NULL,
  `inventoryNum` decimal(19,2) DEFAULT NULL,
  `inventoryPrice` decimal(19,2) DEFAULT NULL,
  `maxNum` decimal(19,2) DEFAULT NULL,
  `minNum` decimal(19,2) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of inventory
-- ----------------------------
INSERT INTO `inventory` VALUES ('1', '2', 'JY_JAVA_0001', 'JAVA程序设计', '400*800', '1.00', '68.80', '1.20', '0.20', null);
INSERT INTO `inventory` VALUES ('2', '2', 'SY_RICE_0001', '东北大米1', '100', '1.25', '4.48', '1.50', '0.25', null);
INSERT INTO `inventory` VALUES ('5', '1', 'JY_JAVA_0001', 'JAVA程序设计', '400*800', '7.00', '481.60', '2.40', '0.40', null);
INSERT INTO `inventory` VALUES ('6', '1', 'YL_2015-01', '医用纱布', '3333*9999', '10.00', '138.00', '6.00', '1.00', null);
INSERT INTO `inventory` VALUES ('7', '1', 'SP_ZAO_0002', '青岛啤酒1', '501ml', '18.00', '17981.82', '7.20', '1.20', null);
INSERT INTO `inventory` VALUES ('8', '3', 'SP_ZAO_0001', '青岛啤酒', '500ml', '100.00', '99899.00', '300.00', '30.00', null);
INSERT INTO `inventory` VALUES ('9', '3', 'YL_2015-01', '医用纱布', '3333*9999', '1000.00', '13800.00', '3000.00', '300.00', null);
INSERT INTO `inventory` VALUES ('10', '3', 'JY_JAVA_0001', 'JAVA程序设计', '400*800', '998.00', '68662.40', '2994.00', '299.40', null);

-- ----------------------------
-- Table structure for `k_dept`
-- ----------------------------
DROP TABLE IF EXISTS `k_dept`;
CREATE TABLE `k_dept` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `deptNo` varchar(20) NOT NULL COMMENT '部门编号',
  `deptName` varchar(50) DEFAULT NULL COMMENT '部门名称',
  `deptLeader` varchar(20) DEFAULT NULL COMMENT '部门领导',
  `deptTel` varchar(15) DEFAULT NULL COMMENT '联系方式',
  `parentDeptNo` varchar(20) DEFAULT NULL COMMENT '上级部门',
  `deptDesc` varchar(200) DEFAULT NULL COMMENT '部门描述',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='部门信息表';

-- ----------------------------
-- Records of k_dept
-- ----------------------------
INSERT INTO `k_dept` VALUES ('1', 'rw000001', '软件研发部', 'admin', '123', '123', '123', '123');
INSERT INTO `k_dept` VALUES ('2', 'sale0001', '销售部啊', 'admin', '123123', '123', '123', '123');
INSERT INTO `k_dept` VALUES ('6', 'zg00001', '综管部', 'admin', '23423', '234', '234', '234');

-- ----------------------------
-- Table structure for `k_dictionary`
-- ----------------------------
DROP TABLE IF EXISTS `k_dictionary`;
CREATE TABLE `k_dictionary` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `dicId` varchar(255) DEFAULT NULL COMMENT '字典类型ID',
  `dicType` varchar(255) DEFAULT NULL COMMENT '字典类型',
  `dicCode` varchar(255) DEFAULT NULL COMMENT '字典编码',
  `dicValue` varchar(255) DEFAULT NULL COMMENT '字典值',
  `dicSort` varchar(255) DEFAULT NULL COMMENT '排序',
  `validateFlag` varchar(1) DEFAULT '0' COMMENT '有效性标记(0 生效 1失效 9挂起)',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of k_dictionary
-- ----------------------------
INSERT INTO `k_dictionary` VALUES ('1', 'stockState', '库存申请单状态', '00', '创建', '', '0', '');
INSERT INTO `k_dictionary` VALUES ('2', 'stockState', '库存申请单状态', '02', '记账', null, '0', null);
INSERT INTO `k_dictionary` VALUES ('3', 'productType', '产品分类', 'jiaocai', '教材', '', '0', ' ');
INSERT INTO `k_dictionary` VALUES ('4', 'productType', '产品分类', 'office', '办公用品', '', '0', '');
INSERT INTO `k_dictionary` VALUES ('5', 'province', '省市', 'SD', '山东', '', '0', '');
INSERT INTO `k_dictionary` VALUES ('6', 'province', '省市', 'JS', '江苏', '', '0', '');
INSERT INTO `k_dictionary` VALUES ('7', 'province', '省市', 'BJ', '北京', '', '0', '');
INSERT INTO `k_dictionary` VALUES ('8', 'province', '省市', 'SH', '上海', '', '0', '');
INSERT INTO `k_dictionary` VALUES ('9', 'province', '省市', 'GZ', '广州', '', '0', '');
INSERT INTO `k_dictionary` VALUES ('16', 'year', '年份', '2010', '2010', '', '0', '');
INSERT INTO `k_dictionary` VALUES ('17', 'year', '年份', '2011', '2011', '', '0', '');
INSERT INTO `k_dictionary` VALUES ('18', 'year', '年份', '2012', '2012', '', '0', '');
INSERT INTO `k_dictionary` VALUES ('19', 'year', '年份', '2013', '2013', '', '0', '');
INSERT INTO `k_dictionary` VALUES ('20', 'year', '年份', '2014', '2014', '', '0', '');
INSERT INTO `k_dictionary` VALUES ('21', 'year', '年份', '2015', '2015', '', '0', '');
INSERT INTO `k_dictionary` VALUES ('22', 'year', '年份', '2016', '2016', '', '0', '');
INSERT INTO `k_dictionary` VALUES ('23', 'year', '年份', '2017', '2017', '', '0', '');
INSERT INTO `k_dictionary` VALUES ('24', 'month', '月份', '01', '01', null, '0', null);
INSERT INTO `k_dictionary` VALUES ('25', 'month', '月份', '02', '02', null, '0', null);
INSERT INTO `k_dictionary` VALUES ('26', 'month', '月份', '03', '03', null, '0', null);
INSERT INTO `k_dictionary` VALUES ('27', 'month', '月份', '04', '04', null, '0', null);
INSERT INTO `k_dictionary` VALUES ('28', 'month', '月份', '05', '05', null, '0', null);
INSERT INTO `k_dictionary` VALUES ('29', 'month', '月份', '06', '06', null, '0', null);
INSERT INTO `k_dictionary` VALUES ('30', 'month', '月份', '07', '07', '', '0', '');
INSERT INTO `k_dictionary` VALUES ('31', 'month', '月份', '08', '08', '', '0', '');
INSERT INTO `k_dictionary` VALUES ('32', 'month', '月份', '09', '09', '', '0', '');
INSERT INTO `k_dictionary` VALUES ('33', 'month', '月份', '10', '10', '', '0', '');
INSERT INTO `k_dictionary` VALUES ('34', 'month', '月份', '11', '11', '', '0', '');
INSERT INTO `k_dictionary` VALUES ('35', 'month', '月份', '12', '12', '', '0', '');
INSERT INTO `k_dictionary` VALUES ('36', 'productType', '产品分类', 'medical', '医疗用品', '', '0', ' ');
INSERT INTO `k_dictionary` VALUES ('37', 'productType', '产品分类', 'drink', '酒水', '', '0', ' ');

-- ----------------------------
-- Table structure for `k_goods`
-- ----------------------------
DROP TABLE IF EXISTS `k_goods`;
CREATE TABLE `k_goods` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `productNo` varchar(30) NOT NULL COMMENT '产品编码',
  `productName` varchar(50) DEFAULT NULL COMMENT '产品名称',
  `productTypeCode` varchar(10) DEFAULT NULL COMMENT '产品分类代码',
  `productStandard` varchar(50) DEFAULT NULL COMMENT '产品规格',
  `supplierNo` varchar(20) DEFAULT NULL COMMENT '供应商代码',
  `productDate` date DEFAULT NULL COMMENT '生产日期',
  `productNum` int(10) DEFAULT NULL COMMENT '产品数量',
  `unit` varchar(10) DEFAULT NULL COMMENT '计量单位',
  `price` double DEFAULT NULL COMMENT '单价',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='货物信息表';

-- ----------------------------
-- Records of k_goods
-- ----------------------------
INSERT INTO `k_goods` VALUES ('1', 'JY_JAVA_0001', 'JAVA程序设计', 'office', '400*800', 'ugrow', '2015-10-16', '1000', '本', '68.8', '此乃大神也');
INSERT INTO `k_goods` VALUES ('2', 'SP_ZAO_0001', '青岛啤酒', 'drink', '500ml', '1', '2015-10-21', '99999', '箱', '998.99', '青岛啤酒，奢侈品中的战斗机');
INSERT INTO `k_goods` VALUES ('3', 'SP_ZAO_0002', '青岛啤酒1', 'drink', '501ml', '4', '2015-10-21', '99999', '箱', '998.99', '青岛啤酒，奢侈品中的战斗机');
INSERT INTO `k_goods` VALUES ('4', 'YL_2015-01', '医用纱布', 'medical', '3333*9999', '5', '2015-10-14', '12345', '袋', '13.8', '');

-- ----------------------------
-- Table structure for `outstock`
-- ----------------------------
DROP TABLE IF EXISTS `outstock`;
CREATE TABLE `outstock` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `outstockNo` varchar(255) DEFAULT NULL,
  `stockId` varchar(255) DEFAULT NULL,
  `supplierId` varchar(255) DEFAULT NULL,
  `outstockDate` datetime DEFAULT NULL,
  `outstockState` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `maxNum` decimal(19,2) DEFAULT NULL,
  `minNum` decimal(19,2) DEFAULT NULL,
  `outstockNum` decimal(19,2) DEFAULT NULL,
  `outstockPrice` decimal(19,2) DEFAULT NULL,
  `productName` varchar(255) DEFAULT NULL,
  `productNo` varchar(255) DEFAULT NULL,
  `productStandard` varchar(255) DEFAULT NULL,
  `goodid` int(10) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of outstock
-- ----------------------------
INSERT INTO `outstock` VALUES ('4', 'CK201705092317211', '1', '1', '2017-05-09 00:00:00', '00', '', null, null, '11111.00', null, null, null, null, '1');
INSERT INTO `outstock` VALUES ('5', 'CK201705092318278', '1', '1', null, '00', '', null, null, '11111.00', null, null, null, null, '1');
INSERT INTO `outstock` VALUES ('7', 'CK201705092344132', '1', '1', null, '00', null, null, null, '111.00', null, null, null, null, '1');
INSERT INTO `outstock` VALUES ('8', 'CK201705092347873', '1', '1', null, '00', '', null, null, '111.00', null, null, null, null, '1');
INSERT INTO `outstock` VALUES ('9', 'CK201705092348634', '1', '1', null, '00', '', null, null, '11111.00', null, null, null, null, '1');

-- ----------------------------
-- Table structure for `outstockdetail`
-- ----------------------------
DROP TABLE IF EXISTS `outstockdetail`;
CREATE TABLE `outstockdetail` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `outstockId` varchar(255) DEFAULT NULL,
  `productNo` varchar(255) DEFAULT NULL,
  `productName` varchar(255) DEFAULT NULL,
  `productStandard` varchar(255) DEFAULT NULL,
  `productNum` decimal(19,2) DEFAULT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `price` decimal(19,2) DEFAULT NULL,
  `totalPrice` decimal(19,2) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of outstockdetail
-- ----------------------------

-- ----------------------------
-- Table structure for `remind`
-- ----------------------------
DROP TABLE IF EXISTS `remind`;
CREATE TABLE `remind` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `immuneid` varchar(50) DEFAULT NULL,
  `sheep` varchar(20) DEFAULT NULL,
  `lastdate` varchar(20) DEFAULT NULL,
  `remind` varchar(10) DEFAULT NULL,
  `remindtype` varchar(20) DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of remind
-- ----------------------------
INSERT INTO `remind` VALUES ('4', '疫苗001', '1111', '2017-05-08', '2017-05-10', '短信', '11111');
INSERT INTO `remind` VALUES ('5', '疫苗001', '1111', '2017-05-09', '2017-05-03', '短信', '111');

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `remark` varchar(255) DEFAULT NULL,
  `roleLevel` varchar(255) DEFAULT NULL,
  `roleName` varchar(255) DEFAULT NULL,
  `roleNo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', null, '999', '管理员', 'admin');
INSERT INTO `role` VALUES ('2', null, '1', '员工', 'emp');
INSERT INTO `role` VALUES ('3', null, '2', '经理', 'manager');

-- ----------------------------
-- Table structure for `stock`
-- ----------------------------
DROP TABLE IF EXISTS `stock`;
CREATE TABLE `stock` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `stockNo` varchar(255) DEFAULT NULL,
  `stockName` varchar(255) DEFAULT NULL,
  `provinceCode` varchar(255) DEFAULT NULL,
  `stockAddress` varchar(255) DEFAULT NULL,
  `stockTel` varchar(255) DEFAULT NULL,
  `userId` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stock
-- ----------------------------
INSERT INTO `stock` VALUES ('1', 'JN001', '青岛港', 'SD', '山东省青岛市市南区', '2342', 'admin', '');
INSERT INTO `stock` VALUES ('2', '002', '成品库', 'JS', '江苏省南京市仙林区', '23423', 'admin', '23424');
INSERT INTO `stock` VALUES ('3', '001', '原料库', 'SD', '山东省青岛市崂山区', '123123', 'admin', '1231撒旦飞洒地方');
INSERT INTO `stock` VALUES ('4', '003', '半成品库', 'SH', '上海市宝山区XXX', '234', 'admin', '234');

-- ----------------------------
-- Table structure for `supplier`
-- ----------------------------
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `supplierNo` varchar(255) DEFAULT NULL,
  `supplierName` varchar(255) DEFAULT NULL,
  `provinceCode` varchar(255) DEFAULT NULL,
  `supplierAddress` varchar(255) DEFAULT NULL,
  `supplierEmail` varchar(255) DEFAULT NULL,
  `supplierTel` varchar(255) DEFAULT NULL,
  `supplierTax` varchar(255) DEFAULT NULL,
  `userName` varchar(255) DEFAULT NULL,
  `userTel` varchar(255) DEFAULT NULL,
  `userTex` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of supplier
-- ----------------------------
INSERT INTO `supplier` VALUES ('1', 'beer2', '青岛二厂', 'SD', '阿打算地方的发生地方啥地方萨芬爱的风格的嘎发顺丰干', '123', '123', '123', '123', '123', '123123撒地方', '');
