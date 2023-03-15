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

 Date: 15/03/2023 09:12:14
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for filter_type
-- ----------------------------
DROP TABLE IF EXISTS `filter_type`;
CREATE TABLE `filter_type`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '名称',
  `name_key_one` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'key1',
  `name_key_two` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'key2',
  `name_key_three` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'key3',
  `name_key_four` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'key4',
  `name_key_five` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'key5',
  `name_key_six` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'key6',
  `name_key_seven` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'key7',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of filter_type
-- ----------------------------
INSERT INTO `filter_type` VALUES (1, 'AddRequestHeader', 'name', 'value', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `filter_type` VALUES (2, 'AddRequestParameter', 'name', 'value', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `filter_type` VALUES (3, 'AddResponseHeader', 'name', 'value', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `filter_type` VALUES (4, 'DedupeResponseHeader', 'name', 'strategy', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `filter_type` VALUES (5, 'CircuitBreaker', 'name', 'fallbackUri', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `filter_type` VALUES (6, 'FallbackHeaders', 'name', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `filter_type` VALUES (7, 'MapRequestHeader', 'fromHeader', 'toHeader', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `filter_type` VALUES (8, 'PrefixPath', 'prefix', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `filter_type` VALUES (9, 'PreserveHostHeader', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `filter_type` VALUES (10, 'RequestRateLimiter', 'keyResolver', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `filter_type` VALUES (11, 'RedirectTo', 'status', 'url', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `filter_type` VALUES (12, 'RemoveRequestHeader', 'name', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `filter_type` VALUES (13, 'RemoveResponseHeader', 'name', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `filter_type` VALUES (14, 'RemoveRequestParameter', 'name', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `filter_type` VALUES (15, 'RemoveRequestParameter', '111111', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `filter_type` VALUES (16, 'RewritePath', 'regexp', 'replacement', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `filter_type` VALUES (17, 'RewriteLocationResponseHeader', 'stripVersion', 'locationHeaderName', 'hostValue', 'protocols', NULL, NULL, NULL);
INSERT INTO `filter_type` VALUES (18, 'RewriteResponseHeader', 'regexp', 'replacement', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `filter_type` VALUES (19, 'SaveSession', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `filter_type` VALUES (20, 'secure-headers', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `filter_type` VALUES (21, 'SetPath', 'template', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `filter_type` VALUES (22, 'SetRequestHeader', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `filter_type` VALUES (23, 'SetResponseHeader', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `filter_type` VALUES (24, 'SetStatus', 'status', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `filter_type` VALUES (25, 'StripPrefix', 'parts', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `filter_type` VALUES (26, 'Retry', 'retries', 'statuses', 'methods', 'backoff.firstBackoff', 'backoff.maxBackoff', 'backoff.factor', 'backoff.basedOnPreviousValue');
INSERT INTO `filter_type` VALUES (27, 'RequestSize', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `filter_type` VALUES (28, 'SetRequestHostHeader', 'host', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `filter_type` VALUES (29, 'ModifyRequestBody', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `filter_type` VALUES (30, 'ModifyResponseBody', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `filter_type` VALUES (31, 'TokenRelay', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `filter_type` VALUES (32, 'CacheRequestBody', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `filter_type` VALUES (33, 'JsonToGrpc', 'protoDescriptor', 'protoFile', 'service', 'method', NULL, NULL, NULL);
INSERT INTO `filter_type` VALUES (34, 'default-filters', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

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
  `param_three` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '参数3',
  `param_four` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '参数4',
  `param_five` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '参数5',
  `param_six` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '参数6',
  `param_seven` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '参数7',
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
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '名称',
  `name_key_one` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'key1',
  `name_key_two` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'key2',
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
