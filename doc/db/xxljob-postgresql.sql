
-- ----------------------------
-- Table structure for xxl_job_group
-- ----------------------------
DROP TABLE IF EXISTS "xxl_job_group";
CREATE TABLE "xxl_job_group" (
  "id" "pg_catalog"."int4" NOT NULL DEFAULT nextval('xxl_job_group_id_seq'::regclass),
  "app_name" "pg_catalog"."varchar" COLLATE "pg_catalog"."default" NOT NULL,
  "title" "pg_catalog"."varchar" COLLATE "pg_catalog"."default" NOT NULL,
  "address_type" "pg_catalog"."int2" NOT NULL DEFAULT 0,
  "address_list" "pg_catalog"."text" COLLATE "pg_catalog"."default",
  "update_time" "pg_catalog"."timestamptz"
)
;

-- ----------------------------
-- Table structure for xxl_job_info
-- ----------------------------
DROP TABLE IF EXISTS "xxl_job_info";
CREATE TABLE "xxl_job_info" (
  "id" "pg_catalog"."int4" NOT NULL DEFAULT nextval('xxl_job_info_id_seq'::regclass),
  "job_group" "pg_catalog"."int4" NOT NULL,
  "job_desc" "pg_catalog"."varchar" COLLATE "pg_catalog"."default" NOT NULL,
  "add_time" "pg_catalog"."timestamptz",
  "update_time" "pg_catalog"."timestamptz",
  "author" "pg_catalog"."varchar" COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "alarm_email" "pg_catalog"."varchar" COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "schedule_type" "pg_catalog"."varchar" COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'NONE'::character varying,
  "schedule_conf" "pg_catalog"."varchar" COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "misfire_strategy" "pg_catalog"."varchar" COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'DO_NOTHING'::character varying,
  "executor_route_strategy" "pg_catalog"."varchar" COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "executor_handler" "pg_catalog"."varchar" COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "executor_param" "pg_catalog"."varchar" COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "executor_block_strategy" "pg_catalog"."varchar" COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "executor_timeout" "pg_catalog"."int4" NOT NULL DEFAULT 0,
  "executor_fail_retry_count" "pg_catalog"."int4" NOT NULL DEFAULT 0,
  "glue_type" "pg_catalog"."varchar" COLLATE "pg_catalog"."default" NOT NULL,
  "glue_source" "pg_catalog"."text" COLLATE "pg_catalog"."default",
  "glue_remark" "pg_catalog"."varchar" COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "glue_updatetime" "pg_catalog"."timestamptz",
  "child_jobid" "pg_catalog"."varchar" COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "trigger_status" "pg_catalog"."int2" NOT NULL DEFAULT 0,
  "trigger_last_time" "pg_catalog"."int8" NOT NULL DEFAULT 0,
  "trigger_next_time" "pg_catalog"."int8" NOT NULL DEFAULT 0
)
;

