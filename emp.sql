/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80031
 Source Host           : localhost:3306
 Source Schema         : lv

 Target Server Type    : MySQL
 Target Server Version : 80031
 File Encoding         : 65001

 Date: 05/08/2023 10:33:44
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for emp
-- ----------------------------
DROP TABLE IF EXISTS `emp`;
CREATE TABLE `emp`  (
  `emp_id` int NOT NULL AUTO_INCREMENT COMMENT '员工号',
  `emp_name` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '员工姓名',
  `gender` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '男' COMMENT '性别',
  `birth` datetime NOT NULL DEFAULT '1990-01-01 00:00:00' COMMENT '出生日期',
  `salary` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '工资',
  `address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '通讯地址',
  `dept_id` int NULL DEFAULT NULL COMMENT '部门编号',
  PRIMARY KEY (`emp_id`) USING BTREE,
  INDEX `idx_name`(`emp_name`) USING BTREE,
  INDEX `idx_birth`(`birth`) USING BTREE,
  INDEX `idx_deptid_name`(`dept_id`, `emp_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of emp
-- ----------------------------
INSERT INTO `emp` VALUES (1, '张晓红', '女', '1980-01-23 00:00:00', 5800.00, '河南省郑州市中原路10号', 1);
INSERT INTO `emp` VALUES (2, '张静静', '女', '1987-10-03 00:00:00', 5400.00, '河南省新乡市平原路38号', 1);
INSERT INTO `emp` VALUES (3, '王云飞', '男', '1992-11-15 00:00:00', 5600.00, '河南省新乡市人民路28号', 1);
INSERT INTO `emp` VALUES (4, '王鹏飞', '男', '1987-10-01 00:00:00', 6800.00, '河南省新乡市东明大道12号', 1);
INSERT INTO `emp` VALUES (5, '王大鹏', '男', '1989-02-11 00:00:00', 5900.00, '河南省郑州市东风路15号', 1);
INSERT INTO `emp` VALUES (6, '王萌萌', '女', '1986-12-30 00:00:00', 5000.00, '河南省开封市五一路14号', 2);
INSERT INTO `emp` VALUES (7, '王大光', '男', '1988-11-08 00:00:00', 6200.00, '河南省开封市八一路124号', 2);
INSERT INTO `emp` VALUES (8, '王小明', '男', '1998-01-03 00:00:00', 4800.00, '河南省驻马店市雪松路128号', 2);
INSERT INTO `emp` VALUES (9, '王娜娜', '女', '1994-03-05 00:00:00', 5200.00, '河南省驻马店市车站路2号', 2);
INSERT INTO `emp` VALUES (10, '刘云飞', '男', '1992-08-13 00:00:00', 6800.00, '河南省南阳市民生路255号', 3);
INSERT INTO `emp` VALUES (11, '张陆军', '男', '1991-09-06 00:00:00', 6200.00, '河南省南阳市张仲景路14号', 3);

SET FOREIGN_KEY_CHECKS = 1;
