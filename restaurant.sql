/*
Navicat MySQL Data Transfer

Source Server         : wbb
Source Server Version : 50735
Source Host           : localhost:3306
Source Database       : restaurant

Target Server Type    : MYSQL
Target Server Version : 50735
File Encoding         : 65001

Date: 2021-12-12 21:49:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for food
-- ----------------------------
DROP TABLE IF EXISTS `food`;
CREATE TABLE `food` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜品编号',
  `foodname` varchar(20) NOT NULL COMMENT '菜品名称',
  `foodinf` varchar(100) NOT NULL COMMENT '菜品信息',
  `price` float(11,0) NOT NULL COMMENT '菜品价格',
  `foodtypeid` int(11) NOT NULL COMMENT '菜品分类',
  `picture` varchar(200) NOT NULL COMMENT '菜品图片',
  `state` int(11) NOT NULL COMMENT '状态（1为正常；2为沽清）',
  PRIMARY KEY (`id`),
  KEY `food_foodtype_fk` (`foodtypeid`),
  CONSTRAINT `food_foodtype_fk` FOREIGN KEY (`foodtypeid`) REFERENCES `foodtype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of food
-- ----------------------------
INSERT INTO `food` VALUES ('1', '披萨', '西红柿就是番茄爽肤水赶紧回家和fish京东方IU速度梵音谷回复背景和减肥计划管理会计付款了估计你们，放牛班GV记得发挥空间快递费是哪个接口分布能感觉到狂欢节肯定会给机会克己奉公考虑到今年开始的话', '15', '1', 'images/f1.png', '2');
INSERT INTO `food` VALUES ('2', '汉堡王', '苦瓜和蛋一起炒萨芬DVD分公司发生事故发货发顺丰', '16', '1', 'images/f2.png', '1');
INSERT INTO `food` VALUES ('3', '韭菜炒奥特曼', '苦瓜和蛋一起炒', '99', '1', 'images/下载.jpg', '2');
INSERT INTO `food` VALUES ('4', '腰果派', '苦瓜和蛋一起炒八十到一百字', '16', '4', 'images/f4.png', '1');
INSERT INTO `food` VALUES ('5', '薯条', '苦瓜和蛋一起炒', '16', '5', 'images/f5.png', '2');
INSERT INTO `food` VALUES ('6', '披萨', '苦瓜和蛋一起炒', '16', '6', 'images/f6.png', '2');
INSERT INTO `food` VALUES ('7', '苦瓜炒蛋', '苦瓜和蛋一起炒', '16', '7', 'images/f7.png', '1');
INSERT INTO `food` VALUES ('8', '苦瓜炒蛋', '苦瓜和蛋一起炒', '16', '8', 'images/f8.png', '1');
INSERT INTO `food` VALUES ('9', '苦瓜炒蛋', '苦瓜和蛋一起炒', '16', '9', 'images/f9.png', '2');

-- ----------------------------
-- Table structure for foodtype
-- ----------------------------
DROP TABLE IF EXISTS `foodtype`;
CREATE TABLE `foodtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分类编号',
  `tyname` varchar(20) NOT NULL COMMENT '分类名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of foodtype
-- ----------------------------
INSERT INTO `foodtype` VALUES ('1', '特色');
INSERT INTO `foodtype` VALUES ('2', '炒荤菜');
INSERT INTO `foodtype` VALUES ('3', '炒素菜');
INSERT INTO `foodtype` VALUES ('4', '蒸菜');
INSERT INTO `foodtype` VALUES ('5', '炖汤');
INSERT INTO `foodtype` VALUES ('6', '甜品');
INSERT INTO `foodtype` VALUES ('7', '凉菜');
INSERT INTO `foodtype` VALUES ('8', '饮品');
INSERT INTO `foodtype` VALUES ('9', '酒水');
INSERT INTO `foodtype` VALUES ('10', '干饭');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单编号',
  `wname` varchar(20) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '菜单名称',
  `whtml` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '权限菜单网页',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', '首页', null);
INSERT INTO `menu` VALUES ('2', '菜单', null);
INSERT INTO `menu` VALUES ('3', '订单', null);
INSERT INTO `menu` VALUES ('4', '后台', null);

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单编号',
  `orderid` varchar(50) NOT NULL,
  `ordertime` datetime NOT NULL COMMENT '创建时间',
  `ordername` varchar(11) NOT NULL COMMENT '订单创建人',
  `orderprice` float NOT NULL COMMENT '订单价格',
  `prderstate` int(11) NOT NULL COMMENT '订单状态（0为完成；1为未完成）',
  `paystate` int(11) NOT NULL COMMENT '支付状态（0为未支付；1为支付）',
  `paytime` datetime DEFAULT NULL COMMENT '支付时间',
  PRIMARY KEY (`id`),
  KEY `order_user_fk` (`ordername`),
  KEY `order_orderdishes_fk` (`orderid`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES ('21', '163853118509776', '2021-12-03 19:33:05', 'wbb', '46', '2', '2', '2021-12-03 19:43:40');

-- ----------------------------
-- Table structure for orderdishes
-- ----------------------------
DROP TABLE IF EXISTS `orderdishes`;
CREATE TABLE `orderdishes` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '点菜编号',
  `ordersid` int(11) NOT NULL,
  `foodname` varchar(255) NOT NULL,
  `foodnum` int(11) NOT NULL,
  `price` double(10,0) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ordersid` (`ordersid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderdishes
-- ----------------------------
INSERT INTO `orderdishes` VALUES ('1', '0', '披萨', '1', '15');

-- ----------------------------
-- Table structure for root
-- ----------------------------
DROP TABLE IF EXISTS `root`;
CREATE TABLE `root` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '权限编号',
  `rid` int(5) NOT NULL COMMENT '权限名称',
  `wid` int(11) NOT NULL COMMENT '权限人身份菜单(0为商户；1为客户)',
  PRIMARY KEY (`id`),
  KEY `root_menu_fk` (`wid`),
  KEY `rid` (`rid`),
  CONSTRAINT `root_menu_fk` FOREIGN KEY (`wid`) REFERENCES `menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of root
-- ----------------------------
INSERT INTO `root` VALUES ('1', '1', '1');
INSERT INTO `root` VALUES ('2', '1', '2');
INSERT INTO `root` VALUES ('3', '1', '3');
INSERT INTO `root` VALUES ('4', '1', '4');
INSERT INTO `root` VALUES ('5', '2', '1');
INSERT INTO `root` VALUES ('6', '2', '2');
INSERT INTO `root` VALUES ('7', '2', '3');

-- ----------------------------
-- Table structure for shopcar
-- ----------------------------
DROP TABLE IF EXISTS `shopcar`;
CREATE TABLE `shopcar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(255) NOT NULL,
  `foodname` varchar(255) NOT NULL,
  `foodnum` int(11) NOT NULL,
  `price` float(5,0) NOT NULL,
  `sumprice` float(5,0) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `foodname` (`foodname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopcar
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uname` varchar(20) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(20) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '用户密码',
  `rid` int(11) NOT NULL COMMENT '用户身份(0为商户；1为客户)',
  `telephone` varchar(20) CHARACTER SET utf8 NOT NULL COMMENT '用户电话',
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `sex` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`uname`),
  KEY `user_root_fk` (`rid`),
  CONSTRAINT `user_root_fk` FOREIGN KEY (`rid`) REFERENCES `root` (`rid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'wbb', '061812', '1', '18384073769', '奥特曼', '男', '通天塔');
INSERT INTO `user` VALUES ('3', 'xdy', '001123', '2', '15789653254', '杨望', '男', '成都东软学院');
INSERT INTO `user` VALUES ('4', 'zbc', '000000', '2', '18785646654', null, null, null);
INSERT INTO `user` VALUES ('8', 'admin', '55555', '2', '18784769875', null, null, null);
INSERT INTO `user` VALUES ('9', 'user', '01234', '2', '15708177315', null, null, null);
