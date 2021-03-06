CREATE TABLE `case_backup` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `case_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用例集id',
  `title` varchar(64) NOT NULL DEFAULT '' COMMENT '用例名称',
  `creator` varchar(20) NOT NULL DEFAULT '' COMMENT '用例保存人',
  `gmt_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '用例保存时间',
  `case_content` longtext CHARACTER SET utf8mb4,
  `record_content` longtext COMMENT '任务执行内容',
  `extra` varchar(256) NOT NULL DEFAULT '' COMMENT '扩展字段',
  `is_delete` int(11) NOT NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`),
  KEY `idx_caseId` (`case_id`)
) ENGINE=InnoDB AUTO_INCREMENT=677 DEFAULT CHARSET=utf8 COMMENT='测试备份';

CREATE TABLE `exec_record` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `case_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '执行的用例id',
  `title` varchar(64) NOT NULL DEFAULT '' COMMENT '用例名称',
  `env` int(10) NOT NULL DEFAULT '0' COMMENT '执行环境： 0、测试环境 1、预发环境 2.线上环境 3.冒烟qa 4.冒烟rd',
  `case_content` longtext COMMENT '任务执行内容',
  `is_delete` int(10) NOT NULL DEFAULT '0' COMMENT '用例状态 0-正常 1-删除',
  `pass_count` int(10) NOT NULL DEFAULT '0' COMMENT '执行个数',
  `total_count` int(10) NOT NULL DEFAULT '0' COMMENT '需执行总个数',
  `success_count` int(10) NOT NULL DEFAULT '0' COMMENT '成功个数',
  `creator` varchar(20) NOT NULL DEFAULT '' COMMENT '用例创建人',
  `modifier` varchar(20) NOT NULL DEFAULT '' COMMENT '用例修改人',
  `executors` varchar(200) NOT NULL DEFAULT '' COMMENT '执行人',
  `description` varchar(1000) NOT NULL DEFAULT '' COMMENT '描述',
  `choose_content` varchar(200) NOT NULL DEFAULT '' COMMENT '圈选用例内容',
  `gmt_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
  `gmt_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录修改时间',
  `expect_start_time` timestamp NOT NULL DEFAULT '1971-01-01 00:00:00' COMMENT '预计开始时间',
  `expect_end_time` timestamp NOT NULL DEFAULT '1971-01-01 00:00:00' COMMENT '预计结束时间',
  `actual_start_time` timestamp NOT NULL DEFAULT '1971-01-01 00:00:00' COMMENT '实际开始时间',
  `actual_end_time` timestamp NOT NULL DEFAULT '1971-01-01 00:00:00' COMMENT '实际结束时间',
  `owner` varchar(200) NOT NULL DEFAULT '' COMMENT '负责人',
  PRIMARY KEY (`id`),
  KEY `idx_caseId_isdelete` (`case_id`,`is_delete`)
) ENGINE=InnoDB AUTO_INCREMENT=898 DEFAULT CHARSET=utf8 COMMENT='用例执行记录';

CREATE TABLE `test_case` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `group_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用例集id',
  `title` varchar(64) NOT NULL DEFAULT 'testcase' COMMENT '用例名称',
  `description` varchar(512) NOT NULL DEFAULT '' COMMENT '用例描述',
  `is_delete` int(11) NOT NULL DEFAULT '0' COMMENT '用例状态 0-正常 1-删除',
  `creator` varchar(20) NOT NULL DEFAULT '' COMMENT '用例创建人',
  `modifier` varchar(1000) NOT NULL DEFAULT '' COMMENT '用例修改人',
  `case_content` longtext CHARACTER SET utf8mb4,
  `gmt_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
  `gmt_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `extra` varchar(256) NOT NULL DEFAULT '' COMMENT '扩展字段',
  `product_line_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '业务线id 默认0',
  `case_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-需求用例，1-核心用例，2-冒烟用例',
  `module_node_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '模块节点id',
  `requirement_id` varchar(1000) NOT NULL DEFAULT '0' COMMENT '需求id',
  `smk_case_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '冒烟case的id',
  `channel` int(11) NOT NULL DEFAULT '0' COMMENT '渠道标志 0-done 1-oe',
  PRIMARY KEY (`id`),
  KEY `idx_productline_isdelete` (`product_line_id`,`is_delete`),
  KEY `idx_requirement_id` (`requirement_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2207 DEFAULT CHARSET=utf8 COMMENT='测试用例';
