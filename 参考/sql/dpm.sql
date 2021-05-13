/*
Navicat MySQL Data Transfer

Source Server         : qa-bj连接
Source Server Version : 50722
Source Host           : 10.100.4.211:3306
Source Database       : dpm

Target Server Type    : MYSQL
Target Server Version : 50722
File Encoding         : 65001

Date: 2020-10-22 16:09:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for dbajobconf
-- ----------------------------
DROP TABLE IF EXISTS `dbajobconf`;
CREATE TABLE "dbajobconf" (
  "JOBNAME" varchar(50) DEFAULT NULL COMMENT '作业名字',
  "JOBSTATUS" varchar(20) DEFAULT NULL COMMENT '作业进度',
  "COMMENTS" varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='DBAJOBCONF';

-- ----------------------------
-- Table structure for dbajoblog
-- ----------------------------
DROP TABLE IF EXISTS `dbajoblog`;
CREATE TABLE "dbajoblog" (
  "JOBID" bigint(8) NOT NULL AUTO_INCREMENT,
  "JOBNAME" varchar(50) DEFAULT NULL,
  "STARTDATE" datetime DEFAULT NULL,
  "ENDDATE" datetime DEFAULT NULL,
  "JOBSTATUS" varchar(20) DEFAULT NULL,
  "COMMENTS" varchar(100) DEFAULT NULL,
  "PARAMETER" varchar(100) DEFAULT NULL,
  PRIMARY KEY ("JOBID")
) ENGINE=InnoDB AUTO_INCREMENT=3410 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tb_title_daily
-- ----------------------------
DROP TABLE IF EXISTS `tb_title_daily`;
CREATE TABLE "tb_title_daily" (
  "ID" bigint(15) NOT NULL AUTO_INCREMENT COMMENT '主键',
  "ACCOUNT_DATE" char(8) NOT NULL COMMENT '日期',
  "TITLE_CODE" varchar(16) NOT NULL COMMENT '科目编号',
  "BALANCE_DIRECTION" char(1) NOT NULL COMMENT '余额方向',
  "DEBIT_AMOUNT" decimal(19,4) DEFAULT NULL COMMENT '借记金额',
  "CREDIT_AMOUNT" decimal(19,4) DEFAULT NULL COMMENT '贷记金额',
  "DEBIT_COUNT" bigint(15) DEFAULT NULL COMMENT '借记次数',
  "CREDIT_COUNT" bigint(15) DEFAULT NULL COMMENT '贷记次数',
  "DEBIT_BALANCE" decimal(19,4) DEFAULT NULL COMMENT '借记余额',
  "CREDIT_BALANCE" decimal(19,4) DEFAULT NULL COMMENT '贷记余额',
  "CURRENCY" int(3) NOT NULL COMMENT '币种',
  "GMT_CREATE" datetime NOT NULL COMMENT '创建时间',
  "GMT_MODIFIED" datetime DEFAULT NULL COMMENT '修改时间',
  "MEMO" varchar(200) DEFAULT NULL COMMENT '备注字段',
  PRIMARY KEY ("ID"),
  UNIQUE KEY "PK_TB_TITLE_DAILY" ("ID") USING BTREE,
  UNIQUE KEY "U_TITLE_DAILY_DATE" ("ACCOUNT_DATE","TITLE_CODE") USING BTREE,
  KEY "IDX_TD_ACCOUNT_DATE" ("ACCOUNT_DATE") USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=123002 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for temp_t_dpm_buffer_detail
-- ----------------------------
DROP TABLE IF EXISTS `temp_t_dpm_buffer_detail`;
CREATE TABLE "temp_t_dpm_buffer_detail" (
  "BUFFER_DETAIL_ID" bigint(32) NOT NULL AUTO_INCREMENT COMMENT '待入账数据流水号',
  "ACCOUNT_NO" varchar(32) NOT NULL COMMENT '账户号',
  "SYS_TRACE_NO" varchar(32) DEFAULT NULL COMMENT '系统跟踪号',
  "VOUCHER_NO" varchar(50) NOT NULL COMMENT '凭证号',
  "TRANSACTION_NO" varchar(32) NOT NULL COMMENT '事务号',
  "AMOUNT" decimal(19,4) NOT NULL COMMENT '金额',
  "CRDR" decimal(1,0) NOT NULL COMMENT '借贷方向:   1:借   2:贷',
  "TXN_TYPE" decimal(1,0) NOT NULL COMMENT '交易类型       0:正常  1:红字   2:蓝字   9:抹帐',
  "ACCOUNTING_RULE" varchar(16) NOT NULL COMMENT '入账规则     0.先贷后借  1.借记   2.贷记  3.冻结',
  "PRODUCT_CODE" varchar(12) DEFAULT NULL COMMENT 'PE产品编码',
  "PAY_CODE" varchar(12) DEFAULT NULL COMMENT 'PE支付编码',
  "STATUS" decimal(1,0) NOT NULL COMMENT '状态   0.待入账  1.成功(不会存在,成功直接删除数据)  2.失败  3.处理中',
  "COUNT" decimal(1,0) NOT NULL COMMENT '执行次数',
  "SUMMARY" varchar(256) DEFAULT NULL COMMENT '摘要',
  "OCCUPY_SIGN" varchar(32) DEFAULT NULL COMMENT '时间戳',
  "REMARK" varchar(256) DEFAULT NULL COMMENT '备注',
  "CREATE_TIME" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  "UPDATE_TIME" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  "SUITE_NO" varchar(32) NOT NULL COMMENT '套号',
  "CONTEXT_VOUCHER_NO" varchar(32) DEFAULT NULL COMMENT '关联凭证号',
  "ACCOUNTING_DATE" varchar(8) DEFAULT NULL COMMENT '会计日',
  "OPERATION_TYPE" decimal(1,0) DEFAULT NULL COMMENT '操作类型',
  "BALANCE_TYPE" decimal(1,0) DEFAULT NULL COMMENT '余额类型',
  PRIMARY KEY ("BUFFER_DETAIL_ID"),
  KEY "IDX_BUFFERDETAIL_CT" ("CREATE_TIME") USING BTREE,
  KEY "IDX_DBD_OS" ("OCCUPY_SIGN") USING BTREE,
  KEY "IDX_STATUS" ("STATUS"),
  KEY "IDX_TRANSNO" ("TRANSACTION_NO")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for temp_t_dpm_buffer_outer_detail
-- ----------------------------
DROP TABLE IF EXISTS `temp_t_dpm_buffer_outer_detail`;
CREATE TABLE "temp_t_dpm_buffer_outer_detail" (
  "BUFFER_DETAIL_ID" bigint(32) NOT NULL AUTO_INCREMENT COMMENT '待入账数据流水号',
  "ACCOUNT_NO" varchar(32) NOT NULL COMMENT '账户号',
  "SYS_TRACE_NO" varchar(32) DEFAULT NULL COMMENT '系统跟踪号',
  "VOUCHER_NO" varchar(50) NOT NULL COMMENT '凭证号',
  "TRANSACTION_NO" varchar(32) NOT NULL COMMENT '事务号',
  "AMOUNT" decimal(19,4) NOT NULL COMMENT '金额',
  "CRDR" decimal(1,0) NOT NULL COMMENT '借贷方向:   1:借   2:贷',
  "TXN_TYPE" decimal(1,0) NOT NULL COMMENT '交易类型       0:正常  1:红字   2:蓝字   9:抹帐',
  "ACCOUNTING_RULE" varchar(16) NOT NULL COMMENT '入账规则     0.先贷后借  1.借记   2.贷记  3.冻结',
  "PRODUCT_CODE" varchar(12) DEFAULT NULL COMMENT 'PE产品编码',
  "PAY_CODE" varchar(12) DEFAULT NULL COMMENT 'PE支付编码',
  "STATUS" decimal(1,0) NOT NULL COMMENT '状态   0.待入账  1.成功(不会存在,成功直接删除数据)  2.失败  3.处理中',
  "COUNT" decimal(1,0) NOT NULL COMMENT '执行次数',
  "SUMMARY" varchar(256) DEFAULT NULL COMMENT '摘要',
  "OCCUPY_SIGN" varchar(32) DEFAULT NULL COMMENT '时间戳',
  "REMARK" varchar(256) DEFAULT NULL COMMENT '备注',
  "CREATE_TIME" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  "UPDATE_TIME" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  "SUITE_NO" varchar(32) NOT NULL COMMENT '套号',
  "CONTEXT_VOUCHER_NO" varchar(32) DEFAULT NULL COMMENT '关联凭证号',
  "ACCOUNTING_DATE" varchar(8) DEFAULT NULL COMMENT '会计日',
  "OPERATION_TYPE" decimal(1,0) DEFAULT NULL COMMENT '操作类型',
  "BALANCE_TYPE" decimal(1,0) DEFAULT NULL COMMENT '余额类型',
  PRIMARY KEY ("BUFFER_DETAIL_ID"),
  KEY "IDX_BUFFERDETAIL_CT" ("CREATE_TIME") USING BTREE,
  KEY "IDX_DBD_OS" ("OCCUPY_SIGN") USING BTREE,
  KEY "IDX_TRANSNO" ("TRANSACTION_NO"),
  KEY "IDX_ACCTNO" ("ACCOUNT_NO") USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for tmp_account_balance_dest_081807
-- ----------------------------
DROP TABLE IF EXISTS `tmp_account_balance_dest_081807`;
CREATE TABLE "tmp_account_balance_dest_081807" (
  "account_no" varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_account_balance_dest_1
-- ----------------------------
DROP TABLE IF EXISTS `t_account_balance_dest_1`;
CREATE TABLE "t_account_balance_dest_1" (
  "id" bigint(20) NOT NULL AUTO_INCREMENT COMMENT '商品库存id',
  "u_id" varchar(64) NOT NULL,
  "account_type" int(11) NOT NULL,
  "account_no" varchar(64) DEFAULT NULL,
  "member_id" varchar(64) DEFAULT NULL,
  "fund_type" varchar(16) NOT NULL,
  "balance" bigint(20) NOT NULL,
  "add_balance" bigint(20) NOT NULL,
  "status" int(11) NOT NULL DEFAULT '0',
  "memo" varchar(256) DEFAULT NULL,
  PRIMARY KEY ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_act_account_titile
-- ----------------------------
DROP TABLE IF EXISTS `t_act_account_titile`;
CREATE TABLE "t_act_account_titile" (
  "TITLE_SEQ_NO" int(28) NOT NULL AUTO_INCREMENT COMMENT '主键(自增处理)',
  "TITLE_CODE" varchar(16) NOT NULL COMMENT '科目代码',
  "TITLE_NAME" varchar(64) NOT NULL COMMENT '科目名称',
  "TITLE_LEVEL" decimal(2,0) DEFAULT NULL COMMENT '科目级别',
  "PARENT_TITLE_CODE" varchar(16) DEFAULT NULL COMMENT '父科目代码',
  "IS_LEAF" char(1) DEFAULT NULL COMMENT 'Y: 是 N: 否',
  "TYPE" char(1) NOT NULL COMMENT '类型：1（资产类）；2（负债类）；3(所有者权益)；4（共同类）5(损益类)',
  "BALANCE_DIRECTION" decimal(1,0) NOT NULL COMMENT '余额方向：\r\n            1:借\r\n            2:贷\r\n            0:双向',
  "STATUS" char(1) NOT NULL COMMENT '状态：Y（有效）；N（无效）',
  "GMT_MODIFIED" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后修改时间',
  "GMT_CREATE" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  "MEMO" varchar(128) DEFAULT NULL COMMENT '备注',
  "TITLE_RANGE" decimal(1,0) NOT NULL COMMENT '1.内部科目;2,外部科目',
  PRIMARY KEY ("TITLE_SEQ_NO"),
  UNIQUE KEY "AK_KEY_TITLE_CODE" ("TITLE_CODE")
) ENGINE=InnoDB AUTO_INCREMENT=5446 DEFAULT CHARSET=utf8 COMMENT='会计科目表';

-- ----------------------------
-- Table structure for t_api_auth
-- ----------------------------
DROP TABLE IF EXISTS `t_api_auth`;
CREATE TABLE "t_api_auth" (
  "auth_id" bigint(32) NOT NULL AUTO_INCREMENT,
  "merchant_id" varchar(32) DEFAULT NULL,
  "api_name" varchar(1000) DEFAULT NULL,
  "md_key" varchar(64) DEFAULT NULL,
  "certificate" varchar(2000) DEFAULT NULL,
  "cert_type" varchar(10) DEFAULT NULL,
  "cert_format" varchar(10) DEFAULT NULL,
  "gmt_create" datetime DEFAULT NULL,
  "gmt_modified" timestamp NULL DEFAULT NULL,
  "remark" varchar(30) DEFAULT NULL,
  PRIMARY KEY ("auth_id"),
  UNIQUE KEY "UK_MERCHANT_ID" ("merchant_id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_cache_preload_flag
-- ----------------------------
DROP TABLE IF EXISTS `t_cache_preload_flag`;
CREATE TABLE "t_cache_preload_flag" (
  "id" int(11) NOT NULL AUTO_INCREMENT,
  "seq_no" int(11) NOT NULL COMMENT '处理的序列号',
  "is_delete" bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除标记：0 未删除，1 删除',
  "create_time" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  "update_time" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY ("id"),
  UNIQUE KEY "uk_seqno" ("seq_no")
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_dpm_account_config
-- ----------------------------
DROP TABLE IF EXISTS `t_dpm_account_config`;
CREATE TABLE "t_dpm_account_config" (
  "ID" int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  "ACCOUNT_NO" varchar(64) NOT NULL COMMENT '账户号',
  "CONFIG_KEY" varchar(64) DEFAULT NULL COMMENT '配置Key',
  "CONFIG_VALUE" varchar(1024) DEFAULT NULL COMMENT '配置值',
  "GMT_CREATE" datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  "GMT_MODIFIED" datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY ("ID"),
  UNIQUE KEY "accountNoKeyIndex" ("ACCOUNT_NO","CONFIG_KEY")
) ENGINE=InnoDB AUTO_INCREMENT=4101 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_dpm_account_crl_def
-- ----------------------------
DROP TABLE IF EXISTS `t_dpm_account_crl_def`;
CREATE TABLE "t_dpm_account_crl_def" (
  "ACCOUNT_TITLE_ID" varchar(32) NOT NULL COMMENT '科目代码',
  "ACCOUNT_ATTRIBUTE" decimal(1,0) DEFAULT NULL COMMENT '1:对私   2:对公    9:内部',
  "ACCOUNT_TYPE" decimal(4,0) NOT NULL COMMENT '101-对私基本户  201-对公基本户',
  "CURRENCY_CODE" varchar(3) DEFAULT NULL COMMENT '币种',
  "BAL_DIRECTION" decimal(1,0) DEFAULT NULL COMMENT '1:借   2:贷   0:双向',
  "STATUS" decimal(1,0) DEFAULT NULL COMMENT '0:有效  1:无效',
  "REMARK" varchar(200) DEFAULT NULL COMMENT '备注',
  "INPUT_UID" varchar(32) DEFAULT NULL COMMENT '录入人',
  "INPUT_TIME" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '录入时间',
  "CHECK_UID" varchar(32) DEFAULT NULL COMMENT '审核人',
  "CHECK_TIME" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '审核时间',
  PRIMARY KEY ("ACCOUNT_TITLE_ID"),
  UNIQUE KEY "AK_UK_TDACD_ACCOUNT_TYPE" ("ACCOUNT_TYPE","CURRENCY_CODE")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='外部户模板表';

-- ----------------------------
-- Table structure for t_dpm_account_entry
-- ----------------------------
DROP TABLE IF EXISTS `t_dpm_account_entry`;
CREATE TABLE "t_dpm_account_entry" (
  "ENTRY_SEQ_NO" bigint(28) NOT NULL AUTO_INCREMENT COMMENT '主键(自增处理)',
  "TRANSACTION_NO" varchar(32) NOT NULL COMMENT '事务号',
  "SUITE_NO" varchar(32) NOT NULL COMMENT '套号',
  "VOUCHER_NO" varchar(50) DEFAULT NULL COMMENT '凭证号',
  "SYS_TRACE_NO" varchar(32) DEFAULT NULL COMMENT '系统跟踪号',
  "ACCOUNT_NO" varchar(32) NOT NULL COMMENT '账户号',
  "TITLE_NO" varchar(32) DEFAULT NULL COMMENT '科目号',
  "ENTRY_TYPE" decimal(1,0) DEFAULT NULL COMMENT '0:表内分录\r\n 1:表外分录',
  "IS_MANUAL" decimal(1,0) DEFAULT NULL COMMENT '自动手工标志\r\n 0:自动\r\n 1:手工',
  "TXN_CURRENCY" varchar(3) DEFAULT NULL,
  "AMOUNT" decimal(19,4) NOT NULL,
  "TXN_TYPE" decimal(1,0) NOT NULL COMMENT '0-正常\r\n 1-红字\r\n 2-蓝字\r\n 9-抹帐',
  "DIRECTION" decimal(1,0) NOT NULL COMMENT '1:借\r\n 2:贷',
  "AUDIT_STATUS" decimal(1,0) NOT NULL COMMENT '0-未复核\r\n 1-已复核\r\n 2-不需事中复核',
  "STATUS" decimal(1,0) DEFAULT NULL COMMENT '0-未入账\r\n 2-已入账\r\n 3-已抹帐\r\n 9-无效',
  "ACCOUNTING_DATE" varchar(8) NOT NULL,
  "CREATE_TIME" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  "LAST_UPDATE_TIME" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  "BAL_UPDATE_TIME" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  "REMARK" varchar(256) DEFAULT NULL,
  "IS_BUFFER" decimal(1,0) DEFAULT NULL COMMENT '0:未缓冲\r\n 1:缓冲',
  "OLD_ENTRY_SEQ_NO" varchar(32) DEFAULT NULL,
  "SUMMARY" varchar(256) DEFAULT NULL,
  "INPUT_UID" varchar(32) DEFAULT NULL,
  "INPUT_TIME" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  "CHECK_UID" varchar(32) DEFAULT NULL,
  "CHECK_TIME" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  "RSVD_AMT1" decimal(19,4) DEFAULT '0.0000',
  "RSVD_AMT2" decimal(19,4) DEFAULT '0.0000',
  "RSVD_TEXT1" varchar(50) DEFAULT NULL,
  "RSVD_TEXT2" varchar(50) DEFAULT NULL,
  "CONTEXT_VOUCHER_NO" varchar(50) DEFAULT NULL COMMENT '关联结算流水号',
  "OPERATER" decimal(1,0) DEFAULT NULL,
  "CLEARING_CODE" varchar(16) DEFAULT NULL COMMENT '清算编码',
  PRIMARY KEY ("ENTRY_SEQ_NO"),
  UNIQUE KEY "UK_ENTRY_VOUCHER_NO" ("VOUCHER_NO") USING BTREE,
  KEY "IDX_TD_ACCOUNTING_DATE" ("ACCOUNTING_DATE"),
  KEY "I_ENTRY_ACCOUNTNO" ("ACCOUNT_NO"),
  KEY "I_ENTRY_CREATE_TIME" ("CREATE_TIME"),
  KEY "I_ENTRY_SUITENO" ("SUITE_NO"),
  KEY "I_ENTRY_TRANSACTIONNO" ("TRANSACTION_NO")
) ENGINE=InnoDB AUTO_INCREMENT=3524076 DEFAULT CHARSET=utf8 COMMENT='会计分录';

-- ----------------------------
-- Table structure for t_dpm_account_entry_ghost
-- ----------------------------
DROP TABLE IF EXISTS `t_dpm_account_entry_ghost`;
CREATE TABLE "t_dpm_account_entry_ghost" (
  "ENTRY_SEQ_NO" bigint(28) NOT NULL AUTO_INCREMENT COMMENT '主键(自增处理)',
  "TRANSACTION_NO" varchar(32) NOT NULL COMMENT '事务号',
  "SUITE_NO" varchar(32) NOT NULL COMMENT '套号',
  "VOUCHER_NO" varchar(50) DEFAULT NULL COMMENT '凭证号',
  "SYS_TRACE_NO" varchar(32) DEFAULT NULL COMMENT '系统跟踪号',
  "ACCOUNT_NO" varchar(32) NOT NULL COMMENT '账户号',
  "TITLE_NO" varchar(32) DEFAULT NULL COMMENT '科目号',
  "ENTRY_TYPE" decimal(1,0) DEFAULT NULL COMMENT '0:表内分录\r\n            1:表外分录',
  "IS_MANUAL" decimal(1,0) DEFAULT NULL COMMENT '自动手工标志\r\n            0:自动\r\n            1:手工',
  "TXN_CURRENCY" varchar(3) DEFAULT NULL,
  "AMOUNT" decimal(19,4) NOT NULL,
  "TXN_TYPE" decimal(1,0) NOT NULL COMMENT '0-正常\r\n            1-红字\r\n            2-蓝字\r\n            9-抹帐',
  "DIRECTION" decimal(1,0) NOT NULL COMMENT '1:借\r\n            2:贷',
  "AUDIT_STATUS" decimal(1,0) NOT NULL COMMENT '0-未复核\r\n            1-已复核\r\n            2-不需事中复核',
  "STATUS" decimal(1,0) DEFAULT NULL COMMENT '0-未入账\r\n            2-已入账\r\n            3-已抹帐\r\n            9-无效',
  "ACCOUNTING_DATE" varchar(8) NOT NULL,
  "CREATE_TIME" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  "LAST_UPDATE_TIME" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  "BAL_UPDATE_TIME" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  "REMARK" varchar(256) DEFAULT NULL,
  "IS_BUFFER" decimal(1,0) DEFAULT NULL COMMENT '0:未缓冲\r\n            1:缓冲',
  "OLD_ENTRY_SEQ_NO" varchar(32) DEFAULT NULL,
  "SUMMARY" varchar(256) DEFAULT NULL,
  "INPUT_UID" varchar(32) DEFAULT NULL,
  "INPUT_TIME" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  "CHECK_UID" varchar(32) DEFAULT NULL,
  "CHECK_TIME" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  "RSVD_AMT1" decimal(19,4) DEFAULT '0.0000',
  "RSVD_AMT2" decimal(19,4) DEFAULT '0.0000',
  "RSVD_TEXT1" varchar(50) DEFAULT NULL,
  "RSVD_TEXT2" varchar(50) DEFAULT NULL,
  "CONTEXT_VOUCHER_NO" varchar(50) DEFAULT NULL COMMENT '关联结算流水号',
  "OPERATER" decimal(1,0) DEFAULT NULL,
  "CLEARING_CODE" varchar(16) DEFAULT NULL COMMENT '清算编码',
  PRIMARY KEY ("ENTRY_SEQ_NO"),
  UNIQUE KEY "UK_ENTRY_VOUCHER_NO" ("VOUCHER_NO") USING BTREE,
  KEY "IDX_TD_ACCOUNTING_DATE" ("ACCOUNTING_DATE"),
  KEY "I_ENTRY_ACCOUNTNO" ("ACCOUNT_NO"),
  KEY "I_ENTRY_CREATE_TIME" ("CREATE_TIME"),
  KEY "I_ENTRY_SUITENO" ("SUITE_NO"),
  KEY "I_ENTRY_TRANSACTIONNO" ("TRANSACTION_NO")
) ENGINE=InnoDB AUTO_INCREMENT=28212113 DEFAULT CHARSET=utf8 COMMENT='会计分录';

-- ----------------------------
-- Table structure for t_dpm_account_status_log
-- ----------------------------
DROP TABLE IF EXISTS `t_dpm_account_status_log`;
CREATE TABLE "t_dpm_account_status_log" (
  "ID" bigint(20) NOT NULL AUTO_INCREMENT COMMENT '序号_自增',
  "ACCOUNT_NO" varchar(32) NOT NULL COMMENT '账户号',
  "OLD_STATUS_MAP" varchar(6) DEFAULT NULL COMMENT '原状态',
  "NEW_STATUS_MAP" varchar(6) DEFAULT NULL COMMENT '新状态',
  "REMARK" varchar(256) DEFAULT NULL COMMENT '备注',
  "CREATE_TIME" datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  PRIMARY KEY ("ID"),
  KEY "IDX_DOAL_AO" ("ACCOUNT_NO") USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=900850 DEFAULT CHARSET=utf8 COMMENT='账户状态变更记录';

-- ----------------------------
-- Table structure for t_dpm_buffer_detail
-- ----------------------------
DROP TABLE IF EXISTS `t_dpm_buffer_detail`;
CREATE TABLE "t_dpm_buffer_detail" (
  "BUFFER_DETAIL_ID" bigint(32) NOT NULL AUTO_INCREMENT COMMENT '待入账数据流水号',
  "ACCOUNT_NO" varchar(32) NOT NULL COMMENT '账户号',
  "SYS_TRACE_NO" varchar(32) DEFAULT NULL COMMENT '系统跟踪号',
  "VOUCHER_NO" varchar(50) NOT NULL COMMENT '凭证号',
  "TRANSACTION_NO" varchar(32) NOT NULL COMMENT '事务号',
  "AMOUNT" decimal(19,4) NOT NULL COMMENT '金额',
  "CRDR" decimal(1,0) NOT NULL COMMENT '借贷方向:   1:借   2:贷',
  "TXN_TYPE" decimal(1,0) NOT NULL COMMENT '交易类型       0:正常  1:红字   2:蓝字   9:抹帐',
  "ACCOUNTING_RULE" varchar(16) NOT NULL COMMENT '入账规则     0.先贷后借  1.借记   2.贷记  3.冻结',
  "PRODUCT_CODE" varchar(12) DEFAULT NULL COMMENT 'PE产品编码',
  "PAY_CODE" varchar(12) DEFAULT NULL COMMENT 'PE支付编码',
  "STATUS" decimal(1,0) NOT NULL COMMENT '状态   0.待入账  1.成功(不会存在,成功直接删除数据)  2.失败  3.处理中',
  "COUNT" decimal(1,0) NOT NULL COMMENT '执行次数',
  "SUMMARY" varchar(256) DEFAULT NULL COMMENT '摘要',
  "OCCUPY_SIGN" varchar(32) DEFAULT NULL COMMENT '时间戳',
  "REMARK" varchar(256) DEFAULT NULL COMMENT '备注',
  "CREATE_TIME" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  "UPDATE_TIME" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  "SUITE_NO" varchar(32) NOT NULL COMMENT '套号',
  "CONTEXT_VOUCHER_NO" varchar(32) DEFAULT NULL COMMENT '关联凭证号',
  "ACCOUNTING_DATE" varchar(8) DEFAULT NULL COMMENT '会计日',
  "OPERATION_TYPE" decimal(1,0) DEFAULT NULL COMMENT '操作类型',
  "BALANCE_TYPE" decimal(1,0) DEFAULT NULL COMMENT '余额类型',
  PRIMARY KEY ("BUFFER_DETAIL_ID"),
  KEY "IDX_BUFFERDETAIL_CT" ("CREATE_TIME") USING BTREE,
  KEY "IDX_DBD_OS" ("OCCUPY_SIGN") USING BTREE,
  KEY "IDX_STATUS" ("STATUS"),
  KEY "IDX_TRANSNO" ("TRANSACTION_NO")
) ENGINE=InnoDB AUTO_INCREMENT=6516448 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for t_dpm_buffer_detail_log
-- ----------------------------
DROP TABLE IF EXISTS `t_dpm_buffer_detail_log`;
CREATE TABLE "t_dpm_buffer_detail_log" (
  "BUFFER_DETAIL_ID" bigint(32) NOT NULL AUTO_INCREMENT COMMENT '待入账数据流水号',
  "ACCOUNT_NO" varchar(32) NOT NULL COMMENT '账户号',
  "SYS_TRACE_NO" varchar(32) DEFAULT NULL COMMENT '系统跟踪号',
  "VOUCHER_NO" varchar(50) NOT NULL COMMENT '凭证号',
  "TRANSACTION_NO" varchar(32) NOT NULL COMMENT '事务号',
  "AMOUNT" decimal(19,4) NOT NULL COMMENT '金额',
  "CRDR" decimal(1,0) NOT NULL COMMENT '借贷方向  1:借  2:贷',
  "TXN_TYPE" decimal(1,0) NOT NULL COMMENT '交易类型  0:正常  1:红字  2:蓝字  9:抹帐',
  "ACCOUNTING_RULE" varchar(16) NOT NULL COMMENT '入账规则  0.先贷后借(默认)  1.借记  2.贷记  3.冻结',
  "PRODUCT_CODE" varchar(12) DEFAULT NULL COMMENT 'PE产品编码',
  "PAY_CODE" varchar(12) DEFAULT NULL COMMENT 'PE支付编码',
  "SUMMARY" varchar(256) DEFAULT NULL COMMENT '摘要',
  "REMARK" varchar(256) DEFAULT NULL COMMENT '备注',
  "UPDATE_TIME" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  "CREATE_TIME" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  "SUITE_NO" varchar(32) NOT NULL COMMENT '套号',
  "CONTEXT_VOUCHER_NO" varchar(32) DEFAULT NULL COMMENT '关联凭证号',
  "ACCOUNTING_DATE" varchar(8) DEFAULT NULL COMMENT '会计日',
  "OPERATION_TYPE" decimal(1,0) DEFAULT NULL COMMENT '操作类型',
  "BALANCE_TYPE" decimal(1,0) DEFAULT NULL COMMENT '余额类型',
  PRIMARY KEY ("BUFFER_DETAIL_ID")
) ENGINE=InnoDB AUTO_INCREMENT=6516448 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for t_dpm_buffer_outer_detail
-- ----------------------------
DROP TABLE IF EXISTS `t_dpm_buffer_outer_detail`;
CREATE TABLE "t_dpm_buffer_outer_detail" (
  "BUFFER_DETAIL_ID" bigint(32) NOT NULL AUTO_INCREMENT COMMENT '待入账数据流水号',
  "ACCOUNT_NO" varchar(32) NOT NULL COMMENT '账户号',
  "SYS_TRACE_NO" varchar(32) DEFAULT NULL COMMENT '系统跟踪号',
  "VOUCHER_NO" varchar(50) NOT NULL COMMENT '凭证号',
  "TRANSACTION_NO" varchar(32) NOT NULL COMMENT '事务号',
  "AMOUNT" decimal(19,4) NOT NULL COMMENT '金额',
  "CRDR" decimal(1,0) NOT NULL COMMENT '借贷方向:   1:借   2:贷',
  "TXN_TYPE" decimal(1,0) NOT NULL COMMENT '交易类型       0:正常  1:红字   2:蓝字   9:抹帐',
  "ACCOUNTING_RULE" varchar(16) NOT NULL COMMENT '入账规则     0.先贷后借  1.借记   2.贷记  3.冻结',
  "PRODUCT_CODE" varchar(12) DEFAULT NULL COMMENT 'PE产品编码',
  "PAY_CODE" varchar(12) DEFAULT NULL COMMENT 'PE支付编码',
  "STATUS" decimal(1,0) NOT NULL COMMENT '状态   0.待入账  1.成功(不会存在,成功直接删除数据)  2.失败  3.处理中',
  "COUNT" decimal(1,0) NOT NULL COMMENT '执行次数',
  "SUMMARY" varchar(256) DEFAULT NULL COMMENT '摘要',
  "OCCUPY_SIGN" varchar(32) DEFAULT NULL COMMENT '时间戳',
  "REMARK" varchar(256) DEFAULT NULL COMMENT '备注',
  "CREATE_TIME" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  "UPDATE_TIME" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  "SUITE_NO" varchar(32) NOT NULL COMMENT '套号',
  "CONTEXT_VOUCHER_NO" varchar(32) DEFAULT NULL COMMENT '关联凭证号',
  "ACCOUNTING_DATE" varchar(8) DEFAULT NULL COMMENT '会计日',
  "OPERATION_TYPE" decimal(1,0) DEFAULT NULL COMMENT '操作类型',
  "BALANCE_TYPE" decimal(1,0) DEFAULT NULL COMMENT '余额类型',
  PRIMARY KEY ("BUFFER_DETAIL_ID"),
  KEY "IDX_BUFFERDETAIL_CT" ("CREATE_TIME") USING BTREE,
  KEY "IDX_DBD_OS" ("OCCUPY_SIGN") USING BTREE,
  KEY "IDX_TRANSNO" ("TRANSACTION_NO"),
  KEY "IDX_ACCTNO" ("ACCOUNT_NO") USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19361 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for t_dpm_buffer_outer_detail_log
-- ----------------------------
DROP TABLE IF EXISTS `t_dpm_buffer_outer_detail_log`;
CREATE TABLE "t_dpm_buffer_outer_detail_log" (
  "BUFFER_DETAIL_ID" bigint(32) NOT NULL AUTO_INCREMENT COMMENT '待入账数据流水号',
  "ACCOUNT_NO" varchar(32) NOT NULL COMMENT '账户号',
  "SYS_TRACE_NO" varchar(32) DEFAULT NULL COMMENT '系统跟踪号',
  "VOUCHER_NO" varchar(50) NOT NULL COMMENT '凭证号',
  "TRANSACTION_NO" varchar(32) NOT NULL COMMENT '事务号',
  "AMOUNT" decimal(19,4) NOT NULL COMMENT '金额',
  "CRDR" decimal(1,0) NOT NULL COMMENT '借贷方向  1:借  2:贷',
  "TXN_TYPE" decimal(1,0) NOT NULL COMMENT '交易类型  0:正常  1:红字  2:蓝字  9:抹帐',
  "ACCOUNTING_RULE" varchar(16) NOT NULL COMMENT '入账规则  0.先贷后借(默认)  1.借记  2.贷记  3.冻结',
  "PRODUCT_CODE" varchar(12) DEFAULT NULL COMMENT 'PE产品编码',
  "PAY_CODE" varchar(12) DEFAULT NULL COMMENT 'PE支付编码',
  "SUMMARY" varchar(256) DEFAULT NULL COMMENT '摘要',
  "REMARK" varchar(256) DEFAULT NULL COMMENT '备注',
  "UPDATE_TIME" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  "CREATE_TIME" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  "SUITE_NO" varchar(32) NOT NULL COMMENT '套号',
  "CONTEXT_VOUCHER_NO" varchar(32) DEFAULT NULL COMMENT '关联凭证号',
  "ACCOUNTING_DATE" varchar(8) DEFAULT NULL COMMENT '会计日',
  "OPERATION_TYPE" decimal(1,0) DEFAULT NULL COMMENT '操作类型',
  "BALANCE_TYPE" decimal(1,0) DEFAULT NULL COMMENT '余额类型',
  PRIMARY KEY ("BUFFER_DETAIL_ID")
) ENGINE=InnoDB AUTO_INCREMENT=19415 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for t_dpm_buffer_rule
-- ----------------------------
DROP TABLE IF EXISTS `t_dpm_buffer_rule`;
CREATE TABLE "t_dpm_buffer_rule" (
  "BUFFER_RULE_ID" int(28) NOT NULL AUTO_INCREMENT COMMENT '主键(自增处理)',
  "PRODUCT_CODE" varchar(12) NOT NULL COMMENT '产品编码',
  "PAY_CODE" varchar(12) NOT NULL COMMENT 'PE支付编码',
  "ACCOUNT_NO" varchar(32) DEFAULT NULL COMMENT '账户号',
  "STATUS" decimal(1,0) NOT NULL COMMENT '0.有效\r\n            1.无效(已删除)',
  "CRDR" decimal(1,0) NOT NULL COMMENT '0:双向\r\n            1:借\r\n            2:贷',
  "REMARK" varchar(256) DEFAULT NULL COMMENT '备注',
  "UPDATE_TIME" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  "CREATE_TIME" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  "VALID_TIME" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '生效时间',
  "UNVALID_TIME" datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '失效时间',
  PRIMARY KEY ("BUFFER_RULE_ID"),
  UNIQUE KEY "UIDX_BUFFER_RULE" ("PRODUCT_CODE","PAY_CODE","ACCOUNT_NO","CRDR") USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for t_dpm_inner_account
-- ----------------------------
DROP TABLE IF EXISTS `t_dpm_inner_account`;
CREATE TABLE "t_dpm_inner_account" (
  "ACCOUNT_NO" varchar(32) NOT NULL COMMENT '帐号号',
  "ACCOUNT_TITLE_NO" varchar(32) DEFAULT NULL COMMENT '科目号',
  "ACCOUNT_NAME" varchar(64) DEFAULT NULL COMMENT '账户名称',
  "OPEN_DATE" datetime DEFAULT NULL COMMENT '开户日期(创建时间)',
  "BAL_DIRECTION" decimal(1,0) DEFAULT NULL COMMENT '1:借\r\n            2:贷\r\n            0:双向',
  "CURR_BAL_DIRECTION" decimal(1,0) DEFAULT NULL COMMENT '1:借\r\n            2:贷',
  "CURRENCY_CODE" varchar(3) DEFAULT NULL COMMENT '货币类型',
  "BALANCE" decimal(19,4) DEFAULT '0.0000' COMMENT '余额',
  "LAST_UPDATE_TIME" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  PRIMARY KEY ("ACCOUNT_NO")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='T_DPM_INNER_ACCOUNT';

-- ----------------------------
-- Table structure for t_dpm_inner_account_detail
-- ----------------------------
DROP TABLE IF EXISTS `t_dpm_inner_account_detail`;
CREATE TABLE "t_dpm_inner_account_detail" (
  "TXN_SEQ_NO" bigint(28) NOT NULL AUTO_INCREMENT COMMENT '主键(自增处理)',
  "SYS_TRACE_NO" varchar(32) DEFAULT NULL COMMENT '系统跟踪号',
  "ACCOUNTING_DATE" varchar(8) DEFAULT NULL COMMENT '会计日',
  "txn_time" timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '入账时间',
  "ACCOUNT_NO" varchar(32) DEFAULT NULL COMMENT '账户号',
  "TXN_TYPE" decimal(1,0) DEFAULT NULL COMMENT '0:正常\r\n 1:红字\r\n 2:蓝字\r\n 9:抹帐',
  "TXN_DSCPT" varchar(256) DEFAULT NULL COMMENT '摘要',
  "CHANGE_TYPE" decimal(1,0) DEFAULT NULL COMMENT '1: 借贷\r\n 2: 冻结解冻',
  "DIRECTION" varchar(1) DEFAULT NULL COMMENT '1:加(收入)\r\n 2:减(支出)',
  "TXN_AMT" decimal(19,4) DEFAULT NULL COMMENT '交易金额',
  "BEFORE_AMT" decimal(19,4) DEFAULT NULL COMMENT '交易前余额',
  "AFTER_AMT" decimal(19,4) DEFAULT NULL COMMENT '交易后余额',
  "ENTRY_SEQ_NO" varchar(32) DEFAULT NULL,
  "OTHER_ACCOUNT_NO" varchar(32) DEFAULT NULL,
  "OLD_TXN_SEQ_NO" varchar(32) DEFAULT NULL,
  "REMARK" varchar(256) DEFAULT NULL COMMENT '备注',
  "CRDR" decimal(1,0) DEFAULT NULL COMMENT '借贷标志 1借2贷',
  "PRODUCT_CODE" varchar(12) DEFAULT NULL COMMENT 'PE产品编码',
  "PAY_CODE" varchar(12) DEFAULT NULL COMMENT 'PE支付编码',
  "OPERATION_TYPE" decimal(1,0) DEFAULT NULL COMMENT '交易类型',
  "DELETE_SIGN" decimal(1,0) DEFAULT NULL COMMENT '删除标记(冲正用)',
  "SUITE_NO" varchar(32) DEFAULT NULL COMMENT '套号',
  "CONTEXT_VOUCHER_NO" varchar(32) DEFAULT NULL COMMENT '关联结算流水号',
  "TRANSACTION_NO" varchar(32) DEFAULT NULL,
  "VOUCHER_NO" varchar(50) DEFAULT NULL,
  PRIMARY KEY ("TXN_SEQ_NO"),
  UNIQUE KEY "UIDX_IAD_VO" ("VOUCHER_NO"),
  KEY "AK_INNER_KEY_ACCOUNT_NO" ("ACCOUNT_NO"),
  KEY "IDX_DIAD_STN" ("SYS_TRACE_NO"),
  KEY "IDX_DIAD_TXN_TIME" ("txn_time")
) ENGINE=InnoDB AUTO_INCREMENT=2025782 DEFAULT CHARSET=utf8 COMMENT='内部账户余额明细';

-- ----------------------------
-- Table structure for t_dpm_inner_account_detail_ghost
-- ----------------------------
DROP TABLE IF EXISTS `t_dpm_inner_account_detail_ghost`;
CREATE TABLE "t_dpm_inner_account_detail_ghost" (
  "TXN_SEQ_NO" bigint(28) NOT NULL AUTO_INCREMENT COMMENT '主键(自增处理)',
  "SYS_TRACE_NO" varchar(32) DEFAULT NULL COMMENT '系统跟踪号',
  "ACCOUNTING_DATE" varchar(8) DEFAULT NULL COMMENT '会计日',
  "TXN_TIME" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  "ACCOUNT_NO" varchar(32) DEFAULT NULL COMMENT '账户号',
  "TXN_TYPE" decimal(1,0) DEFAULT NULL COMMENT '0:正常\r\n            1:红字\r\n            2:蓝字\r\n            9:抹帐',
  "TXN_DSCPT" varchar(256) DEFAULT NULL COMMENT '摘要',
  "CHANGE_TYPE" decimal(1,0) DEFAULT NULL COMMENT '1: 借贷\r\n            2: 冻结解冻',
  "DIRECTION" varchar(1) DEFAULT NULL COMMENT '1:加(收入)\r\n            2:减(支出)',
  "TXN_AMT" decimal(19,4) DEFAULT NULL COMMENT '交易金额',
  "BEFORE_AMT" decimal(19,4) DEFAULT NULL COMMENT '交易前余额',
  "AFTER_AMT" decimal(19,4) DEFAULT NULL COMMENT '交易后余额',
  "ENTRY_SEQ_NO" varchar(32) DEFAULT NULL,
  "OTHER_ACCOUNT_NO" varchar(32) DEFAULT NULL,
  "OLD_TXN_SEQ_NO" varchar(32) DEFAULT NULL,
  "REMARK" varchar(256) DEFAULT NULL COMMENT '备注',
  "CRDR" decimal(1,0) DEFAULT NULL COMMENT '借贷标志 1借2贷',
  "PRODUCT_CODE" varchar(12) DEFAULT NULL COMMENT 'PE产品编码',
  "PAY_CODE" varchar(12) DEFAULT NULL COMMENT 'PE支付编码',
  "OPERATION_TYPE" decimal(1,0) DEFAULT NULL COMMENT '交易类型',
  "DELETE_SIGN" decimal(1,0) DEFAULT NULL COMMENT '删除标记(冲正用)',
  "SUITE_NO" varchar(32) DEFAULT NULL COMMENT '套号',
  "CONTEXT_VOUCHER_NO" varchar(32) DEFAULT NULL COMMENT '关联结算流水号',
  "TRANSACTION_NO" varchar(32) DEFAULT NULL,
  "VOUCHER_NO" varchar(50) DEFAULT NULL,
  PRIMARY KEY ("TXN_SEQ_NO"),
  UNIQUE KEY "UIDX_IAD_VO" ("VOUCHER_NO"),
  KEY "AK_INNER_KEY_ACCOUNT_NO" ("ACCOUNT_NO"),
  KEY "IDX_DIAD_STN" ("SYS_TRACE_NO"),
  KEY "IDX_DIAD_TXN_TIME" ("TXN_TIME")
) ENGINE=InnoDB AUTO_INCREMENT=10959566 DEFAULT CHARSET=utf8 COMMENT='内部账户余额明细';

-- ----------------------------
-- Table structure for t_dpm_inner_account_diary
-- ----------------------------
DROP TABLE IF EXISTS `t_dpm_inner_account_diary`;
CREATE TABLE "t_dpm_inner_account_diary" (
  "ACCOUNT_NO" varchar(32) NOT NULL,
  "ACCOUNT_DATE" varchar(8) NOT NULL,
  "BEGIN_DR_BAL" decimal(19,4) DEFAULT '0.0000',
  "BEGIN_CR_BAL" decimal(19,4) DEFAULT '0.0000',
  "BEGIN_DR_AVAIL_BAL" decimal(19,4) DEFAULT '0.0000',
  "BEGIN_CR_AVAIL_BAL" decimal(19,4) DEFAULT '0.0000',
  "DEBIT_AMT" decimal(19,4) DEFAULT '0.0000',
  "CREDIT_AMT" decimal(19,4) DEFAULT '0.0000',
  "DEBIT_CNT" decimal(10,0) DEFAULT '0',
  "CREDIT_CNT" decimal(10,0) DEFAULT '0',
  "DEBIT_FROZEN_AMT" decimal(19,4) DEFAULT '0.0000',
  "CREDIT_FROZEN_AMT" decimal(19,4) DEFAULT '0.0000',
  "DEBIT_FROZEN_CNT" decimal(10,0) DEFAULT '0',
  "CREDIT_FROZEN_CNT" decimal(10,0) DEFAULT '0',
  "DEBIT_UNFROZEN_AMT" decimal(19,4) DEFAULT '0.0000',
  "CREDIT_UNFROZEN_AMT" decimal(19,4) DEFAULT '0.0000',
  "DEBIT_UNFROZEN_CNT" decimal(10,0) DEFAULT '0',
  "CREDIT_ENFROZEN_CNT" decimal(10,0) DEFAULT '0',
  "END_DR_BAL" decimal(19,4) DEFAULT '0.0000',
  "END_CR_BAL" decimal(19,4) DEFAULT '0.0000',
  "END_DR_AVAIL_BAL" decimal(19,4) DEFAULT '0.0000',
  "END_CR_AVAIL_BAL" decimal(19,4) DEFAULT '0.0000',
  "IS_FINAL" decimal(1,0) DEFAULT NULL COMMENT '0:已经扎帐\r\n            1:未扎帐',
  "CREATE_TIME" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  "LAST_UPDATE_TIME" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY ("ACCOUNT_NO","ACCOUNT_DATE")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='T_DPM_INNER_ACCOUNT_DIARY';

-- ----------------------------
-- Table structure for t_dpm_management_log
-- ----------------------------
DROP TABLE IF EXISTS `t_dpm_management_log`;
CREATE TABLE "t_dpm_management_log" (
  "TXN_SEQ_NO" int(28) NOT NULL AUTO_INCREMENT COMMENT '主键(自增处理)',
  "SYS_TRACE_NO" varchar(32) DEFAULT NULL,
  "ACCOUNT_ID" varchar(32) DEFAULT NULL,
  "TXN_TYPE" varchar(6) DEFAULT NULL,
  "TXN_DSCPT" varchar(256) DEFAULT NULL,
  "BEFORE_STATUS" varchar(6) DEFAULT NULL,
  "AFTER_STATUS" varchar(6) DEFAULT NULL,
  "REMARK" varchar(256) DEFAULT NULL,
  "INPUT_UID" varchar(32) DEFAULT NULL,
  "INPUT_TIME" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "CHECK_UID" varchar(32) DEFAULT NULL,
  "CHECK_TIME" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  "RESV_FLD1" varchar(50) DEFAULT NULL,
  "RESV_FLD2" varchar(50) DEFAULT NULL,
  "RESV_FLD3" varchar(50) DEFAULT NULL,
  PRIMARY KEY ("TXN_SEQ_NO")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for t_dpm_outer_account
-- ----------------------------
DROP TABLE IF EXISTS `t_dpm_outer_account`;
CREATE TABLE "t_dpm_outer_account" (
  "ACCOUNT_NO" varchar(32) NOT NULL COMMENT '账户号',
  "ACCOUNT_TITLE_NO" varchar(32) DEFAULT NULL COMMENT '科目号',
  "ACCOUNT_NAME" varchar(64) DEFAULT NULL COMMENT '账户名称',
  "OPEN_DATE" datetime DEFAULT NULL COMMENT '开户日期(创建时间)',
  "MEMBER_ID" varchar(15) DEFAULT NULL COMMENT '会员号',
  "STATUS_MAP" varchar(6) DEFAULT NULL COMMENT '第一位:激活状态\r\n            0:未激活\r\n            1:已激活\r\n            第二位:锁定状态\r\n            0:未锁定\r\n            1:已锁定\r\n            第三位:冻结状态\r\n            0:未冻结\r\n            1:借方冻结\r\n            2:贷方冻结\r\n            3:双向冻结\r\n            第四位:销户状态\r\n            0:未销户\r\n     ',
  "ACCOUNT_ATTRIBUTE" decimal(1,0) DEFAULT NULL COMMENT '账户属性 1:对私\r\n              2:对公',
  "ACCOUNT_TYPE" decimal(4,0) DEFAULT NULL COMMENT '账户类型 1:基本户\r\n            2:一般户\r\n            3:专用户\r\n            4:临时户\r\n            5:保证金户',
  "CURR_BAL_DIRECTION" decimal(1,0) DEFAULT NULL COMMENT '当前余额方向 1:借\r\n            2:贷',
  "BAL_DIRECTION" decimal(1,0) DEFAULT NULL COMMENT '账户余额方向 1:借\r\n            2:贷\r\n            0:双向',
  "CURRENCY_CODE" varchar(3) DEFAULT NULL COMMENT '货币类型',
  "LAST_UPDATE_TIME" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  "REQUEST_NO" varchar(32) NOT NULL COMMENT '开外部户请求请求号:不可为空 需唯一',
  PRIMARY KEY ("ACCOUNT_NO"),
  UNIQUE KEY "UIDX_DOAO_RO" ("REQUEST_NO") USING BTREE,
  KEY "IDX_OA_MEMBER_ID" ("MEMBER_ID") USING BTREE,
  KEY "IDX_T_DPM_OUTER_ACCOUNT" ("OPEN_DATE") USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_dpm_outer_account_change_router
-- ----------------------------
DROP TABLE IF EXISTS `t_dpm_outer_account_change_router`;
CREATE TABLE "t_dpm_outer_account_change_router" (
  "id" int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  "account_no" varchar(64) DEFAULT NULL COMMENT '账户号',
  "fund_type" varchar(20) DEFAULT NULL COMMENT '资金类型。DR：借记，CR：贷记，FR：冻结',
  "extension" varchar(20000) DEFAULT NULL COMMENT '时间索引扩展，yyyyMMdd，分割',
  "last_update_time" datetime DEFAULT NULL COMMENT '最近一次动账更新时间',
  "create_time" datetime DEFAULT NULL COMMENT '数据创建日期',
  "update_time" datetime DEFAULT NULL COMMENT '数据更新日期',
  PRIMARY KEY ("id"),
  UNIQUE KEY "idx_tdoacr_accountNo" ("account_no","fund_type")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='外部户账户动账路由表';

-- ----------------------------
-- Table structure for t_dpm_outer_account_change_sub_detail_20200923
-- ----------------------------
DROP TABLE IF EXISTS `t_dpm_outer_account_change_sub_detail_20200923`;
CREATE TABLE "t_dpm_outer_account_change_sub_detail_20200923" (
  "ACCOUNT_SUBSET_LOG_ID" bigint(32) unsigned NOT NULL AUTO_INCREMENT COMMENT '分户账户余额明细',
  "ACCOUNT_NO" varchar(32) NOT NULL COMMENT '账户号',
  "FUND_TYPE" varchar(16) NOT NULL COMMENT '资金属性  1,借记  2.贷记',
  "BALANCE_TYPE" decimal(1,0) NOT NULL COMMENT '余额类型  1.普通  2.冻结',
  "SYS_TRACE_NO" varchar(32) DEFAULT NULL COMMENT '系统跟踪号',
  "VOUCHER_NO" varchar(50) NOT NULL COMMENT '凭证号',
  "TXN_AMT" decimal(19,4) DEFAULT NULL COMMENT '交易金额',
  "AFTER_AMT" decimal(19,4) DEFAULT NULL COMMENT '交易后余额',
  "ACCOUNTING_RULE" varchar(16) NOT NULL COMMENT '入账规则  0.先贷后借(默认)  1.借记  2.贷记  3.冻结',
  "REMARK" varchar(256) DEFAULT NULL COMMENT '备注',
  "UPDATE_TIME" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  "CREATE_TIME" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  "DIRECTION" decimal(1,0) NOT NULL COMMENT '1:加(收入)  2:减(支出)',
  "account_date" varchar(10) DEFAULT NULL COMMENT '账务日期',
  PRIMARY KEY ("ACCOUNT_SUBSET_LOG_ID"),
  KEY "idx_tdoacsd_accountNo" ("account_date","ACCOUNT_NO"),
  KEY "idx_tdoacsd_voucherNo" ("VOUCHER_NO")
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_dpm_outer_account_copy
-- ----------------------------
DROP TABLE IF EXISTS `t_dpm_outer_account_copy`;
CREATE TABLE "t_dpm_outer_account_copy" (
  "ACCOUNT_NO" varchar(32) NOT NULL COMMENT '账户号',
  "ACCOUNT_TITLE_NO" varchar(32) DEFAULT NULL COMMENT '科目号',
  "ACCOUNT_NAME" varchar(64) DEFAULT NULL COMMENT '账户名称',
  "OPEN_DATE" datetime DEFAULT NULL COMMENT '开户日期(创建时间)',
  "MEMBER_ID" varchar(15) DEFAULT NULL COMMENT '会员号',
  "STATUS_MAP" varchar(6) DEFAULT NULL COMMENT '第一位:激活状态\r\n            0:未激活\r\n            1:已激活\r\n            第二位:锁定状态\r\n            0:未锁定\r\n            1:已锁定\r\n            第三位:冻结状态\r\n            0:未冻结\r\n            1:借方冻结\r\n            2:贷方冻结\r\n            3:双向冻结\r\n            第四位:销户状态\r\n            0:未销户\r\n     ',
  "ACCOUNT_ATTRIBUTE" decimal(1,0) DEFAULT NULL COMMENT '账户属性 1:对私\r\n              2:对公',
  "ACCOUNT_TYPE" decimal(4,0) DEFAULT NULL COMMENT '账户类型 1:基本户\r\n            2:一般户\r\n            3:专用户\r\n            4:临时户\r\n            5:保证金户',
  "CURR_BAL_DIRECTION" decimal(1,0) DEFAULT NULL COMMENT '当前余额方向 1:借\r\n            2:贷',
  "BAL_DIRECTION" decimal(1,0) DEFAULT NULL COMMENT '账户余额方向 1:借\r\n            2:贷\r\n            0:双向',
  "CURRENCY_CODE" varchar(3) DEFAULT NULL COMMENT '货币类型',
  "LAST_UPDATE_TIME" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  "REQUEST_NO" varchar(32) NOT NULL COMMENT '开外部户请求请求号:不可为空 需唯一',
  PRIMARY KEY ("ACCOUNT_NO"),
  UNIQUE KEY "UIDX_DOAO_RO" ("REQUEST_NO") USING BTREE,
  KEY "IDX_OA_MEMBER_ID" ("MEMBER_ID") USING BTREE,
  KEY "IDX_T_DPM_OUTER_ACCOUNT" ("OPEN_DATE") USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for t_dpm_outer_account_ctrl
-- ----------------------------
DROP TABLE IF EXISTS `t_dpm_outer_account_ctrl`;
CREATE TABLE "t_dpm_outer_account_ctrl" (
  "REQUEST_NO" varchar(32) NOT NULL COMMENT '开外部户请求请求号:不可为空 需唯一',
  "MEMBER_ID" varchar(32) NOT NULL COMMENT '会员ID',
  "GMT_MODIFIED" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后修改时间',
  "GMT_CREATE" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  PRIMARY KEY ("REQUEST_NO"),
  UNIQUE KEY "UIDX_DOA_RO" ("MEMBER_ID") USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for t_dpm_outer_account_detail
-- ----------------------------
DROP TABLE IF EXISTS `t_dpm_outer_account_detail`;
CREATE TABLE "t_dpm_outer_account_detail" (
  "TXN_SEQ_NO" bigint(28) NOT NULL AUTO_INCREMENT COMMENT '主键(自增处理)',
  "SYS_TRACE_NO" varchar(32) DEFAULT NULL COMMENT '系统跟踪号',
  "ACCOUNTING_DATE" varchar(8) DEFAULT NULL COMMENT '会计日',
  "txn_time" timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '入账时间',
  "ACCOUNT_NO" varchar(32) DEFAULT NULL COMMENT '账户号',
  "TXN_TYPE" decimal(1,0) DEFAULT NULL COMMENT '0:正常 1:红字 2:蓝字 9:抹帐',
  "TXN_DSCPT" varchar(256) DEFAULT NULL COMMENT '摘要',
  "CHANGE_TYPE" decimal(1,0) DEFAULT NULL COMMENT '1: 借贷 2: 冻结解冻',
  "DIRECTION" decimal(1,0) DEFAULT NULL COMMENT '1:加(收入) 2:减(支出)',
  "FROZEN_FLAG" varchar(1) DEFAULT NULL COMMENT '1:冻结 2:解冻',
  "TXN_AMT" decimal(19,4) DEFAULT NULL COMMENT '交易金额',
  "BEFORE_AMT" decimal(19,4) DEFAULT NULL COMMENT '交易前余额',
  "AFTER_AMT" decimal(19,4) DEFAULT NULL COMMENT '交易后余额',
  "ENTRY_SEQ_NO" varchar(32) DEFAULT NULL COMMENT '分录号',
  "OTHER_ACCOUNT_NO" varchar(32) DEFAULT NULL COMMENT '关联账户号',
  "OLD_TXN_SEQ_NO" varchar(32) DEFAULT NULL COMMENT '原始明细流水号',
  "REMARK" varchar(256) DEFAULT NULL COMMENT '备注',
  "CRDR" decimal(1,0) DEFAULT NULL COMMENT '借贷标志 1借2贷',
  "PRODUCT_CODE" varchar(12) DEFAULT NULL COMMENT 'PE产品编码',
  "PAY_CODE" varchar(12) DEFAULT NULL COMMENT 'PE支付编码',
  "OPERATION_TYPE" decimal(1,0) DEFAULT NULL COMMENT '操作类型：1 正常交易，2 冻结资金，3 解冻资金',
  "DELETE_SIGN" decimal(1,0) DEFAULT NULL COMMENT '删除标记(冲正用)',
  "SUITE_NO" varchar(32) DEFAULT NULL COMMENT '套号',
  "CONTEXT_VOUCHER_NO" varchar(32) DEFAULT NULL COMMENT '关联结算流水号',
  "ACCOUNTING_RULE" varchar(16) DEFAULT NULL COMMENT '入账规则 0.先贷后借(默认) 1.借记 2.贷记 3.冻结',
  "TRANSACTION_NO" varchar(32) DEFAULT NULL COMMENT '事务号',
  "VOUCHER_NO" varchar(50) DEFAULT NULL COMMENT '凭证号',
  PRIMARY KEY ("TXN_SEQ_NO"),
  UNIQUE KEY "UIDX_OAD_VO" ("VOUCHER_NO"),
  KEY "IDX_DOAD_AN" ("ACCOUNT_NO"),
  KEY "IDX_DOAD_STN" ("SYS_TRACE_NO"),
  KEY "IDX_DOA_AN_TT" ("ACCOUNT_NO","txn_time"),
  KEY "IDX_DOA_TT" ("txn_time")
) ENGINE=InnoDB AUTO_INCREMENT=1678513 DEFAULT CHARSET=utf8 COMMENT='外部户账户明细表';

-- ----------------------------
-- Table structure for t_dpm_outer_account_detail_ghost
-- ----------------------------
DROP TABLE IF EXISTS `t_dpm_outer_account_detail_ghost`;
CREATE TABLE "t_dpm_outer_account_detail_ghost" (
  "TXN_SEQ_NO" bigint(28) NOT NULL AUTO_INCREMENT COMMENT '主键(自增处理)',
  "SYS_TRACE_NO" varchar(32) DEFAULT NULL COMMENT '系统跟踪号',
  "ACCOUNTING_DATE" varchar(8) DEFAULT NULL COMMENT '会计日',
  "TXN_TIME" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '交易时间',
  "ACCOUNT_NO" varchar(32) DEFAULT NULL COMMENT '账户号',
  "TXN_TYPE" decimal(1,0) DEFAULT NULL COMMENT '0:正常  1:红字  2:蓝字  9:抹帐',
  "TXN_DSCPT" varchar(256) DEFAULT NULL COMMENT '摘要',
  "CHANGE_TYPE" decimal(1,0) DEFAULT NULL COMMENT '1: 借贷  2: 冻结解冻',
  "DIRECTION" decimal(1,0) DEFAULT NULL COMMENT '1:加(收入)  2:减(支出)',
  "FROZEN_FLAG" varchar(1) DEFAULT NULL COMMENT '1:冻结  2:解冻',
  "TXN_AMT" decimal(19,4) DEFAULT NULL COMMENT '交易金额',
  "BEFORE_AMT" decimal(19,4) DEFAULT NULL COMMENT '交易前余额',
  "AFTER_AMT" decimal(19,4) DEFAULT NULL COMMENT '交易后余额',
  "ENTRY_SEQ_NO" varchar(32) DEFAULT NULL COMMENT '分录号',
  "OTHER_ACCOUNT_NO" varchar(32) DEFAULT NULL COMMENT '关联账户号',
  "OLD_TXN_SEQ_NO" varchar(32) DEFAULT NULL COMMENT '原始明细流水号',
  "REMARK" varchar(256) DEFAULT NULL COMMENT '备注',
  "CRDR" decimal(1,0) DEFAULT NULL COMMENT '借贷标志 1借2贷',
  "PRODUCT_CODE" varchar(12) DEFAULT NULL COMMENT 'PE产品编码',
  "PAY_CODE" varchar(12) DEFAULT NULL COMMENT 'PE支付编码',
  "OPERATION_TYPE" decimal(1,0) DEFAULT NULL COMMENT '操作类型',
  "DELETE_SIGN" decimal(1,0) DEFAULT NULL COMMENT '删除标记(冲正用)',
  "SUITE_NO" varchar(32) DEFAULT NULL COMMENT '套号',
  "CONTEXT_VOUCHER_NO" varchar(32) DEFAULT NULL COMMENT '关联结算流水号',
  "ACCOUNTING_RULE" varchar(16) DEFAULT NULL COMMENT '入账规则  0.先贷后借(默认)  1.借记  2.贷记  3.冻结',
  "TRANSACTION_NO" varchar(32) DEFAULT NULL COMMENT '事务号',
  "VOUCHER_NO" varchar(50) DEFAULT NULL COMMENT '凭证号',
  PRIMARY KEY ("TXN_SEQ_NO"),
  UNIQUE KEY "UIDX_OAD_VO" ("VOUCHER_NO") USING BTREE,
  KEY "IDX_DOAD_AN" ("ACCOUNT_NO") USING BTREE,
  KEY "IDX_DOAD_STN" ("SYS_TRACE_NO") USING BTREE,
  KEY "IDX_DOA_AN_TT" ("ACCOUNT_NO","TXN_TIME") USING BTREE,
  KEY "IDX_DOA_TT" ("TXN_TIME") USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14452769 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for t_dpm_outer_account_diary
-- ----------------------------
DROP TABLE IF EXISTS `t_dpm_outer_account_diary`;
CREATE TABLE "t_dpm_outer_account_diary" (
  "ACCOUNT_NO" varchar(32) NOT NULL,
  "ACCOUNT_DATE" varchar(8) NOT NULL,
  "BEGIN_DR_BAL" decimal(19,4) DEFAULT '0.0000',
  "BEGIN_CR_BAL" decimal(19,4) DEFAULT '0.0000',
  "BEGIN_DR_AVAIL_BAL" decimal(19,4) DEFAULT '0.0000',
  "BEGIN_CR_AVAIL_BAL" decimal(19,4) DEFAULT '0.0000',
  "DEBIT_AMT" decimal(19,4) DEFAULT '0.0000',
  "CREDIT_AMT" decimal(19,4) DEFAULT '0.0000',
  "DEBIT_CNT" decimal(10,0) DEFAULT '0',
  "CREDIT_CNT" decimal(10,0) DEFAULT '0',
  "DEBIT_FROZEN_AMT" decimal(19,4) DEFAULT '0.0000',
  "CREDIT_FROZEN_AMT" decimal(19,4) DEFAULT '0.0000',
  "DEBIT_FROZEN_CNT" decimal(10,0) DEFAULT '0',
  "CREDIT_FROZEN_CNT" decimal(10,0) DEFAULT '0',
  "DEBIT_UNFROZEN_AMT" decimal(19,4) DEFAULT '0.0000',
  "CREDIT_UNFROZEN_AMT" decimal(19,4) DEFAULT '0.0000',
  "DEBIT_UNFROZEN_CNT" decimal(10,0) DEFAULT '0',
  "CREDIT_ENFROZEN_CNT" decimal(10,0) DEFAULT '0',
  "END_DR_BAL" decimal(19,4) DEFAULT '0.0000',
  "END_CR_BAL" decimal(19,4) DEFAULT '0.0000',
  "END_DR_AVAIL_BAL" decimal(19,4) DEFAULT '0.0000',
  "END_CR_AVAIL_BAL" decimal(19,4) DEFAULT '0.0000',
  "IS_FINAL" decimal(1,0) DEFAULT NULL COMMENT '0:已经扎帐\r\n            1:未扎帐',
  "LAST_UPDATE_TIME" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "CREATE_TIME" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY ("ACCOUNT_NO","ACCOUNT_DATE")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for t_dpm_outer_account_subset
-- ----------------------------
DROP TABLE IF EXISTS `t_dpm_outer_account_subset`;
CREATE TABLE "t_dpm_outer_account_subset" (
  "ACCOUNT_NO" varchar(32) NOT NULL COMMENT '账号',
  "BALANCE" decimal(19,4) NOT NULL COMMENT '余额',
  "FUND_TYPE" varchar(16) NOT NULL COMMENT '资金属性  1、DR,借记  2、CR.贷记 3、FR.冻结',
  "BALANCE_TYPE" decimal(1,0) DEFAULT NULL COMMENT '余额类型',
  "REMARK" varchar(256) DEFAULT NULL COMMENT '备注',
  "UPDATE_TIME" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  "CREATE_TIME" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  PRIMARY KEY ("ACCOUNT_NO","FUND_TYPE")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='外部户分户账表';

-- ----------------------------
-- Table structure for t_dpm_outer_account_sub_detail
-- ----------------------------
DROP TABLE IF EXISTS `t_dpm_outer_account_sub_detail`;
CREATE TABLE "t_dpm_outer_account_sub_detail" (
  "ACCOUNT_SUBSET_LOG_ID" bigint(32) unsigned NOT NULL AUTO_INCREMENT COMMENT '分户账户余额明细',
  "ACCOUNT_NO" varchar(32) NOT NULL COMMENT '账户号',
  "FUND_TYPE" varchar(16) NOT NULL COMMENT '资金属性  1,借记  2.贷记',
  "BALANCE_TYPE" decimal(1,0) NOT NULL COMMENT '余额类型  1.普通  2.冻结',
  "SYS_TRACE_NO" varchar(32) DEFAULT NULL COMMENT '系统跟踪号',
  "VOUCHER_NO" varchar(50) NOT NULL COMMENT '凭证号',
  "TXN_AMT" decimal(19,4) DEFAULT NULL COMMENT '交易金额',
  "AFTER_AMT" decimal(19,4) DEFAULT NULL COMMENT '交易后余额',
  "ACCOUNTING_RULE" varchar(16) NOT NULL COMMENT '入账规则  0.先贷后借(默认)  1.借记  2.贷记  3.冻结',
  "REMARK" varchar(256) DEFAULT NULL COMMENT '备注',
  "UPDATE_TIME" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  "CREATE_TIME" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  "DIRECTION" decimal(1,0) NOT NULL COMMENT '1:加(收入)  2:减(支出)',
  PRIMARY KEY ("ACCOUNT_SUBSET_LOG_ID"),
  KEY "IDX_ACCOUNT_SUB_DTL_VOUCH" ("VOUCHER_NO") USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16174778 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for t_dpm_pay_package
-- ----------------------------
DROP TABLE IF EXISTS `t_dpm_pay_package`;
CREATE TABLE "t_dpm_pay_package" (
  "PACKAGE_NO" varchar(32) NOT NULL,
  "APP_ID" varchar(10) DEFAULT NULL,
  "ACCOUNTING_MODEL" decimal(1,0) NOT NULL COMMENT '0:自动\r\n            1:一个事务内完成\r\n            2：逐笔完成',
  "ASYN" decimal(1,0) NOT NULL COMMENT '0:同步\r\n            1:异步',
  "MAC" varchar(32) DEFAULT NULL,
  "TOTAL_CNT" decimal(6,0) DEFAULT NULL,
  "SUCCESS_CNT" decimal(6,0) DEFAULT NULL,
  "FAIL_CNT" decimal(6,0) DEFAULT NULL,
  "STATUS" decimal(1,0) NOT NULL COMMENT '0:初始\r\n            1：处理中\r\n            2:入账完成(成功)\r\n            3:入账失败,处理中\r\n            4:入账完成(失败)',
  "ACCOUNTING_DESC" varchar(128) DEFAULT NULL,
  "RETRY_CNT" decimal(6,0) DEFAULT NULL,
  "NOTIFY_URL" varchar(128) DEFAULT NULL,
  "NOTIFY_STATUS" decimal(1,0) DEFAULT NULL COMMENT '0:初始\r\n            1:通知成功　\r\n            2:通知失败',
  "NOTIFY_DESC" varchar(64) DEFAULT NULL,
  "LAST_UPDATE_TIME" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "CREATE_TIME" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  "REMARK" varchar(256) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY ("PACKAGE_NO")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for t_dpm_pay_transaction
-- ----------------------------
DROP TABLE IF EXISTS `t_dpm_pay_transaction`;
CREATE TABLE "t_dpm_pay_transaction" (
  "TRANSACTION_ID" bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  "PACKAGE_NO" varchar(32) DEFAULT NULL COMMENT '包号，批量入帐时用',
  "TRANSACTION_NO" varchar(32) NOT NULL COMMENT '事务流水号(PE支付流水号)',
  "APP_ID" varchar(10) DEFAULT NULL COMMENT '应用ID',
  "SYS_TRACE_NO" varchar(32) DEFAULT NULL COMMENT '入账请求流水号(CS清算ID)',
  "TXN_TYPE" decimal(1,0) NOT NULL COMMENT '0:正常\r\n            1:红字\r\n            2:蓝字\r\n            9:抹帐',
  "PRODUCT_CODE" varchar(12) DEFAULT NULL COMMENT 'PE产品编码',
  "PAY_CODE" varchar(12) DEFAULT NULL COMMENT 'PE支付编码',
  "STATUS" decimal(1,0) NOT NULL COMMENT '0:初始\r\n            1：处理中\r\n            2:入账完成(成功)\r\n            3:入账失败,处理中\r\n            4:入账完成(失败)',
  "ACCOUNTING_DATE" varchar(8) NOT NULL COMMENT '会计日',
  "LAST_UPDATE_TIME" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  "CREATE_TIME" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '插入时间',
  "REMARK" varchar(256) DEFAULT NULL COMMENT '备注',
  "CONTEXT_TRANS_NO" varchar(32) DEFAULT NULL COMMENT '关联事务号，回滚用?',
  PRIMARY KEY ("TRANSACTION_ID"),
  UNIQUE KEY "UDX_PAYSEQNO_CLEARINGNO" ("TRANSACTION_NO") USING BTREE,
  KEY "IDX_DPT_TO" ("SYS_TRACE_NO") USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17672844 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for t_dpm_pay_transaction_ghost
-- ----------------------------
DROP TABLE IF EXISTS `t_dpm_pay_transaction_ghost`;
CREATE TABLE "t_dpm_pay_transaction_ghost" (
  "TRANSACTION_ID" bigint(28) NOT NULL AUTO_INCREMENT COMMENT '主键(自增处理)',
  "PACKAGE_NO" varchar(32) DEFAULT NULL COMMENT '包号，批量入帐时用',
  "TRANSACTION_NO" varchar(32) NOT NULL COMMENT '事务流水号(PE支付流水号)',
  "APP_ID" varchar(10) DEFAULT NULL COMMENT '应用ID',
  "SYS_TRACE_NO" varchar(32) DEFAULT NULL COMMENT '入账请求流水号(CS清算ID)',
  "TXN_TYPE" decimal(1,0) NOT NULL COMMENT '0:正常\r\n 1:红字\r\n 2:蓝字\r\n 9:抹帐',
  "PRODUCT_CODE" varchar(12) DEFAULT NULL COMMENT 'PE产品编码',
  "PAY_CODE" varchar(12) DEFAULT NULL COMMENT 'PE支付编码',
  "STATUS" decimal(1,0) NOT NULL COMMENT '0:初始\r\n 1：处理中\r\n 2:入账完成(成功)\r\n 3:入账失败,处理中\r\n 4:入账完成(失败)',
  "ACCOUNTING_DATE" varchar(8) NOT NULL COMMENT '会计日',
  "LAST_UPDATE_TIME" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  "CREATE_TIME" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '插入时间',
  "REMARK" varchar(256) DEFAULT NULL COMMENT '备注',
  "CONTEXT_TRANS_NO" varchar(32) DEFAULT NULL COMMENT '关联事务号，回滚用的',
  PRIMARY KEY ("TRANSACTION_ID"),
  UNIQUE KEY "UDX_PAYSEQNO_CLEARINGNO" ("TRANSACTION_NO"),
  KEY "IDX_DPT_TO" ("SYS_TRACE_NO")
) ENGINE=InnoDB AUTO_INCREMENT=255359 DEFAULT CHARSET=utf8 COMMENT='T_DPM_PAY_TRANSACTION';

-- ----------------------------
-- Table structure for t_dpm_subacc_fundattribute
-- ----------------------------
DROP TABLE IF EXISTS `t_dpm_subacc_fundattribute`;
CREATE TABLE "t_dpm_subacc_fundattribute" (
  "ACCOUNT_TYPE" decimal(4,0) NOT NULL COMMENT '账户类型',
  "CURRENCY_CODE" varchar(3) NOT NULL COMMENT '币种',
  "FUND_TYPE" varchar(16) NOT NULL COMMENT '资金属性',
  "REMARK" varchar(200) DEFAULT NULL COMMENT '备注',
  "GMT_CREATED" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  "GMT_MODIFIED" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  UNIQUE KEY "UK_TDAF_ACCOUNT_TYPE" ("ACCOUNT_TYPE","CURRENCY_CODE","FUND_TYPE")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='外部户资金属性配置表';

-- ----------------------------
-- Table structure for t_dpm_wccarrier_account_file
-- ----------------------------
DROP TABLE IF EXISTS `t_dpm_wccarrier_account_file`;
CREATE TABLE "t_dpm_wccarrier_account_file" (
  "id" int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  "file_code" varchar(200) NOT NULL COMMENT '文件名，该字段取值独立且唯一。\n规则：清算日期_对账主体号_对账类型_对账状态',
  "file_path" varchar(200) DEFAULT NULL COMMENT '账单文件存放路径。路径存放在UFS服务器上。',
  "opr_status" varchar(32) DEFAULT NULL COMMENT '操作状态。有如下值：\nINIT:初始状态\nGENERATED:生成文件成功\nGENERATE_FAIL：生成文件失败\nUPLOADING:文件上传中\nUPLOAD_FAIL:文件上传失败\nUPLOADED:文件上传成功',
  "gmt_create" datetime DEFAULT NULL COMMENT '该条记录创建时间',
  "gmt_update" datetime DEFAULT NULL COMMENT '该条记录变更时间',
  PRIMARY KEY ("id"),
  UNIQUE KEY "idx_file_code" ("file_code")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='无车承运人导出账单文件的存放关系';

-- ----------------------------
-- Table structure for t_member_info
-- ----------------------------
DROP TABLE IF EXISTS `t_member_info`;
CREATE TABLE "t_member_info" (
  "MEMBER_ID" varchar(32) NOT NULL COMMENT '会员ID(由seq_member_id 生成, 个人1开头，企业2开头)',
  "member_name" varchar(255) DEFAULT NULL COMMENT '会员名称',
  "IDENTITY" varchar(50) NOT NULL COMMENT '会员标识'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for t_sequence
-- ----------------------------
DROP TABLE IF EXISTS `t_sequence`;
CREATE TABLE "t_sequence" (
  "name" varchar(32) NOT NULL,
  "current_value" int(11) NOT NULL,
  "increment" smallint(6) NOT NULL,
  "total" smallint(8) NOT NULL,
  "threshold" smallint(4) NOT NULL,
  PRIMARY KEY ("name")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Procedure structure for proc_title_daily_stat
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_title_daily_stat`;
DELIMITER ;;
CREATE DEFINER="hcb_vk_w01"@"%" PROCEDURE "proc_title_daily_stat"(IN `account_date_in` varchar(10),OUT `result_code` varchar(20),OUT `error_level` varchar(10),OUT `error_message` varchar(100))
BEGIN
 DECLARE v_lastdate VARCHAR(8);
 DECLARE i_account_date VARCHAR(8); 
 DECLARE i_pre_date VARCHAR(8);
 DECLARE v_jobid BIGINT DEFAULT 0;
 DECLARE error_code BIGINT DEFAULT 0;
 DECLARE i_title_code        VARCHAR(20);
 DECLARE i_balance_direction CHAR(1); 
 DECLARE i_currency          VARCHAR(10); 
 DECLARE i_debit_count       BIGINT(15); 
 DECLARE i_debit_amount      NUMERIC(15,4); 
 DECLARE i_credit_amount     NUMERIC(15,4); 
 DECLARE i_credit_count      BIGINT(15); 
 DECLARE notfound int(1);
 DECLARE too_early_exception CONDITION FOR SQLSTATE '45001';
 DECLARE multirun_exception CONDITION FOR SQLSTATE '45002';
 DECLARE date_format_exception CONDITION FOR SQLSTATE '45003'; 
 DECLARE cs_title_daily_group  CURSOR for
    SELECT E.TITLE_NO AS TITLE_CODE,
           T.BALANCE_DIRECTION, 
           case
             when E.TXN_CURRENCY = 'CNY' then
              1
           end as CURRENCY,

           SUM(case DIRECTION
                 when 1 then
                  E.AMOUNT
                 else
                  0
               end) AS DEBIT_AMOUNT, 
           SUM(case DIRECTION
                 when 2 then
                  E.AMOUNT
                 else
                  0
               end) AS CREDIT_AMOUNT, 
           sum(case DIRECTION
                 when 1 then
                  1
                 else
                  0
               end) AS DEBIT_COUNT, 
           sum(case DIRECTION
                 when 2 then
                  1
                 else
                  0
               end) AS CREDIT_COUNT 
      FROM DPM.T_DPM_ACCOUNT_ENTRY E, DPM.T_ACT_ACCOUNT_TITILE T
     WHERE E.ACCOUNTING_DATE = account_date_in AND E.TITLE_NO = T.TITLE_CODE
       AND E.TITLE_NO IS NOT NULL
     GROUP BY E.TITLE_NO, E.TXN_CURRENCY, T.BALANCE_DIRECTION;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET notfound = 1;



DECLARE EXIT HANDLER FOR too_early_exception
BEGIN
    SET result_code = 'too_early_exception';
    SET error_level = 'F';
    
    update dbajoblog
       set enddate = NOW(), jobstatus = 'failed', comments = result_code
     where jobid = v_jobid;
    commit;
END;
  DECLARE EXIT HANDLER FOR multirun_exception
BEGIN
    SET result_code = 'multirun_exception';
    SET error_level = 'F';
    
    update dbajoblog
       set enddate = NOW(), jobstatus = 'failed', comments = result_code
     where jobid = v_jobid;
    commit;
END;
  DECLARE EXIT HANDLER FOR date_format_exception
BEGIN
    ROLLBACK;
    SET result_code   = 'date_format_exception';
    SET error_level   = 'F';
    SET error_message = SUBSTRB(SQLERRM, 1, 1024);
    
    update dbajoblog
     set enddate = NOW(), jobstatus = 'failed', comments = result_code
     where jobid = v_jobid;
    commit;
END;
  
insert into dpm.dbajoblog
    (jobname, startdate, enddate, jobstatus, comments, parameter)
  values
    (
     'dpm.proc_title_daily_stat',
     NOW(),
     null,
     'running',
     null,
     concat('account_date:' ,account_date_in));
select LAST_INSERT_ID() into v_jobid from dbajoblog limit 1;
  commit;

BEGIN
  
    set i_account_date = DATE_FORMAT(STR_TO_DATE(account_date_in, '%Y%m%d'), '%Y%m%d'); 
    set i_pre_date= DATE_FORMAT(STR_TO_DATE(account_date_in, '%Y%m%d')-INTERVAL 1 DAY,'%Y%m%d'); 
  
if LENGTH(account_date_in)>8 THEN
     SIGNAL date_format_exception;
ELSEIF i_account_date < '20120101' or
     i_account_date > DATE_FORMAT(DATE_SUB(now(),INTERVAL 1 DAY), '%Y%m%d') then
     SIGNAL too_early_exception;
  end if;
END;
  
 select jobstatus
    into v_lastdate
    from dbajobconf
   where jobname = 'dpm.proc_title_daily_stat';
 
  if v_lastdate < i_pre_date then
   SET max_sp_recursion_depth=200;
   call proc_title_daily_stat(
                              i_pre_date,
                              result_code, 
                              error_level, 
                              error_message 
                              );

    
  ELSEIF v_lastdate >= i_account_date then
      SIGNAL multirun_exception;
  end if;

OPEN cs_title_daily_group;
SET account_date_in=i_account_date;
dept_cursor: LOOP
    FETCH cs_title_daily_group 
      INTO i_title_code,
           i_balance_direction,
           i_currency,
           i_debit_amount,
           i_credit_amount,
           i_debit_count,
           i_credit_count;  
 if notfound=1 THEN 
    leave dept_cursor;
    end if; 
   INSERT INTO tb_title_daily 
      (
       ACCOUNT_DATE,
       TITLE_CODE,
       BALANCE_DIRECTION,
       DEBIT_AMOUNT,
       CREDIT_AMOUNT,
       DEBIT_COUNT,
       CREDIT_COUNT,
       DEBIT_BALANCE,
       CREDIT_BALANCE,
       CURRENCY,
       GMT_CREATE,
       GMT_MODIFIED)
    VALUES
      (
       i_account_date,
       i_title_code,
       i_balance_direction,
       i_debit_amount,
       i_credit_amount,
       i_debit_count,
       i_credit_count,
       i_debit_amount,
       i_credit_amount,
       i_currency,
       NOW(),
       NOW());
  END LOOP dept_cursor;
CLOSE  cs_title_daily_group; 
 
 
  INSERT INTO tb_title_daily (ACCOUNT_DATE,
       TITLE_CODE,
       BALANCE_DIRECTION,
       DEBIT_AMOUNT,
       CREDIT_AMOUNT,
       DEBIT_COUNT,
       CREDIT_COUNT,
       DEBIT_BALANCE,
       CREDIT_BALANCE,
       CURRENCY,
       GMT_CREATE,
       GMT_MODIFIED) select accountDate,titleCode,balanceDirection,debitAmount,creditAmount,debitCount,creditCount,debitBalance,creditBalance,curr,NOW() as GMT_CREATE,NOW() as GMT_MODIFIED from (SELECT ACCOUNT_DATE AS accountDate,SUBSTR(title_code, 1, 7) AS titleCode,title_code,
                balance_direction AS balanceDirection,
                currency AS curr,
                SUM(debit_balance) AS debitBalance,
                SUM(credit_balance) AS creditBalance,
                SUM(debit_count) AS debitCount,
                SUM(credit_count) AS creditCount,
                SUM(debit_amount) as debitAmount,
                SUM(credit_amount) as creditAmount
           FROM tb_title_daily
          WHERE account_date = i_account_date
            AND LENGTH(title_code) = 10
          GROUP BY SUBSTR(title_code, 1, 7), balance_direction, currency) c  
  on DUPLICATE key UPDATE 
           debit_balance  = tb_title_daily.debit_balance + c.debitBalance,
           credit_balance = tb_title_daily.credit_balance + c.creditBalance,
           debit_count    = tb_title_daily.debit_count + c.debitCount,
           credit_count   = tb_title_daily.credit_count + c.creditCount,
           gmt_modified     = now(),
           debit_amount   = tb_title_daily.debit_amount + c.debitAmount,
           credit_amount  = tb_title_daily.credit_amount + c.creditAmount;


  INSERT INTO tb_title_daily (ACCOUNT_DATE,
       TITLE_CODE,
       BALANCE_DIRECTION,
       DEBIT_AMOUNT,
       CREDIT_AMOUNT,
       DEBIT_COUNT,
       CREDIT_COUNT,
       DEBIT_BALANCE,
       CREDIT_BALANCE,
       CURRENCY,
       GMT_CREATE,
       GMT_MODIFIED) select accountDate,titleCode,balanceDirection,debitAmount,creditAmount,debitCount,creditCount,debitBalance,creditBalance,curr,now() as GMT_CREATE,now() as GMT_MODIFIED from (SELECT ACCOUNT_DATE AS accountDate,SUBSTR(title_code, 1, 4) AS titleCode,title_code,
                balance_direction AS balanceDirection,
                currency AS curr,
                SUM(debit_balance) AS debitBalance,
                SUM(credit_balance) AS creditBalance,
                SUM(debit_count) AS debitCount,
                SUM(credit_count) AS creditCount,
                SUM(debit_amount) as debitAmount,
                SUM(credit_amount) as creditAmount
           FROM tb_title_daily
          WHERE account_date = i_account_date
            AND LENGTH(title_code) = 7
          GROUP BY SUBSTR(title_code, 1, 4), balance_direction, currency) c 
  on DUPLICATE key UPDATE debit_balance  = tb_title_daily.debit_balance + c.debitBalance,
           credit_balance = tb_title_daily.credit_balance + c.creditBalance,
           debit_count    = tb_title_daily.debit_count + c.debitCount,
           credit_count   = tb_title_daily.credit_count + c.creditCount,
           gmt_modified     = now(),
           debit_amount   = tb_title_daily.debit_amount + c.debitAmount,
           credit_amount  = tb_title_daily.credit_amount + c.creditAmount;

  INSERT INTO tb_title_daily (ACCOUNT_DATE,
       TITLE_CODE,
       BALANCE_DIRECTION,
       DEBIT_COUNT,
       CREDIT_COUNT,
       DEBIT_BALANCE,
       CREDIT_BALANCE,
       CURRENCY,
       GMT_CREATE,
       GMT_MODIFIED) select accountDate,titleCode,balanceDirection,debitCount,creditCount,debitBalance,creditBalance,curr,NOW() as GMT_CREATE,NOW() as GMT_MODIFIED from (SELECT i_account_date as accountDate, f.title_code as titleCode,f.title_code,
                f.balance_direction as balanceDirection,
                f.debit_balance as debitBalance,
                f.credit_balance as creditBalance,
                f.debit_count as debitCount,
                f.credit_count as creditCount ,
                f.currency as curr
           FROM tb_title_daily f
          WHERE account_date = i_pre_date
            AND (debit_balance != 0 OR credit_balance != 0)) c 
  on DUPLICATE key UPDATE debit_balance  = tb_title_daily.debit_balance + c.debitBalance,
           credit_balance = tb_title_daily.credit_balance + c.creditBalance,
           gmt_modified     = now();


  UPDATE tb_title_daily
     SET debit_balance  = debit_balance - credit_balance,
         credit_balance = 0,
         gmt_modified   = NOW()
   WHERE account_date = i_account_date
     AND balance_direction = '1';

  UPDATE tb_title_daily
     SET credit_balance = credit_balance - debit_balance,
         debit_balance  = 0,
         gmt_modified   = NOW()
   WHERE account_date = i_account_date
     AND balance_direction = '2';

  UPDATE tb_title_daily
     SET credit_balance = credit_balance - debit_balance,
         debit_balance  = 0,
         gmt_modified   = NOW()
   WHERE account_date = i_account_date
     AND (credit_balance - debit_balance >= 0)
     AND balance_direction = '0';

  UPDATE tb_title_daily
     SET debit_balance  = debit_balance - credit_balance,
         credit_balance = 0,
         gmt_modified   = NOW()
   WHERE account_date = i_account_date
     AND (credit_balance - debit_balance < 0)
     AND balance_direction = '0';
  COMMIT;
  SET result_code = 'SUCCESS';

  
  update dbajoblog
     set enddate = NOW(), jobstatus = 'done', comments = result_code
   where jobid = v_jobid;

  update dbajobconf
     set jobstatus = i_account_date,
         comments  = concat('lastjoblogid: ' , cast(v_jobid as char))
   where jobname = 'dpm.proc_title_daily_stat';
   commit;

END
;;
DELIMITER ;
