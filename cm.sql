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

 Date: 23/04/2021 13:55:30
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cm_application
-- ----------------------------
DROP TABLE IF EXISTS `cm_application`;
CREATE TABLE `cm_application`  (
  `applyid` bigint(30) NOT NULL AUTO_INCREMENT,
  `userid` bigint(30) NULL DEFAULT NULL,
  `carid` bigint(20) NULL DEFAULT NULL,
  `apply_time` datetime NULL DEFAULT NULL,
  `start_date` date NULL DEFAULT NULL,
  `end_date` date NULL DEFAULT NULL,
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'applying',
  PRIMARY KEY (`applyid`) USING BTREE,
  INDEX `userid`(`userid`) USING BTREE,
  INDEX `carid`(`carid`) USING BTREE,
  CONSTRAINT `cm_application_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `cm_user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cm_application_ibfk_2` FOREIGN KEY (`carid`) REFERENCES `cm_car` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cm_application
-- ----------------------------
INSERT INTO `cm_application` VALUES (1, 7, 3, '2021-04-13 11:02:25', '2021-04-13', '2021-04-13', 'pass');
INSERT INTO `cm_application` VALUES (2, 3, 2, '2021-04-13 11:13:11', '2021-04-14', '2021-04-16', 'fail');
INSERT INTO `cm_application` VALUES (8, 4, 1, '2021-04-13 11:13:24', '2021-04-14', '2021-04-15', 'pass');
INSERT INTO `cm_application` VALUES (9, 5, 4, '2021-04-15 17:49:26', '2021-04-16', '2021-04-20', 'pass');
INSERT INTO `cm_application` VALUES (10, 6, 5, '2021-04-21 16:14:09', '2021-04-22', '2021-04-23', 'pass');

-- ----------------------------
-- Table structure for cm_car
-- ----------------------------
DROP TABLE IF EXISTS `cm_car`;
CREATE TABLE `cm_car`  (
  `cid` bigint(20) NOT NULL AUTO_INCREMENT,
  `license` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'free',
  `bought_time` date NULL DEFAULT NULL,
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` decimal(5, 2) NULL DEFAULT NULL COMMENT '万元',
  `brand` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userid` bigint(30) NULL DEFAULT NULL,
  PRIMARY KEY (`cid`) USING BTREE,
  INDEX `userid`(`userid`) USING BTREE,
  CONSTRAINT `cm_car_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `cm_user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cm_car
-- ----------------------------
INSERT INTO `cm_car` VALUES (1, '渝A·7Q523', 'free', '2021-04-12', 'large_cargo', 29.00, '东风', 1);
INSERT INTO `cm_car` VALUES (2, '渝B·32124', 'free', '2021-04-12', 'mid_passenger', 40.00, '丰田', NULL);
INSERT INTO `cm_car` VALUES (3, '渝C·78025', 'free', '2021-04-12', 'small_passenger', 7.00, '五菱', 7);
INSERT INTO `cm_car` VALUES (4, '渝A·B12S3', 'free', '2021-04-15', 'mid_cargo', 22.00, '一汽', 3);
INSERT INTO `cm_car` VALUES (5, '渝A·JL23K', 'free', '2021-04-21', 'large_cargo', 29.30, '东风', NULL);

-- ----------------------------
-- Table structure for cm_car_use
-- ----------------------------
DROP TABLE IF EXISTS `cm_car_use`;
CREATE TABLE `cm_car_use`  (
  `logid` bigint(30) NOT NULL AUTO_INCREMENT,
  `userid` bigint(30) NULL DEFAULT NULL,
  `carid` bigint(20) NULL DEFAULT NULL,
  `start_date` date NULL DEFAULT NULL,
  `end_date` date NULL DEFAULT NULL,
  PRIMARY KEY (`logid`) USING BTREE,
  INDEX `userid`(`userid`) USING BTREE,
  INDEX `carid`(`carid`) USING BTREE,
  CONSTRAINT `cm_car_use_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `cm_user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cm_car_use_ibfk_2` FOREIGN KEY (`carid`) REFERENCES `cm_car` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cm_car_use
-- ----------------------------
INSERT INTO `cm_car_use` VALUES (1, 3, 2, '2021-04-12', '2021-04-12');
INSERT INTO `cm_car_use` VALUES (2, 4, 1, '2021-04-12', '2021-04-13');
INSERT INTO `cm_car_use` VALUES (3, 7, 3, '2021-04-13', '2021-04-13');
INSERT INTO `cm_car_use` VALUES (6, 5, 4, '2021-04-16', '2021-04-20');
INSERT INTO `cm_car_use` VALUES (7, 6, 5, '2021-04-22', '2021-04-23');
INSERT INTO `cm_car_use` VALUES (8, 4, 1, '2021-04-14', '2021-04-15');

-- ----------------------------
-- Table structure for cm_location
-- ----------------------------
DROP TABLE IF EXISTS `cm_location`;
CREATE TABLE `cm_location`  (
  `lid` bigint(30) NOT NULL AUTO_INCREMENT,
  `userid` bigint(30) NULL DEFAULT NULL,
  `carid` bigint(20) NULL DEFAULT NULL,
  `lng` decimal(10, 7) NULL DEFAULT NULL COMMENT '经度',
  `lat` decimal(10, 7) NULL DEFAULT NULL COMMENT '纬度',
  `time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`lid`) USING BTREE,
  INDEX `cm_location_ibfk_1`(`userid`) USING BTREE,
  INDEX `cm_location_ibfk_2`(`carid`) USING BTREE,
  CONSTRAINT `cm_location_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `cm_user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cm_location_ibfk_2` FOREIGN KEY (`carid`) REFERENCES `cm_car` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cm_location
-- ----------------------------
INSERT INTO `cm_location` VALUES (1, 7, 3, 106.4766920, 29.5658390, '2021-04-13 10:45:46');
INSERT INTO `cm_location` VALUES (2, 7, 3, 106.4737810, 29.5675670, '2021-04-13 10:46:19');
INSERT INTO `cm_location` VALUES (3, 1, 1, 106.4747810, 29.5775670, '2021-04-23 09:43:10');
INSERT INTO `cm_location` VALUES (4, 1, 1, 106.4847810, 29.5775670, '2021-04-23 13:32:14');
INSERT INTO `cm_location` VALUES (5, 7, 3, 106.4766920, 29.5658390, '2021-04-23 13:49:24');
INSERT INTO `cm_location` VALUES (6, 3, 4, 106.4528652, 29.5523562, '2021-04-23 13:51:24');

-- ----------------------------
-- Table structure for cm_user
-- ----------------------------
DROP TABLE IF EXISTS `cm_user`;
CREATE TABLE `cm_user`  (
  `uid` bigint(30) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'MD5加密32位',
  `creat_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'offline',
  `group` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`uid`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cm_user
-- ----------------------------
INSERT INTO `cm_user` VALUES (1, '胡寒阳', 'hu120051', 'aa80064af613c4b057d5a4c1a397e140', '2021-04-12 17:08:47', '2021-04-21 09:41:43', 'online', 'superadmin');
INSERT INTO `cm_user` VALUES (2, '管理员', 'admin', '21232f297a57a5a743894a0e4a801fc3', '2021-04-12 17:10:17', '2021-04-20 17:37:19', 'offline', 'admin');
INSERT INTO `cm_user` VALUES (3, '张三', 'zhangsan', '3ab7873060b6de9ca93b664e752bca6f', '2021-04-12 18:21:57', '2021-04-13 10:32:04', 'offline', 'staff');
INSERT INTO `cm_user` VALUES (4, '李四', 'lisi', 'ada6f2b5b7ba3f1531e4c1e291cbe7b0', '2021-04-12 18:22:42', '2021-04-12 18:22:45', 'online', 'staff');
INSERT INTO `cm_user` VALUES (5, '王五', 'wangwu', 'b52c0992c2d18eddbad0c05bac922cee', '2021-04-13 10:08:40', '2021-04-13 10:08:42', 'offline', 'staff');
INSERT INTO `cm_user` VALUES (6, '赵六', 'zhaoliu', 'ad324eb585496327017b46f1b1d526de', '2021-04-13 10:31:03', '2021-04-13 10:31:03', 'online', 'admin');
INSERT INTO `cm_user` VALUES (7, '高磊', 'gaolei', '8f85e32f11b1e4cfcbe353b5b646bf0f', '2021-04-13 10:34:54', '2021-04-13 11:05:33', 'online', 'staff');
INSERT INTO `cm_user` VALUES (9, '方晓萌', 'fxm', '33f5b0123d2749770c2dd63007e9fb1d', '2021-04-13 11:07:01', '2021-04-13 14:02:46', 'offline', 'admin');
INSERT INTO `cm_user` VALUES (13, '刘义良', 'liuyiliang', '3ae09f1e3ceb295a239c352461a6ca6f', '2021-04-13 13:48:07', '2021-04-13 13:48:07', 'offline', 'admin');
INSERT INTO `cm_user` VALUES (14, '杨肇谦', 'yangzhaoqian', 'a63ee944347161d3f3b55a3e0320e3aa', '2021-04-13 13:59:42', '2021-04-13 13:59:42', 'offline', 'staff');
INSERT INTO `cm_user` VALUES (15, '杨令', 'yangling', '2dd373cd649afdad040d2c414003ce71', '2021-04-20 17:11:04', '2021-04-20 17:17:11', 'offline', 'staff');
INSERT INTO `cm_user` VALUES (17, '郭旭', 'guoxu', '4963908eaa34eb2107f519b8dd298188', '2021-04-20 17:13:52', '2021-04-20 17:13:52', 'offline', 'admin');
INSERT INTO `cm_user` VALUES (18, '李彦霖', 'liyanlin', '3ae09f1e3ceb295a239c352461a6ca6f', '2021-04-20 17:15:30', '2021-04-20 17:15:30', 'offline', 'staff');
INSERT INTO `cm_user` VALUES (19, '何菁鑫', 'hejingxin', '94f611ae3a813c9c3fa2f7be4ab045a2', '2021-04-20 17:16:02', '2021-04-20 17:16:02', 'offline', 'admin');

-- ----------------------------
-- Triggers structure for table cm_application
-- ----------------------------
DROP TRIGGER IF EXISTS `apply_time`;
delimiter ;;
CREATE TRIGGER `apply_time` BEFORE INSERT ON `cm_application` FOR EACH ROW begin
         set new.apply_time = now();
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table cm_user
-- ----------------------------
DROP TRIGGER IF EXISTS `creat_time`;
delimiter ;;
CREATE TRIGGER `creat_time` BEFORE INSERT ON `cm_user` FOR EACH ROW begin
         set new.creat_time = now();
end
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
