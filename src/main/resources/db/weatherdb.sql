-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: weatherdb
-- ------------------------------------------------------
-- Server version	8.0.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `alert`
--

DROP TABLE IF EXISTS `alert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alert` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `version` bigint NOT NULL,
  `dashboard_id` bigint NOT NULL,
  `panel_id` bigint NOT NULL,
  `org_id` bigint NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `settings` mediumtext COLLATE utf8mb4_unicode_ci,
  `frequency` bigint NOT NULL,
  `handler` bigint NOT NULL,
  `severity` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `silenced` tinyint(1) NOT NULL,
  `execution_error` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `eval_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `eval_date` datetime DEFAULT NULL,
  `new_state_date` datetime NOT NULL,
  `state_changes` int NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `for` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_alert_org_id_id` (`org_id`,`id`),
  KEY `IDX_alert_state` (`state`),
  KEY `IDX_alert_dashboard_id` (`dashboard_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alert`
--

LOCK TABLES `alert` WRITE;
/*!40000 ALTER TABLE `alert` DISABLE KEYS */;
/*!40000 ALTER TABLE `alert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alert_configuration`
--

DROP TABLE IF EXISTS `alert_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alert_configuration` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `alertmanager_configuration` mediumtext COLLATE utf8mb4_unicode_ci,
  `configuration_version` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int NOT NULL,
  `default` tinyint(1) NOT NULL DEFAULT '0',
  `org_id` bigint NOT NULL DEFAULT '0',
  `configuration_hash` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'not-yet-calculated',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_alert_configuration_org_id` (`org_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alert_configuration`
--

LOCK TABLES `alert_configuration` WRITE;
/*!40000 ALTER TABLE `alert_configuration` DISABLE KEYS */;
INSERT INTO `alert_configuration` VALUES (1,'{\n	\"alertmanager_config\": {\n		\"route\": {\n			\"receiver\": \"grafana-default-email\",\n			\"group_by\": [\"grafana_folder\", \"alertname\"]\n		},\n		\"receivers\": [{\n			\"name\": \"grafana-default-email\",\n			\"grafana_managed_receiver_configs\": [{\n				\"uid\": \"\",\n				\"name\": \"email receiver\",\n				\"type\": \"email\",\n				\"settings\": {\n					\"addresses\": \"<example@email.com>\"\n				}\n			}]\n		}]\n	}\n}\n','v1',1736388296,1,1,'ed091fbc8c639dd8063190127c806946');
/*!40000 ALTER TABLE `alert_configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alert_configuration_history`
--

DROP TABLE IF EXISTS `alert_configuration_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alert_configuration_history` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `org_id` bigint NOT NULL DEFAULT '0',
  `alertmanager_configuration` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `configuration_hash` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'not-yet-calculated',
  `configuration_version` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int NOT NULL,
  `default` tinyint(1) NOT NULL DEFAULT '0',
  `last_applied` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alert_configuration_history`
--

LOCK TABLES `alert_configuration_history` WRITE;
/*!40000 ALTER TABLE `alert_configuration_history` DISABLE KEYS */;
INSERT INTO `alert_configuration_history` VALUES (1,1,'{\n	\"alertmanager_config\": {\n		\"route\": {\n			\"receiver\": \"grafana-default-email\",\n			\"group_by\": [\"grafana_folder\", \"alertname\"]\n		},\n		\"receivers\": [{\n			\"name\": \"grafana-default-email\",\n			\"grafana_managed_receiver_configs\": [{\n				\"uid\": \"\",\n				\"name\": \"email receiver\",\n				\"type\": \"email\",\n				\"settings\": {\n					\"addresses\": \"<example@email.com>\"\n				}\n			}]\n		}]\n	}\n}\n','ed091fbc8c639dd8063190127c806946','v1',1736388296,1,1736388296);
/*!40000 ALTER TABLE `alert_configuration_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alert_image`
--

DROP TABLE IF EXISTS `alert_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alert_image` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `token` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `expires_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_alert_image_token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alert_image`
--

LOCK TABLES `alert_image` WRITE;
/*!40000 ALTER TABLE `alert_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `alert_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alert_instance`
--

DROP TABLE IF EXISTS `alert_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alert_instance` (
  `rule_org_id` bigint NOT NULL,
  `rule_uid` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `labels` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `labels_hash` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `current_state` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `current_state_since` bigint NOT NULL,
  `last_eval_time` bigint NOT NULL,
  `current_state_end` bigint NOT NULL DEFAULT '0',
  `current_reason` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `result_fingerprint` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `resolved_at` bigint DEFAULT NULL,
  `last_sent_at` bigint DEFAULT NULL,
  PRIMARY KEY (`rule_org_id`,`rule_uid`,`labels_hash`),
  KEY `IDX_alert_instance_rule_org_id_rule_uid_current_state` (`rule_org_id`,`rule_uid`,`current_state`),
  KEY `IDX_alert_instance_rule_org_id_current_state` (`rule_org_id`,`current_state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alert_instance`
--

LOCK TABLES `alert_instance` WRITE;
/*!40000 ALTER TABLE `alert_instance` DISABLE KEYS */;
/*!40000 ALTER TABLE `alert_instance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alert_notification`
--

DROP TABLE IF EXISTS `alert_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alert_notification` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `org_id` bigint NOT NULL,
  `name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `settings` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `frequency` bigint DEFAULT NULL,
  `send_reminder` tinyint(1) DEFAULT '0',
  `disable_resolve_message` tinyint(1) NOT NULL DEFAULT '0',
  `uid` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secure_settings` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_alert_notification_org_id_uid` (`org_id`,`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alert_notification`
--

LOCK TABLES `alert_notification` WRITE;
/*!40000 ALTER TABLE `alert_notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `alert_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alert_notification_state`
--

DROP TABLE IF EXISTS `alert_notification_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alert_notification_state` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `org_id` bigint NOT NULL,
  `alert_id` bigint NOT NULL,
  `notifier_id` bigint NOT NULL,
  `state` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` bigint NOT NULL,
  `updated_at` bigint NOT NULL,
  `alert_rule_state_updated_version` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_alert_notification_state_org_id_alert_id_notifier_id` (`org_id`,`alert_id`,`notifier_id`),
  KEY `IDX_alert_notification_state_alert_id` (`alert_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alert_notification_state`
--

LOCK TABLES `alert_notification_state` WRITE;
/*!40000 ALTER TABLE `alert_notification_state` DISABLE KEYS */;
/*!40000 ALTER TABLE `alert_notification_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alert_rule`
--

DROP TABLE IF EXISTS `alert_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alert_rule` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `org_id` bigint NOT NULL,
  `title` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `condition` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` mediumtext COLLATE utf8mb4_unicode_ci,
  `updated` datetime NOT NULL,
  `interval_seconds` bigint NOT NULL DEFAULT '60',
  `version` int NOT NULL DEFAULT '0',
  `uid` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `namespace_uid` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rule_group` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_data_state` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'NoData',
  `exec_err_state` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Alerting',
  `for` bigint NOT NULL DEFAULT '0',
  `annotations` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `labels` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `dashboard_uid` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `panel_id` bigint DEFAULT NULL,
  `rule_group_idx` int NOT NULL DEFAULT '1',
  `is_paused` tinyint(1) NOT NULL DEFAULT '0',
  `notification_settings` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `record` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `metadata` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_alert_rule_org_id_uid` (`org_id`,`uid`),
  UNIQUE KEY `UQE_alert_rule_org_id_namespace_uid_title` (`org_id`,`namespace_uid`,`title`),
  KEY `IDX_alert_rule_org_id_namespace_uid_rule_group` (`org_id`,`namespace_uid`,`rule_group`),
  KEY `IDX_alert_rule_org_id_dashboard_uid_panel_id` (`org_id`,`dashboard_uid`,`panel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alert_rule`
--

LOCK TABLES `alert_rule` WRITE;
/*!40000 ALTER TABLE `alert_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `alert_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alert_rule_tag`
--

DROP TABLE IF EXISTS `alert_rule_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alert_rule_tag` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `alert_id` bigint NOT NULL,
  `tag_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_alert_rule_tag_alert_id_tag_id` (`alert_id`,`tag_id`),
  KEY `IDX_alert_rule_tag_alert_id` (`alert_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alert_rule_tag`
--

LOCK TABLES `alert_rule_tag` WRITE;
/*!40000 ALTER TABLE `alert_rule_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `alert_rule_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alert_rule_version`
--

DROP TABLE IF EXISTS `alert_rule_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alert_rule_version` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `rule_org_id` bigint NOT NULL,
  `rule_uid` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `rule_namespace_uid` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rule_group` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_version` int NOT NULL,
  `restored_from` int NOT NULL,
  `version` int NOT NULL,
  `created` datetime NOT NULL,
  `title` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `condition` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` mediumtext COLLATE utf8mb4_unicode_ci,
  `interval_seconds` bigint NOT NULL,
  `no_data_state` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'NoData',
  `exec_err_state` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Alerting',
  `for` bigint NOT NULL DEFAULT '0',
  `annotations` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `labels` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `rule_group_idx` int NOT NULL DEFAULT '1',
  `is_paused` tinyint(1) NOT NULL DEFAULT '0',
  `notification_settings` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `record` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `metadata` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_alert_rule_version_rule_org_id_rule_uid_version` (`rule_org_id`,`rule_uid`,`version`),
  KEY `IDX_alert_rule_version_rule_org_id_rule_namespace_uid_rule_group` (`rule_org_id`,`rule_namespace_uid`,`rule_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alert_rule_version`
--

LOCK TABLES `alert_rule_version` WRITE;
/*!40000 ALTER TABLE `alert_rule_version` DISABLE KEYS */;
/*!40000 ALTER TABLE `alert_rule_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `annotation`
--

DROP TABLE IF EXISTS `annotation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `annotation` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `org_id` bigint NOT NULL,
  `alert_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `dashboard_id` bigint DEFAULT NULL,
  `panel_id` bigint DEFAULT NULL,
  `category_id` bigint DEFAULT NULL,
  `type` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `metric` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prev_state` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `new_state` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `epoch` bigint NOT NULL,
  `region_id` bigint DEFAULT '0',
  `tags` varchar(4096) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created` bigint DEFAULT '0',
  `updated` bigint DEFAULT '0',
  `epoch_end` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `IDX_annotation_org_id_alert_id` (`org_id`,`alert_id`),
  KEY `IDX_annotation_org_id_type` (`org_id`,`type`),
  KEY `IDX_annotation_org_id_created` (`org_id`,`created`),
  KEY `IDX_annotation_org_id_updated` (`org_id`,`updated`),
  KEY `IDX_annotation_org_id_dashboard_id_epoch_end_epoch` (`org_id`,`dashboard_id`,`epoch_end`,`epoch`),
  KEY `IDX_annotation_org_id_epoch_end_epoch` (`org_id`,`epoch_end`,`epoch`),
  KEY `IDX_annotation_alert_id` (`alert_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `annotation`
--

LOCK TABLES `annotation` WRITE;
/*!40000 ALTER TABLE `annotation` DISABLE KEYS */;
/*!40000 ALTER TABLE `annotation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `annotation_tag`
--

DROP TABLE IF EXISTS `annotation_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `annotation_tag` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `annotation_id` bigint NOT NULL,
  `tag_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_annotation_tag_annotation_id_tag_id` (`annotation_id`,`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `annotation_tag`
--

LOCK TABLES `annotation_tag` WRITE;
/*!40000 ALTER TABLE `annotation_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `annotation_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `anon_device`
--

DROP TABLE IF EXISTS `anon_device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `anon_device` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `client_ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `device_id` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_at` datetime NOT NULL,
  `user_agent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_anon_device_device_id` (`device_id`),
  KEY `IDX_anon_device_updated_at` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anon_device`
--

LOCK TABLES `anon_device` WRITE;
/*!40000 ALTER TABLE `anon_device` DISABLE KEYS */;
/*!40000 ALTER TABLE `anon_device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_key`
--

DROP TABLE IF EXISTS `api_key`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_key` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `org_id` bigint NOT NULL,
  `name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `expires` bigint DEFAULT NULL,
  `service_account_id` bigint DEFAULT NULL,
  `last_used_at` datetime DEFAULT NULL,
  `is_revoked` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_api_key_key` (`key`),
  UNIQUE KEY `UQE_api_key_org_id_name` (`org_id`,`name`),
  KEY `IDX_api_key_org_id` (`org_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_key`
--

LOCK TABLES `api_key` WRITE;
/*!40000 ALTER TABLE `api_key` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_key` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `builtin_role`
--

DROP TABLE IF EXISTS `builtin_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `builtin_role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `role` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` bigint NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `org_id` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_builtin_role_org_id_role_id_role` (`org_id`,`role_id`,`role`),
  KEY `IDX_builtin_role_role_id` (`role_id`),
  KEY `IDX_builtin_role_role` (`role`),
  KEY `IDX_builtin_role_org_id` (`org_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `builtin_role`
--

LOCK TABLES `builtin_role` WRITE;
/*!40000 ALTER TABLE `builtin_role` DISABLE KEYS */;
INSERT INTO `builtin_role` VALUES (1,'Admin',2,'2025-01-09 07:34:55','2025-01-09 07:34:55',0),(2,'Editor',3,'2025-01-09 07:34:55','2025-01-09 07:34:55',0),(3,'Grafana Admin',1,'2025-01-09 07:34:55','2025-01-09 07:34:55',0),(4,'Viewer',4,'2025-01-09 07:34:55','2025-01-09 07:34:55',0);
/*!40000 ALTER TABLE `builtin_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_data`
--

DROP TABLE IF EXISTS `cache_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_data` (
  `cache_key` varchar(168) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` blob NOT NULL,
  `expires` int NOT NULL,
  `created_at` int NOT NULL,
  PRIMARY KEY (`cache_key`),
  UNIQUE KEY `UQE_cache_data_cache_key` (`cache_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_data`
--

LOCK TABLES `cache_data` WRITE;
/*!40000 ALTER TABLE `cache_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cloud_migration_resource`
--

DROP TABLE IF EXISTS `cloud_migration_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cloud_migration_resource` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `uid` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `resource_type` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `resource_uid` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `error_string` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `snapshot_uid` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `parent_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cloud_migration_resource`
--

LOCK TABLES `cloud_migration_resource` WRITE;
/*!40000 ALTER TABLE `cloud_migration_resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `cloud_migration_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cloud_migration_session`
--

DROP TABLE IF EXISTS `cloud_migration_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cloud_migration_session` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `uid` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auth_token` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `slug` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `stack_id` bigint NOT NULL,
  `region_slug` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cluster_slug` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `org_id` bigint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_cloud_migration_session_uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cloud_migration_session`
--

LOCK TABLES `cloud_migration_session` WRITE;
/*!40000 ALTER TABLE `cloud_migration_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `cloud_migration_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cloud_migration_snapshot`
--

DROP TABLE IF EXISTS `cloud_migration_snapshot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cloud_migration_snapshot` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `uid` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `session_uid` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `finished` datetime DEFAULT NULL,
  `upload_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `local_directory` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `gms_snapshot_uid` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `encryption_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `error_string` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_cloud_migration_snapshot_uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cloud_migration_snapshot`
--

LOCK TABLES `cloud_migration_snapshot` WRITE;
/*!40000 ALTER TABLE `cloud_migration_snapshot` DISABLE KEYS */;
/*!40000 ALTER TABLE `cloud_migration_snapshot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `correlation`
--

DROP TABLE IF EXISTS `correlation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `correlation` (
  `uid` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `org_id` bigint NOT NULL DEFAULT '0',
  `source_uid` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `target_uid` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `label` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `config` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `provisioned` tinyint(1) NOT NULL DEFAULT '0',
  `type` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'query',
  PRIMARY KEY (`uid`,`org_id`,`source_uid`),
  KEY `IDX_correlation_uid` (`uid`),
  KEY `IDX_correlation_source_uid` (`source_uid`),
  KEY `IDX_correlation_org_id` (`org_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `correlation`
--

LOCK TABLES `correlation` WRITE;
/*!40000 ALTER TABLE `correlation` DISABLE KEYS */;
/*!40000 ALTER TABLE `correlation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard`
--

DROP TABLE IF EXISTS `dashboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `version` int NOT NULL,
  `slug` varchar(189) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(189) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `org_id` bigint NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `updated_by` int DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `gnet_id` bigint DEFAULT NULL,
  `plugin_id` varchar(189) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `folder_id` bigint NOT NULL DEFAULT '0',
  `is_folder` tinyint(1) NOT NULL DEFAULT '0',
  `has_acl` tinyint(1) NOT NULL DEFAULT '0',
  `uid` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL DEFAULT '0',
  `deleted` datetime DEFAULT NULL,
  `folder_uid` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_dashboard_org_id_uid` (`org_id`,`uid`),
  UNIQUE KEY `UQE_dashboard_org_id_folder_uid_title_is_folder` (`org_id`,`folder_uid`,`title`,`is_folder`),
  KEY `IDX_dashboard_org_id` (`org_id`),
  KEY `IDX_dashboard_gnet_id` (`gnet_id`),
  KEY `IDX_dashboard_org_id_plugin_id` (`org_id`,`plugin_id`),
  KEY `IDX_dashboard_title` (`title`),
  KEY `IDX_dashboard_is_folder` (`is_folder`),
  KEY `IDX_dashboard_deleted` (`deleted`),
  KEY `IDX_dashboard_org_id_folder_id_title` (`org_id`,`folder_id`,`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard`
--

LOCK TABLES `dashboard` WRITE;
/*!40000 ALTER TABLE `dashboard` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_acl`
--

DROP TABLE IF EXISTS `dashboard_acl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_acl` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `org_id` bigint NOT NULL,
  `dashboard_id` bigint NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `team_id` bigint DEFAULT NULL,
  `permission` smallint NOT NULL DEFAULT '4',
  `role` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_dashboard_acl_dashboard_id_user_id` (`dashboard_id`,`user_id`),
  UNIQUE KEY `UQE_dashboard_acl_dashboard_id_team_id` (`dashboard_id`,`team_id`),
  KEY `IDX_dashboard_acl_dashboard_id` (`dashboard_id`),
  KEY `IDX_dashboard_acl_user_id` (`user_id`),
  KEY `IDX_dashboard_acl_team_id` (`team_id`),
  KEY `IDX_dashboard_acl_org_id_role` (`org_id`,`role`),
  KEY `IDX_dashboard_acl_permission` (`permission`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_acl`
--

LOCK TABLES `dashboard_acl` WRITE;
/*!40000 ALTER TABLE `dashboard_acl` DISABLE KEYS */;
INSERT INTO `dashboard_acl` VALUES (1,-1,-1,NULL,NULL,1,'Viewer','2017-06-20 00:00:00','2017-06-20 00:00:00'),(2,-1,-1,NULL,NULL,2,'Editor','2017-06-20 00:00:00','2017-06-20 00:00:00');
/*!40000 ALTER TABLE `dashboard_acl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_provisioning`
--

DROP TABLE IF EXISTS `dashboard_provisioning`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_provisioning` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `dashboard_id` bigint DEFAULT NULL,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `external_id` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated` int NOT NULL DEFAULT '0',
  `check_sum` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_dashboard_provisioning_dashboard_id` (`dashboard_id`),
  KEY `IDX_dashboard_provisioning_dashboard_id_name` (`dashboard_id`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_provisioning`
--

LOCK TABLES `dashboard_provisioning` WRITE;
/*!40000 ALTER TABLE `dashboard_provisioning` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_provisioning` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_public`
--

DROP TABLE IF EXISTS `dashboard_public`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_public` (
  `uid` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dashboard_uid` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `org_id` bigint NOT NULL,
  `time_settings` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `template_variables` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `access_token` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `updated_by` int DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `is_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `annotations_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `time_selection_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `share` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'public',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `UQE_dashboard_public_config_uid` (`uid`),
  UNIQUE KEY `UQE_dashboard_public_config_access_token` (`access_token`),
  KEY `IDX_dashboard_public_config_org_id_dashboard_uid` (`org_id`,`dashboard_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_public`
--

LOCK TABLES `dashboard_public` WRITE;
/*!40000 ALTER TABLE `dashboard_public` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_public` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_public_email_share`
--

DROP TABLE IF EXISTS `dashboard_public_email_share`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_public_email_share` (
  `uid` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `public_dashboard_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `recipient` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'email',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_public_email_share`
--

LOCK TABLES `dashboard_public_email_share` WRITE;
/*!40000 ALTER TABLE `dashboard_public_email_share` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_public_email_share` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_public_magic_link`
--

DROP TABLE IF EXISTS `dashboard_public_magic_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_public_magic_link` (
  `uid` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token_uuid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `public_dashboard_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_public_magic_link`
--

LOCK TABLES `dashboard_public_magic_link` WRITE;
/*!40000 ALTER TABLE `dashboard_public_magic_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_public_magic_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_public_session`
--

DROP TABLE IF EXISTS `dashboard_public_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_public_session` (
  `uid` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cookie_uuid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `public_dashboard_uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `last_seen_at` datetime DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_public_session`
--

LOCK TABLES `dashboard_public_session` WRITE;
/*!40000 ALTER TABLE `dashboard_public_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_public_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_public_usage_by_day`
--

DROP TABLE IF EXISTS `dashboard_public_usage_by_day`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_public_usage_by_day` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `public_dashboard_uid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `day` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `views` bigint NOT NULL,
  `queries` bigint NOT NULL,
  `errors` bigint NOT NULL,
  `load_duration` float NOT NULL,
  `cached_queries` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_public_usage_by_day`
--

LOCK TABLES `dashboard_public_usage_by_day` WRITE;
/*!40000 ALTER TABLE `dashboard_public_usage_by_day` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_public_usage_by_day` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_snapshot`
--

DROP TABLE IF EXISTS `dashboard_snapshot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_snapshot` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `delete_key` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `org_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `external` tinyint(1) NOT NULL,
  `external_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dashboard` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires` datetime NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `external_delete_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dashboard_encrypted` mediumblob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_dashboard_snapshot_key` (`key`),
  UNIQUE KEY `UQE_dashboard_snapshot_delete_key` (`delete_key`),
  KEY `IDX_dashboard_snapshot_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_snapshot`
--

LOCK TABLES `dashboard_snapshot` WRITE;
/*!40000 ALTER TABLE `dashboard_snapshot` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_snapshot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_tag`
--

DROP TABLE IF EXISTS `dashboard_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_tag` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `dashboard_id` bigint NOT NULL,
  `term` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_dashboard_tag_dashboard_id` (`dashboard_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_tag`
--

LOCK TABLES `dashboard_tag` WRITE;
/*!40000 ALTER TABLE `dashboard_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_usage_by_day`
--

DROP TABLE IF EXISTS `dashboard_usage_by_day`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_usage_by_day` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `dashboard_id` bigint NOT NULL,
  `day` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `views` bigint NOT NULL,
  `queries` bigint NOT NULL,
  `errors` bigint NOT NULL,
  `load_duration` float NOT NULL,
  `cached_queries` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_dashboard_usage_by_day_dashboard_id_day` (`dashboard_id`,`day`),
  KEY `IDX_dashboard_usage_by_day_dashboard_id` (`dashboard_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_usage_by_day`
--

LOCK TABLES `dashboard_usage_by_day` WRITE;
/*!40000 ALTER TABLE `dashboard_usage_by_day` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_usage_by_day` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_usage_sums`
--

DROP TABLE IF EXISTS `dashboard_usage_sums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_usage_sums` (
  `dashboard_id` bigint NOT NULL,
  `updated` datetime NOT NULL,
  `views_last_1_days` bigint NOT NULL,
  `views_last_7_days` bigint NOT NULL,
  `views_last_30_days` bigint NOT NULL,
  `views_total` bigint NOT NULL,
  `queries_last_1_days` bigint NOT NULL,
  `queries_last_7_days` bigint NOT NULL,
  `queries_last_30_days` bigint NOT NULL,
  `queries_total` bigint NOT NULL,
  `errors_last_1_days` bigint NOT NULL DEFAULT '0',
  `errors_last_7_days` bigint NOT NULL DEFAULT '0',
  `errors_last_30_days` bigint NOT NULL DEFAULT '0',
  `errors_total` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`dashboard_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_usage_sums`
--

LOCK TABLES `dashboard_usage_sums` WRITE;
/*!40000 ALTER TABLE `dashboard_usage_sums` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_usage_sums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_version`
--

DROP TABLE IF EXISTS `dashboard_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_version` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `dashboard_id` bigint NOT NULL,
  `parent_version` int NOT NULL,
  `restored_from` int NOT NULL,
  `version` int NOT NULL,
  `created` datetime NOT NULL,
  `created_by` bigint NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` mediumtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_dashboard_version_dashboard_id_version` (`dashboard_id`,`version`),
  KEY `IDX_dashboard_version_dashboard_id` (`dashboard_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_version`
--

LOCK TABLES `dashboard_version` WRITE;
/*!40000 ALTER TABLE `dashboard_version` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_keys`
--

DROP TABLE IF EXISTS `data_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_keys` (
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL,
  `scope` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `encrypted_data` blob NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_keys`
--

LOCK TABLES `data_keys` WRITE;
/*!40000 ALTER TABLE `data_keys` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_source`
--

DROP TABLE IF EXISTS `data_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_source` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `org_id` bigint NOT NULL,
  `version` int NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `access` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `database` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `basic_auth` tinyint(1) NOT NULL,
  `basic_auth_user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `basic_auth_password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL,
  `json_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `with_credentials` tinyint(1) NOT NULL DEFAULT '0',
  `secure_json_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `read_only` tinyint(1) DEFAULT NULL,
  `uid` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `is_prunable` tinyint(1) DEFAULT '0',
  `api_version` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_data_source_org_id_name` (`org_id`,`name`),
  UNIQUE KEY `UQE_data_source_org_id_uid` (`org_id`,`uid`),
  KEY `IDX_data_source_org_id` (`org_id`),
  KEY `IDX_data_source_org_id_is_default` (`org_id`,`is_default`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_source`
--

LOCK TABLES `data_source` WRITE;
/*!40000 ALTER TABLE `data_source` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_source_acl`
--

DROP TABLE IF EXISTS `data_source_acl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_source_acl` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `org_id` bigint NOT NULL,
  `data_source_id` bigint NOT NULL,
  `team_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `permission` smallint NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_data_source_acl_data_source_id_team_id_user_id` (`data_source_id`,`team_id`,`user_id`),
  KEY `IDX_data_source_acl_data_source_id` (`data_source_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_source_acl`
--

LOCK TABLES `data_source_acl` WRITE;
/*!40000 ALTER TABLE `data_source_acl` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_source_acl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_source_cache`
--

DROP TABLE IF EXISTS `data_source_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_source_cache` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `data_source_id` bigint NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `ttl_ms` bigint NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `use_default_ttl` tinyint(1) NOT NULL DEFAULT '1',
  `data_source_uid` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `ttl_resources_ms` bigint NOT NULL DEFAULT '300000',
  PRIMARY KEY (`id`),
  KEY `IDX_data_source_cache_data_source_id` (`data_source_id`),
  KEY `IDX_data_source_cache_data_source_uid` (`data_source_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_source_cache`
--

LOCK TABLES `data_source_cache` WRITE;
/*!40000 ALTER TABLE `data_source_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_source_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_source_usage_by_day`
--

DROP TABLE IF EXISTS `data_source_usage_by_day`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_source_usage_by_day` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `data_source_id` bigint NOT NULL,
  `day` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queries` bigint NOT NULL,
  `errors` bigint NOT NULL,
  `load_duration_ms` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_data_source_usage_by_day_data_source_id_day` (`data_source_id`,`day`),
  KEY `IDX_data_source_usage_by_day_data_source_id` (`data_source_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_source_usage_by_day`
--

LOCK TABLES `data_source_usage_by_day` WRITE;
/*!40000 ALTER TABLE `data_source_usage_by_day` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_source_usage_by_day` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_event`
--

DROP TABLE IF EXISTS `entity_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entity_event` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `entity_id` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `event_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` bigint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_event`
--

LOCK TABLES `entity_event` WRITE;
/*!40000 ALTER TABLE `entity_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `entity_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file`
--

DROP TABLE IF EXISTS `file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `file` (
  `path` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `path_hash` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_folder_path_hash` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `contents` mediumblob,
  `etag` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cache_control` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_disposition` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated` datetime NOT NULL,
  `created` datetime NOT NULL,
  `size` bigint NOT NULL,
  `mime_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  UNIQUE KEY `UQE_file_path_hash` (`path_hash`),
  KEY `IDX_file_parent_folder_path_hash` (`parent_folder_path_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file`
--

LOCK TABLES `file` WRITE;
/*!40000 ALTER TABLE `file` DISABLE KEYS */;
/*!40000 ALTER TABLE `file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_meta`
--

DROP TABLE IF EXISTS `file_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `file_meta` (
  `path_hash` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  UNIQUE KEY `UQE_file_meta_path_hash_key` (`path_hash`,`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_meta`
--

LOCK TABLES `file_meta` WRITE;
/*!40000 ALTER TABLE `file_meta` DISABLE KEYS */;
/*!40000 ALTER TABLE `file_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `folder`
--

DROP TABLE IF EXISTS `folder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `folder` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `uid` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `org_id` bigint NOT NULL,
  `title` varchar(189) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_uid` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_folder_org_id_uid` (`org_id`,`uid`),
  UNIQUE KEY `UQE_folder_org_id_parent_uid_title` (`org_id`,`parent_uid`,`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folder`
--

LOCK TABLES `folder` WRITE;
/*!40000 ALTER TABLE `folder` DISABLE KEYS */;
/*!40000 ALTER TABLE `folder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kv_store`
--

DROP TABLE IF EXISTS `kv_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kv_store` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `org_id` bigint NOT NULL,
  `namespace` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_kv_store_org_id_namespace_key` (`org_id`,`namespace`,`key`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kv_store`
--

LOCK TABLES `kv_store` WRITE;
/*!40000 ALTER TABLE `kv_store` DISABLE KEYS */;
INSERT INTO `kv_store` VALUES (1,0,'ngalert.migration','currentAlertingType','Legacy','2025-01-09 07:34:50','2025-01-09 07:34:50'),(2,0,'plugin.publickeys','key-7e4d0c6a708866e7','-----BEGIN PGP PUBLIC KEY BLOCK-----\nVersion: OpenPGP.js v4.10.1\nComment: https://openpgpjs.org\n	\nxpMEXpTXXxMFK4EEACMEIwQBiOUQhvGbDLvndE0fEXaR0908wXzPGFpf0P0Z\nHJ06tsq+0higIYHp7WTNJVEZtcwoYLcPRGaa9OQqbUU63BEyZdgAkPTz3RFd\n5+TkDWZizDcaVFhzbDd500yTwexrpIrdInwC/jrgs7Zy/15h8KA59XXUkdmT\nYB6TR+OA9RKME+dCJozNGUdyYWZhbmEgPGVuZ0BncmFmYW5hLmNvbT7CvAQQ\nEwoAIAUCXpTXXwYLCQcIAwIEFQgKAgQWAgEAAhkBAhsDAh4BAAoJEH5NDGpw\niGbnaWoCCQGQ3SQnCkRWrG6XrMkXOKfDTX2ow9fuoErN46BeKmLM4f1EkDZQ\nTpq3SE8+My8B5BIH3SOcBeKzi3S57JHGBdFA+wIJAYWMrJNIvw8GeXne+oUo\nNzzACdvfqXAZEp/HFMQhCKfEoWGJE8d2YmwY2+3GufVRTI5lQnZOHLE8L/Vc\n1S5MXESjzpcEXpTXXxIFK4EEACMEIwQBtHX/SD5Qm3v4V92qpaIZQgtTX0sT\ncFPjYWAHqsQ1iENrYN/vg1wU3ADlYATvydOQYvkTyT/tbDvx2Fse8PL84MQA\nYKKQ6AJ3gLVvmeouZdU03YoV4MYaT8KbnJUkZQZkqdz2riOlySNI9CG3oYmv\nomjUAtzgAgnCcurfGLZkkMxlmY8DAQoJwqQEGBMKAAkFAl6U118CGwwACgkQ\nfk0ManCIZuc0jAIJAVw2xdLr4ZQqPUhubrUyFcqlWoW8dQoQagwO8s8ubmby\nKuLA9FWJkfuuRQr+O9gHkDVCez3aism7zmJBqIOi38aNAgjJ3bo6leSS2jR/\nx5NqiKVi83tiXDPncDQYPymOnMhW0l7CVA7wj75HrFvvlRI/4MArlbsZ2tBn\nN1c5v9v/4h6qeA==\n=DNbR\n-----END PGP PUBLIC KEY BLOCK-----\n','2025-01-09 07:34:56','2025-01-09 07:34:56'),(3,0,'plugin.publickeys','last_updated','2025-01-09T07:34:56+05:30','2025-01-09 07:34:56','2025-01-09 07:34:56'),(4,0,'datasource','secretMigrationStatus','compatible','2025-01-09 07:34:56','2025-01-09 07:34:56'),(5,0,'plugin.angularpatterns','angular_patterns','[{\"Name\":\"PanelCtrl\",\"Pattern\":\"PanelCtrl\",\"Type\":\"contains\"},{\"Name\":\"ConfigCtrl\",\"Pattern\":\"ConfigCtrl\",\"Type\":\"contains\"},{\"Name\":\"app/plugins/sdk\",\"Pattern\":\"app/plugins/sdk\",\"Type\":\"contains\"},{\"Name\":\"Angular Specific Function\",\"Pattern\":\"angular.isNumber(\",\"Type\":\"contains\"},{\"Name\":\"ctrl.annotation\",\"Pattern\":\"ctrl.annotation\",\"Type\":\"contains\"},{\"Name\":\"QueryCtrl\",\"Pattern\":\"[\\\"\']QueryCtrl[\\\"\']\",\"Type\":\"regex\"}]','2025-01-09 07:34:57','2025-01-09 07:34:57'),(6,0,'plugin.angularpatterns','last_updated','2025-01-09T07:34:57+05:30','2025-01-09 07:34:57','2025-01-09 07:34:57'),(7,0,'plugin.angularpatterns','etag','\"1a8-1yOry0c74BKAzc7BUbZdNV0sYic\"','2025-01-09 07:34:57','2025-01-09 07:34:57'),(8,1,'alertmanager','notifications','','2025-01-09 07:56:22','2025-01-09 07:56:22'),(9,1,'alertmanager','silences','','2025-01-09 07:56:22','2025-01-09 07:56:22');
/*!40000 ALTER TABLE `kv_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `library_element`
--

DROP TABLE IF EXISTS `library_element`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `library_element` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `org_id` bigint NOT NULL,
  `folder_id` bigint NOT NULL,
  `uid` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `kind` bigint NOT NULL,
  `type` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `created_by` bigint NOT NULL,
  `updated` datetime NOT NULL,
  `updated_by` bigint NOT NULL,
  `version` bigint NOT NULL,
  `folder_uid` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_library_element_org_id_folder_id_name_kind` (`org_id`,`folder_id`,`name`,`kind`),
  UNIQUE KEY `UQE_library_element_org_id_uid` (`org_id`,`uid`),
  UNIQUE KEY `UQE_library_element_org_id_folder_uid_name_kind` (`org_id`,`folder_uid`,`name`,`kind`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `library_element`
--

LOCK TABLES `library_element` WRITE;
/*!40000 ALTER TABLE `library_element` DISABLE KEYS */;
/*!40000 ALTER TABLE `library_element` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `library_element_connection`
--

DROP TABLE IF EXISTS `library_element_connection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `library_element_connection` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `element_id` bigint NOT NULL,
  `kind` bigint NOT NULL,
  `connection_id` bigint NOT NULL,
  `created` datetime NOT NULL,
  `created_by` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_library_element_connection_element_id_kind_connection_id` (`element_id`,`kind`,`connection_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `library_element_connection`
--

LOCK TABLES `library_element_connection` WRITE;
/*!40000 ALTER TABLE `library_element_connection` DISABLE KEYS */;
/*!40000 ALTER TABLE `library_element_connection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `license_token`
--

DROP TABLE IF EXISTS `license_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `license_token` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `token` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `license_token`
--

LOCK TABLES `license_token` WRITE;
/*!40000 ALTER TABLE `license_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `license_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (1,6.9271,79.8612,'Colombo'),(2,9.6685,80.0074,'Jaffna'),(3,40.7128,-74.006,'New York'),(4,35.6895,139.6917,'Tokyo'),(5,19.076,72.8777,'Mumbai'),(6,52.52,13.405,'Berlin');
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_attempt`
--

DROP TABLE IF EXISTS `login_attempt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login_attempt` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `IDX_login_attempt_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_attempt`
--

LOCK TABLES `login_attempt` WRITE;
/*!40000 ALTER TABLE `login_attempt` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_attempt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migration_log`
--

DROP TABLE IF EXISTS `migration_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migration_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `migration_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sql` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `success` tinyint(1) NOT NULL,
  `error` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=708 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migration_log`
--

LOCK TABLES `migration_log` WRITE;
/*!40000 ALTER TABLE `migration_log` DISABLE KEYS */;
INSERT INTO `migration_log` VALUES (1,'create migration_log table','CREATE TABLE IF NOT EXISTS `migration_log` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `migration_id` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `sql` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `success` TINYINT(1) NOT NULL\n, `error` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `timestamp` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:29'),(2,'create user table','CREATE TABLE IF NOT EXISTS `user` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `version` INT NOT NULL\n, `login` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `email` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `name` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `password` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `salt` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `rands` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `company` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `account_id` BIGINT(20) NOT NULL\n, `is_admin` TINYINT(1) NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:29'),(3,'add unique index user.login','CREATE UNIQUE INDEX `UQE_user_login` ON `user` (`login`);',1,'','2025-01-09 07:34:29'),(4,'add unique index user.email','CREATE UNIQUE INDEX `UQE_user_email` ON `user` (`email`);',1,'','2025-01-09 07:34:29'),(5,'drop index UQE_user_login - v1','DROP INDEX `UQE_user_login` ON `user`',1,'','2025-01-09 07:34:29'),(6,'drop index UQE_user_email - v1','DROP INDEX `UQE_user_email` ON `user`',1,'','2025-01-09 07:34:29'),(7,'Rename table user to user_v1 - v1','ALTER TABLE `user` RENAME TO `user_v1`',1,'','2025-01-09 07:34:29'),(8,'create user table v2','CREATE TABLE IF NOT EXISTS `user` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `version` INT NOT NULL\n, `login` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `email` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `name` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `password` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `salt` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `rands` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `company` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `org_id` BIGINT(20) NOT NULL\n, `is_admin` TINYINT(1) NOT NULL\n, `email_verified` TINYINT(1) NULL\n, `theme` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:29'),(9,'create index UQE_user_login - v2','CREATE UNIQUE INDEX `UQE_user_login` ON `user` (`login`);',1,'','2025-01-09 07:34:30'),(10,'create index UQE_user_email - v2','CREATE UNIQUE INDEX `UQE_user_email` ON `user` (`email`);',1,'','2025-01-09 07:34:30'),(11,'copy data_source v1 to v2','INSERT INTO `user` (`created`\n, `updated`\n, `email`\n, `password`\n, `salt`\n, `company`\n, `is_admin`\n, `org_id`\n, `id`\n, `version`\n, `login`\n, `name`\n, `rands`) SELECT `created`\n, `updated`\n, `email`\n, `password`\n, `salt`\n, `company`\n, `is_admin`\n, `account_id`\n, `id`\n, `version`\n, `login`\n, `name`\n, `rands` FROM `user_v1`',1,'','2025-01-09 07:34:30'),(12,'Drop old table user_v1','DROP TABLE IF EXISTS `user_v1`',1,'','2025-01-09 07:34:30'),(13,'Add column help_flags1 to user table','alter table `user` ADD COLUMN `help_flags1` BIGINT(20) NOT NULL DEFAULT 0 ',1,'','2025-01-09 07:34:30'),(14,'Update user table charset','ALTER TABLE `user` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, MODIFY `login` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `email` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `name` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `password` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `salt` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `rands` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `company` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `theme` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ;',1,'','2025-01-09 07:34:30'),(15,'Add last_seen_at column to user','alter table `user` ADD COLUMN `last_seen_at` DATETIME NULL ',1,'','2025-01-09 07:34:30'),(16,'Add missing user data','code migration',1,'','2025-01-09 07:34:30'),(17,'Add is_disabled column to user','alter table `user` ADD COLUMN `is_disabled` TINYINT(1) NOT NULL DEFAULT 0 ',1,'','2025-01-09 07:34:30'),(18,'Add index user.login/user.email','CREATE INDEX `IDX_user_login_email` ON `user` (`login`,`email`);',1,'','2025-01-09 07:34:30'),(19,'Add is_service_account column to user','alter table `user` ADD COLUMN `is_service_account` TINYINT(1) NOT NULL DEFAULT 0 ',1,'','2025-01-09 07:34:30'),(20,'Update is_service_account column to nullable','ALTER TABLE user MODIFY is_service_account BOOLEAN DEFAULT 0;',1,'','2025-01-09 07:34:30'),(21,'Add uid column to user','alter table `user` ADD COLUMN `uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-01-09 07:34:30'),(22,'Update uid column values for users','UPDATE user SET uid=concat(\'u\',lpad(id,9,\'0\')) WHERE uid IS NULL;',1,'','2025-01-09 07:34:31'),(23,'Add unique index user_uid','CREATE UNIQUE INDEX `UQE_user_uid` ON `user` (`uid`);',1,'','2025-01-09 07:34:31'),(24,'update login field with orgid to allow for multiple service accounts with same name across orgs','code migration',1,'','2025-01-09 07:34:31'),(25,'update login and email fields to lowercase','code migration',1,'','2025-01-09 07:34:31'),(26,'update login and email fields to lowercase2','code migration',1,'','2025-01-09 07:34:31'),(27,'create temp user table v1-7','CREATE TABLE IF NOT EXISTS `temp_user` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `version` INT NOT NULL\n, `email` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `name` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `role` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `code` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `status` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `invited_by_user_id` BIGINT(20) NULL\n, `email_sent` TINYINT(1) NOT NULL\n, `email_sent_on` DATETIME NULL\n, `remote_addr` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:31'),(28,'create index IDX_temp_user_email - v1-7','CREATE INDEX `IDX_temp_user_email` ON `temp_user` (`email`);',1,'','2025-01-09 07:34:31'),(29,'create index IDX_temp_user_org_id - v1-7','CREATE INDEX `IDX_temp_user_org_id` ON `temp_user` (`org_id`);',1,'','2025-01-09 07:34:31'),(30,'create index IDX_temp_user_code - v1-7','CREATE INDEX `IDX_temp_user_code` ON `temp_user` (`code`);',1,'','2025-01-09 07:34:31'),(31,'create index IDX_temp_user_status - v1-7','CREATE INDEX `IDX_temp_user_status` ON `temp_user` (`status`);',1,'','2025-01-09 07:34:31'),(32,'Update temp_user table charset','ALTER TABLE `temp_user` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, MODIFY `email` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `name` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `role` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `code` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `status` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `remote_addr` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ;',1,'','2025-01-09 07:34:31'),(33,'drop index IDX_temp_user_email - v1','DROP INDEX `IDX_temp_user_email` ON `temp_user`',1,'','2025-01-09 07:34:31'),(34,'drop index IDX_temp_user_org_id - v1','DROP INDEX `IDX_temp_user_org_id` ON `temp_user`',1,'','2025-01-09 07:34:31'),(35,'drop index IDX_temp_user_code - v1','DROP INDEX `IDX_temp_user_code` ON `temp_user`',1,'','2025-01-09 07:34:31'),(36,'drop index IDX_temp_user_status - v1','DROP INDEX `IDX_temp_user_status` ON `temp_user`',1,'','2025-01-09 07:34:31'),(37,'Rename table temp_user to temp_user_tmp_qwerty - v1','ALTER TABLE `temp_user` RENAME TO `temp_user_tmp_qwerty`',1,'','2025-01-09 07:34:31'),(38,'create temp_user v2','CREATE TABLE IF NOT EXISTS `temp_user` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `version` INT NOT NULL\n, `email` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `name` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `role` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `code` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `status` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `invited_by_user_id` BIGINT(20) NULL\n, `email_sent` TINYINT(1) NOT NULL\n, `email_sent_on` DATETIME NULL\n, `remote_addr` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `created` INT NOT NULL DEFAULT 0\n, `updated` INT NOT NULL DEFAULT 0\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:31'),(39,'create index IDX_temp_user_email - v2','CREATE INDEX `IDX_temp_user_email` ON `temp_user` (`email`);',1,'','2025-01-09 07:34:31'),(40,'create index IDX_temp_user_org_id - v2','CREATE INDEX `IDX_temp_user_org_id` ON `temp_user` (`org_id`);',1,'','2025-01-09 07:34:31'),(41,'create index IDX_temp_user_code - v2','CREATE INDEX `IDX_temp_user_code` ON `temp_user` (`code`);',1,'','2025-01-09 07:34:31'),(42,'create index IDX_temp_user_status - v2','CREATE INDEX `IDX_temp_user_status` ON `temp_user` (`status`);',1,'','2025-01-09 07:34:31'),(43,'copy temp_user v1 to v2','INSERT INTO `temp_user` (`name`\n, `code`\n, `invited_by_user_id`\n, `email_sent_on`\n, `remote_addr`\n, `org_id`\n, `version`\n, `role`\n, `status`\n, `email_sent`\n, `id`\n, `email`) SELECT `name`\n, `code`\n, `invited_by_user_id`\n, `email_sent_on`\n, `remote_addr`\n, `org_id`\n, `version`\n, `role`\n, `status`\n, `email_sent`\n, `id`\n, `email` FROM `temp_user_tmp_qwerty`',1,'','2025-01-09 07:34:31'),(44,'drop temp_user_tmp_qwerty','DROP TABLE IF EXISTS `temp_user_tmp_qwerty`',1,'','2025-01-09 07:34:31'),(45,'Set created for temp users that will otherwise prematurely expire','code migration',1,'','2025-01-09 07:34:32'),(46,'create star table','CREATE TABLE IF NOT EXISTS `star` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `user_id` BIGINT(20) NOT NULL\n, `dashboard_id` BIGINT(20) NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:32'),(47,'add unique index star.user_id_dashboard_id','CREATE UNIQUE INDEX `UQE_star_user_id_dashboard_id` ON `star` (`user_id`,`dashboard_id`);',1,'','2025-01-09 07:34:32'),(48,'create org table v1','CREATE TABLE IF NOT EXISTS `org` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `version` INT NOT NULL\n, `name` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `address1` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `address2` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `city` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `state` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `zip_code` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `country` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `billing_email` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:32'),(49,'create index UQE_org_name - v1','CREATE UNIQUE INDEX `UQE_org_name` ON `org` (`name`);',1,'','2025-01-09 07:34:32'),(50,'create org_user table v1','CREATE TABLE IF NOT EXISTS `org_user` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `user_id` BIGINT(20) NOT NULL\n, `role` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:32'),(51,'create index IDX_org_user_org_id - v1','CREATE INDEX `IDX_org_user_org_id` ON `org_user` (`org_id`);',1,'','2025-01-09 07:34:32'),(52,'create index UQE_org_user_org_id_user_id - v1','CREATE UNIQUE INDEX `UQE_org_user_org_id_user_id` ON `org_user` (`org_id`,`user_id`);',1,'','2025-01-09 07:34:32'),(53,'create index IDX_org_user_user_id - v1','CREATE INDEX `IDX_org_user_user_id` ON `org_user` (`user_id`);',1,'','2025-01-09 07:34:32'),(54,'Update org table charset','ALTER TABLE `org` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, MODIFY `name` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `address1` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `address2` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `city` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `state` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `zip_code` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `country` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `billing_email` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ;',1,'','2025-01-09 07:34:32'),(55,'Update org_user table charset','ALTER TABLE `org_user` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, MODIFY `role` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL ;',1,'','2025-01-09 07:34:32'),(56,'Migrate all Read Only Viewers to Viewers','UPDATE org_user SET role = \'Viewer\' WHERE role = \'Read Only Editor\'',1,'','2025-01-09 07:34:32'),(57,'create dashboard table','CREATE TABLE IF NOT EXISTS `dashboard` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `version` INT NOT NULL\n, `slug` VARCHAR(189) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `title` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `account_id` BIGINT(20) NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:32'),(58,'add index dashboard.account_id','CREATE INDEX `IDX_dashboard_account_id` ON `dashboard` (`account_id`);',1,'','2025-01-09 07:34:32'),(59,'add unique index dashboard_account_id_slug','CREATE UNIQUE INDEX `UQE_dashboard_account_id_slug` ON `dashboard` (`account_id`,`slug`);',1,'','2025-01-09 07:34:32'),(60,'create dashboard_tag table','CREATE TABLE IF NOT EXISTS `dashboard_tag` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `dashboard_id` BIGINT(20) NOT NULL\n, `term` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:32'),(61,'add unique index dashboard_tag.dasboard_id_term','CREATE UNIQUE INDEX `UQE_dashboard_tag_dashboard_id_term` ON `dashboard_tag` (`dashboard_id`,`term`);',1,'','2025-01-09 07:34:32'),(62,'drop index UQE_dashboard_tag_dashboard_id_term - v1','DROP INDEX `UQE_dashboard_tag_dashboard_id_term` ON `dashboard_tag`',1,'','2025-01-09 07:34:32'),(63,'Rename table dashboard to dashboard_v1 - v1','ALTER TABLE `dashboard` RENAME TO `dashboard_v1`',1,'','2025-01-09 07:34:32'),(64,'create dashboard v2','CREATE TABLE IF NOT EXISTS `dashboard` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `version` INT NOT NULL\n, `slug` VARCHAR(189) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `title` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:32'),(65,'create index IDX_dashboard_org_id - v2','CREATE INDEX `IDX_dashboard_org_id` ON `dashboard` (`org_id`);',1,'','2025-01-09 07:34:32'),(66,'create index UQE_dashboard_org_id_slug - v2','CREATE UNIQUE INDEX `UQE_dashboard_org_id_slug` ON `dashboard` (`org_id`,`slug`);',1,'','2025-01-09 07:34:32'),(67,'copy dashboard v1 to v2','INSERT INTO `dashboard` (`slug`\n, `title`\n, `data`\n, `org_id`\n, `created`\n, `updated`\n, `id`\n, `version`) SELECT `slug`\n, `title`\n, `data`\n, `account_id`\n, `created`\n, `updated`\n, `id`\n, `version` FROM `dashboard_v1`',1,'','2025-01-09 07:34:32'),(68,'drop table dashboard_v1','DROP TABLE IF EXISTS `dashboard_v1`',1,'','2025-01-09 07:34:32'),(69,'alter dashboard.data to mediumtext v1','ALTER TABLE dashboard MODIFY data MEDIUMTEXT;',1,'','2025-01-09 07:34:32'),(70,'Add column updated_by in dashboard - v2','alter table `dashboard` ADD COLUMN `updated_by` INT NULL ',1,'','2025-01-09 07:34:32'),(71,'Add column created_by in dashboard - v2','alter table `dashboard` ADD COLUMN `created_by` INT NULL ',1,'','2025-01-09 07:34:33'),(72,'Add column gnetId in dashboard','alter table `dashboard` ADD COLUMN `gnet_id` BIGINT(20) NULL ',1,'','2025-01-09 07:34:33'),(73,'Add index for gnetId in dashboard','CREATE INDEX `IDX_dashboard_gnet_id` ON `dashboard` (`gnet_id`);',1,'','2025-01-09 07:34:33'),(74,'Add column plugin_id in dashboard','alter table `dashboard` ADD COLUMN `plugin_id` VARCHAR(189) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-01-09 07:34:33'),(75,'Add index for plugin_id in dashboard','CREATE INDEX `IDX_dashboard_org_id_plugin_id` ON `dashboard` (`org_id`,`plugin_id`);',1,'','2025-01-09 07:34:33'),(76,'Add index for dashboard_id in dashboard_tag','CREATE INDEX `IDX_dashboard_tag_dashboard_id` ON `dashboard_tag` (`dashboard_id`);',1,'','2025-01-09 07:34:33'),(77,'Update dashboard table charset','ALTER TABLE `dashboard` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, MODIFY `slug` VARCHAR(189) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `title` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `plugin_id` VARCHAR(189) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `data` MEDIUMTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL ;',1,'','2025-01-09 07:34:33'),(78,'Update dashboard_tag table charset','ALTER TABLE `dashboard_tag` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, MODIFY `term` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL ;',1,'','2025-01-09 07:34:33'),(79,'Add column folder_id in dashboard','alter table `dashboard` ADD COLUMN `folder_id` BIGINT(20) NOT NULL DEFAULT 0 ',1,'','2025-01-09 07:34:33'),(80,'Add column isFolder in dashboard','alter table `dashboard` ADD COLUMN `is_folder` TINYINT(1) NOT NULL DEFAULT 0 ',1,'','2025-01-09 07:34:33'),(81,'Add column has_acl in dashboard','alter table `dashboard` ADD COLUMN `has_acl` TINYINT(1) NOT NULL DEFAULT 0 ',1,'','2025-01-09 07:34:33'),(82,'Add column uid in dashboard','alter table `dashboard` ADD COLUMN `uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-01-09 07:34:33'),(83,'Update uid column values in dashboard','UPDATE dashboard SET uid=lpad(id,9,\'0\') WHERE uid IS NULL;',1,'','2025-01-09 07:34:33'),(84,'Add unique index dashboard_org_id_uid','CREATE UNIQUE INDEX `UQE_dashboard_org_id_uid` ON `dashboard` (`org_id`,`uid`);',1,'','2025-01-09 07:34:33'),(85,'Remove unique index org_id_slug','DROP INDEX `UQE_dashboard_org_id_slug` ON `dashboard`',1,'','2025-01-09 07:34:33'),(86,'Update dashboard title length','ALTER TABLE `dashboard` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, MODIFY `title` VARCHAR(189) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL ;',1,'','2025-01-09 07:34:33'),(87,'Add unique index for dashboard_org_id_title_folder_id','CREATE UNIQUE INDEX `UQE_dashboard_org_id_folder_id_title` ON `dashboard` (`org_id`,`folder_id`,`title`);',1,'','2025-01-09 07:34:33'),(88,'create dashboard_provisioning','CREATE TABLE IF NOT EXISTS `dashboard_provisioning` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `dashboard_id` BIGINT(20) NULL\n, `name` VARCHAR(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `external_id` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:33'),(89,'Rename table dashboard_provisioning to dashboard_provisioning_tmp_qwerty - v1','ALTER TABLE `dashboard_provisioning` RENAME TO `dashboard_provisioning_tmp_qwerty`',1,'','2025-01-09 07:34:33'),(90,'create dashboard_provisioning v2','CREATE TABLE IF NOT EXISTS `dashboard_provisioning` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `dashboard_id` BIGINT(20) NULL\n, `name` VARCHAR(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `external_id` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `updated` INT NOT NULL DEFAULT 0\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:33'),(91,'create index IDX_dashboard_provisioning_dashboard_id - v2','CREATE INDEX `IDX_dashboard_provisioning_dashboard_id` ON `dashboard_provisioning` (`dashboard_id`);',1,'','2025-01-09 07:34:33'),(92,'create index IDX_dashboard_provisioning_dashboard_id_name - v2','CREATE INDEX `IDX_dashboard_provisioning_dashboard_id_name` ON `dashboard_provisioning` (`dashboard_id`,`name`);',1,'','2025-01-09 07:34:33'),(93,'copy dashboard_provisioning v1 to v2','INSERT INTO `dashboard_provisioning` (`name`\n, `external_id`\n, `id`\n, `dashboard_id`) SELECT `name`\n, `external_id`\n, `id`\n, `dashboard_id` FROM `dashboard_provisioning_tmp_qwerty`',1,'','2025-01-09 07:34:33'),(94,'drop dashboard_provisioning_tmp_qwerty','DROP TABLE IF EXISTS `dashboard_provisioning_tmp_qwerty`',1,'','2025-01-09 07:34:33'),(95,'Add check_sum column','alter table `dashboard_provisioning` ADD COLUMN `check_sum` VARCHAR(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-01-09 07:34:33'),(96,'Add index for dashboard_title','CREATE INDEX `IDX_dashboard_title` ON `dashboard` (`title`);',1,'','2025-01-09 07:34:33'),(97,'delete tags for deleted dashboards','DELETE FROM dashboard_tag WHERE dashboard_id NOT IN (SELECT id FROM dashboard)',1,'','2025-01-09 07:34:33'),(98,'delete stars for deleted dashboards','DELETE FROM star WHERE dashboard_id NOT IN (SELECT id FROM dashboard)',1,'','2025-01-09 07:34:34'),(99,'Add index for dashboard_is_folder','CREATE INDEX `IDX_dashboard_is_folder` ON `dashboard` (`is_folder`);',1,'','2025-01-09 07:34:34'),(100,'Add isPublic for dashboard','alter table `dashboard` ADD COLUMN `is_public` TINYINT(1) NOT NULL DEFAULT 0 ',1,'','2025-01-09 07:34:34'),(101,'Add deleted for dashboard','alter table `dashboard` ADD COLUMN `deleted` DATETIME NULL ',1,'','2025-01-09 07:34:34'),(102,'Add index for deleted','CREATE INDEX `IDX_dashboard_deleted` ON `dashboard` (`deleted`);',1,'','2025-01-09 07:34:34'),(103,'create data_source table','CREATE TABLE IF NOT EXISTS `data_source` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `account_id` BIGINT(20) NOT NULL\n, `version` INT NOT NULL\n, `type` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `name` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `access` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `url` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `password` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `user` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `database` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `basic_auth` TINYINT(1) NOT NULL\n, `basic_auth_user` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `basic_auth_password` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `is_default` TINYINT(1) NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:34'),(104,'add index data_source.account_id','CREATE INDEX `IDX_data_source_account_id` ON `data_source` (`account_id`);',1,'','2025-01-09 07:34:34'),(105,'add unique index data_source.account_id_name','CREATE UNIQUE INDEX `UQE_data_source_account_id_name` ON `data_source` (`account_id`,`name`);',1,'','2025-01-09 07:34:34'),(106,'drop index IDX_data_source_account_id - v1','DROP INDEX `IDX_data_source_account_id` ON `data_source`',1,'','2025-01-09 07:34:34'),(107,'drop index UQE_data_source_account_id_name - v1','DROP INDEX `UQE_data_source_account_id_name` ON `data_source`',1,'','2025-01-09 07:34:34'),(108,'Rename table data_source to data_source_v1 - v1','ALTER TABLE `data_source` RENAME TO `data_source_v1`',1,'','2025-01-09 07:34:34'),(109,'create data_source table v2','CREATE TABLE IF NOT EXISTS `data_source` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `version` INT NOT NULL\n, `type` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `name` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `access` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `url` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `password` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `user` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `database` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `basic_auth` TINYINT(1) NOT NULL\n, `basic_auth_user` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `basic_auth_password` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `is_default` TINYINT(1) NOT NULL\n, `json_data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:34'),(110,'create index IDX_data_source_org_id - v2','CREATE INDEX `IDX_data_source_org_id` ON `data_source` (`org_id`);',1,'','2025-01-09 07:34:34'),(111,'create index UQE_data_source_org_id_name - v2','CREATE UNIQUE INDEX `UQE_data_source_org_id_name` ON `data_source` (`org_id`,`name`);',1,'','2025-01-09 07:34:34'),(112,'Drop old table data_source_v1 #2','DROP TABLE IF EXISTS `data_source_v1`',1,'','2025-01-09 07:34:34'),(113,'Add column with_credentials','alter table `data_source` ADD COLUMN `with_credentials` TINYINT(1) NOT NULL DEFAULT 0 ',1,'','2025-01-09 07:34:34'),(114,'Add secure json data column','alter table `data_source` ADD COLUMN `secure_json_data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-01-09 07:34:34'),(115,'Update data_source table charset','ALTER TABLE `data_source` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, MODIFY `type` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `name` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `access` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `url` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `password` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `user` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `database` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `basic_auth_user` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `basic_auth_password` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `json_data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `secure_json_data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ;',1,'','2025-01-09 07:34:34'),(116,'Update initial version to 1','UPDATE data_source SET version = 1 WHERE version = 0',1,'','2025-01-09 07:34:34'),(117,'Add read_only data column','alter table `data_source` ADD COLUMN `read_only` TINYINT(1) NULL ',1,'','2025-01-09 07:34:34'),(118,'Migrate logging ds to loki ds','UPDATE data_source SET type = \'loki\' WHERE type = \'logging\'',1,'','2025-01-09 07:34:34'),(119,'Update json_data with nulls','UPDATE data_source SET json_data = \'{}\' WHERE json_data is null',1,'','2025-01-09 07:34:34'),(120,'Add uid column','alter table `data_source` ADD COLUMN `uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 0 ',1,'','2025-01-09 07:34:34'),(121,'Update uid value','UPDATE data_source SET uid=lpad(id,9,\'0\');',1,'','2025-01-09 07:34:34'),(122,'Add unique index datasource_org_id_uid','CREATE UNIQUE INDEX `UQE_data_source_org_id_uid` ON `data_source` (`org_id`,`uid`);',1,'','2025-01-09 07:34:34'),(123,'add unique index datasource_org_id_is_default','CREATE INDEX `IDX_data_source_org_id_is_default` ON `data_source` (`org_id`,`is_default`);',1,'','2025-01-09 07:34:34'),(124,'Add is_prunable column','alter table `data_source` ADD COLUMN `is_prunable` TINYINT(1) NULL DEFAULT 0 ',1,'','2025-01-09 07:34:34'),(125,'Add api_version column','alter table `data_source` ADD COLUMN `api_version` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-01-09 07:34:35'),(126,'create api_key table','CREATE TABLE IF NOT EXISTS `api_key` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `account_id` BIGINT(20) NOT NULL\n, `name` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `key` VARCHAR(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `role` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:35'),(127,'add index api_key.account_id','CREATE INDEX `IDX_api_key_account_id` ON `api_key` (`account_id`);',1,'','2025-01-09 07:34:35'),(128,'add index api_key.key','CREATE UNIQUE INDEX `UQE_api_key_key` ON `api_key` (`key`);',1,'','2025-01-09 07:34:35'),(129,'add index api_key.account_id_name','CREATE UNIQUE INDEX `UQE_api_key_account_id_name` ON `api_key` (`account_id`,`name`);',1,'','2025-01-09 07:34:35'),(130,'drop index IDX_api_key_account_id - v1','DROP INDEX `IDX_api_key_account_id` ON `api_key`',1,'','2025-01-09 07:34:35'),(131,'drop index UQE_api_key_key - v1','DROP INDEX `UQE_api_key_key` ON `api_key`',1,'','2025-01-09 07:34:35'),(132,'drop index UQE_api_key_account_id_name - v1','DROP INDEX `UQE_api_key_account_id_name` ON `api_key`',1,'','2025-01-09 07:34:35'),(133,'Rename table api_key to api_key_v1 - v1','ALTER TABLE `api_key` RENAME TO `api_key_v1`',1,'','2025-01-09 07:34:35'),(134,'create api_key table v2','CREATE TABLE IF NOT EXISTS `api_key` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `name` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `key` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `role` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:35'),(135,'create index IDX_api_key_org_id - v2','CREATE INDEX `IDX_api_key_org_id` ON `api_key` (`org_id`);',1,'','2025-01-09 07:34:35'),(136,'create index UQE_api_key_key - v2','CREATE UNIQUE INDEX `UQE_api_key_key` ON `api_key` (`key`);',1,'','2025-01-09 07:34:35'),(137,'create index UQE_api_key_org_id_name - v2','CREATE UNIQUE INDEX `UQE_api_key_org_id_name` ON `api_key` (`org_id`,`name`);',1,'','2025-01-09 07:34:35'),(138,'copy api_key v1 to v2','INSERT INTO `api_key` (`name`\n, `key`\n, `role`\n, `created`\n, `updated`\n, `id`\n, `org_id`) SELECT `name`\n, `key`\n, `role`\n, `created`\n, `updated`\n, `id`\n, `account_id` FROM `api_key_v1`',1,'','2025-01-09 07:34:35'),(139,'Drop old table api_key_v1','DROP TABLE IF EXISTS `api_key_v1`',1,'','2025-01-09 07:34:35'),(140,'Update api_key table charset','ALTER TABLE `api_key` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, MODIFY `name` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `key` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `role` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL ;',1,'','2025-01-09 07:34:35'),(141,'Add expires to api_key table','alter table `api_key` ADD COLUMN `expires` BIGINT(20) NULL ',1,'','2025-01-09 07:34:35'),(142,'Add service account foreign key','alter table `api_key` ADD COLUMN `service_account_id` BIGINT(20) NULL ',1,'','2025-01-09 07:34:35'),(143,'set service account foreign key to nil if 0','UPDATE api_key SET service_account_id = NULL WHERE service_account_id = 0;',1,'','2025-01-09 07:34:35'),(144,'Add last_used_at to api_key table','alter table `api_key` ADD COLUMN `last_used_at` DATETIME NULL ',1,'','2025-01-09 07:34:35'),(145,'Add is_revoked column to api_key table','alter table `api_key` ADD COLUMN `is_revoked` TINYINT(1) NULL DEFAULT 0 ',1,'','2025-01-09 07:34:35'),(146,'create dashboard_snapshot table v4','CREATE TABLE IF NOT EXISTS `dashboard_snapshot` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `name` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `key` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `dashboard` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `expires` DATETIME NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:35'),(147,'drop table dashboard_snapshot_v4 #1','DROP TABLE IF EXISTS `dashboard_snapshot`',1,'','2025-01-09 07:34:35'),(148,'create dashboard_snapshot table v5 #2','CREATE TABLE IF NOT EXISTS `dashboard_snapshot` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `name` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `key` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `delete_key` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `user_id` BIGINT(20) NOT NULL\n, `external` TINYINT(1) NOT NULL\n, `external_url` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `dashboard` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `expires` DATETIME NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:35'),(149,'create index UQE_dashboard_snapshot_key - v5','CREATE UNIQUE INDEX `UQE_dashboard_snapshot_key` ON `dashboard_snapshot` (`key`);',1,'','2025-01-09 07:34:35'),(150,'create index UQE_dashboard_snapshot_delete_key - v5','CREATE UNIQUE INDEX `UQE_dashboard_snapshot_delete_key` ON `dashboard_snapshot` (`delete_key`);',1,'','2025-01-09 07:34:36'),(151,'create index IDX_dashboard_snapshot_user_id - v5','CREATE INDEX `IDX_dashboard_snapshot_user_id` ON `dashboard_snapshot` (`user_id`);',1,'','2025-01-09 07:34:36'),(152,'alter dashboard_snapshot to mediumtext v2','ALTER TABLE dashboard_snapshot MODIFY dashboard MEDIUMTEXT;',1,'','2025-01-09 07:34:36'),(153,'Update dashboard_snapshot table charset','ALTER TABLE `dashboard_snapshot` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, MODIFY `name` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `key` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `delete_key` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `external_url` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `dashboard` MEDIUMTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL ;',1,'','2025-01-09 07:34:36'),(154,'Add column external_delete_url to dashboard_snapshots table','alter table `dashboard_snapshot` ADD COLUMN `external_delete_url` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-01-09 07:34:36'),(155,'Add encrypted dashboard json column','alter table `dashboard_snapshot` ADD COLUMN `dashboard_encrypted` BLOB NULL ',1,'','2025-01-09 07:34:36'),(156,'Change dashboard_encrypted column to MEDIUMBLOB','ALTER TABLE dashboard_snapshot MODIFY dashboard_encrypted MEDIUMBLOB;',1,'','2025-01-09 07:34:36'),(157,'create quota table v1','CREATE TABLE IF NOT EXISTS `quota` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NULL\n, `user_id` BIGINT(20) NULL\n, `target` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `limit` BIGINT(20) NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:36'),(158,'create index UQE_quota_org_id_user_id_target - v1','CREATE UNIQUE INDEX `UQE_quota_org_id_user_id_target` ON `quota` (`org_id`,`user_id`,`target`);',1,'','2025-01-09 07:34:36'),(159,'Update quota table charset','ALTER TABLE `quota` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, MODIFY `target` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL ;',1,'','2025-01-09 07:34:36'),(160,'create plugin_setting table','CREATE TABLE IF NOT EXISTS `plugin_setting` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NULL\n, `plugin_id` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `enabled` TINYINT(1) NOT NULL\n, `pinned` TINYINT(1) NOT NULL\n, `json_data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `secure_json_data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:36'),(161,'create index UQE_plugin_setting_org_id_plugin_id - v1','CREATE UNIQUE INDEX `UQE_plugin_setting_org_id_plugin_id` ON `plugin_setting` (`org_id`,`plugin_id`);',1,'','2025-01-09 07:34:36'),(162,'Add column plugin_version to plugin_settings','alter table `plugin_setting` ADD COLUMN `plugin_version` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-01-09 07:34:36'),(163,'Update plugin_setting table charset','ALTER TABLE `plugin_setting` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, MODIFY `plugin_id` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `json_data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `secure_json_data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `plugin_version` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ;',1,'','2025-01-09 07:34:36'),(164,'create session table','CREATE TABLE IF NOT EXISTS `session` (\n`key` CHAR(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci PRIMARY KEY NOT NULL\n, `data` BLOB NOT NULL\n, `expiry` INTEGER(255) NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:36'),(165,'Drop old table playlist table','DROP TABLE IF EXISTS `playlist`',1,'','2025-01-09 07:34:36'),(166,'Drop old table playlist_item table','DROP TABLE IF EXISTS `playlist_item`',1,'','2025-01-09 07:34:36'),(167,'create playlist table v2','CREATE TABLE IF NOT EXISTS `playlist` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `name` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `interval` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:36'),(168,'create playlist item table v2','CREATE TABLE IF NOT EXISTS `playlist_item` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `playlist_id` BIGINT(20) NOT NULL\n, `type` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `value` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `title` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `order` INT NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:36'),(169,'Update playlist table charset','ALTER TABLE `playlist` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, MODIFY `name` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `interval` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL ;',1,'','2025-01-09 07:34:36'),(170,'Update playlist_item table charset','ALTER TABLE `playlist_item` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, MODIFY `type` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `value` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `title` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL ;',1,'','2025-01-09 07:34:36'),(171,'Add playlist column created_at','alter table `playlist` ADD COLUMN `created_at` BIGINT(20) NOT NULL DEFAULT 0 ',1,'','2025-01-09 07:34:36'),(172,'Add playlist column updated_at','alter table `playlist` ADD COLUMN `updated_at` BIGINT(20) NOT NULL DEFAULT 0 ',1,'','2025-01-09 07:34:37'),(173,'drop preferences table v2','DROP TABLE IF EXISTS `preferences`',1,'','2025-01-09 07:34:37'),(174,'drop preferences table v3','DROP TABLE IF EXISTS `preferences`',1,'','2025-01-09 07:34:37'),(175,'create preferences table v3','CREATE TABLE IF NOT EXISTS `preferences` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `user_id` BIGINT(20) NOT NULL\n, `version` INT NOT NULL\n, `home_dashboard_id` BIGINT(20) NOT NULL\n, `timezone` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `theme` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:37'),(176,'Update preferences table charset','ALTER TABLE `preferences` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, MODIFY `timezone` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `theme` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL ;',1,'','2025-01-09 07:34:37'),(177,'Add column team_id in preferences','alter table `preferences` ADD COLUMN `team_id` BIGINT(20) NULL ',1,'','2025-01-09 07:34:37'),(178,'Update team_id column values in preferences','UPDATE preferences SET team_id=0 WHERE team_id IS NULL;',1,'','2025-01-09 07:34:37'),(179,'Add column week_start in preferences','alter table `preferences` ADD COLUMN `week_start` VARCHAR(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-01-09 07:34:37'),(180,'Add column preferences.json_data','alter table `preferences` ADD COLUMN `json_data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-01-09 07:34:37'),(181,'alter preferences.json_data to mediumtext v1','ALTER TABLE preferences MODIFY json_data MEDIUMTEXT;',1,'','2025-01-09 07:34:37'),(182,'Add preferences index org_id','CREATE INDEX `IDX_preferences_org_id` ON `preferences` (`org_id`);',1,'','2025-01-09 07:34:37'),(183,'Add preferences index user_id','CREATE INDEX `IDX_preferences_user_id` ON `preferences` (`user_id`);',1,'','2025-01-09 07:34:37'),(184,'create alert table v1','CREATE TABLE IF NOT EXISTS `alert` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `version` BIGINT(20) NOT NULL\n, `dashboard_id` BIGINT(20) NOT NULL\n, `panel_id` BIGINT(20) NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `name` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `message` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `state` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `settings` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `frequency` BIGINT(20) NOT NULL\n, `handler` BIGINT(20) NOT NULL\n, `severity` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `silenced` TINYINT(1) NOT NULL\n, `execution_error` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `eval_data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `eval_date` DATETIME NULL\n, `new_state_date` DATETIME NOT NULL\n, `state_changes` INT NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:37'),(185,'add index alert org_id & id ','CREATE INDEX `IDX_alert_org_id_id` ON `alert` (`org_id`,`id`);',1,'','2025-01-09 07:34:37'),(186,'add index alert state','CREATE INDEX `IDX_alert_state` ON `alert` (`state`);',1,'','2025-01-09 07:34:37'),(187,'add index alert dashboard_id','CREATE INDEX `IDX_alert_dashboard_id` ON `alert` (`dashboard_id`);',1,'','2025-01-09 07:34:37'),(188,'Create alert_rule_tag table v1','CREATE TABLE IF NOT EXISTS `alert_rule_tag` (\n`alert_id` BIGINT(20) NOT NULL\n, `tag_id` BIGINT(20) NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:37'),(189,'Add unique index alert_rule_tag.alert_id_tag_id','CREATE UNIQUE INDEX `UQE_alert_rule_tag_alert_id_tag_id` ON `alert_rule_tag` (`alert_id`,`tag_id`);',1,'','2025-01-09 07:34:37'),(190,'drop index UQE_alert_rule_tag_alert_id_tag_id - v1','DROP INDEX `UQE_alert_rule_tag_alert_id_tag_id` ON `alert_rule_tag`',1,'','2025-01-09 07:34:37'),(191,'Rename table alert_rule_tag to alert_rule_tag_v1 - v1','ALTER TABLE `alert_rule_tag` RENAME TO `alert_rule_tag_v1`',1,'','2025-01-09 07:34:37'),(192,'Create alert_rule_tag table v2','CREATE TABLE IF NOT EXISTS `alert_rule_tag` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `alert_id` BIGINT(20) NOT NULL\n, `tag_id` BIGINT(20) NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:37'),(193,'create index UQE_alert_rule_tag_alert_id_tag_id - Add unique index alert_rule_tag.alert_id_tag_id V2','CREATE UNIQUE INDEX `UQE_alert_rule_tag_alert_id_tag_id` ON `alert_rule_tag` (`alert_id`,`tag_id`);',1,'','2025-01-09 07:34:37'),(194,'copy alert_rule_tag v1 to v2','INSERT INTO `alert_rule_tag` (`alert_id`\n, `tag_id`) SELECT `alert_id`\n, `tag_id` FROM `alert_rule_tag_v1`',1,'','2025-01-09 07:34:37'),(195,'drop table alert_rule_tag_v1','DROP TABLE IF EXISTS `alert_rule_tag_v1`',1,'','2025-01-09 07:34:37'),(196,'create alert_notification table v1','CREATE TABLE IF NOT EXISTS `alert_notification` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `name` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `type` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `settings` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:37'),(197,'Add column is_default','alter table `alert_notification` ADD COLUMN `is_default` TINYINT(1) NOT NULL DEFAULT 0 ',1,'','2025-01-09 07:34:37'),(198,'Add column frequency','alter table `alert_notification` ADD COLUMN `frequency` BIGINT(20) NULL ',1,'','2025-01-09 07:34:37'),(199,'Add column send_reminder','alter table `alert_notification` ADD COLUMN `send_reminder` TINYINT(1) NULL DEFAULT 0 ',1,'','2025-01-09 07:34:38'),(200,'Add column disable_resolve_message','alter table `alert_notification` ADD COLUMN `disable_resolve_message` TINYINT(1) NOT NULL DEFAULT 0 ',1,'','2025-01-09 07:34:38'),(201,'add index alert_notification org_id & name','CREATE UNIQUE INDEX `UQE_alert_notification_org_id_name` ON `alert_notification` (`org_id`,`name`);',1,'','2025-01-09 07:34:38'),(202,'Update alert table charset','ALTER TABLE `alert` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, MODIFY `name` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `message` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `state` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `settings` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `severity` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `execution_error` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `eval_data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ;',1,'','2025-01-09 07:34:38'),(203,'Update alert_notification table charset','ALTER TABLE `alert_notification` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, MODIFY `name` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `type` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `settings` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL ;',1,'','2025-01-09 07:34:38'),(204,'create notification_journal table v1','CREATE TABLE IF NOT EXISTS `alert_notification_journal` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `alert_id` BIGINT(20) NOT NULL\n, `notifier_id` BIGINT(20) NOT NULL\n, `sent_at` BIGINT(20) NOT NULL\n, `success` TINYINT(1) NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:38'),(205,'add index notification_journal org_id & alert_id & notifier_id','CREATE INDEX `IDX_alert_notification_journal_org_id_alert_id_notifier_id` ON `alert_notification_journal` (`org_id`,`alert_id`,`notifier_id`);',1,'','2025-01-09 07:34:38'),(206,'drop alert_notification_journal','DROP TABLE IF EXISTS `alert_notification_journal`',1,'','2025-01-09 07:34:38'),(207,'create alert_notification_state table v1','CREATE TABLE IF NOT EXISTS `alert_notification_state` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `alert_id` BIGINT(20) NOT NULL\n, `notifier_id` BIGINT(20) NOT NULL\n, `state` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `version` BIGINT(20) NOT NULL\n, `updated_at` BIGINT(20) NOT NULL\n, `alert_rule_state_updated_version` BIGINT(20) NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:38'),(208,'add index alert_notification_state org_id & alert_id & notifier_id','CREATE UNIQUE INDEX `UQE_alert_notification_state_org_id_alert_id_notifier_id` ON `alert_notification_state` (`org_id`,`alert_id`,`notifier_id`);',1,'','2025-01-09 07:34:38'),(209,'Add for to alert table','alter table `alert` ADD COLUMN `for` BIGINT(20) NULL ',1,'','2025-01-09 07:34:38'),(210,'Add column uid in alert_notification','alter table `alert_notification` ADD COLUMN `uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-01-09 07:34:38'),(211,'Update uid column values in alert_notification','UPDATE alert_notification SET uid=lpad(id,9,\'0\') WHERE uid IS NULL;',1,'','2025-01-09 07:34:38'),(212,'Add unique index alert_notification_org_id_uid','CREATE UNIQUE INDEX `UQE_alert_notification_org_id_uid` ON `alert_notification` (`org_id`,`uid`);',1,'','2025-01-09 07:34:38'),(213,'Remove unique index org_id_name','DROP INDEX `UQE_alert_notification_org_id_name` ON `alert_notification`',1,'','2025-01-09 07:34:38'),(214,'Add column secure_settings in alert_notification','alter table `alert_notification` ADD COLUMN `secure_settings` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-01-09 07:34:38'),(215,'alter alert.settings to mediumtext','ALTER TABLE alert MODIFY settings MEDIUMTEXT;',1,'','2025-01-09 07:34:38'),(216,'Add non-unique index alert_notification_state_alert_id','CREATE INDEX `IDX_alert_notification_state_alert_id` ON `alert_notification_state` (`alert_id`);',1,'','2025-01-09 07:34:38'),(217,'Add non-unique index alert_rule_tag_alert_id','CREATE INDEX `IDX_alert_rule_tag_alert_id` ON `alert_rule_tag` (`alert_id`);',1,'','2025-01-09 07:34:38'),(218,'Drop old annotation table v4','DROP TABLE IF EXISTS `annotation`',1,'','2025-01-09 07:34:38'),(219,'create annotation table v5','CREATE TABLE IF NOT EXISTS `annotation` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `alert_id` BIGINT(20) NULL\n, `user_id` BIGINT(20) NULL\n, `dashboard_id` BIGINT(20) NULL\n, `panel_id` BIGINT(20) NULL\n, `category_id` BIGINT(20) NULL\n, `type` VARCHAR(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `title` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `text` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `metric` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `prev_state` VARCHAR(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `new_state` VARCHAR(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `epoch` BIGINT(20) NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:38'),(220,'add index annotation 0 v3','CREATE INDEX `IDX_annotation_org_id_alert_id` ON `annotation` (`org_id`,`alert_id`);',1,'','2025-01-09 07:34:38'),(221,'add index annotation 1 v3','CREATE INDEX `IDX_annotation_org_id_type` ON `annotation` (`org_id`,`type`);',1,'','2025-01-09 07:34:38'),(222,'add index annotation 2 v3','CREATE INDEX `IDX_annotation_org_id_category_id` ON `annotation` (`org_id`,`category_id`);',1,'','2025-01-09 07:34:38'),(223,'add index annotation 3 v3','CREATE INDEX `IDX_annotation_org_id_dashboard_id_panel_id_epoch` ON `annotation` (`org_id`,`dashboard_id`,`panel_id`,`epoch`);',1,'','2025-01-09 07:34:38'),(224,'add index annotation 4 v3','CREATE INDEX `IDX_annotation_org_id_epoch` ON `annotation` (`org_id`,`epoch`);',1,'','2025-01-09 07:34:38'),(225,'Update annotation table charset','ALTER TABLE `annotation` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, MODIFY `type` VARCHAR(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `title` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `text` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `metric` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `prev_state` VARCHAR(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `new_state` VARCHAR(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL ;',1,'','2025-01-09 07:34:39'),(226,'Add column region_id to annotation table','alter table `annotation` ADD COLUMN `region_id` BIGINT(20) NULL DEFAULT 0 ',1,'','2025-01-09 07:34:39'),(227,'Drop category_id index','DROP INDEX `IDX_annotation_org_id_category_id` ON `annotation`',1,'','2025-01-09 07:34:39'),(228,'Add column tags to annotation table','alter table `annotation` ADD COLUMN `tags` VARCHAR(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-01-09 07:34:39'),(229,'Create annotation_tag table v2','CREATE TABLE IF NOT EXISTS `annotation_tag` (\n`annotation_id` BIGINT(20) NOT NULL\n, `tag_id` BIGINT(20) NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:39'),(230,'Add unique index annotation_tag.annotation_id_tag_id','CREATE UNIQUE INDEX `UQE_annotation_tag_annotation_id_tag_id` ON `annotation_tag` (`annotation_id`,`tag_id`);',1,'','2025-01-09 07:34:39'),(231,'drop index UQE_annotation_tag_annotation_id_tag_id - v2','DROP INDEX `UQE_annotation_tag_annotation_id_tag_id` ON `annotation_tag`',1,'','2025-01-09 07:34:39'),(232,'Rename table annotation_tag to annotation_tag_v2 - v2','ALTER TABLE `annotation_tag` RENAME TO `annotation_tag_v2`',1,'','2025-01-09 07:34:39'),(233,'Create annotation_tag table v3','CREATE TABLE IF NOT EXISTS `annotation_tag` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `annotation_id` BIGINT(20) NOT NULL\n, `tag_id` BIGINT(20) NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:39'),(234,'create index UQE_annotation_tag_annotation_id_tag_id - Add unique index annotation_tag.annotation_id_tag_id V3','CREATE UNIQUE INDEX `UQE_annotation_tag_annotation_id_tag_id` ON `annotation_tag` (`annotation_id`,`tag_id`);',1,'','2025-01-09 07:34:39'),(235,'copy annotation_tag v2 to v3','INSERT INTO `annotation_tag` (`annotation_id`\n, `tag_id`) SELECT `annotation_id`\n, `tag_id` FROM `annotation_tag_v2`',1,'','2025-01-09 07:34:39'),(236,'drop table annotation_tag_v2','DROP TABLE IF EXISTS `annotation_tag_v2`',1,'','2025-01-09 07:34:39'),(237,'Update alert annotations and set TEXT to empty','UPDATE annotation SET TEXT = \'\' WHERE alert_id > 0',1,'','2025-01-09 07:34:39'),(238,'Add created time to annotation table','alter table `annotation` ADD COLUMN `created` BIGINT(20) NULL DEFAULT 0 ',1,'','2025-01-09 07:34:39'),(239,'Add updated time to annotation table','alter table `annotation` ADD COLUMN `updated` BIGINT(20) NULL DEFAULT 0 ',1,'','2025-01-09 07:34:39'),(240,'Add index for created in annotation table','CREATE INDEX `IDX_annotation_org_id_created` ON `annotation` (`org_id`,`created`);',1,'','2025-01-09 07:34:39'),(241,'Add index for updated in annotation table','CREATE INDEX `IDX_annotation_org_id_updated` ON `annotation` (`org_id`,`updated`);',1,'','2025-01-09 07:34:39'),(242,'Convert existing annotations from seconds to milliseconds','UPDATE annotation SET epoch = (epoch*1000) where epoch < 9999999999',1,'','2025-01-09 07:34:39'),(243,'Add epoch_end column','alter table `annotation` ADD COLUMN `epoch_end` BIGINT(20) NOT NULL DEFAULT 0 ',1,'','2025-01-09 07:34:39'),(244,'Add index for epoch_end','CREATE INDEX `IDX_annotation_org_id_epoch_epoch_end` ON `annotation` (`org_id`,`epoch`,`epoch_end`);',1,'','2025-01-09 07:34:39'),(245,'Make epoch_end the same as epoch','UPDATE annotation SET epoch_end = epoch',1,'','2025-01-09 07:34:39'),(246,'Move region to single row','code migration',1,'','2025-01-09 07:34:39'),(247,'Remove index org_id_epoch from annotation table','DROP INDEX `IDX_annotation_org_id_epoch` ON `annotation`',1,'','2025-01-09 07:34:39'),(248,'Remove index org_id_dashboard_id_panel_id_epoch from annotation table','DROP INDEX `IDX_annotation_org_id_dashboard_id_panel_id_epoch` ON `annotation`',1,'','2025-01-09 07:34:39'),(249,'Add index for org_id_dashboard_id_epoch_end_epoch on annotation table','CREATE INDEX `IDX_annotation_org_id_dashboard_id_epoch_end_epoch` ON `annotation` (`org_id`,`dashboard_id`,`epoch_end`,`epoch`);',1,'','2025-01-09 07:34:39'),(250,'Add index for org_id_epoch_end_epoch on annotation table','CREATE INDEX `IDX_annotation_org_id_epoch_end_epoch` ON `annotation` (`org_id`,`epoch_end`,`epoch`);',1,'','2025-01-09 07:34:39'),(251,'Remove index org_id_epoch_epoch_end from annotation table','DROP INDEX `IDX_annotation_org_id_epoch_epoch_end` ON `annotation`',1,'','2025-01-09 07:34:39'),(252,'Add index for alert_id on annotation table','CREATE INDEX `IDX_annotation_alert_id` ON `annotation` (`alert_id`);',1,'','2025-01-09 07:34:39'),(253,'Increase tags column to length 4096','ALTER TABLE annotation MODIFY tags VARCHAR(4096);',1,'','2025-01-09 07:34:39'),(254,'create test_data table','CREATE TABLE IF NOT EXISTS `test_data` (\n`id` INT PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `metric1` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `metric2` VARCHAR(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `value_big_int` BIGINT(20) NULL\n, `value_double` DOUBLE NULL\n, `value_float` FLOAT NULL\n, `value_int` INT NULL\n, `time_epoch` BIGINT(20) NOT NULL\n, `time_date_time` DATETIME NOT NULL\n, `time_time_stamp` TIMESTAMP NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:39'),(255,'create dashboard_version table v1','CREATE TABLE IF NOT EXISTS `dashboard_version` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `dashboard_id` BIGINT(20) NOT NULL\n, `parent_version` INT NOT NULL\n, `restored_from` INT NOT NULL\n, `version` INT NOT NULL\n, `created` DATETIME NOT NULL\n, `created_by` BIGINT(20) NOT NULL\n, `message` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:40'),(256,'add index dashboard_version.dashboard_id','CREATE INDEX `IDX_dashboard_version_dashboard_id` ON `dashboard_version` (`dashboard_id`);',1,'','2025-01-09 07:34:40'),(257,'add unique index dashboard_version.dashboard_id and dashboard_version.version','CREATE UNIQUE INDEX `UQE_dashboard_version_dashboard_id_version` ON `dashboard_version` (`dashboard_id`,`version`);',1,'','2025-01-09 07:34:40'),(258,'Set dashboard version to 1 where 0','UPDATE dashboard SET version = 1 WHERE version = 0',1,'','2025-01-09 07:34:40'),(259,'save existing dashboard data in dashboard_version table v1','INSERT INTO dashboard_version\n(\n	dashboard_id,\n	version,\n	parent_version,\n	restored_from,\n	created,\n	created_by,\n	message,\n	data\n)\nSELECT\n	dashboard.id,\n	dashboard.version,\n	dashboard.version,\n	dashboard.version,\n	dashboard.updated,\n	COALESCE(dashboard.updated_by, -1),\n	\'\',\n	dashboard.data\nFROM dashboard;',1,'','2025-01-09 07:34:40'),(260,'alter dashboard_version.data to mediumtext v1','ALTER TABLE dashboard_version MODIFY data MEDIUMTEXT;',1,'','2025-01-09 07:34:40'),(261,'create team table','CREATE TABLE IF NOT EXISTS `team` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `name` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:40'),(262,'add index team.org_id','CREATE INDEX `IDX_team_org_id` ON `team` (`org_id`);',1,'','2025-01-09 07:34:40'),(263,'add unique index team_org_id_name','CREATE UNIQUE INDEX `UQE_team_org_id_name` ON `team` (`org_id`,`name`);',1,'','2025-01-09 07:34:40'),(264,'Add column uid in team','alter table `team` ADD COLUMN `uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-01-09 07:34:40'),(265,'Update uid column values in team','UPDATE team SET uid=concat(\'t\',lpad(id,9,\'0\')) WHERE uid IS NULL;',1,'','2025-01-09 07:34:40'),(266,'Add unique index team_org_id_uid','CREATE UNIQUE INDEX `UQE_team_org_id_uid` ON `team` (`org_id`,`uid`);',1,'','2025-01-09 07:34:40'),(267,'create team member table','CREATE TABLE IF NOT EXISTS `team_member` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `team_id` BIGINT(20) NOT NULL\n, `user_id` BIGINT(20) NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:40'),(268,'add index team_member.org_id','CREATE INDEX `IDX_team_member_org_id` ON `team_member` (`org_id`);',1,'','2025-01-09 07:34:40'),(269,'add unique index team_member_org_id_team_id_user_id','CREATE UNIQUE INDEX `UQE_team_member_org_id_team_id_user_id` ON `team_member` (`org_id`,`team_id`,`user_id`);',1,'','2025-01-09 07:34:40'),(270,'add index team_member.team_id','CREATE INDEX `IDX_team_member_team_id` ON `team_member` (`team_id`);',1,'','2025-01-09 07:34:40'),(271,'Add column email to team table','alter table `team` ADD COLUMN `email` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-01-09 07:34:40'),(272,'Add column external to team_member table','alter table `team_member` ADD COLUMN `external` TINYINT(1) NULL ',1,'','2025-01-09 07:34:40'),(273,'Add column permission to team_member table','alter table `team_member` ADD COLUMN `permission` SMALLINT NULL ',1,'','2025-01-09 07:34:40'),(274,'add unique index team_member_user_id_org_id','CREATE INDEX `IDX_team_member_user_id_org_id` ON `team_member` (`user_id`,`org_id`);',1,'','2025-01-09 07:34:40'),(275,'create dashboard acl table','CREATE TABLE IF NOT EXISTS `dashboard_acl` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `dashboard_id` BIGINT(20) NOT NULL\n, `user_id` BIGINT(20) NULL\n, `team_id` BIGINT(20) NULL\n, `permission` SMALLINT NOT NULL DEFAULT 4\n, `role` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:40'),(276,'add index dashboard_acl_dashboard_id','CREATE INDEX `IDX_dashboard_acl_dashboard_id` ON `dashboard_acl` (`dashboard_id`);',1,'','2025-01-09 07:34:40'),(277,'add unique index dashboard_acl_dashboard_id_user_id','CREATE UNIQUE INDEX `UQE_dashboard_acl_dashboard_id_user_id` ON `dashboard_acl` (`dashboard_id`,`user_id`);',1,'','2025-01-09 07:34:40'),(278,'add unique index dashboard_acl_dashboard_id_team_id','CREATE UNIQUE INDEX `UQE_dashboard_acl_dashboard_id_team_id` ON `dashboard_acl` (`dashboard_id`,`team_id`);',1,'','2025-01-09 07:34:40'),(279,'add index dashboard_acl_user_id','CREATE INDEX `IDX_dashboard_acl_user_id` ON `dashboard_acl` (`user_id`);',1,'','2025-01-09 07:34:40'),(280,'add index dashboard_acl_team_id','CREATE INDEX `IDX_dashboard_acl_team_id` ON `dashboard_acl` (`team_id`);',1,'','2025-01-09 07:34:40'),(281,'add index dashboard_acl_org_id_role','CREATE INDEX `IDX_dashboard_acl_org_id_role` ON `dashboard_acl` (`org_id`,`role`);',1,'','2025-01-09 07:34:40'),(282,'add index dashboard_permission','CREATE INDEX `IDX_dashboard_acl_permission` ON `dashboard_acl` (`permission`);',1,'','2025-01-09 07:34:41'),(283,'save default acl rules in dashboard_acl table','\nINSERT INTO dashboard_acl\n	(\n		org_id,\n		dashboard_id,\n		permission,\n		role,\n		created,\n		updated\n	)\n	VALUES\n		(-1,-1, 1,\'Viewer\',\'2017-06-20\',\'2017-06-20\'),\n		(-1,-1, 2,\'Editor\',\'2017-06-20\',\'2017-06-20\')\n	',1,'','2025-01-09 07:34:41'),(284,'delete acl rules for deleted dashboards and folders','DELETE FROM dashboard_acl WHERE dashboard_id NOT IN (SELECT id FROM dashboard) AND dashboard_id != -1',1,'','2025-01-09 07:34:41'),(285,'create tag table','CREATE TABLE IF NOT EXISTS `tag` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `key` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `value` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:41'),(286,'add index tag.key_value','CREATE UNIQUE INDEX `UQE_tag_key_value` ON `tag` (`key`,`value`);',1,'','2025-01-09 07:34:41'),(287,'create login attempt table','CREATE TABLE IF NOT EXISTS `login_attempt` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `username` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `ip_address` VARCHAR(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `created` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:41'),(288,'add index login_attempt.username','CREATE INDEX `IDX_login_attempt_username` ON `login_attempt` (`username`);',1,'','2025-01-09 07:34:41'),(289,'drop index IDX_login_attempt_username - v1','DROP INDEX `IDX_login_attempt_username` ON `login_attempt`',1,'','2025-01-09 07:34:41'),(290,'Rename table login_attempt to login_attempt_tmp_qwerty - v1','ALTER TABLE `login_attempt` RENAME TO `login_attempt_tmp_qwerty`',1,'','2025-01-09 07:34:41'),(291,'create login_attempt v2','CREATE TABLE IF NOT EXISTS `login_attempt` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `username` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `ip_address` VARCHAR(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `created` INT NOT NULL DEFAULT 0\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:41'),(292,'create index IDX_login_attempt_username - v2','CREATE INDEX `IDX_login_attempt_username` ON `login_attempt` (`username`);',1,'','2025-01-09 07:34:41'),(293,'copy login_attempt v1 to v2','INSERT INTO `login_attempt` (`id`\n, `username`\n, `ip_address`) SELECT `id`\n, `username`\n, `ip_address` FROM `login_attempt_tmp_qwerty`',1,'','2025-01-09 07:34:41'),(294,'drop login_attempt_tmp_qwerty','DROP TABLE IF EXISTS `login_attempt_tmp_qwerty`',1,'','2025-01-09 07:34:41'),(295,'create user auth table','CREATE TABLE IF NOT EXISTS `user_auth` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `user_id` BIGINT(20) NOT NULL\n, `auth_module` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `auth_id` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `created` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:41'),(296,'create index IDX_user_auth_auth_module_auth_id - v1','CREATE INDEX `IDX_user_auth_auth_module_auth_id` ON `user_auth` (`auth_module`,`auth_id`);',1,'','2025-01-09 07:34:41'),(297,'alter user_auth.auth_id to length 190','ALTER TABLE user_auth MODIFY auth_id VARCHAR(190);',1,'','2025-01-09 07:34:41'),(298,'Add OAuth access token to user_auth','alter table `user_auth` ADD COLUMN `o_auth_access_token` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-01-09 07:34:41'),(299,'Add OAuth refresh token to user_auth','alter table `user_auth` ADD COLUMN `o_auth_refresh_token` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-01-09 07:34:41'),(300,'Add OAuth token type to user_auth','alter table `user_auth` ADD COLUMN `o_auth_token_type` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-01-09 07:34:41'),(301,'Add OAuth expiry to user_auth','alter table `user_auth` ADD COLUMN `o_auth_expiry` DATETIME NULL ',1,'','2025-01-09 07:34:41'),(302,'Add index to user_id column in user_auth','CREATE INDEX `IDX_user_auth_user_id` ON `user_auth` (`user_id`);',1,'','2025-01-09 07:34:41'),(303,'Add OAuth ID token to user_auth','alter table `user_auth` ADD COLUMN `o_auth_id_token` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-01-09 07:34:41'),(304,'create server_lock table','CREATE TABLE IF NOT EXISTS `server_lock` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `operation_uid` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `version` BIGINT(20) NOT NULL\n, `last_execution` BIGINT(20) NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:41'),(305,'add index server_lock.operation_uid','CREATE UNIQUE INDEX `UQE_server_lock_operation_uid` ON `server_lock` (`operation_uid`);',1,'','2025-01-09 07:34:41'),(306,'create user auth token table','CREATE TABLE IF NOT EXISTS `user_auth_token` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `user_id` BIGINT(20) NOT NULL\n, `auth_token` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `prev_auth_token` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `user_agent` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `client_ip` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `auth_token_seen` TINYINT(1) NOT NULL\n, `seen_at` INT NULL\n, `rotated_at` INT NOT NULL\n, `created_at` INT NOT NULL\n, `updated_at` INT NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:41'),(307,'add unique index user_auth_token.auth_token','CREATE UNIQUE INDEX `UQE_user_auth_token_auth_token` ON `user_auth_token` (`auth_token`);',1,'','2025-01-09 07:34:41'),(308,'add unique index user_auth_token.prev_auth_token','CREATE UNIQUE INDEX `UQE_user_auth_token_prev_auth_token` ON `user_auth_token` (`prev_auth_token`);',1,'','2025-01-09 07:34:41'),(309,'add index user_auth_token.user_id','CREATE INDEX `IDX_user_auth_token_user_id` ON `user_auth_token` (`user_id`);',1,'','2025-01-09 07:34:41'),(310,'Add revoked_at to the user auth token','alter table `user_auth_token` ADD COLUMN `revoked_at` INT NULL ',1,'','2025-01-09 07:34:41'),(311,'add index user_auth_token.revoked_at','CREATE INDEX `IDX_user_auth_token_revoked_at` ON `user_auth_token` (`revoked_at`);',1,'','2025-01-09 07:34:42'),(312,'add external_session_id to user_auth_token','alter table `user_auth_token` ADD COLUMN `external_session_id` BIGINT(20) NULL ',1,'','2025-01-09 07:34:42'),(313,'create cache_data table','CREATE TABLE IF NOT EXISTS `cache_data` (\n`cache_key` VARCHAR(168) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci PRIMARY KEY NOT NULL\n, `data` BLOB NOT NULL\n, `expires` INTEGER(255) NOT NULL\n, `created_at` INTEGER(255) NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:42'),(314,'add unique index cache_data.cache_key','CREATE UNIQUE INDEX `UQE_cache_data_cache_key` ON `cache_data` (`cache_key`);',1,'','2025-01-09 07:34:42'),(315,'create short_url table v1','CREATE TABLE IF NOT EXISTS `short_url` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `path` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `created_by` INT NOT NULL\n, `created_at` INT NOT NULL\n, `last_seen_at` INT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:42'),(316,'add index short_url.org_id-uid','CREATE UNIQUE INDEX `UQE_short_url_org_id_uid` ON `short_url` (`org_id`,`uid`);',1,'','2025-01-09 07:34:42'),(317,'alter table short_url alter column created_by type to bigint','ALTER TABLE short_url MODIFY created_by BIGINT;',1,'','2025-01-09 07:34:42'),(318,'delete alert_definition table','DROP TABLE IF EXISTS `alert_definition`',1,'','2025-01-09 07:34:42'),(319,'recreate alert_definition table','CREATE TABLE IF NOT EXISTS `alert_definition` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `title` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `condition` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `updated` DATETIME NOT NULL\n, `interval_seconds` BIGINT(20) NOT NULL DEFAULT 60\n, `version` INT NOT NULL DEFAULT 0\n, `uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 0\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:42'),(320,'add index in alert_definition on org_id and title columns','CREATE INDEX `IDX_alert_definition_org_id_title` ON `alert_definition` (`org_id`,`title`);',1,'','2025-01-09 07:34:42'),(321,'add index in alert_definition on org_id and uid columns','CREATE INDEX `IDX_alert_definition_org_id_uid` ON `alert_definition` (`org_id`,`uid`);',1,'','2025-01-09 07:34:42'),(322,'alter alert_definition table data column to mediumtext in mysql','ALTER TABLE alert_definition MODIFY data MEDIUMTEXT;',1,'','2025-01-09 07:34:42'),(323,'drop index in alert_definition on org_id and title columns','DROP INDEX `IDX_alert_definition_org_id_title` ON `alert_definition`',1,'','2025-01-09 07:34:42'),(324,'drop index in alert_definition on org_id and uid columns','DROP INDEX `IDX_alert_definition_org_id_uid` ON `alert_definition`',1,'','2025-01-09 07:34:42'),(325,'add unique index in alert_definition on org_id and title columns','CREATE UNIQUE INDEX `UQE_alert_definition_org_id_title` ON `alert_definition` (`org_id`,`title`);',1,'','2025-01-09 07:34:42'),(326,'add unique index in alert_definition on org_id and uid columns','CREATE UNIQUE INDEX `UQE_alert_definition_org_id_uid` ON `alert_definition` (`org_id`,`uid`);',1,'','2025-01-09 07:34:42'),(327,'Add column paused in alert_definition','alter table `alert_definition` ADD COLUMN `paused` TINYINT(1) NOT NULL DEFAULT 0 ',1,'','2025-01-09 07:34:42'),(328,'drop alert_definition table','DROP TABLE IF EXISTS `alert_definition`',1,'','2025-01-09 07:34:42'),(329,'delete alert_definition_version table','DROP TABLE IF EXISTS `alert_definition_version`',1,'','2025-01-09 07:34:42'),(330,'recreate alert_definition_version table','CREATE TABLE IF NOT EXISTS `alert_definition_version` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `alert_definition_id` BIGINT(20) NOT NULL\n, `alert_definition_uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 0\n, `parent_version` INT NOT NULL\n, `restored_from` INT NOT NULL\n, `version` INT NOT NULL\n, `created` DATETIME NOT NULL\n, `title` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `condition` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `interval_seconds` BIGINT(20) NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:42'),(331,'add index in alert_definition_version table on alert_definition_id and version columns','CREATE UNIQUE INDEX `UQE_alert_definition_version_alert_definition_id_version` ON `alert_definition_version` (`alert_definition_id`,`version`);',1,'','2025-01-09 07:34:42'),(332,'add index in alert_definition_version table on alert_definition_uid and version columns','CREATE UNIQUE INDEX `UQE_alert_definition_version_alert_definition_uid_version` ON `alert_definition_version` (`alert_definition_uid`,`version`);',1,'','2025-01-09 07:34:42'),(333,'alter alert_definition_version table data column to mediumtext in mysql','ALTER TABLE alert_definition_version MODIFY data MEDIUMTEXT;',1,'','2025-01-09 07:34:42'),(334,'drop alert_definition_version table','DROP TABLE IF EXISTS `alert_definition_version`',1,'','2025-01-09 07:34:43'),(335,'create alert_instance table','CREATE TABLE IF NOT EXISTS `alert_instance` (\n`def_org_id` BIGINT(20) NOT NULL\n, `def_uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 0\n, `labels` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `labels_hash` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `current_state` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `current_state_since` BIGINT(20) NOT NULL\n, `last_eval_time` BIGINT(20) NOT NULL\n, PRIMARY KEY ( `def_org_id`,`def_uid`,`labels_hash` )) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:43'),(336,'add index in alert_instance table on def_org_id, def_uid and current_state columns','CREATE INDEX `IDX_alert_instance_def_org_id_def_uid_current_state` ON `alert_instance` (`def_org_id`,`def_uid`,`current_state`);',1,'','2025-01-09 07:34:43'),(337,'add index in alert_instance table on def_org_id, current_state columns','CREATE INDEX `IDX_alert_instance_def_org_id_current_state` ON `alert_instance` (`def_org_id`,`current_state`);',1,'','2025-01-09 07:34:43'),(338,'add column current_state_end to alert_instance','alter table `alert_instance` ADD COLUMN `current_state_end` BIGINT(20) NOT NULL DEFAULT 0 ',1,'','2025-01-09 07:34:43'),(339,'remove index def_org_id, def_uid, current_state on alert_instance','DROP INDEX `IDX_alert_instance_def_org_id_def_uid_current_state` ON `alert_instance`',1,'','2025-01-09 07:34:43'),(340,'remove index def_org_id, current_state on alert_instance','DROP INDEX `IDX_alert_instance_def_org_id_current_state` ON `alert_instance`',1,'','2025-01-09 07:34:43'),(341,'rename def_org_id to rule_org_id in alert_instance','ALTER TABLE alert_instance CHANGE def_org_id rule_org_id BIGINT;',1,'','2025-01-09 07:34:43'),(342,'rename def_uid to rule_uid in alert_instance','ALTER TABLE alert_instance CHANGE def_uid rule_uid VARCHAR(40);',1,'','2025-01-09 07:34:43'),(343,'add index rule_org_id, rule_uid, current_state on alert_instance','CREATE INDEX `IDX_alert_instance_rule_org_id_rule_uid_current_state` ON `alert_instance` (`rule_org_id`,`rule_uid`,`current_state`);',1,'','2025-01-09 07:34:43'),(344,'add index rule_org_id, current_state on alert_instance','CREATE INDEX `IDX_alert_instance_rule_org_id_current_state` ON `alert_instance` (`rule_org_id`,`current_state`);',1,'','2025-01-09 07:34:43'),(345,'add current_reason column related to current_state','alter table `alert_instance` ADD COLUMN `current_reason` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-01-09 07:34:43'),(346,'add result_fingerprint column to alert_instance','alter table `alert_instance` ADD COLUMN `result_fingerprint` VARCHAR(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-01-09 07:34:43'),(347,'create alert_rule table','CREATE TABLE IF NOT EXISTS `alert_rule` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `title` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `condition` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `updated` DATETIME NOT NULL\n, `interval_seconds` BIGINT(20) NOT NULL DEFAULT 60\n, `version` INT NOT NULL DEFAULT 0\n, `uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 0\n, `namespace_uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `rule_group` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `no_data_state` VARCHAR(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT \'NoData\'\n, `exec_err_state` VARCHAR(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT \'Alerting\'\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:43'),(348,'add index in alert_rule on org_id and title columns','CREATE UNIQUE INDEX `UQE_alert_rule_org_id_title` ON `alert_rule` (`org_id`,`title`);',1,'','2025-01-09 07:34:43'),(349,'add index in alert_rule on org_id and uid columns','CREATE UNIQUE INDEX `UQE_alert_rule_org_id_uid` ON `alert_rule` (`org_id`,`uid`);',1,'','2025-01-09 07:34:43'),(350,'add index in alert_rule on org_id, namespace_uid, group_uid columns','CREATE INDEX `IDX_alert_rule_org_id_namespace_uid_rule_group` ON `alert_rule` (`org_id`,`namespace_uid`,`rule_group`);',1,'','2025-01-09 07:34:43'),(351,'alter alert_rule table data column to mediumtext in mysql','ALTER TABLE alert_rule MODIFY data MEDIUMTEXT;',1,'','2025-01-09 07:34:43'),(352,'add column for to alert_rule','alter table `alert_rule` ADD COLUMN `for` BIGINT(20) NOT NULL DEFAULT 0 ',1,'','2025-01-09 07:34:43'),(353,'add column annotations to alert_rule','alter table `alert_rule` ADD COLUMN `annotations` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-01-09 07:34:43'),(354,'add column labels to alert_rule','alter table `alert_rule` ADD COLUMN `labels` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-01-09 07:34:43'),(355,'remove unique index from alert_rule on org_id, title columns','DROP INDEX `UQE_alert_rule_org_id_title` ON `alert_rule`',1,'','2025-01-09 07:34:43'),(356,'add index in alert_rule on org_id, namespase_uid and title columns','CREATE UNIQUE INDEX `UQE_alert_rule_org_id_namespace_uid_title` ON `alert_rule` (`org_id`,`namespace_uid`,`title`);',1,'','2025-01-09 07:34:43'),(357,'add dashboard_uid column to alert_rule','alter table `alert_rule` ADD COLUMN `dashboard_uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-01-09 07:34:43'),(358,'add panel_id column to alert_rule','alter table `alert_rule` ADD COLUMN `panel_id` BIGINT(20) NULL ',1,'','2025-01-09 07:34:43'),(359,'add index in alert_rule on org_id, dashboard_uid and panel_id columns','CREATE INDEX `IDX_alert_rule_org_id_dashboard_uid_panel_id` ON `alert_rule` (`org_id`,`dashboard_uid`,`panel_id`);',1,'','2025-01-09 07:34:43'),(360,'add rule_group_idx column to alert_rule','alter table `alert_rule` ADD COLUMN `rule_group_idx` INT NOT NULL DEFAULT 1 ',1,'','2025-01-09 07:34:44'),(361,'add is_paused column to alert_rule table','alter table `alert_rule` ADD COLUMN `is_paused` TINYINT(1) NOT NULL DEFAULT 0 ',1,'','2025-01-09 07:34:44'),(362,'fix is_paused column for alert_rule table','SELECT 0;',1,'','2025-01-09 07:34:44'),(363,'create alert_rule_version table','CREATE TABLE IF NOT EXISTS `alert_rule_version` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `rule_org_id` BIGINT(20) NOT NULL\n, `rule_uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 0\n, `rule_namespace_uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `rule_group` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `parent_version` INT NOT NULL\n, `restored_from` INT NOT NULL\n, `version` INT NOT NULL\n, `created` DATETIME NOT NULL\n, `title` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `condition` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `interval_seconds` BIGINT(20) NOT NULL\n, `no_data_state` VARCHAR(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT \'NoData\'\n, `exec_err_state` VARCHAR(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT \'Alerting\'\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:44'),(364,'add index in alert_rule_version table on rule_org_id, rule_uid and version columns','CREATE UNIQUE INDEX `UQE_alert_rule_version_rule_org_id_rule_uid_version` ON `alert_rule_version` (`rule_org_id`,`rule_uid`,`version`);',1,'','2025-01-09 07:34:44'),(365,'add index in alert_rule_version table on rule_org_id, rule_namespace_uid and rule_group columns','CREATE INDEX `IDX_alert_rule_version_rule_org_id_rule_namespace_uid_rule_group` ON `alert_rule_version` (`rule_org_id`,`rule_namespace_uid`,`rule_group`);',1,'','2025-01-09 07:34:44'),(366,'alter alert_rule_version table data column to mediumtext in mysql','ALTER TABLE alert_rule_version MODIFY data MEDIUMTEXT;',1,'','2025-01-09 07:34:44'),(367,'add column for to alert_rule_version','alter table `alert_rule_version` ADD COLUMN `for` BIGINT(20) NOT NULL DEFAULT 0 ',1,'','2025-01-09 07:34:44'),(368,'add column annotations to alert_rule_version','alter table `alert_rule_version` ADD COLUMN `annotations` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-01-09 07:34:44'),(369,'add column labels to alert_rule_version','alter table `alert_rule_version` ADD COLUMN `labels` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-01-09 07:34:44'),(370,'add rule_group_idx column to alert_rule_version','alter table `alert_rule_version` ADD COLUMN `rule_group_idx` INT NOT NULL DEFAULT 1 ',1,'','2025-01-09 07:34:44'),(371,'add is_paused column to alert_rule_versions table','alter table `alert_rule_version` ADD COLUMN `is_paused` TINYINT(1) NOT NULL DEFAULT 0 ',1,'','2025-01-09 07:34:44'),(372,'fix is_paused column for alert_rule_version table','SELECT 0;',1,'','2025-01-09 07:34:44'),(373,'create_alert_configuration_table','CREATE TABLE IF NOT EXISTS `alert_configuration` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `alertmanager_configuration` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `configuration_version` VARCHAR(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `created_at` INT NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:44'),(374,'Add column default in alert_configuration','alter table `alert_configuration` ADD COLUMN `default` TINYINT(1) NOT NULL DEFAULT 0 ',1,'','2025-01-09 07:34:44'),(375,'alert alert_configuration alertmanager_configuration column from TEXT to MEDIUMTEXT if mysql','ALTER TABLE alert_configuration MODIFY alertmanager_configuration MEDIUMTEXT;',1,'','2025-01-09 07:34:44'),(376,'add column org_id in alert_configuration','alter table `alert_configuration` ADD COLUMN `org_id` BIGINT(20) NOT NULL DEFAULT 0 ',1,'','2025-01-09 07:34:44'),(377,'add index in alert_configuration table on org_id column','CREATE INDEX `IDX_alert_configuration_org_id` ON `alert_configuration` (`org_id`);',1,'','2025-01-09 07:34:44'),(378,'add configuration_hash column to alert_configuration','alter table `alert_configuration` ADD COLUMN `configuration_hash` VARCHAR(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT \'not-yet-calculated\' ',1,'','2025-01-09 07:34:44'),(379,'create_ngalert_configuration_table','CREATE TABLE IF NOT EXISTS `ngalert_configuration` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `alertmanagers` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `created_at` INT NOT NULL\n, `updated_at` INT NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:44'),(380,'add index in ngalert_configuration on org_id column','CREATE UNIQUE INDEX `UQE_ngalert_configuration_org_id` ON `ngalert_configuration` (`org_id`);',1,'','2025-01-09 07:34:44'),(381,'add column send_alerts_to in ngalert_configuration','alter table `ngalert_configuration` ADD COLUMN `send_alerts_to` SMALLINT NOT NULL DEFAULT 0 ',1,'','2025-01-09 07:34:44'),(382,'create provenance_type table','CREATE TABLE IF NOT EXISTS `provenance_type` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `record_key` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `record_type` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `provenance` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:44'),(383,'add index to uniquify (record_key, record_type, org_id) columns','CREATE UNIQUE INDEX `UQE_provenance_type_record_type_record_key_org_id` ON `provenance_type` (`record_type`,`record_key`,`org_id`);',1,'','2025-01-09 07:34:44'),(384,'create alert_image table','CREATE TABLE IF NOT EXISTS `alert_image` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `token` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `path` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `url` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `created_at` DATETIME NOT NULL\n, `expires_at` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:44'),(385,'add unique index on token to alert_image table','CREATE UNIQUE INDEX `UQE_alert_image_token` ON `alert_image` (`token`);',1,'','2025-01-09 07:34:45'),(386,'support longer URLs in alert_image table','ALTER TABLE alert_image MODIFY url VARCHAR(2048) NOT NULL;',1,'','2025-01-09 07:34:45'),(387,'create_alert_configuration_history_table','CREATE TABLE IF NOT EXISTS `alert_configuration_history` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NOT NULL DEFAULT 0\n, `alertmanager_configuration` MEDIUMTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `configuration_hash` VARCHAR(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT \'not-yet-calculated\'\n, `configuration_version` VARCHAR(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `created_at` INT NOT NULL\n, `default` TINYINT(1) NOT NULL DEFAULT 0\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:45'),(388,'drop non-unique orgID index on alert_configuration','DROP INDEX `IDX_alert_configuration_org_id` ON `alert_configuration`',1,'','2025-01-09 07:34:45'),(389,'drop unique orgID index on alert_configuration if exists','DROP INDEX `UQE_alert_configuration_org_id` ON `alert_configuration`',1,'','2025-01-09 07:34:45'),(390,'extract alertmanager configuration history to separate table','code migration',1,'','2025-01-09 07:34:45'),(391,'add unique index on orgID to alert_configuration','CREATE UNIQUE INDEX `UQE_alert_configuration_org_id` ON `alert_configuration` (`org_id`);',1,'','2025-01-09 07:34:45'),(392,'add last_applied column to alert_configuration_history','alter table `alert_configuration_history` ADD COLUMN `last_applied` INT NOT NULL DEFAULT 0 ',1,'','2025-01-09 07:34:45'),(393,'create library_element table v1','CREATE TABLE IF NOT EXISTS `library_element` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `folder_id` BIGINT(20) NOT NULL\n, `uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `name` VARCHAR(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `kind` BIGINT(20) NOT NULL\n, `type` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `description` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `model` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `created` DATETIME NOT NULL\n, `created_by` BIGINT(20) NOT NULL\n, `updated` DATETIME NOT NULL\n, `updated_by` BIGINT(20) NOT NULL\n, `version` BIGINT(20) NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:45'),(394,'add index library_element org_id-folder_id-name-kind','CREATE UNIQUE INDEX `UQE_library_element_org_id_folder_id_name_kind` ON `library_element` (`org_id`,`folder_id`,`name`,`kind`);',1,'','2025-01-09 07:34:45'),(395,'create library_element_connection table v1','CREATE TABLE IF NOT EXISTS `library_element_connection` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `element_id` BIGINT(20) NOT NULL\n, `kind` BIGINT(20) NOT NULL\n, `connection_id` BIGINT(20) NOT NULL\n, `created` DATETIME NOT NULL\n, `created_by` BIGINT(20) NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:45'),(396,'add index library_element_connection element_id-kind-connection_id','CREATE UNIQUE INDEX `UQE_library_element_connection_element_id_kind_connection_id` ON `library_element_connection` (`element_id`,`kind`,`connection_id`);',1,'','2025-01-09 07:34:45'),(397,'add unique index library_element org_id_uid','CREATE UNIQUE INDEX `UQE_library_element_org_id_uid` ON `library_element` (`org_id`,`uid`);',1,'','2025-01-09 07:34:45'),(398,'increase max description length to 2048','ALTER TABLE `library_element` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, MODIFY `description` VARCHAR(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL ;',1,'','2025-01-09 07:34:45'),(399,'alter library_element model to mediumtext','ALTER TABLE library_element MODIFY model MEDIUMTEXT NOT NULL;',1,'','2025-01-09 07:34:45'),(400,'add library_element folder uid','alter table `library_element` ADD COLUMN `folder_uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-01-09 07:34:45'),(401,'populate library_element folder_uid','UPDATE library_element\n		SET folder_uid = (\n			SELECT dashboard.uid\n			FROM dashboard\n			WHERE library_element.folder_id = dashboard.id AND library_element.org_id = dashboard.org_id\n		)',1,'','2025-01-09 07:34:45'),(402,'add index library_element org_id-folder_uid-name-kind','CREATE UNIQUE INDEX `UQE_library_element_org_id_folder_uid_name_kind` ON `library_element` (`org_id`,`folder_uid`,`name`,`kind`);',1,'','2025-01-09 07:34:45'),(403,'clone move dashboard alerts to unified alerting','code migration',1,'','2025-01-09 07:34:45'),(404,'create data_keys table','CREATE TABLE IF NOT EXISTS `data_keys` (\n`name` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci PRIMARY KEY NOT NULL\n, `active` TINYINT(1) NOT NULL\n, `scope` VARCHAR(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `provider` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `encrypted_data` BLOB NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:45'),(405,'create secrets table','CREATE TABLE IF NOT EXISTS `secrets` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `namespace` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `type` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `value` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:45'),(406,'rename data_keys name column to id','ALTER TABLE `data_keys` CHANGE `name` `id` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci',1,'','2025-01-09 07:34:45'),(407,'add name column into data_keys','alter table `data_keys` ADD COLUMN `name` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT \'\' ',1,'','2025-01-09 07:34:45'),(408,'copy data_keys id column values into name','UPDATE data_keys SET name = id',1,'','2025-01-09 07:34:45'),(409,'rename data_keys name column to label','ALTER TABLE `data_keys` CHANGE `name` `label` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci',1,'','2025-01-09 07:34:45'),(410,'rename data_keys id column back to name','ALTER TABLE `data_keys` CHANGE `id` `name` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci',1,'','2025-01-09 07:34:45'),(411,'create kv_store table v1','CREATE TABLE IF NOT EXISTS `kv_store` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `namespace` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `key` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `value` MEDIUMTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:45'),(412,'add index kv_store.org_id-namespace-key','CREATE UNIQUE INDEX `UQE_kv_store_org_id_namespace_key` ON `kv_store` (`org_id`,`namespace`,`key`);',1,'','2025-01-09 07:34:45'),(413,'update dashboard_uid and panel_id from existing annotations','set dashboard_uid and panel_id migration',1,'','2025-01-09 07:34:46'),(414,'create permission table','CREATE TABLE IF NOT EXISTS `permission` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `role_id` BIGINT(20) NOT NULL\n, `action` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `scope` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:46'),(415,'add unique index permission.role_id','CREATE INDEX `IDX_permission_role_id` ON `permission` (`role_id`);',1,'','2025-01-09 07:34:46'),(416,'add unique index role_id_action_scope','CREATE UNIQUE INDEX `UQE_permission_role_id_action_scope` ON `permission` (`role_id`,`action`,`scope`);',1,'','2025-01-09 07:34:46'),(417,'create role table','CREATE TABLE IF NOT EXISTS `role` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `name` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `description` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `version` BIGINT(20) NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:46'),(418,'add column display_name','alter table `role` ADD COLUMN `display_name` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-01-09 07:34:46'),(419,'add column group_name','alter table `role` ADD COLUMN `group_name` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-01-09 07:34:46'),(420,'add index role.org_id','CREATE INDEX `IDX_role_org_id` ON `role` (`org_id`);',1,'','2025-01-09 07:34:46'),(421,'add unique index role_org_id_name','CREATE UNIQUE INDEX `UQE_role_org_id_name` ON `role` (`org_id`,`name`);',1,'','2025-01-09 07:34:46'),(422,'add index role_org_id_uid','CREATE UNIQUE INDEX `UQE_role_org_id_uid` ON `role` (`org_id`,`uid`);',1,'','2025-01-09 07:34:46'),(423,'create team role table','CREATE TABLE IF NOT EXISTS `team_role` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `team_id` BIGINT(20) NOT NULL\n, `role_id` BIGINT(20) NOT NULL\n, `created` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:46'),(424,'add index team_role.org_id','CREATE INDEX `IDX_team_role_org_id` ON `team_role` (`org_id`);',1,'','2025-01-09 07:34:46'),(425,'add unique index team_role_org_id_team_id_role_id','CREATE UNIQUE INDEX `UQE_team_role_org_id_team_id_role_id` ON `team_role` (`org_id`,`team_id`,`role_id`);',1,'','2025-01-09 07:34:46'),(426,'add index team_role.team_id','CREATE INDEX `IDX_team_role_team_id` ON `team_role` (`team_id`);',1,'','2025-01-09 07:34:46'),(427,'create user role table','CREATE TABLE IF NOT EXISTS `user_role` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `user_id` BIGINT(20) NOT NULL\n, `role_id` BIGINT(20) NOT NULL\n, `created` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:46'),(428,'add index user_role.org_id','CREATE INDEX `IDX_user_role_org_id` ON `user_role` (`org_id`);',1,'','2025-01-09 07:34:46'),(429,'add unique index user_role_org_id_user_id_role_id','CREATE UNIQUE INDEX `UQE_user_role_org_id_user_id_role_id` ON `user_role` (`org_id`,`user_id`,`role_id`);',1,'','2025-01-09 07:34:46'),(430,'add index user_role.user_id','CREATE INDEX `IDX_user_role_user_id` ON `user_role` (`user_id`);',1,'','2025-01-09 07:34:46'),(431,'create builtin role table','CREATE TABLE IF NOT EXISTS `builtin_role` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `role` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `role_id` BIGINT(20) NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:46'),(432,'add index builtin_role.role_id','CREATE INDEX `IDX_builtin_role_role_id` ON `builtin_role` (`role_id`);',1,'','2025-01-09 07:34:46'),(433,'add index builtin_role.name','CREATE INDEX `IDX_builtin_role_role` ON `builtin_role` (`role`);',1,'','2025-01-09 07:34:46'),(434,'Add column org_id to builtin_role table','alter table `builtin_role` ADD COLUMN `org_id` BIGINT(20) NOT NULL DEFAULT 0 ',1,'','2025-01-09 07:34:46'),(435,'add index builtin_role.org_id','CREATE INDEX `IDX_builtin_role_org_id` ON `builtin_role` (`org_id`);',1,'','2025-01-09 07:34:46'),(436,'add unique index builtin_role_org_id_role_id_role','CREATE UNIQUE INDEX `UQE_builtin_role_org_id_role_id_role` ON `builtin_role` (`org_id`,`role_id`,`role`);',1,'','2025-01-09 07:34:46'),(437,'Remove unique index role_org_id_uid','DROP INDEX `UQE_role_org_id_uid` ON `role`',1,'','2025-01-09 07:34:46'),(438,'add unique index role.uid','CREATE UNIQUE INDEX `UQE_role_uid` ON `role` (`uid`);',1,'','2025-01-09 07:34:46'),(439,'create seed assignment table','CREATE TABLE IF NOT EXISTS `seed_assignment` (\n`builtin_role` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `role_name` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:46'),(440,'add unique index builtin_role_role_name','CREATE UNIQUE INDEX `UQE_seed_assignment_builtin_role_role_name` ON `seed_assignment` (`builtin_role`,`role_name`);',1,'','2025-01-09 07:34:46'),(441,'add column hidden to role table','alter table `role` ADD COLUMN `hidden` TINYINT(1) NOT NULL DEFAULT 0 ',1,'','2025-01-09 07:34:47'),(442,'permission kind migration','alter table `permission` ADD COLUMN `kind` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT \'\' ',1,'','2025-01-09 07:34:47'),(443,'permission attribute migration','alter table `permission` ADD COLUMN `attribute` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT \'\' ',1,'','2025-01-09 07:34:47'),(444,'permission identifier migration','alter table `permission` ADD COLUMN `identifier` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT \'\' ',1,'','2025-01-09 07:34:47'),(445,'add permission identifier index','CREATE INDEX `IDX_permission_identifier` ON `permission` (`identifier`);',1,'','2025-01-09 07:34:47'),(446,'add permission action scope role_id index','CREATE UNIQUE INDEX `UQE_permission_action_scope_role_id` ON `permission` (`action`,`scope`,`role_id`);',1,'','2025-01-09 07:34:47'),(447,'remove permission role_id action scope index','DROP INDEX `UQE_permission_role_id_action_scope` ON `permission`',1,'','2025-01-09 07:34:47'),(448,'add group mapping UID column to user_role table','alter table `user_role` ADD COLUMN `group_mapping_uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT \'\' ',1,'','2025-01-09 07:34:47'),(449,'add user_role org ID, user ID, role ID, group mapping UID index','CREATE UNIQUE INDEX `UQE_user_role_org_id_user_id_role_id_group_mapping_uid` ON `user_role` (`org_id`,`user_id`,`role_id`,`group_mapping_uid`);',1,'','2025-01-09 07:34:47'),(450,'remove user_role org ID, user ID, role ID index','DROP INDEX `UQE_user_role_org_id_user_id_role_id` ON `user_role`',1,'','2025-01-09 07:34:47'),(451,'create query_history table v1','CREATE TABLE IF NOT EXISTS `query_history` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `datasource_uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `created_by` INT NOT NULL\n, `created_at` INT NOT NULL\n, `comment` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `queries` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:47'),(452,'add index query_history.org_id-created_by-datasource_uid','CREATE INDEX `IDX_query_history_org_id_created_by_datasource_uid` ON `query_history` (`org_id`,`created_by`,`datasource_uid`);',1,'','2025-01-09 07:34:47'),(453,'alter table query_history alter column created_by type to bigint','ALTER TABLE query_history MODIFY created_by BIGINT;',1,'','2025-01-09 07:34:47'),(454,'create query_history_details table v1','CREATE TABLE IF NOT EXISTS `query_history_details` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `query_history_item_uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `datasource_uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:47'),(455,'rbac disabled migrator','code migration',1,'','2025-01-09 07:34:47'),(456,'teams permissions migration','code migration',1,'','2025-01-09 07:34:47'),(457,'dashboard permissions','code migration',1,'','2025-01-09 07:34:47'),(458,'dashboard permissions uid scopes','code migration',1,'','2025-01-09 07:34:47'),(459,'drop managed folder create actions','code migration',1,'','2025-01-09 07:34:47'),(460,'alerting notification permissions','code migration',1,'','2025-01-09 07:34:47'),(461,'create query_history_star table v1','CREATE TABLE IF NOT EXISTS `query_history_star` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `query_uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `user_id` INT NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:47'),(462,'add index query_history.user_id-query_uid','CREATE UNIQUE INDEX `UQE_query_history_star_user_id_query_uid` ON `query_history_star` (`user_id`,`query_uid`);',1,'','2025-01-09 07:34:47'),(463,'add column org_id in query_history_star','alter table `query_history_star` ADD COLUMN `org_id` BIGINT(20) NOT NULL DEFAULT 1 ',1,'','2025-01-09 07:34:47'),(464,'alter table query_history_star_mig column user_id type to bigint','ALTER TABLE query_history_star MODIFY user_id BIGINT;',1,'','2025-01-09 07:34:47'),(465,'create correlation table v1','CREATE TABLE IF NOT EXISTS `correlation` (\n`uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `source_uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `target_uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `label` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `description` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, PRIMARY KEY ( `uid`,`source_uid` )) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:47'),(466,'add index correlations.uid','CREATE INDEX `IDX_correlation_uid` ON `correlation` (`uid`);',1,'','2025-01-09 07:34:47'),(467,'add index correlations.source_uid','CREATE INDEX `IDX_correlation_source_uid` ON `correlation` (`source_uid`);',1,'','2025-01-09 07:34:47'),(468,'add correlation config column','alter table `correlation` ADD COLUMN `config` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-01-09 07:34:47'),(469,'drop index IDX_correlation_uid - v1','DROP INDEX `IDX_correlation_uid` ON `correlation`',1,'','2025-01-09 07:34:47'),(470,'drop index IDX_correlation_source_uid - v1','DROP INDEX `IDX_correlation_source_uid` ON `correlation`',1,'','2025-01-09 07:34:47'),(471,'Rename table correlation to correlation_tmp_qwerty - v1','ALTER TABLE `correlation` RENAME TO `correlation_tmp_qwerty`',1,'','2025-01-09 07:34:48'),(472,'create correlation v2','CREATE TABLE IF NOT EXISTS `correlation` (\n`uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `org_id` BIGINT(20) NOT NULL DEFAULT 0\n, `source_uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `target_uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `label` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `description` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `config` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, PRIMARY KEY ( `uid`,`org_id`,`source_uid` )) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:48'),(473,'create index IDX_correlation_uid - v2','CREATE INDEX `IDX_correlation_uid` ON `correlation` (`uid`);',1,'','2025-01-09 07:34:48'),(474,'create index IDX_correlation_source_uid - v2','CREATE INDEX `IDX_correlation_source_uid` ON `correlation` (`source_uid`);',1,'','2025-01-09 07:34:48'),(475,'create index IDX_correlation_org_id - v2','CREATE INDEX `IDX_correlation_org_id` ON `correlation` (`org_id`);',1,'','2025-01-09 07:34:48'),(476,'copy correlation v1 to v2','INSERT INTO `correlation` (`uid`\n, `source_uid`\n, `target_uid`\n, `label`\n, `description`\n, `config`) SELECT `uid`\n, `source_uid`\n, `target_uid`\n, `label`\n, `description`\n, `config` FROM `correlation_tmp_qwerty`',1,'','2025-01-09 07:34:48'),(477,'drop correlation_tmp_qwerty','DROP TABLE IF EXISTS `correlation_tmp_qwerty`',1,'','2025-01-09 07:34:48'),(478,'add provisioning column','alter table `correlation` ADD COLUMN `provisioned` TINYINT(1) NOT NULL DEFAULT 0 ',1,'','2025-01-09 07:34:48'),(479,'add type column','alter table `correlation` ADD COLUMN `type` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT \'query\' ',1,'','2025-01-09 07:34:48'),(480,'create entity_events table','CREATE TABLE IF NOT EXISTS `entity_event` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `entity_id` VARCHAR(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `event_type` VARCHAR(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `created` BIGINT(20) NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:48'),(481,'create dashboard public config v1','CREATE TABLE IF NOT EXISTS `dashboard_public_config` (\n`uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci PRIMARY KEY NOT NULL\n, `dashboard_uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `time_settings` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `refresh_rate` INT NOT NULL DEFAULT 30\n, `template_variables` MEDIUMTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:48'),(482,'drop index UQE_dashboard_public_config_uid - v1','DROP INDEX `UQE_dashboard_public_config_uid` ON `dashboard_public_config`',1,'','2025-01-09 07:34:48'),(483,'drop index IDX_dashboard_public_config_org_id_dashboard_uid - v1','DROP INDEX `IDX_dashboard_public_config_org_id_dashboard_uid` ON `dashboard_public_config`',1,'','2025-01-09 07:34:48'),(484,'Drop old dashboard public config table','DROP TABLE IF EXISTS `dashboard_public_config`',1,'','2025-01-09 07:34:48'),(485,'recreate dashboard public config v1','CREATE TABLE IF NOT EXISTS `dashboard_public_config` (\n`uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci PRIMARY KEY NOT NULL\n, `dashboard_uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `time_settings` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `refresh_rate` INT NOT NULL DEFAULT 30\n, `template_variables` MEDIUMTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:48'),(486,'create index UQE_dashboard_public_config_uid - v1','CREATE UNIQUE INDEX `UQE_dashboard_public_config_uid` ON `dashboard_public_config` (`uid`);',1,'','2025-01-09 07:34:48'),(487,'create index IDX_dashboard_public_config_org_id_dashboard_uid - v1','CREATE INDEX `IDX_dashboard_public_config_org_id_dashboard_uid` ON `dashboard_public_config` (`org_id`,`dashboard_uid`);',1,'','2025-01-09 07:34:48'),(488,'drop index UQE_dashboard_public_config_uid - v2','DROP INDEX `UQE_dashboard_public_config_uid` ON `dashboard_public_config`',1,'','2025-01-09 07:34:48'),(489,'drop index IDX_dashboard_public_config_org_id_dashboard_uid - v2','DROP INDEX `IDX_dashboard_public_config_org_id_dashboard_uid` ON `dashboard_public_config`',1,'','2025-01-09 07:34:48'),(490,'Drop public config table','DROP TABLE IF EXISTS `dashboard_public_config`',1,'','2025-01-09 07:34:48'),(491,'Recreate dashboard public config v2','CREATE TABLE IF NOT EXISTS `dashboard_public_config` (\n`uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci PRIMARY KEY NOT NULL\n, `dashboard_uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `time_settings` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `template_variables` MEDIUMTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `access_token` VARCHAR(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `created_by` INT NOT NULL\n, `updated_by` INT NULL\n, `created_at` DATETIME NOT NULL\n, `updated_at` DATETIME NULL\n, `is_enabled` TINYINT(1) NOT NULL DEFAULT 0\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:48'),(492,'create index UQE_dashboard_public_config_uid - v2','CREATE UNIQUE INDEX `UQE_dashboard_public_config_uid` ON `dashboard_public_config` (`uid`);',1,'','2025-01-09 07:34:48'),(493,'create index IDX_dashboard_public_config_org_id_dashboard_uid - v2','CREATE INDEX `IDX_dashboard_public_config_org_id_dashboard_uid` ON `dashboard_public_config` (`org_id`,`dashboard_uid`);',1,'','2025-01-09 07:34:48'),(494,'create index UQE_dashboard_public_config_access_token - v2','CREATE UNIQUE INDEX `UQE_dashboard_public_config_access_token` ON `dashboard_public_config` (`access_token`);',1,'','2025-01-09 07:34:48'),(495,'Rename table dashboard_public_config to dashboard_public - v2','ALTER TABLE `dashboard_public_config` RENAME TO `dashboard_public`',1,'','2025-01-09 07:34:48'),(496,'add annotations_enabled column','alter table `dashboard_public` ADD COLUMN `annotations_enabled` TINYINT(1) NOT NULL DEFAULT 0 ',1,'','2025-01-09 07:34:48'),(497,'add time_selection_enabled column','alter table `dashboard_public` ADD COLUMN `time_selection_enabled` TINYINT(1) NOT NULL DEFAULT 0 ',1,'','2025-01-09 07:34:48'),(498,'delete orphaned public dashboards','DELETE FROM dashboard_public WHERE dashboard_uid NOT IN (SELECT uid FROM dashboard)',1,'','2025-01-09 07:34:48'),(499,'add share column','alter table `dashboard_public` ADD COLUMN `share` VARCHAR(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT \'public\' ',1,'','2025-01-09 07:34:48'),(500,'backfill empty share column fields with default of public','UPDATE dashboard_public SET share=\'public\' WHERE share=\'\'',1,'','2025-01-09 07:34:48'),(501,'create file table','CREATE TABLE IF NOT EXISTS `file` (\n`path` VARCHAR(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `path_hash` VARCHAR(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `parent_folder_path_hash` VARCHAR(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `contents` BLOB NOT NULL\n, `etag` VARCHAR(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `cache_control` VARCHAR(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `content_disposition` VARCHAR(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `updated` DATETIME NOT NULL\n, `created` DATETIME NOT NULL\n, `size` BIGINT(20) NOT NULL\n, `mime_type` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:48'),(502,'file table idx: path natural pk','CREATE UNIQUE INDEX `UQE_file_path_hash` ON `file` (`path_hash`);',1,'','2025-01-09 07:34:49'),(503,'file table idx: parent_folder_path_hash fast folder retrieval','CREATE INDEX `IDX_file_parent_folder_path_hash` ON `file` (`parent_folder_path_hash`);',1,'','2025-01-09 07:34:49'),(504,'create file_meta table','CREATE TABLE IF NOT EXISTS `file_meta` (\n`path_hash` VARCHAR(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `key` VARCHAR(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `value` VARCHAR(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:49'),(505,'file table idx: path key','CREATE UNIQUE INDEX `UQE_file_meta_path_hash_key` ON `file_meta` (`path_hash`,`key`);',1,'','2025-01-09 07:34:49'),(506,'set path collation in file table','SELECT 0;',1,'','2025-01-09 07:34:49'),(507,'migrate contents column to mediumblob for MySQL','ALTER TABLE file MODIFY contents MEDIUMBLOB;',1,'','2025-01-09 07:34:49'),(508,'managed permissions migration','code migration',1,'','2025-01-09 07:34:49'),(509,'managed folder permissions alert actions migration','code migration',1,'','2025-01-09 07:34:49'),(510,'RBAC action name migrator','code migration',1,'','2025-01-09 07:34:49'),(511,'Add UID column to playlist','alter table `playlist` ADD COLUMN `uid` VARCHAR(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 0 ',1,'','2025-01-09 07:34:49'),(512,'Update uid column values in playlist','UPDATE playlist SET uid=id;',1,'','2025-01-09 07:34:49'),(513,'Add index for uid in playlist','CREATE UNIQUE INDEX `UQE_playlist_org_id_uid` ON `playlist` (`org_id`,`uid`);',1,'','2025-01-09 07:34:49'),(514,'update group index for alert rules','code migration',1,'','2025-01-09 07:34:49'),(515,'managed folder permissions alert actions repeated migration','code migration',1,'','2025-01-09 07:34:49'),(516,'admin only folder/dashboard permission','code migration',1,'','2025-01-09 07:34:49'),(517,'add action column to seed_assignment','alter table `seed_assignment` ADD COLUMN `action` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-01-09 07:34:49'),(518,'add scope column to seed_assignment','alter table `seed_assignment` ADD COLUMN `scope` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-01-09 07:34:49'),(519,'remove unique index builtin_role_role_name before nullable update','DROP INDEX `UQE_seed_assignment_builtin_role_role_name` ON `seed_assignment`',1,'','2025-01-09 07:34:49'),(520,'update seed_assignment role_name column to nullable','ALTER TABLE seed_assignment MODIFY role_name VARCHAR(190) DEFAULT NULL;',1,'','2025-01-09 07:34:49'),(521,'add unique index builtin_role_name back','CREATE UNIQUE INDEX `UQE_seed_assignment_builtin_role_role_name` ON `seed_assignment` (`builtin_role`,`role_name`);',1,'','2025-01-09 07:34:49'),(522,'add unique index builtin_role_action_scope','CREATE UNIQUE INDEX `UQE_seed_assignment_builtin_role_action_scope` ON `seed_assignment` (`builtin_role`,`action`,`scope`);',1,'','2025-01-09 07:34:49'),(523,'add primary key to seed_assigment','code migration',1,'','2025-01-09 07:34:49'),(524,'add origin column to seed_assignment','alter table `seed_assignment` ADD COLUMN `origin` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-01-09 07:34:49'),(525,'add origin to plugin seed_assignment','code migration',1,'','2025-01-09 07:34:49'),(526,'prevent seeding OnCall access','code migration',1,'','2025-01-09 07:34:49'),(527,'managed folder permissions alert actions repeated fixed migration','code migration',1,'','2025-01-09 07:34:49'),(528,'managed folder permissions library panel actions migration','code migration',1,'','2025-01-09 07:34:49'),(529,'migrate external alertmanagers to datsourcse','migrate external alertmanagers to datasource',1,'','2025-01-09 07:34:49'),(530,'create folder table','CREATE TABLE IF NOT EXISTS `folder` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `title` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `description` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `parent_uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:49'),(531,'Add index for parent_uid','CREATE INDEX `IDX_folder_parent_uid_org_id` ON `folder` (`parent_uid`,`org_id`);',1,'','2025-01-09 07:34:49'),(532,'Add unique index for folder.uid and folder.org_id','CREATE UNIQUE INDEX `UQE_folder_uid_org_id` ON `folder` (`uid`,`org_id`);',1,'','2025-01-09 07:34:50'),(533,'Update folder title length','ALTER TABLE `folder` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, MODIFY `title` VARCHAR(189) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL ;',1,'','2025-01-09 07:34:50'),(534,'Add unique index for folder.title and folder.parent_uid','CREATE UNIQUE INDEX `UQE_folder_title_parent_uid` ON `folder` (`title`,`parent_uid`);',1,'','2025-01-09 07:34:50'),(535,'Remove unique index for folder.title and folder.parent_uid','DROP INDEX `UQE_folder_title_parent_uid` ON `folder`',1,'','2025-01-09 07:34:50'),(536,'Add unique index for title, parent_uid, and org_id','CREATE UNIQUE INDEX `UQE_folder_title_parent_uid_org_id` ON `folder` (`title`,`parent_uid`,`org_id`);',1,'','2025-01-09 07:34:50'),(537,'Sync dashboard and folder table','\n			INSERT INTO folder (uid, org_id, title, created, updated)\n			SELECT * FROM (SELECT uid, org_id, title, created, updated FROM dashboard WHERE is_folder = 1) AS derived\n			ON DUPLICATE KEY UPDATE title=derived.title, updated=derived.updated\n		',1,'','2025-01-09 07:34:50'),(538,'Remove ghost folders from the folder table','\n			DELETE FROM folder WHERE NOT EXISTS\n				(SELECT 1 FROM dashboard WHERE dashboard.uid = folder.uid AND dashboard.org_id = folder.org_id AND dashboard.is_folder = true)\n	',1,'','2025-01-09 07:34:50'),(539,'Remove unique index UQE_folder_uid_org_id','DROP INDEX `UQE_folder_uid_org_id` ON `folder`',1,'','2025-01-09 07:34:50'),(540,'Add unique index UQE_folder_org_id_uid','CREATE UNIQUE INDEX `UQE_folder_org_id_uid` ON `folder` (`org_id`,`uid`);',1,'','2025-01-09 07:34:50'),(541,'Remove unique index UQE_folder_title_parent_uid_org_id','DROP INDEX `UQE_folder_title_parent_uid_org_id` ON `folder`',1,'','2025-01-09 07:34:50'),(542,'Add unique index UQE_folder_org_id_parent_uid_title','CREATE UNIQUE INDEX `UQE_folder_org_id_parent_uid_title` ON `folder` (`org_id`,`parent_uid`,`title`);',1,'','2025-01-09 07:34:50'),(543,'Remove index IDX_folder_parent_uid_org_id','DROP INDEX `IDX_folder_parent_uid_org_id` ON `folder`',1,'','2025-01-09 07:34:50'),(544,'create anon_device table','CREATE TABLE IF NOT EXISTS `anon_device` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `client_ip` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `created_at` DATETIME NOT NULL\n, `device_id` VARCHAR(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `updated_at` DATETIME NOT NULL\n, `user_agent` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:50'),(545,'add unique index anon_device.device_id','CREATE UNIQUE INDEX `UQE_anon_device_device_id` ON `anon_device` (`device_id`);',1,'','2025-01-09 07:34:50'),(546,'add index anon_device.updated_at','CREATE INDEX `IDX_anon_device_updated_at` ON `anon_device` (`updated_at`);',1,'','2025-01-09 07:34:50'),(547,'create signing_key table','CREATE TABLE IF NOT EXISTS `signing_key` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `key_id` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `private_key` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `added_at` DATETIME NOT NULL\n, `expires_at` DATETIME NULL\n, `alg` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:50'),(548,'add unique index signing_key.key_id','CREATE UNIQUE INDEX `UQE_signing_key_key_id` ON `signing_key` (`key_id`);',1,'','2025-01-09 07:34:50'),(549,'set legacy alert migration status in kvstore','code migration',1,'','2025-01-09 07:34:50'),(550,'migrate record of created folders during legacy migration to kvstore','code migration',1,'','2025-01-09 07:34:50'),(551,'Add folder_uid for dashboard','alter table `dashboard` ADD COLUMN `folder_uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-01-09 07:34:50'),(552,'Populate dashboard folder_uid column','code migration',1,'','2025-01-09 07:34:50'),(553,'Add unique index for dashboard_org_id_folder_uid_title','code migration',1,'','2025-01-09 07:34:50'),(554,'Delete unique index for dashboard_org_id_folder_id_title','DROP INDEX `UQE_dashboard_org_id_folder_id_title` ON `dashboard`',1,'','2025-01-09 07:34:50'),(555,'Delete unique index for dashboard_org_id_folder_uid_title','code migration',1,'','2025-01-09 07:34:50'),(556,'Add unique index for dashboard_org_id_folder_uid_title_is_folder','CREATE UNIQUE INDEX `UQE_dashboard_org_id_folder_uid_title_is_folder` ON `dashboard` (`org_id`,`folder_uid`,`title`,`is_folder`);',1,'','2025-01-09 07:34:50'),(557,'Restore index for dashboard_org_id_folder_id_title','CREATE INDEX `IDX_dashboard_org_id_folder_id_title` ON `dashboard` (`org_id`,`folder_id`,`title`);',1,'','2025-01-09 07:34:50'),(558,'create sso_setting table','CREATE TABLE IF NOT EXISTS `sso_setting` (\n`id` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci PRIMARY KEY NOT NULL\n, `provider` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `settings` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n, `is_deleted` TINYINT(1) NOT NULL DEFAULT 0\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:50'),(559,'copy kvstore migration status to each org','code migration',1,'','2025-01-09 07:34:50'),(560,'add back entry for orgid=0 migrated status','code migration',1,'','2025-01-09 07:34:50'),(561,'managed dashboard permissions annotation actions migration','code migration',1,'','2025-01-09 07:34:50'),(562,'create cloud_migration table v1','CREATE TABLE IF NOT EXISTS `cloud_migration` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `auth_token` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `stack` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:50'),(563,'create cloud_migration_run table v1','CREATE TABLE IF NOT EXISTS `cloud_migration_run` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `cloud_migration_uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `result` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n, `finished` DATETIME NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:50'),(564,'add stack_id column','alter table `cloud_migration` ADD COLUMN `stack_id` BIGINT(20) NOT NULL ',1,'','2025-01-09 07:34:50'),(565,'add region_slug column','alter table `cloud_migration` ADD COLUMN `region_slug` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL ',1,'','2025-01-09 07:34:51'),(566,'add cluster_slug column','alter table `cloud_migration` ADD COLUMN `cluster_slug` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL ',1,'','2025-01-09 07:34:51'),(567,'add migration uid column','alter table `cloud_migration` ADD COLUMN `uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-01-09 07:34:51'),(568,'Update uid column values for migration','UPDATE cloud_migration SET uid=concat(\'u\',lpad(id,9,\'0\')) WHERE uid IS NULL;',1,'','2025-01-09 07:34:51'),(569,'Add unique index migration_uid','CREATE UNIQUE INDEX `UQE_cloud_migration_uid` ON `cloud_migration` (`uid`);',1,'','2025-01-09 07:34:51'),(570,'add migration run uid column','alter table `cloud_migration_run` ADD COLUMN `uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-01-09 07:34:51'),(571,'Update uid column values for migration run','UPDATE cloud_migration_run SET uid=concat(\'u\',lpad(id,9,\'0\')) WHERE uid IS NULL;',1,'','2025-01-09 07:34:51'),(572,'Add unique index migration_run_uid','CREATE UNIQUE INDEX `UQE_cloud_migration_run_uid` ON `cloud_migration_run` (`uid`);',1,'','2025-01-09 07:34:51'),(573,'Rename table cloud_migration to cloud_migration_session_tmp_qwerty - v1','ALTER TABLE `cloud_migration` RENAME TO `cloud_migration_session_tmp_qwerty`',1,'','2025-01-09 07:34:51'),(574,'create cloud_migration_session v2','CREATE TABLE IF NOT EXISTS `cloud_migration_session` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `auth_token` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `slug` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `stack_id` BIGINT(20) NOT NULL\n, `region_slug` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `cluster_slug` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:51'),(575,'create index UQE_cloud_migration_session_uid - v2','CREATE UNIQUE INDEX `UQE_cloud_migration_session_uid` ON `cloud_migration_session` (`uid`);',1,'','2025-01-09 07:34:51'),(576,'copy cloud_migration_session v1 to v2','INSERT INTO `cloud_migration_session` (`slug`\n, `stack_id`\n, `cluster_slug`\n, `updated`\n, `id`\n, `uid`\n, `auth_token`\n, `region_slug`\n, `created`) SELECT `stack`\n, `stack_id`\n, `cluster_slug`\n, `updated`\n, `id`\n, `uid`\n, `auth_token`\n, `region_slug`\n, `created` FROM `cloud_migration_session_tmp_qwerty`',1,'','2025-01-09 07:34:51'),(577,'drop cloud_migration_session_tmp_qwerty','DROP TABLE IF EXISTS `cloud_migration_session_tmp_qwerty`',1,'','2025-01-09 07:34:51'),(578,'Rename table cloud_migration_run to cloud_migration_snapshot_tmp_qwerty - v1','ALTER TABLE `cloud_migration_run` RENAME TO `cloud_migration_snapshot_tmp_qwerty`',1,'','2025-01-09 07:34:51'),(579,'create cloud_migration_snapshot v2','CREATE TABLE IF NOT EXISTS `cloud_migration_snapshot` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `session_uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `result` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n, `finished` DATETIME NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:51'),(580,'create index UQE_cloud_migration_snapshot_uid - v2','CREATE UNIQUE INDEX `UQE_cloud_migration_snapshot_uid` ON `cloud_migration_snapshot` (`uid`);',1,'','2025-01-09 07:34:51'),(581,'copy cloud_migration_snapshot v1 to v2','INSERT INTO `cloud_migration_snapshot` (`id`\n, `uid`\n, `session_uid`\n, `result`\n, `created`\n, `updated`\n, `finished`) SELECT `id`\n, `uid`\n, `cloud_migration_uid`\n, `result`\n, `created`\n, `updated`\n, `finished` FROM `cloud_migration_snapshot_tmp_qwerty`',1,'','2025-01-09 07:34:51'),(582,'drop cloud_migration_snapshot_tmp_qwerty','DROP TABLE IF EXISTS `cloud_migration_snapshot_tmp_qwerty`',1,'','2025-01-09 07:34:51'),(583,'add snapshot upload_url column','alter table `cloud_migration_snapshot` ADD COLUMN `upload_url` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-01-09 07:34:51'),(584,'add snapshot status column','alter table `cloud_migration_snapshot` ADD COLUMN `status` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL ',1,'','2025-01-09 07:34:51'),(585,'add snapshot local_directory column','alter table `cloud_migration_snapshot` ADD COLUMN `local_directory` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-01-09 07:34:51'),(586,'add snapshot gms_snapshot_uid column','alter table `cloud_migration_snapshot` ADD COLUMN `gms_snapshot_uid` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-01-09 07:34:51'),(587,'add snapshot encryption_key column','alter table `cloud_migration_snapshot` ADD COLUMN `encryption_key` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-01-09 07:34:51'),(588,'add snapshot error_string column','alter table `cloud_migration_snapshot` ADD COLUMN `error_string` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-01-09 07:34:51'),(589,'create cloud_migration_resource table v1','CREATE TABLE IF NOT EXISTS `cloud_migration_resource` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `resource_type` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `resource_uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `status` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `error_string` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `snapshot_uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:51'),(590,'delete cloud_migration_snapshot.result column','ALTER TABLE cloud_migration_snapshot DROP COLUMN result',1,'','2025-01-09 07:34:51'),(591,'add cloud_migration_resource.name column','alter table `cloud_migration_resource` ADD COLUMN `name` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-01-09 07:34:51'),(592,'add cloud_migration_resource.parent_name column','alter table `cloud_migration_resource` ADD COLUMN `parent_name` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-01-09 07:34:51'),(593,'add cloud_migration_session.org_id column','alter table `cloud_migration_session` ADD COLUMN `org_id` BIGINT(20) NOT NULL DEFAULT 1 ',1,'','2025-01-09 07:34:51'),(594,'alter kv_store.value to longtext','ALTER TABLE kv_store MODIFY value LONGTEXT NOT NULL;',1,'','2025-01-09 07:34:51'),(595,'add notification_settings column to alert_rule table','alter table `alert_rule` ADD COLUMN `notification_settings` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-01-09 07:34:51'),(596,'add notification_settings column to alert_rule_version table','alter table `alert_rule_version` ADD COLUMN `notification_settings` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-01-09 07:34:52'),(597,'removing scope from alert.instances:read action migration','code migration',1,'','2025-01-09 07:34:52'),(598,'managed folder permissions alerting silences actions migration','code migration',1,'','2025-01-09 07:34:52'),(599,'add record column to alert_rule table','alter table `alert_rule` ADD COLUMN `record` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-01-09 07:34:52'),(600,'add record column to alert_rule_version table','alter table `alert_rule_version` ADD COLUMN `record` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-01-09 07:34:52'),(601,'add resolved_at column to alert_instance table','alter table `alert_instance` ADD COLUMN `resolved_at` BIGINT(20) NULL ',1,'','2025-01-09 07:34:52'),(602,'add last_sent_at column to alert_instance table','alter table `alert_instance` ADD COLUMN `last_sent_at` BIGINT(20) NULL ',1,'','2025-01-09 07:34:52'),(603,'Enable traceQL streaming for all Tempo datasources','code migration',1,'','2025-01-09 07:34:52'),(604,'Add scope to alert.notifications.receivers:read and alert.notifications.receivers.secrets:read','code migration',1,'','2025-01-09 07:34:52'),(605,'add metadata column to alert_rule table','alter table `alert_rule` ADD COLUMN `metadata` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-01-09 07:34:52'),(606,'add metadata column to alert_rule_version table','alter table `alert_rule_version` ADD COLUMN `metadata` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-01-09 07:34:52'),(607,'delete orphaned service account permissions','code migration',1,'','2025-01-09 07:34:52'),(608,'adding action set permissions','code migration',1,'','2025-01-09 07:34:52'),(609,'create user_external_session table','CREATE TABLE IF NOT EXISTS `user_external_session` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `user_auth_id` BIGINT(20) NOT NULL\n, `user_id` BIGINT(20) NOT NULL\n, `auth_module` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `access_token` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `id_token` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `refresh_token` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `session_id` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `session_id_hash` CHAR(44) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `name_id` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `name_id_hash` CHAR(44) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `expires_at` DATETIME NULL\n, `created_at` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:52'),(610,'increase name_id column length to 1024','ALTER TABLE user_external_session MODIFY name_id NVARCHAR(1024);',1,'','2025-01-09 07:34:52'),(611,'increase session_id column length to 1024','ALTER TABLE user_external_session MODIFY session_id NVARCHAR(1024);',1,'','2025-01-09 07:34:52'),(612,'create data_source_usage_by_day table','CREATE TABLE IF NOT EXISTS `data_source_usage_by_day` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `data_source_id` BIGINT(20) NOT NULL\n, `day` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `queries` BIGINT(20) NOT NULL\n, `errors` BIGINT(20) NOT NULL\n, `load_duration_ms` BIGINT(20) NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:52'),(613,'create data_source_usage_by_day(data_source_id) index','CREATE INDEX `IDX_data_source_usage_by_day_data_source_id` ON `data_source_usage_by_day` (`data_source_id`);',1,'','2025-01-09 07:34:52'),(614,'create data_source_usage_by_day(data_source_id, day) unique index','CREATE UNIQUE INDEX `UQE_data_source_usage_by_day_data_source_id_day` ON `data_source_usage_by_day` (`data_source_id`,`day`);',1,'','2025-01-09 07:34:52'),(615,'create dashboard_usage_by_day table','CREATE TABLE IF NOT EXISTS `dashboard_usage_by_day` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `dashboard_id` BIGINT(20) NOT NULL\n, `day` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `views` BIGINT(20) NOT NULL\n, `queries` BIGINT(20) NOT NULL\n, `errors` BIGINT(20) NOT NULL\n, `load_duration` FLOAT NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:52'),(616,'create dashboard_usage_sums table','CREATE TABLE IF NOT EXISTS `dashboard_usage_sums` (\n`dashboard_id` BIGINT(20) PRIMARY KEY NOT NULL\n, `updated` DATETIME NOT NULL\n, `views_last_1_days` BIGINT(20) NOT NULL\n, `views_last_7_days` BIGINT(20) NOT NULL\n, `views_last_30_days` BIGINT(20) NOT NULL\n, `views_total` BIGINT(20) NOT NULL\n, `queries_last_1_days` BIGINT(20) NOT NULL\n, `queries_last_7_days` BIGINT(20) NOT NULL\n, `queries_last_30_days` BIGINT(20) NOT NULL\n, `queries_total` BIGINT(20) NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:52'),(617,'create dashboard_usage_by_day(dashboard_id) index','CREATE INDEX `IDX_dashboard_usage_by_day_dashboard_id` ON `dashboard_usage_by_day` (`dashboard_id`);',1,'','2025-01-09 07:34:52'),(618,'create dashboard_usage_by_day(dashboard_id, day) index','CREATE UNIQUE INDEX `UQE_dashboard_usage_by_day_dashboard_id_day` ON `dashboard_usage_by_day` (`dashboard_id`,`day`);',1,'','2025-01-09 07:34:52'),(619,'add column errors_last_1_days to dashboard_usage_sums','alter table `dashboard_usage_sums` ADD COLUMN `errors_last_1_days` BIGINT(20) NOT NULL DEFAULT 0 ',1,'','2025-01-09 07:34:52'),(620,'add column errors_last_7_days to dashboard_usage_sums','alter table `dashboard_usage_sums` ADD COLUMN `errors_last_7_days` BIGINT(20) NOT NULL DEFAULT 0 ',1,'','2025-01-09 07:34:52'),(621,'add column errors_last_30_days to dashboard_usage_sums','alter table `dashboard_usage_sums` ADD COLUMN `errors_last_30_days` BIGINT(20) NOT NULL DEFAULT 0 ',1,'','2025-01-09 07:34:52'),(622,'add column errors_total to dashboard_usage_sums','alter table `dashboard_usage_sums` ADD COLUMN `errors_total` BIGINT(20) NOT NULL DEFAULT 0 ',1,'','2025-01-09 07:34:52'),(623,'create dashboard_public_usage_by_day table','CREATE TABLE IF NOT EXISTS `dashboard_public_usage_by_day` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `public_dashboard_uid` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `day` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `views` BIGINT(20) NOT NULL\n, `queries` BIGINT(20) NOT NULL\n, `errors` BIGINT(20) NOT NULL\n, `load_duration` FLOAT NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:52'),(624,'add column cached_queries to dashboard_usage_by_day table','alter table `dashboard_usage_by_day` ADD COLUMN `cached_queries` BIGINT(20) NOT NULL DEFAULT 0 ',1,'','2025-01-09 07:34:53'),(625,'add column cached_queries to dashboard_public_usage_by_day table','alter table `dashboard_public_usage_by_day` ADD COLUMN `cached_queries` BIGINT(20) NOT NULL DEFAULT 0 ',1,'','2025-01-09 07:34:53'),(626,'create user_dashboard_views table','CREATE TABLE IF NOT EXISTS `user_dashboard_views` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `user_id` BIGINT(20) NOT NULL\n, `dashboard_id` BIGINT(20) NOT NULL\n, `viewed` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:53'),(627,'add index user_dashboard_views.user_id','CREATE INDEX `IDX_user_dashboard_views_user_id` ON `user_dashboard_views` (`user_id`);',1,'','2025-01-09 07:34:53'),(628,'add index user_dashboard_views.dashboard_id','CREATE INDEX `IDX_user_dashboard_views_dashboard_id` ON `user_dashboard_views` (`dashboard_id`);',1,'','2025-01-09 07:34:53'),(629,'add unique index user_dashboard_views_user_id_dashboard_id','CREATE UNIQUE INDEX `UQE_user_dashboard_views_user_id_dashboard_id` ON `user_dashboard_views` (`user_id`,`dashboard_id`);',1,'','2025-01-09 07:34:53'),(630,'create user_stats table','CREATE TABLE IF NOT EXISTS `user_stats` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `user_id` BIGINT(20) NOT NULL\n, `billing_role` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:53'),(631,'add unique index user_stats(user_id)','CREATE UNIQUE INDEX `UQE_user_stats_user_id` ON `user_stats` (`user_id`);',1,'','2025-01-09 07:34:53'),(632,'create data_source_cache table','CREATE TABLE IF NOT EXISTS `data_source_cache` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `data_source_id` BIGINT(20) NOT NULL\n, `enabled` TINYINT(1) NOT NULL\n, `ttl_ms` BIGINT(20) NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:53'),(633,'add index data_source_cache.data_source_id','CREATE INDEX `IDX_data_source_cache_data_source_id` ON `data_source_cache` (`data_source_id`);',1,'','2025-01-09 07:34:53'),(634,'add use_default_ttl column','alter table `data_source_cache` ADD COLUMN `use_default_ttl` TINYINT(1) NOT NULL DEFAULT 1 ',1,'','2025-01-09 07:34:53'),(635,'add data_source_cache.data_source_uid column','alter table `data_source_cache` ADD COLUMN `data_source_uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 0 ',1,'','2025-01-09 07:34:53'),(636,'remove abandoned data_source_cache records','DELETE FROM data_source_cache WHERE NOT EXISTS (SELECT 1 FROM data_source WHERE id = data_source_cache.data_source_id);',1,'','2025-01-09 07:34:53'),(637,'update data_source_cache.data_source_uid value','UPDATE data_source_cache JOIN data_source ON data_source_cache.data_source_id = data_source.id SET data_source_cache.data_source_uid = data_source.uid;',1,'','2025-01-09 07:34:53'),(638,'add index data_source_cache.data_source_uid','CREATE INDEX `IDX_data_source_cache_data_source_uid` ON `data_source_cache` (`data_source_uid`);',1,'','2025-01-09 07:34:53'),(639,'add data_source_cache.ttl_resources_ms column','alter table `data_source_cache` ADD COLUMN `ttl_resources_ms` BIGINT(20) NOT NULL DEFAULT 300000 ',1,'','2025-01-09 07:34:53'),(640,'update data_source_cache.ttl_resources_ms to have the same value as ttl_ms','UPDATE data_source_cache SET ttl_resources_ms = ttl_ms;',1,'','2025-01-09 07:34:53'),(641,'create data_source_acl table','CREATE TABLE IF NOT EXISTS `data_source_acl` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `data_source_id` BIGINT(20) NOT NULL\n, `team_id` BIGINT(20) NOT NULL\n, `user_id` BIGINT(20) NOT NULL\n, `permission` SMALLINT NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:53'),(642,'add index data_source_acl.data_source_id','CREATE INDEX `IDX_data_source_acl_data_source_id` ON `data_source_acl` (`data_source_id`);',1,'','2025-01-09 07:34:53'),(643,'add unique index datasource_acl.unique','CREATE UNIQUE INDEX `UQE_data_source_acl_data_source_id_team_id_user_id` ON `data_source_acl` (`data_source_id`,`team_id`,`user_id`);',1,'','2025-01-09 07:34:53'),(644,'create license_token table','CREATE TABLE IF NOT EXISTS `license_token` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `token` LONGTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:53'),(645,'drop recorded_queries table v14','DROP TABLE IF EXISTS `recorded_queries`',1,'','2025-01-09 07:34:53'),(646,'drop recording_rules table v14','DROP TABLE IF EXISTS `recording_rules`',1,'','2025-01-09 07:34:53'),(647,'create recording_rules table v14','CREATE TABLE IF NOT EXISTS `recording_rules` (\n`id` VARCHAR(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `target_ref_id` VARCHAR(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `name` VARCHAR(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `description` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `interval` BIGINT(20) NOT NULL\n, `range` BIGINT(20) NOT NULL\n, `active` TINYINT(1) NOT NULL DEFAULT 0\n, `count` TINYINT(1) NOT NULL DEFAULT 0\n, `queries` BLOB NOT NULL\n, `created_at` DATETIME NOT NULL\n, PRIMARY KEY ( `id`,`target_ref_id` )) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:53'),(648,'create remote_write_targets table v1','CREATE TABLE IF NOT EXISTS `remote_write_targets` (\n`id` VARCHAR(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `data_source_uid` VARCHAR(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `write_path` VARCHAR(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `org_id` INT NOT NULL\n, PRIMARY KEY ( `id`,`data_source_uid`,`write_path` )) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:53'),(649,'Add prom_name to recording_rules table','alter table `recording_rules` ADD COLUMN `prom_name` VARCHAR(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-01-09 07:34:53'),(650,'ensure remote_write_targets table','CREATE TABLE IF NOT EXISTS `remote_write_targets` (\n`id` VARCHAR(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `data_source_uid` VARCHAR(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `write_path` VARCHAR(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `org_id` INT NOT NULL\n, PRIMARY KEY ( `id`,`data_source_uid`,`write_path` )) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:53'),(651,'create report config table v1','CREATE TABLE IF NOT EXISTS `report` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `user_id` BIGINT(20) NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `dashboard_id` BIGINT(20) NOT NULL\n, `name` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `recipients` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `reply_to` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `message` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `schedule_frequency` VARCHAR(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `schedule_day` VARCHAR(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `schedule_hour` BIGINT(20) NOT NULL\n, `schedule_minute` BIGINT(20) NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:53'),(652,'Add index report.user_id','CREATE INDEX `IDX_report_user_id` ON `report` (`user_id`);',1,'','2025-01-09 07:34:53'),(653,'add index to dashboard_id','CREATE INDEX `IDX_report_dashboard_id` ON `report` (`dashboard_id`);',1,'','2025-01-09 07:34:53'),(654,'add index to org_id','CREATE INDEX `IDX_report_org_id` ON `report` (`org_id`);',1,'','2025-01-09 07:34:53'),(655,'Add timezone to the report','alter table `report` ADD COLUMN `schedule_timezone` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT \'Europe/Stockholm\' ',1,'','2025-01-09 07:34:54'),(656,'Add time_from to the report','alter table `report` ADD COLUMN `time_from` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-01-09 07:34:54'),(657,'Add time_to to the report','alter table `report` ADD COLUMN `time_to` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-01-09 07:34:54'),(658,'Add PDF landscape option to the report','alter table `report` ADD COLUMN `pdf_landscape` TINYINT(1) NULL ',1,'','2025-01-09 07:34:54'),(659,'Add monthly day scheduling option to the report','alter table `report` ADD COLUMN `schedule_day_of_month` VARCHAR(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-01-09 07:34:54'),(660,'Add PDF layout option to the report','alter table `report` ADD COLUMN `pdf_layout` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-01-09 07:34:54'),(661,'Add PDF orientation option to the report','alter table `report` ADD COLUMN `pdf_orientation` VARCHAR(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-01-09 07:34:54'),(662,'Update report pdf_orientation from pdf_landscape','UPDATE report SET pdf_orientation = \'landscape\' WHERE pdf_landscape = 1',1,'','2025-01-09 07:34:54'),(663,'create report settings table','CREATE TABLE IF NOT EXISTS `report_settings` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `user_id` BIGINT(20) NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `branding_report_logo_url` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `branding_email_logo_url` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `branding_email_footer_link` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `branding_email_footer_text` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `branding_email_footer_mode` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:54'),(664,'Add dashboard_uid field to the report','alter table `report` ADD COLUMN `dashboard_uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-01-09 07:34:54'),(665,'Add template_vars field to the report','alter table `report` ADD COLUMN `template_vars` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-01-09 07:34:54'),(666,'Add option to include dashboard url in the report','alter table `report` ADD COLUMN `enable_dashboard_url` TINYINT(1) NULL ',1,'','2025-01-09 07:34:54'),(667,'Add state field to the report','alter table `report` ADD COLUMN `state` VARCHAR(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-01-09 07:34:54'),(668,'Add option to add CSV files to the report','alter table `report` ADD COLUMN `enable_csv` TINYINT(1) NULL ',1,'','2025-01-09 07:34:54'),(669,'Add scheduling start date','alter table `report` ADD COLUMN `schedule_start` INT NULL ',1,'','2025-01-09 07:34:54'),(670,'Add missing schedule_start date for old reports','code migration',1,'','2025-01-09 07:34:54'),(671,'Add scheduling end date','alter table `report` ADD COLUMN `schedule_end` INT NULL ',1,'','2025-01-09 07:34:54'),(672,'Add schedulinng custom interval frequency','alter table `report` ADD COLUMN `schedule_interval_frequency` VARCHAR(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-01-09 07:34:54'),(673,'Add scheduling custom interval amount','alter table `report` ADD COLUMN `schedule_interval_amount` BIGINT(20) NULL ',1,'','2025-01-09 07:34:54'),(674,'Add workdays only flag to report','alter table `report` ADD COLUMN `schedule_workdays_only` TINYINT(1) NULL ',1,'','2025-01-09 07:34:54'),(675,'create report dashboards table','CREATE TABLE IF NOT EXISTS `report_dashboards` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `report_id` BIGINT(20) NOT NULL\n, `dashboard_uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT \'\'\n, `report_variables` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `time_to` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `time_from` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:54'),(676,'Add index report_dashboards.report_id','CREATE INDEX `IDX_report_dashboards_report_id` ON `report_dashboards` (`report_id`);',1,'','2025-01-09 07:34:54'),(677,'Migrate report fields into report_dashboards','INSERT INTO report_dashboards (report_id, dashboard_uid, report_variables, time_to, time_from) SELECT id, CASE WHEN dashboard_uid IS NULL THEN \'\' ELSE dashboard_uid END, template_vars, time_to, time_from FROM report',1,'','2025-01-09 07:34:54'),(678,'Add formats option to the report','alter table `report` ADD COLUMN `formats` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT \'[\"pdf\"]\' ',1,'','2025-01-09 07:34:54'),(679,'Migrate reports with csv enabled','UPDATE report SET formats=\'[\"pdf\",\"csv\"]\' WHERE enable_csv IS TRUE;',1,'','2025-01-09 07:34:54'),(680,'Migrate ancient reports','code migration',1,'','2025-01-09 07:34:54'),(681,'Add created column in report_dashboards','alter table `report_dashboards` ADD COLUMN `created` DATETIME NULL ',1,'','2025-01-09 07:34:54'),(682,'Add scale_factor to the report','alter table `report` ADD COLUMN `scale_factor` TINYINT NOT NULL DEFAULT 2 ',1,'','2025-01-09 07:34:54'),(683,'Add uid column to report','alter table `report` ADD COLUMN `uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-01-09 07:34:54'),(684,'Add unique index reports_org_id_uid','CREATE UNIQUE INDEX `UQE_report_org_id_uid` ON `report` (`org_id`,`uid`);',1,'','2025-01-09 07:34:54'),(685,'Add pdf show template variable values to the report','alter table `report` ADD COLUMN `pdf_show_template_variables` TINYINT(1) NOT NULL DEFAULT 0 ',1,'','2025-01-09 07:34:55'),(686,'create team group table','CREATE TABLE IF NOT EXISTS `team_group` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `team_id` BIGINT(20) NOT NULL\n, `group_id` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:55'),(687,'add index team_group.org_id','CREATE INDEX `IDX_team_group_org_id` ON `team_group` (`org_id`);',1,'','2025-01-09 07:34:55'),(688,'add unique index team_group.org_id_team_id_group_id','CREATE UNIQUE INDEX `UQE_team_group_org_id_team_id_group_id` ON `team_group` (`org_id`,`team_id`,`group_id`);',1,'','2025-01-09 07:34:55'),(689,'add index team_group.group_id','CREATE INDEX `IDX_team_group_group_id` ON `team_group` (`group_id`);',1,'','2025-01-09 07:34:55'),(690,'create settings table','CREATE TABLE IF NOT EXISTS `setting` (\n`section` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `key` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `value` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:55'),(691,'add unique index settings.section_key','CREATE UNIQUE INDEX `UQE_setting_section_key` ON `setting` (`section`,`key`);',1,'','2025-01-09 07:34:55'),(692,'add setting.encrypted_value','alter table `setting` ADD COLUMN `encrypted_value` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-01-09 07:34:55'),(693,'migrate role names','code migration',1,'','2025-01-09 07:34:55'),(694,'rename orgs roles','code migration',1,'','2025-01-09 07:34:55'),(695,'remove duplicated org role','code migration',1,'','2025-01-09 07:34:55'),(696,'migrate alerting role names','code migration',1,'','2025-01-09 07:34:55'),(697,'data source permissions','code migration',1,'','2025-01-09 07:34:55'),(698,'data source uid permissions','code migration',1,'','2025-01-09 07:34:55'),(699,'rename permissions:delegate scope','UPDATE permission SET scope = \'permissions:type:delegate\' WHERE scope = \'permissions:delegate\'',1,'','2025-01-09 07:34:55'),(700,'remove invalid managed permissions','code migration',1,'','2025-01-09 07:34:55'),(701,'builtin role migration','code migration',1,'','2025-01-09 07:34:55'),(702,'seed permissions migration','code migration',1,'','2025-01-09 07:34:55'),(703,'managed permissions migration enterprise','code migration',1,'','2025-01-09 07:34:55'),(704,'create table dashboard_public_email_share','CREATE TABLE IF NOT EXISTS `dashboard_public_email_share` (\n`uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci PRIMARY KEY NOT NULL\n, `public_dashboard_uid` VARCHAR(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `recipient` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `type` VARCHAR(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT \'email\'\n, `created_at` DATETIME NOT NULL\n, `updated_at` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:55'),(705,'create table dashboard_public_magic_link','CREATE TABLE IF NOT EXISTS `dashboard_public_magic_link` (\n`uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci PRIMARY KEY NOT NULL\n, `token_uuid` VARCHAR(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `public_dashboard_uid` VARCHAR(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `email` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `created_at` DATETIME NOT NULL\n, `updated_at` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:55'),(706,'create table dashboard_public_session','CREATE TABLE IF NOT EXISTS `dashboard_public_session` (\n`uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci PRIMARY KEY NOT NULL\n, `cookie_uuid` VARCHAR(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `public_dashboard_uid` VARCHAR(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `email` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `created_at` DATETIME NOT NULL\n, `updated_at` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-01-09 07:34:55'),(707,'add last_seen_at column','alter table `dashboard_public_session` ADD COLUMN `last_seen_at` DATETIME NULL ',1,'','2025-01-09 07:34:55');
/*!40000 ALTER TABLE `migration_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ngalert_configuration`
--

DROP TABLE IF EXISTS `ngalert_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ngalert_configuration` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `org_id` bigint NOT NULL,
  `alertmanagers` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` int NOT NULL,
  `updated_at` int NOT NULL,
  `send_alerts_to` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_ngalert_configuration_org_id` (`org_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ngalert_configuration`
--

LOCK TABLES `ngalert_configuration` WRITE;
/*!40000 ALTER TABLE `ngalert_configuration` DISABLE KEYS */;
/*!40000 ALTER TABLE `ngalert_configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `org`
--

DROP TABLE IF EXISTS `org`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `org` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `version` int NOT NULL,
  `name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_org_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `org`
--

LOCK TABLES `org` WRITE;
/*!40000 ALTER TABLE `org` DISABLE KEYS */;
INSERT INTO `org` VALUES (1,0,'Main Org.','','','','','','',NULL,'2025-01-09 07:34:55','2025-01-09 07:34:55');
/*!40000 ALTER TABLE `org` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `org_user`
--

DROP TABLE IF EXISTS `org_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `org_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `org_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `role` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_org_user_org_id_user_id` (`org_id`,`user_id`),
  KEY `IDX_org_user_org_id` (`org_id`),
  KEY `IDX_org_user_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `org_user`
--

LOCK TABLES `org_user` WRITE;
/*!40000 ALTER TABLE `org_user` DISABLE KEYS */;
INSERT INTO `org_user` VALUES (1,1,1,'Admin','2025-01-09 07:34:55','2025-01-09 07:34:55');
/*!40000 ALTER TABLE `org_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permission` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `role_id` bigint NOT NULL,
  `action` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `scope` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `kind` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `attribute` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `identifier` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_permission_action_scope_role_id` (`action`,`scope`,`role_id`),
  KEY `IDX_permission_role_id` (`role_id`),
  KEY `IDX_permission_identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission`
--

LOCK TABLES `permission` WRITE;
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist`
--

DROP TABLE IF EXISTS `playlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlist` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `interval` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `org_id` bigint NOT NULL,
  `created_at` bigint NOT NULL DEFAULT '0',
  `updated_at` bigint NOT NULL DEFAULT '0',
  `uid` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_playlist_org_id_uid` (`org_id`,`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist`
--

LOCK TABLES `playlist` WRITE;
/*!40000 ALTER TABLE `playlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `playlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist_item`
--

DROP TABLE IF EXISTS `playlist_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlist_item` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `playlist_id` bigint NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist_item`
--

LOCK TABLES `playlist_item` WRITE;
/*!40000 ALTER TABLE `playlist_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `playlist_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_setting`
--

DROP TABLE IF EXISTS `plugin_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plugin_setting` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `org_id` bigint DEFAULT NULL,
  `plugin_id` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `pinned` tinyint(1) NOT NULL,
  `json_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `secure_json_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `plugin_version` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_plugin_setting_org_id_plugin_id` (`org_id`,`plugin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin_setting`
--

LOCK TABLES `plugin_setting` WRITE;
/*!40000 ALTER TABLE `plugin_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugin_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preferences`
--

DROP TABLE IF EXISTS `preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `preferences` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `org_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `version` int NOT NULL,
  `home_dashboard_id` bigint NOT NULL,
  `timezone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `team_id` bigint DEFAULT NULL,
  `week_start` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `json_data` mediumtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `IDX_preferences_org_id` (`org_id`),
  KEY `IDX_preferences_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preferences`
--

LOCK TABLES `preferences` WRITE;
/*!40000 ALTER TABLE `preferences` DISABLE KEYS */;
/*!40000 ALTER TABLE `preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provenance_type`
--

DROP TABLE IF EXISTS `provenance_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provenance_type` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `org_id` bigint NOT NULL,
  `record_key` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `record_type` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `provenance` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_provenance_type_record_type_record_key_org_id` (`record_type`,`record_key`,`org_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provenance_type`
--

LOCK TABLES `provenance_type` WRITE;
/*!40000 ALTER TABLE `provenance_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `provenance_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `query_history`
--

DROP TABLE IF EXISTS `query_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `query_history` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `uid` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `org_id` bigint NOT NULL,
  `datasource_uid` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint DEFAULT NULL,
  `created_at` int NOT NULL,
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queries` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_query_history_org_id_created_by_datasource_uid` (`org_id`,`created_by`,`datasource_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `query_history`
--

LOCK TABLES `query_history` WRITE;
/*!40000 ALTER TABLE `query_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `query_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `query_history_details`
--

DROP TABLE IF EXISTS `query_history_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `query_history_details` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `query_history_item_uid` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `datasource_uid` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `query_history_details`
--

LOCK TABLES `query_history_details` WRITE;
/*!40000 ALTER TABLE `query_history_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `query_history_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `query_history_star`
--

DROP TABLE IF EXISTS `query_history_star`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `query_history_star` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `query_uid` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `org_id` bigint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_query_history_star_user_id_query_uid` (`user_id`,`query_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `query_history_star`
--

LOCK TABLES `query_history_star` WRITE;
/*!40000 ALTER TABLE `query_history_star` DISABLE KEYS */;
/*!40000 ALTER TABLE `query_history_star` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quota`
--

DROP TABLE IF EXISTS `quota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quota` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `org_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `target` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `limit` bigint NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_quota_org_id_user_id_target` (`org_id`,`user_id`,`target`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quota`
--

LOCK TABLES `quota` WRITE;
/*!40000 ALTER TABLE `quota` DISABLE KEYS */;
/*!40000 ALTER TABLE `quota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recording_rules`
--

DROP TABLE IF EXISTS `recording_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recording_rules` (
  `id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `target_ref_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `org_id` bigint NOT NULL,
  `interval` bigint NOT NULL,
  `range` bigint NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `count` tinyint(1) NOT NULL DEFAULT '0',
  `queries` blob NOT NULL,
  `created_at` datetime NOT NULL,
  `prom_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`,`target_ref_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recording_rules`
--

LOCK TABLES `recording_rules` WRITE;
/*!40000 ALTER TABLE `recording_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `recording_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `remote_write_targets`
--

DROP TABLE IF EXISTS `remote_write_targets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `remote_write_targets` (
  `id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_source_uid` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `write_path` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `org_id` int NOT NULL,
  PRIMARY KEY (`id`,`data_source_uid`,`write_path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `remote_write_targets`
--

LOCK TABLES `remote_write_targets` WRITE;
/*!40000 ALTER TABLE `remote_write_targets` DISABLE KEYS */;
/*!40000 ALTER TABLE `remote_write_targets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report`
--

DROP TABLE IF EXISTS `report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `report` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `org_id` bigint NOT NULL,
  `dashboard_id` bigint NOT NULL,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `recipients` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reply_to` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `schedule_frequency` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `schedule_day` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `schedule_hour` bigint NOT NULL,
  `schedule_minute` bigint NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `schedule_timezone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Europe/Stockholm',
  `time_from` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_to` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pdf_landscape` tinyint(1) DEFAULT NULL,
  `schedule_day_of_month` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pdf_layout` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pdf_orientation` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dashboard_uid` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template_vars` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `enable_dashboard_url` tinyint(1) DEFAULT NULL,
  `state` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enable_csv` tinyint(1) DEFAULT NULL,
  `schedule_start` int DEFAULT NULL,
  `schedule_end` int DEFAULT NULL,
  `schedule_interval_frequency` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `schedule_interval_amount` bigint DEFAULT NULL,
  `schedule_workdays_only` tinyint(1) DEFAULT NULL,
  `formats` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '["pdf"]',
  `scale_factor` tinyint NOT NULL DEFAULT '2',
  `uid` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pdf_show_template_variables` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_report_org_id_uid` (`org_id`,`uid`),
  KEY `IDX_report_user_id` (`user_id`),
  KEY `IDX_report_dashboard_id` (`dashboard_id`),
  KEY `IDX_report_org_id` (`org_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report`
--

LOCK TABLES `report` WRITE;
/*!40000 ALTER TABLE `report` DISABLE KEYS */;
/*!40000 ALTER TABLE `report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_dashboards`
--

DROP TABLE IF EXISTS `report_dashboards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `report_dashboards` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `report_id` bigint NOT NULL,
  `dashboard_uid` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `report_variables` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `time_to` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_from` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_report_dashboards_report_id` (`report_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_dashboards`
--

LOCK TABLES `report_dashboards` WRITE;
/*!40000 ALTER TABLE `report_dashboards` DISABLE KEYS */;
/*!40000 ALTER TABLE `report_dashboards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_settings`
--

DROP TABLE IF EXISTS `report_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `report_settings` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `org_id` bigint NOT NULL,
  `branding_report_logo_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `branding_email_logo_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `branding_email_footer_link` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `branding_email_footer_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `branding_email_footer_mode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_settings`
--

LOCK TABLES `report_settings` WRITE;
/*!40000 ALTER TABLE `report_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `report_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `version` bigint NOT NULL,
  `org_id` bigint NOT NULL,
  `uid` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `display_name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `group_name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_role_org_id_name` (`org_id`,`name`),
  UNIQUE KEY `UQE_role_uid` (`uid`),
  KEY `IDX_role_org_id` (`org_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'basic:grafana_admin','Grafana Admin role',1,0,'basic_grafana_admin','2025-01-09 07:34:55','2025-01-09 07:34:55','Grafana Admin','Basic',1),(2,'basic:admin','Admin role',1,0,'basic_admin','2025-01-09 07:34:55','2025-01-09 07:34:55','Admin','Basic',1),(3,'basic:editor','Editor role',1,0,'basic_editor','2025-01-09 07:34:55','2025-01-09 07:34:55','Editor','Basic',1),(4,'basic:viewer','Viewer role',1,0,'basic_viewer','2025-01-09 07:34:55','2025-01-09 07:34:55','Viewer','Basic',1);
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `secrets`
--

DROP TABLE IF EXISTS `secrets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `secrets` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `org_id` bigint NOT NULL,
  `namespace` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `secrets`
--

LOCK TABLES `secrets` WRITE;
/*!40000 ALTER TABLE `secrets` DISABLE KEYS */;
/*!40000 ALTER TABLE `secrets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seed_assignment`
--

DROP TABLE IF EXISTS `seed_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seed_assignment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `builtin_role` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_name` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scope` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `origin` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_seed_assignment_builtin_role_role_name` (`builtin_role`,`role_name`),
  UNIQUE KEY `UQE_seed_assignment_builtin_role_action_scope` (`builtin_role`,`action`,`scope`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seed_assignment`
--

LOCK TABLES `seed_assignment` WRITE;
/*!40000 ALTER TABLE `seed_assignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `seed_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `server_lock`
--

DROP TABLE IF EXISTS `server_lock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `server_lock` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `operation_uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` bigint NOT NULL,
  `last_execution` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_server_lock_operation_uid` (`operation_uid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server_lock`
--

LOCK TABLES `server_lock` WRITE;
/*!40000 ALTER TABLE `server_lock` DISABLE KEYS */;
INSERT INTO `server_lock` VALUES (2,'cleanup expired auth tokens',1,1736388296),(3,'metaanalytics-daily-rollup',1,1736388296),(4,'delete old login attempts',4,1736391296);
/*!40000 ALTER TABLE `server_lock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session`
--

DROP TABLE IF EXISTS `session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `session` (
  `key` char(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` blob NOT NULL,
  `expiry` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session`
--

LOCK TABLES `session` WRITE;
/*!40000 ALTER TABLE `session` DISABLE KEYS */;
/*!40000 ALTER TABLE `session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setting`
--

DROP TABLE IF EXISTS `setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `setting` (
  `section` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `encrypted_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  UNIQUE KEY `UQE_setting_section_key` (`section`,`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setting`
--

LOCK TABLES `setting` WRITE;
/*!40000 ALTER TABLE `setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `short_url`
--

DROP TABLE IF EXISTS `short_url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `short_url` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `org_id` bigint NOT NULL,
  `uid` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint DEFAULT NULL,
  `created_at` int NOT NULL,
  `last_seen_at` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_short_url_org_id_uid` (`org_id`,`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `short_url`
--

LOCK TABLES `short_url` WRITE;
/*!40000 ALTER TABLE `short_url` DISABLE KEYS */;
/*!40000 ALTER TABLE `short_url` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `signing_key`
--

DROP TABLE IF EXISTS `signing_key`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `signing_key` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `key_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `private_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `added_at` datetime NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  `alg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_signing_key_key_id` (`key_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `signing_key`
--

LOCK TABLES `signing_key` WRITE;
/*!40000 ALTER TABLE `signing_key` DISABLE KEYS */;
/*!40000 ALTER TABLE `signing_key` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sso_setting`
--

DROP TABLE IF EXISTS `sso_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sso_setting` (
  `id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `settings` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sso_setting`
--

LOCK TABLES `sso_setting` WRITE;
/*!40000 ALTER TABLE `sso_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `sso_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `star`
--

DROP TABLE IF EXISTS `star`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `star` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `dashboard_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_star_user_id_dashboard_id` (`user_id`,`dashboard_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `star`
--

LOCK TABLES `star` WRITE;
/*!40000 ALTER TABLE `star` DISABLE KEYS */;
/*!40000 ALTER TABLE `star` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_tag_key_value` (`key`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `org_id` bigint NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `uid` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_team_org_id_name` (`org_id`,`name`),
  UNIQUE KEY `UQE_team_org_id_uid` (`org_id`,`uid`),
  KEY `IDX_team_org_id` (`org_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_group`
--

DROP TABLE IF EXISTS `team_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team_group` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `org_id` bigint NOT NULL,
  `team_id` bigint NOT NULL,
  `group_id` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_team_group_org_id_team_id_group_id` (`org_id`,`team_id`,`group_id`),
  KEY `IDX_team_group_org_id` (`org_id`),
  KEY `IDX_team_group_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_group`
--

LOCK TABLES `team_group` WRITE;
/*!40000 ALTER TABLE `team_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `team_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_member`
--

DROP TABLE IF EXISTS `team_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team_member` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `org_id` bigint NOT NULL,
  `team_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `external` tinyint(1) DEFAULT NULL,
  `permission` smallint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_team_member_org_id_team_id_user_id` (`org_id`,`team_id`,`user_id`),
  KEY `IDX_team_member_org_id` (`org_id`),
  KEY `IDX_team_member_team_id` (`team_id`),
  KEY `IDX_team_member_user_id_org_id` (`user_id`,`org_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_member`
--

LOCK TABLES `team_member` WRITE;
/*!40000 ALTER TABLE `team_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `team_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_role`
--

DROP TABLE IF EXISTS `team_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team_role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `org_id` bigint NOT NULL,
  `team_id` bigint NOT NULL,
  `role_id` bigint NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_team_role_org_id_team_id_role_id` (`org_id`,`team_id`,`role_id`),
  KEY `IDX_team_role_org_id` (`org_id`),
  KEY `IDX_team_role_team_id` (`team_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_role`
--

LOCK TABLES `team_role` WRITE;
/*!40000 ALTER TABLE `team_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `team_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temp_user`
--

DROP TABLE IF EXISTS `temp_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `temp_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `org_id` bigint NOT NULL,
  `version` int NOT NULL,
  `email` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `invited_by_user_id` bigint DEFAULT NULL,
  `email_sent` tinyint(1) NOT NULL,
  `email_sent_on` datetime DEFAULT NULL,
  `remote_addr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created` int NOT NULL DEFAULT '0',
  `updated` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `IDX_temp_user_email` (`email`),
  KEY `IDX_temp_user_org_id` (`org_id`),
  KEY `IDX_temp_user_code` (`code`),
  KEY `IDX_temp_user_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temp_user`
--

LOCK TABLES `temp_user` WRITE;
/*!40000 ALTER TABLE `temp_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `temp_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_data`
--

DROP TABLE IF EXISTS `test_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test_data` (
  `id` int NOT NULL AUTO_INCREMENT,
  `metric1` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metric2` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value_big_int` bigint DEFAULT NULL,
  `value_double` double DEFAULT NULL,
  `value_float` float DEFAULT NULL,
  `value_int` int DEFAULT NULL,
  `time_epoch` bigint NOT NULL,
  `time_date_time` datetime NOT NULL,
  `time_time_stamp` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_data`
--

LOCK TABLES `test_data` WRITE;
/*!40000 ALTER TABLE `test_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `test_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `version` int NOT NULL,
  `login` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salt` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rands` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `org_id` bigint NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `email_verified` tinyint(1) DEFAULT NULL,
  `theme` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `help_flags1` bigint NOT NULL DEFAULT '0',
  `last_seen_at` datetime DEFAULT NULL,
  `is_disabled` tinyint(1) NOT NULL DEFAULT '0',
  `is_service_account` tinyint(1) DEFAULT '0',
  `uid` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_user_login` (`login`),
  UNIQUE KEY `UQE_user_email` (`email`),
  UNIQUE KEY `UQE_user_uid` (`uid`),
  KEY `IDX_user_login_email` (`login`,`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,0,'admin','admin@localhost','','a59a37d8f3a16d4c80a38b40fbc932f00ad786bd45eda57b314ee0b3f47ee535c3755e665ab0f89d77dcd4533025acc0c374','8nCMxJuYD2','a0MZdWgHh7','',1,1,0,'','2025-01-09 07:34:55','2025-01-09 07:34:55',0,'2015-01-09 07:34:55',0,0,'fe9few1lwzpj4d');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_auth`
--

DROP TABLE IF EXISTS `user_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_auth` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `auth_module` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `auth_id` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created` datetime NOT NULL,
  `o_auth_access_token` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `o_auth_refresh_token` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `o_auth_token_type` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `o_auth_expiry` datetime DEFAULT NULL,
  `o_auth_id_token` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `IDX_user_auth_auth_module_auth_id` (`auth_module`,`auth_id`),
  KEY `IDX_user_auth_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_auth`
--

LOCK TABLES `user_auth` WRITE;
/*!40000 ALTER TABLE `user_auth` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_auth_token`
--

DROP TABLE IF EXISTS `user_auth_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_auth_token` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `auth_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `prev_auth_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `auth_token_seen` tinyint(1) NOT NULL,
  `seen_at` int DEFAULT NULL,
  `rotated_at` int NOT NULL,
  `created_at` int NOT NULL,
  `updated_at` int NOT NULL,
  `revoked_at` int DEFAULT NULL,
  `external_session_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_user_auth_token_auth_token` (`auth_token`),
  UNIQUE KEY `UQE_user_auth_token_prev_auth_token` (`prev_auth_token`),
  KEY `IDX_user_auth_token_user_id` (`user_id`),
  KEY `IDX_user_auth_token_revoked_at` (`revoked_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_auth_token`
--

LOCK TABLES `user_auth_token` WRITE;
/*!40000 ALTER TABLE `user_auth_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_auth_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_dashboard_views`
--

DROP TABLE IF EXISTS `user_dashboard_views`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_dashboard_views` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `dashboard_id` bigint NOT NULL,
  `viewed` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_user_dashboard_views_user_id_dashboard_id` (`user_id`,`dashboard_id`),
  KEY `IDX_user_dashboard_views_user_id` (`user_id`),
  KEY `IDX_user_dashboard_views_dashboard_id` (`dashboard_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_dashboard_views`
--

LOCK TABLES `user_dashboard_views` WRITE;
/*!40000 ALTER TABLE `user_dashboard_views` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_dashboard_views` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_external_session`
--

DROP TABLE IF EXISTS `user_external_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_external_session` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_auth_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `auth_module` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `id_token` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `refresh_token` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `session_id` varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `session_id_hash` char(44) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_id` varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `name_id_hash` char(44) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_external_session`
--

LOCK TABLES `user_external_session` WRITE;
/*!40000 ALTER TABLE `user_external_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_external_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `org_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `role_id` bigint NOT NULL,
  `created` datetime NOT NULL,
  `group_mapping_uid` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_user_role_org_id_user_id_role_id_group_mapping_uid` (`org_id`,`user_id`,`role_id`,`group_mapping_uid`),
  KEY `IDX_user_role_org_id` (`org_id`),
  KEY `IDX_user_role_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_stats`
--

DROP TABLE IF EXISTS `user_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_stats` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `billing_role` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_user_stats_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_stats`
--

LOCK TABLES `user_stats` WRITE;
/*!40000 ALTER TABLE `user_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weather_data`
--

DROP TABLE IF EXISTS `weather_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `weather_data` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `feels_like` double NOT NULL,
  `ground_level` int NOT NULL,
  `humidity` int NOT NULL,
  `location_name` varchar(255) DEFAULT NULL,
  `main_weather` varchar(255) DEFAULT NULL,
  `pressure` int NOT NULL,
  `sea_level` int NOT NULL,
  `temp_max` double NOT NULL,
  `temp_min` double NOT NULL,
  `temperature` double NOT NULL,
  `timestamp` bigint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weather_data`
--

LOCK TABLES `weather_data` WRITE;
/*!40000 ALTER TABLE `weather_data` DISABLE KEYS */;
INSERT INTO `weather_data` VALUES (1,'scattered clouds',35.01,1010,70,'Colombo','Clouds',1012,1012,29.99,29.99,29.99,1736316572521),(2,'clear sky',24.64,1011,84,'Colombo','Clear',1012,1012,23.99,23.99,23.99,1736388272474),(3,'clear sky',24.93,1011,84,'Colombo','Clear',1012,1012,24.26,24.26,24.26,1736389834387),(4,'overcast clouds',26.39,1014,72,'Jaffna','Clouds',1014,1014,25.87,25.87,25.87,1736389834786),(5,'overcast clouds',-11.72,1009,51,'New York','Clouds',1011,1011,-3.91,-6.02,-4.72,1736389835198),(6,'few clouds',8.3,1006,30,'Tokyo','Clouds',1008,1008,11.79,9.19,10.42,1736389835604),(7,'smoke',22.67,1011,49,'Konkan Division','Smoke',1013,1013,23.03,21.98,23.03,1736389836015),(8,'snow',-1.81,994,92,'Mitte','Snow',1000,1000,1.57,0.01,0.79,1736389836334),(9,'clear sky',25.63,1012,80,'Colombo','Clear',1013,1013,24.99,24.99,24.99,1736391343324),(10,'overcast clouds',26.39,1014,72,'Jaffna','Clouds',1014,1014,25.87,25.87,25.87,1736391343823),(11,'overcast clouds',-11.71,1009,51,'New York','Clouds',1010,1010,-3.89,-6.11,-4.71,1736391344233),(12,'few clouds',8.71,1005,31,'Tokyo','Clouds',1007,1007,12.11,9.75,10.77,1736391344541),(13,'smoke',22.67,1012,49,'Konkan Division','Smoke',1014,1014,23.03,22.98,23.03,1736391344951),(14,'snow',-2.23,994,93,'Mitte','Snow',1000,1000,1.66,0.01,0.73,1736391345256),(15,'clear sky',25.63,1012,80,'Colombo','Clear',1013,1013,24.99,24.99,24.99,1736391421562),(16,'overcast clouds',26.39,1014,72,'Jaffna','Clouds',1014,1014,25.87,25.87,25.87,1736391421957),(17,'overcast clouds',-11.71,1009,51,'New York','Clouds',1010,1010,-3.89,-6.11,-4.71,1736391422243),(18,'few clouds',8.71,1005,31,'Tokyo','Clouds',1007,1007,12.11,9.75,10.77,1736391422533),(19,'smoke',22.67,1012,49,'Konkan Division','Smoke',1014,1014,23.03,22.98,23.03,1736391422813),(20,'snow',-2.23,994,93,'Mitte','Snow',1000,1000,1.66,0.01,0.73,1736391423104);
/*!40000 ALTER TABLE `weather_data` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-09  8:30:51