-- ----------------------------
-- Table structure for xxl_job_lock
-- ----------------------------
DROP TABLE IF EXISTS "xxl_job_lock";
CREATE TABLE "xxl_job_lock" (
  "lock_name" "pg_catalog"."varchar" COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Table structure for xxl_job_log
-- ----------------------------
DROP TABLE IF EXISTS "xxl_job_log";
CREATE TABLE "xxl_job_log" (
  "id" "pg_catalog"."int8" NOT NULL DEFAULT nextval('xxl_job_log_id_seq'::regclass),
  "job_group" "pg_catalog"."int4" NOT NULL,
  "job_id" "pg_catalog"."int4" NOT NULL,
  "executor_address" "pg_catalog"."varchar" COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "executor_handler" "pg_catalog"."varchar" COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "executor_param" "pg_catalog"."varchar" COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "executor_sharding_param" "pg_catalog"."varchar" COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "executor_fail_retry_count" "pg_catalog"."int4" NOT NULL DEFAULT 0,
  "trigger_time" "pg_catalog"."timestamptz",
  "trigger_code" "pg_catalog"."int4" NOT NULL,
  "trigger_msg" "pg_catalog"."text" COLLATE "pg_catalog"."default",
  "handle_time" "pg_catalog"."timestamptz",
  "handle_code" "pg_catalog"."int4" NOT NULL,
  "handle_msg" "pg_catalog"."text" COLLATE "pg_catalog"."default",
  "alarm_status" "pg_catalog"."int2" NOT NULL DEFAULT 0
)
;

-- ----------------------------
-- Table structure for xxl_job_log_report
-- ----------------------------
DROP TABLE IF EXISTS "xxl_job_log_report";
CREATE TABLE "xxl_job_log_report" (
  "id" "pg_catalog"."int4" NOT NULL DEFAULT nextval('xxl_job_log_report_id_seq'::regclass),
  "trigger_day" "pg_catalog"."timestamptz",
  "running_count" "pg_catalog"."int4" NOT NULL DEFAULT 0,
  "suc_count" "pg_catalog"."int4" NOT NULL DEFAULT 0,
  "fail_count" "pg_catalog"."int4" NOT NULL DEFAULT 0,
  "update_time" "pg_catalog"."timestamptz"
)
;

-- ----------------------------
-- Table structure for xxl_job_logglue
-- ----------------------------
DROP TABLE IF EXISTS "xxl_job_logglue";
CREATE TABLE "xxl_job_logglue" (
  "id" "pg_catalog"."int4" NOT NULL DEFAULT nextval('xxl_job_logglue_id_seq'::regclass),
  "job_id" "pg_catalog"."int4" NOT NULL,
  "glue_type" "pg_catalog"."varchar" COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "glue_source" "pg_catalog"."text" COLLATE "pg_catalog"."default",
  "glue_remark" "pg_catalog"."varchar" COLLATE "pg_catalog"."default" NOT NULL,
  "add_time" "pg_catalog"."timestamptz",
  "update_time" "pg_catalog"."timestamptz"
)
;

-- ----------------------------
-- Table structure for xxl_job_registry
-- ----------------------------
DROP TABLE IF EXISTS "xxl_job_registry";
CREATE TABLE "xxl_job_registry" (
  "id" "pg_catalog"."int4" NOT NULL DEFAULT nextval('xxl_job_registry_id_seq'::regclass),
  "registry_group" "pg_catalog"."varchar" COLLATE "pg_catalog"."default" NOT NULL,
  "registry_key" "pg_catalog"."varchar" COLLATE "pg_catalog"."default" NOT NULL,
  "registry_value" "pg_catalog"."varchar" COLLATE "pg_catalog"."default" NOT NULL,
  "update_time" "pg_catalog"."timestamptz"
)
;

-- ----------------------------
-- Table structure for xxl_job_user
-- ----------------------------
DROP TABLE IF EXISTS "xxl_job_user";
CREATE TABLE "xxl_job_user" (
  "id" "pg_catalog"."int4" NOT NULL DEFAULT nextval('xxl_job_user_id_seq'::regclass),
  "username" "pg_catalog"."varchar" COLLATE "pg_catalog"."default" NOT NULL,
  "password" "pg_catalog"."varchar" COLLATE "pg_catalog"."default" NOT NULL,
  "role" "pg_catalog"."int2" NOT NULL,
  "permission" "pg_catalog"."varchar" COLLATE "pg_catalog"."default" DEFAULT NULL::character varying
)
;

-- ----------------------------
-- Primary Key structure for table xxl_job_group
-- ----------------------------
ALTER TABLE "xxl_job_group" ADD CONSTRAINT "xxl_job_group_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table xxl_job_info
-- ----------------------------
ALTER TABLE "xxl_job_info" ADD CONSTRAINT "xxl_job_info_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table xxl_job_lock
-- ----------------------------
ALTER TABLE "xxl_job_lock" ADD CONSTRAINT "xxl_job_lock_pkey" PRIMARY KEY ("lock_name");

-- ----------------------------
-- Indexes structure for table xxl_job_log
-- ----------------------------
CREATE INDEX "i_handle_code" ON "xxl_job_log" USING btree (
  "handle_code" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "i_trigger_time" ON "xxl_job_log" USING btree (
  "trigger_time" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table xxl_job_log
-- ----------------------------
ALTER TABLE "xxl_job_log" ADD CONSTRAINT "xxl_job_log_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table xxl_job_log_report
-- ----------------------------
CREATE UNIQUE INDEX "i_trigger_day" ON "xxl_job_log_report" USING btree (
  "trigger_day" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table xxl_job_log_report
-- ----------------------------
ALTER TABLE "xxl_job_log_report" ADD CONSTRAINT "xxl_job_log_report_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table xxl_job_logglue
-- ----------------------------
ALTER TABLE "xxl_job_logglue" ADD CONSTRAINT "xxl_job_logglue_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table xxl_job_registry
-- ----------------------------
CREATE UNIQUE INDEX "i_g_k_v" ON "xxl_job_registry" USING btree (
  "registry_group" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "registry_key" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "registry_value" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Uniques structure for table xxl_job_registry
-- ----------------------------
ALTER TABLE "xxl_job_registry" ADD CONSTRAINT "u_gk" UNIQUE ("registry_group", "registry_key");

-- ----------------------------
-- Primary Key structure for table xxl_job_registry
-- ----------------------------
ALTER TABLE "xxl_job_registry" ADD CONSTRAINT "xxl_job_registry_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table xxl_job_user
-- ----------------------------
CREATE UNIQUE INDEX "i_username" ON "xxl_job_user" USING btree (
  "username" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table xxl_job_user
-- ----------------------------
ALTER TABLE "xxl_job_user" ADD CONSTRAINT "xxl_job_user_pkey" PRIMARY KEY ("id");


INSERT INTO xxl_job_group(id, app_name, title, address_type, address_list, update_time) VALUES (1, 'xxl-job-executor-sample', '示例执行器', 0, NULL, '2018-11-03 22:21:31' );
INSERT INTO xxl_job_info(id, job_group, job_desc, add_time, update_time, author, alarm_email, schedule_type, schedule_conf, misfire_strategy, executor_route_strategy, executor_handler, executor_param, executor_block_strategy, executor_timeout, executor_fail_retry_count, glue_type, glue_source, glue_remark, glue_updatetime, child_jobid) VALUES (1, 1, '测试任务1', '2018-11-03 22:21:31', '2018-11-03 22:21:31', 'XXL', '', 'CRON', '0 0 0 * * ? *', 'DO_NOTHING', 'FIRST', 'demoJobHandler', '', 'SERIAL_EXECUTION', 0, 0, 'BEAN', '', 'GLUE代码初始化', '2018-11-03 22:21:31', '');
INSERT INTO xxl_job_user(id, username, password, role, permission) VALUES (1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 1, NULL);
INSERT INTO xxl_job_lock ( lock_name) VALUES ( 'schedule_lock');
