-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: 10.190.25.15    Database: lyf_test
-- ------------------------------------------------------
-- Server version	8.0.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `act_business_rule`
--

DROP TABLE IF EXISTS `act_business_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_business_rule` (
  `id` bigint NOT NULL,
  `bean_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'beanåç§°',
  `method` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'æ–¹æ³•å',
  `param` varchar(1000) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'å‚æ•°',
  `remark` text COLLATE utf8mb4_general_ci COMMENT 'å¤‡æ³¨',
  `create_by` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'åˆ›å»ºè€…',
  `create_time` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'æ›´æ–°è€…',
  `update_time` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_business_rule`
--

LOCK TABLES `act_business_rule` WRITE;
/*!40000 ALTER TABLE `act_business_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_business_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_business_status`
--

DROP TABLE IF EXISTS `act_business_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_business_status` (
  `id` bigint NOT NULL,
  `business_key` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ä¸šåŠ¡ID',
  `process_instance_id` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'æµç¨‹å®ä¾‹ID',
  `status` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'çŠ¶æ€',
  `table_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'è¡¨å',
  `suspended_reason` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'æŒ‚èµ·æµç¨‹åŸå› ',
  `create_by` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'åˆ›å»ºè€…',
  `create_time` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'æ›´æ–°è€…',
  `update_time` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_business_status`
--

LOCK TABLES `act_business_status` WRITE;
/*!40000 ALTER TABLE `act_business_status` DISABLE KEYS */;
INSERT INTO `act_business_status` VALUES (1820721460559679490,'1820702696808058882','1820721459888590850','finish','bs_leave',NULL,'admin','2024-08-06 15:19:58','admin','2024-08-06 15:20:06');
/*!40000 ALTER TABLE `act_business_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_category`
--

DROP TABLE IF EXISTS `act_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_category` (
  `id` bigint NOT NULL,
  `category_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'åˆ†ç±»åç§°',
  `category_code` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'åˆ†ç±»ç¼–ç ',
  `parent_id` bigint DEFAULT NULL COMMENT 'çˆ¶çº§id',
  `order_num` bigint DEFAULT NULL COMMENT 'æ’åº',
  `create_by` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_category`
--

LOCK TABLES `act_category` WRITE;
/*!40000 ALTER TABLE `act_category` DISABLE KEYS */;
INSERT INTO `act_category` VALUES (1820651814552813569,'å‘Šè­¦æµç¨‹','alarm',0,1,'admin','2024-08-06 10:43:13','admin','2024-08-06 10:43:13');
/*!40000 ALTER TABLE `act_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_evt_log`
--

DROP TABLE IF EXISTS `act_evt_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_evt_log` (
  `LOG_NR_` bigint NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_STAMP_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DATA_` longblob,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `IS_PROCESSED_` tinyint DEFAULT '0',
  PRIMARY KEY (`LOG_NR_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_evt_log`
--

LOCK TABLES `act_evt_log` WRITE;
/*!40000 ALTER TABLE `act_evt_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_evt_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_gateway_condition`
--

DROP TABLE IF EXISTS `act_gateway_condition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_gateway_condition` (
  `id` bigint NOT NULL,
  `remark` varchar(300) DEFAULT NULL COMMENT 'å¤‡æ³¨',
  `condition_json` text COMMENT 'æ¡ä»¶',
  `process_definition_key` varchar(255) DEFAULT NULL COMMENT 'æµç¨‹å®šä¹‰key',
  `create_by` varchar(100) DEFAULT NULL COMMENT 'åˆ›å»ºè€…',
  `create_time` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(100) DEFAULT NULL COMMENT 'æ›´æ–°è€…',
  `update_time` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='ç½‘å…³æ¡ä»¶å¯¹è±¡';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_gateway_condition`
--

LOCK TABLES `act_gateway_condition` WRITE;
/*!40000 ALTER TABLE `act_gateway_condition` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_gateway_condition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_gateway_condition_relate`
--

DROP TABLE IF EXISTS `act_gateway_condition_relate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_gateway_condition_relate` (
  `id` bigint NOT NULL,
  `process_definition_id` varchar(255) DEFAULT NULL COMMENT 'æµç¨‹å®šä¹‰id',
  `sequence_id` varchar(255) DEFAULT NULL COMMENT 'è¿çº¿id',
  `gateway_condition_id` bigint DEFAULT NULL COMMENT 'ç½‘å…³æ¡ä»¶id',
  `create_by` varchar(100) DEFAULT NULL COMMENT 'åˆ›å»ºè€…',
  `create_time` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(100) DEFAULT NULL COMMENT 'æ›´æ–°è€…',
  `update_time` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='ç½‘å…³æ¡ä»¶å…³è”ç½‘å…³èŠ‚ç‚¹å¯¹è±¡';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_gateway_condition_relate`
--

LOCK TABLES `act_gateway_condition_relate` WRITE;
/*!40000 ALTER TABLE `act_gateway_condition_relate` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_gateway_condition_relate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ge_bytearray`
--

DROP TABLE IF EXISTS `act_ge_bytearray`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_ge_bytearray` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTES_` longblob,
  `GENERATED_` tinyint DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_BYTEARR_DEPL` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ge_bytearray`
--

LOCK TABLES `act_ge_bytearray` WRITE;
/*!40000 ALTER TABLE `act_ge_bytearray` DISABLE KEYS */;
INSERT INTO `act_ge_bytearray` VALUES ('1820662234730676227',1,'è¯·å‡æµç¨‹ï¼ˆæ™®é€šæµç¨‹ï¼‰-leave1.bpmn20.xml','1820662234730676226',_binary '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:bioc=\"http://bpmn.io/schema/bpmn/biocolor/1.0\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:di=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"leave1\" name=\"è¯·å‡æµç¨‹ï¼ˆæ™®é€šæµç¨‹ï¼‰\">\n    <startEvent id=\"startNode1\" name=\"å¼€å§‹\">\n      <outgoing>Flow_1f4xioj</outgoing>\n    </startEvent>\n    <userTask id=\"Activity_14633hx\" name=\"ç”³è¯·äºº\" flowable:formKey=\"static:1\">\n      <incoming>Flow_1f4xioj</incoming>\n      <outgoing>Flow_0cy98fl</outgoing>\n    </userTask>\n    <sequenceFlow id=\"Flow_1f4xioj\" sourceRef=\"startNode1\" targetRef=\"Activity_14633hx\" />\n    <userTask id=\"Activity_0lym9dc\" name=\"ç»„é•¿\" flowable:candidateUsers=\"1,3\">\n      <extensionElements />\n      <incoming>Flow_0cy98fl</incoming>\n      <outgoing>Flow_1o16t5v</outgoing>\n    </userTask>\n    <sequenceFlow id=\"Flow_0cy98fl\" sourceRef=\"Activity_14633hx\" targetRef=\"Activity_0lym9dc\" />\n    <userTask id=\"Activity_1j25s1c\" name=\"éƒ¨é—¨é¢†å¯¼\" flowable:assignee=\"1\">\n      <extensionElements />\n      <incoming>Flow_1o16t5v</incoming>\n      <outgoing>Flow_0s1t2f2</outgoing>\n    </userTask>\n    <sequenceFlow id=\"Flow_1o16t5v\" sourceRef=\"Activity_0lym9dc\" targetRef=\"Activity_1j25s1c\" />\n    <endEvent id=\"Event_1jib7oq\">\n      <incoming>Flow_0s1t2f2</incoming>\n    </endEvent>\n    <sequenceFlow id=\"Flow_0s1t2f2\" sourceRef=\"Activity_1j25s1c\" targetRef=\"Event_1jib7oq\" />\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_flow\">\n    <bpmndi:BPMNPlane id=\"BPMNPlane_flow\" bpmnElement=\"leave1\">\n      <bpmndi:BPMNShape id=\"BPMNShape_startNode1\" bpmnElement=\"startNode1\" bioc:stroke=\"\">\n        <omgdc:Bounds x=\"240\" y=\"200\" width=\"30\" height=\"30\" />\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds x=\"242\" y=\"237\" width=\"23\" height=\"14\" />\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_14633hx_di\" bpmnElement=\"Activity_14633hx\">\n        <omgdc:Bounds x=\"320\" y=\"175\" width=\"100\" height=\"80\" />\n        <bpmndi:BPMNLabel />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_0lym9dc_di\" bpmnElement=\"Activity_0lym9dc\">\n        <omgdc:Bounds x=\"470\" y=\"175\" width=\"100\" height=\"80\" />\n        <bpmndi:BPMNLabel />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_1j25s1c_di\" bpmnElement=\"Activity_1j25s1c\">\n        <omgdc:Bounds x=\"620\" y=\"175\" width=\"100\" height=\"80\" />\n        <bpmndi:BPMNLabel />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Event_1jib7oq_di\" bpmnElement=\"Event_1jib7oq\">\n        <omgdc:Bounds x=\"772\" y=\"197\" width=\"36\" height=\"36\" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge id=\"Flow_1f4xioj_di\" bpmnElement=\"Flow_1f4xioj\">\n        <di:waypoint x=\"270\" y=\"215\" />\n        <di:waypoint x=\"320\" y=\"215\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_0cy98fl_di\" bpmnElement=\"Flow_0cy98fl\">\n        <di:waypoint x=\"420\" y=\"215\" />\n        <di:waypoint x=\"470\" y=\"215\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_1o16t5v_di\" bpmnElement=\"Flow_1o16t5v\">\n        <di:waypoint x=\"570\" y=\"215\" />\n        <di:waypoint x=\"620\" y=\"215\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_0s1t2f2_di\" bpmnElement=\"Flow_0s1t2f2\">\n        <di:waypoint x=\"720\" y=\"215\" />\n        <di:waypoint x=\"772\" y=\"215\" />\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('1820662237045932033',1,'è¯·å‡æµç¨‹ï¼ˆæ™®é€šæµç¨‹ï¼‰-leave1.leave1.png','1820662234730676226',_binary '‰PNG\r\n\Z\n\0\0\0\rIHDR\0\02\0\0	\0\0\0Oj\0\0\Z£IDATx^\í\İ	e¹7\ğ{¯\å\'V¹€{\âŠz\Ë}W\ÜQRT\\H&„J$H\ÂeS7(\áV	^µ¼\Ê--\Æ-P\öÜ!È¾C$²Jˆ,ı\õ\Ó7=u¦g“\ô\Ì\Ûo~¿ª\Í\Ì9}º;3Oú<oo\ç_ş\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0€P\Åÿ¹\ñ\Æşù\çÿsÁ‚\Ågœ!\ãœ\ò\÷şÄ¢E‹\î\\¸p\áÍ¿OW©«‰º’6’c]\ĞQeS\ğ‡\òM©X¾|y±jÕªb\õ\ê\Õ2Î‰\ß{üş\Ï>û\ìû\ËFaû\æß¨‹\Ô\Õ\ÄG]IÉ±®\0\è¨Ø³oJ\Í7+ÿ,[¶lE\Ù\\\Ğüu‘ºJ\'\êJ\ÚHNu@G\Å\é\öl¦‘ø;”Á#Í¿Q©«t¢®¤\äTW\0tTœ\ó\Ü|ƒ’‰Kü=š£.RWiE]IÉ¥®\0\è¨~ƒ‡\î[V\Üx\á1\Å\Ò3ÿo•ø>kN\'\ë—\\\Zu•VÔ•ºj#¹\Ô\0\ÕOc\ğ\à½wWvPqù_¾6,\ñX<×œ^Æ\\\Zu•VÔ•ºj#¹\Ô\0\ÕOcp\Û\ÒG4un_zÒˆ\ée\ìÉ¥1PWiE]©«6’K]\ĞQı4;\ë°\rAx®9½Œ=¹4\ê*­¨+u\ÕFr©+\0:ªŸ\Æ\à\Ê3\ÑÔ‰\çš\Ó\ËØ“Kc ®ÒŠºRWm$—º £4i%—\Æ@]¥u¥®\ÚH.u@G\õ\Ó\Ä]š\rAx®9½Œ=¹4\ê*­¨+u\ÕFr©+\0:ªŸ\Æ\àºÿùÉˆ† N<×œ^Æ\\\Zu•VÔ•ºj#¹\Ô\0\ÕOc°\ò¿WşMA<\Ï5§—±\'—\Æ@]¥u¥®\ÚH.u@G\õ\ÓDnº\è¸A<ÖœN\Ö/¹4\ê*­¨+u\ÕFr©+\0:ª¯\Æ\à‘GŠ\ëÿtDc\Ås#¦—1\'—\Æ@]¥u¥®\ÚH.u@G=YcŸ„}\íÿ1¢)¨\Ïù´\ì\r—\\\Zu•VÔ•ºj#¹\Ô\0µ\Ö\Æ\à‘GŠe\×-,®8\õ[#šfbš˜\Ö\Ş\Î\õO.ºJ+\êJ]µ‘\\\ê\n€\Z­1x²½šk‹½\ëŸ\\\Zu•V\Ô\ÕÈ¨«\õO.u@G\Ö\ô³Wsm‰\×6\ç\'ı\'—\Æ@]¥u5z\Ô\Õú%—º £Fkšo\öO5\ÍùIÿÉ¥1PWiE]­=\ÍùIÿÉ¥®\0\è¨\Ñ\Z™¸\ä\Ò¨«´¢®¤\äRWc5mÚ´M§L™²\ãÀÀÀ•_”¹©\Ì\ÃeŠ5_\ã\çk\ß1¦o\Î€\õ 1H+¹4\ê*­¨+i#¹\Ô\ÕS5u\ê\ÔmËÉ¼2«\×ZúML?/^ßœ\'\0c 1H+¹4\ê*­¨+i#¹\ÔU¿\Ê\ÈV\å@d\É(”±dIÌ¯¹\0AZÉ¥1PWiE]IÉ¥®Ì´i\Ó68²|<\Ñ\ì»\ï¾Åœ9sŠ‹/¾¸¸\á†Š•+W!¾\Æ\Ï\ñx<\Ó5_\ó‹ù\Æü›\ËRnSş\íü\ó\Ïÿüq\Çwú!‡²\â\ë_ÿúªY³fU¤™3g>ºÿşû?P>vı\ìÙ³ÿsú\ô\é[4_Ÿ3AZÉ¥1PWiE]IÉ¥®Ö¥\ì¶˜:u\ê\å½ÁÁÁ\âè£.n¿ı\öj\ĞÒ¯˜>^¯oh.‹\å4—\rl\ä\Ê\í\Æ&§z\êt\ĞAÿœ1cFq\ÔQGK–,u¯I<\Ï\ïºë®\ïµ\×^7\î¶\Ûn\Û5\ç—#AZÉ¥1PWiE]IÉ¥®Ö¦Àü{™;z‡vXq\Ûm·\r¡<E\ñú˜Oc0s[,¯¹ÀFª˜ü\Ç\ìÙ³W\Å\á\Ü\ó\Ï?¿xü\ñÇ›Û’Q\Åt1ı\Ş{\ïı\è{\ìq\ÉÀÀÀ«›\óÎ‰\Æ ­\ä\Ò¨«´¢®¤\äRW£Ys$fhGQN<\ñ\ÄfË°^b~£3·92¹r\Ûğ¯§vÚœ\İwß½8ùä“‹\Ç{¬¹\í\èK¼.^?mÚ´‡r¾Ãˆ\Æ ­\ä\Ò¨«´¢®¤\äRWMq\ÍJ\ï\édÓ§O/.½\ô\Òf›°A\Ä|cş=ƒ™\Ë\\3©r›\ğ¯\ó\æ\Íû³f\Í*®¾ú\ê\æ\öbLb>3f\Ìxxppp\×\æ\òr 1H+¹4\ê*­¨+i#¹\ÔUÓšû‡Ä´5ˆ©\Åü{\Ì\Ä\ò›\ël\âH\ÌÌ™3‹\åË—7·\ë%\æ7}ú\ô\'O¼Ms™]§1H+¹4\ê*­¨+i#¹\ÔU¯5·X~¼Tœt\ÒIÍ– ±œ£2»53ld/^ü1ˆ\ÙPGbš\Êù>±\Ë.»\Ü;iÒ¤-›\Ë\î2AZÉ¥1PWiE]IÉ¥®zM\éùœ˜¸ <5n\0°¤¹n@¦\Êÿÿ›zè¡«âš–6ÍŸ?ÿ\ŞÁÁÁS›\Ë\ï2AZÉ¥1PWiE]IÉ¥®jq\ÖE\ï)e\ë{w²§*–\×{ŠYg\0£8\å”S»“\õ\Âş~\ÅügÌ˜qO¹qÙº¹]¥1H+¹4\ê*­¨+i#¹\ÔU­<Ì«\ñy/!–\ÛsTf^sÌ”ÿ\ïÿ\íÀüg\Ü2y<œw\Şy\÷•—s›\ë\ÑU\Zƒ´’Kc ®ÒŠº’6’K]…ÁÁÁ\Í\Ê\÷\ö\Õ\õ b¼\Æ\Ôb¹=™Õ±^\Íu2²x\ñ\â\Ï\í¶\Ûn}N\ÌúŠ\å\ì´\ÓN\÷Mš4i\óæº¤¤\Ü\0U\æ#\ÍÇ›4i%\õ\Æ@]u3\êJ\ÚH\êuUë§¾\Ê\çw¬q†\ÇDŠ\å\÷fvl®+‘c=\öŒ£:ª¹h\Õ!‡r\åÀÀÀ¬æº¤¤g#¸\Î\r¸\Æ ­¤\Ş¨«nF]II½®jı\ÔWùø\õt¿ş\õ¯›oû\ã*–ß³\ÎG4\×\È\È\ìÙ³\ï¯\Ó\Êjgy\æ\Ò)‰Ÿ»Ú³\\\ç\\cVRo\ÔU7£®¤¤^Wµ~\êk\êÔ©\ë\ç/º\è¢\æ\Ûş¸Š\å\×\ë\ëÕ»@f8\à€U7\Şxcs;Ğªk®¹\æ\ærsas]R2Ê†{\Ô\r¸\Æ ­¤\ŞŒRO\êªQW\ÒFR¯«\Ú(u5¢¾Ê¯·ÖwO\Ñ\Ë\ïY\Ç[ÿ \'3g\Î|\â\ïÿ{s;Ğª•+W>Xn\\\îh®KJF\Ù`7SmÀSn\Î9\çœ\â\ñø\Úr\É%—\÷\ßÿˆÇ›‰‹)¯½\ö\Ú§\ÔƒQê¨™\ä\ëª\Î\å—_^<ø\àƒ\Õ\÷«V­\ZzüÿøÇˆi\ïº\ë®\âoûÛ°\Ç\î¼\ó\Îa¯K9\êjıur\å•WıÛ¥ºNy\ä‘a\Óş\õ¯-\î½\÷\Ş\óˆ<ü\ğ\Ã\Ã~mQ\ÔVsºÈ²eËŠ\Ûo¿}¯¯s\ÅWŒxl<’z]\ÕF©§f¢¾şQÿ<\Ş=ES,¿^—©S§>\Ğü\÷\0\Ùyç‹G}´¹hU¹¼F\Ùv2\ÕŒ–\æ›\ôV[mUü\æ7¿©¾è¡‡†=\÷³Ÿı¬øÁ~0\ì±<°º|¿bÅŠ\ó¯sú\é§O{\ÚÓŠ%K–Œxn¢\Óüût5)\Õ\Õ\Ú\ò\éOºø\Æ7¾Q\rF\Ş\ñwqÓÈ»\Ş\õ®\â‡?ü\á°i¯º\êª\â\Ù\Ï~\öPc\Í\ë\Ç>\ö±¸ûˆù¦˜\æß§«™¨ºŠm\Ó;\ßù\Îj\Û;Kbyü<}ú\ôª:\è jº¨‹Ø®¼\ò•¯,.¼\ğ\Âb¿ı\öª«vÚ©x\Ï{\Ş3l\ç\Ì\á‡^¼ÿı\ï/®¿şú\">Ğ¹6\ò\ö·¿½ø\Ìg>3l=fÍšUL›6m\Øt“&M*^\÷º\×MÈ ºù\÷\É%\ã\İS4\Å\ò{\Ö\ç±f\ßdd\÷\İwt¼\÷\Üs\Ï=\×O\é\î™³¦$zªF\ì!ÿĞ‡>4\ôı’—¼¤øü\ç?_}\ßl\ZË¿A\ñŒg<£ˆë£¾ü\å/5 \Ñ\\\Ät\Ïy\ÎsŠc=v\Ä2\"ù\Ë_b/bµ7´ù\ÜD\'\õ=œ£\ÔS\òu5Zb@\òš×¼¦¸øâ‹«=\í/xÁ†‹\Æ\ğ¤“N\Z6}Á{\Ù\Ë^6\ô\óW¾\ò•ª)½\õ\Ö[G\Ì;Å¨«±%-û\ï¿µ}y\ã\ßX\r.\Ş\ö¶·{\ï½w\ñú×¿¾š&v¸\Äv(¾ÿ\ÃşP\rn&O\\\ÕPU©ú-\\¸°ø\à?8lş\ï~\÷»«L<5ƒ‘W¿ú\Õ\ÕQšæH\Ìû˜c\ö\Ø)§œR\rÊ›ÓGR¯«\Ú(u5¢¾\â\ÈGıøx\÷M\ÈÀFd¿ı\ö{`¼\Ïg½êª«.šÒ½kd†5µ\ñnÖ•¥K—¯}\ík‡~A\Í\\P}ÿ½\ï}¯ø\ö·¿=lú?ÿù\Ï\Õ\×\ïÿû\Õ|b¢ÑˆA\Ï>\ğµ–À\óŸÿüj\ïj\ó¹‰N\êA\ëj´|\õ«_-şø\Ç?VM\ê¾\ğ…\âE/z\Ñ\ĞsO6ù\Ú×¾V½fm§¥u5\ö\Ä`5&qTxŞ¼y\Õ \æ–[n©2\ñ\õŸø\ÄĞ´úÓŸŠm·\İv\Ô\Óc°Û´ú\ç\ó\Î;¯š\ö¦›nªvÚ”\rkU{›o¾yµ={\Ã\ŞPœ}\ö\Ù\Ã\æ;ib\ñ|\í¶Û®ø\ä\'?Yü\ô§?±Ì¶“z]\Õú©¯)®‘&Â·¾\õ­k\Çû®e\Çü‰Sºs×²\ì^\Ñ¬-\Ñ,>\÷¹\Ïzƒ~\ñ‹_\\\ì°\Ã\Õ\÷q´%N‹\é\âHK\ì!A\ÏÁ\\5\0\Ñh\Ô™˜ş\Ío~s5Ms‘\ï~\÷»\Ã\æ—RRoºXW\Í\Ä\àx“M6©\ZĞ—¿ü\å\Åw\ÜQÁ«¾\êU¯\Zu \õ§²ş\èG?\Z\ö\\Ê¨«\õ\Ë¿ø\Å\"n\ó¿ë®»V_£ÑŒ\ÌGQ©§;\á„†\rlz\Ó;‰S\Ğb\ğG\ö~ş\óŸ?ş\ñ«\íY¬¿ù\Ío¿ø\Å/ªmY³¶¢>\ã¹\ŞÇ®¹\æš\â\Üs\Ï->ü\áXf\ÛI½®jıÔ—»–\âCù\Ï\ñş™=\÷\Ü\ó\ä|\ÌZ7Ø½&ª1-7\Üp\Ã:\È\Ô8\Òr\÷\İw\Ï{\Ş\óª\ï;\î¸jOfİˆn³\Í6\Å\ìÙ³GÌ¿\Î\ç>\÷¹\êù¸.¢ù\ÜD\'\õÆ ‹u\ÕL4‘\ÑpFs\Z§\Åck;\"_£¦¢¡x\æ3ŸY5©½\×\'Ä 9£;\Í\å¤u5¶\Ä\rG¾\ô¥/oy\Ë[Šü\ãUD-\Ä\İ¾\ğ…\ÕE\öQ/\õ\ô\'xb_™8*G„—/_^m\Ç\â\ô³Ÿü\ä\'\Õ@&j*¶i£\rdbšPÇšH\\\ëWşZªu\Ùl³ÍªSÙš\Ëm3©\×U­Ÿúš\âsd€‰Pn\ô·˜1c\Æ\ã¥æ¶ \år\î*7,\÷”o^›7×¥‹Æ»1XWb¯\÷º2½§–Å©\ÑL\Ä\÷\Ç|±\å–[É‰£-1}sş\õ\ë\âzˆ¸7N?K\é\ß\éJc\ğdRû½6{À£1†qÁ‚\Õ™º~\âB\íz \×)Äµ½§–\í±\ÇÕ©š\óL9\êj\ì™3gN\ñ©O}ª\Z¸Æ©]q\Ê\×u\×]7tL<§œ\Å\÷Q7ıd¢®\â†%Qo\ï}\ï{«A\ÉÀÀ@5‰¯±M\ë\ÈDı\í¾û\îÕ²>û\Ù\Ï\r¤c\ÚM7İ´:Rø\ô§?}\ÄÑš¶“K]…\ò}}\Çz\ğ°\ï¾û6\ßú\Ç\Õ>û\ì\óD\Ï@f\Ç\æº™\Ùk¯½n\Z¯\Ó\Ë\æÎû\ër\Ãrnsºj\"\Zƒµ%no»®S\Ë8\à€¡i\ë\Ìe—]V\ì²\Ë.\Õyı\\b\Ö6‰\ó\È\ã\â\Úø>\ö\ÆG\Ñ\Ï-›\Ç+¹4)\ÕU3q*Y\ìÁ&0\Z\ĞØ«¾¶#2uz2Q§qÁw\Üiª9\ïT£®Æ3\Ï<³:Š\ß\Ç\İ\ë\Ş\÷¾\÷U5´\Å[T_c`û\ï|§z¾\ß#2‘¸³bä¬³\Î*>\ò‘TwÊ‹L\Ü< v\à\Ä@¦·\ÆbY1\0ŠO\Ü%‹º¬T‘\\\ê*nV¾·¯®q3˜‰\Ë\íÄ¬\õj®+™\İv\Ûm»½\÷\Şû\Ñ\Ç{¬¹MØ \Êù\ßVnX®›<y\ò\Ö\Íuèª‰hÖ–h{\ïL\Ö{D&.¢\í½8?.¼\ë¢©ø\ío\Û\×™8¯=\ö¶\×M@dë­·®š”T.\ÜÎ¥1H©®š‰;C\ÅúÅ­—\ã\ôÂ£>z\Ä@&8+W®z¬w {\ã\ãfqv\ÙY\ÛM%RŠº\Z{\âˆ]l7\ê# 1ˆAÅ³\õ¬j\0G\ó\âoLûT2‹/®\îÊ¸ı\ö\ÛWGı\æÎ[]/·ùÓ¥\ã&&£\ÕÖ¡‡:t[f™\r«|ŸW\"b»0b¹=™¤¯\Å6 =\÷\Ü\ó’“O>ù‰\æFaz\â\ğ\Ã?¦Ü°œ\Ü\\v—MDc\Ğo\âMmŸ\õwŠF\"\Ä\Åi\õ™h(â´€hz§;¢\Å\0§ù\ï\â¯xEuw\ó5‘\\\Zƒ\æ\ï9¥ÌŸ?¿º¶ \î>\õ\Ë_ş²jP\ã:—út¨…—¾\ô¥\Õİ \ê[\à^z\é¥\Õ5q›\Ûø¸+ş1¸‰u|Hs9)E]=q1\ÜP$¾#21˜‰L \î»\ï¾ahÛ¢8e±\÷\õq\ô8\Ú\Ä\0ù£ı\è°\ç~\÷»\ßUGo¾ù\æjP·g\å\Å@:¶Kq3\æú\Ä™8²\×\îD\ŞúÖ·˜f¼’K]\Õ&O¼M=ˆˆ\Ï$\ï£2±¼²Ö†N+‹\õi®#©\òMb\Ë\éÓ§?x\õ\ÕW7·\r\Ä9\çœsl¹aY\Ëi.»\Ë&¢1\è7\ÑD\Ù|¼NÜ­\'¾\Æ)bq§Ÿøş\È#,\Ş\ô¦7U\rG=]ü£‘ˆ\æ³9HŠ\âM+\ö˜6Ÿ\ï\ä\Ò¤\\W‘E‹U_£\É\ì\çé¨§ø‘f\ÄE\ÚÑŒ\ö™)E]=qc‘úy\ëŒL\\7Óœ\ö\÷¿ÿ}u-K\ó\ñ\ØawU¬o.Ñ›z@Û¨\Ø\áR?§\Í\Æ\æ\æ\ôubû\óüÕ¯~5\â¹\ñJ.uÕ«|Ÿ_R$;\ì°f+ĞªX^\ÏÑ˜%\Íu27u\ê\Ôm\Ë7„‡\ãN0\Ò\Í7\ß|R¹Q¹3Ç½#\Ñ\ô›~?©º\ßéº\\\Zƒ”\ëj¬‰»5\ëJ\ÔÕ†MlsF«‡um‹F›~}\Ó\Æ<ŸJr©«^e±Uù~ÿx= ˆ\ë\å\ÆC,§g\óx¬Gsİ€À\à\à\à®Ó§O`C™Ys$\æ2_j.+©4\ò¿É¥1PWiE]IÉ¥®š¬q´>\ÎhSÌ¿\÷”²X~s€H9\Ùy\ç\ï?ş½c½@\\Ø¿æš˜»r<S\Ó¤•\\\Zu•VÔ•´‘\\\êªiÚ´i›”\ïı—\Õ‹8Å¯­ÁLÌ·\\\Ş\Ğ Xn,¿¹NÀFf``\àÕƒƒƒ§Í˜1\ã\ó\Î;\ï¾~?g¦œnùÜ¹s\ç”“\ëÊœ\ói\Î;\'\Zƒ´’Kc ®ÒŠº’6’K]¦|ÿß¢LÜ©t\è\ÈLÜ•nCŠù\õ‰Y³¼-š\ël\Ä\âV\É\å†a\ÑN;\ítÿÁ|Å‚®¼\æškn]±b\ÅC\åv\äÁ»\ï¾ûÆ¥K—^t\Â	\'\Ì\ßk¯½N)§]\Ó\çt‹\åu\Ñ¤•\\\Zu•VÔ•´‘\\\êjm\ÊAÆ¿\÷f\"qAşú\Ş\Í,^ß¸°¿\Z\Ä\Ä\òš\ë\0P™4i\Ò\æ\å†b\æÀÀÀ‰\å\×z6N\ñ\õ‚5ÏŒéš¯Í™\Æ ­\ä\Ò¨«´¢®¤\äRW\ë2\å\Ìf‰£3\ñy/q7º§\"¦\×5\ÂT§“\Årš\Ë\àIh\ÒJ.ºJ+\êJ\ÚH.u\õdâš•57\0h@ª\Ï-›3gNq\ñ\ÅW·ø\Ò\r\ñ5~\Ç\ãù}\ö\Ùg\Äkc~1_\×\Ä\0Œ‘\Æ ­\ä\Ò¨«´¢®¤\äRWıZsk\æ¡Ï™Y\Ï,q‹e€\õ¤1H+¹4\ê*­¨+i#¹\Ô\ÕSŸYWD\æ•Y=\Ê\0e]‰\é\ç\Å\ë›\ó`4i%—\Æ@]¥u%m$—º\Z«iÓ¦mZLvø¯\ò\ë‚27•yxÍ %¾\Æ\Ï\Ö<¿cLßœ\0\ëAcVri\ÔUZQW\ÒFr©+\0:JcVri\ÔUZQW\ÒFr©+\0:JcVri\ÔUZQW\ÒFr©+\0:JcVri\ÔUZQW\ÒFr©+\0:JcVri\ÔUZQW\ÒFr©+\0:JcVri\ÔUZQW\ÒFr©+\0:JcVri\ÔUZQW\ÒFr©+\0:JcVri\ÔUZQW\ÒFr©+\0:JcVri\ÔUZQW\ÒFr©+\0:JcVri\ÔUZQW\ÒFr©+\0:JcVri\ÔUZQW\ÒFr©+\0:JcVri\ÔUZQW\ÒFr©+\0:JcVri\ÔUZQW\ÒFr©+\0:JcVri\ÔUZQW\ÒFr©+\0:JcVri\ÔUZQW\ÒFr©+\0:JcVri\ÔUZQW\ÒFr©+\0:JcVri\ÔUZQW\ÒFr©+\0:jÁ‚O¬Zµj\Ä”ŒÊ¿Ãec\ğH\óo\ÔE\ê*¨+i#9\Õ\0µhÑ¢;—/_>\âMJ\Æ?·\Ür\ËÜ²1¸ ù7\ê\"u•NÔ•´‘œ\ê\n€Z¸p\ágŸ}\öıË–-[aO\çÄ¤ü½/»ù\æ›S6·–Ù¾ù7\ê\"u5\ñQW\ÒFr¬+\0:,ŞŒb\ÏZ™\ÕqÎ³Œ{\â\÷¿ÿ¬š‚ø\÷¬ùw©«‰‰º’6’e]\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÀF\ãÿœ0frhy\0\0\0\0IEND®B`‚',1),('1820663301493178370',1,'source',NULL,_binary '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:bioc=\"http://bpmn.io/schema/bpmn/biocolor/1.0\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:di=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"leave1\" name=\"è¯·å‡æµç¨‹ï¼ˆæ™®é€šæµç¨‹ï¼‰\">\n    <startEvent id=\"startNode1\" name=\"å¼€å§‹\">\n      <outgoing>Flow_1f4xioj</outgoing>\n    </startEvent>\n    <userTask id=\"Activity_14633hx\" name=\"ç”³è¯·äºº\" flowable:formKey=\"static:1\">\n      <incoming>Flow_1f4xioj</incoming>\n      <outgoing>Flow_0cy98fl</outgoing>\n    </userTask>\n    <sequenceFlow id=\"Flow_1f4xioj\" sourceRef=\"startNode1\" targetRef=\"Activity_14633hx\" />\n    <userTask id=\"Activity_0lym9dc\" name=\"ç»„é•¿\" flowable:candidateUsers=\"1,3\">\n      <extensionElements />\n      <incoming>Flow_0cy98fl</incoming>\n      <outgoing>Flow_1o16t5v</outgoing>\n    </userTask>\n    <sequenceFlow id=\"Flow_0cy98fl\" sourceRef=\"Activity_14633hx\" targetRef=\"Activity_0lym9dc\" />\n    <userTask id=\"Activity_1j25s1c\" name=\"éƒ¨é—¨é¢†å¯¼\" flowable:assignee=\"1\">\n      <extensionElements />\n      <incoming>Flow_1o16t5v</incoming>\n      <outgoing>Flow_0s1t2f2</outgoing>\n    </userTask>\n    <sequenceFlow id=\"Flow_1o16t5v\" sourceRef=\"Activity_0lym9dc\" targetRef=\"Activity_1j25s1c\" />\n    <endEvent id=\"Event_1jib7oq\">\n      <incoming>Flow_0s1t2f2</incoming>\n    </endEvent>\n    <sequenceFlow id=\"Flow_0s1t2f2\" sourceRef=\"Activity_1j25s1c\" targetRef=\"Event_1jib7oq\" />\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_flow\">\n    <bpmndi:BPMNPlane id=\"BPMNPlane_flow\" bpmnElement=\"leave1\">\n      <bpmndi:BPMNShape id=\"BPMNShape_startNode1\" bpmnElement=\"startNode1\" bioc:stroke=\"\">\n        <omgdc:Bounds x=\"240\" y=\"200\" width=\"30\" height=\"30\" />\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds x=\"242\" y=\"237\" width=\"23\" height=\"14\" />\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_14633hx_di\" bpmnElement=\"Activity_14633hx\">\n        <omgdc:Bounds x=\"320\" y=\"175\" width=\"100\" height=\"80\" />\n        <bpmndi:BPMNLabel />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_0lym9dc_di\" bpmnElement=\"Activity_0lym9dc\">\n        <omgdc:Bounds x=\"470\" y=\"175\" width=\"100\" height=\"80\" />\n        <bpmndi:BPMNLabel />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_1j25s1c_di\" bpmnElement=\"Activity_1j25s1c\">\n        <omgdc:Bounds x=\"620\" y=\"175\" width=\"100\" height=\"80\" />\n        <bpmndi:BPMNLabel />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Event_1jib7oq_di\" bpmnElement=\"Event_1jib7oq\">\n        <omgdc:Bounds x=\"772\" y=\"197\" width=\"36\" height=\"36\" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge id=\"Flow_1f4xioj_di\" bpmnElement=\"Flow_1f4xioj\">\n        <di:waypoint x=\"270\" y=\"215\" />\n        <di:waypoint x=\"320\" y=\"215\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_0cy98fl_di\" bpmnElement=\"Flow_0cy98fl\">\n        <di:waypoint x=\"420\" y=\"215\" />\n        <di:waypoint x=\"470\" y=\"215\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_1o16t5v_di\" bpmnElement=\"Flow_1o16t5v\">\n        <di:waypoint x=\"570\" y=\"215\" />\n        <di:waypoint x=\"620\" y=\"215\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_0s1t2f2_di\" bpmnElement=\"Flow_0s1t2f2\">\n        <di:waypoint x=\"720\" y=\"215\" />\n        <di:waypoint x=\"772\" y=\"215\" />\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',NULL),('1820663301593841666',1,'source-extra',NULL,'',NULL),('1820703255543877635',1,'è¯·å‡æµç¨‹ï¼ˆæ’ä»–ç½‘å…³ï¼‰-leave2.bpmn20.xml','1820703255543877634',_binary '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:bioc=\"http://bpmn.io/schema/bpmn/biocolor/1.0\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:di=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"leave2\" name=\"è¯·å‡æµç¨‹ï¼ˆæ’ä»–ç½‘å…³ï¼‰\">\n    <startEvent id=\"startNode1\" name=\"å¼€å§‹\">\n      <outgoing>Flow_0q78air</outgoing>\n    </startEvent>\n    <userTask id=\"Activity_19b1i4j\" name=\"ç”³è¯·äºº\" flowable:formKey=\"static:1\">\n      <incoming>Flow_0q78air</incoming>\n      <outgoing>Flow_129vtbe</outgoing>\n    </userTask>\n    <sequenceFlow id=\"Flow_0q78air\" sourceRef=\"startNode1\" targetRef=\"Activity_19b1i4j\" />\n    <userTask id=\"Activity_0r8rs5v\" name=\"ç»„é•¿\" default=\"Flow_1z12r58\" flowable:assignee=\"1\">\n      <extensionElements />\n      <incoming>Flow_129vtbe</incoming>\n      <outgoing>Flow_1z12r58</outgoing>\n      <outgoing>Flow_0bt4srq</outgoing>\n    </userTask>\n    <sequenceFlow id=\"Flow_129vtbe\" sourceRef=\"Activity_19b1i4j\" targetRef=\"Activity_0r8rs5v\" />\n    <userTask id=\"Activity_0iw78d3\" name=\"éƒ¨é—¨é¢†å¯¼\" flowable:candidateGroups=\"1,2,3,4\">\n      <incoming>Flow_1z12r58</incoming>\n      <outgoing>Flow_0nj4k00</outgoing>\n    </userTask>\n    <userTask id=\"Activity_1ex621m\" name=\"æ€»ç»ç†\" flowable:assignee=\"1\">\n      <extensionElements />\n      <incoming>Flow_0bt4srq</incoming>\n      <outgoing>Flow_0fo3v6j</outgoing>\n    </userTask>\n    <endEvent id=\"Event_1shlpsv\">\n      <incoming>Flow_0nj4k00</incoming>\n      <incoming>Flow_0fo3v6j</incoming>\n    </endEvent>\n    <sequenceFlow id=\"Flow_0nj4k00\" sourceRef=\"Activity_0iw78d3\" targetRef=\"Event_1shlpsv\" />\n    <sequenceFlow id=\"Flow_0fo3v6j\" sourceRef=\"Activity_1ex621m\" targetRef=\"Event_1shlpsv\" />\n    <sequenceFlow id=\"Flow_1z12r58\" sourceRef=\"Activity_0r8rs5v\" targetRef=\"Activity_0iw78d3\" />\n    <sequenceFlow id=\"Flow_0bt4srq\" sourceRef=\"Activity_0r8rs5v\" targetRef=\"Activity_1ex621m\">\n      <conditionExpression xsi:type=\"tFormalExpression\">${entity.leaveDays &gt; 2}</conditionExpression>\n    </sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_flow\">\n    <bpmndi:BPMNPlane id=\"BPMNPlane_flow\" bpmnElement=\"leave2\">\n      <bpmndi:BPMNShape id=\"BPMNShape_startNode1\" bpmnElement=\"startNode1\" bioc:stroke=\"\">\n        <omgdc:Bounds x=\"240\" y=\"200\" width=\"30\" height=\"30\" />\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds x=\"242\" y=\"237\" width=\"23\" height=\"14\" />\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_19b1i4j_di\" bpmnElement=\"Activity_19b1i4j\">\n        <omgdc:Bounds x=\"320\" y=\"175\" width=\"100\" height=\"80\" />\n        <bpmndi:BPMNLabel />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_0r8rs5v_di\" bpmnElement=\"Activity_0r8rs5v\">\n        <omgdc:Bounds x=\"470\" y=\"175\" width=\"100\" height=\"80\" />\n        <bpmndi:BPMNLabel />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_0iw78d3_di\" bpmnElement=\"Activity_0iw78d3\">\n        <omgdc:Bounds x=\"640\" y=\"100\" width=\"100\" height=\"80\" />\n        <bpmndi:BPMNLabel />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_1ex621m_di\" bpmnElement=\"Activity_1ex621m\">\n        <omgdc:Bounds x=\"640\" y=\"250\" width=\"100\" height=\"80\" />\n        <bpmndi:BPMNLabel />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Event_1shlpsv_di\" bpmnElement=\"Event_1shlpsv\">\n        <omgdc:Bounds x=\"802\" y=\"197\" width=\"36\" height=\"36\" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge id=\"Flow_0q78air_di\" bpmnElement=\"Flow_0q78air\">\n        <di:waypoint x=\"270\" y=\"215\" />\n        <di:waypoint x=\"320\" y=\"215\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_129vtbe_di\" bpmnElement=\"Flow_129vtbe\">\n        <di:waypoint x=\"420\" y=\"215\" />\n        <di:waypoint x=\"470\" y=\"215\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_0nj4k00_di\" bpmnElement=\"Flow_0nj4k00\">\n        <di:waypoint x=\"740\" y=\"140\" />\n        <di:waypoint x=\"771\" y=\"140\" />\n        <di:waypoint x=\"771\" y=\"215\" />\n        <di:waypoint x=\"802\" y=\"215\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_0fo3v6j_di\" bpmnElement=\"Flow_0fo3v6j\">\n        <di:waypoint x=\"740\" y=\"290\" />\n        <di:waypoint x=\"771\" y=\"290\" />\n        <di:waypoint x=\"771\" y=\"215\" />\n        <di:waypoint x=\"802\" y=\"215\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_1z12r58_di\" bpmnElement=\"Flow_1z12r58\">\n        <di:waypoint x=\"570\" y=\"215\" />\n        <di:waypoint x=\"605\" y=\"215\" />\n        <di:waypoint x=\"605\" y=\"140\" />\n        <di:waypoint x=\"640\" y=\"140\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_0bt4srq_di\" bpmnElement=\"Flow_0bt4srq\">\n        <di:waypoint x=\"570\" y=\"215\" />\n        <di:waypoint x=\"605\" y=\"215\" />\n        <di:waypoint x=\"605\" y=\"290\" />\n        <di:waypoint x=\"640\" y=\"290\" />\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('1820703257414537217',1,'è¯·å‡æµç¨‹ï¼ˆæ’ä»–ç½‘å…³ï¼‰-leave2.leave2.png','1820703255543877634',_binary '‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0P\0\0T\0\0\0*\İ\0\0*(IDATx^\í\İ”œu}7\ğ\öµ<¯XZÄ‚Zl½`Q,‚ŠQ@U« É’p1 ¹\nZE©P\ğm¹HE{j)(¤†[¹Jˆ@x¹(—„@H a	HP\àÿ>ÿ§™}gÿ³I†\ì\Îo“\Ï\çœ\ï\Ù\İg™g²\ó\Ë\ä\÷\Ës™\ßû=\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ú¥”şh\îÜ¹?9s\æo§OŸ~ş\óŸ\Ë§ú½¿2cÆŒ\Çz{{?W¾>\0\0@ \Õ\ğtaÕ¼§E‹¥eË–¥_|QF8ù\÷ÿ\×_ı3\Õ@\õ\é\ò5\0\0‚\È{r\ó^6\õ2\ò\é\ë\ë[\\\rP·–¯\0\0D>lÏ§É¯C5@-/_#\0\0 ˆ|N\Ù\ÈK\÷’_\ò5\0\0‚hw€z\î\é¾4\÷¶³\Ó\ìkÿ±Nş>/+×“\Îb€\0€À\Ú –.Y˜f]}Lº\ë\ò¯H^–o+×—¡\Ç\0\0\0µ3@=:ûÒ–á©‘³/kY_†\0\0\Ö\Î\0u\ßu\'¶N\ä\Û\Ê\õe\è1@\0@`\íP³~~l\Ë\à\ÔH¾­\\_†\0\0f€Š\0\0\Ö\Î\0•¯ºWN\ä\Û\Ê\õe\è1@\0@`\íPsnú^\Ë\à\ÔH¾­\\_†\0\0\Ö\Î\0\õ\ÔÂ»Ó¬k¾\İ2<\åeù¶r}zP\0\0X;T\ÎÃ·Ÿ\Û2@\åe\åz\ÒYP\0\0X[\Ô\ò\åi\Î\Íg¶PyY¾­e}rP\0\0\Ø\ê¨¥K¦n:½exj$ß–\×)\ï\'C‹\n\0\0[\é\0µ|y\ê›Ó›\î¹\êè–¡©L^\'¯koT\ç1@\0@`ƒ\rP«\Ûë´²\Ø\ÕyP\0\0\Ø`T;{V–|\ß\ò\ñ¤ı \0\0 °Á¨r(zµ)OÚ\n\0\0l€’\î\Å\0\0\0 b\Å\0\0\0 b\Å\0\0\0 b\Å\0\0\0 b\Å\0\0\0 b\Å\0\0\0 b\Å\0\0\0 b\Å\0\0\0 b\Å\0\0\0 b\Å\0\0\0 b\Å\0\0\0 b\Å\0\0\0 b\Å\0\0\0 b\Å\0\0\0]°\Ç{\\WeL¹¼d€Š\0\0tA5<¥Y\å e€Š\0\0tA\Ó\0µ\ÊA\Ê\0+(\0\0\è‚A¨A)T¬ \0\0 œ\ÊÔƒT·¨¥K—¦Y³f\õÿü\ì³Ï¦\çŸ¾ş~ù\ò\åÖ½û\î»Ó’%KZ#\ç…^\ğ\ó£>šü\ñ–\õrúúúÒ‚VyÿF\î¹ç–e#\0\0fº–n\rPyp\Ùf›m\Ò5\×\\“y\æ™4w\î\Üú\çI“&¥w\Ü1s\Ì1\õzy˜º\å–[\Ò[l‘n»\í¶t\ä‘G¦ı\÷ß¿Î{î™¶\İv\Ûzøj<\îI\'”>ü\á§|0M™2¥İœ\÷¿ÿı\é\ïş\î\ï<<0Mœ8qÀzcÇM\ï|\ç;Ó²e\ËZ\÷p§|}F:e­\0@×D£Z6\ÆM¹n.Â—‡¥£:ªT\Ş\ó\÷\ÔC\Í\Ö[o=\ô\Ğ\ô®w½«^g»\í¶K3gÎ¬¿¿\ğ\Â\ë¡jÜ¸q\é²\Ë.«\÷\"\å½Wù¶\Ş\Ş\Ş\ôÑ~tÀ\ãÿ\Í\ßüM=@\å\Û\òŞ¦<½ı\ío¯\÷J\r¶·)?\ö\ÙgŸ=`Ù•W^™>û\ÙÏ¶¬;\é\æ¨‘¨K\0\0x\ÕF¢Q]\İ\à\Ô0\ÒT\Î#<RD\Ï=\÷\\š6mZ=<ÍŸ?¿ \ò\×O}\êSı\ëş\ìg?K;\ï¼sÿ\á}\Í\ÉC\Ò;\ì\Ğÿ\ó7\ŞX¯û\ğ\Ã§M6\Ù$?¾Ş›´é¦›ÖƒÒ»\ßı\îtı\õ\×xŒÉ“\'×‘ood—]vIû·›\Î<\óÌ–mwP\0\0P‰FuuƒSC7¨œ½\ö\Ú+q\Æi¿ı\ö«¿\æCø\ò\0uú\é§\×{€\Z\ë]|\ñ\Åª\æ4PùP¿<\ôq\Ä\é\ßÿı\ß\Ói§–¶\Ür\Ëzo\×7¾\ñ\ô\Ãş°\ŞÛ•‡·\æ\Ç\È{\Â\òm\Í\Ë\î¿ÿş\ô‹_ü\"}\ìck\Ù\æp\Ç\0\0\0…‘hTW785Œ\ô\0u\Ã\r7¤}\÷\İ7½\ï}\ïKŸü\ä\'\ÓFmTzn¸az\ó›\ß\\_¼!\ï5j¬é¥—¶5@\å\Ã\ğ\òùT‹-Jo|\ã\ë\Ãü¾\÷½\ï\ÕTŞ«t\î¹\ç:@\åu6\Şx\ã´\ÕV[\Õy\Ík^“_›ú¹l°Á\õ!ƒ\åv‡3(\0\0(DjTGz€\Ê9\ï¼\ó\Òg>\ó™z\ïO>„.Z7gÎœşs \ò\ò|h_ş>Ÿ\÷\Ô\Î\0•\Ïo:ë¬³\êa\éCúP=\õ\ô\ô\ÔTşz\ÑE\r x\àtÀ\Ô\Ûúü\ç?\ß‰¼\î\Ş\ğ†´\÷\Ş{§?ü\Ã?l\Ù;5\Ü1@\0@!R£Ú\ê\Úk¯M»\îºkıı½\÷Ş›¶\ß~û´p\áÂ´\Ùf›\Õ_:\è \ô\ío»¾½\İ=P9‹/®s\İu×¥1cÆ¤SO=µ \òE)n½\õ\Öz€\ÊW\çk¬Ÿ·•¯<p\İu\×]\õ²<X5¹n\Ä\0\0\0…Hj7¨\éÓ§×—%o\ì\ñ\ÉLf^\÷º\×Õƒ\Ï\ë_ÿúú’\åy\İW3@\İ|\ó\Íi·\İvKŸş\ô§\ë+\ğM:µ>jı\õ×¯Ï³:ù\ä“\\\ò¼‘N8¡ÿ\ò\æ(\0\0&R£Ú*_$\"_!/Ÿ\÷@\å!*Pypyú\é§|n>\ô.Ÿ+\Õ|ÿ|E¾¼—*Ÿ+\õ‰O|bÀm\\pA}şÒ¼y\ó\êa(_\æ<o/¸ù\æ›\×©(ŸO¾€E¾\â^>7+\ç¯ÿú¯[\Ö© \0\0 ©Q\í\Æ\0\õ\ÄOÔ—0\Ï\ß7>¬6Pù¼¨rİŸş\ô§\õ¹J\å\ò¼‡)\ğnşœ¨\ò¶\Æ ”‡¬Ù³g\÷/¿\ó\Î;\ës¤\Ê\õ\ÉW\ßËù£ı¨å¶‘Š\n\0\0\n‘\Z\ÕnPƒ%RùR\äƒ-/—52\Øúf8\ó\Õ\Ä\0\0\0…Hj”Jş\'(\0\0(DjT\rP±b€\0€B¤F\Õ\0+(\0\0(DjT\rP±b€\0€B¤F\Õ\0+(\0\0(DjT\rP±b€\0€B¤F\Õ\0+(\0\0(DjT\rP±b€\0€B¤F\Õ\0+(\0\0(DjT\rP±b€\0€B¤F\Õ\0+(\0\0(DjT\rP±b€\0€B¤F\Õ\0+(\0\0(DjT\rP±b€\0€B¤F\Õ\0+(\0\0(DjT\rP±b€\0€B¤F\Õ\0+(\0\0(DjT\rP±b€\0€B¤F\Õ\0+(\0\0(DjT\rP±b€\0€B¤F\Õ\0+(\0\0(DjT\rP±b€\0€B¤F\Õ\0+(\0\0(DjT\rP±b€`TH)ı\ÑÜ¹s:s\æ\Ì\ßNŸ>½şLF6\Õ\ïı•3f<\Ö\Û\Ûû¹\ò\õ­\ÔU\÷µ®\"5ªù\÷T6\ñÒ½\ä×£|FJ¤º ¸ªÉ½°j²Ò¢E‹Ò²e\ËZşA“\áOş½\ç\ßÿ\õ\×_ÿL\Õ@|º|F#u\ÕıD­«Hª*VP\0Œ\nyAn²\Ê\Èd\ä\Ó\××·¸j n-_£\ÑH]\ÅI´ºŠÔ¨\æ½tü©^‡Çª:]^¾F#%R]\\>¼J#ùu\èf±&©«8‰VW‘\Z\Õ|ˆ£A?F\æÏŸ?µ›ƒ~¤º 8‡°\ÄJ7aY“\ÔU¬Dª«Hj>?,\â˜\÷\Òø»“\ê\÷\Ş7oŞ¼\ó«\Z}¤›‡šFªK\0‚k·\Ñ}\î\é¾4\÷¶³\Ó\ìkÿ±Nş>/+×“\Î©\Ñí„ºŠ•Hu­Q\ÍM{\Ş\óQ\å\Åü{’Oş½\ç\ß×†§,Z]Xş¬l¶\Ê,]²0Íºú˜t\×\å_¼,\ßV®/CO~=\Ê\×h4RW±©®4ªD¤.h[;î£³/mirY0û²–\õe\è‰\Ô\èvB]\ÅJ¤ºÒ¨‘º m\í4º\÷]wbKƒ\ÛH¾­\\_†Hn\'\ÔU¬Dª+*©K\0\Ú\ÖN£;\ë\çÇ¶4¸\ä\Û\Ê\õe\è‰\Ô\èvB]\ÅJ¤ºÒ¨‘º m\Z\İX‰\Ô\èvB]\ÅJ¤ºÒ¨‘º m\í4ºù\êheƒ\ÛH¾­\\_†Hn\'\ÔU¬Dª+*©K\0\Ú\ÖN£;\ç¦\ïµ4¸\ä\Û\Ê\õe\è‰\Ô\èvB]\ÅJ¤ºÒ¨‘º m\í4ºO-¼;Íº\æ\Û-Mn^–o+×—¡\'R£\Û	u+‘\êJ£JD\ê€¶µ\Ó\è\æ<|û¹-n^V®\'%R£\Û	u+‘\êJ£JD\ê€¶µ\Õ\è._\æ\Ü|fK£›—\å\ÛZÖ—!\'R£\Û	u+‘\êJ£JD\ê€¶­®\Ñ]ºdaz\à¦\Ó[š\ÜF\òmy\ò~2´Djt;¡®b%R]iT‰H]Ğ¶•6ºË—§¾9½é«nin\Ë\äu\òº\ö\ZtHn\'\ÔU¬Dª+*©K\0\Ú6X£»º½+‹½\'R£\Û	u+‘\êJ£JD\ê€¶\r\Öè¶³w`e\É\÷-O\ÚO¤F·\ê*V\"Õ•F•ˆ\Ô%\0m¬\Ñ-›\×W›\ò\ñ¤ıDjt;¡®b%R]iT‰H]Ğ¶Á\Z]\é^\"5ºPW±©®4ªD4š\êr\âÄ‰o¨\ï\î===ÿZ}^\å\á*/\ä?ÃŠ¯ù\ç\é+n\ß=¯_>\0\Ğ\è\ÆJ¤F·\ê*V\"\Õ\ÕhjTYwŒ†º?~ü\Î\Õ\óœV\å\Å\ÃR»\É\ëO\Ë\÷/€!\Ğ\è\ÆJ¤F·\ê*V\"\Õ\ÕhhTY\÷D®\Ëj\ğÙ®z~·2\r%·\ä\Ç+·À« Ñ•Hn\'\ÔU¬Dª«\ÜÄ•Ë \Û\"\Ö\åÄ‰\×\ë\é\éù~\õ\Ü^)¡\Ã?<w\Şy\é;\îH=\ôPzê©§R–¿\æŸ\ó\ò|{^¯¼o~¼ü¸ù\ñ\Ëm\ô«\ŞSş\×Ì™3w;\÷\Üs¯9\î¸\ãÿı\ßÿı²<°~Cš2e\Ê\ï:\ê¨g«eü\ñ§Lš4i³\òşk3n¬Djt;¡®b%R]ElT!Z]V\Ïg³\ñ\ã\Ç\ß\Õ<øL˜0!ı\à?H,¨‡¥v\å\õ\óı\òı‹A\êÎ¼r\ÛÀ:®z\ßXïª«®ú·c9æ·“\'ONgœqFº\å–[ıßš¼<ß¾\ß~û½|\È!‡\Ì\İÿıw)om¤Ñ•Hn\'\ÔU¬Dª«h*d‘\ê²\Zœş²\Ê\Â\æa\ç\ÄOL>ú\èÀ\É\èU\Ê\÷ÏSQ\æ\í•\ÏXGUÑ—?şøey\÷\õÌ™3\Ó\Ë/¿\\¾—*¯—\×?\ô\ĞCw\ĞAı²§§\ç\í\åc¯M4º±©\Ñí„ºŠ•Hu©Q…†(u™\÷5Oy¯Ñ¥—^Z¶*ÉW\ìz4o·|.À:¤zoøı«¯¾ú¼8 ]q\Åé¥—^*\ß;Ú’\ï—\ï?q\â\Ä\ç\Ö\æ+\×htc%R£\Û	u+‘\ê*J£\n\Í\"\Ôe>\'©ù°½I“&¥_ı\êWe{²F\ä\ÇÍ\ß4D\İ\éœ(XGU\ï	¿?mÚ´ÿ{\à¦_ÿú\×\åûÅ\äÇ™<y\ò&LØ¯\Ü\Ş\Ú@£+‘\Z\İN¨«X‰TW\ZU(E¨\ËŒ\è\ß\ó4\\\ÃSC~ü\æ=Qyû\ås\Öy\ÏÓ”)SÒ¢E‹\Ê\÷‰\äÇ›4i\Ò\Òq\ã\Æ\íTns´\Ó\è\ÆJ¤F·\ê*V\"\ÕU„FJİ®\Ë—*¹1\Ì\\v\Ùee+2,\òvš\öB½\ìç°¹ùæ›¿œ‡§5µ\ç©T=\î+û\ì³Ï’±cÇ¾£\Ü\öh¦Ñ•Hn\'\ÔU¬Dª«n7ª0˜n\×\åMŸ\ó”/\ô0’ŠK\ÜR>7`-Uıı_\ï„NX–\ÏY\ZN—\\rÉ’	&\\Un4\Ó\è\ÆJ¤F·\ê*V\"\ÕU·UL7\ë2\İ\Ò`\ò!u^m\ï\Õ\Ê\Ûk>”om<\ÚÄ•W^ùƒ|µ½¡^0¢]ù\ñ\'Oüd\õ\æ\ò\ñ\ò9ŒV\Z\İX‰\Ô\èvB]\ÅJ¤º\êf£\n+\ÓÍº¬¶=­1¼\ä\Ïkê†¼İ¦½P\Ó\Ê\ç¬eª¿\÷ÿ\ë[\ßú\Öo\ó¥\ÇGÂ7\Şøt\õ\æ\ò‹\òyŒV\Z\İX‰\Ô\èvB]\ÅJ¤º\êf£\n+Ó­ºœ0a\ÂÕ¶_l/#½\÷©!o·i€z1?¯\ò¹k‘›o¾y\×ı\÷ß¿\í\Ïy\êT\ŞÎ{\îù\ôØ±c7-ŸK$\Õ\àuUÆ”\ËK\Z\İX‰\Ô\èF]Î”uµ\÷\Ş{ÿ\ïü\õ\ñ\Ç\ß\â‘G™u\çw>\÷ÿ\ğÿgÌ˜1Ğ¼\Şp\èV£\n«2u9~üø%U/—7«¶»{cp\ÉG\ÒtS\Ş~\Óµ{ù\\µ\È9\çœ\ó\ó3\Î8£|V\ÇwÜ¬\Ë\çIÓ›\à*^n¬”n4\êjt¦¹®\ò\ğ4aÂ„‡oºé¦Ÿ._¾¼ÿª\õ~wÁ,œ4i\Ò\öÍ¯\åš6*tj8\ê²\ñ~¹ªAªºı\ô\Æz?ş\ñ›[—·\ß\ôzù\\µ\È\ñ\Çÿ\äH¾\×p\íµ\×\Î\Ş#ø1\ÂMo‚«lx5º±2Š(u5Š\Ò\\W?ü\ğ\Ç{\ì±%\åûZÃ¼y\ó~{\â‰\'^8v\ì\Ø?i~M×”\\7\å2\è¶\á¨\Ë\òır°Aªú¹·qû\í·\ß^şuQyûMÏµ·ùyk™¯}\ík\Ë\æÎ[¾«û\ï¿^\õs[ù\\\")ß¸›2 \á\Õ\è\Æ\Ê( \Ô\Õ(H~=*\ë?ø\àƒ—·s¸\ó+•\ê>K8\âˆ/6½ükD®—rt\Ûp\Ô\å \ï“uš©\ê\çG\Z\ËGº—)\å\í7=\ÏG\Ê?°™2e\Ê+¿ù\Ío\Ê\÷a\õ\ÔSO-­\Ş\\–\Ï%’\ò\r{\\WeL\äF\÷†nH\Ï>ûl\Ë\ò•å—¿üez\æ™gZ–—\É\'\Ë>\ğÀ-\Ë#dP£¦®\Z¹ë®»\ÒÒ¥K\ë\ï—-[Ö¿üù\çŸoY\÷\ñ\ÇO\÷\İwß€e=\öØ€ûEN\ŞK_ı\İXV¾—­Î’%K~{\ÖYg\İ1v\ì\Ø-\ÊZª\\\'\å2\è¶\á¨\ËA\Ş$R\Õ\×åŸGº—)\å\í7=·g\Ë?°\Ù{\ï½\Ó\ï~\÷»\ò}`XU\Û{¶|#­‰\Ô\è¾\ğ\Â~\Şn»\í\Òù\çŸ_ÿ\Üs\Ï\r¸­j\ê\Òw¿û\İË¾\õ­oÕŸe‘¿_¼xq\Ë\ã7r\Í5×¤×¼\æ5\é–[ni¹­\Û)_ŸÑšHuµ²|\ö³ŸM_ÿú\×\ë!\èø@\Ê£\Éù\à?˜N=\õ\Ô\ë\Ş{\ï½iı\õ\×O,¨^¾|y\Úq\Ç\ó\Ç\Z´<n´\äA\ï”SN©ÿN¼Zù>ù¾\å\ë\Ûi\Ê\÷qè¶²F»‘‘\îeJyûM\Ï\ç¥\òw¬E8\à€ß\ôÿ\Ú<ù\ä“\î1z\÷@]·G\ĞC­\òvØ¡¿‘\İd“M\Òn»\íV_6«\Õkşøÿ¸şŸ\õ/}\éKı\ï6\ÛlS¯\÷ú×¿>s\Î9-\ÛÈ¹ü\ò\ËsW\ï‰*o\ëvF\ñ¨°u5X\ò \ô\ñ\é;\îH³f\ÍJozÓ›úo;vlº\ì²\Ë¬Ÿ\÷X¾\õ­o\íÿùˆ#H\Ûn»mz\ä‘GZ;b¦M›–ÿ^\\\Ó\Û\Ûû\ä+¯¼²úcøRz©¯¯o\ê¾û\î{O\õº^ak»\á¨\ËA\Ş\'\ë4Â—\÷\ô4–t/S²\n\Ö!Gy\ä³#}\Ü\ğ½\÷\Ş{û£\ï¨\rnC¤Fw\ö\ì\Ùi\Ë-·\ìÿ9S·\Şzkıı?ÿ\ó?§o~\ó›\Öÿ\ïÿş\ïú\ë\É\'Ÿœ&MšTO\ïÿû\ëa\ë#ù\ÈJÿ;û\ì³Ó†nX\ï‰*o\ëvF\á\0¾®\ËW¾\ò•\ô_ÿ\õ_é¨£J_ø\Â\ÒFm\Ô\Û\ê¨¯~\õ«\õ}–,Y\Ò\ò¸QÓ¨«ª)\Zw\Ì1\Ç,ª<Q¾¯5,]ºtN¾ˆD\õº.\Èë—¯m§rİ”Ë Û†£.\Ë\÷\ËÁ.\"±‡s €n8ú\è£\é«\ğ]t\ÑE—\î1z®\Â7hƒ\Û©\Ñ\ÍM\êŸüÉŸ\Ô\ÃP\Î\Æoœ>\÷¹\Ï\Õ\ß\ç½Kù½¼^Ş³”\÷8\åa\ë\Øc\Íÿ(¥q\ã\Æ\õPyı­¶Úª^§\ÜF\Îw¾\ó)£h€\Z5uU&\åë­·^úÔ§>•şü\Ïÿ<-\\¸°\Şc\Ù\Ø\óù¶·½m\Ğ*\×c>dø_ş\å_\Ü6\Z\öB5\×U¾ºŞ{\îy\æù\çŸÿ\ôK/½\ôB\Ó[Û³½½½WN˜0\á¥\êµı7W\ác]2u\Ùx¿lpj\ÈW»k¬\ç*|Àˆ9\î¸\ãN\éÏ:ø\àƒ¯Ÿµ\Ê·!R£û\ĞC­rTc\à\É{–x\â‰\ô\Æ7¾±şş\ÜsÏ­\÷\Z4\Z\àv\Ú)ü\ñ-\ßÈ®»\îZß\Ï{)o\ëvFÁ\05\ê\êªL>\é\â‹/N{\íµWº\ğ\Â\ëe+\Û•¿\æš\Ê\r\Åk_û\Úz\èj\ÔYN\Ö\ó\ò¼7«\ÜN¤VW\Õ{Ø‡;\ì°{+ÿ\æ7¿ù\ÅW¾\ò•\Ü\Èİµûî»)\×]“†£Q…N\rG]®jpj\Ø\Ã\ç@\İP50›M<ù\åv.Í»&T\Ûy¼zcy²j²6-Ÿ\Ëh©\Ñ\ÍÿË¿ªªù¾|¥´|^şş¢‹.J\ïx\Ç;ú\÷\\\å½Kyı\ò\ñ\÷\Ë\ç»\Üv\Ûm\õa~‘şü9ƒ5º£Q´\ßk™\ÓN;-}ò“Ÿ¬‡\ï\éÓ§\×{ \Z\õ³\Å[\ôPù\Â&ù|©\æCø:\è t\÷\İw·<fä¬¬®ÆŒ\óUƒ\÷µ\ê=mNşš.\×YÓ†£Q…Nu«.«\í\î\ŞZ?ü\ğ²\åQ‡v\Ø+M\Ô\î\ås\Ö2‡r\È\Ã#u\ßÔ©S\\½±ü¢|£U¤F7_&zU‡\ğ}\ík_\ë_·1@\İy\çiŸ}\ö©­jÜ–‡§•\rPgyfú\ğ‡?\\Ÿ\÷>\äCıÚ¹\ôùHee\îh©®\Ê\äC\ö\Şü\æ7§ú\â\n\÷\Üs\ÏJ\÷@5\Ò<@\å:\İz\ë­Óƒ>\Ø\ò\ØQ©®ºÕ¨Âªt«.\'L˜°Aµ\íƒK¾¸Q7\ä\í6\rO/\æ\çU>W`-³ÿşû\ïrè¡‡şî¥—^*\ßÖ¨\ê\ñ­\ŞX\æŒ7\î\ã\ås­\"5º¹1m¾\Ò^\ó¨Ÿı\ìg.ú/k\Ïc\Ù~û\í\ÓO~\ò“¶\ö@\åd\óŞ…|µ¿Æ²ü\ã\õ!}Q.©\Ñ\íD¤º*“/[Ÿ_¾„y>Œ\ó?øA\Ë\0•«§zªY\ó\05gÎœú\"ù*‘yO\Ö\Ê.V)‘\êª[*¬J7\ë²\Ú\ö´\Æ\ğ’ßº!o·i€\n}7°|\ğÁ¿¼\âŠ+^)\ßÖ WN:é¤³«7–+\Êmf‘\İ<@­ì³š\æÏŸŸ^\÷º\×Õ—1Ï‡\ğ5\ö@\åC\ó\òaù\Ê|\Í\ë\ç+ü\åÁªü\ó\æÃ³6\ß|\óú\Â\å}º‘Hn\'\Ê\ßs¤\\r\É%\õ\ç€z\è¡\é?ÿ\ó?\ës™\òyL\Í‘x\Ë[Ş’v\Ùe—ş\Ï&ûÕ¯~•6\Ø`ƒú³£&NœXŸ¯—ÿŒy¨Êƒü”)SZ¶)‘êª›*¬L7\ërÜ¸q;5†—üY†#½*ooüø\ñı‡\ï\å\çS>G`-5v\ì\ØwLš4i\é¯ı\ë\ò½a¸\á†Î©\ŞXú\òv\Êmf‘\İ|Jn\\\Ë\å\Üÿı\õ\×|(\Ş7¾\ñúû\ïÿû\é½\ï}oıÁ§\õ\òŸ1Ÿ·’›\Ş\ò1r\ò0–ÿ\Ñ\ê\í\ím¹m¤©\Ñ\íD\äºÊ™1cFı5\n\Ú\×\×\×r{™\\O\ïy\Ï{Zjd\éÒ¥\é‚.hù\èh‰TW\İlTaeº]—\Õ\öoi0\'xbÙ‚«¼½¦½O·”\Ï\rXË?~\ç}\÷\İ\÷…E‹•\ï™7o\ŞeÕ›\Êck\ãÿ\ÊDnt\ó¡V\å²Á\Ò\îz£!‘\Z\İND®«¡&_½¯\\6Z©®ºİ¨\Â`º]—Uÿ²]\õ^n2ù<Ì‘·\Ó4<½œŸGùÜ€uÀ„	\ö›4iÒ³kjOÔŠ=O«\ì[nkm°66º£9‘\Z\İN¨«X‰TW\İnTa0ê²§§\çûa&‘ÀNù\ñ›\İ\Ë\Û/Ÿ°\É{Š\ö\Ş{\ï%—\\rÉ’¡^X\"_0b\Å9O¯{\Z4º±©\Ñí„ºŠ•Hu¡Q…R„ºœ8q\âz\Õ\ó¸³1\Ğ\ä‹\"\r\×•·\Ú^ÿ¯¼İ¼ı\ò9ë˜·O˜0\á\êÉ“\'?y\ã7>\İ\î\çDU\ë-š:u\êyÕ›Éœ*W\æ\Ç){m¢Ñ•Hn\'\ÔU¬Dª«*”¢\Ôe\õ<6«’¯øÛ¿\'\ê\ÒK/-[•\ä\Çk\Ş\ó´b{›•\ÏX‡\åKWo3\ö\Üs\Ïg=\ö\Ø{¦OŸ>\ëşû\ïd\ñ\â\Å\ÏU\ï#KŸxâ‰¹³gÏ¾ı\â‹/¾\äC¹²Zwq^mºTùªhtc%R£\Û	u+‘\ê*J£\n\Í\"\Õe5\Üüe\ó•“/\ô\Ğ\é\Õù\òı‹F\Ô\ÃS\Ş^ù\0jcÇİ´z£˜\Ò\Ó\Ósi\õ\õÖ¦7§ü\õ\ÖË§\ä\õ\Êû®\Í4º±©\Ñí„ºŠ•Hu©Q…†hu¹\Çÿ\ì‰\ê?œ/\'\ïÊŸ×”?~\ã\Õ\È\ë\çû{\ê\Ã\ö\òv\Êm°\Z\Z\İX‰\Ô\èvB]\ÅJ¤ºŠÖ¨B±.\ó9I+.,Q>\õ\çw\Şy\é;\î¨?¢#\ğw–¿\æŸ\ó\ò|ûa‡\Ör\ßüxùq\ó0D\Z\İX‰\Ô\èvB]\ÅJ¤ºŠØ¨B\äº\\q‰\óşÏ‰\ê0·¸T9@‡4º±©\Ñí„ºŠ•Hu•›¸rt\Ûh¨\ËüY—\Õ\óœV\å\ÅA£U%¯?-ß¿|L\0†@£+‘\Z\İN¨«X‰TW£¡Qe\İ3š\êr\âÄ‰o¨\ï\î===ÿZ}^\å\á*/¬–\ò\×ü\ó\ô·\ï\×/€htc%R£\Û	u+‘\êj45ª¬;\Ô%\0m\Ó\è\ÆJ¤F·\ê*V\"Õ•F•ˆ\Ô%\0m\Ó\è\ÆJ¤F·\ê*V\"Õ•F•ˆ\Ô%\0m\Ó\è\ÆJ¤F·\ê*V\"Õ•F•ˆ\Ô%\0m\Ó\è\ÆJ¤F·\ê*V\"Õ•F•ˆ\Ô%\0m\Ó\è\ÆJ¤F·\ê*V\"Õ•F•ˆ\Ô%\0m\Ó\è\ÆJ¤F·\ê*V\"Õ•F•ˆ\Ô%\0m\Ó\è\ÆJ¤F·\ê*V\"Õ•F•ˆ\Ô%\0m\Ó\è\ÆJ¤F·\ê*V\"Õ•F•ˆ\Ô%\0m\Ó\è\ÆJ¤F·\ê*V\"Õ•F•ˆ\Ô%\0m\Ó\è\ÆJ¤F·\ê*V\"Õ•F•ˆ\Ô%\0m\Ó\è\ÆJ¤F·\ê*V\"Õ•F•ˆ\Ô%\0m\Ó\è\ÆJ¤F·\ê*V\"Õ•F•ˆ\Ô%\0m\Ó\è\ÆJ¤F·\ê*V\"Õ•F•ˆ\Ô%\0m\Ó\è\ÆJ¤F·\ê*V\"Õ•F•ˆ\Ô%\0m\Ó\è\ÆJ¤F·\ê*V\"\ÕU¤F5¥\ôGs\ç\Îı\éÌ™3;}ú\ôú\÷$#›\ê\÷şÊŒ3\ë\í\íı\\ùúŒ¤Hu	@pù°²Ù’\î%¿\åk4\Z©«X‰TW‘\Z\Õjxº°j\ŞÓ¢E‹Ò²e\ËZ~o2üÉ¿\÷üû¿şúëŸ©\ê\ô\Ó\åk4R\"\Õ%\0Á\åÿı\Ó8\ÄH\õ:<V5\Ë\Ë\×h4RWq­®\"5ªy\ÏSn\Ş\Ëß™Œ|úúúWuzkù\Z”Hu	@pù\Ğ	\rDŒÌŸ?j7ˆ5I]\ÅI´ºŠÔ¨\æ\Ã\öú1’_‡nú‘\ê€\à\òq\çùĞ‰ü¿\Z‰\î¤ú½\÷Í›7\ïüªyx¤›‡°¬I\êªû‰ZW‘\ZU‡š\ÆJ75T—\0Œ¹¹\ÊÿC]\å\Åü˜Œx\ò\ï=ÿş\Ã4¹kBş\ó¬øs©«\î$d]EjT\ó\ï©l\â\ËsO\÷¥¹·f_ûu\ò\÷yY¹t–üz”¯\ÑH‰T—\0\0\Ğ/R£\Ú\Î\0µt\É\Â4\ë\êc\Ò]—u@\ò²|[¹¾=(\0\0(DjT\Û }i\Ë\ğ\ÔÈ‚Ù—µ¬/C\n\0\0\n‘\Z\Õv¨û®;±epj$\ßV®/C\n\0\0\n‘\Z\Õv¨Y??¶epj$\ßV®/C\n\0\0\n‘\ZUT¬ \0\0 ©Qmg€\ÊW\İ+§F\òm\åú2\ô \0\0 ©Qmg€šs\Ó\÷Z§F\òm\åú2\ô \0\0 ©Qmg€zj\á\İi\Ö5\ßn\ò²|[¹¾=(\0\0(DjT\Û r¾ıÜ–*/+×“\Îb€\0€B¤Fµ­jù\ò4\ç\æ3[¨¼,\ßÖ²¾9(\0\0(DjTW7@-]²0=p\Ó\é-\ÃS#ù¶¼Ny?ZP\0\0PˆÔ¨®t€Z¾<\õ\Í\éM\÷\\ut\Ë\ĞT&¯“×µ7ª\ó \0\0 ©Ql€Z\İ^§•\ÅŞ¨\Îc€\0€B¤Fu°ª½N+K¾oùx\Ò~P\0\0PˆÔ¨6@•CÑ«Mùx\Ò~P\0\0PˆÔ¨6@I\÷b€\0€B¤F\Õ\0+(\0\0(DjT\rP±b€\0€B¤F\Õ\0+(\0\0(DjT\rP±b€\0€B¤F\Õ\0+(\0\0(DjT\rP±b€\0€B¤F\Õ\0+(\0\0(DjT\rP±b€\0€B¤F\Õ\0+(\0\0(DjT\rP±b€\0€B¤F\Õ\0+(\0\0(DjT\rP±b€\0€B¤F\Õ\0+(\0\0(ŒD£Zm\ãº*c\Ê\å%T¬ \0\0 0j\ŞÆŠ¬r2@ÅŠ\n\0\0\n#Ñ¨6\rP«¤P±b€\0€\ÂH4ªƒPƒR¨X1@\0@a$\Z\ÕA§2\õ m€z\æ™gú¿şù\ç\Ó]w\İÕ²N#<\ğ@z\ò\É\'[–/[¶¬e\Ùh‰\n\0\0\nƒ3]K´\ê˜cI§œrJıı\å—_¶\Øb‹´`Á‚–\õr<\ğÀ´\Ûn»¥«¯¾:Mš4©?\ï|\ç;Ó¬Y³Z\Ö\ÏYºúúú,¿\ã;Z\Ö\íV\Ê\×g¤S\Ö*\0\0¬\ÊÆ¸)\×\íø¾…¦×¾\öµ\é\ÙgŸM_ø\ÂRoooz\á…Z\Ö{ü\ñ\Ç\Óf›m–\æÏŸŸ\Î?ÿüú~yùşû\ïŸ>ø\àş\õfÎœY/\Ë\Ùa‡\Ò{\ßûŞ´\õ\Ö[\÷/\ËyÓ›Ş”}\ôÑ–mt#\İ\Ü\0\0\ë¬\Õ\rN\r‘¨\ï~\÷»i\Ï=\÷L\õW•\ö\Ûo¿´é¦›¦É“\'§w¿û\İi\ñ\â\Å\Ö\İw\ß}Ó¹ç›~ü\ã§\Í7ß¼\Ş\ã\ô£ı(­¿şú\é\Î;\ï°nŞƒµë®»¦3f\Ô\ë\å\Ç\İgŸ}\ÒlP\ï±z\ë[\ß\Ú\ò\\º\0\0tÁ\ê§†H\Ô\É\'Ÿœ:\ê¨\Ë\î½\÷Ş´\ÕV[\rXv\Î9\ç¤\õ\Ö[/\í´\ÓNi£6J·\ß~{:ı\ô\ÓÓ˜1c\ÒM7İ”>úÑ¦½\ö\Ú+-Y²¤ÿ>y€\Ê{³\ò9U;\ï¼s}®Õ»\Ş\õ®ú¶·½\ím-Ï¥[1@\0@¬npjˆ4@zê©ƒPù°»\æeO<\ñDš>}z½\÷(N_ü\â\ë\ó¦\Z‡ú=\÷\Üs\éŸøDºêª«\Ò=\÷Ü“¾\ô¥/\Õ\çR\ås£\ò0¶\É&›\Ø\õg\ög-Ï¥[1@\0@`‘¨ú§J\ï{\ßûROOO}\è^>?)Ÿ\ék^/\ï=:\ò\È#Ó;î˜¾\ó\ï¤\Ã?¼’\Z\ç4\åK|\à\è?\ì/Ÿ\ß\ôù\Ï¾>„\ïşû\ïOÿ\ñÿ1`\Ôgœ\Ñ\ò\\º\0\0e€Z¾|yú\á˜¾ş\õ¯\×C\Ä6\Ûl“n¸\á†ú\âG}t}{c\İ<\å\ó\òyRy(Ê—-\ÏCR>\'*\ïQ*;§qT¾\àD²\ò9T=Poy\Ë[\ê=U\å}º\0\0e€\Ê{N;\í´\ô‘|¤¤¦M›–~ò“Ÿ¤K.¹¤\ŞÛ”\÷Í™3§^7¢—¯®—\×;\ì°\ÃÒ—¿ü\åzˆ\Ê‘hPK—.\í?¤/Ÿ\÷\ôÁ~0m·\İv\é„N¨¯\Ü×¼*_\ñ¯ù\ó§º\0\0a€zè¡‡\ê9\Üw\ß}\õ… \ò§\Æm\ßü\æ7\ë¡\"\Ş\×øP\İü\ó–[n™N:\é¤4u\ê\ÔşC\÷\òyOù<§üı\ö\Ûo_Ÿu\å•W¦?ı\Ó?­‡³³\Î:«ÿ³¢šÏ\Úv\Ûm\Óg>\ó™ús¢\Ê\ç6\Ò1@\0@`¨\æt\ĞAi\ã7®ªœ\r7\Üp\Ğs”š\é[\Ù\í6’/:‘¿\æ=MO>ùd\Ë\í‘b€\0€À¢\rP\ëzP\0\0˜*VP\0\0˜*VP\0\0˜*VP\0\0˜*VP\0\0˜*VP\0\0˜*VP\0\0˜*VP\0\0˜*VP\0\0˜*VP\0\0˜*VP\0\0˜*VP\0\0˜*VP\0\0˜*VP\0\0˜*VP\0\0˜*VP\0\0˜*VP\0\0˜*VP\0\0˜*VP\0\0˜*VP\0\0˜*VP\0\0˜*VP\0\0˜*VP\0\0˜*VP\0\0˜*VP\0\0˜*VP\0\0˜*VP\0\0\Ø\ô\é\Ó_Y¶lYK#/#Ÿ\êux¬\Z –—¯\0\0ÄŒ3[´hQK3/#Ÿù\ó\çO­¨[\Ë\×\0\0¢··\÷s\×_ı3}}}‹\í‰\êNª\ß{ß¼y\óÎ¯†§Gª|º|\0\0€@rÓ\÷|Ty1Ÿƒ##ü{Ï¿\Ã\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\ğÿı?Eƒˆ€ûH\0\0\0\0IEND®B`‚',1),('1820703298988478466',1,'è¯·å‡æµç¨‹ï¼ˆå¹¶è¡Œç½‘å…³ï¼‰-leave3.bpmn20.xml','1820703298988478465',_binary '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:bioc=\"http://bpmn.io/schema/bpmn/biocolor/1.0\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:di=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"leave3\" name=\"è¯·å‡æµç¨‹ï¼ˆå¹¶è¡Œç½‘å…³ï¼‰\">\n    <startEvent id=\"startNode1\" name=\"å¼€å§‹\">\n      <outgoing>Flow_14qet78</outgoing>\n    </startEvent>\n    <userTask id=\"Activity_0uscrk3\" name=\"ç”³è¯·äºº\" flowable:formKey=\"static:1\">\n      <incoming>Flow_14qet78</incoming>\n      <outgoing>Flow_171lpw3</outgoing>\n    </userTask>\n    <sequenceFlow id=\"Flow_14qet78\" sourceRef=\"startNode1\" targetRef=\"Activity_0uscrk3\" />\n    <userTask id=\"Activity_0ped7fd\" name=\"ç§‘ç ”éƒ¨é—¨\" flowable:candidateUsers=\"1,3\">\n      <extensionElements />\n      <incoming>Flow_16qxdzv</incoming>\n      <outgoing>Flow_01rdmuq</outgoing>\n    </userTask>\n    <userTask id=\"Activity_1e8dxc6\" name=\"æ€»ç»ç†\" flowable:candidateUsers=\"1\">\n      <extensionElements />\n      <incoming>Flow_0rt1gbx</incoming>\n      <outgoing>Flow_01maojf</outgoing>\n    </userTask>\n    <userTask id=\"Activity_0xun74h\" name=\"ç»¼åˆéƒ¨é—¨\" flowable:assignee=\"1\">\n      <extensionElements />\n      <incoming>Flow_15anuo0</incoming>\n      <outgoing>Flow_1j0t4se</outgoing>\n    </userTask>\n    <sequenceFlow id=\"Flow_171lpw3\" sourceRef=\"Activity_0uscrk3\" targetRef=\"Gateway_0qj0eur\" />\n    <sequenceFlow id=\"Flow_16qxdzv\" sourceRef=\"Gateway_0qj0eur\" targetRef=\"Activity_0ped7fd\" />\n    <sequenceFlow id=\"Flow_15anuo0\" sourceRef=\"Gateway_0qj0eur\" targetRef=\"Activity_0xun74h\" />\n    <parallelGateway id=\"Gateway_0qj0eur\">\n      <incoming>Flow_171lpw3</incoming>\n      <outgoing>Flow_16qxdzv</outgoing>\n      <outgoing>Flow_15anuo0</outgoing>\n    </parallelGateway>\n    <endEvent id=\"Event_0k2b5e5\">\n      <incoming>Flow_01maojf</incoming>\n    </endEvent>\n    <sequenceFlow id=\"Flow_01maojf\" sourceRef=\"Activity_1e8dxc6\" targetRef=\"Event_0k2b5e5\" />\n    <sequenceFlow id=\"Flow_01rdmuq\" sourceRef=\"Activity_0ped7fd\" targetRef=\"Gateway_05y03rn\" />\n    <parallelGateway id=\"Gateway_05y03rn\">\n      <incoming>Flow_01rdmuq</incoming>\n      <incoming>Flow_1j0t4se</incoming>\n      <outgoing>Flow_0rt1gbx</outgoing>\n    </parallelGateway>\n    <sequenceFlow id=\"Flow_1j0t4se\" sourceRef=\"Activity_0xun74h\" targetRef=\"Gateway_05y03rn\" />\n    <sequenceFlow id=\"Flow_0rt1gbx\" sourceRef=\"Gateway_05y03rn\" targetRef=\"Activity_1e8dxc6\" />\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_flow\">\n    <bpmndi:BPMNPlane id=\"BPMNPlane_flow\" bpmnElement=\"leave3\">\n      <bpmndi:BPMNShape id=\"BPMNShape_startNode1\" bpmnElement=\"startNode1\" bioc:stroke=\"\">\n        <omgdc:Bounds x=\"235\" y=\"205\" width=\"30\" height=\"30\" />\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds x=\"238\" y=\"242\" width=\"22\" height=\"14\" />\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_0uscrk3_di\" bpmnElement=\"Activity_0uscrk3\">\n        <omgdc:Bounds x=\"320\" y=\"180\" width=\"100\" height=\"80\" />\n        <bpmndi:BPMNLabel />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_0ped7fd_di\" bpmnElement=\"Activity_0ped7fd\">\n        <omgdc:Bounds x=\"590\" y=\"120\" width=\"100\" height=\"80\" />\n        <bpmndi:BPMNLabel />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_1e8dxc6_di\" bpmnElement=\"Activity_1e8dxc6\">\n        <omgdc:Bounds x=\"850\" y=\"180\" width=\"100\" height=\"80\" />\n        <bpmndi:BPMNLabel />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_0xun74h_di\" bpmnElement=\"Activity_0xun74h\">\n        <omgdc:Bounds x=\"590\" y=\"240\" width=\"100\" height=\"80\" />\n        <bpmndi:BPMNLabel />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Gateway_0ydkpig_di\" bpmnElement=\"Gateway_0qj0eur\">\n        <omgdc:Bounds x=\"475\" y=\"195\" width=\"50\" height=\"50\" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Event_0k2b5e5_di\" bpmnElement=\"Event_0k2b5e5\">\n        <omgdc:Bounds x=\"1022\" y=\"202\" width=\"36\" height=\"36\" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Gateway_0f4e1bw_di\" bpmnElement=\"Gateway_05y03rn\">\n        <omgdc:Bounds x=\"745\" y=\"195\" width=\"50\" height=\"50\" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge id=\"Flow_14qet78_di\" bpmnElement=\"Flow_14qet78\">\n        <di:waypoint x=\"265\" y=\"220\" />\n        <di:waypoint x=\"320\" y=\"220\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_171lpw3_di\" bpmnElement=\"Flow_171lpw3\">\n        <di:waypoint x=\"420\" y=\"220\" />\n        <di:waypoint x=\"475\" y=\"220\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_16qxdzv_di\" bpmnElement=\"Flow_16qxdzv\">\n        <di:waypoint x=\"500\" y=\"195\" />\n        <di:waypoint x=\"500\" y=\"160\" />\n        <di:waypoint x=\"590\" y=\"160\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_15anuo0_di\" bpmnElement=\"Flow_15anuo0\">\n        <di:waypoint x=\"500\" y=\"245\" />\n        <di:waypoint x=\"500\" y=\"280\" />\n        <di:waypoint x=\"590\" y=\"280\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_01maojf_di\" bpmnElement=\"Flow_01maojf\">\n        <di:waypoint x=\"950\" y=\"220\" />\n        <di:waypoint x=\"1022\" y=\"220\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_01rdmuq_di\" bpmnElement=\"Flow_01rdmuq\">\n        <di:waypoint x=\"690\" y=\"160\" />\n        <di:waypoint x=\"770\" y=\"160\" />\n        <di:waypoint x=\"770\" y=\"195\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_1j0t4se_di\" bpmnElement=\"Flow_1j0t4se\">\n        <di:waypoint x=\"690\" y=\"280\" />\n        <di:waypoint x=\"770\" y=\"280\" />\n        <di:waypoint x=\"770\" y=\"245\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_0rt1gbx_di\" bpmnElement=\"Flow_0rt1gbx\">\n        <di:waypoint x=\"795\" y=\"220\" />\n        <di:waypoint x=\"850\" y=\"220\" />\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('1820703299449851906',1,'è¯·å‡æµç¨‹ï¼ˆå¹¶è¡Œç½‘å…³ï¼‰-leave3.leave3.png','1820703298988478465',_binary '‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0,\0\0J\0\0\0Ö‡\Îp\0\0/\ßIDATx^\í\İ\åy.\à=Ç•\'„\Ø!&\ñ…8>;‚ƒÁ\\N¨p	\Ò\î\n0„¹_*`\â`(À8±IlWù`ƒI\âP`C*ˆp+„H\Ø AFH€X„	°\r}\æ\ë£\Ù\Z\õ\ìj{§wz{gŸ§\ê­]\Í\ôÌ´vfşışoÿ\î\é\ê\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0¨¨$I~sÉ’%\×ÏŸ?ÿ—}}}\É\ìÙ³¥\ä\Ô~\î\ïÎ›7\ï\Å9s\æœ}~\0\0\0`BZ²dÉŒ\Úd9Y±bE²nİº\ä\í·ß–’?\÷øùÏ;\÷\õÙ³g˜}\0\0\0`Â‰•1Y\ÎN¢¥ü\ô\÷\÷¿2{\ö\ì³\Ï\0\0\0L8qˆ•\ÕH<³g\Ï^Ÿ}\0\0\0`Â‰s(d\'\Î2v‰\ç#û\0\0À„“·a\ñ\ÆkıÉ’‡®L\İı\Õ4\ñ}\\–\İNŠE\Ã\0\0\0º\ò5,Ö®^,¼\óü\äg·~i£\Äeq]v{i=\Z\0\0\0Ğ•¯a\ñü¢YMÍŠz^XtK\Ó\ö\Òz4,\0\0\0 +_\Ã\â\É{.ijT\Ô\×e·—Ö£a\0\0\0]ù\Zg_\ØÔ¨¨\'®\Ën/­G\Ã\0\0\0º4,ª\r\0\0\0\è\Ê×°ˆO\É6*\ê‰\ë²\ÛK\ëÑ°\0\0\0€®|\r‹\Å\÷·©QQO\\—\İ^Z†\0\0\0t\åkX¬ZşX²\ğ®ššqY\\—\İ^Z†\0\0\0t\åkXDı\É\ÕM\r‹¸,»‹†\0\0\0t\ålX¬_Ÿ,~\à\ò¦†E\\\×5m/-G\Ã\0\0\0º†oX¬]½<yúşK›š\õ\Äu±M\öv\ÒZ4,\0\0\0 k\r‹\õ\ë“ş\Ås’\Ç\ï8·©I‘Ml\ÛZmQ<\Z\0\0\0\Ğ5x\Ãb¸UC\Åj‹\âÑ°\0\0\0€®ÁyVU•¸m\öş$4,\0\0\0 k\ğ†E¶	1\Òd\ïO\òG\Ã\0\0\0ºoX\È\ØE\Ã\0\0\0º4,ª\r\0\0\0\èÒ°¨Z4,\0\0\0 KÃ¢jÑ°\0\0\0€.\r‹ªE\Ã\0\0\0º4,ª\r\0\0\0\èÒ°¨Z4,\0\0\0 KÃ¢jÑ°\0\0\0€.\r‹ªE\Ã\0\0\0º4,ª\r\0\0\0\èÒ°¨Z4,\0\0\0 KÃ¢jÑ°\0\0\0€.\r‹ªE\Ã\0\0\0º4,ª\r\0\0\0:ZOO\Ï=µL\Ê^¥aQ­hX\0\0\0\Ğ\Ñzzz’\r\Ùd\ãBÃ¢ZÑ°\0\0\0 £54,6Ù¸Ğ°¨V4,\0\0\0\èhƒ4,m\\hXT+\Z\0\0\0t´A\ZÙ¤‹±nX¼ú\ê«ıûHÖ¯_ß´]dÍš5M—-\\¸°é²µk\×nty\Ü\î\Í7\ßL¿\Ï\Ş\÷c=–¬^½º\é>\"o½\õV\Óeí†\0\0@\Å\r2Á–6%;inw¢i\ğè£&_ù\ÊW’\÷½\ï}\É}\÷\İ7pİ§?ı\é\ä\Ê+¯L¿Ÿ;wnrü\ñÇ§9\ò\È#“\ßø\ßH\ö\ßÿdÚ´iùĞ‡>”\\z\é¥\İ4\Zv\Ùe—ä®»\îJ^ı\õdÉ’%\é¿cûı\ö\Û/9ÿü\ó\öcÁ‚É¶\Ûn›<\ô\ĞC\ÉYg5\ğxGqD²ë®»\Ú$ig²ÏŒ<Ù±\0\0`T™x“\Ä5ä1<$\ä\Å_LN:\é¤\ä\ÄOL¶\Ûn»\äşû\ïO\æÏŸŸ6¢¹°\Ûn»¥«\ê\Û?\÷\Üs\É>\ğ•+W®L¶\Új«\ôûw\Ş9mFÔ·ÛŸ}\ö\Ùi\Ãá“ŸüdzıN;í”œ~ú\é\É\ö\ÛoŸn\÷\ßÏ˜1#mbL™2%¹\å–[’şşştuF\\7gÎœd\Ï=\÷l\Úÿv\Ç\n‹bŒ\0\0@Û™x3\\£¢®\ì†E=O?ıt\ò—ù—i“!V:\Ä\nŠ¯ı\ë\Ég?ûÙ\ZO>ùdzY|¿nİº\ô\ëP\r‹H48¢\ñ\Æo$3g\ÎL›Ë–-K\ñ\õ\óŸÿüÀ¶7\ÜpCºb£~¸Hc¢a±\×^{5]\Ş\îhXc\Ü\0\0\0\Ú\ÎÄ£˜\á\Zue7,\î¼\ó\ÎtU\Ã\äÉ“Ó•±\âŒ3\ÎH–.]š<\ñ\Äéª†Æ†\Åw¾\ó\äŸøDrøá‡§·‰\Ë\Z‹/N›Í\Ë.»,9\î¸\ãÒ¯\ÑÔˆ†E:rû\í·lw\ÓM7m\ÔÀhŒ†\Åød\Ü\0\0\0\Ú\ÎÄ£˜\á\Zue7,b5\Å\ò\åË“o}\ë[\é¹#¢\á\rŠC9$]\r‹8¿E}ûO}\êSiS\á‡?üa\ò§ú§\é\á\ï}\ï{Ó¯\Ñ\ğˆ¦\ÅÔ©S\Óû½\÷\Ş{“c=6\Ùq\Ç“8 ml\Ä\ëh\Ë-·L·}ü\ñ\Çš‘Y³fiXt\ã\0\0\Ğv&\å(»aY±bEz²\Ìm¶\Ù&\Ùz\ë­\ÓF\ÂUW]•<\ò\È#\éa\"û\ì³Or\ÔQG%·\İv[²\Ç{4,\â\Ü\Ñ\àˆ\ÆE\ÜO¬Îˆ•\÷}\Í5\×$tP\ÚĞ˜>}z²\Ã;¤·©Ÿ\Ã\".CE\âû8o…†Eg1n\0\0\0mg\âQ±hXÄŠˆo|\ãis\âK_úRz¸G¬Œ8\å”S\Ò&F4\âä—·\ŞzkúI!\õ†E\\Ÿ(Ro2D\Ã\"\ÎK\Ñx\ßw\ß}wrè¡‡¦\ß\Ç!&»\ï¾{º¢#\Z#\ñ\õ\ä“ON.¸\à‚\ôz+,:q\0\0h;r”İ°¸úê«“ı\èGi3!>\Â4>ıcÕªU\×g?%\äH>\ò‘${\ï½wº\Â\âè£N®½\ö\Ú\ôº?ÿ\ó?O}\öÙî¿¯¯/=\Ô$VRtww\'Ÿù\Ìg\ÒF\Å\æ›oLš4)\Ùb‹-Ò0m5,:q\0\0h;r”İ°¨g\áÂ…\éù\'²—G#\r©ÿ;\ÎK+0\îº\ë®\ä°\ÃK\ÏIQÿ´8¿E|ŠH\ã\íã¤š½½½\é\÷\Ñ‰¦E4,â\×^{-yé¥—¶½\ñ\Æ\Ós]4\Ş>>1$VaÄ¹.\ö\İwß¦ıkw4,Š1n\0\0\0mg\âQ±lX\Äy*²—\îsŸÛ¨	«/\âS@®¼\ò\Ê\äŸşéŸ’·\Şzkàºƒ>¸\écM_~ù\åO\r©76¢a\çµ\È>\Ö\õ\×_Ÿœp\Â	M—¿\ğ\Â\É.»\ì’Ì˜1£\éºvGÃ¢\ã\0\0\Ğv&\å«†\ÅP©7F3qŸ\ñ)\"ƒ]½¬Á¶/#\Z\Å7\0\0€¶3\ñ(G\Õ\Z=\Z\Å7\0\0€¶3\ñ(‡†Eµ¢aQŒq\0\0h;rhXT+\Z\Å7\0\0€¶3\ñ(‡†Eµ¢aQŒq\0\0h;rhXT+\Z\Å7\0\0€¶3\ñ(‡†Eµ¢aQŒq\0\0h;rhXT+\Z\Å7\0\0€¶3\ñ(‡†Eµ¢aQŒq\0\0h;rhXT+\Z\Å7\0\0**I’\ß\\²d\É\õ\ó\ç\Ïÿe___ZøJ¹©ı\Üß7oŞ‹s\æ\Ì98ûü02&\åˆ\×mv\Ò,c—x>²\Ïù7ŠQGŒ}\Ô\0t¬Z‘1£\öK.Y±bE²nİº¦BXÚŸø¹\Ç\Ï\îÜ¹¯\×\n³\Ïù™x”#\n\ä\ì\ëX\Æ.\ñ|dŸ#\ò3n£û¨#\0\èX\ñ‘ø%—ı\å\'å§¿¿ÿ•Z¡\ñ`\ö9\"?rhXT+\Z\Å7ŠQGT\'\ê\0:N,\ß\ô‘j$‡Z¡±>û‘Ÿ‰G94,ª\r‹bŒÅ¨#ªu\0\ÇÄ£Z1\ñ(\ÆÄ£ÆjÅ¸QŒq£\ãAµb<\0 £\ä-4\Şx­?Y\òĞ•É¢»¿š&¾Ë²\ÛI±(4Š1\ñ(G\ŞqCÊ‰q#¿\ÚqOŒ\Ã\ä\ì\íZ\Ş\ñ@QNŒ\0t”<…\Æ\Ú\ÕË“…wŸü\ì\Ö/m”¸,®\Ën/­G¡QŒ†E9\òŒR^Œù\ÕÆˆIƒ4(²™”½C\Ë3¨#Ê‹\ñ\0€’§\Ğx~Ñ¬¦\"£\İÒ´½´…F1\Z\å\È3nHy1nŒL¬ ¤IauE‹\òŒ\êˆ\òb<\0 £\ä)4¼ç’¦£¸.»½´…F1\Z\å\È3nHy1nŒL¬ ¤QauE‹\òŒ\êˆ\òb<\0 £\ä)4Î¾°©À¨\'®\Ën/­G¡QŒ†E9\òŒR^Œ#+)iVX]Ñ‚<\ã:¢¼\0\è(\njE¡QŒ†E9\òŒR^Œ#7\Ä*‹I\Ù\í^\ñ@Q^Œ\0t”<…Fœ\Í;[`\Ô\×e·—Ö£\Ğ(FÃ¢y\Æ\r)/Æ\ÖdVYX]Ñ¢<\ã:¢¼\0\è(y\n\Å\÷·©À¨\'®\Ën/­G¡QŒ†E9\òŒR^Œ­É¬²˜”½|\òŒ\êˆ\òb<\0 £\ä)4V-,Yx\×MEF\\\×e·—Ö£\Ğ(FÃ¢y\Æ\r)/Æ\Ö\ÕWYd/\'¿<\ã:¢¼\0\è(y\nÈ³?¹º©ĞˆË²\ÛI±(4Š1\ñ(G\ŞqCÊ‰q£u±²b\ò\ä\É~~\ä\Ô\å\Äx\0@G\ÉUh¬_Ÿ,~\à\ò¦B#.‹ëš¶—–£\Ğ(d\ï\r\r‹½³W0ºrRZŒ…\ì½\Ùf›7\n\È5¨#J‹\ñ\0€2\\¡±v\õ\ò\ä\éû/m*2\ê‰\ëb›\ì\í¤µ(4Z“µœ½\á«\ÉG\r7nH¹1n´Ì¸1\n†\Ô\å\Æx\0@G²\ĞX¿>\é_<\'yüs›Š‹lb›\Ø\Ö_IŠG¡Ñ’ú¤£>\Ù\Èş›Q\Ö\×\×\÷\îºu\ëš^¿R~j\ÏÃ‹µqc}\ö9bX\Ùq\"ûorRGT+\ê\0:\Ê`…\Æp\r*şJR<\nj’1\ÔåŒ‚y\óæ½¸bÅŠ¦×¯”ŸeË–]W7\Ì>Gl\ÒP\ã\ÃP—³	\êˆjE@G¬\Ğ\È\ó×¡·\ÍŞŸ\äBcD†›\\w=-š3g\ÎÁs\ç\Î}½¿¿ÿ+-\Æ&µŸ{ÿÒ¥K¯­\Ï\Õr`\ö9bHÃ\Ã]O†:¢ZQG\0\ĞQ+4²\Å\ÃH“½?\É…Fny\'y·c„b’Ù¯\å\íx\İJé‰Ÿ{üü5+\ò\Ë;\äİ.uD\Õ\ÏG\ö9€qk°BC\Æ.\n\\F:™\é\ö@\ç\é80\Ò\í\',uDµ¢]\Çs\Ìûzzz\ï\î\îş?µ¯}µ<[\Ë[\ñ©d¾Æ¿û6\\xlŸ½\0\nPhT+\naµ:‰h\õvÀø\×\êû¿\Õ\ÛM(\êˆjE1:z{{\÷\ï\é\é™Y\Ë\Ûšy\ÛÏŒ\Ûg\ï€(4ª…\Æ&<½=0ş}\ß½}\ÇSGT+\êˆbz{{w\ë\é\éY0H#¢•,ˆû\Ë>\0# Ğ¨V\ZC\Ê3iˆŸ]=C\És?@g\È\ó~7n¤¨V\Ô­9\æ˜c6\ë\î\îş^OOÏ»\Ù\ÆÃ™g™\\s\Í5\É\Ã?œ<\ó\Ì3ÉªU«’_\ã\ßqy\\\Ûeo\÷\÷\÷Ÿ}L`‚ªÿsşüù‡]}\õ\Õw]t\ÑE¯üı\ßÿıº“N:)|N<\ñ\Ä_}\ö\Ùkj—ı\â\â‹/ş\æ´iÓ¶\Î\Ş~¢QhT+\nA\å,\ä™x„¼\÷Œ_y\ß\çÆ‚\ÔÕŠ:b\äjs„­{{{\Ö\Øh˜:ujr\ÅW$/¼\ğBÚœ\È+¶\Û\Å\í3‹Ÿ\Æ\ãd˜@jc\Äfw\ÜqÇ¿şù¿œ>}zr\Ùe—%,´\Z—\Ç\õ\Çw\Ü;§vÚ’\ã?şg\ïo¢PhT+\n&#™$\äx„‘\Ü/0¾Œ\äım\Ü(HQ­¨#F¦··\÷Õ²¼±¹p\É%—$\Ï?ÿüÆˆŠ\Û\Çıdš\Ï\Ç\ãe\÷˜\0,Xp\Ê\Å_¼.–bÍŸ??y\çw²\ãÆ b»\Øş\ô\ÓOÿ\Õ\É\'ŸüHww\÷Ÿd\ï»\Ó)4ª…\ÆFF:9\É\Ä#Œ\ôş\ê\éûÚ¸Q:¢ZQG\ä·ae\Å@³\"VEÌš5+;]($\î/³\Ú\ây+-`©ÿ\ã\Î;\ï¼\æ„NHn»\í¶\ä×¿şuvœ\È%n·?\æ˜cŞ˜hg\õUhT+\n­L\nF:\ñ­<PM­¼Ÿ©#ªuD>qN‰\Æ\Ã@¦M›–<ú\è£\Ù)Â¨ˆûûohZü\Ô9-`¨½ÿÿ\ÇÌ™3ÿ\ïI\'”üü\ç?Ï\r-‰û™>}ú[S§N=.ûxJ¡Q­(4R­NZ™x„V¨V\ß\ÇÆ‚\ÔÕŠ:\"Ÿ\r\'\ØXYÑ®fE]\Ü\ãJ‹xü\ì>&VVœx\â‰ÉŠ+²cB!qÓ¦M[;eÊ”\Ïe³)4ª…F¡I@«P\äq±U\äık\Ü(HQ­¨#†·\á£Kß©7n¹\å–\ìt -\âq\ZVY¼\ã#O¡ƒ=\ğÀ§D³b´VVd\Õ\î\÷\İ/|\á«\'Oü±\ìcw\Z…Fµ2Á¢\Å‘‰G(úø@ùŠ¾o©#ª•	^G\ä\Ò\ÓÓ³ \Ş8ˆc–)s\"\Î\Ù}:@\í½¾\Ù×¾\öµuqÎ‰vºù\æ›WO:\õ\ì\ãw\Z…Fµ2\Ñ(ú‹N<\Âh\ìP\Ñx¿\Z7\nRGT+¸\È%VP7\nR\ô\Ó@F*¯\ñĞ‰²¢&”\Ûo¿ıŠø4VO°™W\Üÿ\ô\é\ÓW\Ö’}²û\ĞI\Z\Õ\Ê-4F«\Ø‰G­ı\Úg´Ş§Æ‚\Ô\Õ\Ê­#r\ë\é\é™Yo\\q\Å\Ù\ò¿\ñ¸\r«,ff\÷\Çj\ï\ñÿy\Şy\çı2>Š´\÷\İw\ßkµ\ä\Ç\Ùı\è$\nje\Z£Y\ä\Ö\Ä#Œ\æ~£k4ßŸÆ‚\Ô\Õ\Ê¬#r›:u\êûkuı\Û\õfAÙ«+\ê\âq\Zo\Ç~e\÷§x\àC?şø\äw\ŞÉ¾\÷\Û\"\çˆ#xm\ò\ä\É\Î\îK\Õ\ÕÀ{j™”½<K¡Q­Œ\ÇB#\ïkm£]Ü\æ\Ä#Œ\öşÅ\öûÒ¸1„¼c»:¢Zu\Äh\È\óz­]x½Q«µ\ÇR<~C\Ó\â\ğ\ì¾\ã\ÔUW]5û²\Ë.Ë¾\ç\Ûê¢‹.Z\Ø\İ\İ}Rv_ª®a\Ü\ä\0®Ğ¨V\Æc¡‘\÷µ–Ñ¢~´\'¡û	´¦\ïG\ã\Æ\ò\í\êˆje<\Ö£!\Ï\ëµvù¥\õ\í~\ô£eKşR\Å\ã7\ì\ó¥\Ù}Æ©‹/¾xeY‡ƒ\Ô\İ}\÷İ‹z\Æ\á\ñe\rƒ\à&p…Fµ2¼¯µ\í*\æ\Û1\ñ\í\Ú_ ¿v½C\È;¶«#ª•\ñXGŒ†<¯\×\Ş\Ş\Ş9\õ\ë\ò“ŸdKşR\Å\ã\×\÷%\ö«q?q\ìœs\ÎY·dÉ’\ì{¾­zê©¥µÁ\ä¡\ì¾T\İ \÷ ¸B£Z…\Æ ¯±A_k´³ˆo\×\Ä#´s¿Mk\çûÏ¸1„A\Æ\ôA\ÇvuDµ2\ëˆ\Ñ0\È\ë´\é\õZûú\\ı\ò²\çY\ñø\rûø\\\æ¿ŒW\'xâ»¯¾új\ö=\ßV«V­Z[H–g\÷¥\ê°³I\ğ*\Z\÷\Ş{o²fÍš¦Ë‡\Ê#<’¼şú\ëM—g\';zúé§›.¯B\Æc¡1\Èk+›\ôµÖ•¯xoœ<ŒU†²w\×\ğûŒ®<\ï»\ì{x,2”½»†\ßÿJ\Zd,\Ï&Û«VG4\Öo¾ùf\ò³Ÿı¬i›z¢X¹re\Ó\å\ëÖ­kºl¼d<\Ö£a\×g6\ñz}³ş\ï²\çY\ñø\õ}\é\í\í]“ıÿ\0\ã\ÔQG•ü\êW¿Ê¾\çÛª\öxk\ô:&U*4\Şzë­ş½\Ûn»%\×^{múıo¼±\Ñu\ßÿş\÷“o}\ë[]v\Şyç¥Ÿmß¿\ò\Ê+M\÷_\Ï]wİ•¼\ç=\ïI,X\Ğt\İX\'ûütJ&Oœl¶\ÙfQD}_gd\'c‘M‰ı\É\Çog¯\0F]¼\Ï\âı6\îÇ\ì˜\Øi\Éş.Ëœşù\É7¿ù\Í\ôû[o½5\Ùv\Ûm“^x¡i»\ÈI\'”v\ØaÉwŞ™L›6m ÿøÇ“…6m\rhr\ô\÷\÷otù\Ã?Ü´\íX%û\Ü\È\à){>‘ß°?¿\Î\ZÀ8u\Â	\'üª\ì\èÊ•+\Ñ\ÓY+,\î\é©\èR\Îø+\È^{\í•\Ä\'ÁDş\èş(-$\âûı\ö\Û/™>}úÀ¶\ñ‘\ßú­\ßJ\âœ&_ü\â\Óm>ı\éO\'»\ì²Kº\İ[l‘\\u\ÕUM‰¦\ö_OWZd¯\ëŒÇ¿Œ\ò\Z\ôµÖ•\ï/\ÙIÀXd({w\r¿ÿÀ\è\Ê\ó¾Ë¾‡\Ç\"CÙ»køı¯¤A\Æ\ôA\Ç\ö*\Õ‘\åË—\'\ï}\ï{\Óšû·›Ì™3§\é\"‘—^z)\Ùzë­“eË–¥‰\Û\Å\åQOœz\ê©\ÛEQ¯K¢FùÔ§>•\ì´\ÓN—Eş\àş 25\Åx¬#F\Ã ¯Ó¦\×k¬d¨_^\ö|\"\Ë\n\èPguÖš²9{\â‰\'~\Ò\Ó\ç°Ø¨À¨«R¡±hÑ¢d»\í¶øw>ø`úı7¾\ñ\ä+_ù\ÊF\Ûÿ\÷ÿwú\õ_ş\å_Ò¿ˆD³b\çwN›{\ì±Ç‡“\\y\å•É–[n™®´\È^7\Ö…F\Ş\×\Ú\í,\Ş\óLZ\Õ\Îı6­\ï?\ã\Æ\ò\íUª#b\å\åG‘|\âŸH;\î¸\ä\ÃşpúGŒvØ¡i\å\å±\Ç›\\}\õ\Õ\é§5l³\Í6éŠŠş\ğ‡\É\ïş\î\ï&?ı\éO7\Ú6Vhz\è¡É¼y\ó\Ò\í\â~¿\ğ…/$\ïÿû\Óú\ãÿø›\öe¬2\ëˆÑ\ç\õ\Ú\ã@»{\î¹O—ı)!7\Şxã¬\ñı)!Mv£*\Z±\Ì\ò\÷~\ï\÷–dş\áşar\ğÁ§\ß\Ç\ê‰8\ä#¶‹•\ñhn\\x\á…Ñ™N¦L™2Ğ°ˆ\íÿ\ì\Ïş,\İ&û‘ü\Ç\Ü\èşª”\ñXh\ä}­5hWß®‰G»\öÈ¯]\ïC\ã\Æ\ò\íUª#\âgŸ}\öF—=\ñ\ÄiM\ĞxY\Ôq˜\â\ç>\÷¹d«­¶J?±\á\ÒK/M&Mš”\ÜÿıÉ{\î™y\ä‘\É\êÕ«n\r‹X­«A\÷\ßÿ\ô\\\Ûo¿}z\İG?úÑ¦}«Œ\Ç:b4\äy½ú” \í.º\è¢o^v\Ùe\Ù\÷|[zê©·uwwŸ”İ—ª\ÛÔ€İ¨J…\Æ3\Ï<³\É\õC¬œxùå—“\ßÿı\ßO¿¿\Ä9\êK3£\0¹øâ‹›î¿(:\âú¿ø‹¿hºn¬3¼¯µŒv\ó\í˜x´c?Ö´\ãıh\ÜBŞ±½JuÄ·¿ı\íAqG\ãeQC\ô\õ\õ¥\àˆF\Å\ÑG\÷¢~\èHœ7k\ß}\÷M\î¸\ã\ä\ñ\ÇO=saÄ¹-¢ù‡¬6®°øĞ‡>Ô´/c•\ñXGŒ†<¯\×\Ú\õ—Ö›±²f,\Å\ã\×\÷%\ö+»¯À8Uû¥°\õ\ô\é\Óß©É¾\ïÛ¢\ö8/\Õ‘•µ\É\ğ‡³û\Ò)ªTh\Ä\n‹M5,\Z	‰_\Åa\ñı7Ş˜|\ìcX™«\'bû\ìı\×oÇš>\ô\ĞC\éa#UúÿG&X¡1\ÚEıhO<F{ÿ€\âFû}i\Ü(¨J¿G¿ş\õ¯\';\î¸c\Ò\İİ\nÄˆ\ï\ã‘\Æ\íbu\ÄYg•B\Z«.\Ï<\óÌ\óaE\âüY\ñGúa$q~ŠC9$=$ä©§Jş\ã?şc£\ñÇ´ì¾ŒU&X1\"µšş\ğz“ \ó±t\Æg¼\ÛĞ°8<»¯À8v\Úi§=[\Öa!\×]wİjƒÈ³û\ĞIªTh<ùä“›<$\äœs\ÎØ¶Ş°ˆ\ãL\ã¯\ñ	2\õ\ë¢Y1T\Ã\â\ò\Ë/O>û\ÙÏ¦\ßÏ˜1#ıKIB-+°\Ğ\Í\â~4\'£¹_À\è\Z\Í\÷§q£ ª\Ô\ë×¯O~\ğƒ$_ş\ò—\Óß¥q˜h|<zœL\ó\Üs\ÏM¯¯oˆ8oEœ\ç\"š\ñ1¦Ñ”ˆ›Qsd\ï;R?‡Eœ 3š\ZqŒú\n‹|\ä#\éJŒ\ìm\Æ\"°\Èm\êÔ©\ï¯\Õ\õo\×ñœ…xÜ†f\ÅÛ±_\Ù}Æ±\Ú/‰ÿ}ú\é§ÿ\ê×¿şu\öı?ªj\÷ÿ|mY<eÊ”}²û\ĞIªRhD¢a\ÑøI +,n¸á†N’\Ë5\ãø\Ó\İw\ß=ù\Ïÿü\Ï\\+,\âG±¤³\ñ3\Ù\÷\ÙgŸ´i<Nu,3A\Ñ*\òGk\â1Zû´\Ïh½OU¥ˆU\ßù\Îw\ÒÕ“Ñ¸˜9sfZ\Ü|\ó\Í\éjŠX\r±x\ñ\âtÛ¨!\â_±\İgœ‘œr\Ê)i\Ó\"NºYoX¬]»v\à‘¨¢¶ˆ[ÿ\Ú×¾–~²H\ã\n‹8<µ*ü˜ uDnµ\Ú~f½Yp\ÅWd\ËÿR\Ä\ã64,\Æ\İy\ò€N=\õ\ÔGn»\í¶w³À(z\÷ŸÿùŸ¯¬\r\"·e»\ÓT¥\Ğ,Ñ°X°`A\Ó\å‘(6\ß|\ó´\àˆCB\ê+,\âPX\æ\'\Şj\Ü>>$Š\ìÿ7\Îüe‰feo3™À…\Æhû£1\ñı\0\Ê1\Z\ïW\ãFA\Ùß«c‘8Vü?|Ä‰3ceEıº8œ4\ö1©ÿÁ\"ş‡ \Öj½XM;p(Hœ·\"\ÎS\ß\ÇD\â\Ü·\ß~{\òÁ~0m†|ÿû\ßø\ãH\ã9,v\İu\×ä ƒJWf\÷­\ìL\à:\"—)S¦|®\Ş,˜:uj\é«,\â\ñz{{‰ı\É\î#\Ğ&Oü±\Ú/ˆµ?ÿùÏ³\ãÀ¨¨ı¢»ª6ˆ\ô\Ç\ãd»\ÓT¡\Ğ*p@\òè£6]^OG\Z_\ãĞø‡H¿ÿ\Ş\÷¾—\\+N²U\ß.ş\'Ÿ|rZ\Ğd\ï#Íø¥gÿ\Î^Wv&x¡Q´\è/:\ñ(úø@ùŠ¾oU­ˆ\ß\÷qHi40\"qø\è`\ç˜h<D$şx‘½¾1q’\Îø\Z+)V®\\\Ùt}•2Á\ëˆ\\j5ş‚z\Ã\à’K.\ÉN\Ú*¯auÅ‚\ì¾¤··wÿc=\ö­+VdÇ‚B–.]zKm\0yq¢t<«Vh4&–gf/,y·Qh*ş‹L<Š<.0¶Š¼U¹˜ˆQG¯6‡Ø­V\ë¿So\Ür\Ë-\Ù\é@[\Ä\ã44+Ş‰ı\È\î\Ğa¦NzÜ´i\ÓÖŒ\ÖJ‹\r++–\×rl\ö±:•B£ZQh¤Z´:\ñh\õ\ñ€\êh\õ}l\Ü(HQ­¨#\ò\é\î\îş^½y«lcEo;\Åı7\nŸ\İ\' C\ÅJˆ£:j\õ\Í7ß¼º\Õq\Æ	67œ³â¥‰²²¢N¡Q­(4´2he\â\Ñ\Ê\ã\0\Õ\Ô\ÊûÙ¸Q:¢ZQG\äs\Ì1\ÇlV«ûZo Ä¹H\ÚÕ´ˆû­=\ŞÀŠx\Üxü\ì>¬»»ûO¦Nz\ç\ô\é\ÓW\Şw\ß}¯½\ó\Î;Ù±bPµ\íV\\w\İu\×\ÔÅµ\Ü\÷“½\ïN§Ğ¨V\Z\é¤`¤‘\Ş?P}#}_7\nRGT+\êˆüjµÿÖµÄ§¬´˜5kVvºPH\Ü_\ãÊŠ\r·uv_€	\">‚´6\Ì;\âˆ#^¿\ğ\Â\ï\ë\ë[ø\ÔSO=\÷\Ê+¯¼Q3Ö¾ü\ò\ËK-Z\ô“›nº\é\æ\ÓN;\í\öÚ¶¯\Ä\öşÑ¥›¢Ğ¨V\ZMF29\É\Äc$\÷Œ/#y7\nRGT+êˆ‘\é\í\íı_M‹Hœ³è§‡\Ä\í3\'\ØL›\ñx\Ù}\0& É“\'¸6(œ\Ø\İ\İ=«\ö\õÁ†(¾>¸\á\òc»\ìm\'\Z…Fµ¢\ĞT\ŞIBŞ‰G\ŞûÆ¯¼\ïs\ãFA\êˆjE1r=ÿ¥\ÅÀ\á!‘Xmq\ÅW¤Ÿ 3±}\Ü.³ª\"=$\'û\Ø\0C¡Q­(4†”g²g\â‘\ç~€Î\çın\Ü(HQ­¨#Z\ç”\Øp\"\Îl£!9\ó\Ì3“k®¹&yøá‡“gy&YµjUÚœˆ¯\ñ\ï¸<®?\ãŒ3šn\÷\÷\ëœ\0-RhT+\nM*:i(z{`ü)ú¾/zû§¨V\Ô\Ålø\È\Óƒ4Z\É]\nPB£ZQh«\Õ\ÉC«·Æ¿V\ßÿ­\ŞnBQGT+\êˆ\Ñ\Ñ\ÛÛ»OO\Ï\ÌZ\Ş¤±©\Ä\ö3\ã\ö\Ùû \njE¡‘\ËH\'#\İ\è<#Fºı„¥¨V\Ô£\ë˜cy_OO\Ï\á\İ\İ\İÿ§\öµ¯–gkykCs\"¾Æ¿û6\\xlŸ½\0\nPhT+\n\Ü\òN&\òn\Ç$I\ò›K–,¹~şüù¿\ì\ë\ëK_·Rnj?\÷w\çÍ›\÷\âœ9s\Î>?)\ïxw;º\ÔUK<\Ù\ç\0\Æ-…Fµ¢\Ğ‘\á&\Ã]O‹–,Y2£6YNV¬X‘¬[·®\éu,\íOü\Ü\ã\ç?w\î\Ü\×k\ãÆ\Ù\çˆ!\r7.w=\êˆjE@GQhT+\njr1\ÔåŒ‚XY“\å\ì\ëW\ÊOÿ+µq\ãÁ\ìs\Ä&\r5>u9› ¨V\Ô\0t…Fµ¢\ĞhIv’‘ı7£,±²¢\Z‰\ç¡6n¬\Ï>G+;NdÿMN\êˆjE@GQhT+\n–\Õ\'goøj\Ò\ÑFÆjÅ¸\Ñ2\ã\Æ(0T+\Æ\0:ŠB£ZQh²wœµ;¾f¯`t\å7\Şx­?Y\òĞ•É¢»¿š&¾Ë²\ÛI±7Z\÷\ñüŒ\Í6\ÛÌ¸Q@\Ş\ñ@Ê‰\ñ\0€¢Ğ¨V\Z\ÅlhX\ĞfyÆµ«—\'\ï<?ùÙ­_\Ú(qY\\—\İ^Zq£uµ1\ãÉ“\'ûùg<\òb<\0 £(4ª…F1\Z\å\È3n<¿hVS³¢\İÒ´½´\ãFkj\ãÅ¤36dR\öz\ò\É3Hy1\0\ĞQ\ZÕŠB£\r‹r\ä7¼ç’¦FE=q]v{i=Æ\Ö\ÄêŠ††\Å=\Ù\ë\É\'\Ïx \å\Åx\0@GQhT+\nb4,Ê‘g\ÜX8ûÂ¦FE=q]v{i=Æ‘Ë¬®°Ê¢€<ã”\ã\0E¡Q­(4ŠÑ°(GqCÃ¢¼7F.³º\Â*‹\òŒR^Œ\0t…Fµ¢\Ğ(FÃ¢yÆøTl£¢¸.»½´\ã\Æ\È±º\Â*‹\å¤¼\0\è(\njE¡QŒ†E9\òŒ‹\ïÿnS£¢¸.»½´\ã\Æ\È±º\Â*‹\å¤¼\0\è(\njE¡QŒ†E9\òŒ«–?–,¼ë‚¦fE\\\×e·—\Öc\Ü\È/VPÒ¤\ÈfR\öv-\Ïx \å\Åx\0@GQhT+\nb4,Ê‘w\Üx\ö\'W75,\â²\ìvR,Æüb\Å \rŠl¬²¼ã”\ã\0E¡Q­(4ŠÑ°(G®qcıúd\ñ—75,â²¸®i{i9ÆbŒ\Å\ä\Z¤´\0\è(\njE¡QŒ‰G9†7Ö®^<}ÿ¥MÍŠz\âº\Ø&{;i-ÆbŒ\Å7H¹1\0\ĞQúúú\Ş]·n]\Ó/<)?µ\ç\á\ÅZ¡±>û‘Ÿ‰G9†œ ¬_Ÿ\ô/“<~Ç¹MMŠlb›\Ø\Öj‹\â1A)Æ¸QŒ:¢:QG\0\Ğq\æÍ›\÷\âŠ+š~\éIùY¶l\ÙuµB\ãÁ\ìsD~&\å¬a1ÜªŠ¡bµE\ñhXc\Ü(FQ¨#\0\è8s\æ\Ì9x\îÜ¹¯\÷\÷\÷¿\â/$c“\ÚÏ½\éÒ¥\×ÖŠŒ\çj90û‘Ÿ‰G9kX\äYU1T\â¶\Ùû“üÑ°(Æ¸QŒ:bì£\0 £\Å/·\è\È\×\òv¾Rz\â\ç?EFA&\åˆ\×m¶`\Î6!Fš\ìıIş\Ä\ó‘}\ÈÏ¸Q\\üş\Ú\ğ{L16QG\0\0T‰G9¢@\ÎNše\ì\ÏG\ö9\"?\ã\0\0\Ğv&\åĞ°¨V4,Š1n\0\0\0mg\âQ\r‹jEÃ¢\ã\0\0\Ğv&\åĞ°¨V4,Š1n\0\0\0mg\âQ\r‹jEÃ¢\ã\0\0\Ğv&\åĞ°¨V4,Š1n\0\0\0mg\âQ\r‹jEÃ¢\ã\0\0\Ğv&\åĞ°¨V4,Š1n\0\0\0mg\âQ\r‹jEÃ¢\ã\0\0\Ğv&\åĞ°¨V4,Š1n\0\0\0mg\âQ\r‹jEÃ¢\ã\0\0\Ğv&\åĞ°¨V4,Š1n\0\0\0mg\âQ\r‹jEÃ¢\ã\0\0\Ğv&\åĞ°¨V4,Š1n\0\0\0mg\âQL\í\çwO-“²—giXT+\Z\Å7\0\0€¶3\ñ(&~~²\ÉÆ…†Eµ¢aQŒq\0\0h;b\Z\Z›l\\hXT+\Z\Å7\0\0€¶3\ñ(f†Å \r‹jEÃ¢\ã\0\0\Ğv&\ÅÒ¨\È&m\\ŒU\Ã\â\ÕW_\İ\è\ß\Ï<\óL\ò\ÒK/5m—Íƒ>\ØtY6k×®M.\\8\ğ\ï5k\Ö$o¾ùfúıú\õ\ë7\Ú\ö±\ÇKV¯^\İt‘·\Şz«\é²vGÃ¢\ã\0\0\ĞvƒL°¥M\ÉNš\Ë\È!‡’|\õ«_M¿\íµ×’_ü\â\É6\Ûl“¼ø\â‹C6\nx\â‰\ä=\ïyOr\İu\×5]×˜¸ı.»\ì’\Üu\×]\Éë¯¿,Y²$ı\÷´iÓ’ı\ö\Û/9ÿü\ó\Ó\í¢y±`Á‚d\Ûm·Mz\è¡ä¬³\ÎJ?şø4GqD²ë®»¦Í\ìı·3\Ù\çFF\ìX\0\0@…d\'q\r¹§gŒ	Yºti\òÑ~4]UÍ…w\Ü1m\Ôv\'\é\í\íM\ö\İw\ß\äœs\Îiº\İ\ßü\Íß¤M‡8 mrd¯\æ\Ä\ÙgŸ\Ş\×\'?ù\Éd\çwNv\Úi§\ä\ô\ÓOO¶\ß~ût›\İv\Û-™?~úıŒ3\Òû›2eJr\Ë-·$ııı\éêŒ¸nÎœ9É{\î\Ù\ô\í\0\0\0t´\á\ZucÑ°8é¤“’ÿú¯ÿJW1D#\á\ĞC¸.\Z“&MJ\î½\÷Şns\á…&\õW•¬[·.½\í{ì‘®¸\È\Ş\÷s\Ï=—6 \Şx\ãd\æÌ™i³bÙ²e\é\ã\Ä\×\Ïş\ó\Û\Şp\Ã\r\Éşû\ï?p¸Hc¢a±\×^{5]\Ş\îhX\0\0\0\ĞÑ†kTÔ•İ°ˆ&Á\ïü\Î\ï$\Çw\\º²\"š‡bÄªˆh2Ô·U\'œpBú©¯~ˆ\\~ù\åÉ–[n™6=fÍšµ\Ñcy\ä‘\Ée—]–>F|CB¢aqé¥—&·\ß~ûÀv7\İt\ÓF\rŒ\ÆhX\0\0\0@×¨¨+»a±jÕª\ä\ßÿı\ß\Ó\Ã>\î¿ÿş\ô²—_~y£C<buD*\Ò\××—®¾8\ï¼\ó\Z\Z\õlµ\ÕV\É\ßı\İ\ß%x`\òoÿ\öo\é\íbUÆ±\Ç›6Bâ°‘\Ø&\Z\Ñ\ØøÀ><şø\ã\É\äÉ“\'\Z\Z\0\0\0PAe7,â‹.º(9\å”S’;\ï¼3m:\Äy$\Z\'\È<úè£“•+W¦·¹û\î»Ó•\ÛDC\â\ÔSOmºÿk®¹&9è ƒÒ¦\Æ\ô\éÓ“v\Ø!Y¼x\ñÀ9,\â\ò8T$¾\óVhX\0\0\0@•İ°xúé§“\ßş\í\ßN\Ïq\ÅW¤Í„ü\à\é¹\'bE\Äm·\İ\Öt›ÿø\Ç\É>û\ì³\ÑeqN‹Hv\Ûhn\ÔÏ‰\ç¸\Ø}\÷İ“\åË—\'[o½uú\õ\ä“ON.¸\à‚\ôz+,\0\0\0 ¢\ÊnXD\â¼\ñ\õ©§J\î¹ç´Q«\â\ë¿şë¿¦‡‹Ô·‰Ä¡#ƒ5,.¾ø\â¦û\ÃH\âcJc%Ewww\ò™\Ï|&mTl¾ù\æ\é\É<·\Øb‹\ô#Lc[\r\0\0\0¨¨²‹-Jşú¯ÿ:9\ì°Ã’/ù\Ë\Év\Ûm—®°ˆ•\ï{\ßû’5kÖ¤‡z4k\"VX|\ğƒ\Üè8D¤¾R¢1qR\Íøh\Ôø>VXD\Ó\"\ZqHHœ\'ã¥—^\Z\Ø\ö\ÆoL-i¼}|bH¬ÂˆÇ\ÆI\öş\Û\r\0\0\0\è*¿ay\ä‘GÒ¯\ßı\îwÓ•O>ùdr\ğÁ\Ê\ç®h<4$\ö\ñ‹_ü\âF\÷\ñ\ío;=_E\ö¾\ãq\Ò\Îø>Î—_£a\çµ\Èn{ı\õ×§Ÿ@’½ü…^HÏ£1cÆŒ¦\ë\Ú\r\0\0\0\è\Z›†\ÅHŸ’½l$‰\Æ\Åú\õ\ë½<{Y=ƒm_F4,\0\0\0 k|4,&R4,\0\0\0 KÃ¢jÑ°\0\0\0€.\r‹ªE\Ã\0\0\0º4,ª\r\0\0\0\èÒ°¨Z4,\0\0\0 KÃ¢jÑ°\0\0\0€.\r‹ªE\Ã\0\0\0º4,ª\r\0\0\0\èÒ°¨Z4,\0\0\0 KÃ¢jÑ°\0\0\0€.\r‹ªE\Ã\0\0\0º4,ª\r\0\0\0\èÒ°¨Z4,\0\0\0 KÃ¢jÑ°\0\0\0€.\r‹ªE\Ã\0\0\0º4,ª\r\0\0\0\èÒ°¨Z4,\0\0\0 KÃ¢jÑ°\0\0\0€.\r‹ªE\Ã\0\0\0º4,ª\r\0\0\0\èÒ°¨Z4,\0\0\0 KÃ¢jÑ°\0\0\0€.\r‹ªE\Ã\0\0\0º4,ª\r\0\0\0\èÒ°¨Z4,\0\0\0 KÃ¢jÑ°\0\0\0€š¾¾¾w×­[\×4q–\òS{^œ={\öú\ìs\0\0\0Î¼y\ó^\\±bE\Ó\äY\ÊÏ²eË®›={\öƒ\Ù\ç\0\0\0&œ9s\æ<w\î\Ü\×ûûû_±\ÒblRû¹\÷/]º\ô\ÚÙ³g?WË\Ù\ç\0\0\0&¤˜$\Ç_\öky;Î¡ ¥\'~\î\ñ\ó×¬\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0`bùi¶\ô\èt*	\0\0\0\0IEND®B`‚',1),('1820703328734482434',1,'è¯·å‡æµç¨‹ï¼ˆåŒ…å®¹ç½‘å…³ï¼‰-leave4.bpmn20.xml','1820703328734482433',_binary '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:bioc=\"http://bpmn.io/schema/bpmn/biocolor/1.0\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:di=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"leave4\" name=\"è¯·å‡æµç¨‹ï¼ˆåŒ…å®¹ç½‘å…³ï¼‰\">\n    <startEvent id=\"startNode1\" name=\"å¼€å§‹\">\n      <outgoing>Flow_14qet78</outgoing>\n    </startEvent>\n    <userTask id=\"Activity_0uscrk3\" name=\"ç”³è¯·äºº\" flowable:formKey=\"static:1\">\n      <incoming>Flow_14qet78</incoming>\n      <outgoing>Flow_171lpw3</outgoing>\n    </userTask>\n    <sequenceFlow id=\"Flow_14qet78\" sourceRef=\"startNode1\" targetRef=\"Activity_0uscrk3\" />\n    <userTask id=\"Activity_0ped7fd\" name=\"ç§‘ç ”éƒ¨é—¨\" flowable:candidateUsers=\"1,3\">\n      <extensionElements />\n      <incoming>Flow_16qxdzv</incoming>\n      <outgoing>Flow_01rdmuq</outgoing>\n    </userTask>\n    <userTask id=\"Activity_1e8dxc6\" name=\"æ€»ç»ç†\" flowable:candidateUsers=\"1\">\n      <extensionElements />\n      <incoming>Flow_0rt1gbx</incoming>\n      <outgoing>Flow_01maojf</outgoing>\n    </userTask>\n    <userTask id=\"Activity_0xun74h\" name=\"ç»¼åˆéƒ¨é—¨\" flowable:assignee=\"1\">\n      <extensionElements />\n      <incoming>Flow_15anuo0</incoming>\n      <outgoing>Flow_1j0t4se</outgoing>\n    </userTask>\n    <sequenceFlow id=\"Flow_171lpw3\" sourceRef=\"Activity_0uscrk3\" targetRef=\"Gateway_0qj0eur\" />\n    <sequenceFlow id=\"Flow_16qxdzv\" sourceRef=\"Gateway_0qj0eur\" targetRef=\"Activity_0ped7fd\" />\n    <sequenceFlow id=\"Flow_15anuo0\" sourceRef=\"Gateway_0qj0eur\" targetRef=\"Activity_0xun74h\">\n      <conditionExpression xsi:type=\"tFormalExpression\">${entity.leaveDays &gt; 2}</conditionExpression>\n    </sequenceFlow>\n    <endEvent id=\"Event_0k2b5e5\">\n      <incoming>Flow_01maojf</incoming>\n    </endEvent>\n    <sequenceFlow id=\"Flow_01maojf\" sourceRef=\"Activity_1e8dxc6\" targetRef=\"Event_0k2b5e5\" />\n    <sequenceFlow id=\"Flow_01rdmuq\" sourceRef=\"Activity_0ped7fd\" targetRef=\"Gateway_05y03rn\" />\n    <sequenceFlow id=\"Flow_1j0t4se\" sourceRef=\"Activity_0xun74h\" targetRef=\"Gateway_05y03rn\" />\n    <sequenceFlow id=\"Flow_0rt1gbx\" sourceRef=\"Gateway_05y03rn\" targetRef=\"Activity_1e8dxc6\" />\n    <inclusiveGateway id=\"Gateway_0qj0eur\">\n      <incoming>Flow_171lpw3</incoming>\n      <outgoing>Flow_16qxdzv</outgoing>\n      <outgoing>Flow_15anuo0</outgoing>\n    </inclusiveGateway>\n    <inclusiveGateway id=\"Gateway_05y03rn\">\n      <incoming>Flow_01rdmuq</incoming>\n      <incoming>Flow_1j0t4se</incoming>\n      <outgoing>Flow_0rt1gbx</outgoing>\n    </inclusiveGateway>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_flow\">\n    <bpmndi:BPMNPlane id=\"BPMNPlane_flow\" bpmnElement=\"leave4\">\n      <bpmndi:BPMNShape id=\"BPMNShape_startNode1\" bpmnElement=\"startNode1\" bioc:stroke=\"\">\n        <omgdc:Bounds x=\"235\" y=\"205\" width=\"30\" height=\"30\" />\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds x=\"238\" y=\"242\" width=\"22\" height=\"14\" />\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_0uscrk3_di\" bpmnElement=\"Activity_0uscrk3\">\n        <omgdc:Bounds x=\"320\" y=\"180\" width=\"100\" height=\"80\" />\n        <bpmndi:BPMNLabel />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_0ped7fd_di\" bpmnElement=\"Activity_0ped7fd\">\n        <omgdc:Bounds x=\"590\" y=\"120\" width=\"100\" height=\"80\" />\n        <bpmndi:BPMNLabel />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_1e8dxc6_di\" bpmnElement=\"Activity_1e8dxc6\">\n        <omgdc:Bounds x=\"850\" y=\"180\" width=\"100\" height=\"80\" />\n        <bpmndi:BPMNLabel />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_0xun74h_di\" bpmnElement=\"Activity_0xun74h\">\n        <omgdc:Bounds x=\"590\" y=\"240\" width=\"100\" height=\"80\" />\n        <bpmndi:BPMNLabel />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Event_0k2b5e5_di\" bpmnElement=\"Event_0k2b5e5\">\n        <omgdc:Bounds x=\"1022\" y=\"202\" width=\"36\" height=\"36\" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Gateway_041zo9p_di\" bpmnElement=\"Gateway_0qj0eur\">\n        <omgdc:Bounds x=\"475\" y=\"195\" width=\"50\" height=\"50\" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Gateway_1cyx391_di\" bpmnElement=\"Gateway_05y03rn\">\n        <omgdc:Bounds x=\"745\" y=\"195\" width=\"50\" height=\"50\" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge id=\"Flow_14qet78_di\" bpmnElement=\"Flow_14qet78\">\n        <di:waypoint x=\"265\" y=\"220\" />\n        <di:waypoint x=\"320\" y=\"220\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_171lpw3_di\" bpmnElement=\"Flow_171lpw3\">\n        <di:waypoint x=\"420\" y=\"220\" />\n        <di:waypoint x=\"475\" y=\"220\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_16qxdzv_di\" bpmnElement=\"Flow_16qxdzv\">\n        <di:waypoint x=\"500\" y=\"195\" />\n        <di:waypoint x=\"500\" y=\"160\" />\n        <di:waypoint x=\"590\" y=\"160\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_15anuo0_di\" bpmnElement=\"Flow_15anuo0\">\n        <di:waypoint x=\"500\" y=\"245\" />\n        <di:waypoint x=\"500\" y=\"280\" />\n        <di:waypoint x=\"590\" y=\"280\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_01maojf_di\" bpmnElement=\"Flow_01maojf\">\n        <di:waypoint x=\"950\" y=\"220\" />\n        <di:waypoint x=\"1022\" y=\"220\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_01rdmuq_di\" bpmnElement=\"Flow_01rdmuq\">\n        <di:waypoint x=\"690\" y=\"160\" />\n        <di:waypoint x=\"770\" y=\"160\" />\n        <di:waypoint x=\"770\" y=\"195\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_1j0t4se_di\" bpmnElement=\"Flow_1j0t4se\">\n        <di:waypoint x=\"690\" y=\"280\" />\n        <di:waypoint x=\"770\" y=\"280\" />\n        <di:waypoint x=\"770\" y=\"245\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_0rt1gbx_di\" bpmnElement=\"Flow_0rt1gbx\">\n        <di:waypoint x=\"795\" y=\"220\" />\n        <di:waypoint x=\"850\" y=\"220\" />\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('1820703329086803970',1,'è¯·å‡æµç¨‹ï¼ˆåŒ…å®¹ç½‘å…³ï¼‰-leave4.leave4.png','1820703328734482433',_binary '‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0,\0\0J\0\0\0Ö‡\Îp\0\01\ØIDATx^\í\İ”\\u}7şi}l\ÑRª¥Rÿ\Ñ>şy-E±ŸZ9\åOIv@ùÿ\ç¤V¡‚\Ø*­zŠbkùB)ùş•¿!!D y@A!! ,!„\0T¸\Ïı\\3›\Ù;³Ù»;;w\ïÎ¾^\ç¼\Ïn\î½sg²³\ó\İ\Ïı\Ì\÷Ş©\Õ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0**I’\ß[ºt\é\å,øÕœ9s’Ù³gK\ÉI\î¯ÍŸ?ÿÉ¹s\ç\î—~\0\0\0`BZºt\é\Ì\ô`9Y¹re²nİº\ä•W^‘’?\÷øùÏ›7\ïùÙ³g:ÿ\0\0À„3+\â`9-å§¯¯\ï™Ù³gß•\0\0\0`Â‰\Ó@Ì¬¨F\ây˜={\öúüs\0\0\0N\\C!\à,c—x>\ò\Ï\0\0\0L8E/>×—,½û\Âd\ñ-_\Î\ßÇ²üv\Ò^4,\0\0\0 V¬a±vÍŠd\ÑMg&?¿\îs\Ëb]~{y4,\0\0\0 V¬a\ñø\âkšš\õ<±øÚ¦\íe\äÑ°\0\0\0€Z±†Åƒ·\ÛÔ¨¨\'\Öå·—‘G\Ã\0\0\0j\Å\Z‹fŸ\ÕÔ¨¨\'\Öå·—‘G\Ã\0\0\0j\ZU‹†\0\0\0ÔŠ5,\âSA\òŠzb]~{y4,\0\0\0 V¬a±\äo75*\ê‰uù\íe\äÑ°\0\0\0€Z±†\Å\ê\÷%‹nşRS³\"–Åºü\ö2\òhX\0\0\0@­X\Ã\"\ò\èO.njXÄ²üv\Ò^4,\0\0\0 V°a±~}²\ä\Î\ï65,bY¬k\Ú^F\r\0\0\0¨\rİ°X»fE\ò\ğ\ç55+\ê‰u±Mşv2²hX\0\0\0@m\r‹\õë“¾%s“ûoüBS“\"Ÿ\Ø&¶5Û¢ıhX\0\0\0@­u\Ãb¨Yƒ\Ål‹\ö£a\0\0\0µ\Ö\r‹\"³*K\Ü6¿?)\r\0\0\0¨µnX\ä›\ÃM~R<\Z\0\0\0Pkİ°±‹†\0\0\0\Ô4,ª\r\0\0\0¨iXT-\Z\0\0\0PÓ°¨Z4,\0\0\0 ¦aQµhX\0\0\0@MÃ¢jÑ°\0\0\0€š†EÕ¢a\0\0\05\r‹ªE\Ã\0\0\0j\ZU‹†\0\0\0\Ô4,ª\r\0\0\0¨iXT-\Z\0\0\0PÓ°¨Z4,\0\0\0 ¦aQµhX\0\0\0@MÃ¢jÑ°\0\0\0 «\õ\ö\öŞšfR~y†Eµ¢a\0\0@W\ë\í\íM6d“\r‹jE\Ã\0\0€®\ÖĞ°\Ød\ãBÃ¢ZÑ°\0\0\0 «µhX´l\\hXT+\Z\0\0\0tµŠ|²\Æ\ÅX7,}\ö\Ùÿ¾\ó\Î;“\õ\ë\×7my\á…š–-Z´¨i\ÙÚµk,Û½\ô\ÒK\Ù\÷ù}\ßw\ß}Éš5kš\öyùå—›–u:\Z\0\0\0\×\â\0[:”üAs§Mƒ{\ï½7ù\â¿˜¼\éMoJn¿ı\öşuù\ÈG’/¼0û~Ş¼y\ÉQG•\åCI^ÿú\×\'û\ì³O2}ú\ôş¼ı\íoO\Î;\ï¼ûF\ÃN;\í”\Ü|\ó\Í\É\ó\Ï?Ÿ,]º4ûwl¿\÷\Ş{\'gyfÿ\ãX¸pa²\í¶\Û&w\ß}wrê©§\ö\ß\ßÁœ\ì¼\ó\Î-›$Lş¹‘\á\'?–\0\0\0Œ*\í\É\Ä5\ä\Ö\Ş1<%\ä\É\'ŸL=\ö\Ø\ä˜cI\Şû\Ş\÷&w\ÜqG²`Á‚¬YÍ…]v\Ù%›\õP\ßş±\ÇK\Ş\ò–·\ô\Ï\ÄXµjU²\ÕV[e\ß\èCÊš\õm\ã\ö§vZ\ÖpøÀ>­\ßq\Ç““N:)\Ùn»\í²mbÿq\ñıÌ™3³&Æ”)S’k¯½6\é\ë\ë\ËfgÄº¹s\ç&»\ï¾{\Ó\ã\ïtÌ°hq\0\0\è8\íªQQWvÃ¢‡~8ùË¿üË¬\É3b\ÅW¿ú\Õ\äcûØ€†Åƒ>˜-‹\ï×­[—}¬a‰G4 ^|\ñ\ÅdÖ¬YY³bù\ò\åY\Ã\"¾~\êSŸ\ê\ß\öŠ+®\Èfl\ÔOiL4,\ö\Øc¦å†E{Œ\0\0@\Ç9\ğh\ÏPŠº²7\İtS6«a\ò\ä\É\ÙÌ‰˜q\ò\É\'\'Ë–-Kx\àlVCc\Ã\â[\ßúV\òş\÷¿?9è ƒ²\ÛÄ²Æ†Å’%K²\æD\ã}D\ó\ãü\ó\ÏO<\ò\È\ìk45¢a§\Üp\Ã\rı\Û]u\ÕU\ZÑ°ŸŒ\0\0@\Ç9\ğh\ÏPŠº²1›bÅŠ\É7¾\ñ\ì\Ú\Ñpˆ\Åşû\ïŸÍˆ†E\\ß¢¾ı?øÁ¬©\ğ\Ãş0y\Ï{Ş“\î\ñ†7¼!û\Z\rhZL›6-\Û\ïm·İ–q\Ä\É;\ì|\ò“Ÿ\Ì\Z\ñ{´\å–[f\Û\ŞÿııM\È5\×\\£a\ÑeŒ\0\0@\Ç9\ğ(G\Ù\r‹\ÈÊ•+³‹en³\Í6\É\Ö[o5.º\è¢\ä{\î\ÉN\Ùs\Ï=“C=4¹şú\ë“\İvÛ­¿a×¾ˆG4.b?1;#ff4\îû’K.I\ö\İwß¬¡1cÆŒdû\í·\ÏnS¿†E,SE\âû¸n…†Ew1n\0\0\0\çÀ£cÑ°ˆ_û\Ú×²\æ\Ä\ç>\÷¹\ìt˜qü\ñ\ÇgMŒh(\Ä\Å/¯»\îº\ì“B\ê\r‹XŸ(Ro2D\Ã\"®KÑ¸\ï[n¹%9\à€²\ï\ã“]w\İ5›\Ñ‘øz\Üq\Ç%_úÒ—²\õfXt\ã\0\0\Ğq<\ÊQv\Ã\â\â‹/N~\ô£eÍ„ø\Óø\ôÕ«W\÷¯\ÏJÈwŞ™¼\ó\ïL>ş\ñg3,;\ì°\ä\ÒK/\Í\Öı\Å_üE\òè£\Øÿœ9s²SMb&EOOO\òÑ~4kTl¾ù\æÉ¤I“’-¶\Ø\"û\Ó\ØVÃ¢û7\0\0€s\àQ²\õ,Z´(»şD~y41\âÔú¿\ãº1\ã\æ›oN<\ğÀ\ìš\õO‰\ë[Ä§ˆ4\Ş>.ª9u\ê\Ô\ìûhŠD\Ó\"\ZqJ\Ès\Ï=—<\õ\ÔSı\Û^y\å•Ùµ.\ZoŸ³0\âZ{\íµW\Ó\ã\ët4,\Úc\Ü\0\0\0:ÎG9Æ²a×©\È/ÿ\Ä\'>1 	³/\âS@.¼\ğ\Â\äŸÿùŸ“—_~¹\İ~û\í\×\ô±¦O?ıtÿ§†\ÔÑ°ˆ\ëZ\ä\ï\ë\ò\Ë/O>ú\è¦\åO<\ñD²\ÓN;%3g\ÎlZ\×\éhX´Ç¸\0\0tœrŒU\Ãb°Ô›£™\Øg|ŠH«\åùe\õ´Ú¾ŒhX´Ç¸\0\0tœrT­a1Ñ£a\Ñ\ã\0\0\Ğq<Ê¡aQ­hX´Ç¸\0\0tœrhXT+\Z\í1n\0\0\0\çÀ£\ZÕŠ†E{Œ\0\0@\Ç9\ğ(‡†Eµ¢a\Ñ\ã\0\0\Ğq<Ê¡aQ­hX´Ç¸\0\0tœrhXT+\Z\í1n\0\0\0\çÀ£\ZÕŠ†E{Œ\0\0@\Ç9\ğ(‡†Eµ¢a\Ñ\ã\0@E%I\ò{K—.½|Á‚¿š3gNVøJ¹I\î¯ÍŸ?ÿÉ¹s\ç\î—~\åˆ\ß\ÛüA³Œ]\âù\È?Gg\Üh:bì£\0 k¥E\Æ\Ì\ô\\²r\å\ÊdİºuM…°t>\ñsŸÿ¼y\óOO\çŸ#Šs\àQ(\ó¿\Ç2v‰\ç#ÿQœq£=êˆ±:€®\ïˆ\Ä¹ü?)?}}}Ï¤…\Æ]ù\çˆ\âx”CÃ¢ZÑ°hq£=\êˆ\êD@×‰\é›\Ş©F\âyH\õù\çˆ\âx”CÃ¢ZÑ°hq£=\êˆ\êD@\×q\àQ­8\ğhr7ª\ãF{Œ\í1T+\Æ\0ºJ\ÑB\ã\Å\çú’¥w_˜,¾\å\ËY\âûX–\ßNÚ‹B£=<\ÊQtÜrb\Ü(.#nqbˆÜš¿ƒ+:¨#Ê‰\ñ\0€®R¤\ĞX»fE²\è¦3“Ÿ_\÷¹‰e±.¿½Œ<\n\öhX”£È¸!\åÅ¸Q\\:FLjÑ \ÈgRşv®\Èx (/\Æ\0ºJ‘B\ã\ñ\Å\×4\õ<±øÚ¦\íe\äQh´GÃ¢E\Æ\r)/Æ\á‰-šfWŒP‘\ñ@Q^Œ\0t•\"…Æƒ·\ÛT`\Ô\ë\ò\Û\ËÈ£\Ğh†E9ŠŒR^Œ\Ã3(Z4*Ì®¡\"\ã:¢¼\0\è*E\nE³\Ïj*0\ê‰uù\íe\äQh´GÃ¢E\Æ\r)/Æá‹™-šfWŒ@‘\ñ@Q^Œ\0t…Fµ¢\Ğh†E9ŠŒR^Œ\Ã7\È,‹Iù\íZ‘\ñ@Q^Œ\0t•\"…F\\\Í;_`\Ô\ë\ò\Û\ËÈ£\Ğh†E9ŠŒR^Œ#“›eav\Å\Ô\å\Åx\0@W)Rh,¹\ã\ÛMF=±.¿½Œ<\n\öhX”£È¸!\åÅ¸12¹Y“\ò\ë)¦\Èx (/\Æ\0ºJ‘Bc\õŠû’E7©©Èˆe±.¿½Œ<\n\öhX”£È¸!\åÅ¸1r\õYù\åWd<PG”\ã\0]¥H¡y\ô\'7\Z±,¿´…F{x”£\è¸!\åÄ¸1r1³b\ò\ä\É~~m(:¨#Ê‰\ñ\0€®R¨\ĞX¿>Yr\çw›\nXëš¶—G¡Ñ–ohX|<¿‚\ÑUhÜ\Òb\Üh\Ë\Ç7\Ûl3\ãF\n\êˆ\Òb<\0 «Uh¬]³\"yøóšŠŒzb]l“¿Œ,\n‹ƒ•iN\Û\ğ\ÕÁG\r5nH¹1nŒ˜qc5¨#Ê\ñ\0€®2h¡±~}Ò·dnrÿ_h*.\ò‰mb[ï’´…Æˆ\Ô:\êù3\Ê\æÌ™\óÚºu\ëš~¥ü¤\ÏÃ“é¸±>ÿ1¤ü8‘ÿ7©#ªu\0]¥U¡1Ô»!ƒÅ»$\íG¡1lƒd¶œQ0şü\'W®\\\Ù\ôû+\ågù\òå—¥\ã\Æ]ù\çˆM\Zl|l9› ¨V\Ô\0t•V…F‘wCK\Ü6¿?)…Æ°up1\ÔzFh\îÜ¹ûÍ›7\ïù¾¾¾gÌ´›¤?\÷¾eË–]š¥ùtş9bPCC­\'GQ­¨#\0\è*­\n|\ñ0\Ü\ä\÷\'Å£\Ğ(¬\èAE\Ñ\í¦8Hw\öÓ¼¿·Rz\â\ç?ÍŠâŠE·£¦¨Z\âù\È?G\00nµ*4d\ì¢\Ğ(d¸\Ã\İ\è>\Ã†»ı„¥¨V\Ô£\ë\ğ\ÃSoo\ïA===ÿ\'ı:\'Í£i^O%\Û\ğ5ş=g\Ãúƒbûü>\0hƒB£ZQhi¤#½0ş\ô\õ?\Ò\ÛM(\êˆjE1:¦NºOoo\ï¬4¯lhNMl?+nŸ\ß\'\0# Ğ¨V\Z›\Ô\îÁC»·ÆŸv_\÷\íŞ¾\ë©#ªuD{¦NºKoo\ï\Âˆ‘da\ì/\0ƒB£ZQhj´\ZFk?@\õ\Ö\ë}´\öÓ•\ÔÕŠ:bd?ü\ğ\Ízzz¾\Ó\Û\ÛûZ¾\ñp\Ê)§$—\\rI\òÓŸş4y\ä‘G’Õ«W\'!¾Æ¿cy¬\í\ò·ı\Å~cÿùû&¨tüø\İx\ñ\Å\ß|\ö\Ùg?\ó\÷ÿ\÷\ë=\ö\Øl\ğ9\æ˜c~}\Úi§½.û\å9\çœ\ó\õ\éÓ§o¿ıD£Ğ¨V\Z-\öÁ\Âh\ï¨\Ñ~\öşº†:¢ZQG_zŒ°\õÔ©S\Ş\Øh˜6mZrÁ$O<\ñDÖœ(*¶\Û\Å\ís‹Ÿ\Åı\ä\ï˜@\Ò1b³o¼\ñûgy\æ¯fÌ˜‘œşù\ÉÂ…[vBcy¬?\ò\È#_=\ñ\Ä—u\ÔQÿ;¿¿‰B¡Q­(4šv\ğ\Ö4\Ó\Ó\ÌLsoš\'\Ò\Ä\ÏnEšŸ¥¹\"\Í\Ñi¶Ù°}\Ş`ûÆ¿Á^\ßÆPGT+\êˆ\á™:u\êÿJ³¢±¹p\î¹\ç&?şøÀN\Ä0\Å\íc?¹¦\Å\ãqù\Ç\0L\0.<şœs\ÎYS±,X¼ú\ê«ùq£¥\Ø.¶?é¤“~}\Üq\Ç\İ\Ó\Ó\Ó\ó?\óû\îv\njE¡1@«ƒƒxş(Í«µ\ßh\É-i&Õšµ\Ú?0¾µz]7:HQ­¨#Š\Û0³¢¿Y³\"®¹\æšü\áB[b¹\Ù›iH:ü\ÎM7\İt\É\ÑG\\ı\õ\Éo~\ó›ü8QH\Ü.nøá‡¿8Ñ®\ê«Ğ¨V\Zı\ò¿“\æ\Óüª\Ö|`Q47\Õ~ûk£üı\0\ãWş\õl\Ü(:¢ZQG×”h<\rdú\ô\éÉ½\÷Ş›?D±\ß\ØC\Ó\âg®i@úúÿY³fı\ßc=6ù\Å/~‘F$\ö3cÆŒ—§M›vdşşº•B£ZQhd\òoL\óÿ×š$\âĞ“\Óüyš·o\Ø6¾Æ¿cZ\÷Ui^\É\İ\æ©4ŸØ°m]şş€\ñ\'ÿ:6n”DQ­¨#Š\Ùp\Íş™jV\Ô\ÅşgZ\Äı\ç\Ğebf\Å1\Ç“¬\\¹2?&´%\ö7}ú\ôµS¦L\É\']I¡Q­(4š\â\ÒüAÇ­ivÚ°~(\ïLs^š_\×6\Ş~}\ÍÁt“ü\ë×¸Q\"uDµ¢Ú†.}µ\Ş<¸\ö\Úk\ó‡\÷\Ó0\Ë\âUy\n]\ì\Î;\ï<>š£5³\"/\İ\ïkŸù\Ìg\ÖL<ù\İùû\î6\nje‚\Z­Šÿ˜\Î\İx\Ğqnš\×5¬/j·4\Õ6\îgmšØ¢\õı\Õ\Ö\êuk\Ü(‘:¢Z™\àuD!½½½ëƒ¸0f™r\â\\˜l@H_\ë›}\å+_Y×œè¤«¯¾zÍ´i\Ón\Ì\ß·QhT+¸\ĞhU\ôÇ…\ò\Z\Ï=ÿ—†u#Ó¾­m\Üß¢4¯°E\ë\ÇTS«×«q£d\êˆje\×…\Ä\ê\ÆSA\Úı4\áŠûk<5d¢\Ì\è†	\å†n¸ >\rd¤\Ø,*\ö?cÆŒU\é@²gş1t…Fµ2AÁŠıKjnM\ó»W\È{\Ò<_Û¸\ß\Ï\r\\\ì\ñ\0\Õ1\Ø\ëÔ¸Q2uDµ2A\ëˆ\Âz{{gÕ›\\pA¾ü/E\Üo\Ã,‹Yù\ÇŒc\éküw\Ï8\ãŒ_\ÅG‘–\á\ö\Ûo.H~œ\İD¡Q­LÀBc°\"?®\Ê_ÿ\Â\×j\Å\Ï=/\".¸W?\ğx¦\Öüni\ìqco°×§qc¨#ª•	XG6mÚ´7§uı+\õfAÙ³+\ê\â~\Z¯\Ä\ã\Ê?V`œº\ó\Î;8ê¨£’W_}5ÿ\Úïˆ¸Ÿƒ>ø¹É“\'¿#ÿXª.\0oM3)¿<O¡Q­Œ\ÇB£\è\ïZ›*\î§\×6\ÄUıG\Óÿ¨\rœ\âı\×W\÷\Û\Ô\ã\ÆÆ¦^—ÆQTtlWGT+ã±\rE~_\Ó\õ\Õ1[{,\Åı74-\Ê?V`œºè¢‹fŸşùù\×|G}\öÙ‹zzz\Í?–ªk79€+4ª•\ñXhı]\Ëª¨¿¼¶\ñÀ \Ş\Ùm_­m\Üÿ\ä\Ö5\Z\êq\å\ê\õh\ÜEE\ÇvuDµ2\ëˆ\ÑP\ä\÷5]~^}»ı\èGù’¿Tqÿ\r9>•\è\çœsÎª²N©»\å–[\÷\Ã\ó\Ë\ZÁM\à\nje<\ZE\×\Z)\æ\ï©m<0\Ø1·n4\Ä\Õÿ\ëû_[—W\ä\ñU\äuh\ÜEE\ÇvuDµ2\ëˆ\ÑP\ä\÷u\êÔ©s\ë\ë\ò“Ÿ\äKşR\Åı\×K<®\Æ\Ç	Œc§Ÿ~úº¥K—\æ_\ó\õ\ĞC-K“»\ó¥\êZ\Ü-p…Fµ2¿c-\×6(Z\Ä?Y\Ûx`\ğ§¹u£áµû<·®•¢}E_ÆQ\ÔbLo9¶«#ª•\ñXGŒ†¿§M¿¯\é\×\Ç\ê\Ë\Ë>È‹ûoxŒ\ñ\ñ\É@78\æ˜c^{\ö\Ùg\ó¯ùZ½z\õ\Út Y‘,U\×bÀ\Î\'À«\\h\Üv\Ûm\É/¼Ğ´|°\Üs\Ï=\É\ó\Ï?ß´<Ÿ¸\Ø\Ñ\Ã?Ü´¼\n…F‹ß­|²ßµ\Ú\ğŠ\÷WjZ]Ü®]¿_Û¸ÿ\õ¹uƒ\Î\ãF\Çp^wÆQ\Ôb,\Ï\'Û«VG4\Ö/½\ôR\ò\óŸÿ¼i›z¢XµjU\Ó\òu\ë\Ö5-/u\Ähh\ñû™Oü¾¾Tÿw\Ù\Çyqÿ\õ\Ç2u\ê\Ô\òÿ`œ:\ô\ĞC“_ÿú\×ù\×|G¥\÷\÷B‹A¯kR¥B\ã\å—_\ğ\ï]v\Ù%¹\ô\ÒK³\ï_|\ñ\Å\ë¾\÷½\ï%\ßø\Æ7,;\ãŒ3²Ï¶\ïŸyæ™¦ı\×s\ó\Í7\'¯{\İë’…6­\ëäŸŸn\É\äÉ““\Í6\Û,Š¨\Ó\ò¯\ëA\ôÕª\õNi]<ş8øxc~0\ê\âu¯·q?n\ä\Ç\ÄnKşo\ÙX\æ\Ì3\ÏL¾ş\õ¯g\ß_w\İuÉ¶\Ûn›<\ñ\ÄM\ÛE=\ö\Ø\äÀLnº\é¦dú\ô\éıy\ßûŞ—,Z´¨iûh€D“£¯¯oÀ\òŸş\ô§MÛU\òÏ´N\Ù\Çyqÿ\r\ç7ùA§>ú\è_—\İ]µj\Õ/{»k†Å­½\Ê\ï‚\ì±\ÇI|L\ä­o}kVH\Ä\÷{\ï½w2cÆŒşm\ã‘\ßÿı\ßO\âš&Ÿı\ìg³m>\ò‘$;\í´S¶\İ[l‘\\t\ÑEM\÷‰&ı¯g3-\ò\ë\Æ:\ã\ñ‘¿c-\×j\Ã{§\ñgµ;\äÖ†]j\÷¿0·n0\ÃyüÀ\è\Î\ëÎ¸1ŠZŒ\é-\Ç\ö*\Õ‘+V$ox\Ã²šû·›Ì;·\é\r‘\ÈSO=•l½\õ\Ö\É\ò\åË³7G\âv±<\ê‰N8¡»¨3\êuI\Ô(ü\à“wÜ±Y\äOş\äO*SSŒ\Ç:b4´ø=mú}™\õ\åeO\ä™a]\ê\ÔSO}¡\ìs\Îx\àŸ\ôv\Ç5,uU*4/^œ¼\÷½\ï\íÿww\İuW\öı×¾\öµ\ä‹_ü\â€\íÿû¿ÿ;ûú¯ÿú¯\Ù;\"Ñ¬øĞ‡>”57v\Ûm·AO\'¹\ğ\Â“-·\Ü2›i‘_7\Ö…F\Ñßµ\rŠ\ïW\Ô6“[7\Zş±¶qÿÿ\ßÀU-}\ÜÀ\è+úú3nŒ¢¢c{•êˆ˜yy\ğÁ\'\ïÿû“#<2y\Ç;Ş‘½‰±ı\ö\Û7Í¼<\âˆ#’‹/¾8û´†m¶\Ù&›Q\ñ\Ãş0ù\Ã?ü\Ã\äg?ûÙ€mc†\ÆÌŸ??\Û.\öû™\Ï|&y\ó›ßœ\Õ\ög\Ö\ôX\Æ*ã±\rE~_{]\Ã\è´/|\á—ı)!W^y\å5½\ãûSBš\ìFU*4bš\åı\Ñ\õO\Éü\Ó?ı\Ód¿ı\öË¾\Ùq\ÊGl3\'\âhnœu\ÖYÑ™N¦L™\Òß°ˆ\íÿü\Ïÿ<\Û&‘ú§\Z°¿*e<\ZE\×\Z)\â\ã`£~`pUn\İh¸¯¶qÿ\ä\Ö\åy¼@gy\Z7FQÑ±½JuD¼q\Úi§\rX\öÀd5Aã²¨#\â4\ÅO|\â\ÉV[m•}b\Ãyç—Lš4)¹\ã;’\İw\ß=9\äC’5k\Ö\ô\ß&\Z1[#fƒ\î³\Ï>Ùµ2¶\Ûn»lİ»\Ş\õ®¦\Ç2Vu\Äh(\òû\êSB€;ûì³¿~şù\ç\ç_\óu\Â	\'\\\ß\Ó\Óslş±Tİ¦\ìFU*4y\ä‘MÎ°¨7b\æ\Ä\ÓO?ü\ñÿq\ö}¼C\×H¨OÍŒ\äœs\Îi\Ú=Qt\Äúø\ÃM\ë\Æ:\ã±\Ğ(ú»–3T1¿Mm\ãA\\H/\Î-û\Ö6\îû\Å4o¸z€¡\'P¡^\ÛÔŒ£¦\è\Ø^¥:\â›\ßüfË†Eœ\ÆÑ¸,jˆ9s\ædopD£\â°\ÃË®{Q?u$®›µ\×^{%7\Şxcrÿı\÷g§Æµ0\â\Ú\ÑüˆSVgX¼ı\íooz,c•\ñXGŒ†\"¿¯\éú\ó\êM‚˜Y3–\âş\ë%Wş±\ãTúGa\ë3f¼šÊ¿\î;\"½Ÿ§\ÒAdUz0üüc\éU*4b†Å¦\Z§„Ä…¯â´øş\Ê+¯L\Şı\îw\÷\ÏÌˆ\Ù±}~ÿ\õ\ÛÅ¹¦w\ß}wv\ÚH•şÿ‘	VhU\Ô\ßR\Ûx€0Z\Ì/Íƒµûı\æÀ\Õ\õø€\ò\r\õº4n”¬JG¿úÕ¯&;\ì°C\Ò\ÓÓ“\nob\Ä\÷qŠH\ãv1;\â\ÔSO\ÍN!Y—§œrJÿ\õ°\"qı¬xS£~\ZI\\Ÿbÿı\÷\ÏN	yè¡‡’ÿøÿ0\Ã\"\ŞL\Ë?–±\Ê«#†%­\éª7	\â9K\'Ÿ|\òk\r\r‹ƒ\ò\ÇN<\ñ\ÄG\Ë:-\ä²\Ë.ûQ:ˆü8ÿºI•\n|p“§„œ~ú\éı\Û\Öqi¼\ËŸ S_ÍŠÁ\Z\ßı\îw“}\ìc\Ù\÷3g\Î\Ì\Ş))\òQ¨ee\Z›*\î\'\Õ6 ü:\ÍnÖÌ¿\×6\îsuš?¸ºß¦0¶6\õúœT3n”ª*u\Äú\õ\ë“ü\à\É\ç?ÿù\ìoiœ&\Z\Óü\Â¾­¯oˆ¸nE\\\ç\"š\ñ1¦Ñ”ˆ›Qs\ä\÷©_\Ã\".\ĞM¸F}†\Å;\ßù\Îl&Fş6c‘	XG6mÚ´7§uı+\õFA<\çc!î·¡Y\ñJ<®ücÆ±\ô\Äÿ>é¤“~ı›\ßü&ÿúU\éşO‘%S¦L\Ù3ÿºIU\nH4,\Z?	¤q†\ÅW\\1\à\"™1]3\Î?\İu\×]“ÿü\Ïÿ,4\Ã\".pS:?“}\Ï=\÷ÌŠ\Æ\óT\Ç2´\Ğ\ØT‘cm\ãB\\”\ê\íW\ËµûŠ=pu¿M= \Z6\õ:5n”¨*uD\ÌrøÖ·¾•ÍŒ\ÆÅ¬Y³²ú\àê«¯\ÎfS\Älˆ%K–d\ÛF\ro~\Åv\'Ÿ|rrü\ñ\ÇgM‹¸\èf½a±v\í\ÚşSD¢nˆ\Ú\">nı+_ùJ\ö\É\"3,\â\ôÔª¼ù1A\ëˆ\Â\Ò\Ú~V½YpÁ\ä\ËÿR\Äı64,\Æ\İu\ò€N8\á„{®¿şú\×\òÀ(z\í_ş\å_.L‘\ë\ó\÷\İmªRh´J4,.\\Ø´<\Å\Â\æ›oqJH}†Eœ\ê\Óü\â\Â[\Û\Ç\'D±‘ÿÿÆ•¿\ã]–¸`Vş6c‘	\\hV\ì¿5\ÍSµ¦yÏ€-†\öú4?¨\r<\èøş€-6\Z\ìq\0\Õ3\Ø\ëÕ¸Q¢ü\ßÕ±H\\+ş\Çq\áÌ˜YQ_§“\ÆcŒ\ÓE\êoXÄ¿\ãÔ´Ö‹Ù´ı§‚\Äu+\â:\ñ}¼!×¶¸\á†’·½\ímY3\ä{\ßû^ÿ›#×°\Øyç“}\÷\İ7›ı™leg\×…L™2\å\õfÁ´i\ÓJŸe\÷7u\ê\Ôş\ÓA\â\ñ\ä#\Ğ&Oü\î\ô\Ä\Ú_ü\âùq`T¤\è.J‘¾¸Ÿü}w›*\Zƒå“Ÿüdr\ï½\÷6-¯\'\Î#¯qj\Ç?ü\Ã?d\ß\ç;\ß\É.®Ùªoÿ\Ç\ã;.+h\òûˆD\ó#şh\ÅÕ¿\ó\ë\Ê\Î/4+ú\ãùú\ÚÆƒ†\çÒœœ\æ4n4ˆ¸P\Ş/j:n®ı\ö`$o°ûªk°×­q£$U«#\â\ï}œR\Z\rŒHœ>\Ú\ê\Z§ˆÄ›ù\õ‰‹t\Æ×˜I±jÕª¦\õU\Ê¯#\nIkü…\õ†Á¹ç›?è¨¸¿†\Ù\ó\r\è\"S§N\İ\çˆ#xy\åÊ•ù± -Ë–-»6@œ(Ïª\Z‰\é™ùe­Rt»\ñ…Æ \Å¼\×\Ö@<š\æŸ\Ó\ì‘\æ\Ï6l·uš]\Óücm\àG\Ö\óo5\Ğm{ı\Z7JP\å:b\"F1´\ôb—´\Öµ\Ş8¸\ö\Úk\ó‡\÷\ÓĞ¬x5Gş±]fÚ´iGNŸ>ı…Ñši±afÅŠ4G\ä\ï«[)4ª…Ff°ƒ€§Y\\k>˜(’¸PsÏ¡{\r\ö:6nt˜:¢ZQG\Ó\Ó\Ó\óz\ó f\ÙÆŒ\ŞNŠı7\n\÷ŸL@—Š™‡zèš«¯¾z\ÍH/\Ä\Ø\ÜpÍŠ§&\ÊÌŠ:…Fµ¢\Ğ\è7\ØÁ@¼\Ëù¹4\ÏÔš.Z\å\Å\Úo?‚p°+pv?Àø3\Ø\ëÙ¸\ÑA\êˆjEQ\Ì\á‡¾YZ\÷ÿ¬\Ş@ˆk‘tªiûM\ï¯FG\Üo\Üş1]¬§§\çN›6\í¦3f¬ºı\öÛŸ{\õ\ÕW\ócEK\év+/»\ì²KÒcIšb?ù}w;…Fµ¢\Ğ`Sq\0\ò©4¥¹3\Í\ò\Úo4\â\ë‚4?Ls@š7\Ôo\ĞÂ¦\öŒO›z]7:@Q­¨#ŠKkÿ­\ÓÄ§\öÏ´¸\æšk\ò‡m‰ı5Î¬\Øpq\Z\Z0\ÅG¦ƒÀüƒ>øù³\Î:\ëş9s\æ,zè¡‡{\æ™g^LÇŒµO?ı\ô\ÒÅ‹ÿäª«®ºú\ÄO¼!\İ\ö™Ø¾\Û?ºtS\ZÕŠB£I§:µ_`\ìu\ê\õİ©ık\êˆjE1<S§Nı_M‹H\\³\İO‰\Û\ç.°™5+\âş\ò˜€&OütP8¦§§\çš\ô\ë]\rQ|½k\Ã\òcb»üm\'\Z…Fµ¢\Ğhi´F{@\õŒ\ö\ë|´\÷\×5\ÔÕŠ:bøz;Ó¢ÿ\ôHÌ¶¸\à‚²O\Ø>n—›U‘\÷“¿o\0† Ğ¨V\Zƒ\Z­ƒ…\Ñ\ÚP}£\õz­ıt%uDµ¢™¸¦Ä†q\æ\r\É)§œ’\\r\É%\ÉOú\Ó\ä‘GIV¯^5\'\âkü;–\Çú“O>¹é¶±¿Ø¯kV\0ŒB£ZQhlR»\r\í\Ş\Ú}İ·{û®§¨V\Ô\í\Ù\ğ‘§[4F’…>º M\njE¡1¤‘<Œ\ôvÀø7\Ò\×ÿHo7¡¨#ªu\Ä\è˜:u\ê>½½½³Ò¼Ò¢±©\Ä\ö³\â\öù}0\njE¡Q\Èp\"†»=\Ğ}†;wû	KQ­¨#F\×\á‡ş¦\Ş\ŞŞƒzzzşOúuNšGÓ¼¼¡9_\ã\ßs6¬?(¶\Ï\ï€6(4ª…FaE&Šn\Ç0$I\ò{K—.½|Á‚¿š3gN\ö{+\å&ı¹¿6şü\'\çÎ»_şùaPEÇƒ¢\ÛQSGT-\ñ|\äŸ#\0·\ZÕŠBcX†:¨j=#´t\éÒ™\éÁr²r\å\ÊdİºuM¿\Ç\Òù\Ä\Ï=~ş\ó\æ\Í{>7>\ÔP\ã\ÂP\ë\ÉQGT+\ê\0ºŠB£ZQh\Û`ƒ-g\ÄÌŠ8X\ÎÿşJù\é\ë\ë{&7\î\Ê?Gl\Ò`\ã\Ã`\Ë\ÙuDµ¢\0 «(4ª…Æˆ\ä2\òÿf”\Åi fVT#\ñ<¤\ã\ÆúüsÄ\ò\ãDş\ß¤¨V\Ô\0t…Fµ¢\Ğ±úÁ\Æi¾:\è\è \ãFµb\Ü1\ã\Æ(0T+\Æ\0ºŠB£ZQh´\å\ãq\Õ\îøš_Á\è*:n¼ø\\_²\ô\î“Å·|9K|\Ë\ò\ÛI{1nŒ\Üû\Ş\÷¾“7\Ûl3\ãFŠRNŒ\0t…Fµ¢\ĞhÏ††Vd\ÜX»fE²\è¦3“Ÿ_\÷¹‰e±.¿½Œ<Æ‘KÇŒ[\'O\ì\ç×†\"ã”\ã\0]E¡Q­(4Ú£aQ\"\ã\Æã‹¯ijV\Ô\ó\Ä\âk›¶—‘Ç¸12\éx1)ÆŒ\r™”_O1E\Æ)/\Æ\0ºŠB£ZQh´GÃ¢EÆo=·©QQO¬\Ëo/#qcdbvEC\Ã\â\ÖüzŠ)2Hy1\0\ĞU\ZÕŠB£=\Z\å(2n,š}VS£¢X—\ß^F\ã\Æ\ğ\åfW˜eÑ†\"ã”\ã\0]E¡Q­(4Ú£aQ\"ã††Ey1n_nv…Ym(2Hy1\0\ĞU\ZÕŠB£=\Z\å(2nÄ§‚\ä\õÄºü\ö2\ò7†g\ÙfYŒP‘\ñ@Ê‹\ñ\0€®¢Ğ¨V\Z\íÑ°(G‘qc\É\ßnjT\Ô\ë\ò\Û\Ë\Èc\ÜAfW˜e1BE\Æ)/\Æ\0ºŠB£ZQh´GÃ¢EÆ\Õ+\îK\İü¥¦fE,‹uù\íe\ä1n3(Z4)ò™”¿ƒ+2Hy1\0\ĞU\ZÕŠB£=\Z\å(:n<ú“‹›\Z±,¿´\ãFq1ƒ¢Eƒ\"³,†¡\èx \å\Äx\0@WQhT+\n\öhX”£Ğ¸±~}²\ä\Î\ï65,bY¬k\Ú^F\ãF{Œ\í)4Hi1\0\ĞU\ZÕŠB£=<\Ê1Ô¸±vÍŠ\ä\á;\ÎkjV\Ô\ëb›ü\ídd1n´Ç¸Ñ¡\Æ)7\Æ\0ºÊœ9s^[·n]\Ó<)?\é\ó\ğdZh¬\Ï?G\çÀ£ƒ ¬_Ÿ\ô-™›\Ü\ãššù\Ä6±­\Ù\í\ÇJ{Œ\íQGT\'\ê\0º\Îüù\óŸ\\¹re\Ó=)?Ë—/¿,-4\î\Ê?G\çÀ£­\ZCÍª,f[´\r‹\ö7Ú£¨N\Ô\0t¹s\ç\î7oŞ¼\çûúú\ñ\É\Ø$ı¹\÷-[¶\ìÒ´\Èx,Í§\ó\Ï\Å9\ğ(G«†E‘Yƒ%n›ßŸ†E{Œ\íQGŒ}\Ô\0tµø\ãù4¯D\á+¥\'~\î\ñ\óWd´ÉG9\â\÷6_0\ç›\ÃM~R<\ñ|\äŸ#Š3n´/ş~mø;¦›¨#\0\0ªÎG9¢@\Î4\Ë\Ø%üsDq\Æ\r\0\0 \ãx”CÃ¢ZÑ°hq\0\0\è8\åĞ°¨V4,\Úc\Ü\0\0\0:ÎG94,ª\r‹\ö7\0\0€s\àQ\r‹jEÃ¢=\Æ\r\0\0 \ãx”CÃ¢ZÑ°hq\0\0\è8\åĞ°¨V4,\Úc\Ü\0\0\0:ÎG94,ª\r‹\ö7\0\0€s\àQ\r‹jEÃ¢=\Æ\r\0\0 \ãx”CÃ¢ZÑ°hq\0\0\è8\åĞ°¨V4,\Úc\Ü\0\0\0:ÎG94,ª\r‹\ö7\0\0€s\àQ\r‹jEÃ¢=\Æ\r\0\0 \ãx”CÃ¢ZÑ°hq\0\0\è8\íI~·¦™”_§aQ­hX´Ç¸\0\0tœ\ö\Ä\ÏoC6Ù¸Ğ°¨V4,\Úc\Ü\0\0\0:ÎG{\Z\Z›l\\hXT+\Z\í1n\0\0\0\çÀ£=-\Z-\ZÕŠ†E{Œ\0\0@\Ç9\ğhO‹FE>Y\ãb¬\Z\Ï>û\ì€?\ò\È#\ÉSO=Õ´]>w\İuWÓ²|Ö®]›,Z´¨ÿ\ß/¼\ğB\ò\ÒK/eß¯_¿~À¶\÷\İw_²fÍš¦}D^~ù\å¦e†E{Œ\0\0@Çµ8À–%\Ğ\\F\ö\ßÿ\ä\Ë_şr\öıs\Ï=—ü\ò—¿L¶\Ùf›\ä\É\'Ÿ´Q\ğÀ$¯{\İ\ë’\Ë.»¬i]c\â\ö;\í´Sr\ó\Í7\'\Ï?ÿ|²t\é\Ò\ì\ßÓ§OO\ö\Ş{\ï\ä\Ì3\ÏÌ¶‹\æ\ÅÂ…“m·\İ6¹ûî»“SO=59ê¨£²|\ğÁ\É\Î;\ïœ5;\òû\ïd\òÏ?ù±\0\0€\n\É\Ä5\ä\Ö\Ş1>%dÙ²eÉ»\Ş\õ®lVE4v\Øa‡¬I>œd\êÔ©\É^{í•œ~ú\éM·û›¿ù›¬\é\ğ\ÉO~2kr\ä\×Gs\â´\ÓN\Ë\ö\õ| ùĞ‡>”\ì¸\ã\ÉI\'”l·\İv\Ù6»\ì²K²`Á‚\ìû™3gfû›2eJr\íµ\×&}}}\Ù\ìŒX7w\î\Üd\÷\İwoºN\Ç\0\0\0º\ÚPŠº±hX{\ì±\Éı\×e³¢‘pÀ\ô¯‹FÄ¤I“’\Ûn»mÀm\Î:\ë¬\ä¯şê¯’u\ë\Öe·\İm·İ²ù}?\ö\ØcY\â\Å_LfÍš•5+–/_\İO|ıÔ§>Õ¿\íW\\‘\ì³\Ï>ı§‹4&\Z{\ì±G\Ó\òNG\Ã\0\0€®6T£¢®\ì†E4	ş\àş 9\ò\È#³™\ÑDh<#fED“¡¾}Ìš8úè£³ÿK}\öC\ä»\ßın²\å–[fMk®¹fÀ}r\È!\ÉùçŸŸ\İG|SB¢aq\Şy\ç%7\ÜpCÿvW]uÕ€Fc4,\0\0\0 †jTÔ•İ°X½zu\ò\ïÿş\ï\Ùiw\ÜqG¶\ìé§ŸpŠGÌˆSE\æÌ™“Í¾8\ãŒ3ú\Z\õlµ\ÕV\É\ßı\İ\ß%Ÿş\ô§“û·\Ën³28âˆ¬§\Ä6\Ñ\èˆ\Æ\Æ[\Ş\ò–\äşû\ïO&O\Ü?\Ñ\èĞ°\0\0\0€\n*»a§tœ}\ö\Ù\É\ñ\ÇŸ\Üt\ÓMY\Ó!®#Ñ˜¸@\æa‡–¬Zµ*»\Í-·Ü’Í¼h\Ü&\Z\'œpB\Óş/¹\ä’d\ß}\÷Íš\Z3f\ÌH¶\ß~ûdÉ’%ı×°ˆ\åqªH|×­Ğ°\0\0\0€\n*»a\ñ\ğ\Ã\'o|\ã³kG\\pÁY3\á?øAví‰˜qı\õ\×7\İ\æ\Ç?şq²\ç{X×´ˆä·\æFıšq‹]w\İ5Y±bE²\õ\Ö[g_;\î¸\äK_úR¶\Ş\0\0\0¨¨²‘¸nE|}è¡‡’[o½5kTÄ¬‡øúı\ï?;]¤¾M$NiÕ°8\çœsš\ö§‘\ÄÇ”\ÆLŠ\ä£ıhÖ¨\Ø|\óÍ³‹yn±\Å\ÙG˜Æ¶\Z\0\0\0PQe7,/^œü\õ_ÿur\à&Ÿÿü\ç“\÷¾\÷½\Ù‹˜\ñ¦7½)y\á…²S=\Z¯53,\Ş\ö¶·\r8%$N©Ï”hL\\T3>\Z5¾Ñ´ˆ†Eœ\×\Éxê©§ú·½\ò\Ê+³SK\ZoŸ³0\âş£q’\ß§£a\0\0\0µ\ò‘{\î¹\'ûú\ío;›I\ñ\àƒ&û\í·_ÿ©q\íŠ\ÆSC\â1~\ö³Ÿ°o~\ó›\Ù\õ*\òûx\ÆE;\ãû¸^F|†E\\\×\"¿\í\å—_}I~ùO<‘]Gc\æÌ™M\ë:\r\0\0\0¨M\Ãb¸‰O\É/N¢q±~ıú–\Ë\ó\Ë\êiµ}Ñ°\0\0\0€\ÚøhXL¤hX\0\0\0@MÃ¢jÑ°\0\0\0€š†EÕ¢a\0\0\05\r‹ªE\Ã\0\0\0j\ZU‹†\0\0\0\Ô4,ª\r\0\0\0¨iXT-\Z\0\0\0PÓ°¨Z4,\0\0\0 ¦aQµhX\0\0\0@MÃ¢jÑ°\0\0\0€š†EÕ¢a\0\0\05\r‹ªE\Ã\0\0\0j\ZU‹†\0\0\0\Ô4,ª\r\0\0\0¨iXT-\Z\0\0\0PÓ°¨Z4,\0\0\0 ¦aQµhX\0\0\0@MÃ¢jÑ°\0\0\0€š†EÕ¢a\0\0\05\r‹ªE\Ã\0\0\0j\ZU‹†\0\0\0\Ô4,ª\r\0\0\0¨iXT-\Z\0\0\0PÓ°¨Z4,\0\0\0 ¦aQµhX\0\0\0@MÃ¢jÑ°\0\0\0€Ôœ9s^[·n]Ó³”Ÿ\ôyxr\ö\ì\Ù\ë\ó\Ï\0\0\0L8\ó\ç\Ïr\åÊ•M\ÏR~–/_~\Ù\ìÙ³\ï\Ê?G\0\0\00\áÌ;w¿y\ó\æ=\ß\×\×\÷Œ™c“\ô\çŞ·lÙ²KgÏıXšO\çŸ#\0\0\0˜\â 9\Ş\ÙO\óJ\\CAJOü\Ü\ã\ç¯Y\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0À\Ä\òÿ\0“\ÕMŞ¶œ}\r\0\0\0\0IEND®B`‚',1),('1820703358228828163',1,'è¯·å‡æµç¨‹ï¼ˆä¼šç­¾ï¼‰-leave5.bpmn20.xml','1820703358228828162',_binary '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:bioc=\"http://bpmn.io/schema/bpmn/biocolor/1.0\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:di=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"leave5\" name=\"è¯·å‡æµç¨‹ï¼ˆä¼šç­¾ï¼‰\">\n    <startEvent id=\"startNode1\" name=\"å¼€å§‹\">\n      <outgoing>Flow_1a01nzj</outgoing>\n    </startEvent>\n    <userTask id=\"Activity_0x6b71j\" name=\"ç”³è¯·äºº\" flowable:formKey=\"static:1\">\n      <incoming>Flow_1a01nzj</incoming>\n      <outgoing>Flow_1wdq20a</outgoing>\n    </userTask>\n    <sequenceFlow id=\"Flow_1a01nzj\" sourceRef=\"startNode1\" targetRef=\"Activity_0x6b71j\" />\n    <userTask id=\"Activity_0dvsmdc\" name=\"ä¸²è¡Œä¼šç­¾\" flowable:assignee=\"${user}\">\n      <incoming>Flow_1wdq20a</incoming>\n      <outgoing>Flow_1gbyvno</outgoing>\n      <multiInstanceLoopCharacteristics isSequential=\"true\" flowable:collection=\"userList\" flowable:elementVariable=\"user\" />\n    </userTask>\n    <sequenceFlow id=\"Flow_1wdq20a\" sourceRef=\"Activity_0x6b71j\" targetRef=\"Activity_0dvsmdc\" />\n    <userTask id=\"Activity_194idnn\" name=\"å¹¶è¡Œä¼šç­¾\" flowable:assignee=\"${user}\">\n      <incoming>Flow_1gbyvno</incoming>\n      <outgoing>Flow_06trc15</outgoing>\n      <multiInstanceLoopCharacteristics flowable:collection=\"userList2\" flowable:elementVariable=\"user\" />\n    </userTask>\n    <sequenceFlow id=\"Flow_1gbyvno\" sourceRef=\"Activity_0dvsmdc\" targetRef=\"Activity_194idnn\" />\n    <userTask id=\"Activity_1o4clkg\" name=\"æ€»ç»ç†\" flowable:assignee=\"1\">\n      <extensionElements />\n      <incoming>Flow_06trc15</incoming>\n      <outgoing>Flow_1jhko1g</outgoing>\n    </userTask>\n    <sequenceFlow id=\"Flow_06trc15\" sourceRef=\"Activity_194idnn\" targetRef=\"Activity_1o4clkg\" />\n    <endEvent id=\"Event_1it04q9\">\n      <incoming>Flow_1jhko1g</incoming>\n    </endEvent>\n    <sequenceFlow id=\"Flow_1jhko1g\" sourceRef=\"Activity_1o4clkg\" targetRef=\"Event_1it04q9\" />\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_flow\">\n    <bpmndi:BPMNPlane id=\"BPMNPlane_flow\" bpmnElement=\"leave5\">\n      <bpmndi:BPMNShape id=\"BPMNShape_startNode1\" bpmnElement=\"startNode1\" bioc:stroke=\"\">\n        <omgdc:Bounds x=\"240\" y=\"200\" width=\"30\" height=\"30\" />\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds x=\"242\" y=\"237\" width=\"23\" height=\"14\" />\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_0x6b71j_di\" bpmnElement=\"Activity_0x6b71j\">\n        <omgdc:Bounds x=\"320\" y=\"175\" width=\"100\" height=\"80\" />\n        <bpmndi:BPMNLabel />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_0dvsmdc_di\" bpmnElement=\"Activity_0dvsmdc\">\n        <omgdc:Bounds x=\"470\" y=\"175\" width=\"100\" height=\"80\" />\n        <bpmndi:BPMNLabel />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_194idnn_di\" bpmnElement=\"Activity_194idnn\">\n        <omgdc:Bounds x=\"620\" y=\"175\" width=\"100\" height=\"80\" />\n        <bpmndi:BPMNLabel />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_1o4clkg_di\" bpmnElement=\"Activity_1o4clkg\">\n        <omgdc:Bounds x=\"770\" y=\"175\" width=\"100\" height=\"80\" />\n        <bpmndi:BPMNLabel />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Event_1it04q9_di\" bpmnElement=\"Event_1it04q9\">\n        <omgdc:Bounds x=\"922\" y=\"197\" width=\"36\" height=\"36\" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge id=\"Flow_1a01nzj_di\" bpmnElement=\"Flow_1a01nzj\">\n        <di:waypoint x=\"270\" y=\"215\" />\n        <di:waypoint x=\"320\" y=\"215\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_1wdq20a_di\" bpmnElement=\"Flow_1wdq20a\">\n        <di:waypoint x=\"420\" y=\"215\" />\n        <di:waypoint x=\"470\" y=\"215\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_1gbyvno_di\" bpmnElement=\"Flow_1gbyvno\">\n        <di:waypoint x=\"570\" y=\"215\" />\n        <di:waypoint x=\"620\" y=\"215\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_06trc15_di\" bpmnElement=\"Flow_06trc15\">\n        <di:waypoint x=\"720\" y=\"215\" />\n        <di:waypoint x=\"770\" y=\"215\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_1jhko1g_di\" bpmnElement=\"Flow_1jhko1g\">\n        <di:waypoint x=\"870\" y=\"215\" />\n        <di:waypoint x=\"922\" y=\"215\" />\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('1820703358606315522',1,'è¯·å‡æµç¨‹ï¼ˆä¼šç­¾ï¼‰-leave5.leave5.png','1820703358228828162',_binary '‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\È\0\0	\0\0\0Hy:\0\0ùIDATx^\í\İ	u½\ğ\÷¥by\ßbyŸ¥–w\á}\áQŞš°\É\"˜@€°@P„’<\ğ\ö¡(Ş Q|j¢”D\äqDA\r\È!\÷\Ã!§\ä\è×¿~\é­\Év\Ã\é\Ùw>Ÿªoe3\Ó;3d¿\Ìşş\Ó==ÿ\ñ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0À¦®(Šû\\t\ÑEÿs\Ê)§ü{ù\ò\å\Å\ï~\÷;p\Ê\÷»O8á„«V¬X\ñ®\ô\ç\ÓVz5ı\Ñ+i\"z%M¤‹½ ¥Ê¡\à\ç\å/¥bÍš5\ÅÚµk‹\Ûo¿]œøwÿ\ã?ş\ÆrPx[ú3j#½šş\è•4½’&\Ò\Å^\ĞR\ñŠyüRJY\É\à³z\õ\êk\ËÁ\à\Ô\ôg\ÔFz•O\ôJšˆ^I\éR¯\0h©8œ\Ì+\æy$~\å`p[ú3j#½\Ê\'z%MD¯¤‰t©W\0´T¼\÷\'ı%Ó—øy¤?£6Ò«¼¢W\ÒD\ôJšHWz@Kw0¸\å†\Õ\ÅE§ı 8û¸OU‰¯\ã²t;™Zº2\èU^\Ñ+½j\"z¥WM¤+½ ¥\Æ3\Ü|ı•Åªc\÷+şü›®—¸,®K·—É§+ƒ^\å½Ò«&¢Wz\ÕDº\Ò+\0Zj<ƒÁ\åg\Õ7Ô¹\â\ì¥}\Û\Ë\äÓ•Á@¯\òŠ^\éU\Ñ+½j\"]\é\0-5Á\ào¿?°o ¨×¥\Û\Ë\äÓ•Á@¯\òŠ^\éU\Ñ+½j\"]\é\0-5Á`\Õ\ï\ö\ï\ê\Äu\é\ö2ùte0Ğ«¼¢Wz\ÕD\ôJ¯šHWz@K\òJW½\Ê+z¥WMD¯\ôª‰t¥W\0´\Ôxƒ8[g:Ô‰\ë\Ò\íe\ò\é\Ê` WyE¯\ôª‰\è•^5‘®\ô\n€–\Z\Ï`pÁI_\ï\ê\Äu\é\ö2ùte0Ğ«¼¢Wz\ÕD\ôJ¯šHWz@Kg0¸\îÊ¿«~ûÉ¾¡ .‹\ë\Ò\íe\ò\é\Ê` WyE¯\ôª‰\è•^5‘®\ô\n€–\Z\Ï`¹ø\ô\Ãúƒ¸,\İN¦–®z•W\ôJ¯šˆ^\éU\éJ¯\0h©q\r·\İV\\p\ò7ûƒ¸,®\ë\Û^&®z•W\ôJ¯šˆ^\éU\éJ¯\0h©{\Zn¾ş\Ê\âü“\ê\n\ê\Äu±Mú}2¹te0Ğ«¼¢Wz\ÕD\ôJ¯šHWz@K9\Üv[±ú‚\Å_Ù§oH\ÛÄ¶^EŸzº2\èU^\Ñ+½j\"z¥WM¤+½ ¥F\î\é\Õ\ò±\âU\ô©§+ƒ^\å½\ê^M=z\Õ½šzº\Ò+\0Zj´Á`<¯–•ø\Ş\ô\ödü\é\Ê` WyE¯F^M-z5z\ôjj\éJ¯\0h©\Ñƒ\ô—ıD“ŞŒ?]\ô*¯\è\Õ\ØIoO\Æ½\Z;\é\í\ÉøÓ•^\ĞR£\r2}\é\Ê` WyE¯¤‰\è•4‘®\ôj²\æÌ™\óY³f\Í\Z\Zú\ï\ò\Ï\åe..sk™bİŸ\ñ\÷\åë®ŸÛ§·À\òJW½\Ê+z%MD¯¤‰t¥W5{\ö\ì­\Ê\ï’2·¯[7±ı’øş\ô6˜ƒA^\é\Ê` WyE¯¤‰\è•4‘®\ôj¼Ê…\í–\åw\å(\ß\Éde\Ü^z\0L€Á ¯te0Ğ«¼¢W\ÒD\ôJšHWzuO\æÌ™³\Ù\Ğ\Ğ\Ğ7\ÊE\í\İ\éBw\÷\İw//^\\œq\ÆÅ…^X\\w\İuEˆ?\ã\ïqy\\Û¥\ß···Ÿ\Ş\'Àˆ\ò9\å¿N9\å”\÷v\Øa¿]¸p\áµ{\ï½\÷ÚwŞ¹zBš?ş{\î¹\çM\åe_´h\Ñ\çÎ»Eúı]f0\È+]\ô*¯\è•4½’&Ò•^mH9n1{\ö\ì?\÷.l‡‡‡‹C9¤¸\âŠ+ª\Å\ğx\Å\ö\ñ}\ñı\ÉBù¬¸Ÿ\ô¾M\\ù¼±\Ù1\Ç\ó\íı\ö\Û\ï\ß\ó\æ\Í+>ø\àb\åÊ•£¾\Z—\Ç\õ;\ì°\Ã],¸h\Çw|sz{]d0\È+]\ô*¯\è•4½’&Ò•^¥\\?³Ì•½‹\Ù<°¸ü\ò\Ë\×_ùNP|\ÜN²H¾<\î/}À&ª\\\ğ~hÑ¢Ek\ã\ğ“SN9¥¸ë®»\Ò\ç’Q\Åv±ı®»\îz\Ç.»\ìò§¡¡¡§¤·\İ%ƒ¼Ò•Á@¯\òŠ^I\Ñ+i\"]\é\Õh\Ö\í9Y\Ç^ß£:*E§$n/Ù›|¹=É°‰+Ÿş\ó\Øc]¼\ÓN;Ë–-+\î¼\ó\Î\ô¹c\\\âû\âû\çÌ™sK—\Ïh0\È+]\ô*¯\è•4½’&Ò•^¥\â=Á½‡UÏ;·8\ó\Ì3\Ó\ñs£ˆÛ\Û\ïY$Ÿ\å=É°‰*ŸşsÉ’%\Üyç‹s\Ï=7}¾˜”¸y\ó\æ\İ:<<¼Cz]`0\È+]\ô*¯\è•4½’&Ò•^¥Ökd\ÏqS‹\ãZ\Ü~\ï\ä¸ÿ\ô1›€\Øs<şübÍš5\é\óÄ”\Ä\íÍ;\÷æ­·\Şú\é}¶Á ¯te0Ğ«¼¢W\ÒD\ôJšHWz\Õk\İG9\İU/V—.]ššˆû\éÙ‹|—€‚M\Ì\É\'Ÿü¡Xo¬=Ç©\òv\ï\Şn»\í®Ÿ9s\æS\Óûn3ƒA^\é\Ê` WyE¯¤‰\è•4‘®\ôª×¬\Ï9i\rRrâ®•\éc:ªüÿ³8`m¼g¸IGy\ä\õ\Ã\Ã\ÃÇ¤\÷\ßfƒ¼Ò•Á@¯\òŠ^I\Ñ+i\"]\éU->\ì=´zªg«¨¸¿\ŞC­»x4$0Š£>ú8[\õdO\È5^qû\ó\æÍ»¦|ry]ú\Ú\Ê`Wº2\èU^\Ñ+i\"z%M¤+½ª•‹\Ò%\õ\â4>¯x:\Äı\ö\ìE^’>F c\Êÿ\ïÿk\ß}\÷ıw|4\Ó œx\â‰7”O.ÿ›>¶2ä•®z•W\ôJšˆ^I\éJ¯\Â\ğ\ğ\ğCË™\ñ\özq:\è½Çµ¸ß\ò\í\ñ¸\Ò\Ç\nt\È\É\'Ÿüw\ÜqÜŸs<Uq?\Ûl³\Í\r3g\Î\Ü<},9)Ÿ\0_\æµ\é\å)ƒA^\É}0Ğ«vF¯¤‰\è•4‘\Ü{UO¿\Ê\ëg\Ô\Ó8\Òq:\Åı\÷,’g¤\èC=\ôw|pú<Ğ¨…®\Z\Z\Z\Ú9},9\éy\Ü\à¸Á ¯\ä>\èU;£W\ÒD\ôJšHî½ª§_\å\å\Õ\Ûıø\Ç?N\ÇÉŠû\ïy\Ì¥\èE‹]3¨Ã«k\Çw\ÜÙ³2GÏ“\àŸÀ\ry%\÷Á@¯\Ú½’&¢W\ÒDr\ïUm<ıš={\öŠúú\ÓO?=\'*\î¿~,\ñ¸z\'\Ğ1{\íµ\×Ú‹.º(}h\Ôy\çwIùsZúXr2\Ê\÷¨O\àƒ¼’û`0JŸ\ôª\Ñ+i\"z%M$\÷^\ÕF\éU_¿\Ê?/«/\ô¬šŠû\ïyŒ—%ÿ9@—ÌŸ?ÿ\îş\óŸ\é\ó@£®»îº›\Ë\'—+\ÓÇ’“Q°\ÓTO\à9ø\ÃŠ›nº©\ï\ò±\ò§?ı©¸\ñ\Æû.O\'«8ÿü\óû.\Ï!¹£\ô(M½ŠŞœy\æ™}—–3\Î8£\ï²Èµ\×^\Ûw\Ù=}ODz»x\õ\ÕW\\pA\ßvƒŠ^M=\ç{\îz½1\é6u\Æ\ê\ÇT:Ñ«‰¥Gi¦½W£¥\÷gü¯ı«ø\óŸÿÜ·Mø]v\Í5\×\ô]¾v\íÚ¾\ËÚ’\Ü{U¥Oi¢_ÿªÿ>\èY5\÷_?–Ù³gß”ş\÷\0²\í¶\Ûw\ÜqGú<Ğ¨\òşn\Zå‰°•\Éi0¸\õ\Ö[\×ûû–[nYü\ä\'?©¾¾\å–[Ö»\î[\ßúV\ñ¥/}i½\Ë\ö\İw\ß\ê³ş\â\ë\r\r¢¿ı\ío‹{\İ\ë^\ÅÊ•+û®›\î¤?Ÿ¶f:z\Õ;Æ€y\ï{ß»ø\ãÿ\Øw]oV¬XQ<\ô¡-\âm\Z\ó\ç\Ï/\æÎ[\å=\ïyO\ñ\ä\'?¹z1%ı_ş\ò—\ÕmŸ}\ö\Ù}\×\ÕY°`A\ñ\îw¿»ú:Ë¡‡Z<\å)O©”\ru³©¤?Ÿ¶f:zUg\Ï=\÷,>úÑV_\Ç0øÃ‹\åË—\÷m\×T§\"z\ÕL¦³W£e¿ı\ö+¾ø\Å/V_ÿ\æ7¿)\ô¤\'W\\qE\ßv‘wŞ¹x\ï{\ß[{\ì±#]‹<\ã\Ï(V­ZÕ·},¸cQ½z\õ\ê\õ.\Ï4ƒJú\ó\éJ=«¦\âş{Ï\é<\rt\ÈN;\ítÇ _•»\æškş>«½{?+\ÓC\Ë\âU\òW¿ú\ÕEœ•<\ò˜\Ç<¦ú\Å_¿\á\roˆÏ \Ù6^1¿\ï}\ï[\r¡ü\à«m^\ò’—/~\ñ‹«\í\ô U\Ãcz‘8\Êÿ\ôQ\Õ\éNî¯œÒ§lzu\ñ\ÅW?ÿ\çÌ™S\Ü\ç>\÷Ÿù\ÌgV]\é\İ>Ä—½\ìe\ÅÒ¥K‹\Ûn»­ú{ú\"MšX”<\ëY\Ï*v\Øa‡j±’^‰…J,\Ş\ô¦7CCC\Å\óŸÿü\â5¯yM\ñÒ—¾´\ê\é\ãÿøâ ƒ\êû¾&£WSOì­½ÿı\ï_ı\Ï-\õb¹wa\ÚT§\êûÑ«‰¥O\Ù\õj´\\y\å•\Åı\îw¿ê…˜\÷½\ï}Õ‹.£\õ\èÿøG±\Å[—^zi\õbr|_\\}ø\ğ‡?<²]<\÷Õ¿W\ãw\ìsŸû\Ü\â/xÁ\Èe‘G<\â\ÙüNÌ½WµQz\Õ×¯\ØS[_>\èY5e2lB\ö\Øc›ı¾s\Î9\ç\ôY\í{\òzA-§Á \ö<ı\éOù{ü\"?\õ\ÔS«¯?\÷¹\ÏŸø\Ä\'\Ö\Ûş×¿şu\õ\ç¾\ğ…j‹£¾\ğ…\Õbú•¯|å˜‡gÿ\à?¨\öşÄ\ä\ôº\éN\îƒAÎ½ºêª«ªŸk|{Iü\à\\—\÷¶\Ãf,2b\ó\Û\Ş\ö¶\â3ŸùL\ß\í­Y³¦o(A²~¡æ“Ÿüd\ñÖ·¾µo\Ï\ÎG>\ò‘\âÀ¬\ö\ô}\ç;ß©n;t‰Ç·ù\æ›ÿû\ßû\î«\é\è\Õ\ä\ó‹_übdQ/Fc¯\í>\ğ*±°8\ñ\Ä\íTD¯&.\ç^•82j›m¶y\Ñ$~¶Ñ\ç<\ç9}G	l¿ı\ö\Åa‡Vø‰O|bµ\ÇøG?úQ\ñÀ>°8ë¬³\Ö\Û6:G1œp\Â	\Õvq»\Ûm·]\õ¢Küş|\Â\Ğ\÷X¦+¹\÷ª6~\Í\òd`:\ì³\Ï>\çú,\ÖGq\ÄQ³\Ús\ë¾\'\ì^9\rq\ØW,j\ê½~~\ô£‹w½\ë]\Õ×±w8¡\íb\ïM•±˜\Şÿı\ã•\Ğbë­·Y \Ç\ö\Ï{\Ş\óªm\Òûˆ|úÓŸ^\ï\örJ\îƒAÎ½Š½›m¶\ÙÈ‚#\ö \×›ø:^=\ï\İ>B8\ò\È#‹g?û\Ù\Å\Ş{\ï½\Şá‰‘§=\íi\ëí…‰=9\åZµ(Š\ë\ã\ß!ş‰ûX²dIu\Èm\Ñ\Û\Ç\Â\êo|cuı\Ï~\ö³\ê²\è\Ü%—\\\Ò\÷Ø›^M>\ñ\öX„\Æ9^ş\ò—W—|\ò\É\Å\ë^\÷º¾m›\èTl§W““s¯\ÆJ¼\à‡\ó\÷^v\Î9\çT¿\Óz/‹ßƒ\ñ|]xÔ£U½\'> x\ík_[œt\ÒIÅ«^\õª\âı\ïqı\õ×|O,cot­µ\ÕV[U/\ZFW\ãº8ü?},Ó•\Ü{UO¿œ\Å\Z˜.ü\â ?¹p–µ\às\Ç|\Â\î•\Ó`p\á…npr½ =\Ãq˜\ã\Ã\ö°\ê\ëx}\æÌ™#‹¡-Z\ÔwûubHˆ\ë_\ô¢\õ]7\İ\É}0È¹WúĞ‡ªEC,4\ÒC¬\ã\òx?h\ï\öqÒ¥G>\ò‘Uwb\ÏL½‡9\ÆŞ“¸\ÅaŒ±\'\ç+_ùJuc:\Û{;±\Ç0†\ÑÅ‹\Ç\îG\Ş\ï{jû\Ø\ÇË–-«\ö(u\Èÿ ¢WS\ÏX\ä\èQİ‰&:×«\ÉiC¯\Ò|ù\Ë_u‡E\÷^¿ã…“x~‹…q¼\È\ï[®Pˆv^ÿú\×\ÇsL\ñ×¿şµz%\Ş\Ë\ïM\Åv¼…©w\ò\ã\÷¸¾\Ç2]É½Wµ\ñ\ôk–\ÏA¦CùÄ¾Å¼y\ó\î*¥\Ï(\ï\ç\å\Ë5\å\0´yúX\Ú(§Á \È\r-{±Ch\ë\Ãi8\âˆ\â©O}\ê\Èb(\ö\Ç\ö\é\í\×\ß‡Dv\Úi\Õa\Ø9ı\÷G\Ú2Ü“\éøwCP\ëŸ{zˆuœ_û\Ú\×Fş\ï\r=-»\îº\ëz{\ô\"\ébæ¨£ª\Éto`w¾\ó\Õ\Ñù\Ë_F¾\ç\ßøFµ(Crc›8\á\\ü=†\Óx,‡~x\ß\ão2z5¹\Ä\Â\"cŸa\Ú{\ê\â\ëw¼\ã\Õ\"5¾F¼ {™›\ìTD¯š1\è^m(Ÿı\ìg«\÷—\Ç\áúq$L¼\è_\Ç!×½\ÛÅ‹/{\ì±G\õ–¢8*j\÷\İw9G$\Î\ß/×‡e\Ç6\Ñ\áx%^pùş\÷¿¿\Ş\ä\ØÑ>–\éJWz\ÊyqF½(Ÿ\Ñt\Úm·\İ\î\îY \ÏH+\Ğ1,¸xP‡Y—È\Ë\'–ÿMC[\å4ü\ío\Û\à!\Ö{\íµ\×È¶\õ9\Şgƒf¼¯¾.Ic-¿ù\Ío¯x\Å+ª¯ş\óŸW¯¤ç£¡•®\ÓÑ«X GO¢/\é\ä\Øû{f\êm\ãı\î±\ç\î\Û\ßş\ö=.f\"q\èl­p\Ã\r7T\ï?\İgŸ}ª¾¦\áøã¯\ÓØƒ‡\Ú\Æ\á°\ßı\îw«\ëâ…œ\Ø\Ó\'Yª/T\ôj\ò©\÷\ğ\ÆÏ²~‰CX\ÓC¬›\êTD¯š5½\Z-Ñ³\ï}\ï{\Å\Ç>\ö±\ê\ß6\Ş6w½Š~\ôi\ßx\ßq‰‹\Ş8\Â ÁqDU<ç¥·©ßƒ\'\ôŠEt¼øS\ïA“¼\ÅB\é\÷LGºÒ«0<<ü\Ğrf¼½^˜\Æ\Ïh:\Äı\ö,oÇ•>V c\Ê\'ú7\ïº\ë®w\Üy\ç\és\ÂFU\Şş\å\å\Ë[o½\õ\ë\Ò\Ç\ĞV¹‘{\ÏTİ»9>¥\÷¤ZqøX¼ÿ*yü\éO:®=\Èq‚Š8Ä¬\÷3%cÈ¡¡\÷}ZÓ™®\ÓÑ«8qQİ—›o¾y½=\ÈqB·\Ñ>9>.l<‹™:q\ãN;\íT}\'Ã‰p.»ì²‘\ëc‰!6¡“\ŞÄ™µã…œ8ANt5†\Ü\ô6½šz\Şş\ö·W‹\Ñø:NÊ•.\ël\ìNE\ôªY\ÓÙ«\Ş\Ä^\Ü8\Ò%nŠ…r¼=~¿Å‹\"±·8zT\îuüŒ±\İn»\íV½\Å$\ÉÑ¡zÏƒ\õ!\×\ñ{/~7\ÆQp@u\æ\ë\Ş=\È\ñbM./w¥Wµrn\\R/N9\ät´ˆ¸ßr\Ö\ç\Ğ6¢r ùÓ²e\Ë\îNŸ6¢»?ÿù\Ïÿ |bY–\Şw›\å2Œ–X \õY\Å\ñ\Ëıx@5 \Ä\ĞZ\ïÙ‰C§\ã0¦8\ÑI\ï\ö±w\'†ƒ\ô¿7\Ìx>NP’~\Ït¤+ƒAú\ï<\èÄ \õ•^&\Òz1ƒi\ì¹y\ÈCR\õ«w»4\ãDpq\æ×¯~\õ«Eù\\P|\êSŸªaŒCm\ÓM$\Ş‡1\Æ\á°1Ä¾\å-o©.w2¥É›^\Å\Â4^‰Ï›­/‹½z\ñü”ni²S½\Úø¦£Wi\â\ñ{(^(C\õ£c\õu\ñ\ö¢xŒqøuıoü=Ş’½‰C\ë\ëC«\ã}\Çq\È}|/\Ä0G}tÕ©\èc¼€S¿˜\Üû\äøx²x(\ÎJÛ Ó•^\Õ\Êÿ\Ï\ßX/N‡‡‡¾9\îo\ö\ì\Ù#‡W\Ç\ãI#\ĞQ3g\Î|jù$sœ$¥	\å/«C\Ë\'–\Õq?\é}·YƒÁX‰CG\Û\ëW\'\ŞGÆ¡\ÒÿøÇ«¯\ã=zq8mœÔ¤\Ş.şw\Ùe—j\0Io#ƒküÒŠ³{¦\×\r:]¦»Wq›øœ\Ï\ô\ò4_ÿú\×G\Ş{g¹…Mt%\İ.g\áb\áÂ…\Åø\Ã\â¸ã«†\Ù\Ø\ãgmb‰“\Åp\Z{ffÌ˜Q¼ù\Ío®•Œ*\Å\ñYº\ñj~zûMF¯&—xÎˆCX\ã\Ô\Ş\Ë\ãg‡\ñ§\ÛG6v§\"zÕ¬A\÷\ê}‰·Å‚9GŒ\ö\á\ŞC®Gûh°\Ş\Äsbü{Š\ã\ğş\ôúœÒ•^\õ*ÿ?_Y/P\ã\ã\Ú)\î¯g\ï\ñ\Ê\ô±7{\öì­¶\ß~û[\ã³&7¦K.¹diù¤rU_u\Ëm0\èM}\Ö\Ö{\Êx·kCº2Lw¯bpL\Ï<Zš\Ø[\'kJ?\ëvº£WƒKŠ\èUs\ÚĞ«M)]\éU¯r>İ²œ#\ïªªK—.MG\ÍF\Äı\ô,\ïŠÇ‘>6`0<<¼\ÃÜ¹so\ÚX{’\×\í9¾²\Ì\ö\é}uÁ ¯te0Ğ«¼¢W\ÒD\ôJšHWz•\Z\Z\ZúF½X£\Ö\â¹&\Å\í\÷Z\÷Ÿ>&`{z·\İv\Û\ë<\ò\È\ë\'{\â®8!×º\÷ÿ£‹{kƒ¼Ò•Á@¯\òŠ^I\Ñ+i\"]\éUjÎœ9›•3\åY\õ‚5\Şû\İ\Ô\"9n·¼¿‘=\Öq¿qÿ\éc61CCCO>vŞ¼y×œx\â‰7Œ\÷s’\Ë\í\Ö~ø\á‹\Ë\'“\Ê·“\Şv—\òJW½\Ê+z%MD¯¤‰t¥W£)\ç\Ê-\Ê\Ä\'¢Œ\ìI\ÏEß˜\â\öz\÷¯»¿-\Ò\Çl\Â\â#™\Ê\'†¶\Ùf›\÷\ßÿ¿._¾|\Õy\çwÙµ\×^{Kù<r\ó\ÕW_}\Ñ\ÙgŸ}ú¯~\õ«#,Xpt¹\íµ±}—>\ÊiCy¥+ƒ^\å½’&¢W\ÒDºÒ«±”‹\×g\ö.’#q\"­©\İ:¾?9!Wµ8ûK@e\æÌ™›—Oó‡††*ÿ<µ\ç\É)ş<u\İ\å\óc»\ô{»\Ì`Wº2\èU^\Ñ+i\"z%M¤+½ÚYÿ¿\'y\äp\ëH\ìM3\Ñ\Ç\É\'\"¶\ïK\ö\ZW‡U\Çı¤\÷\rÀ=0ä•®z•W\ôJšˆ^I\éJ¯\îI¼\'xİ‰»Ò…m±û\î»‹/.\Î8\ãŒ\ê\ãæ®»\îºj1\Æ\ß\ã\ò¸~·\İv\ëûŞ¸½¸]\ï9˜$ƒA^\é\Ê` WyE¯¤‰\è•4‘®\ôj¼\Ö}\Ô\È\ç$O1+}”À\òJW½\Ê+z%MD¯¤‰t¥WU.l·*¸K\Ê\Ü>\Ê\ÂwC‰\í—\Ä\÷§·	À$\òJW½\Ê+z%MD¯¤‰t¥W“5gÎœ‡”\ŞCCCÿ]ş¹¼\Ì\Åen]·?\ã\ï\Ë\×]?#¶Oo€)0ä•®z•W\ôJšˆ^I\éJ¯\0h)ƒA^\é\Ê` WyE¯¤‰\è•4‘®\ô\n€–2ä•®z•W\ôJšˆ^I\éJ¯\0h)ƒA^\é\Ê` WyE¯¤‰\è•4‘®\ô\n€–2ä•®m\ê\Õ-·\ÜR¬ZµjÂ‰\ïKo+\×\è\Õ\àS\÷*\í\ÉD/\Ï9z%M¤+½ ¥y¥+ƒA›z‹’\ò!O8\ñ}\ém\å\Z½\Z|\ê^¥=™\è\å9G¯¤‰t¥W\0´”Á ¯te0hS¯\ìAn6\õj¬\ïD/\Ï9z%M¤+½ ¥y¥+ƒ^\å½\Z|\ÆZ\ğN\ô\òœ£W\ÒDº\Ò+\0Z\Ê`Wº2\èU^Ñ«Ág¬\ïD/\Ï9z%M¤+½ ¥y¥+ƒ^\å½\Z|\ÆZ\ğN\ô\òœ£W\ÒDº\Ò+\0Z\Ê`Wº2´©WŞƒ\Üm\ê\ÕXŞ‰^s\ôJšHWz@K\òJWƒ6\õª^˜L42ƒ\×\Æ^¥=™\è\å9G¯¤‰t¥W\0´”Á ¯te0hS¯\ìAn6\õj¬\ïD/\Ï9z%M¤+½ ¥y¥+ƒ^\å½\Z|\ÆZ\ğN\ô\òœ£W\ÒDº\Ò+\0Z\Ê`Wº2\èU^Ñ«Ág¬\ïD/\Ï9z%M¤+½ ¥y¥+ƒ^\å½\Z|\ÆZ\ğN\ô\òœ£W\ÒDº\Ò+\0Z\Ê`Wº2´©WŞƒ\Üm\ê\ÕXŞ‰^s\ôJšHWz@K-_¾ü\îµk\×\öı‚’Á§ü9\\U·¥?£6jS¯\ê…\ÉDÓ–…Œ^MO\ÆZ\ğN\ô\ò\\£W\ÒDº\Ô+\0Z\ê„N¸jÍš5}¿¤d\ğ¹\ô\ÒK/ƒSÓŸQµ©W]ßƒ¬WÓ“ºWiO&zy®\Ñ+i\"]\ê\0-µbÅŠwü\ñ7®^½úZ¯ OO\Ê\÷Õ—\\r\ÉOÊ¡\à²2oKFm¤W\Ó½’&¢W\ÒDº\Ø+\0Z,~\Å+¶en/S½ÿGšøwÿN\r\ñß³\î¿K¯¦\'z%MD¯¤‰t²W\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@Gı•‡‹œ\Ğ\Õ\0\0\0\0IEND®B`‚',1),('1820703376704737283',1,'è¯·å‡æµç¨‹ï¼ˆå­æµç¨‹ï¼‰-leave6.bpmn20.xml','1820703376704737282',_binary '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:bioc=\"http://bpmn.io/schema/bpmn/biocolor/1.0\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:di=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"leave6\" name=\"è¯·å‡æµç¨‹ï¼ˆå­æµç¨‹ï¼‰\">\n    <startEvent id=\"startNode1\" name=\"å¼€å§‹\">\n      <outgoing>Flow_1mu0fz5</outgoing>\n    </startEvent>\n    <userTask id=\"Activity_0zy3g6j\" name=\"ç”³è¯·äºº\" flowable:formKey=\"static:1\">\n      <incoming>Flow_1mu0fz5</incoming>\n      <outgoing>Flow_03931vt</outgoing>\n    </userTask>\n    <sequenceFlow id=\"Flow_1mu0fz5\" sourceRef=\"startNode1\" targetRef=\"Activity_0zy3g6j\" />\n    <sequenceFlow id=\"Flow_03931vt\" sourceRef=\"Activity_0zy3g6j\" targetRef=\"Activity_15to8yb\" />\n    <subProcess id=\"Activity_15to8yb\">\n      <incoming>Flow_03931vt</incoming>\n      <outgoing>Flow_0e4ru1l</outgoing>\n      <startEvent id=\"Event_14f0d54\">\n        <outgoing>Flow_0y1q06j</outgoing>\n      </startEvent>\n      <userTask id=\"Activity_0x88dc2\" name=\"ç»„é•¿\" flowable:assignee=\"1\">\n        <extensionElements />\n        <incoming>Flow_0y1q06j</incoming>\n        <outgoing>Flow_1kj44n7</outgoing>\n      </userTask>\n      <sequenceFlow id=\"Flow_0y1q06j\" sourceRef=\"Event_14f0d54\" targetRef=\"Activity_0x88dc2\" />\n      <userTask id=\"Activity_15z7u3k\" name=\"éƒ¨é—¨å‰¯ç»ç†\" flowable:assignee=\"1\">\n        <extensionElements />\n        <incoming>Flow_1kj44n7</incoming>\n        <outgoing>Flow_1lrkvhq</outgoing>\n      </userTask>\n      <sequenceFlow id=\"Flow_1kj44n7\" sourceRef=\"Activity_0x88dc2\" targetRef=\"Activity_15z7u3k\" />\n      <userTask id=\"Activity_1p3e8iu\" name=\"éƒ¨é—¨ç»ç†\" flowable:assignee=\"1\">\n        <extensionElements />\n        <incoming>Flow_1lrkvhq</incoming>\n        <outgoing>Flow_161ozbd</outgoing>\n      </userTask>\n      <sequenceFlow id=\"Flow_1lrkvhq\" sourceRef=\"Activity_15z7u3k\" targetRef=\"Activity_1p3e8iu\" />\n      <endEvent id=\"Event_0ategpj\">\n        <incoming>Flow_161ozbd</incoming>\n      </endEvent>\n      <sequenceFlow id=\"Flow_161ozbd\" sourceRef=\"Activity_1p3e8iu\" targetRef=\"Event_0ategpj\" />\n    </subProcess>\n    <userTask id=\"Activity_03nnma3\" name=\"æ€»ç»ç†\" flowable:assignee=\"1\">\n      <extensionElements />\n      <incoming>Flow_0e4ru1l</incoming>\n      <outgoing>Flow_19akbau</outgoing>\n    </userTask>\n    <sequenceFlow id=\"Flow_0e4ru1l\" sourceRef=\"Activity_15to8yb\" targetRef=\"Activity_03nnma3\" />\n    <endEvent id=\"Event_1ixvcma\">\n      <incoming>Flow_19akbau</incoming>\n    </endEvent>\n    <sequenceFlow id=\"Flow_19akbau\" sourceRef=\"Activity_03nnma3\" targetRef=\"Event_1ixvcma\" />\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_flow\">\n    <bpmndi:BPMNPlane id=\"BPMNPlane_flow\" bpmnElement=\"leave6\">\n      <bpmndi:BPMNShape id=\"BPMNShape_startNode1\" bpmnElement=\"startNode1\" bioc:stroke=\"\">\n        <omgdc:Bounds x=\"240\" y=\"200\" width=\"30\" height=\"30\" />\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds x=\"242\" y=\"237\" width=\"23\" height=\"14\" />\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_0zy3g6j_di\" bpmnElement=\"Activity_0zy3g6j\">\n        <omgdc:Bounds x=\"320\" y=\"175\" width=\"100\" height=\"80\" />\n        <bpmndi:BPMNLabel />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_0b5ys91_di\" bpmnElement=\"Activity_15to8yb\" isExpanded=\"true\">\n        <omgdc:Bounds x=\"460\" y=\"115\" width=\"750\" height=\"200\" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Event_14f0d54_di\" bpmnElement=\"Event_14f0d54\">\n        <omgdc:Bounds x=\"500.33333333333326\" y=\"197\" width=\"36\" height=\"36\" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_0x88dc2_di\" bpmnElement=\"Activity_0x88dc2\">\n        <omgdc:Bounds x=\"590\" y=\"175\" width=\"100\" height=\"80\" />\n        <bpmndi:BPMNLabel />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_15z7u3k_di\" bpmnElement=\"Activity_15z7u3k\">\n        <omgdc:Bounds x=\"750\" y=\"175\" width=\"100\" height=\"80\" />\n        <bpmndi:BPMNLabel />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_1p3e8iu_di\" bpmnElement=\"Activity_1p3e8iu\">\n        <omgdc:Bounds x=\"910\" y=\"175\" width=\"100\" height=\"80\" />\n        <bpmndi:BPMNLabel />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Event_0ategpj_di\" bpmnElement=\"Event_0ategpj\">\n        <omgdc:Bounds x=\"1072\" y=\"197\" width=\"36\" height=\"36\" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge id=\"Flow_0y1q06j_di\" bpmnElement=\"Flow_0y1q06j\">\n        <di:waypoint x=\"536\" y=\"215\" />\n        <di:waypoint x=\"590\" y=\"215\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_1kj44n7_di\" bpmnElement=\"Flow_1kj44n7\">\n        <di:waypoint x=\"690\" y=\"215\" />\n        <di:waypoint x=\"750\" y=\"215\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_1lrkvhq_di\" bpmnElement=\"Flow_1lrkvhq\">\n        <di:waypoint x=\"850\" y=\"215\" />\n        <di:waypoint x=\"910\" y=\"215\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_161ozbd_di\" bpmnElement=\"Flow_161ozbd\">\n        <di:waypoint x=\"1010\" y=\"215\" />\n        <di:waypoint x=\"1072\" y=\"215\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNShape id=\"Activity_03nnma3_di\" bpmnElement=\"Activity_03nnma3\">\n        <omgdc:Bounds x=\"1260\" y=\"175\" width=\"100\" height=\"80\" />\n        <bpmndi:BPMNLabel />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Event_1ixvcma_di\" bpmnElement=\"Event_1ixvcma\">\n        <omgdc:Bounds x=\"1412\" y=\"197\" width=\"36\" height=\"36\" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge id=\"Flow_1mu0fz5_di\" bpmnElement=\"Flow_1mu0fz5\">\n        <di:waypoint x=\"270\" y=\"215\" />\n        <di:waypoint x=\"320\" y=\"215\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_03931vt_di\" bpmnElement=\"Flow_03931vt\">\n        <di:waypoint x=\"420\" y=\"215\" />\n        <di:waypoint x=\"460\" y=\"215\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_0e4ru1l_di\" bpmnElement=\"Flow_0e4ru1l\">\n        <di:waypoint x=\"1210\" y=\"215\" />\n        <di:waypoint x=\"1260\" y=\"215\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_19akbau_di\" bpmnElement=\"Flow_19akbau\">\n        <di:waypoint x=\"1360\" y=\"215\" />\n        <di:waypoint x=\"1412\" y=\"215\" />\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('1820703377069641730',1,'è¯·å‡æµç¨‹ï¼ˆå­æµç¨‹ï¼‰-leave6.leave6.png','1820703376704737282',_binary '‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0²\0\0E\0\0\09=?\0\04\ÜIDATx^\í\İ´\\ey7pú±ŠRz\Ñ\Ş[Koj¯\Ö\Ş¥µ]\Úji—vY-NP ‘«‚E­\ğ¡[Z´~ ¸jk¥D\ÊM6 \ä/@D.*—$%j\ö7\ÏÈœo\òœsÂ™$\ç\ìw\Ïûû­\õ¬œ\Ì\ì3{\'\ç9\ïü\ßw\ö\ì\Ùi\'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\àÉ¬Y³\æ\ç>úè›Ÿû\Ü\ç~k—]viz7)¥”RJ)¥Z¬\ïı\Ş\ï}ü™\Ï|\æWv\ß}\÷7\õş¾\óN\0\0P³X\Ä~\Ş\ó\÷­—¼\ä%\Í\r7\Ü\ĞlŞ¼¹\0\0\Ú¹<\òù_ü\Å_|k\×]w½n\'‹\Ù\0\0\Ôì¨£ºù\Å/~q\Î\Í\0\0@!\ö\Øcû{\Ñ}Y\Î\ò\0\0P\ßú­\ßúVœ\é\0\0”\éº\ë®{°\İo\ÈY\0\0ª\ñ”§<\Å\åD\0\0 `‘\×{\Ñ}S\Î\ò\0\0P“œ“\0€\ÂDn\ÏA\0\0j’32\0\0P˜\È\í9\È\0@MrF\0\0\n¹=y\0\0¨I\Î\È\0\0@a\"·\ç \0\05\É\0\0(L\ä\ö\ä\0 &9#\0\0…‰Üƒ<\0\0\Ô$gd\0\0 0‘\Ûs\0€š\äŒ\0\0&r{\ò\0\0P“œ‘\0€\ÂDn\ÏA\0\0j’32\0\0P˜\È\í9\È\0@MrF\0\0\n¹=y\0\0¨I\Î\È\0\0@a\"·\ç \0\05\É\0\0(L\ä\ö\ä\0 &9#\0\0…‰Üƒ<\0\0\Ô$gd\0\0 0‘\Ûs\0€š\äŒ\0\0&r{\ò\0\0P“œ‘\0€\ÂDn\ÏA\0\0j’32\0\0P˜\È\í9\È\0@MrF\0\0\n¹=y\0\0¨I\Î\È\0\0@a\"·\ç \0\05\É\0\0(L\ä\ö\ä\0 &9#\0\0…‰Üƒ<\0\0\Ô$gd\0\0 0‘\Ûs\0€š\äŒ\0\0&r{\ò\0\0P“œ‘\0€\ÂDn\ÏA\0\0j’32\0\0P˜\È\í9\È\0@MrF\0\0\n¹=y\0\0¨I\Î\È\0\0@a\"·\ç \0\05\É\0\0(L\ä\ö\ä\0 &9#\0\0…‰Üƒ<\0\0\Ô$gd\0\0 0‘\Ûs\0€š\äŒ\0\0&r{\ò\0\0P“œ‘\0€\ÂDn\ÏA\0\0j’32\0\0P˜\È\í9\È\0@MrF\0\0\n¹=y\0\0¨I\Î\È\0\0@a\"·\ç \0\05\É\0\0(L\ä\ö\ä\0 &9#\0\0…‰Üƒ<\0\0\Ô$gd\0\0 0‘\Ûs\0€š\äŒ\0\0&r{\ò\0\0P“œ‘\0€\ÂDn\ÏA\0\0j’32\0\0P˜\È\í9\È\0@MrF\0\0\n¹=y\0\0¨I\Î\È\0\0@a\"·\ç \0\05\É\0\0(L\ä\ö\ä\0 &9#\0\0…‰Üƒ<\0\0\Ô$gd\0\0 0‘\Ûs\0€š\äŒ\0\0&r{\ò\0\0P“œ‘\0€\ÂDn\ÏA\0\0j’32\0\0P˜\È\í9\È\0@MrF\0\0\n¹=y\0\0¨I\Î\È\0\0@a\"·\ç \0\05\É\0\0(L\ä\ö\ä\0 &9#\0\0…‰Üƒ<\0\0\Ô$gd\0\0 0‘\Ûs\0\è´^\Æ\Ù\å\î»\ïş\Ğ\õ\×_ÿ­+V4û\Ø\Ç\Ô<W\ïÿı\ñ•+W®¹êª«^š>\Ê™J\İs\Ï=MoÜˆş\Ò\Ój\î+şß¯¹\æšæ®»\î\Ê?š*\è¿vKÿ\é¿6«\öşƒÙŠÜƒ|5æ«­W\Ç\æ«\0Œ³^(8¿\÷¤\Ô<\ğÀ\ÍÆ›Í›7«y®øÿÿü\ã_\ë…\çŸQarF¦B±ˆc\Üh·\ã\Æ\ÕW_]\İbşk¿\ôŸşk³j\î?E\ä\ö\ä»\È|µı\ê\Ø|€q¯lÇ“R~²R\ó_k×®}¨>™F…\É™\nÅ™ˆÆ2jİºu\ÍUW]•DcMÿ•SúOµY5\öŒ\"r{\ò]d¾ZNud¾\nÀ8‹·gye»ŒŠŸC/l\Ê?£\Â\äŒL…Œ\å\Ô\ãFş5ıWN\é?\Õf\Õ\Ø0Š\È\í9\Èw‘q·œ\ê\È|€q€ü¥Ú«øy\äŸQarF¦BÆ²ª¶…ıWV\é?\Õf\Õ\Ö0Š\È\í9\Èw‘q·¬\êÀ|€q6\Û`\ğ\õ¯®m\î¾\á=Í­Wş\ï~\Å\×q[\ŞNm_u \äŒL…ŒeUm9ú¯¬\ÒÓ—ş›Ÿª­ÿ`‘\Ûs\ï\"\ãnYÕù*\0\ãl6Á`\Ã#\÷7·\\ş†\æ3=~‹Š\Ûâ¾¼½\Ú\ö\ê@0\È™\n7Êª\Úr\ô_Y¥ÿ¦–ş›¿ª­ÿ`‘\Ûs\ï\"\ãnYÕù*\0\ãl6Á\à\Ş[/š\nuß­O\Ù^m{u \äŒL…ŒeUm9ú¯¬\ÒSKÿ\Í_\Õ\Ö0Š\È\í9\Èw‘q·¬\êÀ|€q6›`°ú\ê·N	ƒŠû\ò\öjÛ«Á gd*d\Ü(«j[\È\Ñe•ş›Zúoşª¶şƒQDn\ÏA¾‹Œ»eU\æ«\0Œ³\Ùƒ[>vÒ”@0¨¸/o¯¶½:rF¦BÆ²ª¶…ıWVé¿©¥ÿ\æ¯j\ë?E\ä\ö\ä»È¸[Vu`¾\nÀ8Êªƒœ‘©q£¬ªm!Gÿ•Uúoj\é¿ù«\ÚúF¹=ù.2\î–U˜¯0\Îf\âSŸs TÜ—·W\Û^9#S!\ãFYU\ÛBş+«\ô\ß\Ô\Ò\óWµ\õŒ\"r{\ò]d\Ü-«:0_`œ\Í&\Ü\ñ‰ÿ3%*\î\ËÛ«m¯ƒœ‘©q£¬ªm!Gÿ•Uúoj\é¿ù«\ÚúF¹=ù.2\î–U˜¯0\Îf¾ÿ³\Í-W¼qJ(ˆ\Ûâ¾¼½\Ú\ö\ê@0\È™\n7Êª\Úr\ô_Y¥ÿ¦–ş›¿ª­ÿ`‘\Ûs\ï\"\ãnYÕù*\0\ãl6Á ê‹Ÿzß”`·\å\í\Ô\öU‚A\Î\ÈTÈ¸QVÕ¶£ÿ\Ê*ı7}\é¿ù©\ÚúF¹=ù.2\î–U˜¯0\Îf6mj\î¸\îS‚A\Ü\÷M\Ù^msu \äŒL…ŒeUm9ú¯¬\ÒÓ”ş›·ª­ÿ`‘\Ûs\ï\"\ãnYÕù*\0\ã\ìÉ‚Á†G\îo¾\ğ‰wL	ƒŠûb›ü}jÛªÁ gd*d\Ü(«j[\È\Ñe•şÛ²\ô\ßüVmı£ˆÜƒ|wËª\ÌWg3ƒM›šµw\\\Õ|\î²§„\\±Ml\ë\Õ\î\í¯ƒœ‘©q£¬ªm!Gÿ•Uú\ï‰\Ò­Tmı£ˆÜƒ|wËª\ÌWg\Óƒ\'{U{¦\òj\÷\öW‚A\Î\ÈTÈ¸QVÕ¶£ÿ\Ê*ı§ÿÚ¬\ÚúF¹=ù.2\î–U˜¯0Î¦³yU{¦Š\ïÍ§f_9#S!\ãFYU\ÛBş+«\ôŸşk³j\ë?E\ä\ö\ä»È¸[Vu`¾\nÀ8›.\ä\'ûQ+?š}u \äŒL…ŒeUm9ú¯¬\Òú¯Íª­ÿ`‘\Ûs\ï\"\ãnYÕù*\0\ãlº` Ú«ƒœ‘©q£¬ªm!Gÿ•UúOµYµ\õß¶zè¡‡šs\Ï=·Y¶lYs\ğÁ7û\ï¿³\ß~ûMVü=nûc»Ø\î‹Üƒ|wËª\ÌW\çÔ¢E‹\Ö7\÷^°`Á¿\öş\\Ñ«/\ö\ê›OŒ§\ñgü}\Å\÷\ï\Û\ç\Ç\0`;eU‚A\ÎÈ\ö\Øc5+W®l\Î8\ãŒæ¤“N\êO\à–.]ÚŸ\Ô-Y²¤9şø\ã›7¾\ñ\Í\Û\ßş\ö\æê«¯\îo…œÒª¶…ıWV\é?\Õf\Õ\Ö£º\ğ\Â\'sÍ¨\ß\ßOwEn\ÏA¾‹Œ»eU\æ«sbbb\âE½±qy¯6\ç\ñ\òI*¶_ßŸ€m ”U9#w\Ò\í·\ßŞœv\ÚiÍ¡‡Úœp\Â	\Íù\çŸ\ß\Üx\ã\Í]w\İ\Õ<ü\ğ\Ãım\â\Ïø{\Ü\÷\Çv‡rHó–·¼¥Y½zuzÄº7Êª\Úr\ô_Y¥ÿT›U[ÿ\ÍÖŠ+šE‹\åÅ”mªxœx<º\'r{\ò]d\Ü-«:0_İ¡&&&\öì…«\òØ¸µ*/\ï€eU‚A\ÎÈ²v\í\Ú\æmo{[û‚.hÖ¯_Ÿ7Ùª\Ø>¾/´O=\õ\ÔfÍš5y“*7Êª\Úr\ô_Y¥ÿT›U[ÿ=™o|\ã\Íq\Ç—Núu\Ì1\Ç4\çw\ŞV_¸ûc»ü½Q\ñ¸\ñøtG\ä\ö\ä»È¸[Vu`¾ºC,Z´\è©,8£7ş=\Ç\Ã\íOÇ\Ç\Ïû˜\ÔSş\×\õ\×_ÿ\ò\÷½\ï}Wœ|\ò\Ép\Â	—.]\Ú–,Y\ò\í^0{´wÛ§œr\Êix\à\îùûÇ™`PVu l™;\ä\â‹/\î/@Ÿs\Î9Í†\r\ò\İ#‰\ïÇ‰\ëI\Æ\ÂvmŒeUm9ú¯¬\ÒªÍª­ÿ¶\æ;\îh8\à€-L.\\Øœ}\ö\Ù\Í}\÷İ—7ßª\Ø>¾/¾ø\ñ\â\ñc?tC\ä\ö\ä»È¸[Vu`¾º\İz\ã\İ\îŸ™\Ë\ñ´WŸı\ä}•\ëO½\ì²\Ë\Ş\õ†7¼\á[‹/n\Î<\ó\ÌfÕªUÓ¾j·\Çı|\ğcGy\äİ‡r\È^ù\ñÆ‘`PVu lù\Ì\Ü\ïz×»š\Ã?¼¹û\î»\ó]\Û%/®!yú\é§\ç»Æšq£¬ªm!Gÿ•UúOµYµ\õ\ßLn¾ù\æ)\àøÖ·¾µ¹\÷\Ş{\ó¦#‰\ï\ÇÉ‹9±?\Ê¹=ù.2\î–U˜¯n—‰‰‰_\é\Õı\ó1\ö\ê\Ş\Ø_> R«V­:ü”SN\Ùo\ç¸şú\ëgı!m±]l\ÔQG}ûÕ¯~\õM,xf~\ìq\"”UùW¦xq	×¿ş\õ\Í#<’\ï\Ú!\âq_\÷º\×\õ\÷Q\ãFYU\ÛBş+«\ôŸj³j\ë¿\é\Ä\ÒÃ‹Ø±\Ğ|\ÑE\åÍ¶K<\Ş\ğÙ„\ñµ3³\Ë¹=ù.2\î–U˜¯n³ı¾{&\ö\ä\"\ö|Œ§±˜û\Í\ÇT¤76|\Ï\å—_~\Şa‡\Ö\\r\É%\Íw¾\ó<v\ÌJ|_|ÿ¢E‹¾>ÎŸ0+”UùW¥h\ï|\ç;û\Ì\ñ;—\â\ñO<\ñ\ÄşH\ÖÀ¸QVÕ¶£ÿ\Ê*ı§Ú¬\Úú/‹kV_N\äÀœ³³¥\ãq\ã\ñûŠıºfv\Ù\"·\ç \ßE\Æİ²ª\ó\Õm×¬¾œ\È|§½ú´kfC¥zc\Â\÷,_¾üÿ\Æ[ı?ÿù\Ï\ç\ñb›\Ä\ã,^¼ø›.<8\ïoeU‚Aş)V¼\Ú}\ÄG\ÌÙ™\ØY\ì\'Æ\ó\Ï??\ß5vŒeUm9ú¯¬\ÒªÍª­ÿ²\ávœK~\Ä\ãŸIû§\\‘\Ûs\ï\"\ãnYÕù\ê6y\âƒ[Ocÿù˜€\nÄ™\ØK–,ix\à<Nl—x¼<pÃ¾û\îûÂ¼Ï®Êªƒü\ëQ¤øP¸.ş¾&\ö“‰ı-Z´h\ä\é\Z\ãFYU\ÛBş+«\ôŸj³j\ë¿a+V¬>›¯ÿ¡\Ö\ó!\ö3¼\ß8\Ê¹=ù.2\î–U˜¯lbbb\Ï\Şx\öX\Ë\ã\écqùØ€1v\İu\×‹\Ø;\êL\ì¬\÷¸pÀ\ì³\Ï>\Ï\Êû\î2Á ¬\ê@0È¿\ZEŠ\Ò8\çœs\ò\Í\ó\â½\ï}\ï\Ø_/Û¸QVÕ¶£ÿ\Ê*ı§Ú¬\ÚúoX¼p>X\0‰\Ü3Ÿ†?°,ƒ2En\ÏA¾‹Œ»eU\æ«#\ëe«JO\ã8\ò±cª\÷ûÿ\Ô7½\éM\ãš\Ös\é\Â/|d\áÂ…—\åıw™`PVu \ä_‹\â¬^½º9\äCšG}4\ß5/b¿tPs\Ûm·\å»Æ†q£¬ªm!Gÿ•UúOµYµ\õ\ß@oN2¹\ğoM¿\÷\Ş{\ó&s*\ö7ü–ø8\Ê¹=ù.2\î–U˜¯$\Şu_\Òx:W\0¦qé¥—}\Ì1\Çl\ó;\ÎV<ş\âÅ‹\×\÷—\äc\è*Á ¬\ê@0È¿\Å9\å”Sš\åË—\ç›\ç\Õ\\Ğœp\Â	ù\æ±a\Ü(«j[\È\Ñe•şSmVmı7Ÿ\É1X\ô8û\ì³\ó\İ\ó\"\ö;8†8\Ê¹=ù.2\î–U˜¯¤7†-/i<\ã\É\ÇŒ™\Ş\ïıÿzı\ë_ÿ­ë¯¿>s\â\Úk¯ıjop¹&GW	eU‚Aş•(\Êc=Ö¿6\öƒ>˜\ïšW±ÿW½\êUı\ãGÆ²ª¶…ıWV\é?\Õf\Õ\Ö!2\ÆĞ‚Ç¼Ÿ=8û>¶³SEn\ÏA¾‹Œ»eUæ«³¶p\áÂ§\÷Æ¯Í…§›\ã¸\ò±c\äº\ë®{Y\\F`¾Œb?û\ï¿ÿW\÷\ÙgŸg\äc)Io\0¼ºW\ÏÏ·g‚AY\ÕV0˜m¿\ìTøBv|\àĞ²e\Ë\òÍ­8úè£›+¯¼2\ß\\´ƒ>¸™\Í%šŒeÕ¸,\ä\è¿n–şSmÖ¸\ô\ßÀlú\ğ\ÜsÏ\\\ğˆw¤¶)\ö?8–8.\Ê¹=ù’\Ìvşa\Ü-«Úš¯j6ıÕ»\ï\Ç\Ó8®|¬À9\çœs>v\æ™g\æq`N|\òÉ·,X°`i>–’\r‚[Àƒ²ª­`0\Û~Ù©\ğ…\ìø°Œ\ó\Ï??\ßÜŠ}\èCû\Ğ\ÇA<\ÙDÚ¸QV\ËBş\ëf\é?\ÕfKÿ\rÌ¦\ãûÁv\ïÿû\ó\İ\ó*\ö?8–RN$\àÿ‹Üƒ|If;ÿ0\î–Um\ÍWG5›ş\ê\İş\Ç\Ó8®|¬À9\å”S\Ö\Ï\×eE®¼\ò\Ê[\÷+ü\ÚECƒ\àVpÁ ¬j+Ì¶_v*|!ûø\ãon¼\ñ\Æ|s+\â8^ı\êWç›‹–û`¦‰´q£¬\Z—…ı\×\Í\Òª\Í\Z—ş˜M\Æmƒû?\õ©Omq\ß|‹ı+e‰Üƒ|Ir¿\ï7\ÃüÃ¸[Vµ5_\Õlúkbb\âª\Ç\Ó8®\á\ã\ÆÌ²e\Ë6\Ş}\÷\İy˜S·\ß~û—z\Ì\rùXJ2\ÍÀ=\í\0.”Umƒiúd\Ú~Ù©\ğ…\ì#<²™\ï\ñ`&qq½\î.™\æ\çß¯<‘6n”Uã²“ûNÿu£\ôŸj³Æ¥ÿrÿM×‡.œ¼½\í\ÌûKe‰\Ü>”á‹“û|¨®\Ş\Ï|µ\Øjk¾:ªiújJ\õş¼gp{I\ãiWú\ç\0\ãdÉ’%\å+_\É\ãÀœzø\á‡7\ô—û\ó±”dš;W\0/9ü\ÏÿüO\óè£N¹}¦ºé¦›š¯}\íkSn\Ï¦\ğ…/|a\Ê\í%T[Á`šş\È\Õï—\n_È‰\Ş|3‰\ã8\à€\ò\ÍE›\æ\ç¾E\r&\Ò%ƒú\Ìg>\ÓlØ°¡ÿ\õÆ\'oÿ\Æ7¾1e\Ûu\ë\Ö5«W¯\Ş\â¶5k\Öl\ñ}%×¸,\ä\ä~\Ë5_ı}s\Ë-·Lş=‡}³iÓ¦-¶ı\ìg?\Û<\ò\È#S#\ê›\ßü\æ”Û†+¯†{\ìº\ë®\Û\âşxZ¿~ı”\ï+­/\õ\ßü\Ô\\\õeWúl¦\Z—ş\È}—+úpbbb\ò\ïmg\Øÿ\àX\â¸(K\ä\öù‹’û{šºz¿\ç«\Ã\ó\Í‡#s\æm\Õ\õ1vºjk¾:ªiú)W\ô\×7/l<}4ÿ{€1\ò\ÊW¾²ù\ö·¿Ç9\Õ\Ûß£\Ó„¬’‚A\\\í¹\ç\Í>\ğş\×_ÿú×·¸ï¬³\ÎjşùŸÿy‹\Û\âz\Äq6H|ı\ĞCMyüA]q\Å\Í\Î;\ïÜ¬Zµj\Ê}mWşù”V;¾½ÿşû\Ïûx0“8üÿ7.UÒ¸1Sı\Õ_ıU\ó\Ú×¾¶?Qø\İ\ßı\İ&>8\ê\÷ÿ\÷›ù—\Ùb\Û\Ûn»­ùø\æ¾û\î\ëÿ=…ş\ì\Ïş¬F}~\Ü+ÿ|Æ½\æºÿ\â¹\è\÷~\ï\÷ú\Ï1Y3d\â\ïx`¿/\Ş\ğ†7\ô·‹>‰\ç‘_ø…_hn¸\á†\æ\Øc\ì³‹\ö\Øc\Éc\ãşøşáŠ¾\\´h\Ñ\ädv\÷\İwo®¹\æš\É\ãXºti\óò—¿¼¹ü\òË·ø¾_ş\å_\ŞbAsP1™	\óÚµk·¸=.s”·İ‘•>\ã^s\İ3\Õ\\\ôeÔ¨}\ÕV¯MWù\çS[µyrÖ¡,¹_ºZm»3UŒ·§vZÿ\ë~\ô£ı\ñv!s:Æ–4¾\ÎTù\ç3.U\Øxú¼\îŒ‘\Ã;\ì\Û\óı\ê\Ùú\õ\ë\ïÜ¯»gd_½_¡oÕŠW³ÿ\äOşdr\Â\õ“?ù“ı\'şø:/*\Å+\ÛOy\ÊSš¸>ú¡‡:¹@“º\Ø\î\ğ›s\Î9g\Ê>¢\"p\ôş\éı3³\ó}mW[¯pO\Ó\'\Ó\ö\ËN…/dt\ĞA­¿š>\Ç\ñŠW¼\"\ß\\´i~şı\ê\Ú[\ëc2\ñ\ìg?»úc’\ğ£?ú£“\÷\í³\Ï>\Í\Å_¼\Å\ö1aøÙŸı\ÙÉ¿¿\æ5¯\é/\ö\Üs\Ï=S»\Ä\Z—3s\ß\Íwÿ\Å\â\àq\Ç\×>y\Îs\Óü\Î\ïüN\óÛ¿ı\Û\ÍQG\ÕüÚ¯ıZ›x5w\â\ëø`Ù˜Œ\î»\ï¾ıŠI\ç\à]\0W]uU\ó\Çü\Ç[<ş»\ßı\î\æ¥/}\é/ª<ü\ğ\Ãı\ç½xş‹}\àú\ÛÆ»baû\Ë_şrÿ\İûï¿¿{|\ßG1ù˜q,ƒÇ‹\Çù\ßøş1n‹ŠşŸ\Ë\ç;ı7·5—}9\Û>‹*¡×¦«qé¿\Ü\Ó\õ¡3²™­\È\íC¾8¹Ï‡\ê\êı\n¯F\ÅX¹ë®»\ö_ü›¿ù›şØšOÈŠš\í[\êø:Sµ5_\Õ4}5¥¿\â\Ì\çÁí…§\ÎÈ†qv\ì±\Ç>:\ß\×3º\í¶\Û>µ_\÷®‘½E ()\Üz\ë­\Í/ı\Ò/Mş=\È?ù\ÉO\ö¿>\õ\ÔS›×½\îu[lÿ\ßÿı\ßı?ÿ\éŸş©?i‹E\ì˜\àÅ¢\÷\ó\÷¼/K\ò\÷¼§ù‘ù‘şYMù¾¶«­`0\Û~Ù©\ğ…\ìøp\Åùf\Ç}\Ù%¹\ò\Î@I\ã\Æt\õ·û·\Íı\×\õb‚\ñ\ã?ş\ã“\÷=\ÙBv|`h|\ÏLo\Ë/±\Æe!§„ş‹/b0\Ş´|ù\òşbaL@cÁ0şüË¿ü\Ë\Ém/¸\à‚\æE/zÑ´—«‰Im<‡\r\ß\Çı²—½¬ÿu,X?\÷¹\Ï\íıC?\ôCı	p<ÿ\r²\ãE¹\÷½\ï}ıO°ÿùŸÿùş2\ç{nÿŸş\ô§·x\Üx\á&w\åÊ•ı\í\ñŒg\ô/k\ô\ô§?½?\r¿H3¥ÿ\æ¾\æª/Gé³¨¶{mº\Z—ş˜MºF6³¹=ù’\ä~\ßo†ùG\ã\îL\ïw·ü\ê¯şjÿ\÷3\ÆÁ8‰\ê\×ı×§¼#x”1¶\Ä\ñu¦jk¾:ª\Ù\ô\×~®‘\r´\á\ÄOüB¼Š9Ÿ>ü\á_\Ô\\–\çc)\É\Ö\ìa%ƒXLŠ	ı\à-W?\ñ?\Ñ?{-¾3\×\â\Ò!±]œi¯LÇ¤ÿ¤“N\êŸ¼ÁBvl±M\ŞGÔ›\ßü\æ-¯¤j+Ì¶_v*|!;Î¤³pKŸ<}\Øa‡å›‹6\èƒ\é&\Î\ÃJ\Z7rÅ‹_O}\êSû;?\÷s?\×?û%Ş¡18£\å\ñ§]È\ñ&.Uuú\é§oq_\Î\Ê—…œRú/\ŞIq\æ™g\ö#şŒ‰E,¾\ã\ïh.½\ô\Ò\É\í>\ò‘l±€8\\yÁ0*^<Œç¨˜\ÇÙµqû\àƒ…\ìx‹~\á_\Ø&Æ’\Ø\÷\óŸÿü\æŸøDÿŒ\Ú8\Æ\á[b\òûŒ3»c3\Î\âœ­=ŸoG–ş›Ÿ\Ú\Ñ}¹-}\Õf¯MW\ã\Ò³\éÃ¸o°]ü\Ü\Úû>f\Ê¹=ù’\Ìvş\ÑÖ¸;]\Å	Tq¢\Ä\ğmq‰ºÁ‹ÓƒÚ–1¶´\ñu¦jk¾:ª\Ù\ô\×\Ä\Ä\ÄU%§q\\ùX1r\ò\É\'Ÿ~>q\Ä—,X°`i>–’lmÀVR0¸ë®»¶zF\ö`\á9Î´~\ğÁ›ş\á\î¯t\ÇY–ƒ…ª§œrÊ”\ÇT„„¸?®Oš\ïk»\Ú\n³í—\n_\È~\ã\ß\Ø|\èC\Ê7·\â\ßÿı\ßû=\Û%[›8+i\Ü\È×‡…œ˜\Ä[\ìã¶™\ÎÈ?cÌˆÀoÅŸ\á·qÆ‚c\Ügw\çı”Tã²\Óvÿ\Å\Ç\ÙS¿ù›¿\ÙüùŸÿy¿o¢7\â<?\öc?\Ö|\îsŸ\ë\÷\Ï`û‹.ºhV†Qq&m\\k—]v\é\÷Uœ¹_Ÿx\â‰ıÇm\Ù\ñü¶bÅŠşv1\é}Õ«^Õ¿\ç\àm\Ë\ñXú§\Ú\\v\ÙeıcŠ\Ëk\Å\õ9\ãz›1‘\Ër\rŸ\Å\õ\Ó?ı\ÓSoG–ş›Ûš«¾¥\Ï\â\ï%\ô\Út5.ı70›>\\¶l\Ù\äbGœ\éÙ¦\Øÿ\àX\â¸(K\ä\ö\äK2\Ûù\Ç|»[«øœ•\é²\ãr Ã·2Æ–:¾\ÎTm\ÍWG5›ş\ê\İÿ\Ç\Ó8®|¬À\é\r\ì»/^¼ø±<Ì‰\Ş~\Ö\õ–\õ½I\Ã3\ò±tQIÁ ÎŠ\Ü\ÚB\ö\ğ¥E\â-³1‰‹¯?ü\á7\ÏzÖ³&\Ïä³­cûüøƒï‹³\ß\â\â\ò#%ıû£:\ò¯DQ®¼\ò\Ê\æ˜c\É7·\"\ÎÆ\ãG¥ı\Ş\äzû\Û\ß\Ş_\ğ‰¹bgdÆ‡˜$²c2o\å¾´H\\æ³Ÿı\ì”\Ç,¹\Æm!\ç\É\Ìeÿw\Şy\ÍK^\ò’şƒ·\n\ßq\Ç“gD\Å\íqi‡ø:úh6†ƒz\ÚÓ\Öÿ3>ˆ\ô¦›n\ê?OE\rn,d\ÇX\ñ}q™¬xQŒiƒÏ‚ˆŠÏˆboakfş\õ_ÿuÿ\íÈ·\ß~{ÿE´á³¸\â\Åş||;²\ô\ß\Ü\×\\\ô\å¨}\Õv¯MWµ\õ_ˆK;\Ú\Î<±ÿÁ±\ÄqQ–\È\í9\ÈwQ\ã\îL\õÿ\ğı,X\Ğc¼Œ¯\ãR#\ÃÛ:Æ–8¾\ÎT˜¯\ÎZo\ìÚ»”\ñ\ôè£~|h!{\ï|¬À˜9\ò\È#¿8_—ù\à?øş\ŞÀrM>†®*)¬^½z«—‰3=\Û²\ãúb\ñju\\`p\ß`q ?~\Ô;\ßù\Î\æş\èú_\ÇÙš\ñŠw„„¼][Õ`%Š/h-Z´¨D›bÿq\é€ùzm¾•4n\äŠK‰\ÄYŠ1©ˆ…8\Ëe¦3²5¼\ãP|ÀÎw\Ş9\å±K­\Úr\æ²ÿ\âÅ§Áu¬\ã«?ü\Ã?\ì\÷T|XSü/t\Ä;?\âşÙù:¨\ïû¾\ï\ëO^\ã\ò\"{\ï½wÿE\ã¹j·\İv\ë?§\r²cR\×ÒŒ33cB»q\ã\Æş7^˜‰\çÃ¼¯¨Áu5\ãÃ¤bq\ï\à,®Ÿù™Ÿ\éÿ\ä\ï\ÙQ¥ÿ\æ¾\æ¢/·¥Ï¢\Ú\ìµéª¶ş‘1†;ú?·6\Ä~‡£\í\ì\ÅT‘\Ûs\ï¢6\Æ\İ\é*\Ş\õ\Üü\Ú×¾¶?\ö\Äe-\ã]31\Ç;¬\âşÁ¶\Û2Æ–6¾\ÎT˜¯\Î\ÚÂ…Ÿ\Ş¿66n\ã\Ê\Ç\nŒ™\Ş@¿\×QG\õ\í\ï|\ç;yLØ¡zoo`¹c\ß}\÷}A>†®*%D\ÅR¼²=øû\ğ\Ù\ñ\áE\Ã\ÎoÇŠ\ë\Åd\î?ş\ã?fuFv\\O2\ÎÆŒ\ë\rn{Á^\Ğ\rù\ZmU‚Aşµ(N|X_¼HÑ¦\÷¾\÷½ı³0\ÆUI\ãF®˜(\Ä\ñ\Å$#\Ît9ûì³§,d\Ç\÷\Ã?<y\Û\ğBvœ\åo\éŒ3»gú\ĞØ’ª¶…œ¹\ì¿8ƒ?\'gXıÁüA‚úı\ßÿıı\ëZ\Æ\Ùı\ñ\Øv¶†ƒ\Z\\B$Ÿ‘“\à¸}°\Ïo\ñ\â|L–>ú\è\æ\ğ\Ã\ï\÷uœ\í8˜ünØ°a\ò\í\É\ñœ\Ï{{\î¹g\ó¦7½©ÿ\á\ÃgqE\Ï\å¶úo\îk.úr\Ô>‹j»×¦«\Úúo`\éÒ¥“‹\ñ<×†\Ø\ï\à\âx(O\ä\öä»¨qwºŠ³¢#Æ»zc\ìŒ<\ó\Ğ/¼°Ÿûc,ŒÛ:Æ–8¾\ÎT˜¯¤7†-/i<\ã\É\ÇŒ©#8\â¦K.¹\ä\ñ<(\ì@ÿ\ã?ş\ã{z\Ë%y\ß]VJ0˜®b²µjÕª)·GÅ“{L\à\" Ä¥Egd\ÇD.\Ş\Ä1¼ı­·\Ş\Úù\ß—ˆW\Ë\ã4\ò\÷´Qù\÷¢8q¶Z\\‡._b¿q6vÇ¸Ê¿G%UL&v\Şy\çæ¨£ê¿ ?q\ëÁ[9\ãw=\Îj\Ùk¯½&\'7\ß|sÿŒ—X`Œ3ú\ãzı\ñoŒ\Å\íxÁlÉ’%S\öSRÕ¶3—ıš _\Ç\ïp,\ZÆ‚aL$¿úÕ¯6\ëÖ­›\Ü6{\â6\Ã\ßgV\ÇÙ±\ñ‚I\\ûrø¾Á\õ±£¯\â\í\Ã\ñœoQ\÷‰3´~\ê§~ªÿKüûbQ»—9\â]`“½\×ÎŒ¯\ãE\Ü\ç\âx\ãûbb}\ÖYgM¾ ;|]\Í8\ó;.KÇ–ÿ½;¢\ô\ß\Ü\×\\\ô\å(}g\Æu\\\Û\îµéª¶şˆ\çºÁ¢G\\s¾\Ï\"Œı\Å~\Ç\ÇCy\"·\ç \ßEmŒ»¹\"F†Œ¯\â\ÄÁ‹\ĞQqù\Ë8\ÆxNœ05\Ê[\Âsù(Õù\êH\ö\İw\ß¶=\ö\ã\'/+Ç“S½pş¬\Ş ¿\á\óŸÿ|vˆŞ“\Õ9½em\ì\'\ï»\ËJ3UL\Äb)\ß>¨¸~Xüg\ßş\İ\ßı]ÿ\ë3\Î8£ÿa1\ÑlÿÆ˜ÀE\0É‹\â\ñ¤g*\åû\æ»:\ò¯F‘\âl\Üû·\Ë7Ï‹\ÓO?½9\á„\ò\Íc¥\äq#*Ş–F\Ø_»v\í”ûs\Åx\ñœ\ç<g\Êg\Êü\çş\çg$–Xµ-\ä\Ìeÿ\Å[\ã\ã,ªø:ÎœŠ?cÁ0&y\Ûø`Ù¸~¾=^ ·>l4*3\Î\à\Z\Ş.z\ë\Úk¯\í\ïsp\ÍÁ}\ÃoO\Ç\Ëû®øşø3^D[¿~ı”û\çº\ô\ß\Ü\×\\\õ\å(}\Õv¯MWµ\õß°x\áu°\ğ\ñÖ·¾5\ß=§bƒ}\ÇqP¦\È\í9\ÈwQ\ã\î\Ö*\æ•q	\ÌXØŠ\Ë]Nw\r\ëQ\Æ\Ø\Ç×™ª\óÕ‘\õÆ²U%Œ§qùØ€1711\ñ¢ƒ:\è›\ñ\Ö\Ü\éK_ú\ÒÅ½Ae\Í8¾:VZ0®Ád\í\Éj¶\Ûu¡:\ò¯G‘\",\ÆYú\ñ\â\Å|ŠKTÄ‹\"±ÿqVò¸±­5<\Ù\èZÕ¶3\ßı\Ï1\Ó\õ\ÇÖ{¦\Û~\\KÿµSú\ò»U[ÿ\r‹K\Î-~\ô?ÿa>\Ä~†\÷\ÇA™\"·\ç \ßE¥Œ»\ê»Õù\ê\È&&&\ö\ìgµ<>Ç‘\r¨ÀÂ…>\ğÀ\İQgf?q&\öı½:(\ïkeU‚Aş)Vœ\í’\×?Ÿ_ù\ÊWú‹\ç±\ßqg\Ü(«j[\È\Ñe•şSmVmı—w\Üq“‹ \ñBz¼“q.\Å\ã\ÇenûŒıS®\È\í9\Èw‘q·¬\êÀ|u›,X°\àŒ\Æ\Ó\ÉKŠ\Äş\ó1‰3§_ù\ÊW>r\á…>²­\0\ìø\Ä5±×\ã™\Ø‚AYÕ`UŠ\ö–·¼¥\Í\ôø¿K\ñø\ñV\î\Ø_\rŒeUm9ú¯¬\ÒªÍª­ÿ²¸„V\\Gw°\×Ò«Å—x\Ü\áË™\Ä~cÿ”+r{\ò]d\Ü-«:0_\İ&½\ñ\í©½±\í\Ó\ó8Nûı\çc*³`Á‚g.\\¸\ğ\òÅ‹¯¿\ö\Úk¿ú\Øc\å\ñcZ½\íø\à?x^o0¹£W—\Æ\ã\ä\Ç\'‚AYÕ`eŠ\÷š×¼¦9\ò\È#\ç\ì\Ì\ìøp¶C=´¿ŸZ7Êª\Úr\ô_Y¥ÿT›U[ÿM\ç;\î\Ø\âƒ\ã\ë‹.º(o¶]\â\ñ†\ÏÄ}\Ä~)[\ä\ö\ä»È¸[Vu`¾º\Íz\ã\Ûî½ºw\Æ\Ó\É3±Ÿ\Ø\ß\îùX€Š\í»\ï¾/\è\r+\÷\ßÿ¯t\ÒIŸ[±b\Å-·\ß~û==\ô\Ğ\×{\ãÈ†|\ğ\î[o½\õSù\ÈG.<\ò\È#/\ímûPlß—k	eU‚A~.\î„8S:>ü\Î;\ï\Ìwm—¸„\Ñ+^\ñŠj\Î\Ä0n”Uµ-\äè¿²Jÿ©6«¶ş›Iœ\İ7¼˜ v\ï½\÷\æMGßŸ>ˆl^\ŞrÏ¹=ù.2\î–U˜¯n—‰‰‰_^Ì\Ë\ñ4\öû\Ë\Ç\0Ğ·\Ï>û<£7P,Y°`ÁE½??948ÅŸŸ|\â\ö%±]ş\Şq&”Uù9¹3\â\Ú\Õû\ï¿ó¶·½­Ù°aC¾{$\ñ‰â§zj2W\Ã5±3\ãFYU\ÛBş+«\ôŸj³jë¿­‰3¤‡/39\å\ì³\ÏùC¨cûø¾¼8\ïL\ì\îˆÜƒ|wËª\ÌW·\Û~\ß=3{\ò2#;b<MgaG\Å\ã;`T‚AYÕ`Ÿ›;eÍš5\Í	\'œ\Ğ_\Ğ~\÷»\ß\İ<ø\àƒy“­Z·n]s\ÖYg\õƒL<N<^ŒeUm9ú¯¬\ÒªÍª­ÿL\\³zø ‡+>3\ä¼\ó\Îkn¼\ñ\Ææ®»\î\ê_\Z-ÄŸ\ñ\÷¸=\î\í\ò\÷F\Å\ãº&v·Dn\ÏA¾‹Œ»eU\æ«;D\\³ú‰€\ÌĞ³O>ú\è)\ß\ëš\Ø\0\ÛH0(«:RD\î¦\Ûn»­9\ö\Øcû\×{\\¼xqÿU\òk®¹¦©\õ\ë\×\÷·‰?W¯^İ¬\\¹²9\ãŒ3úø\Û\Ç\÷\Å\÷\×Ì¸QVÕ¶£ÿ\Ê*ı§Ú¬\Úúo¶V¬X±\Å3nO\Å\ã\Ä\ã\Ñ=‘\Ûs\ï\"\ãnYÕù\êÕ›ÿ\í\ÙW\å±qkU<^\Ş\0#Êªƒœ‘;->\öŠ+®hşş\ïÿ¾9\ì°\Ãú“µÁ\Ûh\ã\Ïø{\Ü\÷\Çv³ı\Ğ\Øqg\Ü(«j[\È\Ñe•şSmVmı7ª/¼°Yºti^H™U\Å\÷\Å\÷\Ó]‘\Ûs\ï\"\ãnYÕùêœ˜˜˜xQol\\Ş«\Íy¼|’Š\í—\Ç\÷\ç\Ç`eU‚A\Î\ÈTÈ¸QVÕ¶£ÿ\Ê*ı§Ú¬\Úúo[=\ô\ĞCÍ¹\ç\Û,[¶¬9ø\àƒû—X^h‰¿\Ç\íql\Û\Ó}‘\Ûs\ï\"\ãnYÕù\êœZ´h\Ñ\Óz\ã\æ\Ş,ø\×ŞŸ+z\õ\Å^}\ó‰\ñ4şŒ¿¯x\âş½cûü\0lÁ ¬\ê@0\È™\n7Êª\Úr\ô_Y¥ÿT›U[ÿÁ(\"·\ç \ßE\Æİ²ª\óU\0Æ™`PVu \äŒL…ŒeUm9ú¯¬\ÒªÍª­ÿ`‘\Ûs\ï\"\ãnYÕù*\0\ãL0(«:rF¦BÆ²ª¶…ıWV\é?\Õf\Õ\Ö0Š\È\í9\Èw‘q·¬\êÀ|€q&”U9#S!\ãFYU\ÛBş+«\ôŸj³j\ë?E\ä\ö\ä»È¸[Vu`¾\nÀ8Êªƒœ‘©q£¬ªm!Gÿ•UúOµYµ\õŒ\"r{\ò]d\Ü-«:0_`œ	eU‚A\Î\ÈTÈ¸QVÕ¶£ÿ\Ê*ı§Ú¬\ÚúF¹=ù.2\î–U˜¯0\Îƒ²ªÁ gd*d\Ü(«j[\È\Ñe•şSmVmı£ˆÜƒ|wËª\ÌWg‚AYÕ`322n”Uµ-\äè¿²Jÿ©6«¶şƒQDn\ÏA¾‹Œ»eU\æ«\0Œ3Á ¬\ê@0\È™\n7Êª\Úr\ô_Y¥ÿT›U[ÿÁ(\"·\ç \ßE\Æİ²ª\óU\0Æ™`PVu \äŒL…ŒeUm9ú¯¬\ÒªÍª­ÿ`‘\Ûs\ï\"\ãnYÕù*\0\ãL0(«:rF¦BÆ²ª¶…ıWV\é?\Õf\Õ\Ö0Š\È\í9\Èw‘q·¬\êÀ|€q&”U9#S!\ãFYU\ÛBş+«\ôŸj³j\ë?E\ä\ö\ä»È¸[Vu`¾\nÀ8Êªƒœ‘©q£¬ªm!Gÿ•UúOµYµ\õŒ\"r{\ò]d\Ü-«:0_`œ	eU‚A\Î\ÈTÈ¸QVÕ¶£ÿ\Ê*ı§Ú¬\ÚúF¹=ù.2\î–U˜¯0\Îƒ²ªÁ gd*d\Ü(«j[\È\Ñe•şSmVmı£ˆÜƒ|wËª\ÌWg‚AYÕ`322n”Uµ-\äè¿²Jÿ©6«¶şƒQDn\ÏA¾‹Œ»eU\æ«\0Œ3Á ¬\ê@0\È™\n7Êª\Úr\ô_Y¥ÿT›U[ÿÁ(\"·\ç \ßE\Æİ²ª\óU\0\ÆÙŠ+ß¸q\ã”\'(5ÿ\Õû9¬\éƒMùgT˜œ‘©PoÜˆ~\Ò\Ãjş+~µ-\ä\è¿rJÿ©6«\ÆşƒQDn\ÏA¾‹\ÌWË©\ÌWg+W®\\\óÀLy’R\ó__ş\ò—?\ØŸ\Ì?£\Â\äŒL…®¹\æšÆ¸QF\İw\ß}\ÍUW]•DcMÿ•SúOµY5\öŒ\"r{\ò]d¾ZNud¾\nÀ8\ëM\0^ú\ñükk×®}\È+\İ\íT\ïÿ}í—¾\ô¥\ôBÁ=½zqş&gd*t\×]w5W_}u³n\İ:g&¶T\ñÿ‹8W^yeÿ\çQı\×~\é?ı\×f\Õ\Ü0Š\È\í9\Èw‘ùjûÕ±ù*\0\ã.Œ\â•\Õ^m·hªy¯øÿÿ.„‚œ‘©T,Ä™p\Ó\ô³š§ŠÿÿZq\ô_û¥ÿ\ô_›UsÿÁlEn\ÏA¾«>f¾\Úvui¾\n\00)gd\0\0 0‘\Ûs\0€š\äŒ\0\0&r{\ò\0\0P“œ‘\0€\ÂDn\ÏA\0\0j’32\0\0P˜\È\í9\È\0@MrF\0\0\n¹=y\0\0¨I\Î\È\0\0@a\"·\ç \0\05\É\0\0(L\ä\ö\ä\0 &9#\0\0…‰Üƒ<\0\0\Ô$gd\0\0 0‘\Ûs\0€š\äŒ\0\0&r{\ò\0\0P“œ‘\0€\ÂDn\ÏA\0\0j’32\0\0P˜\È\í9\È\0@MrF\0\0\n¹=y\0\0¨I\Î\È\0\0@a\"·\ç \0\05\É\0\0(L\ä\ö\ä\0 &9#\0\0…‰Üƒ<\0\0\Ô$gd\0\0 0‘\Ûs\0€š\äŒ\0\0&r{\ò\0\0P“œ‘\0€\ÂDn\ÏA\0\0j’32\0\0P˜\È\í9\È\0@MrF\0\0\n¹=y\0\0¨I\Î\È\0\0@a\"·\ç \0\05\É\0\0(L\ä\ö\ä\0 &9#\0\0…‰Üƒ<\0\0\Ô$gd\0\0 0‘\Ûs\0€š\äŒ\0\0&r{\ò\0\0P“œ‘\0€\ÂDn\ÏA\0\0j’32\0\0P˜\È\í9\È\0@MrF\0\0\n¹=y\0\0¨I\Î\È\0\0@a\"·\ç \0\05\É\0\0(L\ä\ö\ä\0 &9#\0\0…‰Üƒ<\0\0\Ô$gd\0\0 0‘\Ûs\0€š\äŒ\0\0&r{\ò\0\0P“œ‘\0€\ÂDn\ÏA\0\0j’32\0\0P˜\È\í9\È\0@MrF\0\0\n¹=y\0\0¨I\Î\È\0\0@a\"·\ç \0\05\É\0\0(L\ä\ö\ä\0 &9#\0\0…‰Üƒ<\0\0\Ô$gd\0\0 0‘\Ûs\0€š\äŒ\0\0&r{\ò\0\0P“œ‘\0€\ÂDn\ÏA\0\0j’32\0\0P˜\È\í9\È\0@MrF\0\0\n¹=y\0\0¨I\Î\È\0\0@a\"·\ç \0\05\É\0\0(L\ä\ö\ä\0 &9#\0\0…‰Üƒ<\0\0\Ô$gd\0\0 0‘\Ûs\0€š\äŒ\0\0&r{\ò\0\0P“œ‘\0€\ÂDn\ÏA\0\0j’32\0\0P˜\È\í9\È\0@MrF\0\0\n¹=y\0\0¨I\Î\È\0\0@a\"·\ç \0\05\É\0\0(L\ä\ö\ä\0 \Z»\ì²\Ë\ã›7o\Î9\0\0(Ä¦M›\Ö\ô¢û¦œ\å\0 \Z\Ï~\ö³¾\á†rV\0\0\nqé¥—^Ö‹\î7\ä,\0\0\Õ\Ø}\÷\İß¼\×^{}+‡e\0\0 \ï¶\ÛnW\ö¢û²œ\å\0 &;\ïº\ë®\×\í±\Ç\÷]ı\õ\ë]f\0\0Ú·iÓ¦µq&\ön»\í\ö±^f¿:r{\ò\0\0P›\Å\Ç\÷\ê\Æ^m\Ş\é»$£”RJ)¥”j¯\"—G>œn\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\æ\Âÿ}™À*\Ö3ƒj\0\0\0\0IEND®B`‚',1),('1820721459888590854',1,'hist.var-entity',NULL,_binary '¬\í\0sr\0java.util.LinkedHashMap4ÀN\\lÀû\0Z\0accessOrderxr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0 \0\0\0t\0createBypt\0\ncreateTimept\0updateByt\0admint\0\nupdateTimet\02024-08-06 15:19:57t\0idt\01820702696808058882t\0usernamet\0admint\0durationt\02.50t\0	principalt\0admint\0contactPhonet\0111111111111t\0	leaveTypesr\0java.lang.Integerâ ¤\÷‡8\0I\0valuexr\0java.lang.Number†¬•”\à‹\0\0xp\0\0\0t\0titlet\0	è¯·å¹´å‡t\0leaveReasont\0ä¼‘æ¯t\0	startDatet\02024-08-07 00:00:00t\0endDatet\02024-08-09 00:00:00x\0',NULL);
/*!40000 ALTER TABLE `act_ge_bytearray` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ge_property`
--

DROP TABLE IF EXISTS `act_ge_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_ge_property` (
  `NAME_` varchar(64) COLLATE utf8_bin NOT NULL,
  `VALUE_` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int DEFAULT NULL,
  PRIMARY KEY (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ge_property`
--

LOCK TABLES `act_ge_property` WRITE;
/*!40000 ALTER TABLE `act_ge_property` DISABLE KEYS */;
INSERT INTO `act_ge_property` VALUES ('batch.schema.version','6.8.0.0',1),('cfg.execution-related-entities-count','true',1),('cfg.task-related-entities-count','true',1),('common.schema.version','6.8.0.0',1),('entitylink.schema.version','6.8.0.0',1),('eventsubscription.schema.version','6.8.0.0',1),('identitylink.schema.version','6.8.0.0',1),('job.schema.version','6.8.0.0',1),('next.dbid','1',1),('schema.history','create(6.8.0.0)',1),('schema.version','6.8.0.0',1),('task.schema.version','6.8.0.0',1),('variable.schema.version','6.8.0.0',1);
/*!40000 ALTER TABLE `act_ge_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_actinst`
--

DROP TABLE IF EXISTS `act_hi_actinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_hi_actinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT '1',
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ACT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `TRANSACTION_ORDER_` int DEFAULT NULL,
  `DURATION_` bigint DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_ACT_INST_START` (`START_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_HI_ACT_INST_EXEC` (`EXECUTION_ID_`,`ACT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_actinst`
--

LOCK TABLES `act_hi_actinst` WRITE;
/*!40000 ALTER TABLE `act_hi_actinst` DISABLE KEYS */;
INSERT INTO `act_hi_actinst` VALUES ('1820721459888590858',1,'leave1:1:1820662237058514946','1820721459888590850','1820721459888590857','startNode1',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2024-08-06 15:19:58.064','2024-08-06 15:19:58.064',1,0,NULL,''),('1820721459888590859',1,'leave1:1:1820662237058514946','1820721459888590850','1820721459888590857','Flow_1f4xioj',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-08-06 15:19:58.064','2024-08-06 15:19:58.064',2,0,NULL,''),('1820721459888590860',3,'leave1:1:1820662237058514946','1820721459888590850','1820721459888590857','Activity_14633hx','1820721459888590861',NULL,'ç”³è¯·äºº','userTask','1','2024-08-06 15:19:58.064','2024-08-06 15:20:04.712',3,6648,NULL,''),('1820721487784906753',1,'leave1:1:1820662237058514946','1820721459888590850','1820721459888590857','Flow_0cy98fl',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-08-06 15:20:04.715','2024-08-06 15:20:04.715',1,0,NULL,''),('1820721487801683970',3,'leave1:1:1820662237058514946','1820721459888590850','1820721459888590857','Activity_0lym9dc','1820721487801683971',NULL,'ç»„é•¿','userTask','1','2024-08-06 15:20:04.718','2024-08-06 15:20:04.893',2,175,NULL,''),('1820721488544075777',1,'leave1:1:1820662237058514946','1820721459888590850','1820721459888590857','Flow_1o16t5v',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-08-06 15:20:04.896','2024-08-06 15:20:04.896',1,0,NULL,''),('1820721488556658689',2,'leave1:1:1820662237058514946','1820721459888590850','1820721459888590857','Activity_1j25s1c','1820721488556658690',NULL,'éƒ¨é—¨é¢†å¯¼','userTask','1','2024-08-06 15:20:04.898','2024-08-06 15:20:05.014',2,116,NULL,''),('1820721489051586562',1,'leave1:1:1820662237058514946','1820721459888590850','1820721459888590857','Flow_0s1t2f2',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-08-06 15:20:05.017','2024-08-06 15:20:05.017',1,0,NULL,''),('1820721489064169473',1,'leave1:1:1820662237058514946','1820721459888590850','1820721459888590857','Event_1jib7oq',NULL,NULL,NULL,'endEvent',NULL,'2024-08-06 15:20:05.019','2024-08-06 15:20:05.021',2,2,NULL,'');
/*!40000 ALTER TABLE `act_hi_actinst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_attachment`
--

DROP TABLE IF EXISTS `act_hi_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_hi_attachment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `URL_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CONTENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_attachment`
--

LOCK TABLES `act_hi_attachment` WRITE;
/*!40000 ALTER TABLE `act_hi_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_comment`
--

DROP TABLE IF EXISTS `act_hi_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_hi_comment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `MESSAGE_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `FULL_MSG_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_comment`
--

LOCK TABLES `act_hi_comment` WRITE;
/*!40000 ALTER TABLE `act_hi_comment` DISABLE KEYS */;
INSERT INTO `act_hi_comment` VALUES ('1820721460295438339','event','2024-08-06 15:19:58.161','1','1820721459888590861',NULL,'AddUserLink','1_|_assignee',NULL),('1820721487663271938','pass','2024-08-06 15:20:04.686','1','1820721459888590861','1820721459888590850','AddComment','æäº¤å•æ®',_binary 'æäº¤å•æ®'),('1820721488221114369','event','2024-08-06 15:20:04.819','1','1820721487801683971',NULL,'AddUserLink','1_|_assignee',NULL),('1820721488393080834','pass','2024-08-06 15:20:04.860','1','1820721487801683971','1820721459888590850','AddComment','æµç¨‹å¼•æ“æ»¡è¶³æ¡ä»¶è‡ªåŠ¨åŠç†',_binary 'æµç¨‹å¼•æ“æ»¡è¶³æ¡ä»¶è‡ªåŠ¨åŠç†'),('1820721488917368834','pass','2024-08-06 15:20:04.985','1','1820721488556658690','1820721459888590850','AddComment','æµç¨‹å¼•æ“æ»¡è¶³æ¡ä»¶è‡ªåŠ¨åŠç†',_binary 'æµç¨‹å¼•æ“æ»¡è¶³æ¡ä»¶è‡ªåŠ¨åŠç†');
/*!40000 ALTER TABLE `act_hi_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_detail`
--

DROP TABLE IF EXISTS `act_hi_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_hi_detail` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_DETAIL_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_ACT_INST` (`ACT_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_TIME` (`TIME_`),
  KEY `ACT_IDX_HI_DETAIL_NAME` (`NAME_`),
  KEY `ACT_IDX_HI_DETAIL_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_detail`
--

LOCK TABLES `act_hi_detail` WRITE;
/*!40000 ALTER TABLE `act_hi_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_entitylink`
--

DROP TABLE IF EXISTS `act_hi_entitylink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_hi_entitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `LINK_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ELEMENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REF_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REF_SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REF_SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ROOT_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ROOT_SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HIERARCHY_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_ENT_LNK_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`,`LINK_TYPE_`),
  KEY `ACT_IDX_HI_ENT_LNK_REF_SCOPE` (`REF_SCOPE_ID_`,`REF_SCOPE_TYPE_`,`LINK_TYPE_`),
  KEY `ACT_IDX_HI_ENT_LNK_ROOT_SCOPE` (`ROOT_SCOPE_ID_`,`ROOT_SCOPE_TYPE_`,`LINK_TYPE_`),
  KEY `ACT_IDX_HI_ENT_LNK_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`,`LINK_TYPE_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_entitylink`
--

LOCK TABLES `act_hi_entitylink` WRITE;
/*!40000 ALTER TABLE `act_hi_entitylink` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_entitylink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_identitylink`
--

DROP TABLE IF EXISTS `act_hi_identitylink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_hi_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_IDENT_LNK_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_IDENT_LNK_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_IDENT_LNK_TASK` (`TASK_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_identitylink`
--

LOCK TABLES `act_hi_identitylink` WRITE;
/*!40000 ALTER TABLE `act_hi_identitylink` DISABLE KEYS */;
INSERT INTO `act_hi_identitylink` VALUES ('1820721459888590851',NULL,'starter','1',NULL,'2024-08-06 15:19:58.063','1820721459888590850',NULL,NULL,NULL,NULL),('1820721460270272513',NULL,'assignee','1','1820721459888590861','2024-08-06 15:19:58.155',NULL,NULL,NULL,NULL,NULL),('1820721460295438338',NULL,'participant','1',NULL,'2024-08-06 15:19:58.161','1820721459888590850',NULL,NULL,NULL,NULL),('1820721487713603585',NULL,'participant','1',NULL,'2024-08-06 15:20:04.697','1820721459888590850',NULL,NULL,NULL,NULL),('1820721487801683972',NULL,'candidate','1','1820721487801683971','2024-08-06 15:20:04.718',NULL,NULL,NULL,NULL,NULL),('1820721487801683973',NULL,'candidate','3','1820721487801683971','2024-08-06 15:20:04.719',NULL,NULL,NULL,NULL,NULL),('1820721487801683974',NULL,'participant','3',NULL,'2024-08-06 15:20:04.719','1820721459888590850',NULL,NULL,NULL,NULL),('1820721488200142849',NULL,'assignee','1','1820721487801683971','2024-08-06 15:20:04.813',NULL,NULL,NULL,NULL,NULL),('1820721488435023874',NULL,'participant','1',NULL,'2024-08-06 15:20:04.870','1820721459888590850',NULL,NULL,NULL,NULL),('1820721488556658691',NULL,'assignee','1','1820721488556658690','2024-08-06 15:20:04.898',NULL,NULL,NULL,NULL,NULL),('1820721488971894786',NULL,'participant','1',NULL,'2024-08-06 15:20:04.998','1820721459888590850',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `act_hi_identitylink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_procinst`
--

DROP TABLE IF EXISTS `act_hi_procinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_hi_procinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT '1',
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `END_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CALLBACK_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CALLBACK_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REFERENCE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REFERENCE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROPAGATED_STAGE_INST_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `BUSINESS_STATUS_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `PROC_INST_ID_` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PRO_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_PRO_I_BUSKEY` (`BUSINESS_KEY_`),
  KEY `ACT_IDX_HI_PRO_SUPER_PROCINST` (`SUPER_PROCESS_INSTANCE_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_procinst`
--

LOCK TABLES `act_hi_procinst` WRITE;
/*!40000 ALTER TABLE `act_hi_procinst` DISABLE KEYS */;
INSERT INTO `act_hi_procinst` VALUES ('1820721459888590850',3,'1820721459888590850','1820702696808058882','leave1:1:1820662237058514946','2024-08-06 15:19:58.063','2024-08-06 15:20:05.057',6994,'1','startNode1','Event_1jib7oq',NULL,NULL,'','è¯·å‡æµç¨‹ï¼ˆæ™®é€šæµç¨‹ï¼‰',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `act_hi_procinst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_taskinst`
--

DROP TABLE IF EXISTS `act_hi_taskinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_hi_taskinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT '1',
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROPAGATED_STAGE_INST_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `CLAIM_TIME_` datetime(3) DEFAULT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `LAST_UPDATED_TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_TASK_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_TASK_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_TASK_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_TASK_INST_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_taskinst`
--

LOCK TABLES `act_hi_taskinst` WRITE;
/*!40000 ALTER TABLE `act_hi_taskinst` DISABLE KEYS */;
INSERT INTO `act_hi_taskinst` VALUES ('1820721459888590861',3,'leave1:1:1820662237058514946',NULL,'Activity_14633hx','1820721459888590850','1820721459888590857',NULL,NULL,NULL,NULL,NULL,'ç”³è¯·äºº',NULL,NULL,NULL,'1','2024-08-06 15:19:58.064',NULL,'2024-08-06 15:20:04.702',6638,NULL,50,NULL,'static:1',NULL,'','2024-08-06 15:20:04.702'),('1820721487801683971',3,'leave1:1:1820662237058514946',NULL,'Activity_0lym9dc','1820721459888590850','1820721459888590857',NULL,NULL,NULL,NULL,NULL,'ç»„é•¿',NULL,NULL,NULL,'1','2024-08-06 15:20:04.718',NULL,'2024-08-06 15:20:04.883',165,NULL,50,NULL,NULL,NULL,'','2024-08-06 15:20:04.883'),('1820721488556658690',2,'leave1:1:1820662237058514946',NULL,'Activity_1j25s1c','1820721459888590850','1820721459888590857',NULL,NULL,NULL,NULL,NULL,'éƒ¨é—¨é¢†å¯¼',NULL,NULL,NULL,'1','2024-08-06 15:20:04.898',NULL,'2024-08-06 15:20:05.003',105,NULL,50,NULL,NULL,NULL,'','2024-08-06 15:20:05.003');
/*!40000 ALTER TABLE `act_hi_taskinst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_tsk_log`
--

DROP TABLE IF EXISTS `act_hi_tsk_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_hi_tsk_log` (
  `ID_` bigint NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TIME_STAMP_` timestamp(3) NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DATA_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_tsk_log`
--

LOCK TABLES `act_hi_tsk_log` WRITE;
/*!40000 ALTER TABLE `act_hi_tsk_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_tsk_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_varinst`
--

DROP TABLE IF EXISTS `act_hi_varinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_hi_varinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT '1',
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_PROCVAR_NAME_TYPE` (`NAME_`,`VAR_TYPE_`),
  KEY `ACT_IDX_HI_VAR_SCOPE_ID_TYPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_VAR_SUB_ID_TYPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_TASK_ID` (`TASK_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_EXE` (`EXECUTION_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_varinst`
--

LOCK TABLES `act_hi_varinst` WRITE;
/*!40000 ALTER TABLE `act_hi_varinst` DISABLE KEYS */;
INSERT INTO `act_hi_varinst` VALUES ('1820721459888590853',1,'1820721459888590850','1820721459888590850',NULL,'entity','serializable',NULL,NULL,NULL,'1820721459888590854',NULL,NULL,NULL,NULL,'2024-08-06 15:19:58.063','2024-08-06 15:19:58.420'),('1820721459888590855',1,'1820721459888590850','1820721459888590850',NULL,'userId','string',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,'2024-08-06 15:19:58.064','2024-08-06 15:19:58.437'),('1820721459888590856',0,'1820721459888590850','1820721459888590850',NULL,'_FLOWABLE_SKIP_EXPRESSION_ENABLED','boolean',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,'2024-08-06 15:19:58.064','2024-08-06 15:19:58.064'),('1820721460500959234',0,'1820721459888590850','1820721459888590850',NULL,'processInstanceId','string',NULL,NULL,NULL,NULL,NULL,NULL,'1820721459888590850',NULL,'2024-08-06 15:19:58.209','2024-08-06 15:19:58.209');
/*!40000 ALTER TABLE `act_hi_varinst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_node_assignee`
--

DROP TABLE IF EXISTS `act_node_assignee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_node_assignee` (
  `id` bigint NOT NULL,
  `process_definition_id` varchar(255) NOT NULL COMMENT 'æµç¨‹å®šä¹‰id',
  `choose_way` varchar(255) DEFAULT NULL COMMENT 'é€‰æ‹©æ–¹å¼  roleæŒ‰è§’è‰²é€‰äºº  deptæŒ‰éƒ¨é—¨é€‰äºº  personè‡ªå®šä¹‰é€‰äºº',
  `node_id` varchar(255) NOT NULL COMMENT 'æµç¨‹èŠ‚ç‚¹id',
  `node_name` varchar(255) NOT NULL COMMENT 'æµç¨‹èŠ‚ç‚¹åç§°',
  `assignee` varchar(255) DEFAULT NULL COMMENT 'å®¡æ‰¹äººå‘˜',
  `assignee_id` varchar(255) DEFAULT NULL COMMENT 'å®¡æ‰¹äººå‘˜id',
  `business_rule_id` bigint DEFAULT NULL COMMENT 'ä¸šåŠ¡è§„åˆ™id',
  `is_show` tinyint(1) NOT NULL COMMENT 'æ˜¯å¦å¼¹å‡ºé€‰äºº',
  `multiple` tinyint(1) NOT NULL COMMENT 'æ˜¯å¦ä¼šç­¾',
  `multiple_column` varchar(255) DEFAULT NULL COMMENT 'ä¼šç­¾ä¿å­˜äººå‘˜KEYå€¼',
  `is_back` tinyint(1) NOT NULL COMMENT 'æ˜¯å¦å¯é€€å›åˆ°å½“å‰èŠ‚ç‚¹,0ä¸å¯é€€å›å½“å‰èŠ‚ç‚¹,1å¯é€€å›å½“å‰èŠ‚ç‚¹',
  `is_delegate` tinyint(1) NOT NULL COMMENT 'æ˜¯å¦å¯å§”æ‰˜',
  `is_transmit` tinyint(1) NOT NULL COMMENT 'æ˜¯å¦å¯è½¬åŠ',
  `is_copy` tinyint(1) NOT NULL COMMENT 'æ˜¯å¦å¯æŠ„é€',
  `add_multi_instance` tinyint(1) DEFAULT NULL COMMENT 'æ˜¯å¦å¯åŠ ç­¾',
  `delete_multi_instance` tinyint(1) DEFAULT NULL COMMENT 'æ˜¯å¦å¯å‡ç­¾',
  `task_listener` varchar(255) DEFAULT NULL COMMENT 'ä»»åŠ¡ç›‘å¬',
  `auto_complete` tinyint(1) DEFAULT NULL COMMENT 'è‡ªåŠ¨å®¡æ‰¹,å½“å‰èŠ‚ç‚¹è‡ªåŠ¨åŠç†,ä¸‹ä¸€èŠ‚ç‚¹ä¸å¯å¼¹çª—é€‰äºº',
  `field_list_json` text COMMENT 'å­—æ®µ',
  `show_back` tinyint(1) DEFAULT NULL COMMENT 'å½“å‰èŠ‚ç‚¹æ˜¯å¦æ˜¾ç¤ºé©³å›,0ä¸æ˜¾ç¤ºé©³å›æŒ‰é’®,1æ˜¾ç¤ºé©³å›æŒ‰é’®',
  `create_by` varchar(100) DEFAULT NULL COMMENT 'åˆ›å»ºè€…',
  `create_time` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(100) DEFAULT NULL COMMENT 'æ›´æ–°è€…',
  `update_time` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='èŠ‚ç‚¹åˆ†é…äººè¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_node_assignee`
--

LOCK TABLES `act_node_assignee` WRITE;
/*!40000 ALTER TABLE `act_node_assignee` DISABLE KEYS */;
INSERT INTO `act_node_assignee` VALUES (1820718910171189250,'leave1:1:1820662237058514946','role','Activity_0lym9dc','ç»„é•¿','è¶…çº§ç®¡ç†å‘˜','1',NULL,0,0,'',0,0,0,0,0,0,'',NULL,'',1,'admin','2024-08-06 15:09:50','admin','2024-08-06 15:09:50'),(1820719081768554497,'leave1:1:1820662237058514946','role','Activity_1j25s1c','éƒ¨é—¨é¢†å¯¼','è¶…çº§ç®¡ç†å‘˜','1',NULL,0,0,'',0,0,0,0,0,0,'',NULL,'',1,'admin','2024-08-06 15:10:31','admin','2024-08-06 15:10:31'),(1820720870416912385,'leave1:1:1820662237058514946','person','Activity_14633hx','ç”³è¯·äºº',NULL,NULL,NULL,0,0,'',0,0,0,0,0,0,'',NULL,'',0,'admin','2024-08-06 15:18:37','admin','2024-08-06 15:18:37');
/*!40000 ALTER TABLE `act_node_assignee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_procdef_info`
--

DROP TABLE IF EXISTS `act_procdef_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_procdef_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `INFO_JSON_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_IDX_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_INFO_JSON_BA` (`INFO_JSON_ID_`),
  CONSTRAINT `ACT_FK_INFO_JSON_BA` FOREIGN KEY (`INFO_JSON_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_INFO_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_procdef_info`
--

LOCK TABLES `act_procdef_info` WRITE;
/*!40000 ALTER TABLE `act_procdef_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_procdef_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_process_def_setting`
--

DROP TABLE IF EXISTS `act_process_def_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_process_def_setting` (
  `id` bigint NOT NULL,
  `process_definition_id` varchar(255) DEFAULT NULL COMMENT 'æµç¨‹å®šä¹‰id',
  `process_definition_key` varchar(255) DEFAULT NULL COMMENT 'æµç¨‹å®šä¹‰key',
  `process_definition_name` varchar(255) DEFAULT NULL COMMENT 'æµç¨‹å®šä¹‰åç§°',
  `table_name` varchar(255) DEFAULT NULL COMMENT 'è¡¨å',
  `component_name` varchar(255) DEFAULT NULL COMMENT 'ç»„ä»¶åç§°',
  `remark` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨',
  `default_process` tinyint(1) DEFAULT NULL COMMENT 'true ä¸ºå®¡æ‰¹èŠ‚ç‚¹é€‰äºº false ä¸ºç”³è¯·äººé€‰æ‹©å…¨éƒ¨äººå‘˜',
  `task_listener` varchar(255) DEFAULT NULL COMMENT 'ä»»åŠ¡ç›‘å¬',
  `create_by` varchar(100) DEFAULT NULL COMMENT 'åˆ›å»ºè€…',
  `create_time` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(100) DEFAULT NULL COMMENT 'æ›´æ–°è€…',
  `update_time` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='æµç¨‹å®šä¹‰è®¾ç½®è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_process_def_setting`
--

LOCK TABLES `act_process_def_setting` WRITE;
/*!40000 ALTER TABLE `act_process_def_setting` DISABLE KEYS */;
INSERT INTO `act_process_def_setting` VALUES (1820720401535668226,'leave1:1:1820662237058514946','leave1','è¯·å‡æµç¨‹ï¼ˆæ™®é€šæµç¨‹ï¼‰','bs_leave','leave',NULL,0,'','admin','2024-08-06 15:19:49','admin','2024-08-06 15:19:49');
/*!40000 ALTER TABLE `act_process_def_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_process_node_assignee`
--

DROP TABLE IF EXISTS `act_process_node_assignee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_process_node_assignee` (
  `id` bigint NOT NULL,
  `process_definition_id` varchar(255) NOT NULL COMMENT 'æµç¨‹å®šä¹‰id',
  `process_instance_id` varchar(255) NOT NULL COMMENT 'æµç¨‹å®ä¾‹id',
  `node_id` varchar(255) NOT NULL COMMENT 'èŠ‚ç‚¹id',
  `assignee` varchar(255) NOT NULL COMMENT 'åŠç†äºº',
  `assignee_id` varchar(255) NOT NULL COMMENT 'åŠç†äººid',
  `node_name` varchar(255) NOT NULL COMMENT 'èŠ‚ç‚¹åç§°',
  `multiple` tinyint(1) NOT NULL COMMENT 'æ˜¯å¦ä¼šç­¾',
  `multiple_column` varchar(255) DEFAULT NULL COMMENT 'ä¼šç­¾ä¿å­˜äººå‘˜KEYå€¼',
  `create_by` varchar(100) DEFAULT NULL COMMENT 'åˆ›å»ºè€…',
  `create_time` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(100) DEFAULT NULL COMMENT 'æ›´æ–°è€…',
  `update_time` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='æµç¨‹èŠ‚ç‚¹åˆ†é…äººè¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_process_node_assignee`
--

LOCK TABLES `act_process_node_assignee` WRITE;
/*!40000 ALTER TABLE `act_process_node_assignee` DISABLE KEYS */;
INSERT INTO `act_process_node_assignee` VALUES (1820721487533248513,'leave1:1:1820662237058514946','1820721459888590850','Activity_14633hx','ç–¯ç‹‚çš„ç‹®å­Li','1','ç”³è¯·äºº',0,NULL,'admin','2024-08-06 15:20:05','admin','2024-08-06 15:20:05'),(1820721487575191554,'leave1:1:1820662237058514946','1820721459888590850','Activity_0lym9dc','ç–¯ç‹‚çš„ç‹®å­Li','1','ç»„é•¿',0,NULL,'admin','2024-08-06 15:20:05','admin','2024-08-06 15:20:05'),(1820721487575191555,'leave1:1:1820662237058514946','1820721459888590850','Activity_1j25s1c','ç–¯ç‹‚çš„ç‹®å­Li','1','éƒ¨é—¨é¢†å¯¼',0,NULL,'admin','2024-08-06 15:20:05','admin','2024-08-06 15:20:05');
/*!40000 ALTER TABLE `act_process_node_assignee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_re_deployment`
--

DROP TABLE IF EXISTS `act_re_deployment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_re_deployment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `DEPLOY_TIME_` timestamp(3) NULL DEFAULT NULL,
  `DERIVED_FROM_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DERIVED_FROM_ROOT_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_DEPLOYMENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ENGINE_VERSION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_re_deployment`
--

LOCK TABLES `act_re_deployment` WRITE;
/*!40000 ALTER TABLE `act_re_deployment` DISABLE KEYS */;
INSERT INTO `act_re_deployment` VALUES ('1820662234730676226','è¯·å‡æµç¨‹ï¼ˆæ™®é€šæµç¨‹ï¼‰','alarm','leave1.bpmn20','','2024-08-06 03:24:37.684',NULL,NULL,'1820662234730676226',NULL),('1820703255543877634','è¯·å‡æµç¨‹ï¼ˆæ’ä»–ç½‘å…³ï¼‰','alarm','leave2.bpmn20','','2024-08-06 06:07:37.809',NULL,NULL,'1820703255543877634',NULL),('1820703298988478465','è¯·å‡æµç¨‹ï¼ˆå¹¶è¡Œç½‘å…³ï¼‰','alarm','leave3.bpmn20','','2024-08-06 06:07:48.167',NULL,NULL,'1820703298988478465',NULL),('1820703328734482433','è¯·å‡æµç¨‹ï¼ˆåŒ…å®¹ç½‘å…³ï¼‰','alarm','leave4.bpmn20','','2024-08-06 06:07:55.260',NULL,NULL,'1820703328734482433',NULL),('1820703358228828162','è¯·å‡æµç¨‹ï¼ˆä¼šç­¾ï¼‰','alarm','leave5.bpmn20','','2024-08-06 06:08:02.292',NULL,NULL,'1820703358228828162',NULL),('1820703376704737282','è¯·å‡æµç¨‹ï¼ˆå­æµç¨‹ï¼‰','alarm','leave6.bpmn20','','2024-08-06 06:08:06.696',NULL,NULL,'1820703376704737282',NULL);
/*!40000 ALTER TABLE `act_re_deployment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_re_model`
--

DROP TABLE IF EXISTS `act_re_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_re_model` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `VERSION_` int DEFAULT NULL,
  `META_INFO_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_MODEL_SOURCE` (`EDITOR_SOURCE_VALUE_ID_`),
  KEY `ACT_FK_MODEL_SOURCE_EXTRA` (`EDITOR_SOURCE_EXTRA_VALUE_ID_`),
  KEY `ACT_FK_MODEL_DEPLOYMENT` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_MODEL_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE_EXTRA` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_re_model`
--

LOCK TABLES `act_re_model` WRITE;
/*!40000 ALTER TABLE `act_re_model` DISABLE KEYS */;
INSERT INTO `act_re_model` VALUES ('1820663301459623937',3,'è¯·å‡æµç¨‹ï¼ˆæ™®é€šæµç¨‹ï¼‰','leave1','alarm','2024-08-06 03:28:52.014','2024-08-06 03:28:52.045',1,'{\"name\":\"è¯·å‡æµç¨‹ï¼ˆæ™®é€šæµç¨‹ï¼‰\",\"revision\":1,\"description\":null}',NULL,'1820663301493178370','1820663301593841666','');
/*!40000 ALTER TABLE `act_re_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_re_procdef`
--

DROP TABLE IF EXISTS `act_re_procdef`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_re_procdef` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VERSION_` int NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `HAS_START_FORM_KEY_` tinyint DEFAULT NULL,
  `HAS_GRAPHICAL_NOTATION_` tinyint DEFAULT NULL,
  `SUSPENSION_STATE_` int DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `ENGINE_VERSION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DERIVED_FROM_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DERIVED_FROM_ROOT_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DERIVED_VERSION_` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_PROCDEF` (`KEY_`,`VERSION_`,`DERIVED_VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_re_procdef`
--

LOCK TABLES `act_re_procdef` WRITE;
/*!40000 ALTER TABLE `act_re_procdef` DISABLE KEYS */;
INSERT INTO `act_re_procdef` VALUES ('leave1:1:1820662237058514946',2,'alarm','è¯·å‡æµç¨‹ï¼ˆæ™®é€šæµç¨‹ï¼‰','leave1',1,'1820662234730676226','è¯·å‡æµç¨‹ï¼ˆæ™®é€šæµç¨‹ï¼‰-leave1.bpmn20.xml','è¯·å‡æµç¨‹ï¼ˆæ™®é€šæµç¨‹ï¼‰-leave1.leave1.png',NULL,0,1,1,'',NULL,NULL,NULL,0),('leave2:1:1820703257427120130',2,'alarm','è¯·å‡æµç¨‹ï¼ˆæ’ä»–ç½‘å…³ï¼‰','leave2',1,'1820703255543877634','è¯·å‡æµç¨‹ï¼ˆæ’ä»–ç½‘å…³ï¼‰-leave2.bpmn20.xml','è¯·å‡æµç¨‹ï¼ˆæ’ä»–ç½‘å…³ï¼‰-leave2.leave2.png',NULL,0,1,1,'',NULL,NULL,NULL,0),('leave3:1:1820703299458240513',2,'alarm','è¯·å‡æµç¨‹ï¼ˆå¹¶è¡Œç½‘å…³ï¼‰','leave3',1,'1820703298988478465','è¯·å‡æµç¨‹ï¼ˆå¹¶è¡Œç½‘å…³ï¼‰-leave3.bpmn20.xml','è¯·å‡æµç¨‹ï¼ˆå¹¶è¡Œç½‘å…³ï¼‰-leave3.leave3.png',NULL,0,1,1,'',NULL,NULL,NULL,0),('leave4:1:1820703329095192577',2,'alarm','è¯·å‡æµç¨‹ï¼ˆåŒ…å®¹ç½‘å…³ï¼‰','leave4',1,'1820703328734482433','è¯·å‡æµç¨‹ï¼ˆåŒ…å®¹ç½‘å…³ï¼‰-leave4.bpmn20.xml','è¯·å‡æµç¨‹ï¼ˆåŒ…å®¹ç½‘å…³ï¼‰-leave4.leave4.png',NULL,0,1,1,'',NULL,NULL,NULL,0),('leave5:1:1820703358627287042',2,'alarm','è¯·å‡æµç¨‹ï¼ˆä¼šç­¾ï¼‰','leave5',1,'1820703358228828162','è¯·å‡æµç¨‹ï¼ˆä¼šç­¾ï¼‰-leave5.bpmn20.xml','è¯·å‡æµç¨‹ï¼ˆä¼šç­¾ï¼‰-leave5.leave5.png',NULL,0,1,1,'',NULL,NULL,NULL,0),('leave6:1:1820703377086418946',2,'alarm','è¯·å‡æµç¨‹ï¼ˆå­æµç¨‹ï¼‰','leave6',1,'1820703376704737282','è¯·å‡æµç¨‹ï¼ˆå­æµç¨‹ï¼‰-leave6.bpmn20.xml','è¯·å‡æµç¨‹ï¼ˆå­æµç¨‹ï¼‰-leave6.leave6.png',NULL,0,1,1,'',NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `act_re_procdef` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_actinst`
--

DROP TABLE IF EXISTS `act_ru_actinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_ru_actinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT '1',
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ACT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint DEFAULT NULL,
  `TRANSACTION_ORDER_` int DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_RU_ACTI_START` (`START_TIME_`),
  KEY `ACT_IDX_RU_ACTI_END` (`END_TIME_`),
  KEY `ACT_IDX_RU_ACTI_PROC` (`PROC_INST_ID_`),
  KEY `ACT_IDX_RU_ACTI_PROC_ACT` (`PROC_INST_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_RU_ACTI_EXEC` (`EXECUTION_ID_`),
  KEY `ACT_IDX_RU_ACTI_EXEC_ACT` (`EXECUTION_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_RU_ACTI_TASK` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_actinst`
--

LOCK TABLES `act_ru_actinst` WRITE;
/*!40000 ALTER TABLE `act_ru_actinst` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_actinst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_deadletter_job`
--

DROP TABLE IF EXISTS `act_ru_deadletter_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_ru_deadletter_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CORRELATION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_DEADLETTER_JOB_EXCEPTION_STACK_ID` (`EXCEPTION_STACK_ID_`),
  KEY `ACT_IDX_DEADLETTER_JOB_CUSTOM_VALUES_ID` (`CUSTOM_VALUES_ID_`),
  KEY `ACT_IDX_DEADLETTER_JOB_CORRELATION_ID` (`CORRELATION_ID_`),
  KEY `ACT_IDX_DJOB_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_DJOB_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_DJOB_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_FK_DEADLETTER_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_CUSTOM_VALUES` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_deadletter_job`
--

LOCK TABLES `act_ru_deadletter_job` WRITE;
/*!40000 ALTER TABLE `act_ru_deadletter_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_deadletter_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_entitylink`
--

DROP TABLE IF EXISTS `act_ru_entitylink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_ru_entitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `LINK_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ELEMENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REF_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REF_SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REF_SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ROOT_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ROOT_SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HIERARCHY_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_ENT_LNK_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`,`LINK_TYPE_`),
  KEY `ACT_IDX_ENT_LNK_REF_SCOPE` (`REF_SCOPE_ID_`,`REF_SCOPE_TYPE_`,`LINK_TYPE_`),
  KEY `ACT_IDX_ENT_LNK_ROOT_SCOPE` (`ROOT_SCOPE_ID_`,`ROOT_SCOPE_TYPE_`,`LINK_TYPE_`),
  KEY `ACT_IDX_ENT_LNK_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`,`LINK_TYPE_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_entitylink`
--

LOCK TABLES `act_ru_entitylink` WRITE;
/*!40000 ALTER TABLE `act_ru_entitylink` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_entitylink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_event_subscr`
--

DROP TABLE IF EXISTS `act_ru_event_subscr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_ru_event_subscr` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `EVENT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EVENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTIVITY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CONFIGURATION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATED_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EVENT_SUBSCR_CONFIG_` (`CONFIGURATION_`),
  KEY `ACT_IDX_EVENT_SUBSCR_SCOPEREF_` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_FK_EVENT_EXEC` (`EXECUTION_ID_`),
  CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_event_subscr`
--

LOCK TABLES `act_ru_event_subscr` WRITE;
/*!40000 ALTER TABLE `act_ru_event_subscr` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_event_subscr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_execution`
--

DROP TABLE IF EXISTS `act_ru_execution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_ru_execution` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ROOT_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `IS_ACTIVE_` tinyint DEFAULT NULL,
  `IS_CONCURRENT_` tinyint DEFAULT NULL,
  `IS_SCOPE_` tinyint DEFAULT NULL,
  `IS_EVENT_SCOPE_` tinyint DEFAULT NULL,
  `IS_MI_ROOT_` tinyint DEFAULT NULL,
  `SUSPENSION_STATE_` int DEFAULT NULL,
  `CACHED_ENT_STATE_` int DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `IS_COUNT_ENABLED_` tinyint DEFAULT NULL,
  `EVT_SUBSCR_COUNT_` int DEFAULT NULL,
  `TASK_COUNT_` int DEFAULT NULL,
  `JOB_COUNT_` int DEFAULT NULL,
  `TIMER_JOB_COUNT_` int DEFAULT NULL,
  `SUSP_JOB_COUNT_` int DEFAULT NULL,
  `DEADLETTER_JOB_COUNT_` int DEFAULT NULL,
  `EXTERNAL_WORKER_JOB_COUNT_` int DEFAULT NULL,
  `VAR_COUNT_` int DEFAULT NULL,
  `ID_LINK_COUNT_` int DEFAULT NULL,
  `CALLBACK_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CALLBACK_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REFERENCE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REFERENCE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROPAGATED_STAGE_INST_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `BUSINESS_STATUS_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`),
  KEY `ACT_IDC_EXEC_ROOT` (`ROOT_PROC_INST_ID_`),
  KEY `ACT_IDX_EXEC_REF_ID_` (`REFERENCE_ID_`),
  KEY `ACT_FK_EXE_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PARENT` (`PARENT_ID_`),
  KEY `ACT_FK_EXE_SUPER` (`SUPER_EXEC_`),
  KEY `ACT_FK_EXE_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE,
  CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_execution`
--

LOCK TABLES `act_ru_execution` WRITE;
/*!40000 ALTER TABLE `act_ru_execution` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_execution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_external_job`
--

DROP TABLE IF EXISTS `act_ru_external_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_ru_external_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CORRELATION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EXTERNAL_JOB_EXCEPTION_STACK_ID` (`EXCEPTION_STACK_ID_`),
  KEY `ACT_IDX_EXTERNAL_JOB_CUSTOM_VALUES_ID` (`CUSTOM_VALUES_ID_`),
  KEY `ACT_IDX_EXTERNAL_JOB_CORRELATION_ID` (`CORRELATION_ID_`),
  KEY `ACT_IDX_EJOB_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_EJOB_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_EJOB_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  CONSTRAINT `ACT_FK_EXTERNAL_JOB_CUSTOM_VALUES` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_EXTERNAL_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_external_job`
--

LOCK TABLES `act_ru_external_job` WRITE;
/*!40000 ALTER TABLE `act_ru_external_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_external_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_history_job`
--

DROP TABLE IF EXISTS `act_ru_history_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_ru_history_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ADV_HANDLER_CFG_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_history_job`
--

LOCK TABLES `act_ru_history_job` WRITE;
/*!40000 ALTER TABLE `act_ru_history_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_history_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_identitylink`
--

DROP TABLE IF EXISTS `act_ru_identitylink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_ru_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_IDENT_LNK_GROUP` (`GROUP_ID_`),
  KEY `ACT_IDX_IDENT_LNK_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_IDENT_LNK_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_IDENT_LNK_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_ATHRZ_PROCEDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TSKASS_TASK` (`TASK_ID_`),
  KEY `ACT_FK_IDL_PROCINST` (`PROC_INST_ID_`),
  CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_IDL_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `act_ru_task` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_identitylink`
--

LOCK TABLES `act_ru_identitylink` WRITE;
/*!40000 ALTER TABLE `act_ru_identitylink` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_identitylink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_job`
--

DROP TABLE IF EXISTS `act_ru_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_ru_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CORRELATION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_JOB_EXCEPTION_STACK_ID` (`EXCEPTION_STACK_ID_`),
  KEY `ACT_IDX_JOB_CUSTOM_VALUES_ID` (`CUSTOM_VALUES_ID_`),
  KEY `ACT_IDX_JOB_CORRELATION_ID` (`CORRELATION_ID_`),
  KEY `ACT_IDX_JOB_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_JOB_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_JOB_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_FK_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_JOB_CUSTOM_VALUES` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_job`
--

LOCK TABLES `act_ru_job` WRITE;
/*!40000 ALTER TABLE `act_ru_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_suspended_job`
--

DROP TABLE IF EXISTS `act_ru_suspended_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_ru_suspended_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CORRELATION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_SUSPENDED_JOB_EXCEPTION_STACK_ID` (`EXCEPTION_STACK_ID_`),
  KEY `ACT_IDX_SUSPENDED_JOB_CUSTOM_VALUES_ID` (`CUSTOM_VALUES_ID_`),
  KEY `ACT_IDX_SUSPENDED_JOB_CORRELATION_ID` (`CORRELATION_ID_`),
  KEY `ACT_IDX_SJOB_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_SJOB_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_SJOB_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_FK_SUSPENDED_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_CUSTOM_VALUES` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_suspended_job`
--

LOCK TABLES `act_ru_suspended_job` WRITE;
/*!40000 ALTER TABLE `act_ru_suspended_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_suspended_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_task`
--

DROP TABLE IF EXISTS `act_ru_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_ru_task` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROPAGATED_STAGE_INST_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DELEGATION_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUSPENSION_STATE_` int DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CLAIM_TIME_` datetime(3) DEFAULT NULL,
  `IS_COUNT_ENABLED_` tinyint DEFAULT NULL,
  `VAR_COUNT_` int DEFAULT NULL,
  `ID_LINK_COUNT_` int DEFAULT NULL,
  `SUB_TASK_COUNT_` int DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_TASK_CREATE` (`CREATE_TIME_`),
  KEY `ACT_IDX_TASK_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_TASK_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_TASK_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_FK_TASK_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_TASK_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_TASK_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_task`
--

LOCK TABLES `act_ru_task` WRITE;
/*!40000 ALTER TABLE `act_ru_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_timer_job`
--

DROP TABLE IF EXISTS `act_ru_timer_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_ru_timer_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CORRELATION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_TIMER_JOB_EXCEPTION_STACK_ID` (`EXCEPTION_STACK_ID_`),
  KEY `ACT_IDX_TIMER_JOB_CUSTOM_VALUES_ID` (`CUSTOM_VALUES_ID_`),
  KEY `ACT_IDX_TIMER_JOB_CORRELATION_ID` (`CORRELATION_ID_`),
  KEY `ACT_IDX_TIMER_JOB_DUEDATE` (`DUEDATE_`),
  KEY `ACT_IDX_TJOB_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_TJOB_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_TJOB_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_FK_TIMER_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_TIMER_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_TIMER_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_CUSTOM_VALUES` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_timer_job`
--

LOCK TABLES `act_ru_timer_job` WRITE;
/*!40000 ALTER TABLE `act_ru_timer_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_timer_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_variable`
--

DROP TABLE IF EXISTS `act_ru_variable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_ru_variable` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_RU_VAR_SCOPE_ID_TYPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_RU_VAR_SUB_ID_TYPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_FK_VAR_BYTEARRAY` (`BYTEARRAY_ID_`),
  KEY `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`),
  KEY `ACT_FK_VAR_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_VAR_PROCINST` (`PROC_INST_ID_`),
  CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_variable`
--

LOCK TABLES `act_ru_variable` WRITE;
/*!40000 ALTER TABLE `act_ru_variable` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_variable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_task_node`
--

DROP TABLE IF EXISTS `act_task_node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_task_node` (
  `id` bigint NOT NULL,
  `node_id` varchar(255) DEFAULT NULL COMMENT 'èŠ‚ç‚¹id',
  `node_name` varchar(255) DEFAULT NULL COMMENT 'èŠ‚ç‚¹åç§°',
  `instance_id` varchar(255) DEFAULT NULL COMMENT 'æµç¨‹å®ä¾‹id',
  `order_no` int DEFAULT NULL COMMENT 'æ’åº',
  `is_back` tinyint(1) DEFAULT NULL COMMENT 'æ˜¯å¦å¯é€€å›',
  `task_type` varchar(255) DEFAULT NULL COMMENT 'èŠ‚ç‚¹ç±»å‹',
  `assignee` varchar(255) DEFAULT NULL COMMENT 'å®¡æ‰¹äºº',
  `create_by` varchar(100) DEFAULT NULL COMMENT 'åˆ›å»ºè€…',
  `create_time` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(100) DEFAULT NULL COMMENT 'æ›´æ–°è€…',
  `update_time` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='ä»»åŠ¡èŠ‚ç‚¹è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_task_node`
--

LOCK TABLES `act_task_node` WRITE;
/*!40000 ALTER TABLE `act_task_node` DISABLE KEYS */;
INSERT INTO `act_task_node` VALUES (1820721488099479554,'Activity_14633hx','ç”³è¯·äºº','1820721459888590850',0,1,'userTask','1','admin','2024-08-06 15:20:05','admin','2024-08-06 15:20:05'),(1820721488804122625,'Activity_0lym9dc','ç»„é•¿','1820721459888590850',1,0,'userTask','1','admin','2024-08-06 15:20:05','admin','2024-08-06 15:20:05'),(1820721491073241090,'Activity_1j25s1c','éƒ¨é—¨é¢†å¯¼','1820721459888590850',2,0,'userTask','1','admin','2024-08-06 15:20:05','admin','2024-08-06 15:20:05');
/*!40000 ALTER TABLE `act_task_node` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_variable_condition`
--

DROP TABLE IF EXISTS `act_variable_condition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_variable_condition` (
  `id` bigint NOT NULL,
  `variable_name` varchar(255) DEFAULT NULL COMMENT 'å˜é‡åç§°',
  `variable` varchar(255) DEFAULT NULL COMMENT 'å˜é‡',
  `symbol` varchar(255) DEFAULT NULL COMMENT 'æ“ä½œç¬¦',
  `process_definition_key` varchar(255) DEFAULT NULL COMMENT 'æµç¨‹å®šä¹‰key',
  `is_str` tinyint(1) DEFAULT NULL COMMENT 'æ˜¯å¦å­—ç¬¦ä¸²',
  `create_by` varchar(100) DEFAULT NULL COMMENT 'åˆ›å»ºè€…',
  `create_time` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(100) DEFAULT NULL COMMENT 'æ›´æ–°è€…',
  `update_time` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='å˜é‡æ¡ä»¶è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_variable_condition`
--

LOCK TABLES `act_variable_condition` WRITE;
/*!40000 ALTER TABLE `act_variable_condition` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_variable_condition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bs_leave`
--

DROP TABLE IF EXISTS `bs_leave`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bs_leave` (
  `id` bigint NOT NULL,
  `username` varchar(255) DEFAULT NULL COMMENT 'ç”³è¯·äººç”¨æˆ·å',
  `duration` decimal(10,2) DEFAULT NULL COMMENT 'è¯·å‡æ—¶é•¿ï¼Œå•ä½ï¼šå¤©',
  `principal` varchar(255) DEFAULT NULL COMMENT 'å·¥ä½œå§”æ‰˜äºº',
  `contact_phone` varchar(20) DEFAULT NULL COMMENT 'è”ç³»ç”µè¯',
  `leave_type` smallint DEFAULT NULL COMMENT 'è¯·å‡ç±»å‹ï¼š1ç—…å‡ï¼Œ2äº‹å‡ï¼Œ3å¹´å‡ï¼Œ4å©šå‡ï¼Œ5äº§å‡ï¼Œ6ä¸§å‡ï¼Œ7æ¢äº²ï¼Œ8è°ƒä¼‘ï¼Œ9å…¶ä»–',
  `title` varchar(255) DEFAULT NULL COMMENT 'æ ‡é¢˜',
  `leave_reason` text COMMENT 'è¯·å‡åŸå› ',
  `start_date` datetime DEFAULT NULL COMMENT 'è¯·å‡å¼€å§‹æ—¶é—´',
  `end_date` datetime DEFAULT NULL COMMENT 'è¯·å‡ç»“æŸæ—¶é—´',
  `create_by` varchar(100) DEFAULT NULL COMMENT 'åˆ›å»ºè€…',
  `create_time` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(100) DEFAULT NULL COMMENT 'æ›´æ–°è€…',
  `update_time` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='è¯·å‡ç”³è¯·è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bs_leave`
--

LOCK TABLES `bs_leave` WRITE;
/*!40000 ALTER TABLE `bs_leave` DISABLE KEYS */;
INSERT INTO `bs_leave` VALUES (1820702696808058882,'admin',2.50,'admin','111111111111',3,'è¯·å¹´å‡','ä¼‘æ¯','2024-08-07 00:00:00','2024-08-09 00:00:00','admin','2024-08-06 14:05:24','admin','2024-08-06 15:19:58');
/*!40000 ALTER TABLE `bs_leave` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flw_channel_definition`
--

DROP TABLE IF EXISTS `flw_channel_definition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flw_channel_definition` (
  `ID_` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `NAME_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `VERSION_` int DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `RESOURCE_NAME_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DESCRIPTION_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `IMPLEMENTATION_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_IDX_CHANNEL_DEF_UNIQ` (`KEY_`,`VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flw_channel_definition`
--

LOCK TABLES `flw_channel_definition` WRITE;
/*!40000 ALTER TABLE `flw_channel_definition` DISABLE KEYS */;
/*!40000 ALTER TABLE `flw_channel_definition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flw_ev_databasechangelog`
--

DROP TABLE IF EXISTS `flw_ev_databasechangelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flw_ev_databasechangelog` (
  `ID` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `AUTHOR` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `FILENAME` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int NOT NULL,
  `EXECTYPE` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `MD5SUM` varchar(35) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `COMMENTS` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TAG` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LIQUIBASE` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CONTEXTS` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LABELS` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flw_ev_databasechangelog`
--

LOCK TABLES `flw_ev_databasechangelog` WRITE;
/*!40000 ALTER TABLE `flw_ev_databasechangelog` DISABLE KEYS */;
INSERT INTO `flw_ev_databasechangelog` VALUES ('1','flowable','org/flowable/eventregistry/db/liquibase/flowable-eventregistry-db-changelog.xml','2024-08-05 19:21:54',1,'EXECUTED','8:1b0c48c9cf7945be799d868a2626d687','createTable tableName=FLW_EVENT_DEPLOYMENT; createTable tableName=FLW_EVENT_RESOURCE; createTable tableName=FLW_EVENT_DEFINITION; createIndex indexName=ACT_IDX_EVENT_DEF_UNIQ, tableName=FLW_EVENT_DEFINITION; createTable tableName=FLW_CHANNEL_DEFIN...','',NULL,'4.9.1',NULL,NULL,'2856912397'),('2','flowable','org/flowable/eventregistry/db/liquibase/flowable-eventregistry-db-changelog.xml','2024-08-05 19:21:55',2,'EXECUTED','8:0ea825feb8e470558f0b5754352b9cda','addColumn tableName=FLW_CHANNEL_DEFINITION; addColumn tableName=FLW_CHANNEL_DEFINITION','',NULL,'4.9.1',NULL,NULL,'2856912397'),('3','flowable','org/flowable/eventregistry/db/liquibase/flowable-eventregistry-db-changelog.xml','2024-08-05 19:21:55',3,'EXECUTED','8:3c2bb293350b5cbe6504331980c9dcee','customChange','',NULL,'4.9.1',NULL,NULL,'2856912397');
/*!40000 ALTER TABLE `flw_ev_databasechangelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flw_ev_databasechangeloglock`
--

DROP TABLE IF EXISTS `flw_ev_databasechangeloglock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flw_ev_databasechangeloglock` (
  `ID` int NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flw_ev_databasechangeloglock`
--

LOCK TABLES `flw_ev_databasechangeloglock` WRITE;
/*!40000 ALTER TABLE `flw_ev_databasechangeloglock` DISABLE KEYS */;
INSERT INTO `flw_ev_databasechangeloglock` VALUES (1,_binary '\0',NULL,NULL);
/*!40000 ALTER TABLE `flw_ev_databasechangeloglock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flw_event_definition`
--

DROP TABLE IF EXISTS `flw_event_definition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flw_event_definition` (
  `ID_` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `NAME_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `VERSION_` int DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `RESOURCE_NAME_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DESCRIPTION_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_IDX_EVENT_DEF_UNIQ` (`KEY_`,`VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flw_event_definition`
--

LOCK TABLES `flw_event_definition` WRITE;
/*!40000 ALTER TABLE `flw_event_definition` DISABLE KEYS */;
/*!40000 ALTER TABLE `flw_event_definition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flw_event_deployment`
--

DROP TABLE IF EXISTS `flw_event_deployment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flw_event_deployment` (
  `ID_` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `NAME_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DEPLOY_TIME_` datetime(3) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PARENT_DEPLOYMENT_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flw_event_deployment`
--

LOCK TABLES `flw_event_deployment` WRITE;
/*!40000 ALTER TABLE `flw_event_deployment` DISABLE KEYS */;
/*!40000 ALTER TABLE `flw_event_deployment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flw_event_resource`
--

DROP TABLE IF EXISTS `flw_event_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flw_event_resource` (
  `ID_` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `NAME_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `RESOURCE_BYTES_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flw_event_resource`
--

LOCK TABLES `flw_event_resource` WRITE;
/*!40000 ALTER TABLE `flw_event_resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `flw_event_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flw_ru_batch`
--

DROP TABLE IF EXISTS `flw_ru_batch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flw_ru_batch` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `TYPE_` varchar(64) COLLATE utf8_bin NOT NULL,
  `SEARCH_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SEARCH_KEY2_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) NOT NULL,
  `COMPLETE_TIME_` datetime(3) DEFAULT NULL,
  `STATUS_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `BATCH_DOC_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flw_ru_batch`
--

LOCK TABLES `flw_ru_batch` WRITE;
/*!40000 ALTER TABLE `flw_ru_batch` DISABLE KEYS */;
/*!40000 ALTER TABLE `flw_ru_batch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flw_ru_batch_part`
--

DROP TABLE IF EXISTS `flw_ru_batch_part`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flw_ru_batch_part` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `BATCH_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(64) COLLATE utf8_bin NOT NULL,
  `SCOPE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SEARCH_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SEARCH_KEY2_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) NOT NULL,
  `COMPLETE_TIME_` datetime(3) DEFAULT NULL,
  `STATUS_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RESULT_DOC_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `FLW_IDX_BATCH_PART` (`BATCH_ID_`),
  CONSTRAINT `FLW_FK_BATCH_PART_PARENT` FOREIGN KEY (`BATCH_ID_`) REFERENCES `flw_ru_batch` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flw_ru_batch_part`
--

LOCK TABLES `flw_ru_batch_part` WRITE;
/*!40000 ALTER TABLE `flw_ru_batch_part` DISABLE KEYS */;
/*!40000 ALTER TABLE `flw_ru_batch_part` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_table`
--

DROP TABLE IF EXISTS `gen_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gen_table` (
  `table_id` bigint NOT NULL COMMENT 'ç¼–å·',
  `table_name` varchar(200) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'è¡¨åç§°',
  `table_comment` varchar(500) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'è¡¨æè¿°',
  `sub_table_name` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'å…³è”å­è¡¨çš„è¡¨å',
  `sub_table_fk_name` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'å­è¡¨å…³è”çš„å¤–é”®å',
  `class_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'å®ä½“ç±»åç§°',
  `tpl_category` varchar(200) COLLATE utf8mb4_general_ci DEFAULT 'crud' COMMENT 'ä½¿ç”¨çš„æ¨¡æ¿ï¼ˆcrudå•è¡¨æ“ä½œ treeæ ‘è¡¨æ“ä½œï¼‰',
  `package_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ç”ŸæˆåŒ…è·¯å¾„',
  `module_name` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ç”Ÿæˆæ¨¡å—å',
  `business_name` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ç”Ÿæˆä¸šåŠ¡å',
  `function_name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ç”ŸæˆåŠŸèƒ½å',
  `function_author` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ç”ŸæˆåŠŸèƒ½ä½œè€…',
  `gen_type` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT 'ç”Ÿæˆä»£ç æ–¹å¼ï¼ˆ0zipå‹ç¼©åŒ… 1è‡ªå®šä¹‰è·¯å¾„ï¼‰',
  `gen_path` varchar(200) COLLATE utf8mb4_general_ci DEFAULT '/' COMMENT 'ç”Ÿæˆè·¯å¾„ï¼ˆä¸å¡«é»˜è®¤é¡¹ç›®è·¯å¾„ï¼‰',
  `options` varchar(1000) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'å…¶å®ƒç”Ÿæˆé€‰é¡¹',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'åˆ›å»ºè€…',
  `create_time` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'æ›´æ–°è€…',
  `update_time` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'å¤‡æ³¨',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='ä»£ç ç”Ÿæˆä¸šåŠ¡è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table`
--

LOCK TABLES `gen_table` WRITE;
/*!40000 ALTER TABLE `gen_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `gen_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_table_column`
--

DROP TABLE IF EXISTS `gen_table_column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gen_table_column` (
  `column_id` bigint NOT NULL COMMENT 'ç¼–å·',
  `table_id` bigint DEFAULT NULL COMMENT 'å½’å±è¡¨ç¼–å·',
  `column_name` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'åˆ—åç§°',
  `column_comment` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'åˆ—æè¿°',
  `column_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'åˆ—ç±»å‹',
  `java_type` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'JAVAç±»å‹',
  `java_field` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'JAVAå­—æ®µå',
  `is_pk` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'æ˜¯å¦ä¸»é”®ï¼ˆ1æ˜¯ï¼‰',
  `is_increment` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'æ˜¯å¦è‡ªå¢ï¼ˆ1æ˜¯ï¼‰',
  `is_required` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'æ˜¯å¦å¿…å¡«ï¼ˆ1æ˜¯ï¼‰',
  `is_insert` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'æ˜¯å¦ä¸ºæ’å…¥å­—æ®µï¼ˆ1æ˜¯ï¼‰',
  `is_edit` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'æ˜¯å¦ç¼–è¾‘å­—æ®µï¼ˆ1æ˜¯ï¼‰',
  `is_list` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'æ˜¯å¦åˆ—è¡¨å­—æ®µï¼ˆ1æ˜¯ï¼‰',
  `is_query` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'æ˜¯å¦æŸ¥è¯¢å­—æ®µï¼ˆ1æ˜¯ï¼‰',
  `query_type` varchar(200) COLLATE utf8mb4_general_ci DEFAULT 'EQ' COMMENT 'æŸ¥è¯¢æ–¹å¼ï¼ˆç­‰äºã€ä¸ç­‰äºã€å¤§äºã€å°äºã€èŒƒå›´ï¼‰',
  `html_type` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'æ˜¾ç¤ºç±»å‹ï¼ˆæ–‡æœ¬æ¡†ã€æ–‡æœ¬åŸŸã€ä¸‹æ‹‰æ¡†ã€å¤é€‰æ¡†ã€å•é€‰æ¡†ã€æ—¥æœŸæ§ä»¶ï¼‰',
  `dict_type` varchar(200) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'å­—å…¸ç±»å‹',
  `sort` int DEFAULT NULL COMMENT 'æ’åº',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'åˆ›å»ºè€…',
  `create_time` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'æ›´æ–°è€…',
  `update_time` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='ä»£ç ç”Ÿæˆä¸šåŠ¡è¡¨å­—æ®µ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table_column`
--

LOCK TABLES `gen_table_column` WRITE;
/*!40000 ALTER TABLE `gen_table_column` DISABLE KEYS */;
/*!40000 ALTER TABLE `gen_table_column` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jimu_report`
--

DROP TABLE IF EXISTS `jimu_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jimu_report` (
  `id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL COMMENT 'ä¸»é”®',
  `code` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'ç¼–ç ',
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'åç§°',
  `note` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'è¯´æ˜',
  `status` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'çŠ¶æ€',
  `type` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'ç±»å‹',
  `json_str` longtext CHARACTER SET utf8mb3 COLLATE utf8_general_ci COMMENT 'jsonå­—ç¬¦ä¸²',
  `api_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'è¯·æ±‚åœ°å€',
  `thumb` text CHARACTER SET utf8mb3 COLLATE utf8_general_ci COMMENT 'ç¼©ç•¥å›¾',
  `create_by` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'åˆ›å»ºäºº',
  `create_time` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'ä¿®æ”¹äºº',
  `update_time` datetime DEFAULT NULL COMMENT 'ä¿®æ”¹æ—¶é—´',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT 'åˆ é™¤æ ‡è¯†0-æ­£å¸¸,1-å·²åˆ é™¤',
  `api_method` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'è¯·æ±‚æ–¹æ³•0-get,1-post',
  `api_code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'è¯·æ±‚ç¼–ç ',
  `template` tinyint(1) DEFAULT NULL COMMENT 'æ˜¯å¦æ˜¯æ¨¡æ¿ 0-æ˜¯,1-ä¸æ˜¯',
  `view_count` bigint DEFAULT '0' COMMENT 'æµè§ˆæ¬¡æ•°',
  `css_str` text CHARACTER SET utf8mb3 COLLATE utf8_general_ci COMMENT 'csså¢å¼º',
  `js_str` text CHARACTER SET utf8mb3 COLLATE utf8_general_ci COMMENT 'jså¢å¼º',
  `tenant_id` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'å¤šç§Ÿæˆ·æ ‡è¯†',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uniq_jmreport_code` (`code`) USING BTREE,
  KEY `uniq_jmreport_createby` (`create_by`) USING BTREE,
  KEY `uniq_jmreport_delflag` (`del_flag`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='åœ¨çº¿excelè®¾è®¡å™¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jimu_report`
--

LOCK TABLES `jimu_report` WRITE;
/*!40000 ALTER TABLE `jimu_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `jimu_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jimu_report_db`
--

DROP TABLE IF EXISTS `jimu_report_db`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jimu_report_db` (
  `id` varchar(36) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL COMMENT 'id',
  `jimu_report_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'ä¸»é”®å­—æ®µ',
  `create_by` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'åˆ›å»ºäººç™»å½•åç§°',
  `update_by` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'æ›´æ–°äººç™»å½•åç§°',
  `create_time` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¥æœŸ',
  `update_time` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¥æœŸ',
  `db_code` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'æ•°æ®é›†ç¼–ç ',
  `db_ch_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'æ•°æ®é›†åå­—',
  `db_type` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'æ•°æ®æºç±»å‹',
  `db_table_name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'æ•°æ®åº“è¡¨å',
  `db_dyn_sql` longtext CHARACTER SET utf8mb3 COLLATE utf8_general_ci COMMENT 'åŠ¨æ€æŸ¥è¯¢SQL',
  `db_key` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'æ•°æ®æºKEY',
  `tb_db_key` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'å¡«æŠ¥æ•°æ®æº',
  `tb_db_table_name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'å¡«æŠ¥æ•°æ®è¡¨',
  `java_type` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'javaç±»æ•°æ®é›†  ç±»å‹ï¼ˆspring:springkey,class:javaç±»åï¼‰',
  `java_value` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'javaç±»æ•°æ®æº  æ•°å€¼ï¼ˆbean key/javaç±»åï¼‰',
  `api_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'è¯·æ±‚åœ°å€',
  `api_method` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'è¯·æ±‚æ–¹æ³•0-get,1-post',
  `is_list` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT '0' COMMENT 'æ˜¯å¦æ˜¯åˆ—è¡¨0å¦1æ˜¯ é»˜è®¤0',
  `is_page` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'æ˜¯å¦ä½œä¸ºåˆ†é¡µ,0:ä¸åˆ†é¡µï¼Œ1:åˆ†é¡µ',
  `db_source` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'æ•°æ®æº',
  `db_source_type` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'æ•°æ®åº“ç±»å‹ MYSQL ORACLE SQLSERVER',
  `json_data` text CHARACTER SET utf8mb3 COLLATE utf8_general_ci COMMENT 'jsonæ•°æ®ï¼Œç›´æ¥è§£æjsonå†…å®¹',
  `api_convert` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'apiè½¬æ¢å™¨',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_jmreportdb_db_key` (`db_key`) USING BTREE,
  KEY `idx_jimu_report_id` (`jimu_report_id`) USING BTREE,
  KEY `idx_db_source_id` (`db_source`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jimu_report_db`
--

LOCK TABLES `jimu_report_db` WRITE;
/*!40000 ALTER TABLE `jimu_report_db` DISABLE KEYS */;
/*!40000 ALTER TABLE `jimu_report_db` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jimu_report_register`
--

DROP TABLE IF EXISTS `jimu_report_register`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jimu_report_register` (
  `id` bigint NOT NULL,
  `report_code` varchar(255) DEFAULT NULL COMMENT 'æŠ¥è¡¨ç¼–ç ',
  `report_name` varchar(255) DEFAULT NULL COMMENT 'æŠ¥è¡¨åç§°',
  `report_id` varchar(255) DEFAULT NULL COMMENT 'æŠ¥è¡¨id',
  `remark` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨',
  `create_by` varchar(100) DEFAULT NULL COMMENT 'åˆ›å»ºè€…',
  `create_time` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(100) DEFAULT NULL COMMENT 'æ›´æ–°è€…',
  `update_time` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='æŠ¥è¡¨æ³¨å†Œè¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jimu_report_register`
--

LOCK TABLES `jimu_report_register` WRITE;
/*!40000 ALTER TABLE `jimu_report_register` DISABLE KEYS */;
/*!40000 ALTER TABLE `jimu_report_register` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jimu_report_register_role`
--

DROP TABLE IF EXISTS `jimu_report_register_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jimu_report_register_role` (
  `id` bigint NOT NULL,
  `role_id` bigint DEFAULT NULL COMMENT 'è§’è‰²id',
  `report_register_id` bigint DEFAULT NULL COMMENT 'æŠ¥è¡¨æ³¨å†Œid',
  `create_by` varchar(100) DEFAULT NULL COMMENT 'åˆ›å»ºè€…',
  `create_time` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(100) DEFAULT NULL COMMENT 'æ›´æ–°è€…',
  `update_time` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='æŠ¥è¡¨æ³¨å†Œè§’è‰²å…³è”è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jimu_report_register_role`
--

LOCK TABLES `jimu_report_register_role` WRITE;
/*!40000 ALTER TABLE `jimu_report_register_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `jimu_report_register_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_config`
--

DROP TABLE IF EXISTS `sys_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_config` (
  `config_id` bigint NOT NULL COMMENT 'å‚æ•°ä¸»é”®',
  `config_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'å‚æ•°åç§°',
  `config_key` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'å‚æ•°é”®å',
  `config_value` varchar(500) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'å‚æ•°é”®å€¼',
  `config_type` char(1) COLLATE utf8mb4_general_ci DEFAULT 'N' COMMENT 'ç³»ç»Ÿå†…ç½®ï¼ˆYæ˜¯ Nå¦ï¼‰',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'åˆ›å»ºè€…',
  `create_time` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'æ›´æ–°è€…',
  `update_time` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'å¤‡æ³¨',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='å‚æ•°é…ç½®è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_config`
--

LOCK TABLES `sys_config` WRITE;
/*!40000 ALTER TABLE `sys_config` DISABLE KEYS */;
INSERT INTO `sys_config` VALUES (1,'ä¸»æ¡†æ¶é¡µ-é»˜è®¤çš®è‚¤æ ·å¼åç§°','sys.index.skinName','skin-blue','Y','admin','2024-08-05 19:20:09','',NULL,'è“è‰² skin-blueã€ç»¿è‰² skin-greenã€ç´«è‰² skin-purpleã€çº¢è‰² skin-redã€é»„è‰² skin-yellow'),(2,'ç”¨æˆ·ç®¡ç†-è´¦å·åˆå§‹å¯†ç ','sys.user.initPassword','123456','Y','admin','2024-08-05 19:20:09','',NULL,'åˆå§‹åŒ–å¯†ç  123456'),(3,'ä¸»æ¡†æ¶é¡µ-ä¾§è¾¹æ ä¸»é¢˜','sys.index.sideTheme','theme-dark','Y','admin','2024-08-05 19:20:10','',NULL,'æ·±è‰²ä¸»é¢˜theme-darkï¼Œæµ…è‰²ä¸»é¢˜theme-light'),(4,'è´¦å·è‡ªåŠ©-éªŒè¯ç å¼€å…³','sys.account.captchaEnabled','true','Y','admin','2024-08-05 19:20:10','',NULL,'æ˜¯å¦å¼€å¯éªŒè¯ç åŠŸèƒ½ï¼ˆtrueå¼€å¯ï¼Œfalseå…³é—­ï¼‰'),(5,'è´¦å·è‡ªåŠ©-æ˜¯å¦å¼€å¯ç”¨æˆ·æ³¨å†ŒåŠŸèƒ½','sys.account.registerUser','false','Y','admin','2024-08-05 19:20:10','',NULL,'æ˜¯å¦å¼€å¯æ³¨å†Œç”¨æˆ·åŠŸèƒ½ï¼ˆtrueå¼€å¯ï¼Œfalseå…³é—­ï¼‰'),(11,'OSSé¢„è§ˆåˆ—è¡¨èµ„æºå¼€å…³','sys.oss.previewListResource','true','Y','admin','2024-08-05 19:20:10','',NULL,'true:å¼€å¯, false:å…³é—­');
/*!40000 ALTER TABLE `sys_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dept`
--

DROP TABLE IF EXISTS `sys_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dept` (
  `dept_id` bigint NOT NULL COMMENT 'éƒ¨é—¨id',
  `parent_id` bigint DEFAULT '0' COMMENT 'çˆ¶éƒ¨é—¨id',
  `ancestors` varchar(500) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'ç¥–çº§åˆ—è¡¨',
  `dept_name` varchar(30) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'éƒ¨é—¨åç§°',
  `order_num` int DEFAULT '0' COMMENT 'æ˜¾ç¤ºé¡ºåº',
  `leader` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'è´Ÿè´£äºº',
  `phone` varchar(11) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'è”ç³»ç”µè¯',
  `email` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'é‚®ç®±',
  `status` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT 'éƒ¨é—¨çŠ¶æ€ï¼ˆ0æ­£å¸¸ 1åœç”¨ï¼‰',
  `del_flag` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT 'åˆ é™¤æ ‡å¿—ï¼ˆ0ä»£è¡¨å­˜åœ¨ 2ä»£è¡¨åˆ é™¤ï¼‰',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'åˆ›å»ºè€…',
  `create_time` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'æ›´æ–°è€…',
  `update_time` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='éƒ¨é—¨è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dept`
--

LOCK TABLES `sys_dept` WRITE;
/*!40000 ALTER TABLE `sys_dept` DISABLE KEYS */;
INSERT INTO `sys_dept` VALUES (100,0,'0','è‹¥ä¾ç§‘æŠ€',0,'è‹¥ä¾','15888888888','ry@qq.com','0','0','admin','2024-08-05 19:19:48','',NULL),(101,100,'0,100','æ·±åœ³æ€»å…¬å¸',1,'è‹¥ä¾','15888888888','ry@qq.com','0','0','admin','2024-08-05 19:19:48','',NULL),(102,100,'0,100','é•¿æ²™åˆ†å…¬å¸',2,'è‹¥ä¾','15888888888','ry@qq.com','0','0','admin','2024-08-05 19:19:49','',NULL),(103,101,'0,100,101','ç ”å‘éƒ¨é—¨',1,'è‹¥ä¾','15888888888','ry@qq.com','0','0','admin','2024-08-05 19:19:49','',NULL),(104,101,'0,100,101','å¸‚åœºéƒ¨é—¨',2,'è‹¥ä¾','15888888888','ry@qq.com','0','0','admin','2024-08-05 19:19:49','',NULL),(105,101,'0,100,101','æµ‹è¯•éƒ¨é—¨',3,'è‹¥ä¾','15888888888','ry@qq.com','0','0','admin','2024-08-05 19:19:49','',NULL),(106,101,'0,100,101','è´¢åŠ¡éƒ¨é—¨',4,'è‹¥ä¾','15888888888','ry@qq.com','0','0','admin','2024-08-05 19:19:49','',NULL),(107,101,'0,100,101','è¿ç»´éƒ¨é—¨',5,'è‹¥ä¾','15888888888','ry@qq.com','0','0','admin','2024-08-05 19:19:49','',NULL),(108,102,'0,100,102','å¸‚åœºéƒ¨é—¨',1,'è‹¥ä¾','15888888888','ry@qq.com','0','0','admin','2024-08-05 19:19:49','',NULL),(109,102,'0,100,102','è´¢åŠ¡éƒ¨é—¨',2,'è‹¥ä¾','15888888888','ry@qq.com','0','0','admin','2024-08-05 19:19:49','',NULL);
/*!40000 ALTER TABLE `sys_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_data`
--

DROP TABLE IF EXISTS `sys_dict_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint NOT NULL COMMENT 'å­—å…¸ç¼–ç ',
  `dict_sort` int DEFAULT '0' COMMENT 'å­—å…¸æ’åº',
  `dict_label` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'å­—å…¸æ ‡ç­¾',
  `dict_value` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'å­—å…¸é”®å€¼',
  `dict_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'å­—å…¸ç±»å‹',
  `css_class` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'æ ·å¼å±æ€§ï¼ˆå…¶ä»–æ ·å¼æ‰©å±•ï¼‰',
  `list_class` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'è¡¨æ ¼å›æ˜¾æ ·å¼',
  `is_default` char(1) COLLATE utf8mb4_general_ci DEFAULT 'N' COMMENT 'æ˜¯å¦é»˜è®¤ï¼ˆYæ˜¯ Nå¦ï¼‰',
  `status` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT 'çŠ¶æ€ï¼ˆ0æ­£å¸¸ 1åœç”¨ï¼‰',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'åˆ›å»ºè€…',
  `create_time` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'æ›´æ–°è€…',
  `update_time` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'å¤‡æ³¨',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='å­—å…¸æ•°æ®è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_data`
--

LOCK TABLES `sys_dict_data` WRITE;
/*!40000 ALTER TABLE `sys_dict_data` DISABLE KEYS */;
INSERT INTO `sys_dict_data` VALUES (1,1,'ç”·','0','sys_user_sex','','','Y','0','admin','2024-08-05 19:20:07','',NULL,'æ€§åˆ«ç”·'),(2,2,'å¥³','1','sys_user_sex','','','N','0','admin','2024-08-05 19:20:07','',NULL,'æ€§åˆ«å¥³'),(3,3,'æœªçŸ¥','2','sys_user_sex','','','N','0','admin','2024-08-05 19:20:07','',NULL,'æ€§åˆ«æœªçŸ¥'),(4,1,'æ˜¾ç¤º','0','sys_show_hide','','primary','Y','0','admin','2024-08-05 19:20:07','',NULL,'æ˜¾ç¤ºèœå•'),(5,2,'éšè—','1','sys_show_hide','','danger','N','0','admin','2024-08-05 19:20:07','',NULL,'éšè—èœå•'),(6,1,'æ­£å¸¸','0','sys_normal_disable','','primary','Y','0','admin','2024-08-05 19:20:07','',NULL,'æ­£å¸¸çŠ¶æ€'),(7,2,'åœç”¨','1','sys_normal_disable','','danger','N','0','admin','2024-08-05 19:20:08','',NULL,'åœç”¨çŠ¶æ€'),(12,1,'æ˜¯','Y','sys_yes_no','','primary','Y','0','admin','2024-08-05 19:20:08','',NULL,'ç³»ç»Ÿé»˜è®¤æ˜¯'),(13,2,'å¦','N','sys_yes_no','','danger','N','0','admin','2024-08-05 19:20:08','',NULL,'ç³»ç»Ÿé»˜è®¤å¦'),(14,1,'é€šçŸ¥','1','sys_notice_type','','warning','Y','0','admin','2024-08-05 19:20:08','',NULL,'é€šçŸ¥'),(15,2,'å…¬å‘Š','2','sys_notice_type','','success','N','0','admin','2024-08-05 19:20:08','',NULL,'å…¬å‘Š'),(16,1,'æ­£å¸¸','0','sys_notice_status','','primary','Y','0','admin','2024-08-05 19:20:08','',NULL,'æ­£å¸¸çŠ¶æ€'),(17,2,'å…³é—­','1','sys_notice_status','','danger','N','0','admin','2024-08-05 19:20:08','',NULL,'å…³é—­çŠ¶æ€'),(18,1,'æ–°å¢','1','sys_oper_type','','info','N','0','admin','2024-08-05 19:20:08','',NULL,'æ–°å¢æ“ä½œ'),(19,2,'ä¿®æ”¹','2','sys_oper_type','','info','N','0','admin','2024-08-05 19:20:08','',NULL,'ä¿®æ”¹æ“ä½œ'),(20,3,'åˆ é™¤','3','sys_oper_type','','danger','N','0','admin','2024-08-05 19:20:08','',NULL,'åˆ é™¤æ“ä½œ'),(21,4,'æˆæƒ','4','sys_oper_type','','primary','N','0','admin','2024-08-05 19:20:08','',NULL,'æˆæƒæ“ä½œ'),(22,5,'å¯¼å‡º','5','sys_oper_type','','warning','N','0','admin','2024-08-05 19:20:08','',NULL,'å¯¼å‡ºæ“ä½œ'),(23,6,'å¯¼å…¥','6','sys_oper_type','','warning','N','0','admin','2024-08-05 19:20:08','',NULL,'å¯¼å…¥æ“ä½œ'),(24,7,'å¼ºé€€','7','sys_oper_type','','danger','N','0','admin','2024-08-05 19:20:08','',NULL,'å¼ºé€€æ“ä½œ'),(25,8,'ç”Ÿæˆä»£ç ','8','sys_oper_type','','warning','N','0','admin','2024-08-05 19:20:09','',NULL,'ç”Ÿæˆæ“ä½œ'),(26,9,'æ¸…ç©ºæ•°æ®','9','sys_oper_type','','danger','N','0','admin','2024-08-05 19:20:09','',NULL,'æ¸…ç©ºæ“ä½œ'),(27,1,'æˆåŠŸ','0','sys_common_status','','primary','N','0','admin','2024-08-05 19:20:09','',NULL,'æ­£å¸¸çŠ¶æ€'),(28,2,'å¤±è´¥','1','sys_common_status','','danger','N','0','admin','2024-08-05 19:20:09','',NULL,'åœç”¨çŠ¶æ€'),(29,99,'å…¶ä»–','0','sys_oper_type','','info','N','0','admin','2024-08-05 19:20:08','',NULL,'å…¶ä»–æ“ä½œ'),(39,1,'å·²æ’¤é”€','cancel','act_status','','danger','N','0','1','2024-08-06 09:37:27',NULL,NULL,'å·²æ’¤é”€'),(40,2,'è‰ç¨¿','draft','act_status','','info','N','0','1','2024-08-06 09:37:27',NULL,NULL,'è‰ç¨¿'),(41,3,'å¾…å®¡æ ¸','waiting','act_status','','primary','N','0','1','2024-08-06 09:37:27',NULL,NULL,'å¾…å®¡æ ¸'),(42,4,'å·²å®Œæˆ','finish','act_status','','success','N','0','1','2024-08-06 09:37:27',NULL,NULL,'å·²å®Œæˆ'),(43,5,'å·²ä½œåºŸ','invalid','act_status','','danger','N','0','1','2024-08-06 09:37:27',NULL,NULL,'å·²ä½œåºŸ'),(44,6,'å·²é€€å›','back','act_status','','danger','N','0','1','2024-08-06 09:37:27',NULL,NULL,'å·²é€€å›'),(45,7,'å·²ç»ˆæ­¢','termination','act_status','','danger','N','0','1','2024-08-06 09:37:27',NULL,NULL,'å·²ç»ˆæ­¢'),(46,1,'è‡ªå®šä¹‰è¡¨å•','static','wf_form_type','','success','N','0','1','2024-08-06 09:37:27',NULL,NULL,'è‡ªå®šä¹‰è¡¨å•'),(47,2,'åŠ¨æ€è¡¨å•','dynamic','wf_form_type','','primary','N','0','1','2024-08-06 09:37:27',NULL,NULL,'åŠ¨æ€è¡¨å•'),(1820702182615748609,0,'ç—…å‡','1','bs_leave_type',NULL,'default','N','0','admin','2024-08-06 14:03:22','admin','2024-08-06 14:03:22',NULL),(1820702261103759361,1,'äº‹å‡','2','bs_leave_type',NULL,'default','N','0','admin','2024-08-06 14:03:41','admin','2024-08-06 14:03:41',NULL),(1820702313578696706,2,'å¹´å‡','3','bs_leave_type',NULL,'default','N','0','admin','2024-08-06 14:03:53','admin','2024-08-06 14:03:53',NULL);
/*!40000 ALTER TABLE `sys_dict_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_type`
--

DROP TABLE IF EXISTS `sys_dict_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint NOT NULL COMMENT 'å­—å…¸ä¸»é”®',
  `dict_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'å­—å…¸åç§°',
  `dict_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'å­—å…¸ç±»å‹',
  `status` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT 'çŠ¶æ€ï¼ˆ0æ­£å¸¸ 1åœç”¨ï¼‰',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'åˆ›å»ºè€…',
  `create_time` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'æ›´æ–°è€…',
  `update_time` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'å¤‡æ³¨',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='å­—å…¸ç±»å‹è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_type`
--

LOCK TABLES `sys_dict_type` WRITE;
/*!40000 ALTER TABLE `sys_dict_type` DISABLE KEYS */;
INSERT INTO `sys_dict_type` VALUES (1,'ç”¨æˆ·æ€§åˆ«','sys_user_sex','0','admin','2024-08-05 19:20:06','',NULL,'ç”¨æˆ·æ€§åˆ«åˆ—è¡¨'),(2,'èœå•çŠ¶æ€','sys_show_hide','0','admin','2024-08-05 19:20:06','',NULL,'èœå•çŠ¶æ€åˆ—è¡¨'),(3,'ç³»ç»Ÿå¼€å…³','sys_normal_disable','0','admin','2024-08-05 19:20:06','',NULL,'ç³»ç»Ÿå¼€å…³åˆ—è¡¨'),(6,'ç³»ç»Ÿæ˜¯å¦','sys_yes_no','0','admin','2024-08-05 19:20:06','',NULL,'ç³»ç»Ÿæ˜¯å¦åˆ—è¡¨'),(7,'é€šçŸ¥ç±»å‹','sys_notice_type','0','admin','2024-08-05 19:20:07','',NULL,'é€šçŸ¥ç±»å‹åˆ—è¡¨'),(8,'é€šçŸ¥çŠ¶æ€','sys_notice_status','0','admin','2024-08-05 19:20:07','',NULL,'é€šçŸ¥çŠ¶æ€åˆ—è¡¨'),(9,'æ“ä½œç±»å‹','sys_oper_type','0','admin','2024-08-05 19:20:07','',NULL,'æ“ä½œç±»å‹åˆ—è¡¨'),(10,'ç³»ç»ŸçŠ¶æ€','sys_common_status','0','admin','2024-08-05 19:20:07','',NULL,'ç™»å½•çŠ¶æ€åˆ—è¡¨'),(13,'ä¸šåŠ¡çŠ¶æ€','act_status','0','1','2024-08-06 09:35:27','admin','2024-08-06 15:30:09','ä¸šåŠ¡çŠ¶æ€åˆ—è¡¨'),(14,'è¡¨å•ç±»å‹','wf_form_type','0','1','2024-08-06 09:35:27',NULL,NULL,'è¡¨å•ç±»å‹åˆ—è¡¨'),(1820701865723498498,'è¯·å‡ç±»å‹','bs_leave_type','0','admin','2024-08-06 14:02:06','admin','2024-08-06 14:02:06',NULL);
/*!40000 ALTER TABLE `sys_dict_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_logininfor`
--

DROP TABLE IF EXISTS `sys_logininfor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint NOT NULL COMMENT 'è®¿é—®ID',
  `user_name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'ç”¨æˆ·è´¦å·',
  `ipaddr` varchar(128) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'ç™»å½•IPåœ°å€',
  `login_location` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'ç™»å½•åœ°ç‚¹',
  `browser` varchar(50) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'æµè§ˆå™¨ç±»å‹',
  `os` varchar(50) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'æ“ä½œç³»ç»Ÿ',
  `status` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT 'ç™»å½•çŠ¶æ€ï¼ˆ0æˆåŠŸ 1å¤±è´¥ï¼‰',
  `msg` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'æç¤ºæ¶ˆæ¯',
  `login_time` datetime DEFAULT NULL COMMENT 'è®¿é—®æ—¶é—´',
  PRIMARY KEY (`info_id`),
  KEY `idx_sys_logininfor_s` (`status`),
  KEY `idx_sys_logininfor_lt` (`login_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='ç³»ç»Ÿè®¿é—®è®°å½•';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_logininfor`
--

LOCK TABLES `sys_logininfor` WRITE;
/*!40000 ALTER TABLE `sys_logininfor` DISABLE KEYS */;
INSERT INTO `sys_logininfor` VALUES (1820421027362451458,'admin','127.0.0.1','å†…ç½‘IP','Chrome','Windows 10 or Windows Server 2016','0','ç™»å½•æˆåŠŸ','2024-08-05 19:26:09'),(1820624543288868865,'admin','127.0.0.1','å†…ç½‘IP','Chrome','Windows 10 or Windows Server 2016','0','ç™»å½•æˆåŠŸ','2024-08-06 08:54:51'),(1820697414027644930,'admin','127.0.0.1','å†…ç½‘IP','Chrome','Windows 10 or Windows Server 2016','1','éªŒè¯ç å·²å¤±æ•ˆ','2024-08-06 13:44:25'),(1820697433124311042,'admin','127.0.0.1','å†…ç½‘IP','Chrome','Windows 10 or Windows Server 2016','0','ç™»å½•æˆåŠŸ','2024-08-06 13:44:30'),(1820700250761269250,'admin','127.0.0.1','å†…ç½‘IP','Chrome','Windows 10 or Windows Server 2016','0','é€€å‡ºæˆåŠŸ','2024-08-06 13:55:41'),(1820700268322820097,'admin','127.0.0.1','å†…ç½‘IP','Chrome','Windows 10 or Windows Server 2016','1','éªŒè¯ç é”™è¯¯','2024-08-06 13:55:46'),(1820700283606863873,'admin','127.0.0.1','å†…ç½‘IP','Chrome','Windows 10 or Windows Server 2016','0','ç™»å½•æˆåŠŸ','2024-08-06 13:55:49'),(1820707493154066434,'admin','127.0.0.1','å†…ç½‘IP','Chrome','Windows 10 or Windows Server 2016','0','é€€å‡ºæˆåŠŸ','2024-08-06 14:24:28'),(1820707510950498306,'admin','127.0.0.1','å†…ç½‘IP','Chrome','Windows 10 or Windows Server 2016','0','ç™»å½•æˆåŠŸ','2024-08-06 14:24:32'),(1820724634469208065,'admin','127.0.0.1','å†…ç½‘IP','Chrome','Windows 10 or Windows Server 2016','0','é€€å‡ºæˆåŠŸ','2024-08-06 15:32:35'),(1820724658934583297,'admin','127.0.0.1','å†…ç½‘IP','Chrome','Windows 10 or Windows Server 2016','0','ç™»å½•æˆåŠŸ','2024-08-06 15:32:41'),(1820724998891311106,'admin','127.0.0.1','å†…ç½‘IP','Chrome','Windows 10 or Windows Server 2016','0','é€€å‡ºæˆåŠŸ','2024-08-06 15:34:02'),(1820725016444473346,'admin','127.0.0.1','å†…ç½‘IP','Chrome','Windows 10 or Windows Server 2016','0','ç™»å½•æˆåŠŸ','2024-08-06 15:34:06');
/*!40000 ALTER TABLE `sys_logininfor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_menu` (
  `menu_id` bigint NOT NULL COMMENT 'èœå•ID',
  `menu_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'èœå•åç§°',
  `parent_id` bigint DEFAULT '0' COMMENT 'çˆ¶èœå•ID',
  `order_num` int DEFAULT '0' COMMENT 'æ˜¾ç¤ºé¡ºåº',
  `path` varchar(200) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'è·¯ç”±åœ°å€',
  `component` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ç»„ä»¶è·¯å¾„',
  `query_param` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'è·¯ç”±å‚æ•°',
  `is_frame` int DEFAULT '1' COMMENT 'æ˜¯å¦ä¸ºå¤–é“¾ï¼ˆ0æ˜¯ 1å¦ï¼‰',
  `is_cache` int DEFAULT '0' COMMENT 'æ˜¯å¦ç¼“å­˜ï¼ˆ0ç¼“å­˜ 1ä¸ç¼“å­˜ï¼‰',
  `menu_type` char(1) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'èœå•ç±»å‹ï¼ˆMç›®å½• Cèœå• FæŒ‰é’®ï¼‰',
  `visible` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT 'æ˜¾ç¤ºçŠ¶æ€ï¼ˆ0æ˜¾ç¤º 1éšè—ï¼‰',
  `status` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT 'èœå•çŠ¶æ€ï¼ˆ0æ­£å¸¸ 1åœç”¨ï¼‰',
  `perms` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'æƒé™æ ‡è¯†',
  `icon` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '#' COMMENT 'èœå•å›¾æ ‡',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'åˆ›å»ºè€…',
  `create_time` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'æ›´æ–°è€…',
  `update_time` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'å¤‡æ³¨',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='èœå•æƒé™è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,'ç³»ç»Ÿç®¡ç†',0,1,'system',NULL,'',1,0,'M','0','0','','system','admin','2024-08-05 19:19:51','',NULL,'ç³»ç»Ÿç®¡ç†ç›®å½•'),(2,'ç³»ç»Ÿç›‘æ§',0,2,'monitor',NULL,'',1,0,'M','0','0','','monitor','admin','2024-08-05 19:19:51','',NULL,'ç³»ç»Ÿç›‘æ§ç›®å½•'),(3,'ç³»ç»Ÿå·¥å…·',0,3,'tool',NULL,'',1,0,'M','0','0','','tool','admin','2024-08-05 19:19:51','',NULL,'ç³»ç»Ÿå·¥å…·ç›®å½•'),(4,'PLUSå®˜ç½‘',0,16,'https://gitee.com/dromara/RuoYi-Vue-Plus',NULL,'',0,0,'M','0','0','','guide','admin','2024-08-05 19:19:51','admin','2024-08-06 15:33:25','RuoYi-Vue-Pluså®˜ç½‘åœ°å€'),(5,'æµ‹è¯•èœå•',0,5,'demo',NULL,NULL,1,0,'M','0','0',NULL,'star','admin','2024-08-05 19:20:41',NULL,NULL,''),(100,'ç”¨æˆ·ç®¡ç†',1,1,'user','system/user/index','',1,0,'C','0','0','system:user:list','user','admin','2024-08-05 19:19:51','',NULL,'ç”¨æˆ·ç®¡ç†èœå•'),(101,'è§’è‰²ç®¡ç†',1,2,'role','system/role/index','',1,0,'C','0','0','system:role:list','peoples','admin','2024-08-05 19:19:51','',NULL,'è§’è‰²ç®¡ç†èœå•'),(102,'èœå•ç®¡ç†',1,3,'menu','system/menu/index','',1,0,'C','0','0','system:menu:list','tree-table','admin','2024-08-05 19:19:51','',NULL,'èœå•ç®¡ç†èœå•'),(103,'éƒ¨é—¨ç®¡ç†',1,4,'dept','system/dept/index','',1,0,'C','0','0','system:dept:list','tree','admin','2024-08-05 19:19:52','',NULL,'éƒ¨é—¨ç®¡ç†èœå•'),(104,'å²—ä½ç®¡ç†',1,5,'post','system/post/index','',1,0,'C','0','0','system:post:list','post','admin','2024-08-05 19:19:52','',NULL,'å²—ä½ç®¡ç†èœå•'),(105,'å­—å…¸ç®¡ç†',1,6,'dict','system/dict/index','',1,0,'C','0','0','system:dict:list','dict','admin','2024-08-05 19:19:52','',NULL,'å­—å…¸ç®¡ç†èœå•'),(106,'å‚æ•°è®¾ç½®',1,7,'config','system/config/index','',1,0,'C','0','0','system:config:list','edit','admin','2024-08-05 19:19:52','',NULL,'å‚æ•°è®¾ç½®èœå•'),(107,'é€šçŸ¥å…¬å‘Š',1,8,'notice','system/notice/index','',1,0,'C','0','0','system:notice:list','message','admin','2024-08-05 19:19:52','',NULL,'é€šçŸ¥å…¬å‘Šèœå•'),(108,'æ—¥å¿—ç®¡ç†',1,9,'log','','',1,0,'M','0','0','','log','admin','2024-08-05 19:19:52','',NULL,'æ—¥å¿—ç®¡ç†èœå•'),(109,'åœ¨çº¿ç”¨æˆ·',2,1,'online','monitor/online/index','',1,0,'C','0','0','monitor:online:list','online','admin','2024-08-05 19:19:52','',NULL,'åœ¨çº¿ç”¨æˆ·èœå•'),(112,'ç¼“å­˜åˆ—è¡¨',2,6,'cacheList','monitor/cache/list','',1,0,'C','0','0','monitor:cache:list','redis-list','admin','2024-08-05 19:19:52','',NULL,'ç¼“å­˜åˆ—è¡¨èœå•'),(113,'ç¼“å­˜ç›‘æ§',2,5,'cache','monitor/cache/index','',1,0,'C','0','0','monitor:cache:list','redis','admin','2024-08-05 19:19:52','',NULL,'ç¼“å­˜ç›‘æ§èœå•'),(114,'è¡¨å•æ„å»º',3,1,'build','tool/build/index','',1,0,'C','0','0','tool:build:list','build','admin','2024-08-05 19:19:52','',NULL,'è¡¨å•æ„å»ºèœå•'),(115,'ä»£ç ç”Ÿæˆ',3,2,'gen','tool/gen/index','',1,0,'C','0','0','tool:gen:list','code','admin','2024-08-05 19:19:52','',NULL,'ä»£ç ç”Ÿæˆèœå•'),(117,'Adminç›‘æ§',2,5,'Admin','monitor/admin/index','',1,0,'C','0','0','monitor:admin:list','dashboard','admin','2024-08-05 19:19:52','',NULL,'Adminç›‘æ§èœå•'),(118,'æ–‡ä»¶ç®¡ç†',1,10,'oss','system/oss/index','',1,0,'C','0','0','system:oss:list','upload','admin','2024-08-05 19:19:52','',NULL,'æ–‡ä»¶ç®¡ç†èœå•'),(120,'ä»»åŠ¡è°ƒåº¦ä¸­å¿ƒ',2,5,'XxlJob','monitor/xxljob/index','',1,0,'C','0','0','monitor:xxljob:list','job','admin','2024-08-05 19:19:53','',NULL,'Xxl-Jobæ§åˆ¶å°èœå•'),(500,'æ“ä½œæ—¥å¿—',108,1,'operlog','monitor/operlog/index','',1,0,'C','0','0','monitor:operlog:list','form','admin','2024-08-05 19:19:53','',NULL,'æ“ä½œæ—¥å¿—èœå•'),(501,'ç™»å½•æ—¥å¿—',108,2,'logininfor','monitor/logininfor/index','',1,0,'C','0','0','monitor:logininfor:list','logininfor','admin','2024-08-05 19:19:53','',NULL,'ç™»å½•æ—¥å¿—èœå•'),(1001,'ç”¨æˆ·æŸ¥è¯¢',100,1,'','','',1,0,'F','0','0','system:user:query','#','admin','2024-08-05 19:19:53','',NULL,''),(1002,'ç”¨æˆ·æ–°å¢',100,2,'','','',1,0,'F','0','0','system:user:add','#','admin','2024-08-05 19:19:53','',NULL,''),(1003,'ç”¨æˆ·ä¿®æ”¹',100,3,'','','',1,0,'F','0','0','system:user:edit','#','admin','2024-08-05 19:19:53','',NULL,''),(1004,'ç”¨æˆ·åˆ é™¤',100,4,'','','',1,0,'F','0','0','system:user:remove','#','admin','2024-08-05 19:19:53','',NULL,''),(1005,'ç”¨æˆ·å¯¼å‡º',100,5,'','','',1,0,'F','0','0','system:user:export','#','admin','2024-08-05 19:19:53','',NULL,''),(1006,'ç”¨æˆ·å¯¼å…¥',100,6,'','','',1,0,'F','0','0','system:user:import','#','admin','2024-08-05 19:19:53','',NULL,''),(1007,'é‡ç½®å¯†ç ',100,7,'','','',1,0,'F','0','0','system:user:resetPwd','#','admin','2024-08-05 19:19:53','',NULL,''),(1008,'è§’è‰²æŸ¥è¯¢',101,1,'','','',1,0,'F','0','0','system:role:query','#','admin','2024-08-05 19:19:53','',NULL,''),(1009,'è§’è‰²æ–°å¢',101,2,'','','',1,0,'F','0','0','system:role:add','#','admin','2024-08-05 19:19:53','',NULL,''),(1010,'è§’è‰²ä¿®æ”¹',101,3,'','','',1,0,'F','0','0','system:role:edit','#','admin','2024-08-05 19:19:53','',NULL,''),(1011,'è§’è‰²åˆ é™¤',101,4,'','','',1,0,'F','0','0','system:role:remove','#','admin','2024-08-05 19:19:53','',NULL,''),(1012,'è§’è‰²å¯¼å‡º',101,5,'','','',1,0,'F','0','0','system:role:export','#','admin','2024-08-05 19:19:53','',NULL,''),(1013,'èœå•æŸ¥è¯¢',102,1,'','','',1,0,'F','0','0','system:menu:query','#','admin','2024-08-05 19:19:54','',NULL,''),(1014,'èœå•æ–°å¢',102,2,'','','',1,0,'F','0','0','system:menu:add','#','admin','2024-08-05 19:19:54','',NULL,''),(1015,'èœå•ä¿®æ”¹',102,3,'','','',1,0,'F','0','0','system:menu:edit','#','admin','2024-08-05 19:19:54','',NULL,''),(1016,'èœå•åˆ é™¤',102,4,'','','',1,0,'F','0','0','system:menu:remove','#','admin','2024-08-05 19:19:54','',NULL,''),(1017,'éƒ¨é—¨æŸ¥è¯¢',103,1,'','','',1,0,'F','0','0','system:dept:query','#','admin','2024-08-05 19:19:54','',NULL,''),(1018,'éƒ¨é—¨æ–°å¢',103,2,'','','',1,0,'F','0','0','system:dept:add','#','admin','2024-08-05 19:19:54','',NULL,''),(1019,'éƒ¨é—¨ä¿®æ”¹',103,3,'','','',1,0,'F','0','0','system:dept:edit','#','admin','2024-08-05 19:19:54','',NULL,''),(1020,'éƒ¨é—¨åˆ é™¤',103,4,'','','',1,0,'F','0','0','system:dept:remove','#','admin','2024-08-05 19:19:54','',NULL,''),(1021,'å²—ä½æŸ¥è¯¢',104,1,'','','',1,0,'F','0','0','system:post:query','#','admin','2024-08-05 19:19:54','',NULL,''),(1022,'å²—ä½æ–°å¢',104,2,'','','',1,0,'F','0','0','system:post:add','#','admin','2024-08-05 19:19:54','',NULL,''),(1023,'å²—ä½ä¿®æ”¹',104,3,'','','',1,0,'F','0','0','system:post:edit','#','admin','2024-08-05 19:19:54','',NULL,''),(1024,'å²—ä½åˆ é™¤',104,4,'','','',1,0,'F','0','0','system:post:remove','#','admin','2024-08-05 19:19:54','',NULL,''),(1025,'å²—ä½å¯¼å‡º',104,5,'','','',1,0,'F','0','0','system:post:export','#','admin','2024-08-05 19:19:54','',NULL,''),(1026,'å­—å…¸æŸ¥è¯¢',105,1,'#','','',1,0,'F','0','0','system:dict:query','#','admin','2024-08-05 19:19:54','',NULL,''),(1027,'å­—å…¸æ–°å¢',105,2,'#','','',1,0,'F','0','0','system:dict:add','#','admin','2024-08-05 19:19:54','',NULL,''),(1028,'å­—å…¸ä¿®æ”¹',105,3,'#','','',1,0,'F','0','0','system:dict:edit','#','admin','2024-08-05 19:19:55','',NULL,''),(1029,'å­—å…¸åˆ é™¤',105,4,'#','','',1,0,'F','0','0','system:dict:remove','#','admin','2024-08-05 19:19:55','',NULL,''),(1030,'å­—å…¸å¯¼å‡º',105,5,'#','','',1,0,'F','0','0','system:dict:export','#','admin','2024-08-05 19:19:55','',NULL,''),(1031,'å‚æ•°æŸ¥è¯¢',106,1,'#','','',1,0,'F','0','0','system:config:query','#','admin','2024-08-05 19:19:55','',NULL,''),(1032,'å‚æ•°æ–°å¢',106,2,'#','','',1,0,'F','0','0','system:config:add','#','admin','2024-08-05 19:19:55','',NULL,''),(1033,'å‚æ•°ä¿®æ”¹',106,3,'#','','',1,0,'F','0','0','system:config:edit','#','admin','2024-08-05 19:19:55','',NULL,''),(1034,'å‚æ•°åˆ é™¤',106,4,'#','','',1,0,'F','0','0','system:config:remove','#','admin','2024-08-05 19:19:55','',NULL,''),(1035,'å‚æ•°å¯¼å‡º',106,5,'#','','',1,0,'F','0','0','system:config:export','#','admin','2024-08-05 19:19:55','',NULL,''),(1036,'å…¬å‘ŠæŸ¥è¯¢',107,1,'#','','',1,0,'F','0','0','system:notice:query','#','admin','2024-08-05 19:19:55','',NULL,''),(1037,'å…¬å‘Šæ–°å¢',107,2,'#','','',1,0,'F','0','0','system:notice:add','#','admin','2024-08-05 19:19:55','',NULL,''),(1038,'å…¬å‘Šä¿®æ”¹',107,3,'#','','',1,0,'F','0','0','system:notice:edit','#','admin','2024-08-05 19:19:55','',NULL,''),(1039,'å…¬å‘Šåˆ é™¤',107,4,'#','','',1,0,'F','0','0','system:notice:remove','#','admin','2024-08-05 19:19:55','',NULL,''),(1040,'æ“ä½œæŸ¥è¯¢',500,1,'#','','',1,0,'F','0','0','monitor:operlog:query','#','admin','2024-08-05 19:19:55','',NULL,''),(1041,'æ“ä½œåˆ é™¤',500,2,'#','','',1,0,'F','0','0','monitor:operlog:remove','#','admin','2024-08-05 19:19:56','',NULL,''),(1042,'æ—¥å¿—å¯¼å‡º',500,4,'#','','',1,0,'F','0','0','monitor:operlog:export','#','admin','2024-08-05 19:19:56','',NULL,''),(1043,'ç™»å½•æŸ¥è¯¢',501,1,'#','','',1,0,'F','0','0','monitor:logininfor:query','#','admin','2024-08-05 19:19:56','',NULL,''),(1044,'ç™»å½•åˆ é™¤',501,2,'#','','',1,0,'F','0','0','monitor:logininfor:remove','#','admin','2024-08-05 19:19:56','',NULL,''),(1045,'æ—¥å¿—å¯¼å‡º',501,3,'#','','',1,0,'F','0','0','monitor:logininfor:export','#','admin','2024-08-05 19:19:56','',NULL,''),(1046,'åœ¨çº¿æŸ¥è¯¢',109,1,'#','','',1,0,'F','0','0','monitor:online:query','#','admin','2024-08-05 19:19:56','',NULL,''),(1047,'æ‰¹é‡å¼ºé€€',109,2,'#','','',1,0,'F','0','0','monitor:online:batchLogout','#','admin','2024-08-05 19:19:56','',NULL,''),(1048,'å•æ¡å¼ºé€€',109,3,'#','','',1,0,'F','0','0','monitor:online:forceLogout','#','admin','2024-08-05 19:19:56','',NULL,''),(1050,'è´¦æˆ·è§£é”',501,4,'#','','',1,0,'F','0','0','monitor:logininfor:unlock','#','admin','2024-08-05 19:19:56','',NULL,''),(1055,'ç”ŸæˆæŸ¥è¯¢',115,1,'#','','',1,0,'F','0','0','tool:gen:query','#','admin','2024-08-05 19:19:56','',NULL,''),(1056,'ç”Ÿæˆä¿®æ”¹',115,2,'#','','',1,0,'F','0','0','tool:gen:edit','#','admin','2024-08-05 19:19:56','',NULL,''),(1057,'ç”Ÿæˆåˆ é™¤',115,3,'#','','',1,0,'F','0','0','tool:gen:remove','#','admin','2024-08-05 19:19:56','',NULL,''),(1058,'å¯¼å…¥ä»£ç ',115,2,'#','','',1,0,'F','0','0','tool:gen:import','#','admin','2024-08-05 19:19:56','',NULL,''),(1059,'é¢„è§ˆä»£ç ',115,4,'#','','',1,0,'F','0','0','tool:gen:preview','#','admin','2024-08-05 19:19:56','',NULL,''),(1060,'ç”Ÿæˆä»£ç ',115,5,'#','','',1,0,'F','0','0','tool:gen:code','#','admin','2024-08-05 19:19:56','',NULL,''),(1500,'æµ‹è¯•å•è¡¨',5,1,'demo','demo/demo/index',NULL,1,0,'C','0','0','demo:demo:list','example','admin','2024-08-05 19:20:41','admin','2024-08-06 15:33:49','æµ‹è¯•å•è¡¨èœå•'),(1501,'æµ‹è¯•å•è¡¨æŸ¥è¯¢',1500,1,'#','',NULL,1,0,'F','0','0','demo:demo:query','#','admin','2024-08-05 19:20:41','',NULL,''),(1502,'æµ‹è¯•å•è¡¨æ–°å¢',1500,2,'#','',NULL,1,0,'F','0','0','demo:demo:add','#','admin','2024-08-05 19:20:41','',NULL,''),(1503,'æµ‹è¯•å•è¡¨ä¿®æ”¹',1500,3,'#','',NULL,1,0,'F','0','0','demo:demo:edit','#','admin','2024-08-05 19:20:41','',NULL,''),(1504,'æµ‹è¯•å•è¡¨åˆ é™¤',1500,4,'#','',NULL,1,0,'F','0','0','demo:demo:remove','#','admin','2024-08-05 19:20:41','',NULL,''),(1505,'æµ‹è¯•å•è¡¨å¯¼å‡º',1500,5,'#','',NULL,1,0,'F','0','0','demo:demo:export','#','admin','2024-08-05 19:20:41','',NULL,''),(1506,'æµ‹è¯•æ ‘è¡¨',5,1,'tree','demo/tree/index',NULL,1,0,'C','0','0','demo:tree:list','example','admin','2024-08-05 19:20:41','admin','2024-08-06 15:33:56','æµ‹è¯•æ ‘è¡¨èœå•'),(1507,'æµ‹è¯•æ ‘è¡¨æŸ¥è¯¢',1506,1,'#','',NULL,1,0,'F','0','0','demo:tree:query','#','admin','2024-08-05 19:20:41','',NULL,''),(1508,'æµ‹è¯•æ ‘è¡¨æ–°å¢',1506,2,'#','',NULL,1,0,'F','0','0','demo:tree:add','#','admin','2024-08-05 19:20:42','',NULL,''),(1509,'æµ‹è¯•æ ‘è¡¨ä¿®æ”¹',1506,3,'#','',NULL,1,0,'F','0','0','demo:tree:edit','#','admin','2024-08-05 19:20:42','',NULL,''),(1510,'æµ‹è¯•æ ‘è¡¨åˆ é™¤',1506,4,'#','',NULL,1,0,'F','0','0','demo:tree:remove','#','admin','2024-08-05 19:20:42','',NULL,''),(1511,'æµ‹è¯•æ ‘è¡¨å¯¼å‡º',1506,5,'#','',NULL,1,0,'F','0','0','demo:tree:export','#','admin','2024-08-05 19:20:42','',NULL,''),(1600,'æ–‡ä»¶æŸ¥è¯¢',118,1,'#','','',1,0,'F','0','0','system:oss:query','#','admin','2024-08-05 19:19:56','',NULL,''),(1601,'æ–‡ä»¶ä¸Šä¼ ',118,2,'#','','',1,0,'F','0','0','system:oss:upload','#','admin','2024-08-05 19:19:57','',NULL,''),(1602,'æ–‡ä»¶ä¸‹è½½',118,3,'#','','',1,0,'F','0','0','system:oss:download','#','admin','2024-08-05 19:19:57','',NULL,''),(1603,'æ–‡ä»¶åˆ é™¤',118,4,'#','','',1,0,'F','0','0','system:oss:remove','#','admin','2024-08-05 19:19:57','',NULL,''),(1604,'é…ç½®æ·»åŠ ',118,5,'#','','',1,0,'F','0','0','system:oss:add','#','admin','2024-08-05 19:19:57','',NULL,''),(1605,'é…ç½®ç¼–è¾‘',118,6,'#','','',1,0,'F','0','0','system:oss:edit','#','admin','2024-08-05 19:19:57','',NULL,''),(11616,'å·¥ä½œæµ',0,6,'workflow','','',1,0,'M','0','0','','documentation','1','2024-08-06 09:35:22','admin','2024-08-06 10:40:23',''),(11617,'æ¨¡å‹ç®¡ç†',11616,2,'model','workflow/model/index','',1,1,'C','0','0','','education','1','2024-08-06 09:35:23','admin','2024-08-06 10:40:45',''),(11618,'æˆ‘çš„ä»»åŠ¡',0,7,'task','','',1,0,'M','0','0','','tab','1','2024-08-06 09:35:23','admin','2024-08-06 10:39:34',''),(11619,'æˆ‘çš„å¾…åŠ',11618,3,'taskWaiting','workflow/task/personalWaiting','',1,1,'C','0','0','','job','1','2024-08-06 09:35:23','admin','2024-08-06 10:42:15',''),(11620,'æµç¨‹å®šä¹‰',11616,3,'processDefinition','workflow/definition/index','',1,1,'C','0','0','','dict','1','2024-08-06 09:35:23','admin','2024-08-06 10:40:54',''),(11621,'æ‰§è¡Œä¸­å®ä¾‹',11630,1,'processInstance','workflow/instance/running','',1,1,'C','0','0','','job','1','2024-08-06 09:35:23','admin','2024-08-06 10:47:57',''),(11622,'æµç¨‹åˆ†ç±»',11616,1,'category','workflow/category/index','',1,0,'C','0','0','workflow:category:list','nested','1','2024-08-06 09:35:23','admin','2024-08-06 10:41:13',''),(11624,'æµç¨‹åˆ†ç±»æ–°å¢',11622,2,'#','','',1,0,'F','0','0','workflow:category:add','#','1','2024-08-06 09:35:24',NULL,NULL,''),(11626,'æµç¨‹åˆ†ç±»åˆ é™¤',11622,4,'#','','',1,0,'F','0','0','workflow:category:remove','#','1','2024-08-06 09:35:24',NULL,NULL,''),(11628,'ä¸šåŠ¡è§„åˆ™',11616,5,'businessRule','workflow/businessRule/index',NULL,1,0,'C','0','0','workflow:businessRule:list','skill','1','2024-08-06 09:37:27','admin','2024-08-06 10:38:42','è¡¨å•ç®¡ç†èœå•'),(11629,'å…¨éƒ¨å¾…åŠ',11618,1,'myDocument','workflow/task/waiting','',1,1,'C','0','0','','cascader','1','2024-08-06 09:35:23','admin','2024-08-06 10:41:31',''),(11630,'æµç¨‹ç›‘æ§',11616,4,'monitor','','',1,0,'M','0','0','','monitor','1','2024-08-06 09:35:23',NULL,NULL,''),(11631,'å·²å®Œæˆå®ä¾‹',11630,2,'allTaskWaiting','workflow/instance/finish','',1,1,'C','0','0','','log','1','2024-08-06 09:35:23','admin','2024-08-06 10:48:08',''),(11632,'æˆ‘çš„å·²åŠ',11618,4,'taskFinish','workflow/task/personalFinish','',1,1,'C','0','0','','log','1','2024-08-06 09:35:23','admin','2024-08-06 10:42:27',''),(11633,'å…¨éƒ¨å·²åŠ',11618,2,'taskCopyList','workflow/task/finish','',1,1,'C','0','0','','druid','1','2024-08-06 09:35:23','admin','2024-08-06 10:41:46',''),(11638,'è¯·å‡ç”³è¯·',5,1,'leave','demo/leave/index',NULL,1,0,'C','0','0','demo:leave:list','user','1','2024-08-06 09:35:26','admin','2024-08-06 13:54:25','è¯·å‡ç”³è¯·èœå•'),(11639,'è¯·å‡ç”³è¯·æŸ¥è¯¢',11638,1,'#','',NULL,1,0,'F','0','0','demo:leave:query','#','1','2024-08-06 09:35:26','admin','2024-08-06 13:54:53',''),(11640,'è¯·å‡ç”³è¯·æ–°å¢',11638,2,'#','',NULL,1,0,'F','0','0','demo:leave:add','#','1','2024-08-06 09:35:26','admin','2024-08-06 13:55:16',''),(11641,'è¯·å‡ç”³è¯·ä¿®æ”¹',11638,3,'#','',NULL,1,0,'F','0','0','demo:leave:edit','#','1','2024-08-06 09:35:26','admin','2024-08-06 13:55:26',''),(11642,'è¯·å‡ç”³è¯·åˆ é™¤',11638,4,'#','',NULL,1,0,'F','0','0','demo:leave:remove','#','1','2024-08-06 09:35:26','admin','2024-08-06 13:55:35',''),(11643,'è¯·å‡ç”³è¯·å¯¼å‡º',11638,5,'#','',NULL,1,0,'F','0','0','demo:leave:export','#','1','2024-08-06 09:35:26','admin','2024-08-06 13:54:42',''),(11644,'ä¸šåŠ¡è§„åˆ™æŸ¥è¯¢',11628,1,'#','',NULL,1,0,'F','0','0','workflow:businessRule:query','','1','2024-08-06 09:37:27','admin','2024-08-06 10:36:21',''),(11645,'ä¸šåŠ¡è§„åˆ™æ–°å¢',11628,2,'#','',NULL,1,0,'F','0','0','workflow:businessRule:add','','1','2024-08-06 09:37:28','admin','2024-08-06 10:36:40',''),(11646,'ä¸šåŠ¡è§„åˆ™ä¿®æ”¹',11628,3,'#','',NULL,1,0,'F','0','0','workflow:businessRule:edit','','1','2024-08-06 09:37:28','admin','2024-08-06 10:36:56',''),(11647,'ä¸šåŠ¡è§„åˆ™åˆ é™¤',11628,4,'#','',NULL,1,0,'F','0','0','workflow:businessRule:remove','','1','2024-08-06 09:37:28','admin','2024-08-06 10:37:15',''),(11648,'ä¸šåŠ¡è§„åˆ™å¯¼å‡º',11628,5,'#','',NULL,1,0,'F','0','0','workflow:businessRule:export','tree-table','1','2024-08-06 09:37:28','admin','2024-08-06 10:37:43',''),(1820710032800944129,'æŠ¥è¡¨æ³¨å†Œ',3,3,'reportRegister','report/reportRegister/index',NULL,1,0,'C','0','0','report:reportRegister:list','documentation','admin','2024-08-06 14:34:34','admin','2024-08-06 14:34:34','');
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_message`
--

DROP TABLE IF EXISTS `sys_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_message` (
  `id` bigint NOT NULL,
  `send_id` bigint DEFAULT NULL COMMENT 'æ¶ˆæ¯å‘é€è€…id',
  `record_id` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'æ¶ˆæ¯æ¥æ”¶è€…id',
  `type` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'æ¶ˆæ¯ç±»å‹1ï¼šç«™å†…ä¿¡ï¼Œ2ï¼šé‚®ä»¶ï¼Œ3ï¼šçŸ­ä¿¡',
  `title` varchar(300) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'æ ‡é¢˜',
  `read_time` datetime DEFAULT NULL COMMENT 'é˜…è¯»æ—¶é—´',
  `status` varchar(5) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'é˜…è¯»çŠ¶æ€0ï¼šæœªè¯»ï¼Œ1ï¼šå·²è¯»',
  `message_content` text COLLATE utf8mb4_general_ci COMMENT 'æ¶ˆæ¯å†…å®¹',
  `create_by` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_message`
--

LOCK TABLES `sys_message` WRITE;
/*!40000 ALTER TABLE `sys_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_notice`
--

DROP TABLE IF EXISTS `sys_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_notice` (
  `notice_id` bigint NOT NULL COMMENT 'å…¬å‘ŠID',
  `notice_title` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'å…¬å‘Šæ ‡é¢˜',
  `notice_type` char(1) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'å…¬å‘Šç±»å‹ï¼ˆ1é€šçŸ¥ 2å…¬å‘Šï¼‰',
  `notice_content` longblob COMMENT 'å…¬å‘Šå†…å®¹',
  `status` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT 'å…¬å‘ŠçŠ¶æ€ï¼ˆ0æ­£å¸¸ 1å…³é—­ï¼‰',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'åˆ›å»ºè€…',
  `create_time` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'æ›´æ–°è€…',
  `update_time` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remark` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'å¤‡æ³¨',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='é€šçŸ¥å…¬å‘Šè¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_notice`
--

LOCK TABLES `sys_notice` WRITE;
/*!40000 ALTER TABLE `sys_notice` DISABLE KEYS */;
INSERT INTO `sys_notice` VALUES (1,'æ¸©é¦¨æé†’ï¼š2018-07-01 æ–°ç‰ˆæœ¬å‘å¸ƒå•¦','2',_binary 'æ–°ç‰ˆæœ¬å†…å®¹','0','admin','2024-08-05 19:20:11','',NULL,'ç®¡ç†å‘˜'),(2,'ç»´æŠ¤é€šçŸ¥ï¼š2018-07-01 ç³»ç»Ÿå‡Œæ™¨ç»´æŠ¤','1',_binary 'ç»´æŠ¤å†…å®¹','0','admin','2024-08-05 19:20:11','',NULL,'ç®¡ç†å‘˜');
/*!40000 ALTER TABLE `sys_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_oper_log`
--

DROP TABLE IF EXISTS `sys_oper_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint NOT NULL COMMENT 'æ—¥å¿—ä¸»é”®',
  `title` varchar(50) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'æ¨¡å—æ ‡é¢˜',
  `business_type` int DEFAULT '0' COMMENT 'ä¸šåŠ¡ç±»å‹ï¼ˆ0å…¶å®ƒ 1æ–°å¢ 2ä¿®æ”¹ 3åˆ é™¤ï¼‰',
  `method` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'æ–¹æ³•åç§°',
  `request_method` varchar(10) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'è¯·æ±‚æ–¹å¼',
  `operator_type` int DEFAULT '0' COMMENT 'æ“ä½œç±»åˆ«ï¼ˆ0å…¶å®ƒ 1åå°ç”¨æˆ· 2æ‰‹æœºç«¯ç”¨æˆ·ï¼‰',
  `oper_name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'æ“ä½œäººå‘˜',
  `dept_name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'éƒ¨é—¨åç§°',
  `oper_url` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'è¯·æ±‚URL',
  `oper_ip` varchar(128) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'ä¸»æœºåœ°å€',
  `oper_location` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'æ“ä½œåœ°ç‚¹',
  `oper_param` varchar(2000) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'è¯·æ±‚å‚æ•°',
  `json_result` varchar(2000) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'è¿”å›å‚æ•°',
  `status` int DEFAULT '0' COMMENT 'æ“ä½œçŠ¶æ€ï¼ˆ0æ­£å¸¸ 1å¼‚å¸¸ï¼‰',
  `error_msg` varchar(2000) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'é”™è¯¯æ¶ˆæ¯',
  `oper_time` datetime DEFAULT NULL COMMENT 'æ“ä½œæ—¶é—´',
  PRIMARY KEY (`oper_id`),
  KEY `idx_sys_oper_log_bt` (`business_type`),
  KEY `idx_sys_oper_log_s` (`status`),
  KEY `idx_sys_oper_log_ot` (`oper_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='æ“ä½œæ—¥å¿—è®°å½•';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_oper_log`
--

LOCK TABLES `sys_oper_log` WRITE;
/*!40000 ALTER TABLE `sys_oper_log` DISABLE KEYS */;
INSERT INTO `sys_oper_log` VALUES (1820640121722454017,'èœå•ç®¡ç†',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','ç ”å‘éƒ¨é—¨','/system/menu','127.0.0.1','å†…ç½‘IP','{\"createBy\":\"1\",\"createTime\":\"2024-08-06 09:35:23\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 09:56:45\",\"parentName\":null,\"parentId\":11616,\"children\":[],\"menuId\":11620,\"menuName\":\"æµç¨‹å®šä¹‰\",\"orderNum\":3,\"path\":\"processDefinition\",\"component\":\"workflow/definition/index\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"1\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"\",\"icon\":\"process-definition\",\"remark\":\"\"}','{\"code\":200,\"msg\":\"æ“ä½œæˆåŠŸ\",\"data\":null}',0,'','2024-08-06 09:56:46'),(1820642672958193666,'èœå•ç®¡ç†',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','ç ”å‘éƒ¨é—¨','/system/menu','127.0.0.1','å†…ç½‘IP','{\"createBy\":\"1\",\"createTime\":\"2024-08-06 09:35:23\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 10:06:53\",\"parentName\":null,\"parentId\":11618,\"children\":[],\"menuId\":11619,\"menuName\":\"æˆ‘çš„å¾…åŠ\",\"orderNum\":2,\"path\":\"taskWaiting\",\"component\":\"workflow/task/getTaskWaitByPage\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"1\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"\",\"icon\":\"waiting\",\"remark\":\"\"}','{\"code\":200,\"msg\":\"æ“ä½œæˆåŠŸ\",\"data\":null}',0,'','2024-08-06 10:06:54'),(1820644982874652673,'èœå•ç®¡ç†',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','ç ”å‘éƒ¨é—¨','/system/menu','127.0.0.1','å†…ç½‘IP','{\"createBy\":\"1\",\"createTime\":\"2024-08-06 09:35:23\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 10:16:04\",\"parentName\":null,\"parentId\":11618,\"children\":[],\"menuId\":11619,\"menuName\":\"æˆ‘çš„å¾…åŠ\",\"orderNum\":2,\"path\":\"taskWaiting\",\"component\":\"workflow/task/personalWaiting\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"1\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"\",\"icon\":\"waiting\",\"remark\":\"\"}','{\"code\":200,\"msg\":\"æ“ä½œæˆåŠŸ\",\"data\":null}',0,'','2024-08-06 10:16:05'),(1820645096649342978,'èœå•ç®¡ç†',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','ç ”å‘éƒ¨é—¨','/system/menu','127.0.0.1','å†…ç½‘IP','{\"createBy\":\"1\",\"createTime\":\"2024-08-06 09:35:23\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 10:16:31\",\"parentName\":null,\"parentId\":11618,\"children\":[],\"menuId\":11632,\"menuName\":\"æˆ‘çš„å·²åŠ\",\"orderNum\":3,\"path\":\"taskFinish\",\"component\":\"workflow/task/personalFinish\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"1\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"\",\"icon\":\"finish\",\"remark\":\"\"}','{\"code\":200,\"msg\":\"æ“ä½œæˆåŠŸ\",\"data\":null}',0,'','2024-08-06 10:16:32'),(1820646977136181250,'èœå•ç®¡ç†',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','ç ”å‘éƒ¨é—¨','/system/menu','127.0.0.1','å†…ç½‘IP','{\"createBy\":\"1\",\"createTime\":\"2024-08-06 09:35:23\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 10:23:59\",\"parentName\":null,\"parentId\":11618,\"children\":[],\"menuId\":11629,\"menuName\":\"å…¨éƒ¨å¾…åŠ\",\"orderNum\":1,\"path\":\"myDocument\",\"component\":\"workflow/task/waiting\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"1\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"\",\"icon\":\"guide\",\"remark\":\"\"}','{\"code\":200,\"msg\":\"æ“ä½œæˆåŠŸ\",\"data\":null}',0,'','2024-08-06 10:24:00'),(1820647109122539521,'èœå•ç®¡ç†',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','ç ”å‘éƒ¨é—¨','/system/menu','127.0.0.1','å†…ç½‘IP','{\"createBy\":\"1\",\"createTime\":\"2024-08-06 09:35:23\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 10:24:31\",\"parentName\":null,\"parentId\":11618,\"children\":[],\"menuId\":11633,\"menuName\":\"å…¨éƒ¨å·²åŠ\",\"orderNum\":4,\"path\":\"taskCopyList\",\"component\":\"workflow/task/finish\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"1\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"\",\"icon\":\"my-copy\",\"remark\":\"\"}','{\"code\":200,\"msg\":\"æ“ä½œæˆåŠŸ\",\"data\":null}',0,'','2024-08-06 10:24:31'),(1820647254438395905,'èœå•ç®¡ç†',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','ç ”å‘éƒ¨é—¨','/system/menu','127.0.0.1','å†…ç½‘IP','{\"createBy\":\"1\",\"createTime\":\"2024-08-06 09:35:23\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 10:25:06\",\"parentName\":null,\"parentId\":11618,\"children\":[],\"menuId\":11619,\"menuName\":\"æˆ‘çš„å¾…åŠ\",\"orderNum\":3,\"path\":\"taskWaiting\",\"component\":\"workflow/task/personalWaiting\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"1\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"\",\"icon\":\"waiting\",\"remark\":\"\"}','{\"code\":200,\"msg\":\"æ“ä½œæˆåŠŸ\",\"data\":null}',0,'','2024-08-06 10:25:06'),(1820647277720977409,'èœå•ç®¡ç†',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','ç ”å‘éƒ¨é—¨','/system/menu','127.0.0.1','å†…ç½‘IP','{\"createBy\":\"1\",\"createTime\":\"2024-08-06 09:35:23\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 10:25:11\",\"parentName\":null,\"parentId\":11618,\"children\":[],\"menuId\":11632,\"menuName\":\"æˆ‘çš„å·²åŠ\",\"orderNum\":4,\"path\":\"taskFinish\",\"component\":\"workflow/task/personalFinish\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"1\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"\",\"icon\":\"finish\",\"remark\":\"\"}','{\"code\":200,\"msg\":\"æ“ä½œæˆåŠŸ\",\"data\":null}',0,'','2024-08-06 10:25:12'),(1820647298977710081,'èœå•ç®¡ç†',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','ç ”å‘éƒ¨é—¨','/system/menu','127.0.0.1','å†…ç½‘IP','{\"createBy\":\"1\",\"createTime\":\"2024-08-06 09:35:23\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 10:25:16\",\"parentName\":null,\"parentId\":11618,\"children\":[],\"menuId\":11633,\"menuName\":\"å…¨éƒ¨å·²åŠ\",\"orderNum\":2,\"path\":\"taskCopyList\",\"component\":\"workflow/task/finish\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"1\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"\",\"icon\":\"my-copy\",\"remark\":\"\"}','{\"code\":200,\"msg\":\"æ“ä½œæˆåŠŸ\",\"data\":null}',0,'','2024-08-06 10:25:17'),(1820648019563331585,'èœå•ç®¡ç†',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','ç ”å‘éƒ¨é—¨','/system/menu/11627','127.0.0.1','å†…ç½‘IP','{}','{\"code\":200,\"msg\":\"æ“ä½œæˆåŠŸ\",\"data\":null}',0,'','2024-08-06 10:28:09'),(1820648037779193857,'èœå•ç®¡ç†',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','ç ”å‘éƒ¨é—¨','/system/menu/11625','127.0.0.1','å†…ç½‘IP','{}','{\"code\":200,\"msg\":\"æ“ä½œæˆåŠŸ\",\"data\":null}',0,'','2024-08-06 10:28:13'),(1820648058788462594,'èœå•ç®¡ç†',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','ç ”å‘éƒ¨é—¨','/system/menu/11623','127.0.0.1','å†…ç½‘IP','{}','{\"code\":200,\"msg\":\"æ“ä½œæˆåŠŸ\",\"data\":null}',0,'','2024-08-06 10:28:18'),(1820648317438607362,'èœå•ç®¡ç†',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','ç ”å‘éƒ¨é—¨','/system/menu','127.0.0.1','å†…ç½‘IP','{\"createBy\":\"1\",\"createTime\":\"2024-08-06 09:35:23\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 10:29:19\",\"parentName\":null,\"parentId\":11616,\"children\":[],\"menuId\":11617,\"menuName\":\"æ¨¡å‹ç®¡ç†\",\"orderNum\":2,\"path\":\"model\",\"component\":\"workflow/model/index\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"1\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"\",\"icon\":\"model\",\"remark\":\"\"}','{\"code\":200,\"msg\":\"æ“ä½œæˆåŠŸ\",\"data\":null}',0,'','2024-08-06 10:29:20'),(1820649167166849026,'èœå•ç®¡ç†',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','ç ”å‘éƒ¨é—¨','/system/menu','127.0.0.1','å†…ç½‘IP','{\"createBy\":\"1\",\"createTime\":\"2024-08-06 09:35:23\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 10:32:42\",\"parentName\":null,\"parentId\":11630,\"children\":[],\"menuId\":11621,\"menuName\":\"æ‰§è¡Œä¸­å®ä¾‹\",\"orderNum\":1,\"path\":\"processInstance\",\"component\":\"workflow/instance/running\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"1\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"\",\"icon\":\"tree-table\",\"remark\":\"\"}','{\"code\":200,\"msg\":\"æ“ä½œæˆåŠŸ\",\"data\":null}',0,'','2024-08-06 10:32:42'),(1820649319155843073,'èœå•ç®¡ç†',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','ç ”å‘éƒ¨é—¨','/system/menu','127.0.0.1','å†…ç½‘IP','{\"createBy\":\"1\",\"createTime\":\"2024-08-06 09:35:23\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 10:33:18\",\"parentName\":null,\"parentId\":11630,\"children\":[],\"menuId\":11631,\"menuName\":\"å·²å®Œæˆå®ä¾‹\",\"orderNum\":2,\"path\":\"allTaskWaiting\",\"component\":\"workflow/instance/finish\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"1\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"\",\"icon\":\"waiting\",\"remark\":\"\"}','{\"code\":200,\"msg\":\"æ“ä½œæˆåŠŸ\",\"data\":null}',0,'','2024-08-06 10:33:18'),(1820649814972907521,'èœå•ç®¡ç†',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','ç ”å‘éƒ¨é—¨','/system/menu','127.0.0.1','å†…ç½‘IP','{\"createBy\":\"1\",\"createTime\":\"2024-08-06 09:37:27\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 10:35:16\",\"parentName\":null,\"parentId\":11616,\"children\":[],\"menuId\":11628,\"menuName\":\"æµç¨‹è§„åˆ™\",\"orderNum\":5,\"path\":\"businessRule\",\"component\":\"workflow/businessRule/index\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"workflow:formManage:list\",\"icon\":\"tree-table\",\"remark\":\"è¡¨å•ç®¡ç†èœå•\"}','{\"code\":200,\"msg\":\"æ“ä½œæˆåŠŸ\",\"data\":null}',0,'','2024-08-06 10:35:17'),(1820649947697463298,'èœå•ç®¡ç†',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','ç ”å‘éƒ¨é—¨','/system/menu','127.0.0.1','å†…ç½‘IP','{\"createBy\":\"1\",\"createTime\":\"2024-08-06 09:37:27\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 10:35:48\",\"parentName\":null,\"parentId\":11616,\"children\":[],\"menuId\":11628,\"menuName\":\"ä¸šåŠ¡è§„åˆ™\",\"orderNum\":5,\"path\":\"businessRule\",\"component\":\"workflow/businessRule/index\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"workflow:businessRule:list\",\"icon\":\"tree-table\",\"remark\":\"è¡¨å•ç®¡ç†èœå•\"}','{\"code\":200,\"msg\":\"æ“ä½œæˆåŠŸ\",\"data\":null}',0,'','2024-08-06 10:35:48'),(1820650085992054786,'èœå•ç®¡ç†',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','ç ”å‘éƒ¨é—¨','/system/menu','127.0.0.1','å†…ç½‘IP','{\"createBy\":\"1\",\"createTime\":\"2024-08-06 09:37:27\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 10:36:21\",\"parentName\":null,\"parentId\":11628,\"children\":[],\"menuId\":11644,\"menuName\":\"ä¸šåŠ¡è§„åˆ™æŸ¥è¯¢\",\"orderNum\":1,\"path\":\"#\",\"component\":\"\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"F\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"workflow:businessRule:query\",\"icon\":\"\",\"remark\":\"\"}','{\"code\":200,\"msg\":\"æ“ä½œæˆåŠŸ\",\"data\":null}',0,'','2024-08-06 10:36:21'),(1820650163645399041,'èœå•ç®¡ç†',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','ç ”å‘éƒ¨é—¨','/system/menu','127.0.0.1','å†…ç½‘IP','{\"createBy\":\"1\",\"createTime\":\"2024-08-06 09:37:28\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 10:36:39\",\"parentName\":null,\"parentId\":11628,\"children\":[],\"menuId\":11645,\"menuName\":\"ä¸šåŠ¡è§„åˆ™æ–°å¢\",\"orderNum\":2,\"path\":\"#\",\"component\":\"\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"F\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"workflow:businessRule:add\",\"icon\":\"\",\"remark\":\"\"}','{\"code\":200,\"msg\":\"æ“ä½œæˆåŠŸ\",\"data\":null}',0,'','2024-08-06 10:36:40'),(1820650231056252930,'èœå•ç®¡ç†',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','ç ”å‘éƒ¨é—¨','/system/menu','127.0.0.1','å†…ç½‘IP','{\"createBy\":\"1\",\"createTime\":\"2024-08-06 09:37:28\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 10:36:55\",\"parentName\":null,\"parentId\":11628,\"children\":[],\"menuId\":11646,\"menuName\":\"ä¸šåŠ¡è§„åˆ™ä¿®æ”¹\",\"orderNum\":3,\"path\":\"#\",\"component\":\"\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"F\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"workflow:businessRule:edit\",\"icon\":\"\",\"remark\":\"\"}','{\"code\":200,\"msg\":\"æ“ä½œæˆåŠŸ\",\"data\":null}',0,'','2024-08-06 10:36:56'),(1820650312220229634,'èœå•ç®¡ç†',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','ç ”å‘éƒ¨é—¨','/system/menu','127.0.0.1','å†…ç½‘IP','{\"createBy\":\"1\",\"createTime\":\"2024-08-06 09:37:28\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 10:37:15\",\"parentName\":null,\"parentId\":11628,\"children\":[],\"menuId\":11647,\"menuName\":\"ä¸šåŠ¡è§„åˆ™åˆ é™¤\",\"orderNum\":4,\"path\":\"#\",\"component\":\"\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"F\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"workflow:businessRule:remove\",\"icon\":\"\",\"remark\":\"\"}','{\"code\":200,\"msg\":\"æ“ä½œæˆåŠŸ\",\"data\":null}',0,'','2024-08-06 10:37:15'),(1820650430898061314,'èœå•ç®¡ç†',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','ç ”å‘éƒ¨é—¨','/system/menu','127.0.0.1','å†…ç½‘IP','{\"createBy\":\"1\",\"createTime\":\"2024-08-06 09:37:28\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 10:37:43\",\"parentName\":null,\"parentId\":11628,\"children\":[],\"menuId\":11648,\"menuName\":\"ä¸šåŠ¡è§„åˆ™å¯¼å‡º\",\"orderNum\":5,\"path\":\"#\",\"component\":\"\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"F\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"workflow:businessRule:export\",\"icon\":\"tree-table\",\"remark\":\"\"}','{\"code\":200,\"msg\":\"æ“ä½œæˆåŠŸ\",\"data\":null}',0,'','2024-08-06 10:37:43'),(1820650675266600961,'èœå•ç®¡ç†',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','ç ”å‘éƒ¨é—¨','/system/menu','127.0.0.1','å†…ç½‘IP','{\"createBy\":\"1\",\"createTime\":\"2024-08-06 09:37:27\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 10:38:41\",\"parentName\":null,\"parentId\":11616,\"children\":[],\"menuId\":11628,\"menuName\":\"ä¸šåŠ¡è§„åˆ™\",\"orderNum\":5,\"path\":\"businessRule\",\"component\":\"workflow/businessRule/index\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"workflow:businessRule:list\",\"icon\":\"skill\",\"remark\":\"è¡¨å•ç®¡ç†èœå•\"}','{\"code\":200,\"msg\":\"æ“ä½œæˆåŠŸ\",\"data\":null}',0,'','2024-08-06 10:38:42'),(1820650894712586241,'èœå•ç®¡ç†',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','ç ”å‘éƒ¨é—¨','/system/menu','127.0.0.1','å†…ç½‘IP','{\"createBy\":\"1\",\"createTime\":\"2024-08-06 09:35:23\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 10:39:33\",\"parentName\":null,\"parentId\":0,\"children\":[],\"menuId\":11618,\"menuName\":\"æˆ‘çš„ä»»åŠ¡\",\"orderNum\":7,\"path\":\"task\",\"component\":\"\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"M\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"\",\"icon\":\"tab\",\"remark\":\"\"}','{\"code\":200,\"msg\":\"æ“ä½œæˆåŠŸ\",\"data\":null}',0,'','2024-08-06 10:39:34'),(1820651098882916354,'èœå•ç®¡ç†',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','ç ”å‘éƒ¨é—¨','/system/menu','127.0.0.1','å†…ç½‘IP','{\"createBy\":\"1\",\"createTime\":\"2024-08-06 09:35:22\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 10:40:22\",\"parentName\":null,\"parentId\":0,\"children\":[],\"menuId\":11616,\"menuName\":\"å·¥ä½œæµ\",\"orderNum\":6,\"path\":\"workflow\",\"component\":\"\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"M\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"\",\"icon\":\"documentation\",\"remark\":\"\"}','{\"code\":200,\"msg\":\"æ“ä½œæˆåŠŸ\",\"data\":null}',0,'','2024-08-06 10:40:23'),(1820651193980370946,'èœå•ç®¡ç†',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','ç ”å‘éƒ¨é—¨','/system/menu','127.0.0.1','å†…ç½‘IP','{\"createBy\":\"1\",\"createTime\":\"2024-08-06 09:35:23\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 10:40:45\",\"parentName\":null,\"parentId\":11616,\"children\":[],\"menuId\":11617,\"menuName\":\"æ¨¡å‹ç®¡ç†\",\"orderNum\":2,\"path\":\"model\",\"component\":\"workflow/model/index\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"1\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"\",\"icon\":\"education\",\"remark\":\"\"}','{\"code\":200,\"msg\":\"æ“ä½œæˆåŠŸ\",\"data\":null}',0,'','2024-08-06 10:40:45'),(1820651229925556225,'èœå•ç®¡ç†',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','ç ”å‘éƒ¨é—¨','/system/menu','127.0.0.1','å†…ç½‘IP','{\"createBy\":\"1\",\"createTime\":\"2024-08-06 09:35:23\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 10:40:53\",\"parentName\":null,\"parentId\":11616,\"children\":[],\"menuId\":11620,\"menuName\":\"æµç¨‹å®šä¹‰\",\"orderNum\":3,\"path\":\"processDefinition\",\"component\":\"workflow/definition/index\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"1\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"\",\"icon\":\"dict\",\"remark\":\"\"}','{\"code\":200,\"msg\":\"æ“ä½œæˆåŠŸ\",\"data\":null}',0,'','2024-08-06 10:40:54'),(1820651308178685953,'èœå•ç®¡ç†',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','ç ”å‘éƒ¨é—¨','/system/menu','127.0.0.1','å†…ç½‘IP','{\"createBy\":\"1\",\"createTime\":\"2024-08-06 09:35:23\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 10:41:12\",\"parentName\":null,\"parentId\":11616,\"children\":[],\"menuId\":11622,\"menuName\":\"æµç¨‹åˆ†ç±»\",\"orderNum\":1,\"path\":\"category\",\"component\":\"workflow/category/index\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"workflow:category:list\",\"icon\":\"nested\",\"remark\":\"\"}','{\"code\":200,\"msg\":\"æ“ä½œæˆåŠŸ\",\"data\":null}',0,'','2024-08-06 10:41:13'),(1820651384124948481,'èœå•ç®¡ç†',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','ç ”å‘éƒ¨é—¨','/system/menu','127.0.0.1','å†…ç½‘IP','{\"createBy\":\"1\",\"createTime\":\"2024-08-06 09:35:23\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 10:41:30\",\"parentName\":null,\"parentId\":11618,\"children\":[],\"menuId\":11629,\"menuName\":\"å…¨éƒ¨å¾…åŠ\",\"orderNum\":1,\"path\":\"myDocument\",\"component\":\"workflow/task/waiting\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"1\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"\",\"icon\":\"cascader\",\"remark\":\"\"}','{\"code\":200,\"msg\":\"æ“ä½œæˆåŠŸ\",\"data\":null}',0,'','2024-08-06 10:41:31'),(1820651450311065601,'èœå•ç®¡ç†',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','ç ”å‘éƒ¨é—¨','/system/menu','127.0.0.1','å†…ç½‘IP','{\"createBy\":\"1\",\"createTime\":\"2024-08-06 09:35:23\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 10:41:46\",\"parentName\":null,\"parentId\":11618,\"children\":[],\"menuId\":11633,\"menuName\":\"å…¨éƒ¨å·²åŠ\",\"orderNum\":2,\"path\":\"taskCopyList\",\"component\":\"workflow/task/finish\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"1\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"\",\"icon\":\"druid\",\"remark\":\"\"}','{\"code\":200,\"msg\":\"æ“ä½œæˆåŠŸ\",\"data\":null}',0,'','2024-08-06 10:41:46'),(1820651569546739713,'èœå•ç®¡ç†',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','ç ”å‘éƒ¨é—¨','/system/menu','127.0.0.1','å†…ç½‘IP','{\"createBy\":\"1\",\"createTime\":\"2024-08-06 09:35:23\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 10:42:14\",\"parentName\":null,\"parentId\":11618,\"children\":[],\"menuId\":11619,\"menuName\":\"æˆ‘çš„å¾…åŠ\",\"orderNum\":3,\"path\":\"taskWaiting\",\"component\":\"workflow/task/personalWaiting\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"1\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"\",\"icon\":\"job\",\"remark\":\"\"}','{\"code\":200,\"msg\":\"æ“ä½œæˆåŠŸ\",\"data\":null}',0,'','2024-08-06 10:42:15'),(1820651621472223234,'èœå•ç®¡ç†',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','ç ”å‘éƒ¨é—¨','/system/menu','127.0.0.1','å†…ç½‘IP','{\"createBy\":\"1\",\"createTime\":\"2024-08-06 09:35:23\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 10:42:27\",\"parentName\":null,\"parentId\":11618,\"children\":[],\"menuId\":11632,\"menuName\":\"æˆ‘çš„å·²åŠ\",\"orderNum\":4,\"path\":\"taskFinish\",\"component\":\"workflow/task/personalFinish\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"1\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"\",\"icon\":\"log\",\"remark\":\"\"}','{\"code\":200,\"msg\":\"æ“ä½œæˆåŠŸ\",\"data\":null}',0,'','2024-08-06 10:42:27'),(1820651814800277505,'æµç¨‹åˆ†ç±»',1,'com.ruoyi.workflow.controller.ActCategoryController.add()','POST',1,'admin','ç ”å‘éƒ¨é—¨','/workflow/category','127.0.0.1','å†…ç½‘IP','{\"createBy\":\"admin\",\"createTime\":\"2024-08-06 10:43:13\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 10:43:13\",\"id\":\"1820651814552813569\",\"categoryName\":\"å‘Šè­¦æµç¨‹\",\"categoryCode\":null,\"parentId\":0,\"orderNum\":1}','{\"code\":200,\"msg\":\"æ“ä½œæˆåŠŸ\",\"data\":null}',0,'','2024-08-06 10:43:13'),(1820653006196523009,'èœå•ç®¡ç†',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','ç ”å‘éƒ¨é—¨','/system/menu','127.0.0.1','å†…ç½‘IP','{\"createBy\":\"1\",\"createTime\":\"2024-08-06 09:35:23\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 10:47:57\",\"parentName\":null,\"parentId\":11630,\"children\":[],\"menuId\":11621,\"menuName\":\"æ‰§è¡Œä¸­å®ä¾‹\",\"orderNum\":1,\"path\":\"processInstance\",\"component\":\"workflow/instance/running\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"1\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"\",\"icon\":\"job\",\"remark\":\"\"}','{\"code\":200,\"msg\":\"æ“ä½œæˆåŠŸ\",\"data\":null}',0,'','2024-08-06 10:47:57'),(1820653051054604289,'èœå•ç®¡ç†',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','ç ”å‘éƒ¨é—¨','/system/menu','127.0.0.1','å†…ç½‘IP','{\"createBy\":\"1\",\"createTime\":\"2024-08-06 09:35:23\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 10:48:08\",\"parentName\":null,\"parentId\":11630,\"children\":[],\"menuId\":11631,\"menuName\":\"å·²å®Œæˆå®ä¾‹\",\"orderNum\":2,\"path\":\"allTaskWaiting\",\"component\":\"workflow/instance/finish\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"1\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"\",\"icon\":\"log\",\"remark\":\"\"}','{\"code\":200,\"msg\":\"æ“ä½œæˆåŠŸ\",\"data\":null}',0,'','2024-08-06 10:48:08'),(1820659123077201921,'æµç¨‹åˆ†ç±»',1,'com.ruoyi.workflow.controller.ActCategoryController.add()','POST',1,'admin','ç ”å‘éƒ¨é—¨','/workflow/category','127.0.0.1','å†…ç½‘IP','{\"createBy\":\"admin\",\"createTime\":\"2024-08-06 11:12:15\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 11:12:15\",\"id\":\"1820659122791989249\",\"categoryName\":\"1\",\"categoryCode\":null,\"parentId\":\"1820651814552813569\",\"orderNum\":1}','{\"code\":200,\"msg\":\"æ“ä½œæˆåŠŸ\",\"data\":null}',0,'','2024-08-06 11:12:16'),(1820661580431835137,'æµç¨‹åˆ†ç±»',3,'com.ruoyi.workflow.controller.ActCategoryController.delete()','DELETE',1,'admin','ç ”å‘éƒ¨é—¨','/workflow/category/1820659122791989249','127.0.0.1','å†…ç½‘IP','{}','{\"code\":200,\"msg\":\"æ“ä½œæˆåŠŸ\",\"data\":null}',0,'','2024-08-06 11:22:02'),(1820662042790936578,'æµç¨‹å®šä¹‰ç®¡ç†',1,'com.ruoyi.workflow.controller.ActProcessDefinitionController.deployByFile()','POST',1,'admin','ç ”å‘éƒ¨é—¨','/workflow/definition/deployByFile','127.0.0.1','å†…ç½‘IP','\"alarm\"','',1,'æµç¨‹åˆ†ç±»ä¸èƒ½ä¸ºç©º(æ–‡ä»¶å = æµç¨‹åç§°-æµç¨‹key)','2024-08-06 11:23:52'),(1820662237876404225,'æµç¨‹å®šä¹‰ç®¡ç†',1,'com.ruoyi.workflow.controller.ActProcessDefinitionController.deployByFile()','POST',1,'admin','ç ”å‘éƒ¨é—¨','/workflow/definition/deployByFile','127.0.0.1','å†…ç½‘IP','\"alarm\"','{\"code\":200,\"msg\":\"æ“ä½œæˆåŠŸ\",\"data\":null}',0,'','2024-08-06 11:24:38'),(1820663302084575233,'æ¨¡å‹ç®¡ç†',2,'com.ruoyi.workflow.controller.ActModelController.convertToModel()','PUT',1,'admin','ç ”å‘éƒ¨é—¨','/workflow/model/convertToModel/leave1:1:1820662237058514946','127.0.0.1','å†…ç½‘IP','\"leave1:1:1820662237058514946\"','{\"code\":200,\"msg\":\"æ“ä½œæˆåŠŸ\",\"data\":null}',0,'','2024-08-06 11:28:52'),(1820699773789212673,'èœå•ç®¡ç†',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','ç ”å‘éƒ¨é—¨','/system/menu','127.0.0.1','å†…ç½‘IP','{\"createBy\":\"1\",\"createTime\":\"2024-08-06 09:35:26\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 13:53:47\",\"parentName\":null,\"parentId\":5,\"children\":[],\"menuId\":11638,\"menuName\":\"è¯·å‡ç”³è¯·\",\"orderNum\":1,\"path\":\"leave\",\"component\":\"demo/leave/index\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"workflow:leave:list\",\"icon\":\"user\",\"remark\":\"è¯·å‡ç”³è¯·èœå•\"}','{\"code\":200,\"msg\":\"æ“ä½œæˆåŠŸ\",\"data\":null}',0,'','2024-08-06 13:53:48'),(1820699930551324673,'èœå•ç®¡ç†',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','ç ”å‘éƒ¨é—¨','/system/menu','127.0.0.1','å†…ç½‘IP','{\"createBy\":\"1\",\"createTime\":\"2024-08-06 09:35:26\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 13:54:24\",\"parentName\":null,\"parentId\":5,\"children\":[],\"menuId\":11638,\"menuName\":\"è¯·å‡ç”³è¯·\",\"orderNum\":1,\"path\":\"leave\",\"component\":\"demo/leave/index\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"demo:leave:list\",\"icon\":\"user\",\"remark\":\"è¯·å‡ç”³è¯·èœå•\"}','{\"code\":200,\"msg\":\"æ“ä½œæˆåŠŸ\",\"data\":null}',0,'','2024-08-06 13:54:25'),(1820700000931745794,'èœå•ç®¡ç†',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','ç ”å‘éƒ¨é—¨','/system/menu','127.0.0.1','å†…ç½‘IP','{\"createBy\":\"1\",\"createTime\":\"2024-08-06 09:35:26\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 13:54:41\",\"parentName\":null,\"parentId\":11638,\"children\":[],\"menuId\":11643,\"menuName\":\"è¯·å‡ç”³è¯·å¯¼å‡º\",\"orderNum\":5,\"path\":\"#\",\"component\":\"\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"F\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"demo:leave:export\",\"icon\":\"#\",\"remark\":\"\"}','{\"code\":200,\"msg\":\"æ“ä½œæˆåŠŸ\",\"data\":null}',0,'','2024-08-06 13:54:42'),(1820700049078161410,'èœå•ç®¡ç†',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','ç ”å‘éƒ¨é—¨','/system/menu','127.0.0.1','å†…ç½‘IP','{\"createBy\":\"1\",\"createTime\":\"2024-08-06 09:35:26\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 13:54:53\",\"parentName\":null,\"parentId\":11638,\"children\":[],\"menuId\":11639,\"menuName\":\"è¯·å‡ç”³è¯·æŸ¥è¯¢\",\"orderNum\":1,\"path\":\"#\",\"component\":\"\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"F\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"demo:leave:query\",\"icon\":\"#\",\"remark\":\"\"}','{\"code\":200,\"msg\":\"æ“ä½œæˆåŠŸ\",\"data\":null}',0,'','2024-08-06 13:54:53'),(1820700144016232450,'èœå•ç®¡ç†',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','ç ”å‘éƒ¨é—¨','/system/menu','127.0.0.1','å†…ç½‘IP','{\"createBy\":\"1\",\"createTime\":\"2024-08-06 09:35:26\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 13:55:15\",\"parentName\":null,\"parentId\":11638,\"children\":[],\"menuId\":11640,\"menuName\":\"è¯·å‡ç”³è¯·æ–°å¢\",\"orderNum\":2,\"path\":\"#\",\"component\":\"\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"F\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"demo:leave:add\",\"icon\":\"#\",\"remark\":\"\"}','{\"code\":200,\"msg\":\"æ“ä½œæˆåŠŸ\",\"data\":null}',0,'','2024-08-06 13:55:16'),(1820700184470294529,'èœå•ç®¡ç†',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','ç ”å‘éƒ¨é—¨','/system/menu','127.0.0.1','å†…ç½‘IP','{\"createBy\":\"1\",\"createTime\":\"2024-08-06 09:35:26\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 13:55:25\",\"parentName\":null,\"parentId\":11638,\"children\":[],\"menuId\":11641,\"menuName\":\"è¯·å‡ç”³è¯·ä¿®æ”¹\",\"orderNum\":3,\"path\":\"#\",\"component\":\"\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"F\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"demo:leave:edit\",\"icon\":\"#\",\"remark\":\"\"}','{\"code\":200,\"msg\":\"æ“ä½œæˆåŠŸ\",\"data\":null}',0,'','2024-08-06 13:55:26'),(1820700224890802177,'èœå•ç®¡ç†',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','ç ”å‘éƒ¨é—¨','/system/menu','127.0.0.1','å†…ç½‘IP','{\"createBy\":\"1\",\"createTime\":\"2024-08-06 09:35:26\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 13:55:35\",\"parentName\":null,\"parentId\":11638,\"children\":[],\"menuId\":11642,\"menuName\":\"è¯·å‡ç”³è¯·åˆ é™¤\",\"orderNum\":4,\"path\":\"#\",\"component\":\"\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"F\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"demo:leave:remove\",\"icon\":\"#\",\"remark\":\"\"}','{\"code\":200,\"msg\":\"æ“ä½œæˆåŠŸ\",\"data\":null}',0,'','2024-08-06 13:55:35'),(1820701866105180162,'å­—å…¸ç±»å‹',1,'com.ruoyi.web.controller.system.SysDictTypeController.add()','POST',1,'admin','ç ”å‘éƒ¨é—¨','/system/dict/type','127.0.0.1','å†…ç½‘IP','{\"createBy\":\"admin\",\"createTime\":\"2024-08-06 14:02:06\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 14:02:06\",\"dictId\":\"1820701865723498498\",\"dictName\":\"è¯·å‡ç±»å‹\",\"dictType\":\"bs_leave_type\",\"status\":\"0\",\"remark\":null}','{\"code\":200,\"msg\":\"æ“ä½œæˆåŠŸ\",\"data\":null}',0,'','2024-08-06 14:02:07'),(1820702182968070146,'å­—å…¸æ•°æ®',1,'com.ruoyi.web.controller.system.SysDictDataController.add()','POST',1,'admin','ç ”å‘éƒ¨é—¨','/system/dict/data','127.0.0.1','å†…ç½‘IP','{\"createBy\":\"admin\",\"createTime\":\"2024-08-06 14:03:22\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 14:03:22\",\"dictCode\":\"1820702182615748609\",\"dictSort\":0,\"dictLabel\":\"ç—…å‡\",\"dictValue\":\"1\",\"dictType\":\"bs_leave_type\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}','{\"code\":200,\"msg\":\"æ“ä½œæˆåŠŸ\",\"data\":null}',0,'','2024-08-06 14:03:22'),(1820702261342834689,'å­—å…¸æ•°æ®',1,'com.ruoyi.web.controller.system.SysDictDataController.add()','POST',1,'admin','ç ”å‘éƒ¨é—¨','/system/dict/data','127.0.0.1','å†…ç½‘IP','{\"createBy\":\"admin\",\"createTime\":\"2024-08-06 14:03:40\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 14:03:40\",\"dictCode\":\"1820702261103759361\",\"dictSort\":1,\"dictLabel\":\"äº‹å‡\",\"dictValue\":\"2\",\"dictType\":\"bs_leave_type\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}','{\"code\":200,\"msg\":\"æ“ä½œæˆåŠŸ\",\"data\":null}',0,'','2024-08-06 14:03:41'),(1820702313859715073,'å­—å…¸æ•°æ®',1,'com.ruoyi.web.controller.system.SysDictDataController.add()','POST',1,'admin','ç ”å‘éƒ¨é—¨','/system/dict/data','127.0.0.1','å†…ç½‘IP','{\"createBy\":\"admin\",\"createTime\":\"2024-08-06 14:03:53\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 14:03:53\",\"dictCode\":\"1820702313578696706\",\"dictSort\":2,\"dictLabel\":\"å¹´å‡\",\"dictValue\":\"3\",\"dictType\":\"bs_leave_type\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}','{\"code\":200,\"msg\":\"æ“ä½œæˆåŠŸ\",\"data\":null}',0,'','2024-08-06 14:03:53'),(1820702697105854465,'è¯·å‡ä¸šåŠ¡',1,'com.ruoyi.demo.controller.BsLeaveController.add()','POST',1,'admin','ç ”å‘éƒ¨é—¨','/demo/leave','127.0.0.1','å†…ç½‘IP','{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":null,\"username\":\"admin\",\"duration\":\"2.5\",\"principal\":\"admin\",\"contactPhone\":\"111111111111\",\"leaveType\":3,\"title\":\"è¯·å¹´å‡\",\"leaveReason\":\"ä¼‘æ¯\",\"startDate\":\"2024-08-07 00:00:00\",\"endDate\":\"2024-08-09 00:00:00\",\"actNodeAssignee\":null}','{\"code\":200,\"msg\":\"æ“ä½œæˆåŠŸ\",\"data\":{\"createBy\":\"admin\",\"createTime\":\"2024-08-06 14:05:24\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 14:05:24\",\"id\":\"1820702696808058882\",\"username\":\"admin\",\"duration\":\"2.5\",\"principal\":\"admin\",\"contactPhone\":\"111111111111\",\"leaveType\":3,\"title\":\"è¯·å¹´å‡\",\"leaveReason\":\"ä¼‘æ¯\",\"startDate\":\"2024-08-07 00:00:00\",\"endDate\":\"2024-08-09 00:00:00\"}}',0,'','2024-08-06 14:05:25'),(1820702698074738690,'æµç¨‹å®ä¾‹ç®¡ç†',1,'com.ruoyi.workflow.controller.ActProcessInstanceController.startWorkFlow()','POST',1,'admin','ç ”å‘éƒ¨é—¨','/workflow/processInstance/startWorkFlow','127.0.0.1','å†…ç½‘IP','{\"businessKey\":\"1820702696808058882\",\"processKey\":\"leave\",\"assignees\":null,\"tableName\":\"bs_leave\",\"variables\":{\"entity\":{\"createBy\":\"admin\",\"createTime\":\"2024-08-06 14:05:24\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 14:05:24\",\"id\":\"1820702696808058882\",\"username\":\"admin\",\"duration\":\"2.5\",\"principal\":\"admin\",\"contactPhone\":\"111111111111\",\"leaveType\":3,\"title\":\"è¯·å¹´å‡\",\"leaveReason\":\"ä¼‘æ¯\",\"startDate\":\"2024-08-07 00:00:00\",\"endDate\":\"2024-08-09 00:00:00\"},\"userId\":\"1\",\"_FLOWABLE_SKIP_EXPRESSION_ENABLED\":true}}','',1,'No process definition found for key \'leave\'','2024-08-06 14:05:25'),(1820703258203066369,'æµç¨‹å®šä¹‰ç®¡ç†',1,'com.ruoyi.workflow.controller.ActProcessDefinitionController.deployByFile()','POST',1,'admin','ç ”å‘éƒ¨é—¨','/workflow/definition/deployByFile','127.0.0.1','å†…ç½‘IP','\"alarm\"','{\"code\":200,\"msg\":\"æ“ä½œæˆåŠŸ\",\"data\":null}',0,'','2024-08-06 14:07:38'),(1820703300263546882,'æµç¨‹å®šä¹‰ç®¡ç†',1,'com.ruoyi.workflow.controller.ActProcessDefinitionController.deployByFile()','POST',1,'admin','ç ”å‘éƒ¨é—¨','/workflow/definition/deployByFile','127.0.0.1','å†…ç½‘IP','\"alarm\"','{\"code\":200,\"msg\":\"æ“ä½œæˆåŠŸ\",\"data\":null}',0,'','2024-08-06 14:07:48'),(1820703329812418561,'æµç¨‹å®šä¹‰ç®¡ç†',1,'com.ruoyi.workflow.controller.ActProcessDefinitionController.deployByFile()','POST',1,'admin','ç ”å‘éƒ¨é—¨','/workflow/definition/deployByFile','127.0.0.1','å†…ç½‘IP','\"alarm\"','{\"code\":200,\"msg\":\"æ“ä½œæˆåŠŸ\",\"data\":null}',0,'','2024-08-06 14:07:56'),(1820703359277404162,'æµç¨‹å®šä¹‰ç®¡ç†',1,'com.ruoyi.workflow.controller.ActProcessDefinitionController.deployByFile()','POST',1,'admin','ç ”å‘éƒ¨é—¨','/workflow/definition/deployByFile','127.0.0.1','å†…ç½‘IP','\"alarm\"','{\"code\":200,\"msg\":\"æ“ä½œæˆåŠŸ\",\"data\":null}',0,'','2024-08-06 14:08:03'),(1820703378042720257,'æµç¨‹å®šä¹‰ç®¡ç†',1,'com.ruoyi.workflow.controller.ActProcessDefinitionController.deployByFile()','POST',1,'admin','ç ”å‘éƒ¨é—¨','/workflow/definition/deployByFile','127.0.0.1','å†…ç½‘IP','\"alarm\"','{\"code\":200,\"msg\":\"æ“ä½œæˆåŠŸ\",\"data\":null}',0,'','2024-08-06 14:08:07'),(1820703719840747521,'è¯·å‡ä¸šåŠ¡',2,'com.ruoyi.demo.controller.BsLeaveController.edit()','PUT',1,'admin','ç ”å‘éƒ¨é—¨','/demo/leave','127.0.0.1','å†…ç½‘IP','{\"createBy\":\"admin\",\"createTime\":\"2024-08-06 14:05:24\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 14:05:24\",\"id\":\"1820702696808058882\",\"username\":\"admin\",\"duration\":\"2.5\",\"principal\":\"admin\",\"contactPhone\":\"111111111111\",\"leaveType\":3,\"title\":\"è¯·å¹´å‡\",\"leaveReason\":\"ä¼‘æ¯\",\"startDate\":\"2024-08-07 00:00:00\",\"endDate\":\"2024-08-09 00:00:00\",\"actNodeAssignee\":null}','{\"code\":200,\"msg\":\"æ“ä½œæˆåŠŸ\",\"data\":{\"createBy\":\"admin\",\"createTime\":\"2024-08-06 14:05:24\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 14:09:28\",\"id\":\"1820702696808058882\",\"username\":\"admin\",\"duration\":\"2.5\",\"principal\":\"admin\",\"contactPhone\":\"111111111111\",\"leaveType\":3,\"title\":\"è¯·å¹´å‡\",\"leaveReason\":\"ä¼‘æ¯\",\"startDate\":\"2024-08-07 00:00:00\",\"endDate\":\"2024-08-09 00:00:00\"}}',0,'','2024-08-06 14:09:29'),(1820703720490864642,'æµç¨‹å®ä¾‹ç®¡ç†',1,'com.ruoyi.workflow.controller.ActProcessInstanceController.startWorkFlow()','POST',1,'admin','ç ”å‘éƒ¨é—¨','/workflow/processInstance/startWorkFlow','127.0.0.1','å†…ç½‘IP','{\"businessKey\":\"1820702696808058882\",\"processKey\":\"leave\",\"assignees\":null,\"tableName\":\"bs_leave\",\"variables\":{\"entity\":{\"createBy\":\"admin\",\"createTime\":\"2024-08-06 14:05:24\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 14:09:28\",\"id\":\"1820702696808058882\",\"username\":\"admin\",\"duration\":\"2.5\",\"principal\":\"admin\",\"contactPhone\":\"111111111111\",\"leaveType\":3,\"title\":\"è¯·å¹´å‡\",\"leaveReason\":\"ä¼‘æ¯\",\"startDate\":\"2024-08-07 00:00:00\",\"endDate\":\"2024-08-09 00:00:00\"},\"userId\":\"1\",\"_FLOWABLE_SKIP_EXPRESSION_ENABLED\":true}}','',1,'No process definition found for key \'leave\'','2024-08-06 14:09:29'),(1820703822840270849,'è¯·å‡ä¸šåŠ¡',2,'com.ruoyi.demo.controller.BsLeaveController.edit()','PUT',1,'admin','ç ”å‘éƒ¨é—¨','/demo/leave','127.0.0.1','å†…ç½‘IP','{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"1820702696808058882\",\"username\":\"admin\",\"duration\":\"2.50\",\"principal\":\"admin\",\"contactPhone\":\"111111111111\",\"leaveType\":3,\"title\":\"è¯·å¹´å‡\",\"leaveReason\":\"ä¼‘æ¯\",\"startDate\":\"2024-08-07 00:00:00\",\"endDate\":\"2024-08-09 00:00:00\",\"actNodeAssignee\":null}','{\"code\":200,\"msg\":\"æ“ä½œæˆåŠŸ\",\"data\":{\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 14:09:52\",\"id\":\"1820702696808058882\",\"username\":\"admin\",\"duration\":\"2.50\",\"principal\":\"admin\",\"contactPhone\":\"111111111111\",\"leaveType\":3,\"title\":\"è¯·å¹´å‡\",\"leaveReason\":\"ä¼‘æ¯\",\"startDate\":\"2024-08-07 00:00:00\",\"endDate\":\"2024-08-09 00:00:00\"}}',0,'','2024-08-06 14:09:53'),(1820703825801449473,'æµç¨‹å®ä¾‹ç®¡ç†',1,'com.ruoyi.workflow.controller.ActProcessInstanceController.startWorkFlow()','POST',1,'admin','ç ”å‘éƒ¨é—¨','/workflow/processInstance/startWorkFlow','127.0.0.1','å†…ç½‘IP','{\"businessKey\":\"1820702696808058882\",\"processKey\":\"leave1\",\"assignees\":null,\"tableName\":\"bs_leave\",\"variables\":{\"entity\":{\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 14:09:52\",\"id\":\"1820702696808058882\",\"username\":\"admin\",\"duration\":\"2.50\",\"principal\":\"admin\",\"contactPhone\":\"111111111111\",\"leaveType\":3,\"title\":\"è¯·å¹´å‡\",\"leaveReason\":\"ä¼‘æ¯\",\"startDate\":\"2024-08-07 00:00:00\",\"endDate\":\"2024-08-09 00:00:00\"},\"userId\":\"1\",\"_FLOWABLE_SKIP_EXPRESSION_ENABLED\":true}}','{\"code\":200,\"msg\":\"æäº¤æˆåŠŸ\",\"data\":{\"processInstanceId\":\"1820703824446689282\",\"taskId\":\"1820703824526381058\"}}',0,'','2024-08-06 14:09:54'),(1820707619507474434,'è¯·å‡ä¸šåŠ¡',2,'com.ruoyi.demo.controller.BsLeaveController.edit()','PUT',1,'admin','ç ”å‘éƒ¨é—¨','/demo/leave','127.0.0.1','å†…ç½‘IP','{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"1820702696808058882\",\"username\":\"admin\",\"duration\":\"2.50\",\"principal\":\"admin\",\"contactPhone\":\"111111111111\",\"leaveType\":3,\"title\":\"è¯·å¹´å‡\",\"leaveReason\":\"ä¼‘æ¯\",\"startDate\":\"2024-08-07 00:00:00\",\"endDate\":\"2024-08-09 00:00:00\",\"actNodeAssignee\":null}','{\"code\":200,\"msg\":\"æ“ä½œæˆåŠŸ\",\"data\":{\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 14:24:58\",\"id\":\"1820702696808058882\",\"username\":\"admin\",\"duration\":\"2.50\",\"principal\":\"admin\",\"contactPhone\":\"111111111111\",\"leaveType\":3,\"title\":\"è¯·å¹´å‡\",\"leaveReason\":\"ä¼‘æ¯\",\"startDate\":\"2024-08-07 00:00:00\",\"endDate\":\"2024-08-09 00:00:00\"}}',0,'','2024-08-06 14:24:58'),(1820707620371501057,'æµç¨‹å®ä¾‹ç®¡ç†',1,'com.ruoyi.workflow.controller.ActProcessInstanceController.startWorkFlow()','POST',1,'admin','ç ”å‘éƒ¨é—¨','/workflow/processInstance/startWorkFlow','127.0.0.1','å†…ç½‘IP','{\"businessKey\":\"1820702696808058882\",\"processKey\":\"leave1\",\"assignees\":null,\"tableName\":\"bs_leave\",\"variables\":{\"entity\":{\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 14:24:58\",\"id\":\"1820702696808058882\",\"username\":\"admin\",\"duration\":\"2.50\",\"principal\":\"admin\",\"contactPhone\":\"111111111111\",\"leaveType\":3,\"title\":\"è¯·å¹´å‡\",\"leaveReason\":\"ä¼‘æ¯\",\"startDate\":\"2024-08-07 00:00:00\",\"endDate\":\"2024-08-09 00:00:00\"},\"userId\":\"1\"}}','{\"code\":200,\"msg\":\"æäº¤æˆåŠŸ\",\"data\":{\"processInstanceId\":\"1820703824446689282\",\"taskId\":\"1820703824526381058\"}}',0,'','2024-08-06 14:24:58'),(1820710032977104898,'èœå•ç®¡ç†',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','ç ”å‘éƒ¨é—¨','/system/menu','127.0.0.1','å†…ç½‘IP','{\"createBy\":\"admin\",\"createTime\":\"2024-08-06 14:34:33\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 14:34:33\",\"parentName\":null,\"parentId\":3,\"children\":[],\"menuId\":\"1820710032800944129\",\"menuName\":\"æŠ¥è¡¨æ³¨å†Œ\",\"orderNum\":3,\"path\":\"reportRegister\",\"component\":\"report/reportRegister/index\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"report:reportRegister:list\",\"icon\":\"documentation\",\"remark\":null}','{\"code\":200,\"msg\":\"æ“ä½œæˆåŠŸ\",\"data\":null}',0,'','2024-08-06 14:34:34'),(1820718910502539266,'æµç¨‹èŠ‚ç‚¹äººå‘˜è®¾ç½®ç®¡ç†',1,'com.ruoyi.workflow.controller.ActNodeAssigneeController.add()','POST',1,'admin','ç ”å‘éƒ¨é—¨','/workflow/actNodeAssignee','127.0.0.1','å†…ç½‘IP','{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":null,\"processDefinitionId\":\"leave1:1:1820662237058514946\",\"chooseWay\":\"role\",\"nodeId\":\"Activity_0lym9dc\",\"nodeName\":\"ç»„é•¿\",\"assignee\":\"è¶…çº§ç®¡ç†å‘˜\",\"assigneeId\":\"1\",\"businessRuleId\":null,\"isShow\":false,\"multiple\":false,\"multipleColumn\":\"\",\"isBack\":false,\"isDelegate\":false,\"isTransmit\":false,\"isCopy\":false,\"addMultiInstance\":false,\"deleteMultiInstance\":false,\"taskListener\":\"\",\"autoComplete\":null,\"fieldListJson\":\"\",\"showBack\":true,\"taskListenerList\":[],\"fieldList\":[],\"index\":1}','{\"code\":200,\"msg\":\"æ“ä½œæˆåŠŸ\",\"data\":{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":null,\"processDefinitionId\":\"leave1:1:1820662237058514946\",\"chooseWay\":\"role\",\"nodeId\":\"Activity_0lym9dc\",\"nodeName\":\"ç»„é•¿\",\"assignee\":\"è¶…çº§ç®¡ç†å‘˜\",\"assigneeId\":\"1\",\"businessRuleId\":null,\"isShow\":false,\"multiple\":false,\"multipleColumn\":\"\",\"isBack\":false,\"isDelegate\":false,\"isTransmit\":false,\"isCopy\":false,\"addMultiInstance\":false,\"deleteMultiInstance\":false,\"taskListener\":\"\",\"autoComplete\":null,\"fieldListJson\":\"\",\"showBack\":true,\"taskListenerList\":[],\"fieldList\":[],\"index\":1}}',0,'','2024-08-06 15:09:50'),(1820719082162819074,'æµç¨‹èŠ‚ç‚¹äººå‘˜è®¾ç½®ç®¡ç†',1,'com.ruoyi.workflow.controller.ActNodeAssigneeController.add()','POST',1,'admin','ç ”å‘éƒ¨é—¨','/workflow/actNodeAssignee','127.0.0.1','å†…ç½‘IP','{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":null,\"processDefinitionId\":\"leave1:1:1820662237058514946\",\"chooseWay\":\"role\",\"nodeId\":\"Activity_1j25s1c\",\"nodeName\":\"éƒ¨é—¨é¢†å¯¼\",\"assignee\":\"è¶…çº§ç®¡ç†å‘˜\",\"assigneeId\":\"1\",\"businessRuleId\":null,\"isShow\":false,\"multiple\":false,\"multipleColumn\":\"\",\"isBack\":false,\"isDelegate\":false,\"isTransmit\":false,\"isCopy\":false,\"addMultiInstance\":false,\"deleteMultiInstance\":false,\"taskListener\":\"\",\"autoComplete\":null,\"fieldListJson\":\"\",\"showBack\":true,\"taskListenerList\":[],\"fieldList\":[],\"index\":1}','{\"code\":200,\"msg\":\"æ“ä½œæˆåŠŸ\",\"data\":{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":null,\"processDefinitionId\":\"leave1:1:1820662237058514946\",\"chooseWay\":\"role\",\"nodeId\":\"Activity_1j25s1c\",\"nodeName\":\"éƒ¨é—¨é¢†å¯¼\",\"assignee\":\"è¶…çº§ç®¡ç†å‘˜\",\"assigneeId\":\"1\",\"businessRuleId\":null,\"isShow\":false,\"multiple\":false,\"multipleColumn\":\"\",\"isBack\":false,\"isDelegate\":false,\"isTransmit\":false,\"isCopy\":false,\"addMultiInstance\":false,\"deleteMultiInstance\":false,\"taskListener\":\"\",\"autoComplete\":null,\"fieldListJson\":\"\",\"showBack\":true,\"taskListenerList\":[],\"fieldList\":[],\"index\":1}}',0,'','2024-08-06 15:10:31'),(1820720401808297986,'æµç¨‹å®šä¹‰è®¾ç½®',1,'com.ruoyi.workflow.controller.ActProcessDefSettingController.add()','POST',1,'admin','ç ”å‘éƒ¨é—¨','/workflow/processDefSetting','127.0.0.1','å†…ç½‘IP','{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":null,\"processDefinitionId\":\"leave1:1:1820662237058514946\",\"processDefinitionKey\":\"leave1\",\"processDefinitionName\":\"è¯·å‡æµç¨‹ï¼ˆæ™®é€šæµç¨‹ï¼‰\",\"tableName\":\"bs_leave\",\"componentName\":\"leave\",\"remark\":null,\"settingIds\":null,\"defaultProcess\":false,\"taskListener\":null,\"taskListenerList\":[]}','{\"code\":200,\"msg\":\"æ“ä½œæˆåŠŸ\",\"data\":{\"id\":\"1820720401535668226\",\"processDefinitionId\":\"leave1:1:1820662237058514946\",\"processDefinitionKey\":\"leave1\",\"tableName\":\"bs_leave\",\"processDefinitionName\":\"è¯·å‡æµç¨‹ï¼ˆæ™®é€šæµç¨‹ï¼‰\",\"componentName\":\"leave\",\"remark\":null,\"defaultProcess\":false,\"taskListener\":\"\",\"taskListenerList\":[]}}',0,'','2024-08-06 15:15:46'),(1820720533081624578,'æµç¨‹å®ä¾‹ç®¡ç†',3,'com.ruoyi.workflow.controller.ActProcessInstanceController.deleteRuntimeProcessAndHisInst()','DELETE',1,'admin','ç ”å‘éƒ¨é—¨','/workflow/processInstance/deleteRuntimeProcessAndHisInst/1820703824446689282','127.0.0.1','å†…ç½‘IP','{}','{\"code\":200,\"msg\":\"æ“ä½œæˆåŠŸ\",\"data\":null}',0,'','2024-08-06 15:16:17'),(1820720633849778177,'è¯·å‡ä¸šåŠ¡',2,'com.ruoyi.demo.controller.BsLeaveController.edit()','PUT',1,'admin','ç ”å‘éƒ¨é—¨','/demo/leave','127.0.0.1','å†…ç½‘IP','{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"1820702696808058882\",\"username\":\"admin\",\"duration\":\"2.50\",\"principal\":\"admin\",\"contactPhone\":\"111111111111\",\"leaveType\":3,\"title\":\"è¯·å¹´å‡\",\"leaveReason\":\"ä¼‘æ¯\",\"startDate\":\"2024-08-07 00:00:00\",\"endDate\":\"2024-08-09 00:00:00\",\"actNodeAssignee\":null}','{\"code\":200,\"msg\":\"æ“ä½œæˆåŠŸ\",\"data\":{\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 15:16:41\",\"id\":\"1820702696808058882\",\"username\":\"admin\",\"duration\":\"2.50\",\"principal\":\"admin\",\"contactPhone\":\"111111111111\",\"leaveType\":3,\"title\":\"è¯·å¹´å‡\",\"leaveReason\":\"ä¼‘æ¯\",\"startDate\":\"2024-08-07 00:00:00\",\"endDate\":\"2024-08-09 00:00:00\"}}',0,'','2024-08-06 15:16:41'),(1820720635686883330,'æµç¨‹å®ä¾‹ç®¡ç†',1,'com.ruoyi.workflow.controller.ActProcessInstanceController.startWorkFlow()','POST',1,'admin','ç ”å‘éƒ¨é—¨','/workflow/processInstance/startWorkFlow','127.0.0.1','å†…ç½‘IP','{\"businessKey\":\"1820702696808058882\",\"processKey\":\"leave1\",\"assignees\":null,\"tableName\":\"bs_leave\",\"variables\":{\"entity\":{\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 15:16:41\",\"id\":\"1820702696808058882\",\"username\":\"admin\",\"duration\":\"2.50\",\"principal\":\"admin\",\"contactPhone\":\"111111111111\",\"leaveType\":3,\"title\":\"è¯·å¹´å‡\",\"leaveReason\":\"ä¼‘æ¯\",\"startDate\":\"2024-08-07 00:00:00\",\"endDate\":\"2024-08-09 00:00:00\"},\"userId\":\"1\",\"_FLOWABLE_SKIP_EXPRESSION_ENABLED\":true}}','{\"code\":200,\"msg\":\"æäº¤æˆåŠŸ\",\"data\":{\"processInstanceId\":\"1820720634709610498\",\"taskId\":\"1820720634734776321\"}}',0,'','2024-08-06 15:16:42'),(1820720737797214210,'ä»»åŠ¡ç®¡ç†',1,'com.ruoyi.workflow.controller.ActTaskController.completeTask()','POST',1,'admin','ç ”å‘éƒ¨é—¨','/workflow/task/completeTask','127.0.0.1','å†…ç½‘IP','{\"taskId\":\"1820720634734776321\",\"isCopy\":false,\"fileId\":null,\"assigneeIds\":null,\"assigneeNames\":null,\"message\":\"æäº¤å•æ®\",\"sendMessage\":{\"title\":\"\",\"type\":[\"1\"],\"messageContent\":\"\"},\"defaultProcess\":true,\"processNodeList\":[{\"nodeId\":\"Activity_0lym9dc\",\"nodeName\":\"ç»„é•¿\",\"nodeType\":null,\"sourceFlowNodeType\":null,\"taskId\":null,\"expression\":null,\"expressionStr\":null,\"chooseWay\":\"person\",\"assignee\":\"ç–¯ç‹‚çš„ç‹®å­Li\",\"assigneeId\":\"1\",\"businessRuleId\":null,\"isShow\":false,\"multiple\":false,\"multipleColumn\":\"\",\"sourceFlowElementId\":null,\"x\":null,\"first\":false,\"transactor\":\"ç–¯ç‹‚çš„ç‹®å­Li\",\"transactorId\":\"1\",\"disabled\":false},{\"nodeId\":\"Activity_1j25s1c\",\"nodeName\":\"éƒ¨é—¨é¢†å¯¼\",\"nodeType\":null,\"sourceFlowNodeType\":null,\"taskId\":null,\"expression\":null,\"expressionStr\":null,\"chooseWay\":\"person\",\"assignee\":\"ç–¯ç‹‚çš„ç‹®å­Li\",\"assigneeId\":\"1\",\"businessRuleId\":null,\"isShow\":false,\"multiple\":false,\"multipleColumn\":\"\",\"sourceFlowElementId\":null,\"x\":null,\"first\":false,\"transactor\":\"ç–¯ç‹‚çš„ç‹®å­Li\",\"transactorId\":\"1\",\"disabled\":false}],\"assigneeMap\":{},\"variables\":{\"entity\":{\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 15:16:41\",\"id\":\"1820702696808058882\",\"username\":\"admin\",\"duration\":\"2.50\",\"principal\":\"admin\",\"contactPhone\":\"111111111111\",\"leaveType\":3,\"title\":\"è¯·å¹´å‡\",\"leaveReason\":\"ä¼‘æ¯\",\"startDate\":\"2024-08-07 00:00:00\",\"endDate\":\"2024-08-09 00:00:00\"},\"userId\":\"1\"}}','',1,'åŠç†å¤±è´¥:è¯·æ£€æŸ¥ã€ç”³è¯·äººã€‘èŠ‚ç‚¹é…ç½®','2024-08-06 15:17:06'),(1820720870798594049,'æµç¨‹èŠ‚ç‚¹äººå‘˜è®¾ç½®ç®¡ç†',1,'com.ruoyi.workflow.controller.ActNodeAssigneeController.add()','POST',1,'admin','ç ”å‘éƒ¨é—¨','/workflow/actNodeAssignee','127.0.0.1','å†…ç½‘IP','{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":null,\"processDefinitionId\":\"leave1:1:1820662237058514946\",\"chooseWay\":\"person\",\"nodeId\":\"Activity_14633hx\",\"nodeName\":\"ç”³è¯·äºº\",\"assignee\":null,\"assigneeId\":null,\"businessRuleId\":null,\"isShow\":false,\"multiple\":false,\"multipleColumn\":\"\",\"isBack\":false,\"isDelegate\":false,\"isTransmit\":false,\"isCopy\":false,\"addMultiInstance\":false,\"deleteMultiInstance\":false,\"taskListener\":\"\",\"autoComplete\":null,\"fieldListJson\":\"\",\"showBack\":false,\"taskListenerList\":[],\"fieldList\":[],\"index\":0}','{\"code\":200,\"msg\":\"æ“ä½œæˆåŠŸ\",\"data\":{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":null,\"processDefinitionId\":\"leave1:1:1820662237058514946\",\"chooseWay\":\"person\",\"nodeId\":\"Activity_14633hx\",\"nodeName\":\"ç”³è¯·äºº\",\"assignee\":null,\"assigneeId\":null,\"businessRuleId\":null,\"isShow\":false,\"multiple\":false,\"multipleColumn\":\"\",\"isBack\":false,\"isDelegate\":false,\"isTransmit\":false,\"isCopy\":false,\"addMultiInstance\":false,\"deleteMultiInstance\":false,\"taskListener\":\"\",\"autoComplete\":null,\"fieldListJson\":\"\",\"showBack\":false,\"taskListenerList\":[],\"fieldList\":[],\"index\":0}}',0,'','2024-08-06 15:17:38'),(1820720934459740161,'æµç¨‹èŠ‚ç‚¹äººå‘˜è®¾ç½®ç®¡ç†',1,'com.ruoyi.workflow.controller.ActNodeAssigneeController.add()','POST',1,'admin','ç ”å‘éƒ¨é—¨','/workflow/actNodeAssignee','127.0.0.1','å†…ç½‘IP','{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"1820720870416912385\",\"processDefinitionId\":\"leave1:1:1820662237058514946\",\"chooseWay\":\"person\",\"nodeId\":\"Activity_14633hx\",\"nodeName\":\"ç”³è¯·äºº\",\"assignee\":null,\"assigneeId\":null,\"businessRuleId\":null,\"isShow\":false,\"multiple\":false,\"multipleColumn\":\"\",\"isBack\":false,\"isDelegate\":false,\"isTransmit\":false,\"isCopy\":false,\"addMultiInstance\":false,\"deleteMultiInstance\":false,\"taskListener\":\"\",\"autoComplete\":null,\"fieldListJson\":\"\",\"showBack\":false,\"taskListenerList\":[],\"fieldList\":[],\"index\":0}','{\"code\":200,\"msg\":\"æ“ä½œæˆåŠŸ\",\"data\":{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"1820720870416912385\",\"processDefinitionId\":\"leave1:1:1820662237058514946\",\"chooseWay\":\"person\",\"nodeId\":\"Activity_14633hx\",\"nodeName\":\"ç”³è¯·äºº\",\"assignee\":null,\"assigneeId\":null,\"businessRuleId\":null,\"isShow\":false,\"multiple\":false,\"multipleColumn\":\"\",\"isBack\":false,\"isDelegate\":false,\"isTransmit\":false,\"isCopy\":false,\"addMultiInstance\":false,\"deleteMultiInstance\":false,\"taskListener\":\"\",\"autoComplete\":null,\"fieldListJson\":\"\",\"showBack\":false,\"taskListenerList\":[],\"fieldList\":[],\"index\":0}}',0,'','2024-08-06 15:17:53'),(1820721032468041730,'æµç¨‹å®ä¾‹ç®¡ç†',3,'com.ruoyi.workflow.controller.ActProcessInstanceController.deleteRuntimeProcessAndHisInst()','DELETE',1,'admin','ç ”å‘éƒ¨é—¨','/workflow/processInstance/deleteRuntimeProcessAndHisInst/1820720634709610498','127.0.0.1','å†…ç½‘IP','{}','{\"code\":200,\"msg\":\"æ“ä½œæˆåŠŸ\",\"data\":null}',0,'','2024-08-06 15:18:16'),(1820721118526771201,'æµç¨‹èŠ‚ç‚¹äººå‘˜è®¾ç½®ç®¡ç†',1,'com.ruoyi.workflow.controller.ActNodeAssigneeController.add()','POST',1,'admin','ç ”å‘éƒ¨é—¨','/workflow/actNodeAssignee','127.0.0.1','å†…ç½‘IP','{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"1820720870416912385\",\"processDefinitionId\":\"leave1:1:1820662237058514946\",\"chooseWay\":\"person\",\"nodeId\":\"Activity_14633hx\",\"nodeName\":\"ç”³è¯·äºº\",\"assignee\":null,\"assigneeId\":null,\"businessRuleId\":null,\"isShow\":false,\"multiple\":false,\"multipleColumn\":\"\",\"isBack\":false,\"isDelegate\":false,\"isTransmit\":false,\"isCopy\":false,\"addMultiInstance\":false,\"deleteMultiInstance\":false,\"taskListener\":\"\",\"autoComplete\":null,\"fieldListJson\":\"\",\"showBack\":false,\"taskListenerList\":[],\"fieldList\":[],\"index\":0}','{\"code\":200,\"msg\":\"æ“ä½œæˆåŠŸ\",\"data\":{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"1820720870416912385\",\"processDefinitionId\":\"leave1:1:1820662237058514946\",\"chooseWay\":\"person\",\"nodeId\":\"Activity_14633hx\",\"nodeName\":\"ç”³è¯·äºº\",\"assignee\":null,\"assigneeId\":null,\"businessRuleId\":null,\"isShow\":false,\"multiple\":false,\"multipleColumn\":\"\",\"isBack\":false,\"isDelegate\":false,\"isTransmit\":false,\"isCopy\":false,\"addMultiInstance\":false,\"deleteMultiInstance\":false,\"taskListener\":\"\",\"autoComplete\":null,\"fieldListJson\":\"\",\"showBack\":false,\"taskListenerList\":[],\"fieldList\":[],\"index\":0}}',0,'','2024-08-06 15:18:37'),(1820721420093034498,'æµç¨‹å®šä¹‰è®¾ç½®',1,'com.ruoyi.workflow.controller.ActProcessDefSettingController.add()','POST',1,'admin','ç ”å‘éƒ¨é—¨','/workflow/processDefSetting','127.0.0.1','å†…ç½‘IP','{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"1820720401535668226\",\"processDefinitionId\":\"leave1:1:1820662237058514946\",\"processDefinitionKey\":\"leave1\",\"processDefinitionName\":\"è¯·å‡æµç¨‹ï¼ˆæ™®é€šæµç¨‹ï¼‰\",\"tableName\":\"bs_leave\",\"componentName\":\"leave\",\"remark\":null,\"settingIds\":null,\"defaultProcess\":false,\"taskListener\":\"\",\"taskListenerList\":[]}','{\"code\":200,\"msg\":\"æ“ä½œæˆåŠŸ\",\"data\":{\"id\":\"1820720401535668226\",\"processDefinitionId\":\"leave1:1:1820662237058514946\",\"processDefinitionKey\":\"leave1\",\"tableName\":\"bs_leave\",\"processDefinitionName\":\"è¯·å‡æµç¨‹ï¼ˆæ™®é€šæµç¨‹ï¼‰\",\"componentName\":\"leave\",\"remark\":null,\"defaultProcess\":false,\"taskListener\":\"\",\"taskListenerList\":[]}}',0,'','2024-08-06 15:19:49'),(1820721458445750273,'è¯·å‡ä¸šåŠ¡',2,'com.ruoyi.demo.controller.BsLeaveController.edit()','PUT',1,'admin','ç ”å‘éƒ¨é—¨','/demo/leave','127.0.0.1','å†…ç½‘IP','{\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 15:16:41\",\"id\":\"1820702696808058882\",\"username\":\"admin\",\"duration\":\"2.50\",\"principal\":\"admin\",\"contactPhone\":\"111111111111\",\"leaveType\":3,\"title\":\"è¯·å¹´å‡\",\"leaveReason\":\"ä¼‘æ¯\",\"startDate\":\"2024-08-07 00:00:00\",\"endDate\":\"2024-08-09 00:00:00\",\"actNodeAssignee\":null}','{\"code\":200,\"msg\":\"æ“ä½œæˆåŠŸ\",\"data\":{\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 15:19:57\",\"id\":\"1820702696808058882\",\"username\":\"admin\",\"duration\":\"2.50\",\"principal\":\"admin\",\"contactPhone\":\"111111111111\",\"leaveType\":3,\"title\":\"è¯·å¹´å‡\",\"leaveReason\":\"ä¼‘æ¯\",\"startDate\":\"2024-08-07 00:00:00\",\"endDate\":\"2024-08-09 00:00:00\"}}',0,'','2024-08-06 15:19:58'),(1820721460874252289,'æµç¨‹å®ä¾‹ç®¡ç†',1,'com.ruoyi.workflow.controller.ActProcessInstanceController.startWorkFlow()','POST',1,'admin','ç ”å‘éƒ¨é—¨','/workflow/processInstance/startWorkFlow','127.0.0.1','å†…ç½‘IP','{\"businessKey\":\"1820702696808058882\",\"processKey\":\"leave1\",\"assignees\":null,\"tableName\":\"bs_leave\",\"variables\":{\"entity\":{\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 15:19:57\",\"id\":\"1820702696808058882\",\"username\":\"admin\",\"duration\":\"2.50\",\"principal\":\"admin\",\"contactPhone\":\"111111111111\",\"leaveType\":3,\"title\":\"è¯·å¹´å‡\",\"leaveReason\":\"ä¼‘æ¯\",\"startDate\":\"2024-08-07 00:00:00\",\"endDate\":\"2024-08-09 00:00:00\"},\"userId\":\"1\",\"_FLOWABLE_SKIP_EXPRESSION_ENABLED\":true}}','{\"code\":200,\"msg\":\"æäº¤æˆåŠŸ\",\"data\":{\"processInstanceId\":\"1820721459888590850\",\"taskId\":\"1820721459888590861\"}}',0,'','2024-08-06 15:19:58'),(1820721491740135426,'ä»»åŠ¡ç®¡ç†',1,'com.ruoyi.workflow.controller.ActTaskController.completeTask()','POST',1,'admin','ç ”å‘éƒ¨é—¨','/workflow/task/completeTask','127.0.0.1','å†…ç½‘IP','{\"taskId\":\"1820721459888590861\",\"isCopy\":false,\"fileId\":null,\"assigneeIds\":null,\"assigneeNames\":null,\"message\":\"æäº¤å•æ®\",\"sendMessage\":{\"title\":\"\",\"type\":[\"1\"],\"messageContent\":\"\"},\"defaultProcess\":true,\"processNodeList\":[{\"nodeId\":\"Activity_14633hx\",\"nodeName\":\"ç”³è¯·äºº\",\"nodeType\":null,\"sourceFlowNodeType\":null,\"taskId\":null,\"expression\":null,\"expressionStr\":null,\"chooseWay\":\"person\",\"assignee\":\"ç–¯ç‹‚çš„ç‹®å­Li\",\"assigneeId\":\"1\",\"businessRuleId\":null,\"isShow\":false,\"multiple\":false,\"multipleColumn\":\"\",\"sourceFlowElementId\":null,\"x\":null,\"first\":false,\"transactor\":\"ç–¯ç‹‚çš„ç‹®å­Li\",\"transactorId\":\"1\",\"disabled\":false},{\"nodeId\":\"Activity_0lym9dc\",\"nodeName\":\"ç»„é•¿\",\"nodeType\":null,\"sourceFlowNodeType\":null,\"taskId\":null,\"expression\":null,\"expressionStr\":null,\"chooseWay\":\"person\",\"assignee\":\"ç–¯ç‹‚çš„ç‹®å­Li\",\"assigneeId\":\"1\",\"businessRuleId\":null,\"isShow\":false,\"multiple\":false,\"multipleColumn\":\"\",\"sourceFlowElementId\":null,\"x\":null,\"first\":false,\"transactor\":\"ç–¯ç‹‚çš„ç‹®å­Li\",\"transactorId\":\"1\",\"disabled\":false},{\"nodeId\":\"Activity_1j25s1c\",\"nodeName\":\"éƒ¨é—¨é¢†å¯¼\",\"nodeType\":null,\"sourceFlowNodeType\":null,\"taskId\":null,\"expression\":null,\"expressionStr\":null,\"chooseWay\":\"person\",\"assignee\":\"ç–¯ç‹‚çš„ç‹®å­Li\",\"assigneeId\":\"1\",\"businessRuleId\":null,\"isShow\":false,\"multiple\":false,\"multipleColumn\":\"\",\"sourceFlowElementId\":null,\"x\":null,\"first\":false,\"transactor\":\"ç–¯ç‹‚çš„ç‹®å­Li\",\"transactorId\":\"1\",\"disabled\":false}],\"assigneeMap\":{},\"variables\":{\"entity\":{\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 15:19:57\",\"id\":\"1820702696808058882\",\"username\":\"admin\",\"duration\":\"2.50\",\"principal\":\"admin\",\"contactPhone\":\"111111111111\",\"leaveType\":3,\"title\":\"è¯·å¹´å‡\",\"leaveReason\":\"ä¼‘æ¯\",\"startDate\":\"2024-08-07 00:00:00\",\"endDate\":\"2024-08-09 00:00:00\"},\"userId\":\"1\"}}','{\"code\":200,\"msg\":\"æ“ä½œæˆåŠŸ\",\"data\":null}',0,'','2024-08-06 15:20:06'),(1820724024009232386,'å­—å…¸ç±»å‹',2,'com.ruoyi.web.controller.system.SysDictTypeController.edit()','PUT',1,'admin','ç ”å‘éƒ¨é—¨','/system/dict/type','127.0.0.1','å†…ç½‘IP','{\"createBy\":\"1\",\"createTime\":\"2024-08-06 09:35:27\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 15:30:09\",\"dictId\":13,\"dictName\":\"ä¸šåŠ¡çŠ¶æ€\",\"dictType\":\"act_status\",\"status\":\"0\",\"remark\":\"ä¸šåŠ¡çŠ¶æ€åˆ—è¡¨\"}','{\"code\":200,\"msg\":\"æ“ä½œæˆåŠŸ\",\"data\":null}',0,'','2024-08-06 15:30:09'),(1820724845182652418,'èœå•ç®¡ç†',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','ç ”å‘éƒ¨é—¨','/system/menu','127.0.0.1','å†…ç½‘IP','{\"createBy\":\"admin\",\"createTime\":\"2024-08-05 19:19:51\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 15:33:25\",\"parentName\":null,\"parentId\":0,\"children\":[],\"menuId\":4,\"menuName\":\"PLUSå®˜ç½‘\",\"orderNum\":16,\"path\":\"https://gitee.com/dromara/RuoYi-Vue-Plus\",\"component\":null,\"queryParam\":\"\",\"isFrame\":\"0\",\"isCache\":\"0\",\"menuType\":\"M\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"\",\"icon\":\"guide\",\"remark\":\"RuoYi-Vue-Pluså®˜ç½‘åœ°å€\"}','{\"code\":200,\"msg\":\"æ“ä½œæˆåŠŸ\",\"data\":null}',0,'','2024-08-06 15:33:25'),(1820724944835121154,'èœå•ç®¡ç†',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','ç ”å‘éƒ¨é—¨','/system/menu','127.0.0.1','å†…ç½‘IP','{\"createBy\":\"admin\",\"createTime\":\"2024-08-05 19:20:41\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 15:33:48\",\"parentName\":null,\"parentId\":5,\"children\":[],\"menuId\":1500,\"menuName\":\"æµ‹è¯•å•è¡¨\",\"orderNum\":1,\"path\":\"demo\",\"component\":\"demo/demo/index\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"demo:demo:list\",\"icon\":\"example\",\"remark\":\"æµ‹è¯•å•è¡¨èœå•\"}','{\"code\":200,\"msg\":\"æ“ä½œæˆåŠŸ\",\"data\":null}',0,'','2024-08-06 15:33:49'),(1820724975218659330,'èœå•ç®¡ç†',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','ç ”å‘éƒ¨é—¨','/system/menu','127.0.0.1','å†…ç½‘IP','{\"createBy\":\"admin\",\"createTime\":\"2024-08-05 19:20:41\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 15:33:56\",\"parentName\":null,\"parentId\":5,\"children\":[],\"menuId\":1506,\"menuName\":\"æµ‹è¯•æ ‘è¡¨\",\"orderNum\":1,\"path\":\"tree\",\"component\":\"demo/tree/index\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"demo:tree:list\",\"icon\":\"example\",\"remark\":\"æµ‹è¯•æ ‘è¡¨èœå•\"}','{\"code\":200,\"msg\":\"æ“ä½œæˆåŠŸ\",\"data\":null}',0,'','2024-08-06 15:33:56');
/*!40000 ALTER TABLE `sys_oper_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_oss`
--

DROP TABLE IF EXISTS `sys_oss`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_oss` (
  `oss_id` bigint NOT NULL COMMENT 'å¯¹è±¡å­˜å‚¨ä¸»é”®',
  `file_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'æ–‡ä»¶å',
  `original_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'åŸå',
  `file_suffix` varchar(10) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'æ–‡ä»¶åç¼€å',
  `url` varchar(500) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'URLåœ°å€',
  `create_time` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'ä¸Šä¼ äºº',
  `update_time` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'æ›´æ–°äºº',
  `service` varchar(20) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'minio' COMMENT 'æœåŠ¡å•†',
  PRIMARY KEY (`oss_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='OSSå¯¹è±¡å­˜å‚¨è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_oss`
--

LOCK TABLES `sys_oss` WRITE;
/*!40000 ALTER TABLE `sys_oss` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_oss` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_oss_config`
--

DROP TABLE IF EXISTS `sys_oss_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_oss_config` (
  `oss_config_id` bigint NOT NULL COMMENT 'ä¸»å»º',
  `config_key` varchar(20) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'é…ç½®key',
  `access_key` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'accessKey',
  `secret_key` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'ç§˜é’¥',
  `bucket_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'æ¡¶åç§°',
  `prefix` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'å‰ç¼€',
  `endpoint` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'è®¿é—®ç«™ç‚¹',
  `domain` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'è‡ªå®šä¹‰åŸŸå',
  `is_https` char(1) COLLATE utf8mb4_general_ci DEFAULT 'N' COMMENT 'æ˜¯å¦httpsï¼ˆY=æ˜¯,N=å¦ï¼‰',
  `region` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'åŸŸ',
  `access_policy` char(1) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1' COMMENT 'æ¡¶æƒé™ç±»å‹(0=private 1=public 2=custom)',
  `status` char(1) COLLATE utf8mb4_general_ci DEFAULT '1' COMMENT 'æ˜¯å¦é»˜è®¤ï¼ˆ0=æ˜¯,1=å¦ï¼‰',
  `ext1` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'æ‰©å±•å­—æ®µ',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'åˆ›å»ºè€…',
  `create_time` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'æ›´æ–°è€…',
  `update_time` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'å¤‡æ³¨',
  PRIMARY KEY (`oss_config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='å¯¹è±¡å­˜å‚¨é…ç½®è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_oss_config`
--

LOCK TABLES `sys_oss_config` WRITE;
/*!40000 ALTER TABLE `sys_oss_config` DISABLE KEYS */;
INSERT INTO `sys_oss_config` VALUES (1,'minio','ruoyi','ruoyi123','ruoyi','','127.0.0.1:9000','','N','','1','0','','admin','2024-08-05 19:20:13','admin','2024-08-05 19:20:13',NULL),(2,'qiniu','XXXXXXXXXXXXXXX','XXXXXXXXXXXXXXX','ruoyi','','s3-cn-north-1.qiniucs.com','','N','','1','1','','admin','2024-08-05 19:20:13','admin','2024-08-05 19:20:13',NULL),(3,'aliyun','XXXXXXXXXXXXXXX','XXXXXXXXXXXXXXX','ruoyi','','oss-cn-beijing.aliyuncs.com','','N','','1','1','','admin','2024-08-05 19:20:13','admin','2024-08-05 19:20:13',NULL),(4,'qcloud','XXXXXXXXXXXXXXX','XXXXXXXXXXXXXXX','ruoyi-1250000000','','cos.ap-beijing.myqcloud.com','','N','ap-beijing','1','1','','admin','2024-08-05 19:20:13','admin','2024-08-05 19:20:13',NULL),(5,'image','ruoyi','ruoyi123','ruoyi','image','127.0.0.1:9000','','N','','1','1','','admin','2024-08-05 19:20:13','admin','2024-08-05 19:20:13',NULL);
/*!40000 ALTER TABLE `sys_oss_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_post`
--

DROP TABLE IF EXISTS `sys_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_post` (
  `post_id` bigint NOT NULL COMMENT 'å²—ä½ID',
  `post_code` varchar(64) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'å²—ä½ç¼–ç ',
  `post_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'å²—ä½åç§°',
  `post_sort` int NOT NULL COMMENT 'æ˜¾ç¤ºé¡ºåº',
  `status` char(1) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'çŠ¶æ€ï¼ˆ0æ­£å¸¸ 1åœç”¨ï¼‰',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'åˆ›å»ºè€…',
  `create_time` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'æ›´æ–°è€…',
  `update_time` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'å¤‡æ³¨',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='å²—ä½ä¿¡æ¯è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_post`
--

LOCK TABLES `sys_post` WRITE;
/*!40000 ALTER TABLE `sys_post` DISABLE KEYS */;
INSERT INTO `sys_post` VALUES (1,'ceo','è‘£äº‹é•¿',1,'0','admin','2024-08-05 19:19:50','',NULL,''),(2,'se','é¡¹ç›®ç»ç†',2,'0','admin','2024-08-05 19:19:50','',NULL,''),(3,'hr','äººåŠ›èµ„æº',3,'0','admin','2024-08-05 19:19:50','',NULL,''),(4,'user','æ™®é€šå‘˜å·¥',4,'0','admin','2024-08-05 19:19:50','',NULL,'');
/*!40000 ALTER TABLE `sys_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role` (
  `role_id` bigint NOT NULL COMMENT 'è§’è‰²ID',
  `role_name` varchar(30) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'è§’è‰²åç§°',
  `role_key` varchar(100) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'è§’è‰²æƒé™å­—ç¬¦ä¸²',
  `role_sort` int NOT NULL COMMENT 'æ˜¾ç¤ºé¡ºåº',
  `data_scope` char(1) COLLATE utf8mb4_general_ci DEFAULT '1' COMMENT 'æ•°æ®èŒƒå›´ï¼ˆ1ï¼šå…¨éƒ¨æ•°æ®æƒé™ 2ï¼šè‡ªå®šæ•°æ®æƒé™ 3ï¼šæœ¬éƒ¨é—¨æ•°æ®æƒé™ 4ï¼šæœ¬éƒ¨é—¨åŠä»¥ä¸‹æ•°æ®æƒé™ï¼‰',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT 'èœå•æ ‘é€‰æ‹©é¡¹æ˜¯å¦å…³è”æ˜¾ç¤º',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT 'éƒ¨é—¨æ ‘é€‰æ‹©é¡¹æ˜¯å¦å…³è”æ˜¾ç¤º',
  `status` char(1) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'è§’è‰²çŠ¶æ€ï¼ˆ0æ­£å¸¸ 1åœç”¨ï¼‰',
  `del_flag` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT 'åˆ é™¤æ ‡å¿—ï¼ˆ0ä»£è¡¨å­˜åœ¨ 2ä»£è¡¨åˆ é™¤ï¼‰',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'åˆ›å»ºè€…',
  `create_time` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'æ›´æ–°è€…',
  `update_time` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'å¤‡æ³¨',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='è§’è‰²ä¿¡æ¯è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,'è¶…çº§ç®¡ç†å‘˜','admin',1,'1',1,1,'0','0','admin','2024-08-05 19:19:51','',NULL,'è¶…çº§ç®¡ç†å‘˜'),(2,'æ™®é€šè§’è‰²','common',2,'2',1,1,'0','0','admin','2024-08-05 19:19:51','',NULL,'æ™®é€šè§’è‰²'),(3,'æœ¬éƒ¨é—¨åŠä»¥ä¸‹','test1',3,'4',1,1,'0','0','admin','2024-08-05 19:20:42','admin',NULL,NULL),(4,'ä»…æœ¬äºº','test2',4,'5',1,1,'0','0','admin','2024-08-05 19:20:42','admin',NULL,NULL);
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_dept`
--

DROP TABLE IF EXISTS `sys_role_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint NOT NULL COMMENT 'è§’è‰²ID',
  `dept_id` bigint NOT NULL COMMENT 'éƒ¨é—¨ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='è§’è‰²å’Œéƒ¨é—¨å…³è”è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_dept`
--

LOCK TABLES `sys_role_dept` WRITE;
/*!40000 ALTER TABLE `sys_role_dept` DISABLE KEYS */;
INSERT INTO `sys_role_dept` VALUES (2,100),(2,101),(2,105);
/*!40000 ALTER TABLE `sys_role_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_menu`
--

DROP TABLE IF EXISTS `sys_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint NOT NULL COMMENT 'è§’è‰²ID',
  `menu_id` bigint NOT NULL COMMENT 'èœå•ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='è§’è‰²å’Œèœå•å…³è”è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
INSERT INTO `sys_role_menu` VALUES (2,1),(2,2),(2,3),(2,4),(2,100),(2,101),(2,102),(2,103),(2,104),(2,105),(2,106),(2,107),(2,108),(2,109),(2,110),(2,111),(2,112),(2,113),(2,114),(2,115),(2,116),(2,500),(2,501),(2,1000),(2,1001),(2,1002),(2,1003),(2,1004),(2,1005),(2,1006),(2,1007),(2,1008),(2,1009),(2,1010),(2,1011),(2,1012),(2,1013),(2,1014),(2,1015),(2,1016),(2,1017),(2,1018),(2,1019),(2,1020),(2,1021),(2,1022),(2,1023),(2,1024),(2,1025),(2,1026),(2,1027),(2,1028),(2,1029),(2,1030),(2,1031),(2,1032),(2,1033),(2,1034),(2,1035),(2,1036),(2,1037),(2,1038),(2,1039),(2,1040),(2,1041),(2,1042),(2,1043),(2,1044),(2,1045),(2,1046),(2,1047),(2,1048),(2,1050),(2,1055),(2,1056),(2,1057),(2,1058),(2,1059),(2,1060),(3,1),(3,5),(3,100),(3,101),(3,102),(3,103),(3,104),(3,105),(3,106),(3,107),(3,108),(3,500),(3,501),(3,1001),(3,1002),(3,1003),(3,1004),(3,1005),(3,1006),(3,1007),(3,1008),(3,1009),(3,1010),(3,1011),(3,1012),(3,1013),(3,1014),(3,1015),(3,1016),(3,1017),(3,1018),(3,1019),(3,1020),(3,1021),(3,1022),(3,1023),(3,1024),(3,1025),(3,1026),(3,1027),(3,1028),(3,1029),(3,1030),(3,1031),(3,1032),(3,1033),(3,1034),(3,1035),(3,1036),(3,1037),(3,1038),(3,1039),(3,1040),(3,1041),(3,1042),(3,1043),(3,1044),(3,1045),(3,1500),(3,1501),(3,1502),(3,1503),(3,1504),(3,1505),(3,1506),(3,1507),(3,1508),(3,1509),(3,1510),(3,1511),(4,5),(4,1500),(4,1501),(4,1502),(4,1503),(4,1504),(4,1505),(4,1506),(4,1507),(4,1508),(4,1509),(4,1510),(4,1511);
/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_social_user`
--

DROP TABLE IF EXISTS `sys_social_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_social_user` (
  `id` bigint NOT NULL,
  `uuid` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ç¬¬ä¸‰æ–¹ç³»ç»Ÿçš„å”¯ä¸€ID',
  `source` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ç¬¬ä¸‰æ–¹ç”¨æˆ·æ¥æº',
  `access_token` varchar(1000) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ç”¨æˆ·çš„æˆæƒä»¤ç‰Œ',
  `expire_in` bigint DEFAULT NULL COMMENT 'ç¬¬ä¸‰æ–¹ç”¨æˆ·çš„æˆæƒä»¤ç‰Œçš„æœ‰æ•ˆæœŸ',
  `refresh_token` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'åˆ·æ–°ä»¤ç‰Œ',
  `open_id` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ç¬¬ä¸‰æ–¹ç”¨æˆ·çš„ open id',
  `uid` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ç¬¬ä¸‰æ–¹ç”¨æˆ·çš„ ID',
  `access_code` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ä¸ªåˆ«å¹³å°çš„æˆæƒä¿¡æ¯',
  `union_id` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ç¬¬ä¸‰æ–¹ç”¨æˆ·çš„ union id',
  `scope` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ç¬¬ä¸‰æ–¹ç”¨æˆ·æˆäºˆçš„æƒé™',
  `token_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ä¸ªåˆ«å¹³å°çš„æˆæƒä¿¡æ¯',
  `id_token` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'id token',
  `mac_algorithm` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'å°ç±³å¹³å°ç”¨æˆ·çš„é™„å¸¦å±æ€§',
  `mac_key` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'å°ç±³å¹³å°ç”¨æˆ·çš„é™„å¸¦å±æ€§',
  `code` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ç”¨æˆ·çš„æˆæƒcode',
  `oauth_token` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Twitterå¹³å°ç”¨æˆ·çš„é™„å¸¦å±æ€§',
  `oauth_token_secret` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Twitterå¹³å°ç”¨æˆ·çš„é™„å¸¦å±æ€§',
  `sys_user_id` bigint DEFAULT NULL COMMENT 'ç³»ç»Ÿç”¨æˆ·id',
  `del_flag` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'åˆ é™¤æ ‡å¿—ï¼ˆ0ä»£è¡¨å­˜åœ¨ 2ä»£è¡¨åˆ é™¤ï¼‰',
  `username` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ç”¨æˆ·å',
  `nickname` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ç”¨æˆ·æ˜µç§°',
  `avatar` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ç”¨æˆ·å¤´åƒ',
  `blog` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ç”¨æˆ·ç½‘å€',
  `company` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'æ‰€åœ¨å…¬å¸',
  `location` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ä½ç½®',
  `email` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ç”¨æˆ·é‚®ç®±',
  `remark` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ç”¨æˆ·å¤‡æ³¨ï¼ˆå„å¹³å°ä¸­çš„ç”¨æˆ·ä¸ªäººä»‹ç»ï¼‰',
  `gender` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'æ€§åˆ«',
  `create_by` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'åˆ›å»ºè€…',
  `create_time` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'æ›´æ–°è€…',
  `update_time` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_social_user`
--

LOCK TABLES `sys_social_user` WRITE;
/*!40000 ALTER TABLE `sys_social_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_social_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user` (
  `user_id` bigint NOT NULL COMMENT 'ç”¨æˆ·ID',
  `dept_id` bigint DEFAULT NULL COMMENT 'éƒ¨é—¨ID',
  `user_name` varchar(30) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ç”¨æˆ·è´¦å·',
  `nick_name` varchar(30) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ç”¨æˆ·æ˜µç§°',
  `user_type` varchar(10) COLLATE utf8mb4_general_ci DEFAULT 'sys_user' COMMENT 'ç”¨æˆ·ç±»å‹ï¼ˆsys_userç³»ç»Ÿç”¨æˆ·ï¼‰',
  `email` varchar(50) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'ç”¨æˆ·é‚®ç®±',
  `phonenumber` varchar(11) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'æ‰‹æœºå·ç ',
  `sex` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT 'ç”¨æˆ·æ€§åˆ«ï¼ˆ0ç”· 1å¥³ 2æœªçŸ¥ï¼‰',
  `avatar` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'å¤´åƒåœ°å€',
  `password` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'å¯†ç ',
  `status` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT 'å¸å·çŠ¶æ€ï¼ˆ0æ­£å¸¸ 1åœç”¨ï¼‰',
  `del_flag` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT 'åˆ é™¤æ ‡å¿—ï¼ˆ0ä»£è¡¨å­˜åœ¨ 2ä»£è¡¨åˆ é™¤ï¼‰',
  `login_ip` varchar(128) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'æœ€åç™»å½•IP',
  `login_date` datetime DEFAULT NULL COMMENT 'æœ€åç™»å½•æ—¶é—´',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'åˆ›å»ºè€…',
  `create_time` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'æ›´æ–°è€…',
  `update_time` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'å¤‡æ³¨',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='ç”¨æˆ·ä¿¡æ¯è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,103,'admin','ç–¯ç‹‚çš„ç‹®å­Li','sys_user','crazyLionLi@163.com','15888888888','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2024-08-06 15:34:06','admin','2024-08-05 19:19:49','admin','2024-08-06 15:34:06','ç®¡ç†å‘˜'),(2,105,'lionli','ç–¯ç‹‚çš„ç‹®å­Li','sys_user','crazyLionLi@qq.com','15666666666','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2024-08-05 19:19:49','admin','2024-08-05 19:19:49','',NULL,'æµ‹è¯•å‘˜'),(3,108,'test','æœ¬éƒ¨é—¨åŠä»¥ä¸‹ å¯†ç 666666','sys_user','','','0','','$2a$10$b8yUzN0C71sbz.PhNOCgJe.Tu1yWC3RNrTyjSQ8p1W0.aaUXUJ.Ne','0','0','127.0.0.1','2024-08-05 19:20:41','admin','2024-08-05 19:20:41','test','2024-08-05 19:20:41',NULL),(4,102,'test1','ä»…æœ¬äºº å¯†ç 666666','sys_user','','','0','','$2a$10$b8yUzN0C71sbz.PhNOCgJe.Tu1yWC3RNrTyjSQ8p1W0.aaUXUJ.Ne','0','0','127.0.0.1','2024-08-05 19:20:41','admin','2024-08-05 19:20:41','test1','2024-08-05 19:20:41',NULL);
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_post`
--

DROP TABLE IF EXISTS `sys_user_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_post` (
  `user_id` bigint NOT NULL COMMENT 'ç”¨æˆ·ID',
  `post_id` bigint NOT NULL COMMENT 'å²—ä½ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='ç”¨æˆ·ä¸å²—ä½å…³è”è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_post`
--

LOCK TABLES `sys_user_post` WRITE;
/*!40000 ALTER TABLE `sys_user_post` DISABLE KEYS */;
INSERT INTO `sys_user_post` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `sys_user_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_role` (
  `user_id` bigint NOT NULL COMMENT 'ç”¨æˆ·ID',
  `role_id` bigint NOT NULL COMMENT 'è§’è‰²ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='ç”¨æˆ·å’Œè§’è‰²å…³è”è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` VALUES (1,1),(2,2),(3,3),(4,4);
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_demo`
--

DROP TABLE IF EXISTS `test_demo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test_demo` (
  `id` bigint NOT NULL COMMENT 'ä¸»é”®',
  `dept_id` bigint DEFAULT NULL COMMENT 'éƒ¨é—¨id',
  `user_id` bigint DEFAULT NULL COMMENT 'ç”¨æˆ·id',
  `order_num` int DEFAULT '0' COMMENT 'æ’åºå·',
  `test_key` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'keyé”®',
  `value` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'å€¼',
  `version` int DEFAULT '0' COMMENT 'ç‰ˆæœ¬',
  `create_time` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'åˆ›å»ºäºº',
  `update_time` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'æ›´æ–°äºº',
  `del_flag` int DEFAULT '0' COMMENT 'åˆ é™¤æ ‡å¿—',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='æµ‹è¯•å•è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_demo`
--

LOCK TABLES `test_demo` WRITE;
/*!40000 ALTER TABLE `test_demo` DISABLE KEYS */;
INSERT INTO `test_demo` VALUES (1,102,4,1,'æµ‹è¯•æ•°æ®æƒé™','æµ‹è¯•',0,'2024-08-05 19:20:50','admin',NULL,NULL,0),(2,102,3,2,'å­èŠ‚ç‚¹1','111',0,'2024-08-05 19:20:50','admin',NULL,NULL,0),(3,102,3,3,'å­èŠ‚ç‚¹2','222',0,'2024-08-05 19:20:50','admin',NULL,NULL,0),(4,108,4,4,'æµ‹è¯•æ•°æ®','demo',0,'2024-08-05 19:20:51','admin',NULL,NULL,0),(5,108,3,13,'å­èŠ‚ç‚¹11','1111',0,'2024-08-05 19:20:51','admin',NULL,NULL,0),(6,108,3,12,'å­èŠ‚ç‚¹22','2222',0,'2024-08-05 19:20:51','admin',NULL,NULL,0),(7,108,3,11,'å­èŠ‚ç‚¹33','3333',0,'2024-08-05 19:20:51','admin',NULL,NULL,0),(8,108,3,10,'å­èŠ‚ç‚¹44','4444',0,'2024-08-05 19:20:51','admin',NULL,NULL,0),(9,108,3,9,'å­èŠ‚ç‚¹55','5555',0,'2024-08-05 19:20:51','admin',NULL,NULL,0),(10,108,3,8,'å­èŠ‚ç‚¹66','6666',0,'2024-08-05 19:20:51','admin',NULL,NULL,0),(11,108,3,7,'å­èŠ‚ç‚¹77','7777',0,'2024-08-05 19:20:52','admin',NULL,NULL,0),(12,108,3,6,'å­èŠ‚ç‚¹88','8888',0,'2024-08-05 19:20:52','admin',NULL,NULL,0),(13,108,3,5,'å­èŠ‚ç‚¹99','9999',0,'2024-08-05 19:20:52','admin',NULL,NULL,0);
/*!40000 ALTER TABLE `test_demo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_tree`
--

DROP TABLE IF EXISTS `test_tree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test_tree` (
  `id` bigint NOT NULL COMMENT 'ä¸»é”®',
  `parent_id` bigint DEFAULT '0' COMMENT 'çˆ¶id',
  `dept_id` bigint DEFAULT NULL COMMENT 'éƒ¨é—¨id',
  `user_id` bigint DEFAULT NULL COMMENT 'ç”¨æˆ·id',
  `tree_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'å€¼',
  `version` int DEFAULT '0' COMMENT 'ç‰ˆæœ¬',
  `create_time` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'åˆ›å»ºäºº',
  `update_time` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'æ›´æ–°äºº',
  `del_flag` int DEFAULT '0' COMMENT 'åˆ é™¤æ ‡å¿—',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='æµ‹è¯•æ ‘è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_tree`
--

LOCK TABLES `test_tree` WRITE;
/*!40000 ALTER TABLE `test_tree` DISABLE KEYS */;
INSERT INTO `test_tree` VALUES (1,0,102,4,'æµ‹è¯•æ•°æ®æƒé™',0,'2024-08-05 19:20:52','admin',NULL,NULL,0),(2,1,102,3,'å­èŠ‚ç‚¹1',0,'2024-08-05 19:20:52','admin',NULL,NULL,0),(3,2,102,3,'å­èŠ‚ç‚¹2',0,'2024-08-05 19:20:52','admin',NULL,NULL,0),(4,0,108,4,'æµ‹è¯•æ ‘1',0,'2024-08-05 19:20:52','admin',NULL,NULL,0),(5,4,108,3,'å­èŠ‚ç‚¹11',0,'2024-08-05 19:20:52','admin',NULL,NULL,0),(6,4,108,3,'å­èŠ‚ç‚¹22',0,'2024-08-05 19:20:53','admin',NULL,NULL,0),(7,4,108,3,'å­èŠ‚ç‚¹33',0,'2024-08-05 19:20:53','admin',NULL,NULL,0),(8,5,108,3,'å­èŠ‚ç‚¹44',0,'2024-08-05 19:20:53','admin',NULL,NULL,0),(9,6,108,3,'å­èŠ‚ç‚¹55',0,'2024-08-05 19:20:53','admin',NULL,NULL,0),(10,7,108,3,'å­èŠ‚ç‚¹66',0,'2024-08-05 19:20:53','admin',NULL,NULL,0),(11,7,108,3,'å­èŠ‚ç‚¹77',0,'2024-08-05 19:20:53','admin',NULL,NULL,0),(12,10,108,3,'å­èŠ‚ç‚¹88',0,'2024-08-05 19:20:53','admin',NULL,NULL,0),(13,10,108,3,'å­èŠ‚ç‚¹99',0,'2024-08-05 19:20:53','admin',NULL,NULL,0);
/*!40000 ALTER TABLE `test_tree` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xxl_job_group`
--

DROP TABLE IF EXISTS `xxl_job_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `xxl_job_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_name` varchar(64) NOT NULL COMMENT 'æ‰§è¡Œå™¨AppName',
  `title` varchar(12) NOT NULL COMMENT 'æ‰§è¡Œå™¨åç§°',
  `address_type` tinyint NOT NULL DEFAULT '0' COMMENT 'æ‰§è¡Œå™¨åœ°å€ç±»å‹ï¼š0=è‡ªåŠ¨æ³¨å†Œã€1=æ‰‹åŠ¨å½•å…¥',
  `address_list` text COMMENT 'æ‰§è¡Œå™¨åœ°å€åˆ—è¡¨ï¼Œå¤šåœ°å€é€—å·åˆ†éš”',
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xxl_job_group`
--

LOCK TABLES `xxl_job_group` WRITE;
/*!40000 ALTER TABLE `xxl_job_group` DISABLE KEYS */;
INSERT INTO `xxl_job_group` VALUES (1,'xxl-job-executor','ç¤ºä¾‹æ‰§è¡Œå™¨',0,NULL,'2024-08-06 15:39:39');
/*!40000 ALTER TABLE `xxl_job_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xxl_job_info`
--

DROP TABLE IF EXISTS `xxl_job_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `xxl_job_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `job_group` int NOT NULL COMMENT 'æ‰§è¡Œå™¨ä¸»é”®ID',
  `job_desc` varchar(255) NOT NULL,
  `add_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `author` varchar(64) DEFAULT NULL COMMENT 'ä½œè€…',
  `alarm_email` varchar(255) DEFAULT NULL COMMENT 'æŠ¥è­¦é‚®ä»¶',
  `schedule_type` varchar(50) NOT NULL DEFAULT 'NONE' COMMENT 'è°ƒåº¦ç±»å‹',
  `schedule_conf` varchar(128) DEFAULT NULL COMMENT 'è°ƒåº¦é…ç½®ï¼Œå€¼å«ä¹‰å–å†³äºè°ƒåº¦ç±»å‹',
  `misfire_strategy` varchar(50) NOT NULL DEFAULT 'DO_NOTHING' COMMENT 'è°ƒåº¦è¿‡æœŸç­–ç•¥',
  `executor_route_strategy` varchar(50) DEFAULT NULL COMMENT 'æ‰§è¡Œå™¨è·¯ç”±ç­–ç•¥',
  `executor_handler` varchar(255) DEFAULT NULL COMMENT 'æ‰§è¡Œå™¨ä»»åŠ¡handler',
  `executor_param` varchar(512) DEFAULT NULL COMMENT 'æ‰§è¡Œå™¨ä»»åŠ¡å‚æ•°',
  `executor_block_strategy` varchar(50) DEFAULT NULL COMMENT 'é˜»å¡å¤„ç†ç­–ç•¥',
  `executor_timeout` int NOT NULL DEFAULT '0' COMMENT 'ä»»åŠ¡æ‰§è¡Œè¶…æ—¶æ—¶é—´ï¼Œå•ä½ç§’',
  `executor_fail_retry_count` int NOT NULL DEFAULT '0' COMMENT 'å¤±è´¥é‡è¯•æ¬¡æ•°',
  `glue_type` varchar(50) NOT NULL COMMENT 'GLUEç±»å‹',
  `glue_source` mediumtext COMMENT 'GLUEæºä»£ç ',
  `glue_remark` varchar(128) DEFAULT NULL COMMENT 'GLUEå¤‡æ³¨',
  `glue_updatetime` datetime DEFAULT NULL COMMENT 'GLUEæ›´æ–°æ—¶é—´',
  `child_jobid` varchar(255) DEFAULT NULL COMMENT 'å­ä»»åŠ¡IDï¼Œå¤šä¸ªé€—å·åˆ†éš”',
  `trigger_status` tinyint NOT NULL DEFAULT '0' COMMENT 'è°ƒåº¦çŠ¶æ€ï¼š0-åœæ­¢ï¼Œ1-è¿è¡Œ',
  `trigger_last_time` bigint NOT NULL DEFAULT '0' COMMENT 'ä¸Šæ¬¡è°ƒåº¦æ—¶é—´',
  `trigger_next_time` bigint NOT NULL DEFAULT '0' COMMENT 'ä¸‹æ¬¡è°ƒåº¦æ—¶é—´',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xxl_job_info`
--

LOCK TABLES `xxl_job_info` WRITE;
/*!40000 ALTER TABLE `xxl_job_info` DISABLE KEYS */;
INSERT INTO `xxl_job_info` VALUES (1,1,'æµ‹è¯•ä»»åŠ¡1','2018-11-03 22:21:31','2018-11-03 22:21:31','XXL','','CRON','0 0 0 * * ? *','DO_NOTHING','FIRST','demoJobHandler','','SERIAL_EXECUTION',0,0,'BEAN','','GLUEä»£ç åˆå§‹åŒ–','2018-11-03 22:21:31','',0,0,0);
/*!40000 ALTER TABLE `xxl_job_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xxl_job_lock`
--

DROP TABLE IF EXISTS `xxl_job_lock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `xxl_job_lock` (
  `lock_name` varchar(50) NOT NULL COMMENT 'é”åç§°',
  PRIMARY KEY (`lock_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xxl_job_lock`
--

LOCK TABLES `xxl_job_lock` WRITE;
/*!40000 ALTER TABLE `xxl_job_lock` DISABLE KEYS */;
INSERT INTO `xxl_job_lock` VALUES ('schedule_lock');
/*!40000 ALTER TABLE `xxl_job_lock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xxl_job_log`
--

DROP TABLE IF EXISTS `xxl_job_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `xxl_job_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `job_group` int NOT NULL COMMENT 'æ‰§è¡Œå™¨ä¸»é”®ID',
  `job_id` int NOT NULL COMMENT 'ä»»åŠ¡ï¼Œä¸»é”®ID',
  `executor_address` varchar(255) DEFAULT NULL COMMENT 'æ‰§è¡Œå™¨åœ°å€ï¼Œæœ¬æ¬¡æ‰§è¡Œçš„åœ°å€',
  `executor_handler` varchar(255) DEFAULT NULL COMMENT 'æ‰§è¡Œå™¨ä»»åŠ¡handler',
  `executor_param` varchar(512) DEFAULT NULL COMMENT 'æ‰§è¡Œå™¨ä»»åŠ¡å‚æ•°',
  `executor_sharding_param` varchar(20) DEFAULT NULL COMMENT 'æ‰§è¡Œå™¨ä»»åŠ¡åˆ†ç‰‡å‚æ•°ï¼Œæ ¼å¼å¦‚ 1/2',
  `executor_fail_retry_count` int NOT NULL DEFAULT '0' COMMENT 'å¤±è´¥é‡è¯•æ¬¡æ•°',
  `trigger_time` datetime DEFAULT NULL COMMENT 'è°ƒåº¦-æ—¶é—´',
  `trigger_code` int NOT NULL COMMENT 'è°ƒåº¦-ç»“æœ',
  `trigger_msg` text COMMENT 'è°ƒåº¦-æ—¥å¿—',
  `handle_time` datetime DEFAULT NULL COMMENT 'æ‰§è¡Œ-æ—¶é—´',
  `handle_code` int NOT NULL COMMENT 'æ‰§è¡Œ-çŠ¶æ€',
  `handle_msg` text COMMENT 'æ‰§è¡Œ-æ—¥å¿—',
  `alarm_status` tinyint NOT NULL DEFAULT '0' COMMENT 'å‘Šè­¦çŠ¶æ€ï¼š0-é»˜è®¤ã€1-æ— éœ€å‘Šè­¦ã€2-å‘Šè­¦æˆåŠŸã€3-å‘Šè­¦å¤±è´¥',
  PRIMARY KEY (`id`),
  KEY `I_trigger_time` (`trigger_time`),
  KEY `I_handle_code` (`handle_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xxl_job_log`
--

LOCK TABLES `xxl_job_log` WRITE;
/*!40000 ALTER TABLE `xxl_job_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `xxl_job_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xxl_job_log_report`
--

DROP TABLE IF EXISTS `xxl_job_log_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `xxl_job_log_report` (
  `id` int NOT NULL AUTO_INCREMENT,
  `trigger_day` datetime DEFAULT NULL COMMENT 'è°ƒåº¦-æ—¶é—´',
  `running_count` int NOT NULL DEFAULT '0' COMMENT 'è¿è¡Œä¸­-æ—¥å¿—æ•°é‡',
  `suc_count` int NOT NULL DEFAULT '0' COMMENT 'æ‰§è¡ŒæˆåŠŸ-æ—¥å¿—æ•°é‡',
  `fail_count` int NOT NULL DEFAULT '0' COMMENT 'æ‰§è¡Œå¤±è´¥-æ—¥å¿—æ•°é‡',
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `i_trigger_day` (`trigger_day`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xxl_job_log_report`
--

LOCK TABLES `xxl_job_log_report` WRITE;
/*!40000 ALTER TABLE `xxl_job_log_report` DISABLE KEYS */;
INSERT INTO `xxl_job_log_report` VALUES (1,'2024-08-06 00:00:00',0,0,0,NULL),(2,'2024-08-05 00:00:00',0,0,0,NULL),(3,'2024-08-04 00:00:00',0,0,0,NULL);
/*!40000 ALTER TABLE `xxl_job_log_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xxl_job_logglue`
--

DROP TABLE IF EXISTS `xxl_job_logglue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `xxl_job_logglue` (
  `id` int NOT NULL AUTO_INCREMENT,
  `job_id` int NOT NULL COMMENT 'ä»»åŠ¡ï¼Œä¸»é”®ID',
  `glue_type` varchar(50) DEFAULT NULL COMMENT 'GLUEç±»å‹',
  `glue_source` mediumtext COMMENT 'GLUEæºä»£ç ',
  `glue_remark` varchar(128) NOT NULL COMMENT 'GLUEå¤‡æ³¨',
  `add_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xxl_job_logglue`
--

LOCK TABLES `xxl_job_logglue` WRITE;
/*!40000 ALTER TABLE `xxl_job_logglue` DISABLE KEYS */;
/*!40000 ALTER TABLE `xxl_job_logglue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xxl_job_registry`
--

DROP TABLE IF EXISTS `xxl_job_registry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `xxl_job_registry` (
  `id` int NOT NULL AUTO_INCREMENT,
  `registry_group` varchar(50) NOT NULL,
  `registry_key` varchar(255) NOT NULL,
  `registry_value` varchar(255) NOT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `i_g_k_v` (`registry_group`,`registry_key`,`registry_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xxl_job_registry`
--

LOCK TABLES `xxl_job_registry` WRITE;
/*!40000 ALTER TABLE `xxl_job_registry` DISABLE KEYS */;
/*!40000 ALTER TABLE `xxl_job_registry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xxl_job_user`
--

DROP TABLE IF EXISTS `xxl_job_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `xxl_job_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT 'è´¦å·',
  `password` varchar(50) NOT NULL COMMENT 'å¯†ç ',
  `role` tinyint NOT NULL COMMENT 'è§’è‰²ï¼š0-æ™®é€šç”¨æˆ·ã€1-ç®¡ç†å‘˜',
  `permission` varchar(255) DEFAULT NULL COMMENT 'æƒé™ï¼šæ‰§è¡Œå™¨IDåˆ—è¡¨ï¼Œå¤šä¸ªé€—å·åˆ†å‰²',
  PRIMARY KEY (`id`),
  UNIQUE KEY `i_username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xxl_job_user`
--

LOCK TABLES `xxl_job_user` WRITE;
/*!40000 ALTER TABLE `xxl_job_user` DISABLE KEYS */;
INSERT INTO `xxl_job_user` VALUES (1,'admin','e10adc3949ba59abbe56e057f20f883e',1,NULL);
/*!40000 ALTER TABLE `xxl_job_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'lyf_test'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-06 15:39:46
