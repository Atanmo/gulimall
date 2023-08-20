/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 80100 (8.1.0)
 Source Host           : localhost:3306
 Source Schema         : gulimall_admin

 Target Server Type    : MySQL
 Target Server Version : 80100 (8.1.0)
 File Encoding         : 65001

 Date: 20/08/2023 16:36:45
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for QRTZ_BLOB_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;
CREATE TABLE `QRTZ_BLOB_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_BLOB_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of QRTZ_BLOB_TRIGGERS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_CALENDARS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CALENDARS`;
CREATE TABLE `QRTZ_CALENDARS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of QRTZ_CALENDARS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_CRON_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;
CREATE TABLE `QRTZ_CRON_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_CRON_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of QRTZ_CRON_TRIGGERS
-- ----------------------------
BEGIN;
INSERT INTO `QRTZ_CRON_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`, `CRON_EXPRESSION`, `TIME_ZONE_ID`) VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', '0 0/30 * * * ?', 'Asia/Shanghai');
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_FIRED_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;
CREATE TABLE `QRTZ_FIRED_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint NOT NULL,
  `SCHED_TIME` bigint NOT NULL,
  `PRIORITY` int NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`),
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of QRTZ_FIRED_TRIGGERS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_JOB_DETAILS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;
CREATE TABLE `QRTZ_JOB_DETAILS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of QRTZ_JOB_DETAILS
-- ----------------------------
BEGIN;
INSERT INTO `QRTZ_JOB_DETAILS` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`, `DESCRIPTION`, `JOB_CLASS_NAME`, `IS_DURABLE`, `IS_NONCONCURRENT`, `IS_UPDATE_DATA`, `REQUESTS_RECOVERY`, `JOB_DATA`) VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', NULL, 'io.renren.modules.job.utils.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372002E696F2E72656E72656E2E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200074C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000018A0AF28AB07874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000174000672656E72656E74000CE58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000007800);
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_LOCKS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_LOCKS`;
CREATE TABLE `QRTZ_LOCKS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of QRTZ_LOCKS
-- ----------------------------
BEGIN;
INSERT INTO `QRTZ_LOCKS` (`SCHED_NAME`, `LOCK_NAME`) VALUES ('RenrenScheduler', 'STATE_ACCESS');
INSERT INTO `QRTZ_LOCKS` (`SCHED_NAME`, `LOCK_NAME`) VALUES ('RenrenScheduler', 'TRIGGER_ACCESS');
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;
CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_SCHEDULER_STATE
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
CREATE TABLE `QRTZ_SCHEDULER_STATE` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint NOT NULL,
  `CHECKIN_INTERVAL` bigint NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of QRTZ_SCHEDULER_STATE
-- ----------------------------
BEGIN;
INSERT INTO `QRTZ_SCHEDULER_STATE` (`SCHED_NAME`, `INSTANCE_NAME`, `LAST_CHECKIN_TIME`, `CHECKIN_INTERVAL`) VALUES ('RenrenScheduler', 'wuweideMacBook-Pro.local1692502527440', 1692520602628, 15000);
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_SIMPLE_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPLE_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint NOT NULL,
  `REPEAT_INTERVAL` bigint NOT NULL,
  `TIMES_TRIGGERED` bigint NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of QRTZ_SIMPLE_TRIGGERS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_SIMPROP_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPROP_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int DEFAULT NULL,
  `INT_PROP_2` int DEFAULT NULL,
  `LONG_PROP_1` bigint DEFAULT NULL,
  `LONG_PROP_2` bigint DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of QRTZ_SIMPROP_TRIGGERS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;
