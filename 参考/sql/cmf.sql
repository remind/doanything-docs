/*
Navicat MySQL Data Transfer

Source Server         : qa-bj连接
Source Server Version : 50722
Source Host           : 10.100.4.211:3306
Source Database       : cmf

Target Server Type    : MYSQL
Target Server Version : 50722
File Encoding         : 65001

Date: 2020-10-22 16:07:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cmf.tt_weixin_auth
-- ----------------------------
DROP TABLE IF EXISTS `cmf.tt_weixin_auth`;
CREATE TABLE "cmf.tt_weixin_auth" (
  "id" int(11) NOT NULL AUTO_INCREMENT,
  "contract_code" varchar(120) DEFAULT NULL COMMENT '签约协议号',
  "plan_id" varchar(20) DEFAULT NULL COMMENT '模板id',
  "mch_id" varchar(20) DEFAULT NULL COMMENT '商户号',
  "member_id" varchar(32) NOT NULL COMMENT '用户id',
  "fund_channel_code" varchar(64) NOT NULL COMMENT '渠道编号',
  "request_no" varchar(120) NOT NULL COMMENT '请求编号',
  "ic_card_no" varchar(32) DEFAULT NULL COMMENT '身份证号码',
  "real_name" varchar(64) DEFAULT NULL COMMENT '姓名',
  "mobile" varchar(45) DEFAULT NULL COMMENT '电话号码',
  "expire_time" datetime DEFAULT NULL,
  "create_time" datetime NOT NULL,
  "update_time" datetime DEFAULT NULL,
  "status" varchar(20) NOT NULL DEFAULT 'WAIT' COMMENT '状态,SUCCESS成功,WAIT处理中,FAIL失败',
  "agree_no" varchar(120) DEFAULT NULL COMMENT '签约号',
  "extension" varchar(900) DEFAULT NULL COMMENT '扩展信息',
  PRIMARY KEY ("id"),
  UNIQUE KEY "UNIQUE_TT_WX_AU" ("member_id","fund_channel_code") USING BTREE,
  UNIQUE KEY "UNIQUE_TT_WX_AU_RESQ" ("request_no") USING BTREE,
  KEY "INDEX_MERCHANT_ID" ("member_id") USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for moon_user
-- ----------------------------
DROP TABLE IF EXISTS `moon_user`;
CREATE TABLE "moon_user" (
  "id" varchar(32) NOT NULL,
  "username" varchar(255) NOT NULL,
  "nickname" varchar(255) DEFAULT NULL,
  "password" varchar(255) DEFAULT NULL,
  PRIMARY KEY ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tc_daemon_task_trigger
-- ----------------------------
DROP TABLE IF EXISTS `tc_daemon_task_trigger`;
CREATE TABLE "tc_daemon_task_trigger" (
  "TRIGGER_ID" bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键seq:SEQ_DAEMON_TASK_TRIGGER',
  "DESCRIPTION" varchar(64) DEFAULT NULL COMMENT '描述',
  "TASK_TYPE" varchar(64) DEFAULT NULL COMMENT '任务类型',
  "CRON_EXPRESSION" varchar(32) DEFAULT NULL COMMENT '定时表达式',
  "GMT_START" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '开始时间',
  "GMT_END" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '结束时间',
  "GMT_PREVIOUS_FIRE" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '上次执行时间',
  "GMT_NEXT_FIRE" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '下次执行时间',
  "STATUS" char(1) DEFAULT NULL COMMENT '状态：Y已启用；N未启用；P暂停',
  "EXECUTE_STATUS" char(1) DEFAULT NULL COMMENT '执行状态：P执行中；F执行结束；',
  "CONCURRENT_TAG" char(1) DEFAULT NULL COMMENT '并发标志：Y-需要并发控制；N-不需要并发控制',
  "GMT_CREATE" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  "GMT_MODIFIED" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后修改时间',
  "MEMO" varchar(128) DEFAULT NULL COMMENT '备注',
  "COMMON_RATIO" smallint(2) DEFAULT NULL,
  "MAX_AUTO_INK" smallint(2) DEFAULT NULL,
  "BALANCING_ID" bigint(11) DEFAULT NULL,
  "MACHINE_IP" varchar(256) DEFAULT NULL,
  "MACHINE_HOST" varchar(4089) DEFAULT NULL,
  "REDO_MARK" char(1) DEFAULT NULL,
  "TARGET_IDENT" varchar(64) DEFAULT NULL,
  PRIMARY KEY ("TRIGGER_ID"),
  KEY "PK_TC_DAEMON_TASK_TRIGGER" ("TRIGGER_ID"),
  KEY "IDX_DAEMON_TASK_TRIGGER_STATUS" ("TRIGGER_ID","EXECUTE_STATUS")
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COMMENT='定时任务触发器';

-- ----------------------------
-- Table structure for tc_daemon_task_trigger_copy
-- ----------------------------
DROP TABLE IF EXISTS `tc_daemon_task_trigger_copy`;
CREATE TABLE "tc_daemon_task_trigger_copy" (
  "TRIGGER_ID" bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键seq:SEQ_DAEMON_TASK_TRIGGER',
  "DESCRIPTION" varchar(64) DEFAULT NULL COMMENT '描述',
  "TASK_TYPE" varchar(64) DEFAULT NULL COMMENT '任务类型',
  "CRON_EXPRESSION" varchar(32) DEFAULT NULL COMMENT '定时表达式',
  "GMT_START" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '开始时间',
  "GMT_END" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '结束时间',
  "GMT_PREVIOUS_FIRE" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '上次执行时间',
  "GMT_NEXT_FIRE" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '下次执行时间',
  "STATUS" char(1) DEFAULT NULL COMMENT '状态：Y已启用；N未启用；P暂停',
  "EXECUTE_STATUS" char(1) DEFAULT NULL COMMENT '执行状态：P执行中；F执行结束；',
  "CONCURRENT_TAG" char(1) DEFAULT NULL COMMENT '并发标志：Y-需要并发控制；N-不需要并发控制',
  "GMT_CREATE" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  "GMT_MODIFIED" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后修改时间',
  "MEMO" varchar(128) DEFAULT NULL COMMENT '备注',
  "COMMON_RATIO" smallint(2) DEFAULT NULL,
  "MAX_AUTO_INK" smallint(2) DEFAULT NULL,
  "BALANCING_ID" bigint(11) DEFAULT NULL,
  "MACHINE_IP" varchar(256) DEFAULT NULL,
  "MACHINE_HOST" varchar(4089) DEFAULT NULL,
  "REDO_MARK" char(1) DEFAULT NULL,
  "TARGET_IDENT" varchar(64) DEFAULT NULL,
  PRIMARY KEY ("TRIGGER_ID"),
  KEY "PK_TC_DAEMON_TASK_TRIGGER" ("TRIGGER_ID"),
  KEY "IDX_DAEMON_TASK_TRIGGER_STATUS" ("TRIGGER_ID","EXECUTE_STATUS")
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COMMENT='定时任务触发器';

-- ----------------------------
-- Table structure for tc_scheduling_task_balancing
-- ----------------------------
DROP TABLE IF EXISTS `tc_scheduling_task_balancing`;
CREATE TABLE "tc_scheduling_task_balancing" (
  "ID" bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  "TASK_NAME" varchar(64) DEFAULT NULL COMMENT '任务名称',
  "TASK_DESCRIPTION" varchar(64) DEFAULT NULL COMMENT '任务描述',
  "REDUCE_SIZE" bigint(10) DEFAULT NULL COMMENT '任务分解大小',
  "REDUCE_MODE" char(1) DEFAULT NULL COMMENT '分解方式,F（fore）预先的；T(temp)临时的',
  "TASK_FAILURE" bigint(10) DEFAULT NULL COMMENT '任务失效时间,即总任务执行失败时间,单位分钟',
  "REDUCE_FAILURE" bigint(10) DEFAULT NULL COMMENT '分解失效时间,即分解后的任务执行失败时间,单位分钟',
  "GMT_CREATE" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  "GMT_MODIFIED" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后修改时间',
  "MEMO" varchar(128) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY ("ID")
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE "test" (
  "RULESET_ID" bigint(8) DEFAULT NULL,
  "RULE_TABLE" varchar(100) DEFAULT NULL,
  "RULE_VALUE" text,
  "INSERT_DATE" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "SQL_QUERY" varchar(4000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tl_daemon_task_log
-- ----------------------------
DROP TABLE IF EXISTS `tl_daemon_task_log`;
CREATE TABLE "tl_daemon_task_log" (
  "TASK_LOG_ID" bigint(15) NOT NULL AUTO_INCREMENT COMMENT 'SEQ:SEQ_DAEMON_TASK_LOG',
  "TRIGGER_ID" bigint(11) DEFAULT NULL,
  "DESCRIPTION" varchar(64) DEFAULT NULL COMMENT '描述',
  "GMT_NEXT_FIRE" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "MACHINE_NAME" varchar(64) DEFAULT NULL,
  "MACHINE_IP" varchar(32) DEFAULT NULL COMMENT '机器IP',
  "GMT_CREATE" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  "MEMO" varchar(128) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY ("TASK_LOG_ID"),
  KEY "IDX_DTL_TRIGGER_ID" ("TRIGGER_ID")
) ENGINE=InnoDB AUTO_INCREMENT=23813972 DEFAULT CHARSET=utf8 COMMENT='任务执行日志';

-- ----------------------------
-- Table structure for tl_daemon_task_log_202004
-- ----------------------------
DROP TABLE IF EXISTS `tl_daemon_task_log_202004`;
CREATE TABLE "tl_daemon_task_log_202004" (
  "TASK_LOG_ID" bigint(15) NOT NULL AUTO_INCREMENT COMMENT 'SEQ:SEQ_DAEMON_TASK_LOG',
  "TRIGGER_ID" bigint(11) DEFAULT NULL,
  "DESCRIPTION" varchar(64) DEFAULT NULL COMMENT '描述',
  "GMT_NEXT_FIRE" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "MACHINE_NAME" varchar(64) DEFAULT NULL,
  "MACHINE_IP" varchar(32) DEFAULT NULL COMMENT '机器IP',
  "GMT_CREATE" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  "MEMO" varchar(128) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY ("TASK_LOG_ID"),
  KEY "IDX_DTL_TRIGGER_ID" ("TRIGGER_ID")
) ENGINE=InnoDB AUTO_INCREMENT=22983956 DEFAULT CHARSET=utf8 COMMENT='任务执行日志';

-- ----------------------------
-- Table structure for tl_inst_communicate
-- ----------------------------
DROP TABLE IF EXISTS `tl_inst_communicate`;
CREATE TABLE "tl_inst_communicate" (
  "COMMUNICATE_ID" bigint(11) NOT NULL,
  "FUND_CHANNEL_CODE" varchar(16) DEFAULT NULL,
  "API_CODE" varchar(16) DEFAULT NULL,
  "GMT_LAST_PROCESS" datetime DEFAULT NULL,
  PRIMARY KEY ("COMMUNICATE_ID")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='渠道补单信息';

-- ----------------------------
-- Table structure for tl_monitor_log
-- ----------------------------
DROP TABLE IF EXISTS `tl_monitor_log`;
CREATE TABLE "tl_monitor_log" (
  "LOG_ID" bigint(11) NOT NULL AUTO_INCREMENT COMMENT '日志ID',
  "IP_ADDRESS" varchar(32) DEFAULT NULL COMMENT 'IP地址',
  "ORDER_NO" varchar(32) DEFAULT NULL COMMENT '订单号',
  "EVENT_MESSAGE" varchar(256) DEFAULT NULL COMMENT '事件描述',
  "ACTION_ID" varchar(32) DEFAULT NULL COMMENT '监控事件ID',
  "ALERT_LEVEL" varchar(16) DEFAULT NULL COMMENT '报警级别: info, warn, error, fatal',
  "LOG_STATUS" char(1) DEFAULT NULL,
  "EXCEPTION_LOG" varchar(2000) DEFAULT NULL COMMENT '异常日志',
  "MEMO" varchar(256) DEFAULT NULL COMMENT '备注',
  "GMT_CREATE" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  "GMT_MODIFIED" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后修改时间',
  PRIMARY KEY ("LOG_ID"),
  KEY "IDX_TL_MONITOR_LOG_GT" ("GMT_CREATE")
) ENGINE=InnoDB AUTO_INCREMENT=282540 DEFAULT CHARSET=utf8 COMMENT='监控日志';

-- ----------------------------
-- Table structure for tl_monitor_log_202004
-- ----------------------------
DROP TABLE IF EXISTS `tl_monitor_log_202004`;
CREATE TABLE "tl_monitor_log_202004" (
  "LOG_ID" bigint(11) NOT NULL AUTO_INCREMENT COMMENT '日志ID',
  "IP_ADDRESS" varchar(32) DEFAULT NULL COMMENT 'IP地址',
  "ORDER_NO" varchar(32) DEFAULT NULL COMMENT '订单号',
  "EVENT_MESSAGE" varchar(256) DEFAULT NULL COMMENT '事件描述',
  "ACTION_ID" varchar(32) DEFAULT NULL COMMENT '监控事件ID',
  "ALERT_LEVEL" varchar(16) DEFAULT NULL COMMENT '报警级别: info, warn, error, fatal',
  "LOG_STATUS" char(1) DEFAULT NULL,
  "EXCEPTION_LOG" varchar(2000) DEFAULT NULL COMMENT '异常日志',
  "MEMO" varchar(256) DEFAULT NULL COMMENT '备注',
  "GMT_CREATE" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  "GMT_MODIFIED" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后修改时间',
  PRIMARY KEY ("LOG_ID"),
  KEY "IDX_TL_MONITOR_LOG_GT" ("GMT_CREATE")
) ENGINE=InnoDB AUTO_INCREMENT=273815 DEFAULT CHARSET=utf8 COMMENT='监控日志';

-- ----------------------------
-- Table structure for tm_api_amount_limit
-- ----------------------------
DROP TABLE IF EXISTS `tm_api_amount_limit`;
CREATE TABLE "tm_api_amount_limit" (
  "LIMIT_ID" bigint(12) NOT NULL AUTO_INCREMENT,
  "API_CODE" varchar(32) DEFAULT NULL COMMENT '接口编码',
  "DBCR" varchar(32) DEFAULT NULL COMMENT '借贷标识(DC,CC,GC)',
  "INST_CODE" varchar(32) DEFAULT NULL COMMENT '目标机构(ICBC,BOC,...)/(移动,联通,电信)',
  "MIN_AMOUNT" decimal(18,2) DEFAULT NULL COMMENT '最小金额',
  "MAX_AMOUNT" decimal(18,2) DEFAULT NULL COMMENT '最大金额',
  "FACE_LIMIT" varchar(256) DEFAULT NULL COMMENT '允许面值(卡面值10,20,50)',
  "MATCH_CONDITION" varchar(1024) DEFAULT NULL COMMENT '匹配条件',
  "SHOW_EXPRESSION" varchar(2048) DEFAULT NULL COMMENT '展示表达式,velocity格式,转义后用于前端显示',
  "GMT_CREATE" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  "GMT_MODIFIED" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  PRIMARY KEY ("LIMIT_ID")
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8 COMMENT='渠道api限额信息';

-- ----------------------------
-- Table structure for tm_api_no_mode
-- ----------------------------
DROP TABLE IF EXISTS `tm_api_no_mode`;
CREATE TABLE "tm_api_no_mode" (
  "API_NO_MODE_ID" bigint(11) NOT NULL AUTO_INCREMENT COMMENT '模式ID',
  "GEN_PATTERN" varchar(64) DEFAULT NULL COMMENT '生成模式',
  "SEQ_NAME" varchar(32) DEFAULT NULL COMMENT '流水号名称',
  "GMT_CREATE" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  "GMT_MODIFIED" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后修改时间',
  "MEMO" varchar(128) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY ("API_NO_MODE_ID")
) ENGINE=InnoDB AUTO_INCREMENT=216011047 DEFAULT CHARSET=utf8 COMMENT='资金源接口订单号模式';

-- ----------------------------
-- Table structure for tm_api_result_code
-- ----------------------------
DROP TABLE IF EXISTS `tm_api_result_code`;
CREATE TABLE "tm_api_result_code" (
  "API_RESULT_CODE_ID" bigint(11) NOT NULL AUTO_INCREMENT COMMENT '编码ID，SEQ_API_RESULT_CODE',
  "FUND_CHANNEL_CODE" varchar(32) DEFAULT NULL COMMENT '资金源编码',
  "API_TYPE" varchar(16) DEFAULT NULL COMMENT '接口类型',
  "RESULT_CODE" varchar(32) DEFAULT NULL COMMENT '结果编码',
  "RESULT_SUB_CODE" varchar(32) DEFAULT NULL COMMENT '结果子编码',
  "EXPRESSION" varchar(128) DEFAULT NULL COMMENT '判断表达式，作为编码映射的一个补充',
  "DESCRIPTION_TEMPLATE" varchar(256) DEFAULT NULL COMMENT '描述模板，如不为空则优先使用',
  "UNITY_RESULT_CODE" varchar(32) DEFAULT NULL COMMENT '统一结果编码',
  "ORDER_STATUS" char(1) DEFAULT NULL COMMENT '订单状态。S（成功），F（失败），A（处理中），W（未知）',
  "USE_MAPPING" char(1) DEFAULT NULL COMMENT '是否启用映射。Y（启用），N（不启用）',
  "GMT_CREATE" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  "GMT_MODIFIED" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后修改时间',
  "MEMO" varchar(512) DEFAULT NULL COMMENT '备注',
  "RE_ROUTE_ENABLE" char(1) DEFAULT 'N' COMMENT '是否可重路由，Y（可重路由），N（不可）',
  "USER_MESSAGE" varchar(256) DEFAULT NULL COMMENT '提示给用户的信息',
  PRIMARY KEY ("API_RESULT_CODE_ID")
) ENGINE=InnoDB AUTO_INCREMENT=13478 DEFAULT CHARSET=utf8 COMMENT='API结果编码';

-- ----------------------------
-- Table structure for tm_blacklist_member
-- ----------------------------
DROP TABLE IF EXISTS `tm_blacklist_member`;
CREATE TABLE "tm_blacklist_member" (
  "PT_ID" varchar(32) NOT NULL,
  "GMT_CREATE" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ("PT_ID")
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tm_channel_trans_info
-- ----------------------------
DROP TABLE IF EXISTS `tm_channel_trans_info`;
CREATE TABLE "tm_channel_trans_info" (
  "TRANS_ID" bigint(12) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  "FUND_CHANNEL_CODE" varchar(32) DEFAULT NULL COMMENT '资金渠道编码',
  "API_TYPE" varchar(16) DEFAULT NULL COMMENT 'api类型',
  "TRANS_CODE" varchar(16) DEFAULT NULL COMMENT '交易代码',
  "STATUS" char(1) DEFAULT NULL COMMENT '状态',
  "EXTENSION" varchar(512) DEFAULT NULL COMMENT '扩展信息',
  "MEMO" varchar(128) DEFAULT NULL COMMENT '备注',
  "GMT_CREATE" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  "GMT_MODIFIED" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后修改时间',
  PRIMARY KEY ("TRANS_ID")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='渠道交易需要用到的特定信息';

-- ----------------------------
-- Table structure for tm_code_info
-- ----------------------------
DROP TABLE IF EXISTS `tm_code_info`;
CREATE TABLE "tm_code_info" (
  "INFO_ID" bigint(8) NOT NULL AUTO_INCREMENT COMMENT '字典ID',
  "CODE_NAME" varchar(32) DEFAULT NULL COMMENT '字典名称',
  "CODE_KEY" varchar(32) DEFAULT NULL COMMENT '字典标识',
  "VALUE_TYPE" varchar(32) DEFAULT NULL COMMENT '值类型',
  PRIMARY KEY ("INFO_ID")
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tm_code_table
-- ----------------------------
DROP TABLE IF EXISTS `tm_code_table`;
CREATE TABLE "tm_code_table" (
  "CODE_ID" bigint(8) NOT NULL AUTO_INCREMENT COMMENT '字典ID',
  "CODE_KEY" varchar(32) DEFAULT NULL COMMENT '字典标识',
  "ATTR_NAME" varchar(32) DEFAULT NULL COMMENT '属性名称',
  "ATTR_KEY" varchar(32) DEFAULT NULL COMMENT '属性标识',
  "ATTR_VALUE" varchar(32) DEFAULT NULL COMMENT '属性值',
  "ENABLE" char(1) DEFAULT NULL COMMENT '是否使用',
  PRIMARY KEY ("CODE_ID"),
  UNIQUE KEY "IX_CODETABLE_CODEKEY_ATTRKEY" ("CODE_KEY","ATTR_KEY")
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tm_event_notify_config
-- ----------------------------
DROP TABLE IF EXISTS `tm_event_notify_config`;
CREATE TABLE "tm_event_notify_config" (
  "NOTIFY_CONFIG_ID" bigint(11) NOT NULL AUTO_INCREMENT,
  "EVENT" char(2) DEFAULT NULL,
  "PROTOCOL" varchar(10) DEFAULT NULL COMMENT 'MQ-MQ协议, MQ_T- MQ TOPIC方式,HTTP-HTTP回调',
  "TARGET_ADDRESS" varchar(200) DEFAULT NULL COMMENT 'HTTP协议: URI MQ协议:MQNAME',
  "CONDITION" varchar(200) DEFAULT NULL COMMENT '发送条件,暂未实现',
  "MAX_RETRY_TIMES" smallint(2) DEFAULT NULL,
  "GMT_CREATE" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  "GMT_MODIFIED" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后修改时间',
  "MEMO" varchar(128) DEFAULT NULL COMMENT '备注',
  "ENABLE" char(1) DEFAULT NULL COMMENT '是否可用：Y（可用）,N（不可用）',
  PRIMARY KEY ("NOTIFY_CONFIG_ID")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='配置通知的事件,包括通知地址,最大通知次数等';

-- ----------------------------
-- Table structure for tm_event_notify_log
-- ----------------------------
DROP TABLE IF EXISTS `tm_event_notify_log`;
CREATE TABLE "tm_event_notify_log" (
  "NOTIFY_ID" bigint(11) NOT NULL AUTO_INCREMENT,
  "EVENT" char(2) DEFAULT NULL,
  "PROTOCOL" varchar(20) DEFAULT NULL,
  "TARGET_ADDRESS" varchar(200) DEFAULT NULL,
  "MAX_RETRY_TIMES" smallint(2) DEFAULT NULL,
  "RETRY_TIMES" smallint(2) DEFAULT NULL,
  "NOTIFY_BODY" varchar(2000) DEFAULT NULL,
  "NOTIFY_STATUS" char(1) DEFAULT NULL COMMENT 'F-失败,S-成功,P-发送中',
  "MEMO" varchar(128) DEFAULT NULL,
  "GMT_CREATED" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "GMT_MODIFIED" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY ("NOTIFY_ID")
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tm_fund_channel
-- ----------------------------
DROP TABLE IF EXISTS `tm_fund_channel`;
CREATE TABLE "tm_fund_channel" (
  "FUND_CHANNEL_CODE" varchar(32) NOT NULL COMMENT '编码',
  "NAME" varchar(64) DEFAULT NULL COMMENT '名称',
  "DESCRIPTION" varchar(256) DEFAULT NULL COMMENT '描述',
  "INST_CODE" varchar(16) DEFAULT NULL COMMENT '机构代码',
  "BIZ_TYPE" char(1) DEFAULT NULL COMMENT '业务类型：I（入款），O（出款）',
  "PAY_MODE" varchar(16) DEFAULT NULL COMMENT '支付方式，如：网银，卡通，线下，手机充值卡，手机话费，微汇卡，积分。。。',
  "SIGNED_CROP" char(1) DEFAULT NULL COMMENT '签约公司：Y（益充），S（微汇）',
  "STATUS" varchar(16) DEFAULT NULL COMMENT '是否可用：VALID（可用），INVALID（不可用）',
  "VALID_FROM" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "VALID_TO" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  "MAX_AMOUNT" decimal(15,2) DEFAULT NULL,
  "MIN_AMOUNT" decimal(15,2) DEFAULT NULL,
  "EXPECT_ARRIVE_TIME" varchar(16) DEFAULT NULL COMMENT 'T+15M表示15分钟到帐，T+1D表示一天到帐，H小时',
  "GMT_CREATE" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  "GMT_MODIFIED" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后修改时间',
  "MEMO" varchar(128) DEFAULT NULL COMMENT '备注',
  "CHANNEL_MODE" varchar(16) DEFAULT NULL,
  "PRIORITY" smallint(2) DEFAULT NULL COMMENT '此优先级在过滤，优选之后使用',
  "EXTENSION" varchar(1024) DEFAULT NULL COMMENT '扩展参数',
  PRIMARY KEY ("FUND_CHANNEL_CODE"),
  KEY "FUND_CHANNEL_CODE_INDEX" ("FUND_CHANNEL_CODE") USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资金渠道';

-- ----------------------------
-- Table structure for tm_fund_channel_api
-- ----------------------------
DROP TABLE IF EXISTS `tm_fund_channel_api`;
CREATE TABLE "tm_fund_channel_api" (
  "API_CODE" varchar(48) NOT NULL COMMENT '接口代码',
  "FUND_CHANNEL_CODE" varchar(32) DEFAULT NULL COMMENT '资金源编码',
  "API_TYPE" varchar(16) DEFAULT NULL COMMENT '接口类型：SP（单笔支付），BP（批量支付），SQ（单笔查询），BQ（批量查询），SR（单笔退款），BR（批量退款）',
  "API_VERSION" varchar(64) DEFAULT NULL COMMENT '接口版本',
  "API_METHOD" varchar(128) DEFAULT NULL COMMENT '接口方法',
  "API_URI" varchar(128) DEFAULT NULL COMMENT '接口URI',
  "API_PRIORITY" smallint(3) DEFAULT NULL COMMENT '优先级',
  "SECURE" char(1) DEFAULT NULL COMMENT '是否需要密钥证书',
  "MAX_ITEM" bigint(10) DEFAULT NULL COMMENT '最大笔数',
  "COMM_TITLE_TEMPLATE" varchar(64) DEFAULT NULL COMMENT '通信标题模板，可用作文件名模板',
  "COMM_CONTENT_TEMPLATE" varchar(1024) DEFAULT NULL COMMENT '通信内容模板',
  "CHECK_PARSE_SCRIPT" text COMMENT '复核解析脚本',
  "RESULT_PARSE_SCRIPT" text COMMENT '结果解析脚本',
  "NEED_CONFIRM" char(1) DEFAULT NULL COMMENT '是否需要审核：Y（是）；N（否）；',
  "ENABLE" char(1) DEFAULT NULL COMMENT '是否可用：Y（可用），N（不可用）',
  "GMT_CREATE" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  "GMT_MODIFIED" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后修改时间',
  "MEMO" varchar(128) DEFAULT NULL COMMENT '备注',
  "API_NO_MODE_ID" bigint(11) DEFAULT NULL COMMENT '订单号生成模式',
  "API_SECURITY_ID" bigint(11) DEFAULT NULL COMMENT '渠道接口签名，加密方式',
  "CONSUME_TIME" decimal(5,2) DEFAULT NULL COMMENT '渠道耗时，单位小时',
  "FILE_TYPE" varchar(8) DEFAULT NULL COMMENT '文件类型txt，excel',
  "FILE_PATH" varchar(256) DEFAULT NULL COMMENT 'excel文件模板路径',
  "API_NAME" varchar(32) DEFAULT NULL COMMENT 'API名称',
  "NEED_SYNC_GLIDE" char(1) DEFAULT NULL COMMENT 'Y需要同步流水, N不需要同步流水',
  "EXTENSION" varchar(256) DEFAULT NULL,
  PRIMARY KEY ("API_CODE")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资金渠道接口';

-- ----------------------------
-- Table structure for tm_fund_channel_api_param
-- ----------------------------
DROP TABLE IF EXISTS `tm_fund_channel_api_param`;
CREATE TABLE "tm_fund_channel_api_param" (
  "PARAM_ID" bigint(12) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  "API_CODE" varchar(48) DEFAULT NULL COMMENT '接口编码',
  "PARAM_NAME" varchar(32) DEFAULT NULL COMMENT '参数名称',
  "PARAM_CODE_KEY" varchar(32) DEFAULT NULL COMMENT '参数字典标识',
  "PARAM_DESC" varchar(128) DEFAULT NULL COMMENT '参数描述',
  "NULL_ABLE" char(1) DEFAULT NULL COMMENT '是否需要校验',
  "ENABLE" char(1) DEFAULT NULL COMMENT '是否使用',
  "IS_SAVE" char(1) DEFAULT NULL COMMENT '是否需要保存数据',
  "IS_ORGIN" char(1) DEFAULT NULL,
  "SCENE" varchar(12) DEFAULT NULL COMMENT 'IN,入;OUT,出',
  "GMT_CREATE" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  "GMT_MODIFIED" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  "IS_CHANNEL_TRANS" char(1) DEFAULT NULL COMMENT '该信息是否从渠道获取,如招行需要每天更新密钥信息',
  "TRANS_CODE" varchar(16) DEFAULT NULL COMMENT '是用哪个交互编码查询到的数据',
  "EXTENSION" varchar(512) DEFAULT NULL COMMENT '扩展信息',
  PRIMARY KEY ("PARAM_ID")
) ENGINE=InnoDB AUTO_INCREMENT=3023 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tm_fund_channel_ext
-- ----------------------------
DROP TABLE IF EXISTS `tm_fund_channel_ext`;
CREATE TABLE "tm_fund_channel_ext" (
  "EXT_ID" bigint(11) NOT NULL AUTO_INCREMENT COMMENT '扩展ID',
  "FUND_CHANNEL_CODE" varchar(32) DEFAULT NULL COMMENT '资金源编码',
  "ATTR_KEY" varchar(32) DEFAULT NULL COMMENT '属性名',
  "ATTR_VALUE" varchar(2560) DEFAULT NULL COMMENT '属性值',
  "ATTR_TYPE" char(1) DEFAULT NULL COMMENT '属性类型：N（无特殊制定），F（流量）',
  "VALUE_TYPE" varchar(32) DEFAULT NULL COMMENT '值类型',
  "VALUE_SPLIT" char(1) DEFAULT NULL COMMENT '值分隔符，针对有多选属性使用',
  "GMT_CREATE" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  "GMT_MODIFIED" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后修改时间',
  "MEMO" varchar(128) DEFAULT NULL COMMENT '备注',
  "ATTR_CODE_KEY" varchar(32) DEFAULT NULL COMMENT '属性字典标识',
  "API_CODE" varchar(32) DEFAULT NULL COMMENT 'api编码',
  "NEED_MATCH" char(1) DEFAULT NULL COMMENT '是否需要满足VALUE指定',
  "MATCH_TYPE" varchar(32) DEFAULT NULL COMMENT '比较类型',
  PRIMARY KEY ("EXT_ID")
) ENGINE=InnoDB AUTO_INCREMENT=2041 DEFAULT CHARSET=utf8 COMMENT='资金渠道道特性';

-- ----------------------------
-- Table structure for tm_fund_channel_inst
-- ----------------------------
DROP TABLE IF EXISTS `tm_fund_channel_inst`;
CREATE TABLE "tm_fund_channel_inst" (
  "INST_CODE" varchar(16) NOT NULL COMMENT '机构代码',
  "INST_TYPE" varchar(8) DEFAULT NULL COMMENT '机构类型：BANK（银行），EPAY（电子支付公司）',
  "INST_NAME" varchar(32) DEFAULT NULL COMMENT '机构名称',
  "INST_BRANCH_NAME" varchar(64) DEFAULT NULL COMMENT '机构分支名称',
  "BANK_LINE_NO" varchar(32) DEFAULT NULL COMMENT '联行号',
  "AREA_CODE" varchar(16) DEFAULT NULL COMMENT '地区',
  "GMT_CREATE" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  "GMT_MODIFIED" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后修改时间',
  "MEMO" varchar(128) DEFAULT NULL COMMENT '备注',
  "EXTENSION" varchar(1024) DEFAULT NULL,
  "IS_SHARE_AGREE_NO" char(1) DEFAULT 'N' COMMENT 'Y： 协议号共享，N：不共享',
  PRIMARY KEY ("INST_CODE")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='提供资金渠道的机构';

-- ----------------------------
-- Table structure for tm_fund_channel_maintain
-- ----------------------------
DROP TABLE IF EXISTS `tm_fund_channel_maintain`;
CREATE TABLE "tm_fund_channel_maintain" (
  "MAINTAIN_ID" bigint(11) NOT NULL AUTO_INCREMENT COMMENT '维护ID',
  "FUND_CHANNEL_CODE" varchar(32) DEFAULT NULL COMMENT '资金源编码',
  "FUND_CHANNEL_API" varchar(48) DEFAULT NULL COMMENT '资金渠道接口',
  "INST_CODE" varchar(16) DEFAULT NULL COMMENT '机构编码',
  "DESCRIPTION" varchar(128) DEFAULT NULL COMMENT '描述',
  "MAINTAIN_CONTENT" varchar(1024) DEFAULT NULL COMMENT '维护公告',
  "GMT_BEGIN" timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '维护开始时间',
  "GMT_END" timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '维护结束时间',
  "FUND_CHANNEL_BACKUP" varchar(32) DEFAULT NULL COMMENT '备用资金源',
  "GMT_CREATE" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  "GMT_MODIFIED" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后修改时间',
  "MEMO" varchar(128) DEFAULT NULL COMMENT '备注',
  "STATUS" tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '维护期状态，[0:失效, 1:禁用, 2:暂停]',
  "PAUSE_BEGIN" time DEFAULT NULL COMMENT '暂停开始时间',
  "PAUSE_END" time DEFAULT NULL COMMENT '暂停结束时间',
  PRIMARY KEY ("MAINTAIN_ID")
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8 COMMENT='维护期';

-- ----------------------------
-- Table structure for tm_fund_channel_merchant
-- ----------------------------
DROP TABLE IF EXISTS `tm_fund_channel_merchant`;
CREATE TABLE "tm_fund_channel_merchant" (
  "CHANNEL_MERCHANT_NO" bigint(20) NOT NULL AUTO_INCREMENT COMMENT '渠道商户ID',
  "FUND_CHANNEL_NO" varchar(50) DEFAULT NULL COMMENT '渠道编号',
  "MERCHANT_NO" varchar(50) DEFAULT NULL COMMENT '商户编号',
  "MERCHANT_NAME" varchar(256) DEFAULT NULL COMMENT '商户名称',
  "CONFIG_CONTENT" varchar(2048) DEFAULT NULL COMMENT '商户配置信息, 包括商户ID, 秘钥, 证书路径等',
  "DEADLINE" varchar(16) DEFAULT NULL COMMENT '商户过期时间',
  "CHANNEL_STATUS" tinyint(4) NOT NULL DEFAULT '1' COMMENT '渠道状态, {1: 可用; 0: 不可用}',
  "STRATEGY_ID" bigint(20) DEFAULT '-1' COMMENT '策略值',
  "STRATEGY_PARAM" varchar(2048) DEFAULT NULL COMMENT '策略参数',
  "MEMO" varchar(256) DEFAULT NULL COMMENT '备注信息',
  "GMT_CREATE" datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
  "GMT_MODIFIED" datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '记录更新时间',
  "STATUS" tinyint(4) NOT NULL DEFAULT '1' COMMENT '记录状态{1: 记录有效; 0: 记录删除}',
  PRIMARY KEY ("CHANNEL_MERCHANT_NO"),
  UNIQUE KEY "IDX_CNO_MNO" ("FUND_CHANNEL_NO","MERCHANT_NO") USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tm_fund_channel_settle
-- ----------------------------
DROP TABLE IF EXISTS `tm_fund_channel_settle`;
CREATE TABLE "tm_fund_channel_settle" (
  "SETTLE_ID" bigint(11) NOT NULL AUTO_INCREMENT COMMENT '结算ID',
  "FUND_CHANNEL_CODE" varchar(32) DEFAULT NULL COMMENT '资金源编码',
  "CONTRACT_NO" varchar(64) DEFAULT NULL COMMENT '合同号',
  "MERCHANT_NO" varchar(64) DEFAULT NULL COMMENT '商户号',
  "ACCOUNT_NO" varchar(64) DEFAULT NULL COMMENT '结算账号',
  "ACCOUNT_NAME" varchar(128) DEFAULT NULL COMMENT '结算帐户名称',
  "SETTLE_MODE" char(1) DEFAULT NULL COMMENT '结算方式：S（单笔），B（批量）',
  "SETTLE_CYCLE" smallint(3) DEFAULT NULL COMMENT '结算周期，以天为单位的数字',
  "CLEARING_FILE_MODE" char(1) DEFAULT NULL COMMENT '清算文件获取支持模式：N（不支持），F（FTP），O（线上），U（线下）',
  "ENABLE" char(1) DEFAULT NULL COMMENT '是否可用：Y（可用），N（不可用）',
  "GMT_CREATE" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  "GMT_MODIFIED" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后修改时间',
  "MEMO" varchar(128) DEFAULT NULL COMMENT '备注',
  "EXTENSION" varchar(256) DEFAULT NULL,
  PRIMARY KEY ("SETTLE_ID")
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8 COMMENT='资金渠道算信息';

-- ----------------------------
-- Table structure for tm_fund_channel_target_inst
-- ----------------------------
DROP TABLE IF EXISTS `tm_fund_channel_target_inst`;
CREATE TABLE "tm_fund_channel_target_inst" (
  "TARGET_INST_CODE" varchar(16) NOT NULL,
  "SHORT_NAME" varchar(20) DEFAULT NULL,
  "TARGET_INST_NAME" varchar(50) DEFAULT NULL,
  "TARGET_INST_DESC" varchar(256) DEFAULT NULL,
  "ICON_URL" varchar(256) DEFAULT NULL,
  "AMOUNT_LIMIT_DESC" text,
  "GMT_CREATE" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "GMT_MODIFIED" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY ("TARGET_INST_CODE"),
  UNIQUE KEY "INDEX_TARGET_INST_CODE" ("TARGET_INST_CODE")
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tm_heart_monitor
-- ----------------------------
DROP TABLE IF EXISTS `tm_heart_monitor`;
CREATE TABLE "tm_heart_monitor" (
  "MONITOR_ID" bigint(8) NOT NULL,
  "CHANNEL_NAME" varchar(64) DEFAULT NULL,
  "INST_ORDER_ID" bigint(15) DEFAULT NULL,
  "ENABLE" char(1) DEFAULT NULL,
  PRIMARY KEY ("MONITOR_ID")
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tm_inst_archive_template
-- ----------------------------
DROP TABLE IF EXISTS `tm_inst_archive_template`;
CREATE TABLE "tm_inst_archive_template" (
  "ARCHIVE_TEMPLATE_ID" int(5) NOT NULL AUTO_INCREMENT COMMENT '归档模板ID',
  "FUND_CHANNEL_API" varchar(16) DEFAULT NULL COMMENT '资金渠道API',
  "FUND_CHANNEL_CODE" varchar(16) DEFAULT NULL COMMENT '资金渠道编码',
  "MAX_ITEM" bigint(10) DEFAULT NULL COMMENT '最大笔数',
  "MIN_ITEM" bigint(10) DEFAULT NULL COMMENT '最小笔数',
  "TIME_EXPRESSION" varchar(64) DEFAULT NULL COMMENT '时间表达式',
  "CONDITION_EXPRESSION" varchar(2048) DEFAULT NULL COMMENT '条件表达式',
  "GMT_CREATE" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  "GMT_MODIFIED" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后修改时间',
  "MEMO" varchar(128) DEFAULT NULL COMMENT '备注',
  "ARCHIVE_TEMPLATE_KEY" varchar(64) DEFAULT NULL COMMENT '归档模板key 逻辑主键',
  "NEED_WORD_DATE" char(1) DEFAULT NULL,
  "MAX_AMOUNT" decimal(15,2) DEFAULT NULL,
  PRIMARY KEY ("ARCHIVE_TEMPLATE_ID")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='机构归档模板表';

-- ----------------------------
-- Table structure for tm_inst_branch_code
-- ----------------------------
DROP TABLE IF EXISTS `tm_inst_branch_code`;
CREATE TABLE "tm_inst_branch_code" (
  "INST_CODE" varchar(16) DEFAULT NULL COMMENT '机构代码',
  "BRANCH_NAME" varchar(128) DEFAULT NULL COMMENT '分支名称',
  "BRANCH_CODE" varchar(32) NOT NULL COMMENT '分支代码',
  "PARENT_CODE" varchar(32) DEFAULT NULL COMMENT '上级分支代码',
  "GMT_CREATE" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY ("BRANCH_CODE")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='机构分支行编码表';

-- ----------------------------
-- Table structure for tm_pos_terminal
-- ----------------------------
DROP TABLE IF EXISTS `tm_pos_terminal`;
CREATE TABLE "tm_pos_terminal" (
  "TERMINAL_ID" int(6) NOT NULL AUTO_INCREMENT COMMENT '终端ID',
  "POS_CODE" varchar(16) DEFAULT NULL COMMENT '终端代码',
  "POS_KEY" varchar(1024) DEFAULT NULL COMMENT '终端密钥',
  "FUND_CHANNEL_CODE" varchar(32) DEFAULT NULL COMMENT '资金渠道编码',
  "STATUS" char(1) DEFAULT NULL COMMENT '状态。I：已签到；B：已关帐；O：空闲/已签退',
  "ENABLE" char(1) DEFAULT NULL COMMENT '是否可用。Y：是；N：否',
  "SETTLE_TIME_PATTERN" varchar(16) DEFAULT NULL COMMENT '结算时间表达式，cron表达式',
  "SUBMIT_MAX_NUM" int(5) DEFAULT NULL COMMENT '上送最大笔数',
  "GMT_MODIFIED" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后修改时间',
  "GMT_CREATE" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  "MEMO" varchar(128) DEFAULT NULL COMMENT '备注',
  "MERCHANT_NO" varchar(32) DEFAULT NULL,
  PRIMARY KEY ("TERMINAL_ID"),
  UNIQUE KEY "UIDX_PT_PC_FC" ("FUND_CHANNEL_CODE","POS_CODE")
) ENGINE=InnoDB AUTO_INCREMENT=1676 DEFAULT CHARSET=utf8 COMMENT='POS终端信息';

-- ----------------------------
-- Table structure for tm_route_rule_factor
-- ----------------------------
DROP TABLE IF EXISTS `tm_route_rule_factor`;
CREATE TABLE "tm_route_rule_factor" (
  "FACTOR_ID" bigint(11) NOT NULL AUTO_INCREMENT COMMENT '要素ID',
  "FACTOR_NAME" varchar(32) DEFAULT NULL COMMENT '要素名称',
  "FACTOR_WEIGHT" smallint(3) DEFAULT NULL COMMENT '要素权重',
  "EXPRESSION_TYPE" char(1) DEFAULT NULL COMMENT '表达式类型：G（groovy），V（velocity）',
  "EXPRESSION_CONTENT" varchar(1024) DEFAULT NULL COMMENT '评分表达式内容',
  "GMT_CREATE" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  "GMT_MODIFIED" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后修改时间',
  "MEMO" varchar(128) DEFAULT NULL COMMENT '备注',
  "FACTOR_CODE" varchar(32) DEFAULT NULL,
  "FUND_CHANNEL_CODE" varchar(32) DEFAULT NULL,
  "API_CODE" varchar(48) DEFAULT NULL COMMENT 'API编码',
  PRIMARY KEY ("FACTOR_ID")
) ENGINE=InnoDB AUTO_INCREMENT=505 DEFAULT CHARSET=utf8 COMMENT='资金渠道路由要素';

-- ----------------------------
-- Table structure for tm_rule_set
-- ----------------------------
DROP TABLE IF EXISTS `tm_rule_set`;
CREATE TABLE "tm_rule_set" (
  "RULESET_ID" bigint(8) NOT NULL AUTO_INCREMENT,
  "RULE_TABLE" varchar(100) NOT NULL,
  "RULE_VALUE" text,
  "INSERT_DATE" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "SQL_QUERY" varchar(4000) DEFAULT NULL,
  PRIMARY KEY ("RULESET_ID","RULE_TABLE")
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tm_strategy
-- ----------------------------
DROP TABLE IF EXISTS `tm_strategy`;
CREATE TABLE "tm_strategy" (
  "STRATEGY_ID" bigint(20) NOT NULL AUTO_INCREMENT COMMENT '策略ID，自增主键',
  "STRATEGY_TYPE" varchar(64) DEFAULT NULL COMMENT '策略类型,外键关联到tm_strategy_type.STRATEGY_TYPE_CODE',
  "STRATEGY_NAME" varchar(128) DEFAULT NULL COMMENT '策略名称',
  "EXPRESSION_TYPE" varchar(128) DEFAULT NULL COMMENT '表达式类型',
  "EXPRESSION_CONTENT" varchar(2048) DEFAULT NULL COMMENT '表达式内容',
  "EXTENTION" varchar(128) DEFAULT NULL COMMENT '扩展参数',
  "MEMO" varchar(256) DEFAULT NULL COMMENT '备注信息',
  "GMT_CREATE" datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
  "GMT_MODIFIED" datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '记录更新时间',
  "STATUS" tinyint(4) NOT NULL DEFAULT '1' COMMENT '记录状态{1: 记录有效; 0: 记录删除}',
  PRIMARY KEY ("STRATEGY_ID"),
  UNIQUE KEY "INDEX_STRATEGY_NAME" ("STRATEGY_NAME") USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tm_strategy_type
-- ----------------------------
DROP TABLE IF EXISTS `tm_strategy_type`;
CREATE TABLE "tm_strategy_type" (
  "STRATEGY_TYPE_ID" bigint(20) NOT NULL AUTO_INCREMENT COMMENT '表主键, 自增',
  "STRATEGY_TYPE_CODE" varchar(64) NOT NULL COMMENT '策略类型编码',
  "STRATEGY_TYPE_NAME" varchar(128) DEFAULT NULL COMMENT '策略类型名称',
  "MEMO" varchar(256) DEFAULT NULL COMMENT '备注信息',
  "GMT_CREATE" datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
  "GMT_MODIFIED" datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '记录更新时间',
  PRIMARY KEY ("STRATEGY_TYPE_ID"),
  UNIQUE KEY "IDX_STRATEGY_TYPE_CODE" ("STRATEGY_TYPE_CODE") USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tm_sys_configuration
-- ----------------------------
DROP TABLE IF EXISTS `tm_sys_configuration`;
CREATE TABLE "tm_sys_configuration" (
  "ATTR_NAME" varchar(32) NOT NULL COMMENT '配置项Key',
  "ATTR_VALUE" varchar(2048) DEFAULT NULL COMMENT '取值',
  "MEMO" varchar(128) DEFAULT NULL COMMENT '说明',
  "GMT_CREATED" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  "GMT_MODIFIED" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后一次更新时间',
  PRIMARY KEY ("ATTR_NAME")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统配置';

-- ----------------------------
-- Table structure for tm_unity_result_code
-- ----------------------------
DROP TABLE IF EXISTS `tm_unity_result_code`;
CREATE TABLE "tm_unity_result_code" (
  "UNITY_RESULT_CODE" varchar(32) NOT NULL COMMENT '统一结果编码',
  "DESCRIPTION_TEMPLATE" varchar(256) DEFAULT NULL COMMENT '描述模板',
  "GMT_CREATE" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  "GMT_MODIFIED" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后修改时间',
  "MEMO" varchar(128) DEFAULT NULL COMMENT '备注',
  "UNITY_RESULT_CODE_CLASSIFY" varchar(128) DEFAULT NULL COMMENT '统一结果编码分类 :用户因素，三方因素，支付系统因素，白条/内部因素，其他因素',
  PRIMARY KEY ("UNITY_RESULT_CODE")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='统一结果代码';

-- ----------------------------
-- Table structure for tm_vip_acc
-- ----------------------------
DROP TABLE IF EXISTS `tm_vip_acc`;
CREATE TABLE "tm_vip_acc" (
  "ACC_NO" varchar(64) NOT NULL COMMENT '账户',
  PRIMARY KEY ("ACC_NO")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='vip 账户列表';

-- ----------------------------
-- Table structure for tm_work_date
-- ----------------------------
DROP TABLE IF EXISTS `tm_work_date`;
CREATE TABLE "tm_work_date" (
  "DATE_STRING" char(8) NOT NULL COMMENT '日期字符串，yyyymmdd',
  "WORK_FLAG" char(1) DEFAULT NULL COMMENT '工作日标记，Y:工作日，N:非工作日',
  "OPERATOR" varchar(64) DEFAULT NULL COMMENT '操作员',
  "MEMO" varchar(256) DEFAULT NULL COMMENT '备注',
  "GMT_CREATED" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  "GMT_MODIFIED" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后发送时间',
  PRIMARY KEY ("DATE_STRING")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='事件通知记录，目前只记录失败的消息';

-- ----------------------------
-- Table structure for tr_fc_target_inst_relation
-- ----------------------------
DROP TABLE IF EXISTS `tr_fc_target_inst_relation`;
CREATE TABLE "tr_fc_target_inst_relation" (
  "ID" bigint(11) NOT NULL AUTO_INCREMENT,
  "FUND_CHANNEL_CODE" varchar(32) DEFAULT NULL COMMENT '编码',
  "TARGET_INST_CODE" varchar(16) DEFAULT NULL,
  PRIMARY KEY ("ID"),
  KEY "INDEX_TARGET_INST_CODE" ("TARGET_INST_CODE")
) ENGINE=InnoDB AUTO_INCREMENT=42768 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tt_bankcard_auth
-- ----------------------------
DROP TABLE IF EXISTS `tt_bankcard_auth`;
CREATE TABLE "tt_bankcard_auth" (
  "id" int(11) NOT NULL AUTO_INCREMENT,
  "member_id" varchar(64) DEFAULT '',
  "legal_user_id" varchar(64) DEFAULT '',
  "bank_card_no" varchar(32) NOT NULL COMMENT '银行卡号',
  "fund_channel_code" varchar(64) NOT NULL,
  "auth_no" varchar(64) DEFAULT NULL COMMENT '授权编号',
  "ic_card_no" varchar(32) DEFAULT NULL COMMENT '身份证号',
  "real_name" varchar(64) DEFAULT NULL COMMENT '姓名',
  "mobile" varchar(45) DEFAULT NULL COMMENT '电话号码',
  "expire_time" datetime DEFAULT NULL COMMENT '到期时间',
  "gmt_create" datetime DEFAULT NULL COMMENT '创建时间',
  "gmt_modified" datetime DEFAULT NULL COMMENT '修改时间',
  "status" int(11) DEFAULT '0' COMMENT '状态,1成功,2失败,3预签约,5预支付标记',
  "agree_no" varchar(255) DEFAULT NULL COMMENT '签约号',
  PRIMARY KEY ("id"),
  UNIQUE KEY "union_auth_info" ("bank_card_no","fund_channel_code","legal_user_id")
) ENGINE=InnoDB AUTO_INCREMENT=26707 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tt_bankcard_auth_record
-- ----------------------------
DROP TABLE IF EXISTS `tt_bankcard_auth_record`;
CREATE TABLE "tt_bankcard_auth_record" (
  "id" bigint(20) NOT NULL AUTO_INCREMENT,
  "bank_card_no" varchar(32) NOT NULL COMMENT 'é“¶è¡Œå¡å·',
  "fund_channel_code" varchar(64) NOT NULL,
  "ic_card_no" varchar(32) DEFAULT NULL COMMENT 'èº«ä»½è¯å·',
  "real_name" varchar(64) DEFAULT NULL COMMENT 'å§“å',
  "mobile" varchar(45) DEFAULT NULL COMMENT 'ç”µè¯å·ç ',
  "expire_time" datetime DEFAULT NULL COMMENT 'åˆ°æœŸæ—¶é—´',
  "gmt_create" datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  "gmt_modified" datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'ä¿®æ”¹æ—¶é—´',
  "status" varchar(40) DEFAULT 'AUTH_PROCESSING' COMMENT 'çŠ¶æ€',
  "agree_no" varchar(255) DEFAULT NULL COMMENT 'ç­¾çº¦å·',
  "enable" int(2) DEFAULT '1' COMMENT 'åˆ é™¤æ ‡è¯†0ï¼Œå¯ç”¨æ ‡è¯†1',
  "inst_order_no" varchar(64) NOT NULL COMMENT 'ç­¾çº¦è®¢å•å·',
  "cmf_seq_no" varchar(32) NOT NULL COMMENT 'cmfæµæ°´å·',
  "memo" varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨',
  "member_id" varchar(64) DEFAULT '' COMMENT 'é’±åŒ…ç”¨æˆ·id',
  "legal_user_id" varchar(64) DEFAULT '' COMMENT 'åˆè§„userid',
  "return_inst_order_no" varchar(80) DEFAULT NULL COMMENT 'æ¸ é“è¿”å›žè®¢å•å·',
  "extension" varchar(4096) DEFAULT NULL COMMENT '扩展信息',
  PRIMARY KEY ("id"),
  UNIQUE KEY "UK_INSTER_ORDER_NO" ("inst_order_no") USING BTREE,
  KEY "INDEX_BANK_CARD_NO" ("bank_card_no") USING BTREE,
  KEY "INDEX_CMF_SEQ_NO" ("cmf_seq_no") USING BTREE,
  KEY "INDEX_RETURN_INST_ORDER_NO" ("return_inst_order_no") USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23259 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tt_clearing_record
-- ----------------------------
DROP TABLE IF EXISTS `tt_clearing_record`;
CREATE TABLE "tt_clearing_record" (
  "id" bigint(20) NOT NULL AUTO_INCREMENT,
  "channel_code" varchar(32) NOT NULL COMMENT '资金源编码',
  "clearing_type" varchar(8) NOT NULL COMMENT '清分类型：single/batch-单笔/批量',
  "order_no" varchar(64) NOT NULL COMMENT '机构订单号',
  "date_account" varchar(8) NOT NULL COMMENT '账务日期：yyyyMMdd',
  "create_time" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  "update_time" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  "status" varchar(8) NOT NULL DEFAULT 'initial' COMMENT '清分触发状态：initial/submit/over-已触发/已提交/已完结',
  "url" varchar(128) NOT NULL COMMENT '渠道服务地址',
  "amount" decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '本批金额',
  "extension" varchar(4096) NOT NULL DEFAULT '',
  PRIMARY KEY ("id"),
  UNIQUE KEY "tt_clearing_record_order_no_uindex" ("order_no"),
  UNIQUE KEY "tt_clearing_record_pk" ("date_account","channel_code"),
  KEY "tt_clearing_record_create_time_index" ("create_time"),
  KEY "tt_clearing_record_update_time_index" ("update_time")
) ENGINE=InnoDB AUTO_INCREMENT=6635 DEFAULT CHARSET=utf8 COMMENT='清分记录表';

-- ----------------------------
-- Table structure for tt_cmf_order
-- ----------------------------
DROP TABLE IF EXISTS `tt_cmf_order`;
CREATE TABLE "tt_cmf_order" (
  "CMF_SEQ_NO" varchar(32) NOT NULL COMMENT '渠道流水号，yyyymmdd+seq_cmf_order',
  "PAYMENT_SEQ_NO" varchar(32) DEFAULT NULL COMMENT '支付流水号',
  "REQUEST_BATCH_NO" varchar(32) DEFAULT NULL COMMENT '请求批次号',
  "ORDER_TYPE" char(1) DEFAULT NULL COMMENT '订单类型：I（入款），B（退款），O（出款）',
  "PRODUCT_CODE" varchar(32) DEFAULT NULL COMMENT '产品码',
  "PAYMENT_CODE" varchar(32) DEFAULT NULL COMMENT '支付编码',
  "MEMBER_ID" varchar(64) DEFAULT NULL COMMENT '会员ID,现阶段是PT帐号',
  "AMOUNT" decimal(15,2) DEFAULT NULL COMMENT '金额',
  "CURRENCY" char(3) DEFAULT NULL COMMENT '币种',
  "INST_CODE" varchar(32) DEFAULT NULL COMMENT '机构编码',
  "PAYMENT_NOTIFY_STATUS" char(1) DEFAULT NULL COMMENT '支付结果通知状态：S（通知成功），F（通知失败），N（不通知）',
  "COMMUNICATE_TYPE" char(1) DEFAULT NULL COMMENT '通信类型，S（单笔通信），B（批量通信）',
  "STATUS" char(1) DEFAULT NULL COMMENT '状态：A（待处理），C（已撤销），I（处理中），S（成功），F（失败）',
  "OPERATOR" varchar(32) DEFAULT NULL COMMENT '操作员，默认SYSTEM',
  "GMT_SUBMIT" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '提交时间',
  "INST_ORDER_ID" bigint(15) DEFAULT NULL COMMENT '机构订单ID',
  "GMT_CREATE" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  "BIZ_DATE" char(16) DEFAULT NULL COMMENT '业务发生时间',
  "GMT_MODIFIED" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后修改时间',
  "MEMO" varchar(128) DEFAULT NULL COMMENT '备注',
  "CONFIRM_STATUS" char(1) DEFAULT NULL,
  "PAY_MODE" varchar(32) DEFAULT NULL,
  "SUBMIT_BATCH_NO" varchar(32) DEFAULT NULL,
  "ORGI_PAYMENT_SEQ_NO" bigint(15) DEFAULT NULL,
  "EXPECT_TIME" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  "EXTENSION" varchar(4096) DEFAULT NULL COMMENT '扩展信息',
  "SETTLEMENT_ID" varchar(32) DEFAULT NULL COMMENT '结算id',
  "ORGI_SETTLEMENT_ID" varchar(32) DEFAULT NULL COMMENT '原订单结算id',
  PRIMARY KEY ("CMF_SEQ_NO"),
  KEY "IX_TTCMFORDER_GMTCREATE" ("GMT_CREATE"),
  KEY "IX_TTCMFORDER_INSTORDERID" ("INST_ORDER_ID"),
  KEY "IX_TTCMFORDER_PAYMENTSEQNO" ("PAYMENT_SEQ_NO"),
  KEY "IX_TTCMFORDER_SETTLID" ("SETTLEMENT_ID"),
  KEY "IX_TTCMFORDER_PNS" ("PAYMENT_NOTIFY_STATUS")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='渠道支付订单';

-- ----------------------------
-- Table structure for tt_cmf_order_202004
-- ----------------------------
DROP TABLE IF EXISTS `tt_cmf_order_202004`;
CREATE TABLE "tt_cmf_order_202004" (
  "CMF_SEQ_NO" varchar(32) NOT NULL COMMENT '渠道流水号，yyyymmdd+seq_cmf_order',
  "PAYMENT_SEQ_NO" varchar(32) DEFAULT NULL COMMENT '支付流水号',
  "REQUEST_BATCH_NO" varchar(32) DEFAULT NULL COMMENT '请求批次号',
  "ORDER_TYPE" char(1) DEFAULT NULL COMMENT '订单类型：I（入款），B（退款），O（出款）',
  "PRODUCT_CODE" varchar(32) DEFAULT NULL COMMENT '产品码',
  "PAYMENT_CODE" varchar(32) DEFAULT NULL COMMENT '支付编码',
  "MEMBER_ID" varchar(64) DEFAULT NULL COMMENT '会员ID,现阶段是PT帐号',
  "AMOUNT" decimal(15,2) DEFAULT NULL COMMENT '金额',
  "CURRENCY" char(3) DEFAULT NULL COMMENT '币种',
  "INST_CODE" varchar(32) DEFAULT NULL COMMENT '机构编码',
  "PAYMENT_NOTIFY_STATUS" char(1) DEFAULT NULL COMMENT '支付结果通知状态：S（通知成功），F（通知失败），N（不通知）',
  "COMMUNICATE_TYPE" char(1) DEFAULT NULL COMMENT '通信类型，S（单笔通信），B（批量通信）',
  "STATUS" char(1) DEFAULT NULL COMMENT '状态：A（待处理），C（已撤销），I（处理中），S（成功），F（失败）',
  "OPERATOR" varchar(32) DEFAULT NULL COMMENT '操作员，默认SYSTEM',
  "GMT_SUBMIT" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '提交时间',
  "INST_ORDER_ID" bigint(15) DEFAULT NULL COMMENT '机构订单ID',
  "GMT_CREATE" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  "BIZ_DATE" char(16) DEFAULT NULL COMMENT '业务发生时间',
  "GMT_MODIFIED" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后修改时间',
  "MEMO" varchar(128) DEFAULT NULL COMMENT '备注',
  "CONFIRM_STATUS" char(1) DEFAULT NULL,
  "PAY_MODE" varchar(32) DEFAULT NULL,
  "SUBMIT_BATCH_NO" varchar(32) DEFAULT NULL,
  "ORGI_PAYMENT_SEQ_NO" bigint(15) DEFAULT NULL,
  "EXPECT_TIME" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  "EXTENSION" varchar(4096) DEFAULT NULL COMMENT '扩展信息',
  "SETTLEMENT_ID" varchar(32) DEFAULT NULL COMMENT '结算id',
  "ORGI_SETTLEMENT_ID" varchar(32) DEFAULT NULL COMMENT '原订单结算id',
  PRIMARY KEY ("CMF_SEQ_NO"),
  KEY "IX_TTCMFORDER_GMTCREATE" ("GMT_CREATE"),
  KEY "IX_TTCMFORDER_INSTORDERID" ("INST_ORDER_ID"),
  KEY "IX_TTCMFORDER_PAYMENTSEQNO" ("PAYMENT_SEQ_NO"),
  KEY "IX_TTCMFORDER_SETTLID" ("SETTLEMENT_ID"),
  KEY "IX_TTCMFORDER_PNS" ("PAYMENT_NOTIFY_STATUS")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='渠道支付订单';

-- ----------------------------
-- Table structure for tt_cmf_request
-- ----------------------------
DROP TABLE IF EXISTS `tt_cmf_request`;
CREATE TABLE "tt_cmf_request" (
  "PAYMENT_SEQ_NO" varchar(32) NOT NULL COMMENT '支付流水号',
  "CAN_RETRY" char(1) DEFAULT NULL COMMENT '是否允许重试：Y（是），N（否）',
  "GMT_CREATE" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  "GMT_MODIFIED" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后修改时间',
  "SETTLEMENT_ID" varchar(32) NOT NULL DEFAULT '0' COMMENT '结算id',
  PRIMARY KEY ("PAYMENT_SEQ_NO","SETTLEMENT_ID")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMF请求表，用于控制唯一';

-- ----------------------------
-- Table structure for tt_cmf_request_202004
-- ----------------------------
DROP TABLE IF EXISTS `tt_cmf_request_202004`;
CREATE TABLE "tt_cmf_request_202004" (
  "PAYMENT_SEQ_NO" varchar(32) NOT NULL COMMENT '支付流水号',
  "CAN_RETRY" char(1) DEFAULT NULL COMMENT '是否允许重试：Y（是），N（否）',
  "GMT_CREATE" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  "GMT_MODIFIED" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后修改时间',
  "SETTLEMENT_ID" varchar(32) NOT NULL DEFAULT '0' COMMENT '结算id',
  PRIMARY KEY ("PAYMENT_SEQ_NO","SETTLEMENT_ID")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMF请求表，用于控制唯一';

-- ----------------------------
-- Table structure for tt_control_order
-- ----------------------------
DROP TABLE IF EXISTS `tt_control_order`;
CREATE TABLE "tt_control_order" (
  "ORDER_ID" bigint(18) NOT NULL AUTO_INCREMENT COMMENT '流水号',
  "FUND_CHANNEL_CODE" varchar(32) DEFAULT NULL COMMENT '资金渠道编码',
  "PAY_MODE" varchar(32) DEFAULT NULL COMMENT '支付方式',
  "INST_CODE" varchar(32) DEFAULT NULL COMMENT '机构编码',
  "PRODUCT_CODE" varchar(32) DEFAULT NULL COMMENT '产品编码',
  "REQUEST_NO" varchar(32) DEFAULT NULL COMMENT '请求号',
  "REQUEST_TYPE" varchar(8) DEFAULT NULL COMMENT '请求类型',
  "API_TYPE" varchar(16) DEFAULT NULL COMMENT 'API类型',
  "INST_ORDER_NO" varchar(32) DEFAULT NULL COMMENT '机构订单号',
  "PRE_REQUEST_NO" varchar(32) DEFAULT NULL COMMENT '原请求号',
  "AMOUNT" decimal(15,2) DEFAULT NULL COMMENT '金额',
  "STATUS" char(1) DEFAULT NULL COMMENT '状态',
  "RETRY_STATUS" char(1) DEFAULT NULL COMMENT 'F,失败;S,成功;A,等待; ',
  "GMT_CREATE" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  "GMT_MODIFIED" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  "EXTENSION" varchar(4096) DEFAULT NULL COMMENT '扩展信息',
  "MEMO" varchar(128) DEFAULT NULL COMMENT '备注',
  "NOTIFY_STATUS" char(1) DEFAULT NULL COMMENT '通知前端MAS,PE结果状态',
  "SOURCE_CODE" varchar(16) DEFAULT NULL COMMENT 'MAS,PE',
  "COMMUNICATE_STATUS" char(1) DEFAULT NULL COMMENT ' 通讯状态，类型为单笔时：A（等待指令发送），S（指令已经发送），R（数据已经返回），F（指令发送失败）。',
  "FLAG" char(1) DEFAULT NULL COMMENT '用于订单做查询类操作时临时更新标志使用',
  PRIMARY KEY ("ORDER_ID"),
  KEY "IX_TTCONTROLORDER_REQUESTNO" ("REQUEST_NO"),
  KEY "IX_TTCONTROLORDER_INSTORDERNO" ("INST_ORDER_NO"),
  KEY "IX_TTCONTROLORDER_GMTCREATE" ("GMT_CREATE")
) ENGINE=InnoDB AUTO_INCREMENT=1224206 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tt_control_order_202004
-- ----------------------------
DROP TABLE IF EXISTS `tt_control_order_202004`;
CREATE TABLE "tt_control_order_202004" (
  "ORDER_ID" bigint(18) NOT NULL AUTO_INCREMENT COMMENT '流水号',
  "FUND_CHANNEL_CODE" varchar(32) DEFAULT NULL COMMENT '资金渠道编码',
  "PAY_MODE" varchar(32) DEFAULT NULL COMMENT '支付方式',
  "INST_CODE" varchar(32) DEFAULT NULL COMMENT '机构编码',
  "PRODUCT_CODE" varchar(32) DEFAULT NULL COMMENT '产品编码',
  "REQUEST_NO" varchar(32) DEFAULT NULL COMMENT '请求号',
  "REQUEST_TYPE" varchar(8) DEFAULT NULL COMMENT '请求类型',
  "API_TYPE" varchar(16) DEFAULT NULL COMMENT 'API类型',
  "INST_ORDER_NO" varchar(32) DEFAULT NULL COMMENT '机构订单号',
  "PRE_REQUEST_NO" varchar(32) DEFAULT NULL COMMENT '原请求号',
  "AMOUNT" decimal(15,2) DEFAULT NULL COMMENT '金额',
  "STATUS" char(1) DEFAULT NULL COMMENT '状态',
  "RETRY_STATUS" char(1) DEFAULT NULL COMMENT 'F,失败;S,成功;A,等待; ',
  "GMT_CREATE" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  "GMT_MODIFIED" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  "EXTENSION" varchar(4096) DEFAULT NULL COMMENT '扩展信息',
  "MEMO" varchar(128) DEFAULT NULL COMMENT '备注',
  "NOTIFY_STATUS" char(1) DEFAULT NULL COMMENT '通知前端MAS,PE结果状态',
  "SOURCE_CODE" varchar(16) DEFAULT NULL COMMENT 'MAS,PE',
  "COMMUNICATE_STATUS" char(1) DEFAULT NULL COMMENT ' 通讯状态，类型为单笔时：A（等待指令发送），S（指令已经发送），R（数据已经返回），F（指令发送失败）。',
  "FLAG" char(1) DEFAULT NULL COMMENT '用于订单做查询类操作时临时更新标志使用',
  PRIMARY KEY ("ORDER_ID"),
  KEY "IX_TTCONTROLORDER_REQUESTNO" ("REQUEST_NO"),
  KEY "IX_TTCONTROLORDER_INSTORDERNO" ("INST_ORDER_NO"),
  KEY "IX_TTCONTROLORDER_GMTCREATE" ("GMT_CREATE")
) ENGINE=InnoDB AUTO_INCREMENT=549917 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tt_control_order_result
-- ----------------------------
DROP TABLE IF EXISTS `tt_control_order_result`;
CREATE TABLE "tt_control_order_result" (
  "RESULT_ID" bigint(18) NOT NULL AUTO_INCREMENT COMMENT '结果ID',
  "CONTROL_ORDER_ID" bigint(18) DEFAULT NULL COMMENT '流水号',
  "AMOUNT" decimal(18,2) DEFAULT NULL COMMENT '金额',
  "INST_ORDER_NO" varchar(32) DEFAULT NULL COMMENT '机构订单号',
  "INST_RESULT_CODE" varchar(32) DEFAULT NULL COMMENT '统一返回码',
  "API_TYPE" varchar(16) DEFAULT NULL COMMENT 'API类型',
  "STATUS" char(1) DEFAULT NULL COMMENT '状态',
  "API_RESULT_CODE" varchar(32) DEFAULT NULL COMMENT 'API结果编码',
  "API_SUB_RESULT_CODE" varchar(32) DEFAULT NULL COMMENT 'API结果子码',
  "RESULT_MESSAGE" varchar(256) DEFAULT NULL COMMENT '结果信息',
  "MEMO" varchar(256) DEFAULT NULL COMMENT '备注',
  "EXTENSION" varchar(4096) DEFAULT NULL COMMENT '扩展信息',
  "GMT_CREATE" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  "GMT_MODIFIED" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  PRIMARY KEY ("RESULT_ID"),
  KEY "IX_TTCONTROLRESULT_ORDERID" ("CONTROL_ORDER_ID"),
  KEY "IX_TTCONTROLRESULT_INSTORDERNO" ("INST_ORDER_NO"),
  KEY "IX_TTCONTROLRESULT_GMTCREATE" ("GMT_CREATE")
) ENGINE=InnoDB AUTO_INCREMENT=598765 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tt_control_order_result_202004
-- ----------------------------
DROP TABLE IF EXISTS `tt_control_order_result_202004`;
CREATE TABLE "tt_control_order_result_202004" (
  "RESULT_ID" bigint(18) NOT NULL AUTO_INCREMENT COMMENT '结果ID',
  "CONTROL_ORDER_ID" bigint(18) DEFAULT NULL COMMENT '流水号',
  "AMOUNT" decimal(18,2) DEFAULT NULL COMMENT '金额',
  "INST_ORDER_NO" varchar(32) DEFAULT NULL COMMENT '机构订单号',
  "INST_RESULT_CODE" varchar(32) DEFAULT NULL COMMENT '统一返回码',
  "API_TYPE" varchar(16) DEFAULT NULL COMMENT 'API类型',
  "STATUS" char(1) DEFAULT NULL COMMENT '状态',
  "API_RESULT_CODE" varchar(32) DEFAULT NULL COMMENT 'API结果编码',
  "API_SUB_RESULT_CODE" varchar(32) DEFAULT NULL COMMENT 'API结果子码',
  "RESULT_MESSAGE" varchar(256) DEFAULT NULL COMMENT '结果信息',
  "MEMO" varchar(256) DEFAULT NULL COMMENT '备注',
  "EXTENSION" varchar(4096) DEFAULT NULL COMMENT '扩展信息',
  "GMT_CREATE" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  "GMT_MODIFIED" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  PRIMARY KEY ("RESULT_ID"),
  KEY "IX_TTCONTROLRESULT_ORDERID" ("CONTROL_ORDER_ID"),
  KEY "IX_TTCONTROLRESULT_INSTORDERNO" ("INST_ORDER_NO"),
  KEY "IX_TTCONTROLRESULT_GMTCREATE" ("GMT_CREATE")
) ENGINE=InnoDB AUTO_INCREMENT=339347 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tt_distributed_lock
-- ----------------------------
DROP TABLE IF EXISTS `tt_distributed_lock`;
CREATE TABLE "tt_distributed_lock" (
  "LOCK_TICKET" varchar(64) NOT NULL COMMENT '标识,锁的唯一区别码',
  "LOCK_NAME" varchar(64) DEFAULT NULL COMMENT '锁名称',
  "LOCK_TYPE" char(1) DEFAULT NULL COMMENT '锁类型：E排它锁,S同步锁',
  "LOCK_DESC" varchar(100) DEFAULT NULL COMMENT '描述',
  "LOCK_STATUS" char(1) DEFAULT NULL COMMENT '锁状态,E执行中；F执行结束；',
  "GMT_LOCK" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '上锁时间',
  "MACHINE_IP" varchar(32) DEFAULT NULL COMMENT '加锁机器IP',
  "MACHINE_HOST" varchar(64) DEFAULT NULL,
  "GMT_MODIFIED" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后修改时间',
  PRIMARY KEY ("LOCK_TICKET")
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tt_distributed_lock_202004
-- ----------------------------
DROP TABLE IF EXISTS `tt_distributed_lock_202004`;
CREATE TABLE "tt_distributed_lock_202004" (
  "LOCK_TICKET" varchar(64) NOT NULL COMMENT '标识,锁的唯一区别码',
  "LOCK_NAME" varchar(64) DEFAULT NULL COMMENT '锁名称',
  "LOCK_TYPE" char(1) DEFAULT NULL COMMENT '锁类型：E排它锁,S同步锁',
  "LOCK_DESC" varchar(100) DEFAULT NULL COMMENT '描述',
  "LOCK_STATUS" char(1) DEFAULT NULL COMMENT '锁状态,E执行中；F执行结束；',
  "GMT_LOCK" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '上锁时间',
  "MACHINE_IP" varchar(32) DEFAULT NULL COMMENT '加锁机器IP',
  "MACHINE_HOST" varchar(64) DEFAULT NULL,
  "GMT_MODIFIED" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后修改时间',
  PRIMARY KEY ("LOCK_TICKET")
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tt_distributed_sequence
-- ----------------------------
DROP TABLE IF EXISTS `tt_distributed_sequence`;
CREATE TABLE "tt_distributed_sequence" (
  "SEQ_TICKET" varchar(64) NOT NULL COMMENT '标识,一般用表名+记录ID表示',
  "SEQ_NAME" varchar(64) DEFAULT NULL COMMENT '序列名称',
  "SEQ_VAL" bigint(20) DEFAULT NULL COMMENT '序列计数',
  "GMT_CREATE" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  "GMT_MODIFIED" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后修改时间',
  PRIMARY KEY ("SEQ_TICKET")
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tt_ext_clob
-- ----------------------------
DROP TABLE IF EXISTS `tt_ext_clob`;
CREATE TABLE "tt_ext_clob" (
  "EXT_ID" bigint(11) NOT NULL AUTO_INCREMENT COMMENT '扩展ID',
  "RELATED_ID" bigint(15) DEFAULT NULL COMMENT '关联ID',
  "RELATED_TYPE" varchar(16) DEFAULT NULL COMMENT '关联类型',
  "ATTR_KEY" varchar(32) DEFAULT NULL COMMENT '属性名',
  "ATTR_VALUE" text COMMENT '属性值',
  "GMT_CREATE" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY ("EXT_ID"),
  KEY "I_TT_EXT_CLOB_RELATED_ID" ("RELATED_ID")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='大数据扩展表';

-- ----------------------------
-- Table structure for tt_fundin_order
-- ----------------------------
DROP TABLE IF EXISTS `tt_fundin_order`;
CREATE TABLE "tt_fundin_order" (
  "INST_ORDER_ID" bigint(15) NOT NULL COMMENT '机构订单ID',
  "CARD_TYPE" varchar(8) DEFAULT NULL COMMENT '卡类型：CC:贷记卡,DC:借记卡,SCC:准借记卡,PB:存折',
  "PAYER_INST_CODE" varchar(16) DEFAULT NULL COMMENT '付款机构',
  "CONTRACT_NO" varchar(64) DEFAULT NULL COMMENT '协议号,用于一点充',
  "GMT_MODIFIED" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后修改时间',
  "GMT_CREATED" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  PRIMARY KEY ("INST_ORDER_ID")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='入款订单';

-- ----------------------------
-- Table structure for tt_fundin_order2
-- ----------------------------
DROP TABLE IF EXISTS `tt_fundin_order2`;
CREATE TABLE "tt_fundin_order2" (
  "INST_ORDER_ID" bigint(15) NOT NULL COMMENT '机构订单ID',
  "CARD_TYPE" varchar(8) DEFAULT NULL COMMENT '卡类型：CC:贷记卡,DC:借记卡,SCC:准借记卡,PB:存折',
  "PAYER_INST_CODE" varchar(16) DEFAULT NULL COMMENT '付款机构',
  "CONTRACT_NO" varchar(64) DEFAULT NULL COMMENT '协议号,用于一点充',
  "GMT_MODIFIED" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后修改时间',
  "GMT_CREATED" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  PRIMARY KEY ("INST_ORDER_ID")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='入款订单';

-- ----------------------------
-- Table structure for tt_fundin_order_202004
-- ----------------------------
DROP TABLE IF EXISTS `tt_fundin_order_202004`;
CREATE TABLE "tt_fundin_order_202004" (
  "INST_ORDER_ID" bigint(15) NOT NULL COMMENT '机构订单ID',
  "CARD_TYPE" varchar(8) DEFAULT NULL COMMENT '卡类型：CC:贷记卡,DC:借记卡,SCC:准借记卡,PB:存折',
  "PAYER_INST_CODE" varchar(16) DEFAULT NULL COMMENT '付款机构',
  "CONTRACT_NO" varchar(64) DEFAULT NULL COMMENT '协议号,用于一点充',
  "GMT_MODIFIED" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后修改时间',
  "GMT_CREATED" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  PRIMARY KEY ("INST_ORDER_ID")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='入款订单';

-- ----------------------------
-- Table structure for tt_fundout_order
-- ----------------------------
DROP TABLE IF EXISTS `tt_fundout_order`;
CREATE TABLE "tt_fundout_order" (
  "INST_ORDER_ID" bigint(15) NOT NULL COMMENT '机构订单ID',
  "BANK_CODE" varchar(32) DEFAULT NULL COMMENT '开户行ID',
  "BANK_NAME" varchar(32) DEFAULT NULL COMMENT '开户行名称',
  "BANK_BRANCH" varchar(128) DEFAULT NULL COMMENT '支行名称',
  "BANK_BRANCH_CODE" varchar(32) DEFAULT NULL COMMENT '联行号',
  "BANK_PROVINCE" varchar(64) DEFAULT NULL COMMENT '银行所属省份',
  "BANK_CITY" varchar(64) DEFAULT NULL COMMENT '银行所属城市',
  "AREA_CODE" varchar(16) DEFAULT NULL COMMENT '区域代码',
  "ACCOUNT_TYPE" char(1) DEFAULT NULL COMMENT '账户类型：B（公司账户），C（个人账户）',
  "ACCOUNT_NAME" varchar(256) DEFAULT NULL COMMENT '开户人姓名',
  "ACCOUNT_NO" varchar(32) DEFAULT NULL COMMENT '出款账号，储值帐号',
  "CARD_TYPE" varchar(8) DEFAULT NULL COMMENT '卡类型：CC:贷记卡,DC:借记卡,SCC:准借记卡,PB:存折',
  "AGREEMENT_NO" varchar(64) DEFAULT NULL COMMENT '协议号,用于卡通提现',
  "PURPOSE" varchar(128) DEFAULT NULL COMMENT '用途',
  "GMT_MODIFIED" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后修改时间',
  "GMT_CREATE" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  "PT_ID" varchar(32) DEFAULT NULL COMMENT '微汇通行证',
  PRIMARY KEY ("INST_ORDER_ID"),
  KEY "IDX_TT_FUNDOUT_ORDER_ACCTNAME" ("ACCOUNT_NAME"(255),"ACCOUNT_NO"),
  KEY "idx_gmtcreate" ("GMT_CREATE")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='出款订单';

-- ----------------------------
-- Table structure for tt_fundout_order_202004
-- ----------------------------
DROP TABLE IF EXISTS `tt_fundout_order_202004`;
CREATE TABLE "tt_fundout_order_202004" (
  "INST_ORDER_ID" bigint(15) NOT NULL COMMENT '机构订单ID',
  "BANK_CODE" varchar(32) DEFAULT NULL COMMENT '开户行ID',
  "BANK_NAME" varchar(32) DEFAULT NULL COMMENT '开户行名称',
  "BANK_BRANCH" varchar(128) DEFAULT NULL COMMENT '支行名称',
  "BANK_BRANCH_CODE" varchar(32) DEFAULT NULL COMMENT '联行号',
  "BANK_PROVINCE" varchar(64) DEFAULT NULL COMMENT '银行所属省份',
  "BANK_CITY" varchar(64) DEFAULT NULL COMMENT '银行所属城市',
  "AREA_CODE" varchar(16) DEFAULT NULL COMMENT '区域代码',
  "ACCOUNT_TYPE" char(1) DEFAULT NULL COMMENT '账户类型：B（公司账户），C（个人账户）',
  "ACCOUNT_NAME" varchar(256) DEFAULT NULL COMMENT '开户人姓名',
  "ACCOUNT_NO" varchar(32) DEFAULT NULL COMMENT '出款账号，储值帐号',
  "CARD_TYPE" varchar(8) DEFAULT NULL COMMENT '卡类型：CC:贷记卡,DC:借记卡,SCC:准借记卡,PB:存折',
  "AGREEMENT_NO" varchar(64) DEFAULT NULL COMMENT '协议号,用于卡通提现',
  "PURPOSE" varchar(128) DEFAULT NULL COMMENT '用途',
  "GMT_MODIFIED" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后修改时间',
  "GMT_CREATE" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  "PT_ID" varchar(32) DEFAULT NULL COMMENT '微汇通行证',
  PRIMARY KEY ("INST_ORDER_ID"),
  KEY "IDX_TT_FUNDOUT_ORDER_ACCTNAME" ("ACCOUNT_NAME"(255),"ACCOUNT_NO"),
  KEY "idx_gmtcreate" ("GMT_CREATE")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='出款订单';

-- ----------------------------
-- Table structure for tt_inst_batch_order
-- ----------------------------
DROP TABLE IF EXISTS `tt_inst_batch_order`;
CREATE TABLE "tt_inst_batch_order" (
  "ARCHIVE_BATCH_ID" bigint(15) NOT NULL COMMENT '批次ID',
  "ARCHIVE_TEMPLATE_ID" int(5) DEFAULT NULL COMMENT '归档模板ID',
  "ARCHIVE_TYPE" char(1) DEFAULT NULL COMMENT '归档类型：F（文件），M（消息）',
  "ORDER_TYPE" char(1) DEFAULT NULL COMMENT '订单类型：I（入款），B（退款），O（出款）',
  "FUND_CHANNEL_CODE" varchar(36) DEFAULT NULL COMMENT '资金渠道编码',
  "FUND_CHANNEL_API" varchar(48) DEFAULT NULL COMMENT '资金渠道API',
  "PAY_MODE" varchar(16) DEFAULT NULL COMMENT '支付方式：网上银行支付、一点充支付、手机充值卡支付、手机话费支付、手机支付、线下支付（网点支付、邮政支付）、微汇卡支付、积分支付、固话支付、宽带支付、银联快捷支付（银行卡无磁有密支付）',
  "TOTAL_AMOUNT" decimal(15,2) DEFAULT NULL COMMENT '总金额',
  "TOTAL_COUNT" bigint(15) DEFAULT NULL COMMENT '总笔数',
  "CURRENCY" char(3) DEFAULT NULL COMMENT '币种',
  "STATUS" char(1) DEFAULT NULL COMMENT '状态：A：待归档,G--已经归档,S--已经提交,R--已经返回,F--提交失败,P--暂停',
  "IS_LOCKED" char(1) DEFAULT NULL COMMENT '是否已锁定，锁定则不允许重新生成：Y（是），N（否）',
  "FILE_PATH" varchar(128) DEFAULT NULL COMMENT '文件路径',
  "OPERATOR" varchar(32) DEFAULT NULL COMMENT '操作员',
  "GMT_ARCHIVE" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '归档时间',
  "GMT_CREATE" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  "GMT_MODIFIED" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后修改时间',
  "MEMO" varchar(128) DEFAULT NULL COMMENT '备注',
  "CHECK_FLAG" char(1) DEFAULT NULL COMMENT '复核文件回导审批结果',
  PRIMARY KEY ("ARCHIVE_BATCH_ID")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='机构归档批次表';

-- ----------------------------
-- Table structure for tt_inst_batch_result
-- ----------------------------
DROP TABLE IF EXISTS `tt_inst_batch_result`;
CREATE TABLE "tt_inst_batch_result" (
  "BATCH_RESULT_ID" bigint(15) NOT NULL AUTO_INCREMENT COMMENT '批次结果ID',
  "ARCHIVE_BATCH_ID" bigint(15) DEFAULT NULL COMMENT '归档批次ID',
  "BATCH_TYPE" char(1) DEFAULT NULL COMMENT '批次类型：C（复核批次）；R（结果批次）',
  "FUND_CHANNEL_CODE" varchar(32) DEFAULT NULL COMMENT '资金渠道',
  "TOTAL_COUNT" bigint(10) DEFAULT NULL COMMENT '总笔数',
  "TOTAL_AMOUNT" decimal(15,2) DEFAULT NULL COMMENT '总金额',
  "SUCCESS_COUNT" bigint(10) DEFAULT NULL COMMENT '成功笔数',
  "SUCCESS_AMOUNT" decimal(15,2) DEFAULT NULL COMMENT '成功金额',
  "FAILED_COUNT" bigint(10) DEFAULT NULL COMMENT '失败笔数',
  "FAILED_AMOUNT" decimal(15,2) DEFAULT NULL COMMENT '失败金额',
  "DIFFERENT_COUNT" bigint(10) DEFAULT NULL COMMENT '差异笔数',
  "DIFFERENT_AMOUNT" decimal(15,2) DEFAULT NULL COMMENT '差异金额',
  "LESS_COUNT" bigint(10) DEFAULT NULL COMMENT '少账比数',
  "MORE_COUNT" bigint(10) DEFAULT NULL COMMENT '多账比数',
  "STATUS" char(1) DEFAULT NULL COMMENT '复核状态：A（待处理）；U（复核不通过）；P（复核通过）；D（废弃）；F（处理结束）\n            结果状态：A（待处理）；P（处理中）；F（处理结束）',
  "FILE_PATH" varchar(128) DEFAULT NULL COMMENT '文件路径',
  "GMT_RETURN" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '返回时间',
  "GMT_CREATE" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  "GMT_MODIFIED" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后修改时间',
  "MEMO" varchar(128) DEFAULT NULL COMMENT '备注',
  "FUND_CHANNEL_API" varchar(32) DEFAULT NULL,
  "BIZ_TYPE" char(1) DEFAULT NULL,
  "CHECK_OPERATER" varchar(32) DEFAULT NULL COMMENT '导入操作员的登录名',
  "IMPORT_OPERATER" varchar(32) DEFAULT NULL COMMENT '审核操作员的登录名',
  "IMPORT_TYPE" char(1) DEFAULT NULL COMMENT '是否是第一次导入 F 第一次 S 第二次',
  PRIMARY KEY ("BATCH_RESULT_ID"),
  KEY "IX_TTINSTBATCHRESULT_BATCHID" ("ARCHIVE_BATCH_ID")
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='机构批次处理结果';

-- ----------------------------
-- Table structure for tt_inst_notify_log
-- ----------------------------
DROP TABLE IF EXISTS `tt_inst_notify_log`;
CREATE TABLE "tt_inst_notify_log" (
  "NOTIFY_LOG_ID" bigint(15) NOT NULL AUTO_INCREMENT COMMENT '通知日志ID',
  "INST_ORDER_ID" bigint(15) DEFAULT NULL COMMENT '机构订单ID',
  "NOTIFY_RESULT" char(1) DEFAULT NULL COMMENT '通知结果：S（成功），F（失败）',
  "GMT_CREATE" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  "MEMO" varchar(128) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY ("NOTIFY_LOG_ID"),
  KEY "IDX_INSTNOTIFYLOG" ("INST_ORDER_ID")
) ENGINE=InnoDB AUTO_INCREMENT=10928371 DEFAULT CHARSET=utf8 COMMENT='机构通知日志';

-- ----------------------------
-- Table structure for tt_inst_notify_log_202004
-- ----------------------------
DROP TABLE IF EXISTS `tt_inst_notify_log_202004`;
CREATE TABLE "tt_inst_notify_log_202004" (
  "NOTIFY_LOG_ID" bigint(15) NOT NULL AUTO_INCREMENT COMMENT '通知日志ID',
  "INST_ORDER_ID" bigint(15) DEFAULT NULL COMMENT '机构订单ID',
  "NOTIFY_RESULT" char(1) DEFAULT NULL COMMENT '通知结果：S（成功），F（失败）',
  "GMT_CREATE" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  "MEMO" varchar(128) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY ("NOTIFY_LOG_ID"),
  KEY "IDX_INSTNOTIFYLOG" ("INST_ORDER_ID")
) ENGINE=InnoDB AUTO_INCREMENT=10251917 DEFAULT CHARSET=utf8 COMMENT='机构通知日志';

-- ----------------------------
-- Table structure for tt_inst_order
-- ----------------------------
DROP TABLE IF EXISTS `tt_inst_order`;
CREATE TABLE "tt_inst_order" (
  "INST_ORDER_ID" bigint(15) NOT NULL AUTO_INCREMENT COMMENT '机构订单ID',
  "INST_CODE" varchar(32) DEFAULT NULL COMMENT '机构编码',
  "INST_ORDER_NO" varchar(32) DEFAULT NULL COMMENT '机构订单号',
  "ORDER_TYPE" char(1) DEFAULT NULL COMMENT '订单类型：I（入款），B（退款），O（出款）',
  "CURRENCY" char(3) DEFAULT NULL COMMENT '币种',
  "AMOUNT" decimal(15,2) DEFAULT NULL COMMENT '金额',
  "STATUS" char(1) DEFAULT NULL COMMENT '状态：I（处理中），S（成功），F（失败）',
  "COMMUNICATE_TYPE" char(1) DEFAULT NULL COMMENT '通讯类型，S（单笔通信），B（批量通信）',
  "COMMUNICATE_STATUS" char(1) DEFAULT NULL COMMENT '通讯类型，类型为单笔时：A（等待指令发送），S（指令已经发送），R（数据已经返回），F（指令发送失败）。\n            批量时：A（等待数据归档），G（归档已经生成），S（归档数据已经提交），R（归档数据已经返回），F（归档数据提交失败）',
  "ARCHIVE_BATCH_ID" bigint(15) DEFAULT NULL COMMENT '归档批次ID',
  "GMT_SUBMIT" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '提交时间',
  "GMT_CREATE" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  "GMT_MODIFIED" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后修改时间',
  "MEMO" varchar(128) DEFAULT NULL COMMENT '备注',
  "PRODUCT_CODE" varchar(32) DEFAULT NULL,
  "PAYMENT_CODE" varchar(32) DEFAULT NULL,
  "PAY_MODE" varchar(32) DEFAULT NULL,
  "FUND_CHANNEL_CODE" varchar(32) DEFAULT NULL,
  "FUND_CHANNEL_API" varchar(48) DEFAULT NULL,
  "ARCHIVE_TEMPLATE_ID" int(5) DEFAULT NULL,
  "SUBMIT_PRIORITY" int(5) DEFAULT NULL,
  "GMT_BOOKING_SUBMIT" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  "RETRY_TIMES" smallint(3) DEFAULT NULL,
  "GMT_NEXT_RETRY" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  "FLAG" char(1) DEFAULT NULL,
  "RISK_STATUS" char(1) DEFAULT NULL COMMENT 'I,等待审核结果;F,发送请求失败;P,审核通过;R,审核拒绝',
  "ROUTE_VERSION" bigint(8) DEFAULT NULL,
  "REVERSAL_STATUS" char(1) DEFAULT NULL,
  "CMF_SEQ_NO" varchar(32) DEFAULT NULL,
  "IS_SPLIT" char(1) DEFAULT NULL,
  "EXTENSION" varchar(4096) DEFAULT NULL COMMENT '扩展信息',
  "EXPECT_TIME" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY ("INST_ORDER_ID"),
  KEY "IX_TTINSTORDER_CMFSEQNO" ("CMF_SEQ_NO"),
  KEY "IX_TTINSTORDER_GMTCREATE" ("GMT_CREATE"),
  KEY "IX_TTINSTORDER_INSTORDERNO" ("INST_ORDER_NO"),
  KEY "IDX_TT_INST_ORDERBK_ABID" ("ARCHIVE_BATCH_ID"),
  KEY "IX_TTINSTORDER_GMTMODIFIED" ("GMT_MODIFIED"),
  KEY "IX_TTINSTORDER_GMTBOOK" ("GMT_BOOKING_SUBMIT") USING BTREE,
  KEY "IDX_FUND_CHANNEL_CODE_GMT_BOOKING_SUBMIT_STATUS" ("FUND_CHANNEL_CODE","GMT_BOOKING_SUBMIT","COMMUNICATE_STATUS","STATUS","ORDER_TYPE")
) ENGINE=InnoDB AUTO_INCREMENT=41481879052472 DEFAULT CHARSET=utf8 COMMENT='提交机构订单';

-- ----------------------------
-- Table structure for tt_inst_order_202004
-- ----------------------------
DROP TABLE IF EXISTS `tt_inst_order_202004`;
CREATE TABLE "tt_inst_order_202004" (
  "INST_ORDER_ID" bigint(15) NOT NULL AUTO_INCREMENT COMMENT '机构订单ID',
  "INST_CODE" varchar(32) DEFAULT NULL COMMENT '机构编码',
  "INST_ORDER_NO" varchar(32) DEFAULT NULL COMMENT '机构订单号',
  "ORDER_TYPE" char(1) DEFAULT NULL COMMENT '订单类型：I（入款），B（退款），O（出款）',
  "CURRENCY" char(3) DEFAULT NULL COMMENT '币种',
  "AMOUNT" decimal(15,2) DEFAULT NULL COMMENT '金额',
  "STATUS" char(1) DEFAULT NULL COMMENT '状态：I（处理中），S（成功），F（失败）',
  "COMMUNICATE_TYPE" char(1) DEFAULT NULL COMMENT '通讯类型，S（单笔通信），B（批量通信）',
  "COMMUNICATE_STATUS" char(1) DEFAULT NULL COMMENT '通讯类型，类型为单笔时：A（等待指令发送），S（指令已经发送），R（数据已经返回），F（指令发送失败）。\n            批量时：A（等待数据归档），G（归档已经生成），S（归档数据已经提交），R（归档数据已经返回），F（归档数据提交失败）',
  "ARCHIVE_BATCH_ID" bigint(15) DEFAULT NULL COMMENT '归档批次ID',
  "GMT_SUBMIT" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '提交时间',
  "GMT_CREATE" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  "GMT_MODIFIED" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后修改时间',
  "MEMO" varchar(128) DEFAULT NULL COMMENT '备注',
  "PRODUCT_CODE" varchar(32) DEFAULT NULL,
  "PAYMENT_CODE" varchar(32) DEFAULT NULL,
  "PAY_MODE" varchar(32) DEFAULT NULL,
  "FUND_CHANNEL_CODE" varchar(32) DEFAULT NULL,
  "FUND_CHANNEL_API" varchar(48) DEFAULT NULL,
  "ARCHIVE_TEMPLATE_ID" int(5) DEFAULT NULL,
  "SUBMIT_PRIORITY" int(5) DEFAULT NULL,
  "GMT_BOOKING_SUBMIT" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  "RETRY_TIMES" smallint(3) DEFAULT NULL,
  "GMT_NEXT_RETRY" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  "FLAG" char(1) DEFAULT NULL,
  "RISK_STATUS" char(1) DEFAULT NULL COMMENT 'I,等待审核结果;F,发送请求失败;P,审核通过;R,审核拒绝',
  "ROUTE_VERSION" bigint(8) DEFAULT NULL,
  "REVERSAL_STATUS" char(1) DEFAULT NULL,
  "CMF_SEQ_NO" varchar(32) DEFAULT NULL,
  "IS_SPLIT" char(1) DEFAULT NULL,
  "EXTENSION" varchar(4096) DEFAULT NULL COMMENT '扩展信息',
  "EXPECT_TIME" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY ("INST_ORDER_ID"),
  KEY "IX_TTINSTORDER_CMFSEQNO" ("CMF_SEQ_NO"),
  KEY "IX_TTINSTORDER_GMTCREATE" ("GMT_CREATE"),
  KEY "IX_TTINSTORDER_INSTORDERNO" ("INST_ORDER_NO"),
  KEY "IDX_TT_INST_ORDERBK_ABID" ("ARCHIVE_BATCH_ID"),
  KEY "IX_TTINSTORDER_GMTMODIFIED" ("GMT_MODIFIED"),
  KEY "IX_TTINSTORDER_GMTBOOK" ("GMT_BOOKING_SUBMIT") USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=41481736964 DEFAULT CHARSET=utf8 COMMENT='提交机构订单';

-- ----------------------------
-- Table structure for tt_inst_order_ext
-- ----------------------------
DROP TABLE IF EXISTS `tt_inst_order_ext`;
CREATE TABLE "tt_inst_order_ext" (
  "ORDER_EXT_ID" bigint(20) NOT NULL AUTO_INCREMENT COMMENT '表主键, 自增',
  "INST_ORDER_NO" varchar(64) NOT NULL COMMENT '机构订单号',
  "CHANNEL_MERCHANT_NO" bigint(20) DEFAULT NULL COMMENT '渠道商户号',
  "INST_ORDER_COST" decimal(10,2) DEFAULT '0.00' COMMENT '订单手续费',
  "GMT_CREATE" datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
  "GMT_MODIFIED" datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '记录更新时间',
  PRIMARY KEY ("ORDER_EXT_ID"),
  UNIQUE KEY "IDX_ORDER_MERCHANT" ("INST_ORDER_NO","CHANNEL_MERCHANT_NO") USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2034877 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tt_inst_order_ext_202004
-- ----------------------------
DROP TABLE IF EXISTS `tt_inst_order_ext_202004`;
CREATE TABLE "tt_inst_order_ext_202004" (
  "ORDER_EXT_ID" bigint(20) NOT NULL AUTO_INCREMENT COMMENT '表主键, 自增',
  "INST_ORDER_NO" varchar(64) NOT NULL COMMENT '机构订单号',
  "CHANNEL_MERCHANT_NO" bigint(20) DEFAULT NULL COMMENT '渠道商户号',
  "INST_ORDER_COST" decimal(10,2) DEFAULT '0.00' COMMENT '订单手续费',
  "GMT_CREATE" datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
  "GMT_MODIFIED" datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '记录更新时间',
  PRIMARY KEY ("ORDER_EXT_ID"),
  UNIQUE KEY "IDX_ORDER_MERCHANT" ("INST_ORDER_NO","CHANNEL_MERCHANT_NO") USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1876748 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tt_inst_order_log
-- ----------------------------
DROP TABLE IF EXISTS `tt_inst_order_log`;
CREATE TABLE "tt_inst_order_log" (
  "LOG_ID" bigint(15) NOT NULL AUTO_INCREMENT,
  "INST_ORDER_ID" bigint(15) NOT NULL COMMENT '机构订单ID',
  "INST_CODE" varchar(32) DEFAULT NULL COMMENT '机构编码',
  "INST_ORDER_NO" varchar(32) DEFAULT NULL COMMENT '机构订单号',
  "ORDER_TYPE" char(1) DEFAULT NULL COMMENT '订单类型：I（入款），B（退款），O（出款）',
  "CURRENCY" char(3) DEFAULT NULL COMMENT '币种',
  "AMOUNT" decimal(15,2) DEFAULT NULL COMMENT '金额',
  "STATUS" char(1) DEFAULT NULL COMMENT '状态：I（处理中），S（成功），F（失败）',
  "COMMUNICATE_TYPE" char(1) DEFAULT NULL COMMENT '通讯类型，S（单笔通信），B（批量通信）',
  "COMMUNICATE_STATUS" char(1) DEFAULT NULL COMMENT '通讯类型，类型为单笔时：A（等待指令发送），S（指令已经发送），R（数据已经返回），F（指令发送失败）。\n            批量时：A（等待数据归档），G（归档已经生成），S（归档数据已经提交），R（归档数据已经返回），F（归档数据提交失败）',
  "ARCHIVE_BATCH_ID" bigint(15) DEFAULT NULL COMMENT '归档批次ID',
  "GMT_SUBMIT" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '提交时间',
  "GMT_CREATE" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  "GMT_MODIFIED" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后修改时间',
  "MEMO" varchar(128) DEFAULT NULL COMMENT '备注',
  "PRODUCT_CODE" varchar(32) DEFAULT NULL,
  "PAYMENT_CODE" varchar(32) DEFAULT NULL,
  "PAY_MODE" varchar(32) DEFAULT NULL,
  "FUND_CHANNEL_CODE" varchar(32) DEFAULT NULL,
  "FUND_CHANNEL_API" varchar(48) DEFAULT NULL,
  "ARCHIVE_TEMPLATE_ID" int(5) DEFAULT NULL,
  "SUBMIT_PRIORITY" int(5) DEFAULT NULL,
  "GMT_BOOKING_SUBMIT" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  "RETRY_TIMES" smallint(3) DEFAULT NULL,
  "GMT_NEXT_RETRY" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  "FLAG" char(1) DEFAULT NULL,
  "RISK_STATUS" char(1) DEFAULT NULL COMMENT 'I,等待审核结果;F,发送请求失败;P,审核通过;R,审核拒绝',
  "ROUTE_VERSION" bigint(8) DEFAULT NULL,
  "REVERSAL_STATUS" char(1) DEFAULT NULL,
  "CMF_SEQ_NO" varchar(32) DEFAULT NULL,
  "IS_SPLIT" char(1) DEFAULT NULL,
  "EXTENSION" varchar(4096) DEFAULT NULL COMMENT '扩展信息',
  "EXPECT_TIME" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY ("LOG_ID"),
  UNIQUE KEY "INST_ORDER_NO_INDEX" ("INST_ORDER_NO"),
  KEY "INST_ORDER_ID_INDEX" ("INST_ORDER_ID")
) ENGINE=InnoDB AUTO_INCREMENT=1683 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tt_inst_order_result
-- ----------------------------
DROP TABLE IF EXISTS `tt_inst_order_result`;
CREATE TABLE "tt_inst_order_result" (
  "RESULT_ID" bigint(15) NOT NULL AUTO_INCREMENT,
  "BATCH_RESULT_ID" bigint(15) DEFAULT NULL,
  "INST_ORDER_ID" bigint(15) DEFAULT NULL,
  "INST_SEQ_NO" varchar(64) DEFAULT NULL,
  "ORDER_TYPE" char(1) DEFAULT NULL,
  "REAL_AMOUNT" decimal(15,2) DEFAULT NULL,
  "REAL_CURRENCY" char(3) DEFAULT NULL,
  "ACCOUNT_NAME" varchar(64) DEFAULT NULL,
  "ACCOUNT_NO" varchar(32) DEFAULT NULL,
  "CARD_TYPE" varchar(8) DEFAULT NULL,
  "ORGI_INST_ORDER_NO" varchar(32) DEFAULT NULL,
  "COMPARE_STATUS" char(1) DEFAULT NULL,
  "INST_STATUS" char(1) DEFAULT NULL,
  "GLIDE_STATUS" char(1) DEFAULT NULL,
  "INST_RESULT_CODE" varchar(32) DEFAULT NULL,
  "GMT_MODIFIED" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "GMT_CREATE" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  "MEMO" varchar(128) DEFAULT NULL,
  "BATCH_TYPE" char(1) DEFAULT NULL,
  "FUND_CHANNEL_CODE" varchar(16) DEFAULT NULL,
  "INST_ORDER_NO" varchar(32) DEFAULT NULL,
  "OPERATE_STATUS" char(1) DEFAULT NULL,
  "DIFF_MSG" varchar(512) DEFAULT NULL COMMENT '差异信息',
  "ARCHIVE_BATCH_ID" bigint(15) DEFAULT NULL COMMENT '归档批次ID',
  "FUNDIN_ORGI_INST_ORDER_NO" varchar(32) DEFAULT NULL,
  "SYNC_CHANNEL_STATUS" char(1) DEFAULT NULL COMMENT '同步结果给渠道.S发送成功,F发送失败,I发送中',
  "NOTIFY_BANKORDER_STATUS" char(1) DEFAULT NULL,
  "EXTENSION" varchar(4096) DEFAULT NULL COMMENT '扩展信息',
  "API_RESULT_CODE" varchar(32) DEFAULT NULL,
  "API_RESULT_SUB_CODE" varchar(32) DEFAULT NULL,
  "API_TYPE" varchar(32) DEFAULT NULL,
  "RISK_FLAG" varchar(32) DEFAULT NULL COMMENT '风险标识',
  PRIMARY KEY ("RESULT_ID"),
  KEY "IX_TTINSTORDERRESULT_GMTCREATE" ("GMT_CREATE"),
  KEY "IX_TTINSTORDERRESULT_INSTOID" ("INST_ORDER_ID"),
  KEY "IX_TTINSTRESULT_INSTSEQNO" ("INST_SEQ_NO"),
  KEY "IDX_IOR_ABID" ("ARCHIVE_BATCH_ID"),
  KEY "IDX_IOR_BRID" ("BATCH_RESULT_ID"),
  KEY "I_INST_ORDER_RESULT_GMT_MODIFY" ("GMT_MODIFIED"),
  KEY "idx_inst_order_no" ("INST_ORDER_NO")
) ENGINE=InnoDB AUTO_INCREMENT=12082585 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tt_inst_order_result_202004
-- ----------------------------
DROP TABLE IF EXISTS `tt_inst_order_result_202004`;
CREATE TABLE "tt_inst_order_result_202004" (
  "RESULT_ID" bigint(15) NOT NULL AUTO_INCREMENT,
  "BATCH_RESULT_ID" bigint(15) DEFAULT NULL,
  "INST_ORDER_ID" bigint(15) DEFAULT NULL,
  "INST_SEQ_NO" varchar(64) DEFAULT NULL,
  "ORDER_TYPE" char(1) DEFAULT NULL,
  "REAL_AMOUNT" decimal(15,2) DEFAULT NULL,
  "REAL_CURRENCY" char(3) DEFAULT NULL,
  "ACCOUNT_NAME" varchar(64) DEFAULT NULL,
  "ACCOUNT_NO" varchar(32) DEFAULT NULL,
  "CARD_TYPE" varchar(8) DEFAULT NULL,
  "ORGI_INST_ORDER_NO" varchar(32) DEFAULT NULL,
  "COMPARE_STATUS" char(1) DEFAULT NULL,
  "INST_STATUS" char(1) DEFAULT NULL,
  "GLIDE_STATUS" char(1) DEFAULT NULL,
  "INST_RESULT_CODE" varchar(32) DEFAULT NULL,
  "GMT_MODIFIED" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "GMT_CREATE" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  "MEMO" varchar(128) DEFAULT NULL,
  "BATCH_TYPE" char(1) DEFAULT NULL,
  "FUND_CHANNEL_CODE" varchar(16) DEFAULT NULL,
  "INST_ORDER_NO" varchar(32) DEFAULT NULL,
  "OPERATE_STATUS" char(1) DEFAULT NULL,
  "DIFF_MSG" varchar(512) DEFAULT NULL COMMENT '差异信息',
  "ARCHIVE_BATCH_ID" bigint(15) DEFAULT NULL COMMENT '归档批次ID',
  "FUNDIN_ORGI_INST_ORDER_NO" varchar(32) DEFAULT NULL,
  "SYNC_CHANNEL_STATUS" char(1) DEFAULT NULL COMMENT '同步结果给渠道.S发送成功,F发送失败,I发送中',
  "NOTIFY_BANKORDER_STATUS" char(1) DEFAULT NULL,
  "EXTENSION" varchar(4096) DEFAULT NULL COMMENT '扩展信息',
  "API_RESULT_CODE" varchar(32) DEFAULT NULL,
  "API_RESULT_SUB_CODE" varchar(32) DEFAULT NULL,
  "API_TYPE" varchar(32) DEFAULT NULL,
  "RISK_FLAG" varchar(32) DEFAULT NULL COMMENT '风险标识',
  PRIMARY KEY ("RESULT_ID"),
  KEY "IX_TTINSTORDERRESULT_GMTCREATE" ("GMT_CREATE"),
  KEY "IX_TTINSTORDERRESULT_INSTOID" ("INST_ORDER_ID"),
  KEY "IX_TTINSTRESULT_INSTSEQNO" ("INST_SEQ_NO"),
  KEY "IDX_IOR_ABID" ("ARCHIVE_BATCH_ID"),
  KEY "IDX_IOR_BRID" ("BATCH_RESULT_ID"),
  KEY "I_INST_ORDER_RESULT_GMT_MODIFY" ("GMT_MODIFIED"),
  KEY "idx_inst_order_no" ("INST_ORDER_NO")
) ENGINE=InnoDB AUTO_INCREMENT=10979630 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tt_order_submit_history
-- ----------------------------
DROP TABLE IF EXISTS `tt_order_submit_history`;
CREATE TABLE "tt_order_submit_history" (
  "SUBMIT_HISTORY_ID" bigint(15) NOT NULL AUTO_INCREMENT COMMENT '提交历史ID',
  "CMF_SEQ_NO" varchar(32) DEFAULT NULL COMMENT '渠道流水号',
  "INST_ORDER_ID" bigint(15) DEFAULT NULL COMMENT '机构订单ID',
  "GMT_CREATE" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  "MEMO" varchar(128) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY ("SUBMIT_HISTORY_ID")
) ENGINE=InnoDB AUTO_INCREMENT=6163300 DEFAULT CHARSET=utf8 COMMENT='订单提交历史';

-- ----------------------------
-- Table structure for tt_order_submit_history_202004
-- ----------------------------
DROP TABLE IF EXISTS `tt_order_submit_history_202004`;
CREATE TABLE "tt_order_submit_history_202004" (
  "SUBMIT_HISTORY_ID" bigint(15) NOT NULL AUTO_INCREMENT COMMENT '提交历史ID',
  "CMF_SEQ_NO" varchar(32) DEFAULT NULL COMMENT '渠道流水号',
  "INST_ORDER_ID" bigint(15) DEFAULT NULL COMMENT '机构订单ID',
  "GMT_CREATE" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  "MEMO" varchar(128) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY ("SUBMIT_HISTORY_ID")
) ENGINE=InnoDB AUTO_INCREMENT=6005093 DEFAULT CHARSET=utf8 COMMENT='订单提交历史';

-- ----------------------------
-- Table structure for tt_payment_notify_log
-- ----------------------------
DROP TABLE IF EXISTS `tt_payment_notify_log`;
CREATE TABLE "tt_payment_notify_log" (
  "NOTIFY_LOG_ID" bigint(15) NOT NULL AUTO_INCREMENT COMMENT '通知日志ID',
  "CHANNEL_SEQ_NO" varchar(32) DEFAULT NULL COMMENT '渠道流水号',
  "NOTIFY_RESULT" char(1) DEFAULT NULL COMMENT '通知结果：S（成功），F（失败）',
  "GMT_CREATE" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  "MEMO" varchar(128) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY ("NOTIFY_LOG_ID"),
  KEY "IDX_PAYMENTNOTIFYLOG" ("CHANNEL_SEQ_NO")
) ENGINE=InnoDB AUTO_INCREMENT=3331556 DEFAULT CHARSET=utf8 COMMENT='支付结果通知日志';

-- ----------------------------
-- Table structure for tt_payment_notify_log_202004
-- ----------------------------
DROP TABLE IF EXISTS `tt_payment_notify_log_202004`;
CREATE TABLE "tt_payment_notify_log_202004" (
  "NOTIFY_LOG_ID" bigint(15) NOT NULL AUTO_INCREMENT COMMENT '通知日志ID',
  "CHANNEL_SEQ_NO" varchar(32) DEFAULT NULL COMMENT '渠道流水号',
  "NOTIFY_RESULT" char(1) DEFAULT NULL COMMENT '通知结果：S（成功），F（失败）',
  "GMT_CREATE" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  "MEMO" varchar(128) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY ("NOTIFY_LOG_ID"),
  KEY "IDX_PAYMENTNOTIFYLOG" ("CHANNEL_SEQ_NO")
) ENGINE=InnoDB AUTO_INCREMENT=3214442 DEFAULT CHARSET=utf8 COMMENT='支付结果通知日志';

-- ----------------------------
-- Table structure for tt_pos_batch
-- ----------------------------
DROP TABLE IF EXISTS `tt_pos_batch`;
CREATE TABLE "tt_pos_batch" (
  "BATCH_ID" bigint(11) NOT NULL COMMENT '批次ID',
  "TERMINAL_ID" int(6) DEFAULT NULL COMMENT '终端ID',
  "INST_BATCH_NO" varchar(32) DEFAULT NULL COMMENT '机构批次号',
  "STATUS" char(1) DEFAULT NULL COMMENT '状态。I：初始；P：使用中；S：结算成功；F：结算失败；',
  "WORK_KEY" varchar(256) DEFAULT NULL COMMENT '工作密钥',
  "CHECK_IN_INST_NO" varchar(32) DEFAULT NULL COMMENT '签到机构订单号',
  "GMT_CHECK_IN" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '签到时间',
  "CHECK_OUT_INST_NO" varchar(32) DEFAULT NULL COMMENT '签退机构订单号',
  "GMT_CHECK_OUT" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '签退时间',
  "GMT_BOOKING_SETTLE" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '预计结算时间',
  "GMT_SETTLE" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '结算时间',
  "GMT_CREATE" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  "GMT_MODIFIED" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后修改时间',
  "MEMO" varchar(128) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY ("BATCH_ID"),
  KEY "FK_TT_POS_B_REFERENCE_TM_POS_T" ("TERMINAL_ID")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='POS批次表';

-- ----------------------------
-- Table structure for tt_pos_order
-- ----------------------------
DROP TABLE IF EXISTS `tt_pos_order`;
CREATE TABLE "tt_pos_order" (
  "ORDER_ID" bigint(11) NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  "BATCH_ID" bigint(11) DEFAULT NULL COMMENT '批次ID',
  "REQUEST_NO" varchar(32) DEFAULT NULL COMMENT '请求号',
  "API_TYPE" varchar(8) DEFAULT NULL COMMENT 'API类型',
  "INST_ORDER_NO" varchar(32) DEFAULT NULL COMMENT '机构订单号',
  "PRE_INST_ORDER_NO" varchar(32) DEFAULT NULL COMMENT '原机构订单号',
  "INST_SEQ_NO" varchar(32) DEFAULT NULL COMMENT '机构流水号',
  "AMOUNT" decimal(15,2) DEFAULT NULL COMMENT '金额',
  "REAL_AMOUNT" decimal(15,2) DEFAULT NULL COMMENT '实付金额',
  "CURRENCY" char(3) DEFAULT NULL COMMENT '币种',
  "STATUS" char(1) DEFAULT NULL COMMENT '状态',
  "SUBMIT_BATCH_NO" bigint(11) DEFAULT NULL COMMENT '上送批次号',
  "SUBMIT_INST_NO" varchar(32) DEFAULT NULL COMMENT '上送机构订单号',
  "SETTLEMENT_DATE" char(8) DEFAULT NULL COMMENT '结算日期',
  "EXTENSION" varchar(2048) DEFAULT NULL COMMENT '扩展信息',
  "ROUTE_VERSION" bigint(8) DEFAULT NULL COMMENT '路由版本',
  "GMT_CREATE" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  "GMT_MODIFIED" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后修改时间',
  "MEMO" varchar(128) DEFAULT NULL COMMENT '备注',
  "RETRY_STATUS" char(1) DEFAULT NULL COMMENT 'F,失败;S,成功;A,等待;',
  PRIMARY KEY ("ORDER_ID"),
  UNIQUE KEY "UIDX_PO_AT_RN" ("API_TYPE","REQUEST_NO"),
  KEY "FK_TT_POS_O_REFERENCE_TT_POS_B" ("BATCH_ID")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='POS订单';

-- ----------------------------
-- Table structure for tt_refund_order
-- ----------------------------
DROP TABLE IF EXISTS `tt_refund_order`;
CREATE TABLE "tt_refund_order" (
  "INST_ORDER_ID" bigint(15) NOT NULL COMMENT '机构订单ID',
  "FUNDIN_ORDER_NO" varchar(32) DEFAULT NULL COMMENT '充值订单号',
  "FUNDIN_REAL_AMOUNT" decimal(15,2) DEFAULT NULL COMMENT '充值实收金额',
  "FUNDIN_DATE" varchar(16) DEFAULT NULL COMMENT '入款时间',
  "GMT_MODIFIED" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY ("INST_ORDER_ID"),
  KEY "IX_TTREFUNDORDER_GMTMD" ("GMT_MODIFIED")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='退款订单';

-- ----------------------------
-- Table structure for tt_scheduling_balancing_log
-- ----------------------------
DROP TABLE IF EXISTS `tt_scheduling_balancing_log`;
CREATE TABLE "tt_scheduling_balancing_log" (
  "ID" bigint(15) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  "PID" bigint(15) DEFAULT NULL COMMENT '父任务ID',
  "BAL_ID" bigint(11) DEFAULT NULL COMMENT '负载ID',
  "TASK_TICKET" varchar(64) DEFAULT NULL COMMENT '任务标识 可作为锁凭证',
  "TASK_NAME" varchar(64) DEFAULT NULL COMMENT '任务名称',
  "TASK_SIZE" bigint(10) DEFAULT NULL COMMENT '任务数',
  "REDUCE_TYPE_SIZE" bigint(10) DEFAULT NULL COMMENT '分解类型标识,任务大类数,即大类数',
  "REDUCE_SIZE" bigint(10) DEFAULT NULL COMMENT '可分解数',
  "REDUCED_SIZE" bigint(10) DEFAULT NULL COMMENT '已分解数',
  "GMT_CREATE" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  "GMT_MODIFIED" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后修改时间',
  "STATUS" char(1) DEFAULT NULL COMMENT '状态：R运行中；F已完成',
  "MEMO" varchar(128) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY ("ID")
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tt_scheduling_task_reduce
-- ----------------------------
DROP TABLE IF EXISTS `tt_scheduling_task_reduce`;
CREATE TABLE "tt_scheduling_task_reduce" (
  "ID" bigint(15) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  "WORKER_ID" varchar(64) DEFAULT NULL COMMENT '凭证,线程或服务器分类',
  "REDUCE_TICKET" varchar(64) DEFAULT NULL COMMENT '分解类型标识,任务大类标识',
  "SCOPE_START" varchar(64) DEFAULT NULL COMMENT '目标分解头,范围的开始值',
  "SCOPE_END" varchar(64) DEFAULT NULL COMMENT '目标分解尾,范围的结束值',
  "REDUCE_SIZE" bigint(10) DEFAULT NULL COMMENT '分配任务数',
  "STATUS" char(1) DEFAULT NULL COMMENT '状态：I初始态；R运行态；E终止态; F失效',
  "GMT_CREATE" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  "GMT_MODIFIED" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后修改时间',
  "BAL_ID" bigint(15) DEFAULT NULL COMMENT '负载记录ID',
  PRIMARY KEY ("ID")
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tt_task
-- ----------------------------
DROP TABLE IF EXISTS `tt_task`;
CREATE TABLE "tt_task" (
  "id" int(11) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  "order_id" varchar(64) NOT NULL COMMENT '订单ID',
  "order_type" varchar(45) DEFAULT NULL COMMENT '订单类型',
  "task_name" varchar(64) DEFAULT NULL COMMENT '任务名称',
  "state" int(11) DEFAULT NULL COMMENT '任务状态',
  "error_msg" varchar(1024) DEFAULT NULL COMMENT '错误信息',
  "extension" varchar(2048) DEFAULT NULL COMMENT '扩展属性',
  "gmt_create" datetime DEFAULT NULL COMMENT '创建时间',
  "gmt_execute" datetime NOT NULL COMMENT '执行时间',
  "extension_version" int(11) DEFAULT NULL COMMENT '扩展参数的版本号',
  PRIMARY KEY ("id"),
  KEY "index2" ("gmt_execute")
) ENGINE=InnoDB AUTO_INCREMENT=40685 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tt_weixin_auth
-- ----------------------------
DROP TABLE IF EXISTS `tt_weixin_auth`;
CREATE TABLE "tt_weixin_auth" (
  "id" int(11) NOT NULL AUTO_INCREMENT,
  "contract_code" varchar(120) DEFAULT NULL COMMENT '签约协议号',
  "plan_id" varchar(20) DEFAULT NULL COMMENT '模板id',
  "mch_id" varchar(20) DEFAULT NULL COMMENT '商户号',
  "member_id" varchar(32) NOT NULL COMMENT '用户id',
  "fund_channel_code" varchar(64) NOT NULL COMMENT '渠道编号',
  "request_no" varchar(120) NOT NULL COMMENT '请求编号',
  "ic_card_no" varchar(32) DEFAULT NULL COMMENT '身份证号码',
  "real_name" varchar(64) DEFAULT NULL COMMENT '姓名',
  "mobile" varchar(45) DEFAULT NULL COMMENT '电话号码',
  "expire_time" datetime DEFAULT NULL,
  "create_time" datetime NOT NULL,
  "update_time" datetime DEFAULT NULL,
  "status" varchar(20) NOT NULL DEFAULT 'WAIT' COMMENT '状态,SUCCESS成功,WAIT处理中,FAIL失败',
  "agree_no" varchar(120) DEFAULT NULL COMMENT '签约号',
  "extension" varchar(900) DEFAULT NULL COMMENT '扩展信息',
  PRIMARY KEY ("id"),
  UNIQUE KEY "UNIQUE_TT_WX_AU" ("member_id","fund_channel_code") USING BTREE,
  UNIQUE KEY "UNIQUE_TT_WX_AU_RESQ" ("request_no") USING BTREE,
  KEY "INDEX_MERCHANT_ID" ("member_id") USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=328 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_bill_build_info
-- ----------------------------
DROP TABLE IF EXISTS `t_bill_build_info`;
CREATE TABLE "t_bill_build_info" (
  "id" bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  "partner_no" varchar(32) NOT NULL COMMENT '商户号',
  "bill_date" datetime NOT NULL COMMENT '账单日期',
  "url" varchar(64) NOT NULL COMMENT '账单文件下载地址',
  "version" varchar(32) NOT NULL DEFAULT 'V1' COMMENT '版本号',
  "MEMO" varchar(256) DEFAULT NULL COMMENT '备注',
  "GMT_CREATE" datetime NOT NULL COMMENT '创建时间',
  "GMT_MODIFIED" datetime NOT NULL COMMENT '修改时间',
  "is_delete" bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除：0 否；1 是',
  PRIMARY KEY ("id"),
  UNIQUE KEY "uk_pno_bdate_verison_del" ("partner_no","bill_date","version","is_delete")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='账单构建信息';

-- ----------------------------
-- Table structure for t_exbatis_test
-- ----------------------------
DROP TABLE IF EXISTS `t_exbatis_test`;
CREATE TABLE "t_exbatis_test" (
  "ID" varchar(32) NOT NULL,
  "CODE" varchar(10) DEFAULT NULL,
  "GMT_CREATE" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("ID")
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_sequence
-- ----------------------------
DROP TABLE IF EXISTS `t_sequence`;
CREATE TABLE "t_sequence" (
  "NAME" varchar(50) NOT NULL COMMENT '名称',
  "CURRENT_VALUE" bigint(20) NOT NULL DEFAULT '1' COMMENT '当前值',
  "INCREMENT" smallint(6) NOT NULL DEFAULT '1' COMMENT '增量',
  "TOTAL" smallint(6) NOT NULL DEFAULT '10000' COMMENT '单次取值总量，更新总量需重启应用',
  "THRESHOLD" smallint(6) NOT NULL DEFAULT '10000' COMMENT '刷新阀值，更新阀值需重启应用',
  PRIMARY KEY ("NAME")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='序列';

-- ----------------------------
-- Table structure for t_syn_schdule
-- ----------------------------
DROP TABLE IF EXISTS `t_syn_schdule`;
CREATE TABLE "t_syn_schdule" (
  "id" bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  "syn_date" varchar(10) NOT NULL COMMENT '协同日期（yyyy-mm-dd）',
  "memo" varchar(256) DEFAULT NULL COMMENT '备注',
  "GMT_CREATE" datetime NOT NULL COMMENT '创建时间',
  "GMT_MODIFIED" datetime NOT NULL COMMENT '修改时间',
  "is_delete" bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除：0 否；1 是',
  PRIMARY KEY ("id"),
  UNIQUE KEY "uk_syndate" ("syn_date","is_delete")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='协同账单数据生成';

-- ----------------------------
-- View structure for v_tm_rule_set
-- ----------------------------
DROP VIEW IF EXISTS `v_tm_rule_set`;
CREATE ALGORITHM=UNDEFINED DEFINER="root"@"localhost" SQL SECURITY DEFINER VIEW `v_tm_rule_set` AS select max("tm_rule_set"."RULESET_ID") AS "RULESET_ID" from "tm_rule_set" ;
