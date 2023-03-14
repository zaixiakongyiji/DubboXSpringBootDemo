/*
 Navicat Premium Data Transfer

 Source Server         : Test1
 Source Server Type    : MySQL
 Source Server Version : 80030
 Source Host           : 192.168.110.10:3306
 Source Schema         : dubbo

 Target Server Type    : MySQL
 Target Server Version : 80030
 File Encoding         : 65001

 Date: 14/03/2023 16:24:33
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for filter_type
-- ----------------------------
DROP TABLE IF EXISTS `filter_type`;
CREATE TABLE `filter_type`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `name_key_one` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `name_key_two` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of filter_type
-- ----------------------------
INSERT INTO `filter_type` VALUES (1, 'AddRequestHeader', 'name', 'value');
INSERT INTO `filter_type` VALUES (2, 'AddRequestParameter', 'name', 'value');
INSERT INTO `filter_type` VALUES (3, 'AddResponseHeader', 'name', 'value');
INSERT INTO `filter_type` VALUES (4, 'DedupeResponseHeader', 'name', 'strategy');

-- ----------------------------
-- Table structure for gateway_filter
-- ----------------------------
DROP TABLE IF EXISTS `gateway_filter`;
CREATE TABLE `gateway_filter`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `rId` int NULL DEFAULT NULL COMMENT '路由id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '过滤器名字',
  `param_one` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '参数1',
  `param_two` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '参数2',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gateway_filter
-- ----------------------------

-- ----------------------------
-- Table structure for gateway_predicate
-- ----------------------------
DROP TABLE IF EXISTS `gateway_predicate`;
CREATE TABLE `gateway_predicate`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `rId` int NULL DEFAULT NULL COMMENT '路由id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '断言名称',
  `params_one` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '参数1',
  `params_two` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '参数2',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gateway_predicate
-- ----------------------------
INSERT INTO `gateway_predicate` VALUES (1, 1, 'Path', '/', NULL);
INSERT INTO `gateway_predicate` VALUES (2, 2, 'Cookie', 'username', 'xiaoming');

-- ----------------------------
-- Table structure for gateway_route
-- ----------------------------
DROP TABLE IF EXISTS `gateway_route`;
CREATE TABLE `gateway_route`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `uri` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gateway_route
-- ----------------------------
INSERT INTO `gateway_route` VALUES (1, 'payment_routh', 'http://192.168.110.10:8081');
INSERT INTO `gateway_route` VALUES (2, 'cookie', 'https://baidu.com');

-- ----------------------------
-- Table structure for predicate_type
-- ----------------------------
DROP TABLE IF EXISTS `predicate_type`;
CREATE TABLE `predicate_type`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `name_key_one` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `name_key_two` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of predicate_type
-- ----------------------------
INSERT INTO `predicate_type` VALUES (1, 'After', 'datetime', NULL);
INSERT INTO `predicate_type` VALUES (2, 'Before', 'datetime', NULL);
INSERT INTO `predicate_type` VALUES (3, 'Between', 'datetime1', 'datetime2');
INSERT INTO `predicate_type` VALUES (4, 'Cookie', 'name', 'regexp');
INSERT INTO `predicate_type` VALUES (5, 'Header', 'header', 'regexp');
INSERT INTO `predicate_type` VALUES (6, 'Host', 'patterns', NULL);
INSERT INTO `predicate_type` VALUES (7, 'Method', 'methods', NULL);
INSERT INTO `predicate_type` VALUES (8, 'Path', 'patterns', 'matchTrailingSlash');
INSERT INTO `predicate_type` VALUES (9, 'Query', 'param', 'regexp');
INSERT INTO `predicate_type` VALUES (10, 'RemoteAddr', 'sources', NULL);
INSERT INTO `predicate_type` VALUES (11, 'Weight', 'group', 'weight');

SET FOREIGN_KEY_CHECKS = 1;