CREATE TABLE `QRTZ_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint DEFAULT NULL,
  `PREV_FIRE_TIME` bigint DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint NOT NULL,
  `END_TIME` bigint DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`),
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  CONSTRAINT `QRTZ_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `QRTZ_JOB_DETAILS` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of QRTZ_TRIGGERS
-- ----------------------------
BEGIN;
INSERT INTO `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`, `JOB_NAME`, `JOB_GROUP`, `DESCRIPTION`, `NEXT_FIRE_TIME`, `PREV_FIRE_TIME`, `PRIORITY`, `TRIGGER_STATE`, `TRIGGER_TYPE`, `START_TIME`, `END_TIME`, `CALENDAR_NAME`, `MISFIRE_INSTR`, `JOB_DATA`) VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', 'TASK_1', 'DEFAULT', NULL, 1692522000000, 1692520200000, 5, 'WAITING', 'CRON', 1692430161000, 0, NULL, 2, 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372002E696F2E72656E72656E2E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200074C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000018A0AF28AB07874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000174000672656E72656E74000CE58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000007800);
COMMIT;

-- ----------------------------
-- Table structure for schedule_job
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job`;
CREATE TABLE `schedule_job` (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `cron_expression` varchar(100) DEFAULT NULL COMMENT 'cron表达式',
  `status` tinyint DEFAULT NULL COMMENT '任务状态  0：正常  1：暂停',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='定时任务';

-- ----------------------------
-- Records of schedule_job
-- ----------------------------
BEGIN;
INSERT INTO `schedule_job` (`job_id`, `bean_name`, `params`, `cron_expression`, `status`, `remark`, `create_time`) VALUES (1, 'testTask', 'renren', '0 0/30 * * * ?', 0, '参数测试', '2023-08-19 07:19:42');
COMMIT;

-- ----------------------------
-- Table structure for schedule_job_log
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job_log`;
CREATE TABLE `schedule_job_log` (
  `log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
  `job_id` bigint NOT NULL COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `status` tinyint NOT NULL COMMENT '任务状态    0：成功    1：失败',
  `error` varchar(2000) DEFAULT NULL COMMENT '失败信息',
  `times` int NOT NULL COMMENT '耗时(单位：毫秒)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`log_id`),
  KEY `job_id` (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='定时任务日志';

-- ----------------------------
-- Records of schedule_job_log
-- ----------------------------
BEGIN;
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (1, 1, 'testTask', 'renren', 0, NULL, 1, '2023-08-19 15:30:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (2, 1, 'testTask', 'renren', 0, NULL, 4, '2023-08-19 16:30:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (3, 1, 'testTask', 'renren', 0, NULL, 2, '2023-08-19 17:00:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (4, 1, 'testTask', 'renren', 0, NULL, 0, '2023-08-19 17:30:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (5, 1, 'testTask', 'renren', 0, NULL, 0, '2023-08-19 18:00:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (6, 1, 'testTask', 'renren', 0, NULL, 1, '2023-08-19 18:30:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (7, 1, 'testTask', 'renren', 0, NULL, 1, '2023-08-20 08:00:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (8, 1, 'testTask', 'renren', 0, NULL, 0, '2023-08-20 08:30:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (9, 1, 'testTask', 'renren', 0, NULL, 2, '2023-08-20 09:30:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (10, 1, 'testTask', 'renren', 0, NULL, 5, '2023-08-20 10:00:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (11, 1, 'testTask', 'renren', 0, NULL, 1, '2023-08-20 10:30:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (12, 1, 'testTask', 'renren', 0, NULL, 1, '2023-08-20 11:00:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (13, 1, 'testTask', 'renren', 0, NULL, 0, '2023-08-20 11:30:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (14, 1, 'testTask', 'renren', 0, NULL, 2, '2023-08-20 12:00:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (15, 1, 'testTask', 'renren', 0, NULL, 1, '2023-08-20 14:30:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (16, 1, 'testTask', 'renren', 0, NULL, 2, '2023-08-20 15:00:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (17, 1, 'testTask', 'renren', 0, NULL, 1, '2023-08-20 15:30:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (18, 1, 'testTask', 'renren', 0, NULL, 1, '2023-08-20 16:00:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (19, 1, 'testTask', 'renren', 0, NULL, 6, '2023-08-20 16:30:00');
COMMIT;

-- ----------------------------
-- Table structure for sys_captcha
-- ----------------------------
DROP TABLE IF EXISTS `sys_captcha`;
CREATE TABLE `sys_captcha` (
  `uuid` char(36) NOT NULL COMMENT 'uuid',
  `code` varchar(6) NOT NULL COMMENT '验证码',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统验证码';

-- ----------------------------
-- Records of sys_captcha
-- ----------------------------
BEGIN;
INSERT INTO `sys_captcha` (`uuid`, `code`, `expire_time`) VALUES ('19cfb646-5f9f-40a9-868d-a8d06a483f42', 'e3bmm', '2023-08-19 15:34:34');
COMMIT;

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `param_key` varchar(50) DEFAULT NULL COMMENT 'key',
  `param_value` varchar(2000) DEFAULT NULL COMMENT 'value',
  `status` tinyint DEFAULT '1' COMMENT '状态   0：隐藏   1：显示',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `param_key` (`param_key`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统配置信息表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
BEGIN;
INSERT INTO `sys_config` (`id`, `param_key`, `param_value`, `status`, `remark`) VALUES (1, 'CLOUD_STORAGE_CONFIG_KEY', '{\"aliyunAccessKeyId\":\"\",\"aliyunAccessKeySecret\":\"\",\"aliyunBucketName\":\"\",\"aliyunDomain\":\"\",\"aliyunEndPoint\":\"\",\"aliyunPrefix\":\"\",\"qcloudBucketName\":\"\",\"qcloudDomain\":\"\",\"qcloudPrefix\":\"\",\"qcloudSecretId\":\"\",\"qcloudSecretKey\":\"\",\"qiniuAccessKey\":\"NrgMfABZxWLo5B-YYSjoE8-AZ1EISdi1Z3ubLOeZ\",\"qiniuBucketName\":\"ios-app\",\"qiniuDomain\":\"http://7xqbwh.dl1.z0.glb.clouddn.com\",\"qiniuPrefix\":\"upload\",\"qiniuSecretKey\":\"uIwJHevMRWU0VLxFvgy0tAcOdGqasdtVlJkdy6vV\",\"type\":1}', 0, '云存储配置信息');
COMMIT;

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) DEFAULT NULL COMMENT '用户操作',
  `method` varchar(200) DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) DEFAULT NULL COMMENT '请求参数',
  `time` bigint NOT NULL COMMENT '执行时长(毫秒)',
  `ip` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统日志';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint NOT NULL AUTO_INCREMENT,
  `parent_id` bigint DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `order_num` int DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='菜单管理';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (1, 0, '系统管理', NULL, NULL, 0, 'system', 0);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (2, 1, '管理员列表', 'sys/user', NULL, 1, 'admin', 1);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (3, 1, '角色管理', 'sys/role', NULL, 1, 'role', 2);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (4, 1, '菜单管理', 'sys/menu', NULL, 1, 'menu', 3);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (5, 1, 'SQL监控', 'http://localhost:8080/renren-fast/druid/sql.html', NULL, 1, 'sql', 4);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (6, 1, '定时任务', 'job/schedule', NULL, 1, 'job', 5);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (7, 6, '查看', NULL, 'sys:schedule:list,sys:schedule:info', 2, NULL, 0);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (8, 6, '新增', NULL, 'sys:schedule:save', 2, NULL, 0);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (9, 6, '修改', NULL, 'sys:schedule:update', 2, NULL, 0);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (10, 6, '删除', NULL, 'sys:schedule:delete', 2, NULL, 0);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (11, 6, '暂停', NULL, 'sys:schedule:pause', 2, NULL, 0);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (12, 6, '恢复', NULL, 'sys:schedule:resume', 2, NULL, 0);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (13, 6, '立即执行', NULL, 'sys:schedule:run', 2, NULL, 0);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (14, 6, '日志列表', NULL, 'sys:schedule:log', 2, NULL, 0);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (15, 2, '查看', NULL, 'sys:user:list,sys:user:info', 2, NULL, 0);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (16, 2, '新增', NULL, 'sys:user:save,sys:role:select', 2, NULL, 0);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (17, 2, '修改', NULL, 'sys:user:update,sys:role:select', 2, NULL, 0);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (18, 2, '删除', NULL, 'sys:user:delete', 2, NULL, 0);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (19, 3, '查看', NULL, 'sys:role:list,sys:role:info', 2, NULL, 0);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (20, 3, '新增', NULL, 'sys:role:save,sys:menu:list', 2, NULL, 0);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (21, 3, '修改', NULL, 'sys:role:update,sys:menu:list', 2, NULL, 0);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (22, 3, '删除', NULL, 'sys:role:delete', 2, NULL, 0);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (23, 4, '查看', NULL, 'sys:menu:list,sys:menu:info', 2, NULL, 0);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (24, 4, '新增', NULL, 'sys:menu:save,sys:menu:select', 2, NULL, 0);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (25, 4, '修改', NULL, 'sys:menu:update,sys:menu:select', 2, NULL, 0);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (26, 4, '删除', NULL, 'sys:menu:delete', 2, NULL, 0);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (27, 1, '参数管理', 'sys/config', 'sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete', 1, 'config', 6);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (29, 1, '系统日志', 'sys/log', 'sys:log:list', 1, 'log', 7);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (30, 1, '文件上传', 'oss/oss', 'sys:oss:all', 1, 'oss', 6);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (31, 0, '商品系统', '', '', 0, 'editor', 0);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (32, 31, '分类维护', 'product/category', '', 1, 'menu', 0);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (34, 31, '品牌管理', 'product/brand', '', 1, 'editor', 0);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (37, 31, '平台属性', '', '', 0, 'system', 0);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (38, 37, '属性分组', 'product/attrgroup', '', 1, 'tubiao', 0);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (39, 37, '规格参数', 'product/baseattr', '', 1, 'log', 0);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (40, 37, '销售属性', 'product/saleattr', '', 1, 'zonghe', 0);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (41, 31, '商品维护', 'product/spu', '', 0, 'zonghe', 0);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (42, 0, '优惠营销', '', '', 0, 'mudedi', 0);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (43, 0, '库存系统', '', '', 0, 'shouye', 0);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (44, 0, '订单系统', '', '', 0, 'config', 0);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (45, 0, '用户系统', '', '', 0, 'admin', 0);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (46, 0, '内容管理', '', '', 0, 'sousuo', 0);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (47, 42, '优惠券管理', 'coupon/coupon', '', 1, 'zhedie', 0);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (48, 42, '发放记录', 'coupon/history', '', 1, 'sql', 0);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (49, 42, '专题活动', 'coupon/subject', '', 1, 'tixing', 0);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (50, 42, '秒杀活动', 'coupon/seckill', '', 1, 'daohang', 0);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (51, 42, '积分维护', 'coupon/bounds', '', 1, 'geren', 0);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (52, 42, '满减折扣', 'coupon/full', '', 1, 'shoucang', 0);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (53, 43, '仓库维护', 'ware/wareinfo', '', 1, 'shouye', 0);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (54, 43, '库存工作单', 'ware/task', '', 1, 'log', 0);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (55, 43, '商品库存', 'ware/sku', '', 1, 'jiesuo', 0);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (56, 44, '订单查询', 'order/order', '', 1, 'zhedie', 0);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (57, 44, '退货单处理', 'order/return', '', 1, 'shanchu', 0);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (58, 44, '等级规则', 'order/settings', '', 1, 'system', 0);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (59, 44, '支付流水查询', 'order/payment', '', 1, 'job', 0);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (60, 44, '退款流水查询', 'order/refund', '', 1, 'mudedi', 0);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (61, 45, '会员列表', 'member/member', '', 1, 'geren', 0);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (62, 45, '会员等级', 'member/level', '', 1, 'tubiao', 0);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (63, 45, '积分变化', 'member/growth', '', 1, 'bianji', 0);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (64, 45, '统计信息', 'member/statistics', '', 1, 'sql', 0);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (65, 46, '首页推荐', 'content/index', '', 1, 'shouye', 0);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (66, 46, '分类热门', 'content/category', '', 1, 'zhedie', 0);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (67, 46, '评论管理', 'content/comments', '', 1, 'pinglun', 0);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (68, 41, 'spu管理', 'product/spu', '', 1, 'config', 0);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (69, 41, '发布商品', 'product/spuadd', '', 1, 'bianji', 0);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (70, 43, '采购单维护', '', '', 0, 'tubiao', 0);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (71, 70, '采购需求', 'ware/purchaseitem', '', 1, 'editor', 0);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (72, 70, '采购单', 'ware/purchase', '', 1, 'menu', 0);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (73, 41, '商品管理', 'product/manager', '', 1, 'zonghe', 0);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (74, 42, '会员价格', 'coupon/memberprice', '', 1, 'admin', 0);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (75, 42, '每日秒杀', 'coupon/seckillsession', '', 1, 'job', 0);
COMMIT;

-- ----------------------------
-- Table structure for sys_oss
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss`;
CREATE TABLE `sys_oss` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `url` varchar(200) DEFAULT NULL COMMENT 'URL地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='文件上传';

-- ----------------------------
-- Records of sys_oss
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `create_user_id` bigint DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `role_id` bigint DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色与菜单对应关系';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `salt` varchar(20) DEFAULT NULL COMMENT '盐',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `status` tinyint DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
  `create_user_id` bigint DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统用户';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` (`user_id`, `username`, `password`, `salt`, `email`, `mobile`, `status`, `create_user_id`, `create_time`) VALUES (1, 'admin', '9ec9750e709431dad22365cabc5c625482e574c74adaebba7dd02f1129e4ce1d', 'YzcmCZNvbXocrsz9dm8e', 'root@renren.io', '13612345678', 1, 1, '2016-11-11 11:11:11');
COMMIT;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户与角色对应关系';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_user_token
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_token`;
CREATE TABLE `sys_user_token` (
  `user_id` bigint NOT NULL,
  `token` varchar(100) NOT NULL COMMENT 'token',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统用户Token';

-- ----------------------------
-- Records of sys_user_token
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_token` (`user_id`, `token`, `expire_time`, `update_time`) VALUES (1, '55020ea85e79ed354e5efdbba869f279', '2023-08-20 21:12:01', '2023-08-20 09:12:01');
COMMIT;

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `mobile` varchar(20) NOT NULL COMMENT '手机号',
  `password` varchar(64) DEFAULT NULL COMMENT '密码',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户';

-- ----------------------------
-- Records of tb_user
-- ----------------------------
BEGIN;
INSERT INTO `tb_user` (`user_id`, `username`, `mobile`, `password`, `create_time`) VALUES (1, 'mark', '13612345678', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '2017-03-23 22:37:41');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
