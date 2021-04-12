/*
 Navicat MySQL Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50728
 Source Host           : localhost:3306
 Source Schema         : cm

 Target Server Type    : MySQL
 Target Server Version : 50728
 File Encoding         : 65001

 Date: 12/04/2021 19:48:16
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cm_car
-- ----------------------------
DROP TABLE IF EXISTS `cm_car`;
CREATE TABLE `cm_car`  (
  `cid` decimal(20, 0) NOT NULL,
  `license` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `bought_time` datetime NULL DEFAULT NULL,
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` decimal(5, 0) NULL DEFAULT NULL COMMENT '万元',
  `brand` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`cid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cm_car
-- ----------------------------
INSERT INTO `cm_car` VALUES (1, '渝A·7Q523', 'using', '2021-04-12 18:49:37', 'large_cargo', 29, '东风');
INSERT INTO `cm_car` VALUES (2, '渝B·32124', 'free', '2021-04-12 19:47:22', 'mid_passenger', 40, '丰田');
INSERT INTO `cm_car` VALUES (3, '渝C·78025', 'free', '2021-04-12 20:29:28', 'small_passenger', 7, '五菱');

-- ----------------------------
-- Table structure for cm_car_use
-- ----------------------------
DROP TABLE IF EXISTS `cm_car_use`;
CREATE TABLE `cm_car_use`  (
  `logid` decimal(30, 0) NOT NULL,
  `userid` decimal(30, 0) NULL DEFAULT NULL,
  `carid` decimal(20, 0) NULL DEFAULT NULL,
  `start_time` datetime NULL DEFAULT NULL,
  `end_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`logid`) USING BTREE,
  INDEX `cm_car_use_ibfk_1`(`carid`) USING BTREE,
  INDEX `cm_car_use_ibfk_2`(`userid`) USING BTREE,
  CONSTRAINT `cm_car_use_ibfk_1` FOREIGN KEY (`carid`) REFERENCES `cm_car` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cm_car_use_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `cm_user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cm_car_use
-- ----------------------------
INSERT INTO `cm_car_use` VALUES (1, 3, 2, '2021-04-12 12:01:10', '2021-04-12 17:01:16');
INSERT INTO `cm_car_use` VALUES (2, 4, 1, '2021-04-12 18:02:12', NULL);

-- ----------------------------
-- Table structure for cm_location
-- ----------------------------
DROP TABLE IF EXISTS `cm_location`;
CREATE TABLE `cm_location`  (
  `lid` decimal(30, 0) NOT NULL,
  `userid` decimal(30, 0) NULL DEFAULT NULL,
  `carid` decimal(20, 0) NULL DEFAULT NULL,
  `lng` decimal(10, 7) NULL DEFAULT NULL COMMENT '经度',
  `lat` decimal(10, 7) NULL DEFAULT NULL COMMENT '纬度',
  PRIMARY KEY (`lid`) USING BTREE,
  INDEX `cm_location_ibfk_1`(`userid`) USING BTREE,
  INDEX `cm_location_ibfk_2`(`carid`) USING BTREE,
  CONSTRAINT `cm_location_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `cm_user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cm_location_ibfk_2` FOREIGN KEY (`carid`) REFERENCES `cm_car` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cm_location
-- ----------------------------

-- ----------------------------
-- Table structure for cm_user
-- ----------------------------
DROP TABLE IF EXISTS `cm_user`;
CREATE TABLE `cm_user`  (
  `uid` decimal(30, 0) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'MD5加密32位',
  `creat_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `group` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`uid`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cm_user
-- ----------------------------
INSERT INTO `cm_user` VALUES (1, '超级管理员', 'hu120051', 'aa80064af613c4b057d5a4c1a397e140', '2021-04-12 17:08:47', '2021-04-12 17:08:50', 'online', 'superadmin');
INSERT INTO `cm_user` VALUES (2, '管理员', 'admin', '21232f297a57a5a743894a0e4a801fc3', '2021-04-12 17:10:17', '2021-04-12 17:10:21', 'online', 'admin');
INSERT INTO `cm_user` VALUES (3, '张三', 'zhangsan', '3ab7873060b6de9ca93b664e752bca6f', '2021-04-12 18:21:57', '2021-04-12 18:22:02', 'offline', 'staff');
INSERT INTO `cm_user` VALUES (4, '李四', 'lisi', 'ada6f2b5b7ba3f1531e4c1e291cbe7b0', '2021-04-12 18:22:42', '2021-04-12 18:22:45', 'online', 'staff');

SET FOREIGN_KEY_CHECKS = 1;
