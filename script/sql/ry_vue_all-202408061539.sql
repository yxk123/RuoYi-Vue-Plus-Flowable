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
  `bean_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'bean名称',
  `method` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '方法名',
  `param` varchar(1000) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '参数',
  `remark` text COLLATE utf8mb4_general_ci COMMENT '备注',
  `create_by` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
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
  `business_key` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '业务ID',
  `process_instance_id` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '流程实例ID',
  `status` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '状态',
  `table_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '表名',
  `suspended_reason` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '挂起流程原因',
  `create_by` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
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
  `category_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '分类名称',
  `category_code` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '分类编码',
  `parent_id` bigint DEFAULT NULL COMMENT '父级id',
  `order_num` bigint DEFAULT NULL COMMENT '排序',
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
INSERT INTO `act_category` VALUES (1820651814552813569,'告警流程','alarm',0,1,'admin','2024-08-06 10:43:13','admin','2024-08-06 10:43:13');
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
  `remark` varchar(300) DEFAULT NULL COMMENT '备注',
  `condition_json` text COMMENT '条件',
  `process_definition_key` varchar(255) DEFAULT NULL COMMENT '流程定义key',
  `create_by` varchar(100) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(100) DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='网关条件对象';
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
  `process_definition_id` varchar(255) DEFAULT NULL COMMENT '流程定义id',
  `sequence_id` varchar(255) DEFAULT NULL COMMENT '连线id',
  `gateway_condition_id` bigint DEFAULT NULL COMMENT '网关条件id',
  `create_by` varchar(100) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(100) DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='网关条件关联网关节点对象';
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
INSERT INTO `act_ge_bytearray` VALUES ('1820662234730676227',1,'请假流程（普通流程）-leave1.bpmn20.xml','1820662234730676226',_binary '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:bioc=\"http://bpmn.io/schema/bpmn/biocolor/1.0\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:di=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"leave1\" name=\"请假流程（普通流程）\">\n    <startEvent id=\"startNode1\" name=\"开始\">\n      <outgoing>Flow_1f4xioj</outgoing>\n    </startEvent>\n    <userTask id=\"Activity_14633hx\" name=\"申请人\" flowable:formKey=\"static:1\">\n      <incoming>Flow_1f4xioj</incoming>\n      <outgoing>Flow_0cy98fl</outgoing>\n    </userTask>\n    <sequenceFlow id=\"Flow_1f4xioj\" sourceRef=\"startNode1\" targetRef=\"Activity_14633hx\" />\n    <userTask id=\"Activity_0lym9dc\" name=\"组长\" flowable:candidateUsers=\"1,3\">\n      <extensionElements />\n      <incoming>Flow_0cy98fl</incoming>\n      <outgoing>Flow_1o16t5v</outgoing>\n    </userTask>\n    <sequenceFlow id=\"Flow_0cy98fl\" sourceRef=\"Activity_14633hx\" targetRef=\"Activity_0lym9dc\" />\n    <userTask id=\"Activity_1j25s1c\" name=\"部门领导\" flowable:assignee=\"1\">\n      <extensionElements />\n      <incoming>Flow_1o16t5v</incoming>\n      <outgoing>Flow_0s1t2f2</outgoing>\n    </userTask>\n    <sequenceFlow id=\"Flow_1o16t5v\" sourceRef=\"Activity_0lym9dc\" targetRef=\"Activity_1j25s1c\" />\n    <endEvent id=\"Event_1jib7oq\">\n      <incoming>Flow_0s1t2f2</incoming>\n    </endEvent>\n    <sequenceFlow id=\"Flow_0s1t2f2\" sourceRef=\"Activity_1j25s1c\" targetRef=\"Event_1jib7oq\" />\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_flow\">\n    <bpmndi:BPMNPlane id=\"BPMNPlane_flow\" bpmnElement=\"leave1\">\n      <bpmndi:BPMNShape id=\"BPMNShape_startNode1\" bpmnElement=\"startNode1\" bioc:stroke=\"\">\n        <omgdc:Bounds x=\"240\" y=\"200\" width=\"30\" height=\"30\" />\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds x=\"242\" y=\"237\" width=\"23\" height=\"14\" />\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_14633hx_di\" bpmnElement=\"Activity_14633hx\">\n        <omgdc:Bounds x=\"320\" y=\"175\" width=\"100\" height=\"80\" />\n        <bpmndi:BPMNLabel />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_0lym9dc_di\" bpmnElement=\"Activity_0lym9dc\">\n        <omgdc:Bounds x=\"470\" y=\"175\" width=\"100\" height=\"80\" />\n        <bpmndi:BPMNLabel />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_1j25s1c_di\" bpmnElement=\"Activity_1j25s1c\">\n        <omgdc:Bounds x=\"620\" y=\"175\" width=\"100\" height=\"80\" />\n        <bpmndi:BPMNLabel />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Event_1jib7oq_di\" bpmnElement=\"Event_1jib7oq\">\n        <omgdc:Bounds x=\"772\" y=\"197\" width=\"36\" height=\"36\" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge id=\"Flow_1f4xioj_di\" bpmnElement=\"Flow_1f4xioj\">\n        <di:waypoint x=\"270\" y=\"215\" />\n        <di:waypoint x=\"320\" y=\"215\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_0cy98fl_di\" bpmnElement=\"Flow_0cy98fl\">\n        <di:waypoint x=\"420\" y=\"215\" />\n        <di:waypoint x=\"470\" y=\"215\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_1o16t5v_di\" bpmnElement=\"Flow_1o16t5v\">\n        <di:waypoint x=\"570\" y=\"215\" />\n        <di:waypoint x=\"620\" y=\"215\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_0s1t2f2_di\" bpmnElement=\"Flow_0s1t2f2\">\n        <di:waypoint x=\"720\" y=\"215\" />\n        <di:waypoint x=\"772\" y=\"215\" />\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('1820662237045932033',1,'请假流程（普通流程）-leave1.leave1.png','1820662234730676226',_binary '�PNG\r\n\Z\n\0\0\0\rIHDR\0\02\0\0	\0\0\0Oj\0\0\Z�IDATx^\�\�	�e�7\�{�\�\'V��{\�z\�}W\�Q�RT\\H&�J$H\�eS7(\�V	^��\�--�\�-P\�ܐ�!ȾC$�J�,�\�\�7=u�g�\�\�\�o~��\�\�9}�;3O�<oo\�_�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�P\���\�\���\��s��\�g�!\�\�\��ĢE�\�\\�p\�ͿOW������6�c]\�QeS\��\�M�X�|y�jժb\�\�\�2Ή\�{��\�>�\��\�Fa�\�ߨ�\�\�\�G]Iɱ�\0\�سoJ\�7+�,[�lE\�\\\��u��J\'\�J\�HNu@G\�\�\�l���;���#ͿQ��t����\�TW\0tT�\�\�|���K�=��.RWiE]Iɥ�\0\�~��\�[V\�x\�1\�\�3�o��>kN\'\�\\\Zu�Vԕ�j#�\�\0\�Oc\�\�wW�vPq�_�6,\�X<ל^ƞ\\\Zu�Vԕ�j#�\�\0\�Ocp\�\�G4un_z҈\�e\�ɥ1PWiE]��6�K]\�Q�4;\�\rA�x�9��=�4\�*��+u\�Fr�+\0:��\�\�\�3\�ԉ\�\�\�ؓKc��Ҋ�RWm$����4i%�\�@]�u��\�H.u@G\�\�\�]�\rA�x�9��=�4\�*��+u\�Fr�+\0:��\�\���Ɉ��N<ל^ƞ\\\Zu�Vԕ�j#�\�\0\�Oc�\�W���MA<\�5���\'�\�@]�u��\�H.u@G\�\�Dn�\��A<֜N\�/�4\�*��+u\�Fr�+\0:��\�\��G�\��tDc�\�s#��1\'�\�@]�u��\�H.u@G=Yc��}\��1�)�\���\�\r�\\\Zu�Vԕ�j#�\�\0�\�\�\��G�e\�-,�8\�[#��fb��\�\�\�\�O.���J+\�J]��\\\�\n��\Z�1x���k���\�\\\Zu�V\�\�Ȩ�\�O.u@G�\�\��Wsm�\�6\�\'�\'�\�@]�u5z\�\��%����Fk�o\�O5\��I�ɥ1PWiE]�=\��I�ɥ�\0\�\�\Z��\�\��������\�RWc5mڴM�L��\�����_���\�\�e�5_\�\�k�\�1�o\��\��1H+�4\�*��+i#�\�\�S5u\�\�mˁɼ2�\�Z�ML?/^ߜ\'\0c�1H+�4\�*��+i#�\�U�\�\�V\�@d\�(��dI̯�\0��AZɥ1PWiE]Iɥ��̴i\�68�|<\��\�\�Ŝ9s��/���\���+W!�\�\�\�x<\�5_\��\���\�RnS�\��\�\���q\�w�!��\�\�_���Y�fU��3g>����?P>v�\�ٳ�s�\�\�[4_�3�AZɥ1PWiE]Iɥ�֥\���:u\�\�����\�裏.n��\�j\�ү�>^�oh.�\�4�\rl\�\�\�\�&��z\�t\�A��1cFq\�QGK�,u�I<\�\�뮏\�\�^7\�\�n\�5\�#�AZɥ1PWiE]Iɥ�֦��{�;z�vXq\�m�\r�<E\���Oc0s[,���F���\�\�ٳW\�\�\�\�\�?�x�\�ǛےQ\�t1�\�{\��\�{\�q\������\�Ή\� �\�\��������\�RW�Ys$fhGQN<\�\�f˰^b~��3�92�r\�𠣞vڜ\�w߽8�䓋\�{��\�\�K�.^?mڴ�r�È\� �\�\��������\�RWMq\�J\�\�dӧO/.�\�\�f��A\�|c�=��\�\\3�r�\�\�\�\���f\�*���\�\�\�bLb>3f\�xxppp\�\�\�r�1H+�4\�*��+i#�\�UӚ���Ĵ5��\��{�\�\�\�\�l\�H\�̙3�\�˗7�\�%\�7}�\�\'O��Ms�]�1H+�4\�*��+i#�\�U�5�X~�T�t\�I͖�����2��53ld/^�1�\�PGb�\��>�\�.�\�;iҤ-�\�\�2�AZɥ1PWiE]Iɥ�zM\����� <5n\0���n@�\����z衫⚖6͟?�\����S�\�\�2�AZɥ1PWiE]Iɥ�jq\�E\�)e\�{w��*�\�{�Y�g�\0�8\�S�����\�\��~\��g̘qO�qٺ�]�1H+�4\�*��+i#�\�U�<̫\�y/!�\�sTf^s�̔�\��\���g\�2y<�w\�y\���s�\�\�U\Z���Kc��Ҋ��6�K]����\�\�\�\�\�\� b��\�\�b�=�ձ^\�u2�x\�\�\�\�\�n}N\���\�\�\�N\�M�4i\�溤�\�\0�U\�#\�Ǜ4i%\�\�@]u3\�J\�H\�uU맾\�\�w�q�\�D�\�\�fvl�+��c�=\����:��h\�!�r\�����溤�g#�\�\r�\� ��\���nF]II��j�\�W��\�t��\���o�\�*�߳\�G4\�\�\�\�ٳ\��\�\�jg�y\�\�)���ڳ\\\�\\c�VRo\�U7�����^W�~\�k\�ԩ\�\�/�\�\�\����\�\�\�\�ջ�@f8\��U7\�xcs;Ъk��\�\�rsas]R2ʆ{\�\r�\� ��\��RO\�QW\�FR��\�(u5��ʯ�֏�wO\�\�\�Y\�[� \'3g\�|\�\��{s;Ъ�+W>Xn\\\�h�KJF\�`7Sm�Sn\�9\�\�\��\�r\�%�\�\���Ǜ��)��\�\����\��Qꨙ\�\�\�\�_^<�\��\�\��V�\Zz���ǈi\�\�\�o�۰\�\�\�\�a�K9\�j�ur\�W�ۥ�Ny\�a\��\��-\�\�\�\�<�\�\�\�~�mQ\�Vs�Ȳeˊ\�o�}���s\�W�xl<�z]\�F��f���Q�<\�=ES,�^��S�>\��\�\0\�y睋G}��hU��F\�v2\���\�\�V[mU�\�7���衇�=\�������~0\�<��|�bŊ\�s�\�O{\�ӊ%K��xn�\���t5)\�\�\�\�\�O��\�7�Q\rF\�\�wqӐȻ\�\��\�?�\�i��\�\�\�\�~\�Pc\�\�\�>\��������\�ߧ�����m\�;\��\�j\�;Kb�y�<}�\��:\�j���خ�\�,.�\�\�b��\����vکx\�{\�3l\�\�\�^���\�/����\">й�6\�\�����\�g>3l=f͚UL�6m\�t�&M*^\��\�MȠ��\�\�%\�\�S4\�\�{\�\�f\�dd\�\�wt�\��\�s\�=\�O\�\����$z�F\�!�Ї>4\��������\�?_}\�l\Z˿A\�g<��룾�\�/5�\�\\\�t\�y\�s�c�=v\�2\"�\�_b/b�7��\�D\'\�=��\�S\�u5Zb@\�׼���⋫=\�/x����\�\�N\Z6}�{\�\�^6\�\�W�\�)�\�\�[G\�;Ũ��%-�\��}y\�\�X\r.\�\���{\�w\��׿��&v�\�v(��\��P\rn&O�\\\�PU���-\\���\�?8l�\�~\����L<5��W��\�\�Q�掝H\���c�\�\�)��R\rʛӎGR��\�(u5��\�\�G��x\�M�\��Fd��\�{`�\�g�ꪫ.�ҽkd�5�\�n֕�K��}\�k�~�A\�\\P}��\�}��\���=l�?��\�\�\�\���\�|b�шA\�>\�������\���j\�j\�N\�A\�j�|\��_-��\�?VM\��\��\�E/z\�\�sO6��\�׾V�fm��u5\�\�`5&qTx޼y\� \�[n�2\�\���\�д�ӟ�m�\�v\�\�c�۴�\�\�\�;��\���n�vڔ\rkU{�o�y�={\�\�P�}\�\�\�\�;ib\�|�\�ۮ�\�\'?Y�\��?�̶�z]\����)��&·�\��k\���e\���S�sײ\�^\��-\�,>\��\�z�~\�_\\\�\�\�\�q�%N�\�\�HK\�!�A\��\\5\0\�h\����\�o~s5Ms�\�~\��\�\�RRo�XW\�\�\�x�M6�\ZЗ��\�\�w\�Q����\�U�\Zu \����\�G?\Z\�\\�ʨ�\�\���\�\"n\�뮻V_�ь�\�GQ��;\��\rlz\�;��S\�b\�G\�~�\�?�\�\�Y���\�o��\�/�mY���>\�\�Ǯ�\�\�\�s\�->�\��Xf\�I��j�ԗ��\�C�\�\���=\�\�\�\�|�\�Z7ؽ&�1-7\�p\�:�\�\��8\�r\�\�w\�{\�\�\�;\�jOf݈n�\�6\�\�ٳG̿\�\�>\��\���.��\�D\'\�Ơ�u\�L4�\�pFs\Z�\�ck;\"_����x\�3�Y5��\�\'Ġ9��;\�\�u5�\�\rG�\��/oy\�[���\�U�D-\�\��\��\�E\�Q/\�\�\'�xb_�8*G��/_^m\�\�\����\�\'\�@&j*�i�\rdb�Pǎ�H\\\�W�Z�u\�l�ͪSٚ\�m3�\�U����\�sd��Pn\���1c\�\�涠\�r\�*7,\��o^�7ץ�ƻ1XWb�\��2���ũ\�L\�\�\�|�\�[ɉ�-1}s�\�\�\�z��7N?K\�\�\�Jc\�dR��6{��1��q��\���~\�B\�z \�)ĵ���\�\�՝��\�L9\�j\�3gN\�O}�\Z�Ʃ]q\�\�u\�]7t�L<��\�\�Q7�d��\�%Qo\�}\�{�A\���@5����M\�\�D�\��\�ղ>�\�\�\r�c\�M7ݴ:R�\��?}\�њ��K]�\�}}\�z\�\��6\��\�\�>�\�\�D\�@f\�\��\�k��n\Z�\�\�\�Ν�\�r\�rns�j\"\Z��%no��S\�8\���i\�\�e�]V\�\�.\�y�\\b\�6��\�\�\�\�\��>\�\�G\�\�-�\�+�4)\�U3q*Y\���&0\Z\�ث��#2uz2Q�q�w\�i�9\�T��ƞ3\�<�:�\�\�\�\�\�\��\�U5�\�[T_c`��\�|�z�\�#2���b䬳\�*>\�Twʋ�L\�< v\�\�@��\�bY1\0��O\�%���T�\\\�*nV����q3��\�\�Ĭ�\�j�+��\�v\�m��\�\��\�\�{��Mؠ\��\�VnX��<y\�\�\�u誉h֖h{\�L\�{D&.�\�8?.��\����\�o\�\��8�=\��\�M@d뭷���T.\�Υ1H����;C\��ŭ�\�\�£�>z\�@&8+W�z�w {\�\�fq�v\�Y\�M%R��\Z{\�]l7\�# 1��Aų�\��j\0G\�\�oL�T2�/�\�ʸ�\�\�WG�\�Ν[]/���ӥ\�&&�\�֡�:t[f�\r�|�W\"b�0b�=���\�6�=\�\�\�O>��\�Faz\�\�\�?�ܰ�\�\\v�MDc\�o\�Mm�\�w�F\"�\�\�i\��h(ⴀhz��;�\�\0��\�\��xEu�w\�5�\\\Z�\�\�9�̟?��� \�>\�\�_��jP\�:��t�����\��\�ݠ\�[\�^z\�\�5q�\�����+��1��u|Hs9)E]�=q1\�P$��#21���L \�\�ahۢ8e�\�\�q\�8�\�\�\0���\�\�~\��\�UGo��\�jP�g�\�\�@:�Kq3�\��\��8�\�\�D\��ַ��f��K]\�&O��M=��\�$\�2���ֆN+�\�i�#��\�Mb\�\�ӧ?x\�\�W7�\r\�9\�sl�aY\�i.�\�&�1\�7\�D\�|�Nܭ\'�\�)bq����\�#�,\�\��7U\rG=]����\�9�H�\�M+\��6�\�\�\��\\W�E�U_�\�\�\�騧��f�\�E\�ь�\��)E]�=qc��y\����L\\7Ӝ\�\���}u-K\�\�\�awU�o.ћz@ۨ\�\�R?�\�\�\�\�\�ub�\��կ~5\�\�J.uի|�_R$;\�f+ЪX^\�ј%\�u27u\�\�m\�7��\�N0\�\�7\�|R�Q�3ǽ#\�\��~?��\�麐\\\Z��\�j����5\�J\�ՆMlsF��um�F�~}\�\�<�Jr��^e�U�~�x=��\�\�\�C,�g\�x�Gs݀��\�\�\�ӧO`C�Ys$\�2_j.+�4\�ɥ1PWiE]Iɥ����q�>\�hS̿\���X~s���H9\�y\�\�?��c�@\\ؿ暘�r<S\���\\\Zu�Vԕ��\\\�iڴi��\���\��8ů��L̷\\\�\��Xn,��N�Ff``\�Ճ���͘1\�\�\�;\�~?g��n�ܹs\��\�ʜ\�i\�;\'\Z���Kc��Ҋ��6�K]��|�ߢLܩt\�\�LܕnC��\��Y��-�\�l\�\�V\�\�a\�N;\�t��|ł��\�kn]�b\�C\�v\���\��ƥK�^t\�	\'\�\�k��N)�]\�\�t�\�u\���\\\Zu�Vԕ��\\\�jm\�Aƿ\�f\"qA��\�\�,^߸��\Z\�\�\�\�\0P�4i\�\�\�b\�����\�\�z6N\�\��5�ό隯͙\� �\�\��������\�RW\�2\��\��f��3\�y/q7��\"��\�5�\�T��\�r�\�\�Ih\�J.���J+\�J\�H.u\�d⚕57\0h@�\�-�3gNq\�\�W���\�\r\�5~�\�\��}\�\�g\�kc~1_\�\�\0��\� �\�\��������\�RW�Zsk\�ϙY\�,q�e�\��1H+�4\�*��+i#�\�\�S�YWD\�Y=\�\0e]�\�\�\�\�\�`4i%�\�@]�u%m$��\Z�iӦmZLv��\�\�27�yx͠%�\�\�\�<�cLߜ\0\�Ac�Vri\�UZQW\�Fr�+\0:Jc�Vri\�UZQW\�Fr�+\0:Jc�Vri\�UZQW\�Fr�+\0:Jc�Vri\�UZQW\�Fr�+\0:Jc�Vri\�UZQW\�Fr�+\0:Jc�Vri\�UZQW\�Fr�+\0:Jc�Vri\�UZQW\�Fr�+\0:Jc�Vri\�UZQW\�Fr�+\0:Jc�Vri\�UZQW\�Fr�+\0:Jc�Vri\�UZQW\�Fr�+\0:Jc�Vri\�UZQW\�Fr�+\0:Jc�Vri\�UZQW\�Fr�+\0:Jc�Vri\�UZQW\�Fr�+\0:Jc�Vri\�UZQW\�Fr�+\0:Jc�Vri\�UZQW\�Fr�+\0:Jc�Vri\�UZQW\�Fr�+\0:Jc�Vri\�UZQW\�Fr�+\0:j��O�Z�j\���ʿÝec\�H\�o\�E\�*��+i#9\�\0�hѢ;�/_>\�MJ\�?�\�r\�ܲ1���7\�\"u�Nԕ���\�\n��Z�p\�g�}\��˖-[aO\�Ĥ��/��\�S6��پ�7\�\"u5\�QW\�Fr�+\0:,ތb\�Z�\�qγ�{\�\�������\���w������6�e]\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�F\���0f�rh�y\0\0\0\0IEND�B`�',1),('1820663301493178370',1,'source',NULL,_binary '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:bioc=\"http://bpmn.io/schema/bpmn/biocolor/1.0\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:di=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"leave1\" name=\"请假流程（普通流程）\">\n    <startEvent id=\"startNode1\" name=\"开始\">\n      <outgoing>Flow_1f4xioj</outgoing>\n    </startEvent>\n    <userTask id=\"Activity_14633hx\" name=\"申请人\" flowable:formKey=\"static:1\">\n      <incoming>Flow_1f4xioj</incoming>\n      <outgoing>Flow_0cy98fl</outgoing>\n    </userTask>\n    <sequenceFlow id=\"Flow_1f4xioj\" sourceRef=\"startNode1\" targetRef=\"Activity_14633hx\" />\n    <userTask id=\"Activity_0lym9dc\" name=\"组长\" flowable:candidateUsers=\"1,3\">\n      <extensionElements />\n      <incoming>Flow_0cy98fl</incoming>\n      <outgoing>Flow_1o16t5v</outgoing>\n    </userTask>\n    <sequenceFlow id=\"Flow_0cy98fl\" sourceRef=\"Activity_14633hx\" targetRef=\"Activity_0lym9dc\" />\n    <userTask id=\"Activity_1j25s1c\" name=\"部门领导\" flowable:assignee=\"1\">\n      <extensionElements />\n      <incoming>Flow_1o16t5v</incoming>\n      <outgoing>Flow_0s1t2f2</outgoing>\n    </userTask>\n    <sequenceFlow id=\"Flow_1o16t5v\" sourceRef=\"Activity_0lym9dc\" targetRef=\"Activity_1j25s1c\" />\n    <endEvent id=\"Event_1jib7oq\">\n      <incoming>Flow_0s1t2f2</incoming>\n    </endEvent>\n    <sequenceFlow id=\"Flow_0s1t2f2\" sourceRef=\"Activity_1j25s1c\" targetRef=\"Event_1jib7oq\" />\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_flow\">\n    <bpmndi:BPMNPlane id=\"BPMNPlane_flow\" bpmnElement=\"leave1\">\n      <bpmndi:BPMNShape id=\"BPMNShape_startNode1\" bpmnElement=\"startNode1\" bioc:stroke=\"\">\n        <omgdc:Bounds x=\"240\" y=\"200\" width=\"30\" height=\"30\" />\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds x=\"242\" y=\"237\" width=\"23\" height=\"14\" />\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_14633hx_di\" bpmnElement=\"Activity_14633hx\">\n        <omgdc:Bounds x=\"320\" y=\"175\" width=\"100\" height=\"80\" />\n        <bpmndi:BPMNLabel />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_0lym9dc_di\" bpmnElement=\"Activity_0lym9dc\">\n        <omgdc:Bounds x=\"470\" y=\"175\" width=\"100\" height=\"80\" />\n        <bpmndi:BPMNLabel />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_1j25s1c_di\" bpmnElement=\"Activity_1j25s1c\">\n        <omgdc:Bounds x=\"620\" y=\"175\" width=\"100\" height=\"80\" />\n        <bpmndi:BPMNLabel />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Event_1jib7oq_di\" bpmnElement=\"Event_1jib7oq\">\n        <omgdc:Bounds x=\"772\" y=\"197\" width=\"36\" height=\"36\" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge id=\"Flow_1f4xioj_di\" bpmnElement=\"Flow_1f4xioj\">\n        <di:waypoint x=\"270\" y=\"215\" />\n        <di:waypoint x=\"320\" y=\"215\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_0cy98fl_di\" bpmnElement=\"Flow_0cy98fl\">\n        <di:waypoint x=\"420\" y=\"215\" />\n        <di:waypoint x=\"470\" y=\"215\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_1o16t5v_di\" bpmnElement=\"Flow_1o16t5v\">\n        <di:waypoint x=\"570\" y=\"215\" />\n        <di:waypoint x=\"620\" y=\"215\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_0s1t2f2_di\" bpmnElement=\"Flow_0s1t2f2\">\n        <di:waypoint x=\"720\" y=\"215\" />\n        <di:waypoint x=\"772\" y=\"215\" />\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',NULL),('1820663301593841666',1,'source-extra',NULL,'',NULL),('1820703255543877635',1,'请假流程（排他网关）-leave2.bpmn20.xml','1820703255543877634',_binary '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:bioc=\"http://bpmn.io/schema/bpmn/biocolor/1.0\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:di=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"leave2\" name=\"请假流程（排他网关）\">\n    <startEvent id=\"startNode1\" name=\"开始\">\n      <outgoing>Flow_0q78air</outgoing>\n    </startEvent>\n    <userTask id=\"Activity_19b1i4j\" name=\"申请人\" flowable:formKey=\"static:1\">\n      <incoming>Flow_0q78air</incoming>\n      <outgoing>Flow_129vtbe</outgoing>\n    </userTask>\n    <sequenceFlow id=\"Flow_0q78air\" sourceRef=\"startNode1\" targetRef=\"Activity_19b1i4j\" />\n    <userTask id=\"Activity_0r8rs5v\" name=\"组长\" default=\"Flow_1z12r58\" flowable:assignee=\"1\">\n      <extensionElements />\n      <incoming>Flow_129vtbe</incoming>\n      <outgoing>Flow_1z12r58</outgoing>\n      <outgoing>Flow_0bt4srq</outgoing>\n    </userTask>\n    <sequenceFlow id=\"Flow_129vtbe\" sourceRef=\"Activity_19b1i4j\" targetRef=\"Activity_0r8rs5v\" />\n    <userTask id=\"Activity_0iw78d3\" name=\"部门领导\" flowable:candidateGroups=\"1,2,3,4\">\n      <incoming>Flow_1z12r58</incoming>\n      <outgoing>Flow_0nj4k00</outgoing>\n    </userTask>\n    <userTask id=\"Activity_1ex621m\" name=\"总经理\" flowable:assignee=\"1\">\n      <extensionElements />\n      <incoming>Flow_0bt4srq</incoming>\n      <outgoing>Flow_0fo3v6j</outgoing>\n    </userTask>\n    <endEvent id=\"Event_1shlpsv\">\n      <incoming>Flow_0nj4k00</incoming>\n      <incoming>Flow_0fo3v6j</incoming>\n    </endEvent>\n    <sequenceFlow id=\"Flow_0nj4k00\" sourceRef=\"Activity_0iw78d3\" targetRef=\"Event_1shlpsv\" />\n    <sequenceFlow id=\"Flow_0fo3v6j\" sourceRef=\"Activity_1ex621m\" targetRef=\"Event_1shlpsv\" />\n    <sequenceFlow id=\"Flow_1z12r58\" sourceRef=\"Activity_0r8rs5v\" targetRef=\"Activity_0iw78d3\" />\n    <sequenceFlow id=\"Flow_0bt4srq\" sourceRef=\"Activity_0r8rs5v\" targetRef=\"Activity_1ex621m\">\n      <conditionExpression xsi:type=\"tFormalExpression\">${entity.leaveDays &gt; 2}</conditionExpression>\n    </sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_flow\">\n    <bpmndi:BPMNPlane id=\"BPMNPlane_flow\" bpmnElement=\"leave2\">\n      <bpmndi:BPMNShape id=\"BPMNShape_startNode1\" bpmnElement=\"startNode1\" bioc:stroke=\"\">\n        <omgdc:Bounds x=\"240\" y=\"200\" width=\"30\" height=\"30\" />\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds x=\"242\" y=\"237\" width=\"23\" height=\"14\" />\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_19b1i4j_di\" bpmnElement=\"Activity_19b1i4j\">\n        <omgdc:Bounds x=\"320\" y=\"175\" width=\"100\" height=\"80\" />\n        <bpmndi:BPMNLabel />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_0r8rs5v_di\" bpmnElement=\"Activity_0r8rs5v\">\n        <omgdc:Bounds x=\"470\" y=\"175\" width=\"100\" height=\"80\" />\n        <bpmndi:BPMNLabel />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_0iw78d3_di\" bpmnElement=\"Activity_0iw78d3\">\n        <omgdc:Bounds x=\"640\" y=\"100\" width=\"100\" height=\"80\" />\n        <bpmndi:BPMNLabel />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_1ex621m_di\" bpmnElement=\"Activity_1ex621m\">\n        <omgdc:Bounds x=\"640\" y=\"250\" width=\"100\" height=\"80\" />\n        <bpmndi:BPMNLabel />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Event_1shlpsv_di\" bpmnElement=\"Event_1shlpsv\">\n        <omgdc:Bounds x=\"802\" y=\"197\" width=\"36\" height=\"36\" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge id=\"Flow_0q78air_di\" bpmnElement=\"Flow_0q78air\">\n        <di:waypoint x=\"270\" y=\"215\" />\n        <di:waypoint x=\"320\" y=\"215\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_129vtbe_di\" bpmnElement=\"Flow_129vtbe\">\n        <di:waypoint x=\"420\" y=\"215\" />\n        <di:waypoint x=\"470\" y=\"215\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_0nj4k00_di\" bpmnElement=\"Flow_0nj4k00\">\n        <di:waypoint x=\"740\" y=\"140\" />\n        <di:waypoint x=\"771\" y=\"140\" />\n        <di:waypoint x=\"771\" y=\"215\" />\n        <di:waypoint x=\"802\" y=\"215\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_0fo3v6j_di\" bpmnElement=\"Flow_0fo3v6j\">\n        <di:waypoint x=\"740\" y=\"290\" />\n        <di:waypoint x=\"771\" y=\"290\" />\n        <di:waypoint x=\"771\" y=\"215\" />\n        <di:waypoint x=\"802\" y=\"215\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_1z12r58_di\" bpmnElement=\"Flow_1z12r58\">\n        <di:waypoint x=\"570\" y=\"215\" />\n        <di:waypoint x=\"605\" y=\"215\" />\n        <di:waypoint x=\"605\" y=\"140\" />\n        <di:waypoint x=\"640\" y=\"140\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_0bt4srq_di\" bpmnElement=\"Flow_0bt4srq\">\n        <di:waypoint x=\"570\" y=\"215\" />\n        <di:waypoint x=\"605\" y=\"215\" />\n        <di:waypoint x=\"605\" y=\"290\" />\n        <di:waypoint x=\"640\" y=\"290\" />\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('1820703257414537217',1,'请假流程（排他网关）-leave2.leave2.png','1820703255543877634',_binary '�PNG\r\n\Z\n\0\0\0\rIHDR\0\0P\0\0T\0\0\0*\�\0\0*(IDATx^\�\���u}7\�\��<�XZĂZl�`Q,��Q@�U� ɒp1� �\nZE�P\�m�HE{j)(��[�J�@x�(��@H a	HP\��>���}g��I��\�\�o�\�\�\�\�\�g��g�\�\�\�\�\�s�\��=\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0����h\�ܹ?�9s\�o�O��~�\�\�����2cƌ\�z{{?W�>\0\0@ \�\�taռ�E��e˖�_|QF8�\���\�_�3\�@\�\�\�5\0\0�\�{�r\�^6\�2\�\�\�\�[\\\rP���\0\0D>lϞ�ɯC5@-/_#\0\0 �|N\�\�K\��_�\�5\0\0�hw�z\�\�4\���\�\�k��N�>/+ד\�b�\0��\���.Y�f]}L�\�\�H^�o+ח�\�\0\0\0��3@=:�Җᩑ�/kY_�\0\0\�\�\0u\�u\'�N�\�\�\�\�e\�1@\0@`\�P�~~l\�\�\�H��\\_�\0\0f��\0\0\�\�\0���WN�\�\�\�\�e\�1@\0@`\�Psn�^\�\�\�H��\\_�\0\0\�\�\0\�\�»Ӭk�\�2<\�e��r}zP\0\0X;T\�÷�\�2@\�e\�z\�YP\0\0X[\�\�\�i\�\�g�PyY��e}rP\0\0\�\���K�n:�exj$ߖ\�)\�\'C�\n\0\0[\�\0�|y\�ӛ\�\�薡�L^\'�koT\�1@\0@`�\rP�\�봲\�\�yP\0\0\�`T;{�V�|\�\�\���\0\0 ���r(z�)Oڏ\n\0\0l��\�\�\0\0\0��b\�\0\0\0��b\�\0\0\0��b\�\0\0\0��b\�\0\0\0��b\�\0\0\0��b\�\0\0\0��b\�\0\0\0��b\�\0\0\0��b\�\0\0\0��b\�\0\0\0��b\�\0\0\0��b\�\0\0\0��b\�\0\0\0]�\�{\\WeL��d��\0\0tA5<�Y\� e��\0\0tA\�\0�\�A\�\0+(\0\0\�A�A)T��\0\0��\�ԃT���K��Y�f\���\�Ϧ\���~�\�\�ֽ�\�Ӓ%KZ#\�^\�\�>��\�\�r���҂Vy�F\�瞖e#\0\0f��n\rPyp\�f�m\�5\�\\��y\�4w\�\��\�I�&�w\�1s\�1\�zy��\�[\�[l�n�\�t\�G��\�߿Ξ{\�v\�z�j<\�I\'��>�\��|0M�2�ݜ\����\�\��\�\�<�<0M�8q�zcǎM\�|\�;Ӳe\�Z�\�p�|}F:e�\0@׍D�Z6\�M�n�.����:�T\�\�\�\�C\�\�[o�=\�\�\��w��^g�\�K3gά��\�\�\�jܸq\�\�.�\�\"\�W��\�\�\�\�я~t�\��\�\��M=@\�\�\�ަ<��\�o�\�J\r��)?\�\�g�=`ٕW^�>�\�϶�;\�\����K\0\0x\�F�Q]\�\�\�0\�T\�#�<RD\�=\�\\�6mZ=<͟?��\�\�O}\�S�\��\�g?K;\�s�\�}\�\�C\�;\�\��\�7\�X��\�\��M6\�$�?�ޛ�馛փһ\��\�t�\�\�x�ɓ\'׏�ood�]vI���\�<\�̖mwP\0\0P�Fuu�SC7���\�\�+�q\�i��\���\�C�\�\0u�\�\�{�\Z\�]|\�\��\�4P�P�<\�q\�\�\���\�\�i����\�r\�zo\�7�\�\�\���\�ە��\�\�\�{\�\�m\�\�\���\�_�\"}\�ck\�\�p\�\0\0\0��hTW785�\�\0u\�\r7�}\�\�7�\�}\�K��\�\'\�FmTzn�az\�\�\\_�!\�5j�饗�5@\�\�\�\��T�-Jo|\�\�\���\��\�\�Tޫt\�\�:@\�u6\�x\�\�V[\�y\�k^�_���l��\�!�\�v�3(\0\0(DjTGz�\�9\�\�\�g>\�z\�O>�.Z7gΜ�s�\�\�|h_�>�\�\�\�\0�\�o:묳\�a\�C�P=\�\�\�\�T�z\�E\r�x\��t�\�\���\�?\���\�\�\���\�\�{�?�\�?l\�;5\�1@\0@!R�ڍ\�\�k�M�\�k���\�ޛ�\�~��p\�´\�f�\�_:\�\�\�o���\�=P9�/�s\�uץ1cƤSO=��\�E)n�\�\�z�\�W\�k�����<p\�u\�]\��<X5�n\�\0\0\0�H�j7�\�ӧח%o\�\�\�Lf^\��\�Ճ\�\�_����\�y\�W3@\�|\�\�i�\�vK��\��\�+\�M�:�>j�\�ׯϳ:�\�\\\�N8��\�\�(\0\0&R�ڍ*_$\"_!/�\�@\�!*Pypy�\�|n>\�.�+\�|�|E���*�+\��O|b�m\\pA}�Ҽy\�\�a(_\�<o/��\�\��(�O��E�\�^>7+\����[\���\0\0��Q\�\�\0\�\�Oԗ0\�\�7>�6P���rݟ�\��\��J\�\�)\�n���\�\� ���ٳg\�/�\�\�;\�s�\�\�\�W\�ˏ����嶑�\n\0\0\n�\Z\�nP�%R�R\�-/�52\���f8\�\�\�\0\0\0�H�j�J�\'(\0\0(DjT\rP�b�\0�B�F\�\0+(\0\0(DjT\rP�b�\0�B�F\�\0+(\0\0(DjT\rP�b�\0�B�F\�\0+(\0\0(DjT\rP�b�\0�B�F\�\0+(\0\0(DjT\rP�b�\0�B�F\�\0+(\0\0(DjT\rP�b�\0�B�F\�\0+(\0\0(DjT\rP�b�\0�B�F\�\0+(\0\0(DjT\rP�b�\0�B�F\�\0+(\0\0(DjT\rP�b�\0�B�F\�\0+(\0\0(DjT\rP�b�\0�B�F\�\0+(\0\0(DjT\rP�b�\0�B�F\�\0+(\0\0(DjT\rP�b�`TH)�\�ܹs:s\�\�\�N�>��LF6\�\���3f<\�\�\���\�\��\�U\���\"5��\�T6\�ҽ\�ף|�FJ�� ��ɽ�j�ҢE�Ҳe\�Z�A�\�O��\�\��\�\�_�L\�@|�|�F#u\��D��H��*VP\0�\nyAn�\�\�d\�\�\�׷�j n-_�\�H]\�I���Ԩ\�t��^�Ǫ:]^�F#%R]\\>�J#�u\�f�&��8�VW�\Z\�|��A?F\�ϟ?���~�� 8��\�J7aY�\�U�D��H�j>?,\�\�\����\�\�\�7o޼\�\Z}����F�K\0�k�\�}\�\�4\���\�\�k��N�>/+ד\��\�턺��Hu�Q\�M{\�\�Q\�\��{�O��\�\�׆�,Z]X��l�\�,]�0ͺ��t\�\�_��,\�V�/CO~=\�\�h4RW���4�D�.h[;�/mirY0���\�e\�\�\�vB]\�J��Ҩ���m\�4�\�]wbK�\�H��\\_��H�n\'\�U�D�+�*�K\0\�\�N�;\�\�Ƕ4��\�\�\�\�e\�\�\�vB]\�J��Ҩ���m\Z\�X�\�\�vB]\�J��Ҩ���m\�4��\�he�\�H��\\_��H�n\'\�U�D�+�*�K\0\�\�N�;\�\�4��\�\�\�\�e\�\�\�vB]\�J��Ҩ���m\�4�O-�;ͺ\�\�-Mn^�o+ח�\'R�\�	u+�\�J�JD\����\�\�\�<|��-�n^V�\'�%R�\�	u+�\�J�JD\����\�\�._�\�\�|fK���\�\�Z֗!\'R�\�	u+�\�J�JD\�����\�]�daz\�\�[�\�F\�my�\�~2�Djt;��b%R]iT�H]ж�6�˗��9�鞫�nin\�\�u\�\�\Zt�H�n\'\�U�D�+�*�K\0\�6X����+���\'R�\�	u+�\�J�JD\���\r\�足w`e\�\�-O\�O�F�\�*V\"ՕF��\�%\0m�\�-�\�W�\�\��Djt;��b%R]iT�H]ж�\Z]\�^\"5��PW���4�D4�\�r\�ĉo��\�\�===�Z}�^\�\�*/\�?Ê��\�\�+n\�=�_>\0\�\�\�J�F�\�*V\"\�\�hjTYw���?~�\�\�\�V\�\�\�R�\�\�O\�\�/�!\�\�\�J�F�\�*V\"\�\�hhTY\�D�\�j\�ٮz~�2\r%�\�\�+����э�H�n\'\�U�D��\�ĕˠ\�\"\�\�ĉ\�\�\�\��~\�\�^)�\�?<�w\�y\�;\�H=\�PzꩧR��\�\�\�|{^��o~����\�\�m\��\�S�\�̙3w;\�\�s�9\�\���\����<�~C�2e\�\�:\�g�e�\�L�4i�\��k3�n�Djt;��b%R]ElT!Z]V\�g�\�\�\�\�\�<�L�0!�\�?H,���v\�\�\��\���A\�μ�r\��:�z\�X磌���c�9淓\'ONg�qF�\�[�ߚ�<߾\�~��|\�!�\�\���w)om�э�H�n\'\�U�D��h�*d�\�\Z���\�\�\�a\�\�OL�>�\��\�\�U\�\�ϏSQ�\�\�\�XGUї�?��ey\�\�̙3\�\�/�\\��*��\�?\�\�Cw\�A����\�\�\�c�M4���\�턺��Hu�Q��(u�\�5Oy�ѥ�^Z�*ɏW\�z4o�|.�:�zo�������8 ]q\�饗^*\�;ڒ\�\�?q\�\�\�\�\�+\�htc%R�\�	u+�\�*J�\n\�\"\�e>\'����I�&�_�\�We{�F\�\�͏\�4D\�\�(XGU\�	�?mڴ�{\���_��\�\��Ő\�Ǚ<y\�&Lد\�\�\�@�+�\Z\�N��X�TW\ZU(E�\��\�\�\�4\\\�SC~�\�=Qy�\�s\�y\�Ӕ)SҢE�\�\���\�Ǜ4i\�\�q\�\�\�Tns�\�\�\�J�F�\�*V\"\�U�FJݮ\��*�1\�\\v\�ee+2,\�v�\�B�\�簎��替���5�\�T=\�+�\�ϒ�cǾ�\�\�h�э�H�n\'\�U�D��n7�0�n\�\�M�\�/\�0��K\�R>7`-U��_\�NX�\�Y\ZN�\\rɒ	&\\Un4\�\�\�J�F�\�*V\"\�U�UL7\�2\�\�`\�!u�^m\�\�\�\�k>�om<\�ĕW^��|���^0�]�\�\'O��d\�\�\�\�\�9�V\Z\�X�\�\�vB]\�J��\�f�\n+\�ͺ��=�1�\�\�kꆼݦ�P\�\�\��e��\��\�[\��\�o\�\�G7\��t\�\�\�\�y�V\Z\�X�\�\�vB]\�J��\�f�\n+ӭ��0a\�ն_l/#�\��!o�i�z1?�\�k��o�y\��\�߿\�\�y\�T\�Ξ{\��\�رc7-�K$\�\�uUƔ\�K\Z\�X�\�\�F]�Δu�\�\�{�\��\�\�\�\�\�G�u\�w>\��\��g̘1м\�p\�V�\n�2u9~��%U/�7���{cp\�G\�tS\�~\��{�\\��\�9\�\�\�3\�8�|V\�wܬ���\�\�Iӛ\�*^�n���n4\�jt���\�\�4a�o�馟._�����\�~w�,�4i\�\�ͯ\�6�*tj8\�\�~��A���\�\�z?�\�[���\�\�z�\\��\�\�\��\�H�\�p\�\�\�\�#�1\�Mo��lx5��2�(u5�\�\\W?�\�\�{\�%\��Züy\�~{\�\'^8v\�\�?i~Mה\\7\�2\�\�\�\��r�A����q�\�\�^�uQy�Mϵ��yk��}\�k\�\�Ν[���\�^\�s[�\\\")߸�2�\�\�\�\�\�(�\�\�(H~=*\�?�\����s�\�+�\�>K�8\�/6��kD��rt\�p\�\� \�u��\�\�G\Z\�G��)\�\�7=\�G\�?��2e\�+��\�o\�\��a\�\�SO-�\�\\�\�%�\�\r{�\\WeL\�F\��nH\�>�l\�\�嗿�ez\�gZ��\�\'\�>\��-\�#dP���\Z�뮻\�ҥK\�\�-[ֿ��\�oY\�\�\�O\�\�w߀e�=\�؀�EN\�K_�\�XV���Β%K~{\�Yg\�1v\�\�-\�Z�\\\'\�2\�\�\�A\�$R\�\�卟G��)\�\�7=�g\�?�\�{\�\�\�~\��\�}`XU\�{�|#��\�\�\�\�~\�n�\�\��\�_�\�s\�\r��j\�\�w��\�˾\��o՟e��_�xq\�\�7r\�5פ׼\�5\�[ni��\�)_�њHu��|\���M_��\�\�!\��@\��\��\�?�N=\�\�\�\�{\�i�\�\�O,�^�|y\�q\�\�\�\Z�<n�\�A\�SN��N�Z�>��\�\�\�i\�\�q趲F���\�eJy�M\�\�\�w�E8\��ߍ\��\�<�\�\�1z\�@]�G\�C�\��vء��\�d�M\�n�\�V_6�\�k��������\�/}\�K��\�6\�lS�\��׿>�s\�9-\�ȹ�\�\�sW\�*o\�vF\���u5X\� \�\�\�;\�H�f\�Jozӛ�o;vl�\�\���\�X�\��o\����#�H\�n�mz\�GZ;b�M���^\\\�\�\��\�+����c�Rz���o\��\�{O\��^ak�\�\�A\�\'\�4\�\�4��t/S�\n\�!Gy\�#}\�\�\�\�{��\��\rnC�Fw\�\�\�i\�-�\��9S�\�zk��?�\�?�o~\�\��\���\��\�\�\'��&M�TO\���\�a\�#�\�J�;�\�ӆnX\�*o\�vF\�\0��\�W�\�\�_�\�_騣�J_�\�\�Fm\�\�\���~\��\�}�,Y\�\�QӨ��)\Zw\�1\�,�<Q��5,]�tN��D\��.\�뗯m�rݔˠۆ�.\�\�\��.\"��s��n8�\�\�\�]t\�E�\�1z�\�7h�\��\�\�M\��ɟ\�\�P\�\�o�>\��\�\�\�\�K���^޳�\�8\�a\�\�c�\��(�q\�\�\�Py���ڪ^�\�F\�w�\��)�h�\Z5uU&\�뭷^�ԧ>���\��<-\\��\�c\�\�\�����m\�*\�c>d�_�\�_\�6\Z\�B5\�U��ޞ{\�y\��\��\�K/�\�B\�[۳���WN�0\�\��7W\�c]2u\�x�lpj\�W�k�\�*|��9\�\�N\�ρ:�\�����\��!R��\�C�rTc\�\�{��x\�\�\�7����\�sϭ\�\Z4\Z\��v\�)�\�-�\�Ȯ�\�Zߞ\�{)o\�vF�\05\�\�L>\�\�/N{\�W�\�\�\�e+\���\�\�\r\�k_�\�z\�j\�YN\�\�\�7�\�N�VW\�{؇;\�{+��\�7��\�W�\�\�\�ݵ�)\�]���Q�N\rG]�jpj\�\�\�@\�P50�M�<�\�v.ͻ&T\�y�zcy�j�6-�\�h�\�\��˿����|��|^����.J\�x\�;�\�\\\�Ky�\�\�\�\�\�\�v\�m\�a~���9�5��Q�\�k�\�N;-}򓟬�\�\�ӧ\�{�\Z\��\�[\�P�\�&�|�\�C�:\�t\�\�w�<f䬬�ƌ\�U�\��\�=mN��.\�Yӆ�Q�Nu�.�\�\�\�Z?�\�\�Q�v\�+M\�\�\�s\�2�r\�\�#u\�ԩS\\����|�U�F7_&zU�\�}\�k_\�_�1@\�y\�i�}\���jܖ���\rPg�yf�\��?\\�\�>\�C�ڹ\��Hee�\�h��\�\�C\�\��\�7�����\�\n\�\�s\�J\�@5\�<@\�:\�z\�Ӄ>\�\�\�Q���ըªt�.\'L��A�\��K��Q7\�\�6\rO/\�\�U>W`-����\�r衇�^*\�֨\�\��\�X\�7\�\�\�s�\"5��1m�\�^\����\�g.��/k�\�c\�~�\�\�O~\�\�@\�d\�ޅ|��Ʋ��\�\�!}Q.�\�\�D��*�/[��_��y>�\�?�A\�\0����z�Y\�\05gΜ�\"�*�yO\�\�.V)�\�[�*�J7\�\�\��\�\�ߏ�!o�i�\n}�7�|\����\�+^)\�֠WN:餳�7�+\�m�f�\�<@�쳚\�ϟ�^\��\�՗1χ\�5\�@\�C\�\�a�\�|\�\�\�+�\����\�\�ó6\�|\��\�\�}��H�n\'\�\�s�\\r\�%\�\�z\�\�?�\�?\�s�\�yL\��x\�[ޒv\�e��\�&�կ~�6\�`����&N�X�����y�ʃ��)SZ�)�ꪛ�*�L7\�rܸq;5���Y�#�*oo��\���\�\�\�S>G`-5v\�\�wL�4i\��\�\�a��\�Ω\�X�\�v\�m�f�\�|�Jn\\\�\�\���\�\�|(\�7�\���\���\�\�}o����\�\�1����\�\�1r\�0��\�\�\�\�m�m��\�\�D\�ʙ1cF�5\n\�\�\�\�r{�\\O\�y\�{Zjd\�ҥ\�.h�\�h�TW\�lTae�]�\�\�oi0\'�xbق�����O��\�\rXˍ?~\�}\�\�\��E��\��7o\�e՛\�ck\��\�Dnt\�V\��\�\�z�!�\Z\�ND���&_��\\6Z���ݨ\�`�]�U��]\�^n2�<̑��\�4<���G�܀u��	\��4iҳkjOԊ=O�\�[nkm�66��9�\Z\�N��X�TW\�nTa0겧�\���a&���N�\�\�\�\�/��\�{�\�\�{\�%�\\rɒ�^X\"_0b\�9O���{�\Z4���\�턺��Hu�Q�R���8q\�z\�\�1\�\�\"\r\���\�^���ݼ�\�9똞���O�0\�\�ɓ\'?y\�7>\�\�\�DU\�-�:u\�y՛ɜ*W\�\�){m�э�H�n\'\�U�D���*��\�e\�<6����ۿ\'\�\�K/-[��\�\�k\�\�b{��\�X�\�K�Wo3\�\�s\�g�=\�\�{�O�>\���\�d\�\�\�\�U\�#K�x≹�gϾ�\�/�\�C��Zwq^m�T��htc%R�\�	u+�\�*J�\n\�\"\�e5\��e\���/\�\�\�\��\���F\�\�S\�^�\0jcǎݴz��\�\�\�si\�\�֦7��\�\�˧\�\�\���\�4���\�턺��Hu�Q��hu�\��\�\�?�/\'\�ʟה?~\�\�\�\�\��{�\�\�\�\�v\�m�\Z\Z\�X�\�\�vB]\�J���֨B�.\�9I+.,Q>\�\��w\�y\�;\�?�#\�w��\�\�\�|�a�\�r\��x�q�\�0D\Z\�X�\�\�vB]\�J���بB\�\\q�\��ω\�0��T9@�4���\�턺��Hu���rt\�h�\��Y�\�\�V\�\�A�U%�?-߿|L\0�@�+�\Z\�N��X�TW��Qe\�3�\�r\�ĉo��\�\�===�Z}�^\�\�*/��\�\��\�\��\�\�/�htc%R�\�	u+�\�j45��;\�%\0m\�\�\�J�F�\�*V\"ՕF��\�%\0m\�\�\�J�F�\�*V\"ՕF��\�%\0m\�\�\�J�F�\�*V\"ՕF��\�%\0m\�\�\�J�F�\�*V\"ՕF��\�%\0m\�\�\�J�F�\�*V\"ՕF��\�%\0m\�\�\�J�F�\�*V\"ՕF��\�%\0m\�\�\�J�F�\�*V\"ՕF��\�%\0m\�\�\�J�F�\�*V\"ՕF��\�%\0m\�\�\�J�F�\�*V\"ՕF��\�%\0m\�\�\�J�F�\�*V\"ՕF��\�%\0m\�\�\�J�F�\�*V\"ՕF��\�%\0m\�\�\�J�F�\�*V\"ՕF��\�%\0m\�\�\�J�F�\�*V\"ՕF��\�%\0m\�\�\�J�F�\�*V\"ՕF��\�%\0m\�\�\�J�F�\�*V\"\�U�F5�\�Gs\�\��\�̙3;}�\��\�$#�\�\��ʌ3\�\�\��\\����Hu	@p���ْ\�%�\�k4\Z��X�TW�\Z\�jx��j\�ӢE�Ҳe\�Z~o2�ɿ\������럩\�\�\�\�k4R\"\�%\0�\���\�8\�H\�:<V5\�\�\�h4RWq��\"5�y\�Sn\�\�ߙ�|���Wuzk�\Z��Hu	@p�\�	\rD�̟?j7�5I]\�I���Ԩ\�\�\��1�_�n��\��\�\�q\��Љ��\Z�\���\�͛7\���yx�����I\���ZW�\ZU��\�J75�T�\0���\��C]\�\����x\�\�=��\�4�kB�\��s��\�$d]EjT\�\�l\�\�sO\������f_��u\�\�yY��t��z��\�H�T�\0\0\�/R�\�\�\0�t\�\�4\�\�c\�]�u@\�|[��=(\0\0(DjT\���}i\�\�\�Ȃٗ��/C�\n\0\0\n�\Z\�v���;�epj$\�V�/C�\n\0\0\n�\Z\�v�Y??�epj$\�V�/C�\n\0\0\n�\ZUT��\0\0��Qmg�\�W\�+�F\�m\��2\��\0\0��Qmg��s\�\�Z�F\�m\��2\��\0\0��Qmg�zj\�\�i\�5\�n�\�|[��=(\0\0(DjT\��r��ܖ*/+ד\�b�\0�B�F��j�\�4\�\�3[��,\�ֲ�9(\0\0(DjTW7@-]�0=p\�\�-\�S#���Ny?ZP\0\0P�Ԩ�t�Z�<\�\�\�M\�\\ut\�\�T&��׵7�\��\0\0��Ql�Z\�^��\�ި\�c�\0�B�Fu����N+K�o�x\�~P\0\0P�Ԩ6@�CѫM�x\�~P\0\0P�Ԩ6@I\�b�\0�B�F\�\0+(\0\0(DjT\rP�b�\0�B�F\�\0+(\0\0(DjT\rP�b�\0�B�F\�\0+(\0\0(DjT\rP�b�\0�B�F\�\0+(\0\0(DjT\rP�b�\0�B�F\�\0+(\0\0(DjT\rP�b�\0�B�F\�\0+(\0\0(DjT\rP�b�\0�B�F\�\0+(\0\0(�D�Zm\�*c\�\�%T��\0\0�0�j\�Ɗ�r�2@Ŋ\n\0\0\n#Ѩ6\rP��P�b�\0�\�H4��P�R�X1@\0@a$\Z\�A�2\� m�z\�g����\�\�]w\�ղN#<\�@z\�\�\'[�/[��e\�h�\n\0\0\n�3]K�\�c�I��rJ��\�_��\�b��`���\�r<\���\�n�����:M�4�?\�|\�;ӬY�Z\�\�Y����,�\�;Z\�\�V\�\�g�S\�*\0\0�\�Ƹ)\�\�����׾\��\�\�g�M_�\�Roooz\�Z\�{�\�\�\�f�m�\�ϟ�\�?���~y���\�>�\��\�fΜY/\�\�a�\�{\��޴\�\�[\�/\�yӛޔ}\�іmt#\�\�\0\0\�\�\rN\r��\�~\��i\�=\�L\�W�\�\�o��馛�ɓ\'�w��\�i\�\�\�\�\�w\�}ӹ瞛~�\��\�7߼\�\�\���(����\�\�;\��nރ�뮻�3f\�\�\�\�\�g�}\�lP\�z\�[\�\�\�\\�\0\0t�\���H\�\�\'���:\�\�\�\�޴\�V[\rXv\�9\�\�\�[/\�\�Ni��6J�\�~{:�\�\�Ә1c\�M7ݔ>�я��\�\�+-Y���>y�\�{�\�9U;\�s}�ջ\�\������\�m-ϥ[1@\0@�npj�4@�zꩃP���\�eO<\�D�>}z�\�(N_�\�\�\�\Z��=\�\�s\���D�ꪫ\�=\�ܓ�\��/\�\�R\�s�\�0�\�&�\�\�g\�g-ϥ[1@\0@`����J\�{\��ROOO}\�^>?)�\�k^/\�=:\�\�#ӎ;\�\�\�?��\Z\�4\�K|\�\�?\�/�\�\��\��>�\���\�O�\��1`\�g�\�\�\\�\0\0e�Z�|y�\����\��\�C\�6\�l�n�\��\�G}t}{c\�<\�\�\�yRy(ʗ-\�CR>\'*\�Q*;�qT�\�D�\�9T�=Poy\�[\�=U\�}�\0\0e�\�{�N;\�\���|���M��~򓟤K.��\�۔\�͙3�^7�����\�;\�\�җ��\�z�\��hPK�.\�?�/�\�\��~0m�\�v\�N��\�׼*_\��\�\0\0a�z衇\�9\�w\�}\�� \�\�m\��\�7\�\"\�\��P\��\�[n�N:\�4u\�\��C\�\�yO�<���\�\�o_�u\�W�?�\�?����\�:�����ρ\�v\�m\�g>\��s�\�\�6\�1@\0@`�\�t\�Ai\�7���\r7\�p\�s��\�[\�\�6�/:��\�=MO>�d\�\�b�\0���\rP\�zP\0\0�*VP\0\0�*VP\0\0�*VP\0\0�*VP\0\0�*VP\0\0�*VP\0\0�*VP\0\0�*VP\0\0�*VP\0\0�*VP\0\0�*VP\0\0�*VP\0\0�*VP\0\0�*VP\0\0�*VP\0\0�*VP\0\0�*VP\0\0�*VP\0\0�*VP\0\0�*VP\0\0�*VP\0\0�*VP\0\0�*VP\0\0�*VP\0\0�*VP\0\0�*VP\0\0\�\�\�\�_Y�lYK#/#�\�ux�\Z����\0\0Č3[�hQK3/#��\�\�O��[\�\�\0\0���\�s\�_�3}}}�\�\�N�\�{߼y\�ί��G�|�|�\0\0�@rӞ\�|Ty1��##��{Ͽ\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\���?E�����H\0\0\0\0IEND�B`�',1),('1820703298988478466',1,'请假流程（并行网关）-leave3.bpmn20.xml','1820703298988478465',_binary '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:bioc=\"http://bpmn.io/schema/bpmn/biocolor/1.0\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:di=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"leave3\" name=\"请假流程（并行网关）\">\n    <startEvent id=\"startNode1\" name=\"开始\">\n      <outgoing>Flow_14qet78</outgoing>\n    </startEvent>\n    <userTask id=\"Activity_0uscrk3\" name=\"申请人\" flowable:formKey=\"static:1\">\n      <incoming>Flow_14qet78</incoming>\n      <outgoing>Flow_171lpw3</outgoing>\n    </userTask>\n    <sequenceFlow id=\"Flow_14qet78\" sourceRef=\"startNode1\" targetRef=\"Activity_0uscrk3\" />\n    <userTask id=\"Activity_0ped7fd\" name=\"科研部门\" flowable:candidateUsers=\"1,3\">\n      <extensionElements />\n      <incoming>Flow_16qxdzv</incoming>\n      <outgoing>Flow_01rdmuq</outgoing>\n    </userTask>\n    <userTask id=\"Activity_1e8dxc6\" name=\"总经理\" flowable:candidateUsers=\"1\">\n      <extensionElements />\n      <incoming>Flow_0rt1gbx</incoming>\n      <outgoing>Flow_01maojf</outgoing>\n    </userTask>\n    <userTask id=\"Activity_0xun74h\" name=\"综合部门\" flowable:assignee=\"1\">\n      <extensionElements />\n      <incoming>Flow_15anuo0</incoming>\n      <outgoing>Flow_1j0t4se</outgoing>\n    </userTask>\n    <sequenceFlow id=\"Flow_171lpw3\" sourceRef=\"Activity_0uscrk3\" targetRef=\"Gateway_0qj0eur\" />\n    <sequenceFlow id=\"Flow_16qxdzv\" sourceRef=\"Gateway_0qj0eur\" targetRef=\"Activity_0ped7fd\" />\n    <sequenceFlow id=\"Flow_15anuo0\" sourceRef=\"Gateway_0qj0eur\" targetRef=\"Activity_0xun74h\" />\n    <parallelGateway id=\"Gateway_0qj0eur\">\n      <incoming>Flow_171lpw3</incoming>\n      <outgoing>Flow_16qxdzv</outgoing>\n      <outgoing>Flow_15anuo0</outgoing>\n    </parallelGateway>\n    <endEvent id=\"Event_0k2b5e5\">\n      <incoming>Flow_01maojf</incoming>\n    </endEvent>\n    <sequenceFlow id=\"Flow_01maojf\" sourceRef=\"Activity_1e8dxc6\" targetRef=\"Event_0k2b5e5\" />\n    <sequenceFlow id=\"Flow_01rdmuq\" sourceRef=\"Activity_0ped7fd\" targetRef=\"Gateway_05y03rn\" />\n    <parallelGateway id=\"Gateway_05y03rn\">\n      <incoming>Flow_01rdmuq</incoming>\n      <incoming>Flow_1j0t4se</incoming>\n      <outgoing>Flow_0rt1gbx</outgoing>\n    </parallelGateway>\n    <sequenceFlow id=\"Flow_1j0t4se\" sourceRef=\"Activity_0xun74h\" targetRef=\"Gateway_05y03rn\" />\n    <sequenceFlow id=\"Flow_0rt1gbx\" sourceRef=\"Gateway_05y03rn\" targetRef=\"Activity_1e8dxc6\" />\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_flow\">\n    <bpmndi:BPMNPlane id=\"BPMNPlane_flow\" bpmnElement=\"leave3\">\n      <bpmndi:BPMNShape id=\"BPMNShape_startNode1\" bpmnElement=\"startNode1\" bioc:stroke=\"\">\n        <omgdc:Bounds x=\"235\" y=\"205\" width=\"30\" height=\"30\" />\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds x=\"238\" y=\"242\" width=\"22\" height=\"14\" />\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_0uscrk3_di\" bpmnElement=\"Activity_0uscrk3\">\n        <omgdc:Bounds x=\"320\" y=\"180\" width=\"100\" height=\"80\" />\n        <bpmndi:BPMNLabel />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_0ped7fd_di\" bpmnElement=\"Activity_0ped7fd\">\n        <omgdc:Bounds x=\"590\" y=\"120\" width=\"100\" height=\"80\" />\n        <bpmndi:BPMNLabel />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_1e8dxc6_di\" bpmnElement=\"Activity_1e8dxc6\">\n        <omgdc:Bounds x=\"850\" y=\"180\" width=\"100\" height=\"80\" />\n        <bpmndi:BPMNLabel />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_0xun74h_di\" bpmnElement=\"Activity_0xun74h\">\n        <omgdc:Bounds x=\"590\" y=\"240\" width=\"100\" height=\"80\" />\n        <bpmndi:BPMNLabel />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Gateway_0ydkpig_di\" bpmnElement=\"Gateway_0qj0eur\">\n        <omgdc:Bounds x=\"475\" y=\"195\" width=\"50\" height=\"50\" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Event_0k2b5e5_di\" bpmnElement=\"Event_0k2b5e5\">\n        <omgdc:Bounds x=\"1022\" y=\"202\" width=\"36\" height=\"36\" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Gateway_0f4e1bw_di\" bpmnElement=\"Gateway_05y03rn\">\n        <omgdc:Bounds x=\"745\" y=\"195\" width=\"50\" height=\"50\" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge id=\"Flow_14qet78_di\" bpmnElement=\"Flow_14qet78\">\n        <di:waypoint x=\"265\" y=\"220\" />\n        <di:waypoint x=\"320\" y=\"220\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_171lpw3_di\" bpmnElement=\"Flow_171lpw3\">\n        <di:waypoint x=\"420\" y=\"220\" />\n        <di:waypoint x=\"475\" y=\"220\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_16qxdzv_di\" bpmnElement=\"Flow_16qxdzv\">\n        <di:waypoint x=\"500\" y=\"195\" />\n        <di:waypoint x=\"500\" y=\"160\" />\n        <di:waypoint x=\"590\" y=\"160\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_15anuo0_di\" bpmnElement=\"Flow_15anuo0\">\n        <di:waypoint x=\"500\" y=\"245\" />\n        <di:waypoint x=\"500\" y=\"280\" />\n        <di:waypoint x=\"590\" y=\"280\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_01maojf_di\" bpmnElement=\"Flow_01maojf\">\n        <di:waypoint x=\"950\" y=\"220\" />\n        <di:waypoint x=\"1022\" y=\"220\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_01rdmuq_di\" bpmnElement=\"Flow_01rdmuq\">\n        <di:waypoint x=\"690\" y=\"160\" />\n        <di:waypoint x=\"770\" y=\"160\" />\n        <di:waypoint x=\"770\" y=\"195\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_1j0t4se_di\" bpmnElement=\"Flow_1j0t4se\">\n        <di:waypoint x=\"690\" y=\"280\" />\n        <di:waypoint x=\"770\" y=\"280\" />\n        <di:waypoint x=\"770\" y=\"245\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_0rt1gbx_di\" bpmnElement=\"Flow_0rt1gbx\">\n        <di:waypoint x=\"795\" y=\"220\" />\n        <di:waypoint x=\"850\" y=\"220\" />\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('1820703299449851906',1,'请假流程（并行网关）-leave3.leave3.png','1820703298988478465',_binary '�PNG\r\n\Z\n\0\0\0\rIHDR\0\0,\0\0J\0\0\0և\�p\0\0/\�IDATx^\�\��\�y.\�=Ǖ\'�\�!&\�8>;���\\N�p	\�\�\n0��_*`\�`(�8�IlW�`�I\�P`C*�p+�H\� �AFH�X�	��\r}\�\�\�\Z\�\�j{�wz{g��\�]\�\�̴vf���o�\�\�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��$I~sɒ%\�ϟ?��}}}\�\�ٳ�\�\�~\�\�Λ7\�\�9s\��}~\0\0\0`BZ�dɌ\�d9Y�bE�nݺ\�\�ߖ�?\���ϝ;\�\�ٳg�}�\0\0\0`�1Y\�N���\�\�\��2{\�\��\�\0\0\0L8q��\�H<�g\�^�}�\0\0\0`s(d\'\�2v�\�#�\0\0����a\�\�k�ɒ��L\��\�4\�}\\�\�N�E\�\0\0\0�\�5,֮^�,�\��\�g�~i�\�eq]v{i=\Z\0\0\0Е�a\���YM͊z^XtK\�\�\�z4,\0\0\0�+_\�\�\�{.ijT\�\�e��֣a\0\0\0]�\Zg_\�Ԩ�\'�\�n/�G\�\0\0\0�4,�\r\0\0\0\�\�װ�O\�6*\�\�\�K\�Ѱ\0\0\0��|\r�\�\���QQO\\�\�^Z��\0\0\0t\�kX�Z�X�\���qY\\�\�^Z��\0\0\0t\�kXD��\�\�M\r��,����\0\0\0t\�lX�_�,~\�\�E\\\�5m/-G\�\0\0\0��oX�]�<y��K��\�\�u�M\�v\�Z4,\0\0\0�k\r�\�\��\�s�\�\�8��I�Ml\�ZmQ<\Z\0\0\0\�5x\�b�UC\�j�\�Ѱ\0\0\0���yVU��m\��$4,\0\0\0�k\��E�	1\�d\�O\�G\�\0\0\0�oX\�\�E\�\0\0\0�4,�\r\0\0\0\�Ұ�Z4,\0\0\0�KâjѰ\0\0\0�.\r��E\�\0\0\0�4,�\r\0\0\0\�Ұ�Z4,\0\0\0�KâjѰ\0\0\0�.\r��E\�\0\0\0�4,�\r\0\0\0\�Ұ�Z4,\0\0\0�KâjѰ\0\0\0�.\r��E\�\0\0\0�4,�\r\0\0\0:ZOO\�=�L\�^��aQ�hX\0\0\0\�\�zzz�\r\�d\�BâZѰ\0\0\0��54,6ٸа�V4,\0\0\0\�h�4,m\\hXT+\Z\0\0\0t�A\Z٤���nX��\����H֯_ߴ]d͚5M�-\\��鲵k\�nty\�\�\�7\�L�\�\�\�c�=��^��\�>\"o�\�V\�e펆\0\0@\�\r2��6%;inw�i\�裏&_�\�W�\��\�}\�}\�\�7pݧ?�\�\�\�+�L��;wnr�\�ǧ9\�\�#�\���\�H\�\��dڴi�Ї>�\\z\�\�4\Zv\�e�䮻\�J^�\�dɒ%\�c��\�\�/9��\�\�c��ɶ\�n�<\�\�C\�Yg�5\�xGqD�뮻\�$ig�ύ�<ٱ\0\0`T�x��\�5䞞1<$\�\�_LN:\�\�\�OL�\�n�\���\�O\�ϟ�6���\�n���\�\�?\�\�s\�>\����+W�L�\�j�\���w\�9mFԷ�۟}\�\�i\�ᓟ�dz�N;픜~�\�\�\�\�o�n\��\�Ϙ1#mbL�2%�\�[����tuF\\7gΜd\�=\�l\��v\�\n�b�\0\0@ۙx3\\���\�E=O?�t\���i�!V:\�\n���\�\�g?�ٍ\ZO>�dzY|�nݺ\�\�P\r�H48�\�\�o$3g\�L�˖-K\�\�\�����7\�pC�b�~�Hc�a�\�^{5]\�\�hXc\�\0\0\0\�\�ģ�\�\Zue7,\�\�\�tU\�\�ɓӕ�\�3\�H�.]�<\�\�骆Ɔ\�w�\�\���Dr�ᇧ��\�\Z�/N���͏\�.�,9\�\�ү\�Ԉ�E:r�\�lw\�M7m\��h��\��d\�\0\0\0\�\�ģ�\�\Zue7,b5\�\�\�˓o}\�[\�#�\�\r�C9$]\r�8�E}�O}\�SiS\�?�a\���\�\�\�}\�{ӯ\�\���\�ԩS\���\�\�{�c�=6\�q\��8 ml\�\�h\�-�L�}�\�\���Y�fiXt\�\0\0\�v&\�(�aY�bEz�\�m�\�&\�z\�\�F\�UW]�<\�\�#\�a\"�\�Or\�QG%�\�v[�\�{4,\�\�\�\��\�E\�O�Έ��\�}\�5\�$tP\�И>}z�\�;����\�\".�CE\��8o��Eg1n\0\0\0mg\�Q��hXĊ�o|\�is\�K_�Rz�G��8\�S\�&F4\�䗷\�zk�I!\��E\\�(Ro2D\�\"\�K\�x\�w\�}wr衇�\�\�!&�\�{��#\Z#\�\�\�ON.�\��\�z+,:�q\0\0h;�r�ݰ��꫓�\�Gi3!>\�4>�cժU\�g?%\�H>\�${\�w�\�\�裏N��\�\�\��?�\�?O�}\�ٍ�/=\�$VRtww\'��\�g\�F\�\�o�L�4)\�b�-ҏ0�m5,:�q\0\0h;�r�ݰ�g\�\��\'��G#\r��;\�K+0\�\�\�\�K\�IQ���8�E|�H\�\�㤚���\�\�\���E4,␐\�^{-y饗��\�\�\�s]4\�>>1$VaĹ.\�\�wߦ�kw4,�1n\0\0\0mg\�Q��lX\�y*��\�s�ۨ	�/\�S@��\�\�\��韒�\�zk຃>�\�cM_~�\�O\r�76�a\�\�>\�\�\�_��p\�	M��\�\�\�.�\�̘1�\�vGâ\�\0\0\�v&\���\�P�7F3q�\�)\"�]������/#\Z\�7\0\0��3\�(G\�\Z=\Z\�7\0\0��3\�(��E��aQ�q\0\0h;�rhXT+\Z\�7\0\0��3\�(��E��aQ�q\0\0h;�rhXT+\Z\�7\0\0��3\�(��E��aQ�q\0\0h;�rhXT+\Z\�7\0\0��3\�(��E��aQ�q\0\0h;�rhXT+\Z\�7\0\0**I�\�\\�d\�\�\�\�\��e___Z�J���\�ߝ7oދs\�\�98��02&\�\�mv\�,c�x>�\��7�QG�}\�\0t�Z�1�\�K.Y�bE�nݺ�BXڟ��\�\�\�ܹ�\�\n��\���x�#\n\�\�\�X\�.\�|d�#\�3n����#\0\�X\���%��\�\'姿���Z�\�`\�9\"?�rhXT+\Z\�7�QGT\'\�\0:N,\�\��j$��Z��>����G94,�\r�b�Ũ#�u\0\�ģZ1\�(\�ģƍjŸQ�q�\�A�b<\0��\�-4\�x�?Y\�Еɢ���&��˲\�I�(4�1\�(G\�qCʉq#�\�qO�\�\�\�\�Z\�\�@QN�\0t�<�\�\�\�˓�w���\�\�/m��,�\�n/�G�Q��E9\�R^��\�ƈI�4(����C\�3�#ʋ\�\0����\�x~Ѭ�\"��\�Ҵ���F1\Z\�\�3nHy1n�L���IauE�\�\�\�b<\0��\�)4��璦���.����F1\Z\�\�3nHy1n�L���QauE�\�\�\�b<\0��\�)4ξ����\'�\�n/�G�Q��E9\�R^�#+)iVX]т<\�:��\0\�(\n�jE�Q��E9\�R^�#7\�*�I\�\�^�\�@Q^�\0t�<�F�\�;[`\�\�e��֣\�(Fây\�\r)/ƍ\�dVYX]Ѣ<\�:��\0\�(y\n�\�\�����\'�\�n/�G�Q��E9\�R^��ɬ�����|\�\�\�b<\0��\�)4V-,Yx\�MEF\\\�e��֣\�(Fây\�\r)/ƍ\�\�WYd/\'�<\�:��\0\�(y\n�ȳ?���Ј˲\�I�(4�1\�(G\�qCʉq�u��b\�\�\�~~\�\�\�\�x\0@G\�Uh�_�,~\�\�B#.�뚶���\�(d\�\r\r���W0�r�RZ��\�\�f�7\n\�5�#J�\�\0��2\\��v\�\�\�\��/m*2\�\�b�\�\�(4Z�����\�\�G\r7nH�1n�̸1\n�\�\�\�x\0@G�\�X�>\�_<\'y��s���lb�\�\�_I�G�ђ���>\�\���Q\�\�\�\�\�u\�^�R~j\�Ë�qc}\�9bX\�q\"�orRGT+\�\0:\�`�\�p\r*�JR<\n�j�1\�匂y\�潸bŊ�ׯ��e˖]W7\�>Gl\�P\�\�P��	\�jE@G�\�\�\�א��\�ޟ\�BcD��\\w=-�3g\��s\�\�}����+-\�&��{�ҥK���\�\�r`\�9bHÍ\�]O�:�ZQG\0\�Q+4�\�\�H��?\��Fny\'y�c�b�ٯ\�\�x\�J鉟{��5+\�\�;\�ݎ.uD\�\�G\�9�qk�BC\�.\n�\\F:�\�\�@\�\�80\�\�\',uD���]\�s\��zzz\�\�\��?��}�<[\�[\�d�ƿ�6\\xl��\0\nPhT+\n�a�:�h\�v��\�\���\�\�M(\�jE1:z{{\�\�\�\�Y\�\��y\�ό\�g\��(4��\�&�<�=0�}\��}\�SGT+\�bz{{w\�\�\�Y0H#��,��\�>\0#�ШV\ZC\�3i��]=C\�s?@g\�\�~7n���V\��9\�c6\�\�\��^OOϻ\�\�Ùg��\\s\�5\�\�?�<\�\�3ɪU��_\�\�qy\\\�eo\�\�\��}L`����s����]}\�\�w]t\�E���\�����N:)|N<\�\�_�}\�\�kj��\�\�/�\�iӶ\�\�~�QhT+\n�A\�,\�x��\��_y\�\�ƍ�\�Պ:b\�js��{{{\�\�h�:ujr\�W$/�\�Bڜ\�+��\�\�\�3���\�\�d�@jc\�fw\�qǿ�����>}zr\�e�%,�\Z�\�\�\�w\�;��vڒ\�?�g\�o�PhT+\n�&#�$\�x��\�/0��\��m\�(HQ��#F���\�ղ���p\�%�$\�?��Ɲ��\�\��d�\�\�\�e\��\0,Xp\�\�_�.�b͟??y\�w�\�Ơb�\��\�\�O�\�\�\'��Hww\��d\�\�)4��\�FF:9\�\�#�\���\�\��ڸQ�:�ZQG\�ae\�@�\"VE̚5+;]($\�/�\�\�y+-`���\�\�;\�\�NHn�\�\�׿�uv�\�%n�?\�cޘhg\�UhT+\n��L\nF:\��<PM�����#�uD>qN�\�\�@�M��<�\�\�)¨����ohZ�\�9-`����\�̙3�\�I\'����\�?ώ\r-���>}�[S�N=.�x�J�Q�(4R�NZ�x�V��V\�\�ƍ�\�Պ:\"�\r\'\�XYѮfE]\�\�J�x�\�>&VV�x\�Ɋ+�cB!qӦM[;eʔ\�e�)4��F�I@��P\�q��U\��k\�(HQ��#��\�Kߩ7n�\�\�t�-\�q\ZVY�\�#O��=\���D�b�VVd\�\�\�\�/|\��\'O���\�cw\Z�F�2���\���G(��@���o��#��	^G\�\�\�ӳ�\�8�c�)s\"\�\�}:@\�\�׾\��uqΉv��\�WO�:\��\�\�w\Z�F�2��\�(��N<\�h\�P�\�x�\Z7\nRGT+��\�%VP7\nR\�\�@F*�\�А���&�\�o����4�VO��W\��\�\�\�W\��}��\�I\Z\�\�-4F�\���G��\�g�ާƍ�\�\�\��#r\�\�\�Yo\\q\�\�\�\�\r�,ff\�\�j\�\��y\�y\��2>��\�\�w\�k��\�\�\��\�$\n�je\Z�Y\�\�\�#�\�~�k4ߟƍ�\�\�\��#r�:u\��ku�\�\�fA٫+\�\�q\Zo\�~e\��x\��C�?��\�w\�ɾ\�\�\"\�#�xm\�\�\�\�\�K\�\��{j���<K�Q��\�B#\�km�]܏\�\�#�\��ō\��Ҹ1��c�:�Z�u\�h\�\�z�]x�Q��\�R<~C\�\�\�\�\�\�UW]5��\�.˾\�\�ꢋ.Z\�\�\�}Rv_��a\�\�\0�ШV\�c��\���ю�~�\'��	��\�G\�\�\�\�\�je<\��!\�\�v��\�\�~\��eK�R\�\�7\�\�\�}Ʃ�/�xeY��\�\�}\�݋z\�\�\�e\r�\�&p�F�2����\�*\�\�1\�\�\�_ �v��C\�;��#��\�XG��<�\�\�\�\�9\�\�\�dK�R\�\�\�\�%\��q?�q\�s\�Y�dɒ\�{���zꩥ��\�\�T\� \���B�Z��\� ��A_k���o\�\�#�s��Mk\��ϸ1�A\�\�A\�vuD�2\�\�0\�\�\�\�Z��\\�\�\�Y\��\r��\\\��W\'�x⻯��j\�=\�V�V�Z[H�g\��\���I\�*\Z\�\�{o�f͚�ˇ\�#�<����\�M�g\';z�駛.�B\�c�1\�k+�\��֕�xo�<�U��w\�\����<\�\�{x,2����\��J\Zd,\�&۫VG4\�o��f\���i�z�X�re\�\�\�֭k�l�d<\��a�\�g6\�z}��\�\�Y\��\�}\�\�\�]���\0\�\�QG��\�W�ʾ\�۪\�xk\�:&U*4\�z뭍��\�n�%\�^{m��o��\�u\���\��o}\�[]v\�y祟m߿\�\�+M\�_\�]wݕ�\�=\�I,X\�t\�X\'��tJ&O��l�\�fQD��}_gd\'c�M���\�\�og�\0F]�\�\��6\�Ǎ\�\�i\��.˜��\�7��\�\��[o�5\�v\�m�^x�i�\�I\'��v\�aɝwޙL�6m ��Ǔ�6m\r�hr\�\�\�ot�\�?ܴ\�X%�\�\�\�){>��߰?�\�\Z�8u\�	\'��\�\�ʕ+\�\�Y+,\�\�\�R\��+\�^{\�\�\'�D�\��(-$\���\�\�/�>}���\��\���\�J\�&_�\�\�m>�\�O\'�\�K�\�[l�\\u\�UM���\�_OWZd�\�ǿ�\�\Z\��֕\�/�\�I�Xd({w\r���\�\�\�˾�\�\"Cٻk����A\�\�A\�\�*\��\�˗\'\�}\�{\�����̙3�\�\"��^z)\�z뭓e˖��\�\�\�QO�z\�\�E�Q�K�F�ԧ>�\�\�N�E�\���25\�x�#F\� �Ӧ\�k�d�_^\�|\"\�\n\�Pg�u֚��9{\�\'~\�\�\�ب���R��hѢd�\��w>�`��7�\�\�+_�\�F\��\��w�\�_�\�_ҿ�D�b\�wN�{\�ǐ��\\y\�ɖ[n���\�^7\���F\�\�\�\�,\�\�LZ\�\��6��\�?\�\�\�\�U�#b\�\�G�|\��H�;\�\�\��p�G�vءi\�\�\��\\}\�\�\�5l�\�6銊�\��\�\��\�\�&?�\�O7\�6Vhz\�ɼy\�\�\�\�~�\��/$\���\��\�����\�e�2\�ѐ\�\�\�\�@��{\�O��)!7\�x㬞\��)!Mv�*\Z�\�\�\�~\�\��d�\��ar\���\�\�\�8\�#���\��hn\\x\�љN�L�2а�\��\�\��,\�&���\�\�\����\�Xh\�}�5hW߮�G�\�ȯ]\�C\�\�\�\�U�#\�g�}\�F�=\�\�iM\�xY\�q�\�\�>\��d���J?�\�\�K/M&M��\���ɞ{\�y\�\�\�իn\r�X��A\�\��\�\\\�o�}z\�G?�Ѧ}��\�:b4\�y����\�.�\�o^v\�e\�\�|[�z꩷uww��ݗ�\�ԀݨJ�\�3\�<�\�\�C��x�嗓\���\�O����\�9\�K3�\0��⋛(:\������h�n�3�����v\�\�x�c?�ִ\��h\�Bޱ�Juķ��\�AqG\�eQC\�\�\��\��F\�\�G��\��~\�H�7k\�}\�M\�\�\�\�\�O=�saĹ-����6���Ї>Դ/c�\�XG��<�\�\�\��֛��f,\�\�\�\�%\�+���8U���\�\�\�\�ߩɾ\�ۢ\�8/\����\�\����\�)�Th\�\n�M5,\Z	�_\�a\���7ޘ|\�cX��\'b�\��\�oǚ>\�\�C\�a#U��G&X�1\�E�hO<F{��\�F�}i\�(�J�G��\��\';\�c\�\�ݝ\nĈ\�\��\�\�bu\�Yg��B\Z�.\�<\�́\�aE\��Y\�G��a$q~�C9$=$䩧�J�\�?�c�\�Ǵ쾌U&X1\"���\�z� �\�t\�g�\�а8<���8v\�i�=[\�a!\�]wݏj�ȏ��\�I�Th<�䓛<$\�s\�ضް�\�L\�\�	2\�\�Y1T\�\�\�\�/O>�\�Ϧ\�Ϙ1#�KI��B-+�\�\�\�~4\'��_�\�\Z\�\��q���\�\�ׯO~\��$_�\�\�ߥq�h|<z�L\�\�s\�M��o��8oE�\�\"�\�1�є��Qsd\�;R?�E��3�\Zq��\n��|\�#\�J�\�m\�\"��\�m\�ԩ\�\�\�o\�񜏅x܆f\�۱_\�}Ʊ\�/��}�\��\�׿�u\��?�j\��|mY<eʔ}��\�I�RhD�a\��I �+,n�ᆍN�\�5\��\�\�w\�=�\���\�\\+,\�G���\�3\�\�\�g��i<Nu,3A�\�*\�Gk\�1Z��\�h�O�U���U\��\�w\�ՓѸ�9sfZ\�|\�\�\�j�X\r�x\�\�tۨ!\�_�\�g���r\�)i\�\"N�YoX�]�v\�������[�\�׾�~�H\�\n�8<�*���uDn�\�~f�Yp\�Wd\��R\�\�64,\�\�y\�N=\�\�Gn�\�w��(z\�������\r\"�e�\�T�\�,ѰX�`A\�\�(6\�|\�\��CB\�+,\�P�X\�\'\�j\�>>�$��\��7\��e�feo3���\�h��1\���\0\�1\Z\�W\�FA\�߫c�8V��?|ĉ3ceE��8�4\�1���\"���\�j�XM;p(H��\"\�S\�\�D\�\��\�~{\��~0m�|��\��\�H\�9,v\�u\�䠃JWf\��\�L\�:\"�)S�|�\�,�:uj\�,\�\�z{{��\�\�#\�&O���\�/��?��ϳ\��������6�\�\�\�d�\�T�\�*p@\�裏6]^OG\Z_\�Ў��H��\�\����\\+N�U\�.��\'�|rZ\�d\�#͏��g�\�^Wv&x�Q�\�/:\�(��@���o�U���\�\�qHi40\"q�\�`\�h<D$�x���1q�\��\Z+)V�\\\�t}�2�\�\\j5��z\�\��K.\�N\�*�auł\����w�c�=\��+VdǂB�.]zKm\0yq�t<�Vh4&�gf/,y�Qh*��L<�<.0����U����QG�6�حV\�So\�r\�-\�\�@[\�\�44+މ�\�\�\�a�N�zܴi\�֌\�J�\r++�\�rl\��:�B�ZQh�Z��:\�h\�\�\�h\�}l\�(HQ��#\�\�\�\��^�y�lcEo;\��7\n��\�\'�C\�J���:j\�\�7߼�\�q\�	67��⥉���N�Q�(4�2he\�\�\�\�\0\�\�\��ٸQ�:�ZQG\�s\�1\�lV��Zo ĹH\�մ���=\����x\�x�\�>����O�N�z\�\�\�\�W\�w\�}��\�\�;ٱbP�\�V\\w\�u\�\��ŵ\�\���\�N�ШV\Z\�`���\�?P}#}_7\nRGT+\��j��ֵħ���5kVv�PH\�_\�ʊ\r��uv_�	\">��6\�;\�#^�\�\�\�\�\�[�\�SO=\�\�+��Q3־�\�\�K-Z\���n�\�\�\�N;\�\�ڶ�\�\���ѥ��ШV\ZMF29\�\�c$\��/#y7\nRGT+ꈑ\�\�\��_�M�H��觇\�\�3\'\�L�\�x\�}\0&�ɓ\'�6(�\�\�\�=�\�\����(�>�\�\�c�\�m\'\Z�F��\�T\�IBމG\��Ư�\�s\�FA\�jE1r=��\��\�!�Xmq\�W�� 3�}\�.��\"=$\'�\�\0C�Q�(4��g��g\�\�~�ΐ\��n\�(HQ��#Z\�\�p\"\�l�!9\�\�3�k��&y�ᇓg�y&Y�jUڜ��\�\�<�?\�3�n\�\�\�\0-RhT+\n�M*:i(z{`�)��/z�����V\�\�l�\�\��4Z\�]\nP�B�ZQh�\�\�C��ƿV\���\�nBQGT+\�\�\�\�ۻOO\�\�Z\����\�\�3\�\�\���\n�jE��\�H\'#\�\�<#F������V\��\�c�y_OO\�\�\�\�\���\����gkykCs\"�ƿ�6\\xl��\0\nPhT+\n�\�\�N&\�n\�$I\�K�,�~����\�\�\�K_�Rnj?\�w\�͛\�\�9s\�>?)\�x�w;�\�UK<\�\�\0\�-�F��\��\�&\�]O��,Y2�6YNV�X��[��\�u,\�O�\�\�\�?w\�\�\�k\�Ɓ\�\�!\r7.w=\�jE@GQhT+\n�jr1\�匂XY�\�\�\�W\�O�+�q\��\�s\�&\r5>u9����V\�\0t�F��\�hIv���7�,���\Z�\�6n�\�>G+;Nd�MN\�jE@GQhT+\n��\�\'go�j\�\�FƍjŸ\�2\�\�(0T+\�\0:�B�ZQh�w��;�f�`t\�7\�x�?Y\�Еɢ���&��˲\�I�7Z\�\���\�6\�̸Q@\�\�@ʉ\�\0���ШV\Z\�lhX\�fyƍ���\'\�<?�٭_\�(qY\\�\�^Z�q�u�1\�ɓ\'���g<�\�b<\0��(4��F1\Z\�\�3n<�hVS���\�Ҵ��\�Fkj\�Ť36dR\�z\�\�3Hy1\0\�Q\ZՊB�\r�r\�7��璦FE=q]v{i=ƍ\�\�ꊆ�\�=\�\�\�\'\�x \�\�x\0@GQhT+\n�b4,ʑg\�X8�¦FE=q]v{i=ƍ�ˬ��ʢ�<ご\�\0E�Q�(4�Ѱ(G�qCâ�7F.��\�*�\�R^�\0t�F��\�(Fâyƍ�T�l����.���\�\�\���\�*�\���\0\�(\n�jE�Q��E9\��\��nS����.���\�\�\���\�*�\���\0\�(\n�jE�Q��E9\���?�,�낦fE\\\�e��\�c\�\�/VPҤ\�fR\�v-\�x \�\�x\0@GQhT+\n�b4,ʑw\�x\�\'W75,\�\�vR,ƍ�b\� \r�l����ご\�\0E�Q�(4�Ѱ(G�qc��d\��75,Ⲹ�i{i9ƍb�\�\�\Z��\0\�(\n�jE�Q��G9�7֮^�<}��M͊z\�\�&{;i-ƍb�\�7H�1\0\�Q���\�]�n]\�/<)?�\�\�\�Z��>����G9����_�\�/��<~ǹMM�lb�\�\�j�\�1A)ƸQ�:�:QG\0\�q\�͛\�\�+�~\�I�Y�l\�u�B\��\�sD~&\��a1ܪ��b�E\�hXc\�(FQ��#\0\�8s\�\�9x\�ܹ�\�\�\��\�/$c�\�Ͻ\�ҥ\�֊�\�j90����G9kX\�YU1T\�\����Ѱ(ƸQ�:b죎\0��\�/�\�\�\�\�v�Rz\�\�?EFA&\�\�m�`\�6!F�\��I�\�\�}�\�ϸQ\\��\�\�{L16QG\0\0T��G9�@\�N�e\�\�G\�9\"?\�\0\0\�v&\�а�V4,�1n\0\0\0mg\�Q\r�jEâ\�\0\0\�v&\�а�V4,�1n\0\0\0mg\�Q\r�jEâ\�\0\0\�v&\�а�V4,�1n\0\0\0mg\�Q\r�jEâ\�\0\0\�v&\�а�V4,�1n\0\0\0mg\�Q\r�jEâ\�\0\0\�v&\�а�V4,�1n\0\0\0mg\�Q\r�jEâ\�\0\0\�v&\�а�V4,�1n\0\0\0mg\�Q\r�jEâ\�\0\0\�v&\�а�V4,�1n\0\0\0mg\�QL\�\�wO-���giXT+\Z\�7\0\0��3\�(&~~�\�ƅ�E��aQ�q\0\0h;�b\Z\Z�l\\hXT+\Z\�7\0\0��3\�(f��Š�\r�jEâ\�\0\0\�v&\�Ҩ\�&m\\�U\�\�\�W_\�\�\�\�<\�L\�\�K/5m�̓>\�tY6k׮M.\\8\�\�5k\�$o��f���\�\�7\�\��\�KV�^\�t��\�z�\�vGâ\�\0\0\�v�L��M\�N�\�\�!��|\��_M�\�ג_�\�\�6\�l���\�C6\n�x\�\�=\�yOr\�u\�5]ט��.�\�\�u\�]\�믿�,Y�$�\��iӒ�\�\�/9��\�\�\�y�`��d\�m�Mz\�䬳\�J�?��4GqD�뮻�͎\���3\�\�FF�\�X\0\0@�d\'q\r��g�	Y�ti\�я~4]Uͅw\�1m\�v\'\�\�\�M\�\�w\�\�s\�i�\�\��\�ߤM�8 mrd��\�\�\�g��\�\�\'?�\�d\�wNv\�i�\�\�\�OO�\�~�t�\�v\�-�?~���3\���2eJr\�-�$���\�ꌸnΜ9ɞ{\�\�\�\�\0\0\0t�\�\ZucѰ8餓�����JW1D#\�\�C�.\Z�&MJ\�\�ލns\�&\�W��[�.�\�{쑮�\�\�\�s\�=�6 \�x\�d\�̙i�bٲe\�\�\�\�\��\�\�\�p\�\r\���\�?p�Hc�a�\�^{5]\�\�hX\0\0\0\�цkTԕݰ�&�\��\�\�$\�w\\��\"���bĪ�h2Է�U\'�pB���~�\\~�\�ɖ[n�6=f͚�\�cy\�\�e�]�>F|�CB�aq饗&�\�~��v7\�t\�F\r�\�hX\0\0\0@ר�+�a�jժ\�\���\�\�\�>\���\���_~y�C<buD*\�\�ח��8\�\�\Z\Z\�l�\�V\�\��\�\�%x`\�o�\�o\�\�bUƱ\��6BⰑ\�&\Z\�\���>�<��\�\�\�ɓ\'\Z\Z\0\0\0PAe7,␎�.�(9\�S�;\�3m:\�y$\Z\'\�<�裓�+W����\�ӕ�\�DC\�\�SOm��k��&9蠃Ҧ\�\�\�ӓv\�!Y�x\��9,\�\�8T$��\�VhX\0\0\0@�ݰx�駓\��\�\�N\�q\�W�̈́�\�\�\'bE\�m�\�\�t���\�\�>�\�\�eqN�Hv\�hn\�ω\�\�}\�ݓ\�˗\'[o�u�\�\�ON.�\��\�z+,\0\0\0��\�nXD\�\�\����J\�瞴Q�\�\��뿦��Է�ġ#�5,.��\���\�H\�cJc%Ewww\�\�|&mTl��\�\�\�<�\�b�\�#Lc[\r\0\0\0����-J����:9\�Ò/�\�\�v\�m�����\�{\���5k֤�z4�k\"VX|\��\�萐8D��R�1qR\��h\��>VXD\�\"\ZqHH�\'㥗^\Z\�\�\�oL-i�}|bH�Ǐ\�I\��\�\r\0\0\0\�*�ay\�Gү\��\�wӕO>�dr\��\�\�h<4$\�\�_�\�F\�\�\�o;=_E\��\��q\�\��>Η_�a\�\�n{�\�ק�@����^Hϣ1cƌ�\�\�\r\0\0\0\�\Z��\�H���l$�\�\��\�\��<{Y=�m_F4,\0\0\0�k|4,&R4,\0\0\0�KâjѰ\0\0\0�.\r��E\�\0\0\0�4,�\r\0\0\0\�Ұ�Z4,\0\0\0�KâjѰ\0\0\0�.\r��E\�\0\0\0�4,�\r\0\0\0\�Ұ�Z4,\0\0\0�KâjѰ\0\0\0�.\r��E\�\0\0\0�4,�\r\0\0\0\�Ұ�Z4,\0\0\0�KâjѰ\0\0\0�.\r��E\�\0\0\0�4,�\r\0\0\0\�Ұ�Z4,\0\0\0�KâjѰ\0\0\0�.\r��E\�\0\0\0�4,�\r\0\0\0\�Ұ�Z4,\0\0\0�KâjѰ\0\0\0�.\r��E\�\0\0\0�4,�\r\0\0\0\�Ұ�Z4,\0\0\0�KâjѰ\0\0\0�����w׭[\�4q�\�S{^�={\��\�s\0\0\0μy\�^\\�bE\�\�Y\�ϲeˮ�={\��\�\�\0\0\0&�9s\�<w\�\�\����_�\�blR��\�/]�\�\�ٳg?Wˁ\�\�\0\0\0&��$\�_\�ky;Ρ �\'~\�\�\�׬\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0`b�i�\�\�t*	\0\0\0\0IEND�B`�',1),('1820703328734482434',1,'请假流程（包容网关）-leave4.bpmn20.xml','1820703328734482433',_binary '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:bioc=\"http://bpmn.io/schema/bpmn/biocolor/1.0\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:di=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"leave4\" name=\"请假流程（包容网关）\">\n    <startEvent id=\"startNode1\" name=\"开始\">\n      <outgoing>Flow_14qet78</outgoing>\n    </startEvent>\n    <userTask id=\"Activity_0uscrk3\" name=\"申请人\" flowable:formKey=\"static:1\">\n      <incoming>Flow_14qet78</incoming>\n      <outgoing>Flow_171lpw3</outgoing>\n    </userTask>\n    <sequenceFlow id=\"Flow_14qet78\" sourceRef=\"startNode1\" targetRef=\"Activity_0uscrk3\" />\n    <userTask id=\"Activity_0ped7fd\" name=\"科研部门\" flowable:candidateUsers=\"1,3\">\n      <extensionElements />\n      <incoming>Flow_16qxdzv</incoming>\n      <outgoing>Flow_01rdmuq</outgoing>\n    </userTask>\n    <userTask id=\"Activity_1e8dxc6\" name=\"总经理\" flowable:candidateUsers=\"1\">\n      <extensionElements />\n      <incoming>Flow_0rt1gbx</incoming>\n      <outgoing>Flow_01maojf</outgoing>\n    </userTask>\n    <userTask id=\"Activity_0xun74h\" name=\"综合部门\" flowable:assignee=\"1\">\n      <extensionElements />\n      <incoming>Flow_15anuo0</incoming>\n      <outgoing>Flow_1j0t4se</outgoing>\n    </userTask>\n    <sequenceFlow id=\"Flow_171lpw3\" sourceRef=\"Activity_0uscrk3\" targetRef=\"Gateway_0qj0eur\" />\n    <sequenceFlow id=\"Flow_16qxdzv\" sourceRef=\"Gateway_0qj0eur\" targetRef=\"Activity_0ped7fd\" />\n    <sequenceFlow id=\"Flow_15anuo0\" sourceRef=\"Gateway_0qj0eur\" targetRef=\"Activity_0xun74h\">\n      <conditionExpression xsi:type=\"tFormalExpression\">${entity.leaveDays &gt; 2}</conditionExpression>\n    </sequenceFlow>\n    <endEvent id=\"Event_0k2b5e5\">\n      <incoming>Flow_01maojf</incoming>\n    </endEvent>\n    <sequenceFlow id=\"Flow_01maojf\" sourceRef=\"Activity_1e8dxc6\" targetRef=\"Event_0k2b5e5\" />\n    <sequenceFlow id=\"Flow_01rdmuq\" sourceRef=\"Activity_0ped7fd\" targetRef=\"Gateway_05y03rn\" />\n    <sequenceFlow id=\"Flow_1j0t4se\" sourceRef=\"Activity_0xun74h\" targetRef=\"Gateway_05y03rn\" />\n    <sequenceFlow id=\"Flow_0rt1gbx\" sourceRef=\"Gateway_05y03rn\" targetRef=\"Activity_1e8dxc6\" />\n    <inclusiveGateway id=\"Gateway_0qj0eur\">\n      <incoming>Flow_171lpw3</incoming>\n      <outgoing>Flow_16qxdzv</outgoing>\n      <outgoing>Flow_15anuo0</outgoing>\n    </inclusiveGateway>\n    <inclusiveGateway id=\"Gateway_05y03rn\">\n      <incoming>Flow_01rdmuq</incoming>\n      <incoming>Flow_1j0t4se</incoming>\n      <outgoing>Flow_0rt1gbx</outgoing>\n    </inclusiveGateway>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_flow\">\n    <bpmndi:BPMNPlane id=\"BPMNPlane_flow\" bpmnElement=\"leave4\">\n      <bpmndi:BPMNShape id=\"BPMNShape_startNode1\" bpmnElement=\"startNode1\" bioc:stroke=\"\">\n        <omgdc:Bounds x=\"235\" y=\"205\" width=\"30\" height=\"30\" />\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds x=\"238\" y=\"242\" width=\"22\" height=\"14\" />\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_0uscrk3_di\" bpmnElement=\"Activity_0uscrk3\">\n        <omgdc:Bounds x=\"320\" y=\"180\" width=\"100\" height=\"80\" />\n        <bpmndi:BPMNLabel />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_0ped7fd_di\" bpmnElement=\"Activity_0ped7fd\">\n        <omgdc:Bounds x=\"590\" y=\"120\" width=\"100\" height=\"80\" />\n        <bpmndi:BPMNLabel />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_1e8dxc6_di\" bpmnElement=\"Activity_1e8dxc6\">\n        <omgdc:Bounds x=\"850\" y=\"180\" width=\"100\" height=\"80\" />\n        <bpmndi:BPMNLabel />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_0xun74h_di\" bpmnElement=\"Activity_0xun74h\">\n        <omgdc:Bounds x=\"590\" y=\"240\" width=\"100\" height=\"80\" />\n        <bpmndi:BPMNLabel />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Event_0k2b5e5_di\" bpmnElement=\"Event_0k2b5e5\">\n        <omgdc:Bounds x=\"1022\" y=\"202\" width=\"36\" height=\"36\" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Gateway_041zo9p_di\" bpmnElement=\"Gateway_0qj0eur\">\n        <omgdc:Bounds x=\"475\" y=\"195\" width=\"50\" height=\"50\" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Gateway_1cyx391_di\" bpmnElement=\"Gateway_05y03rn\">\n        <omgdc:Bounds x=\"745\" y=\"195\" width=\"50\" height=\"50\" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge id=\"Flow_14qet78_di\" bpmnElement=\"Flow_14qet78\">\n        <di:waypoint x=\"265\" y=\"220\" />\n        <di:waypoint x=\"320\" y=\"220\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_171lpw3_di\" bpmnElement=\"Flow_171lpw3\">\n        <di:waypoint x=\"420\" y=\"220\" />\n        <di:waypoint x=\"475\" y=\"220\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_16qxdzv_di\" bpmnElement=\"Flow_16qxdzv\">\n        <di:waypoint x=\"500\" y=\"195\" />\n        <di:waypoint x=\"500\" y=\"160\" />\n        <di:waypoint x=\"590\" y=\"160\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_15anuo0_di\" bpmnElement=\"Flow_15anuo0\">\n        <di:waypoint x=\"500\" y=\"245\" />\n        <di:waypoint x=\"500\" y=\"280\" />\n        <di:waypoint x=\"590\" y=\"280\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_01maojf_di\" bpmnElement=\"Flow_01maojf\">\n        <di:waypoint x=\"950\" y=\"220\" />\n        <di:waypoint x=\"1022\" y=\"220\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_01rdmuq_di\" bpmnElement=\"Flow_01rdmuq\">\n        <di:waypoint x=\"690\" y=\"160\" />\n        <di:waypoint x=\"770\" y=\"160\" />\n        <di:waypoint x=\"770\" y=\"195\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_1j0t4se_di\" bpmnElement=\"Flow_1j0t4se\">\n        <di:waypoint x=\"690\" y=\"280\" />\n        <di:waypoint x=\"770\" y=\"280\" />\n        <di:waypoint x=\"770\" y=\"245\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_0rt1gbx_di\" bpmnElement=\"Flow_0rt1gbx\">\n        <di:waypoint x=\"795\" y=\"220\" />\n        <di:waypoint x=\"850\" y=\"220\" />\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('1820703329086803970',1,'请假流程（包容网关）-leave4.leave4.png','1820703328734482433',_binary '�PNG\r\n\Z\n\0\0\0\rIHDR\0\0,\0\0J\0\0\0և\�p\0\01\�IDATx^\�\��\\u}7�i}l\�R��R�\�>�y-E��Z9\�OIv@��\��V��\�*�z��bk��B)����!!D y@A!! ,!�\0T�\��\\3�\�;�ٻ;;w\�ξ^\�\�n\�sg��\�\�\��\�\�ީ\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0**I�\�[�t\�\�,�՜9s�ٳgK\�I\�͟?�ɹs\�\�~\0\0\0`BZ�t\�\�\�`9Y�re�nݺ\�W^��?\���ϛ7\��ٳg:�\0\0��3+\�`9-姯�\�ٳgߕ�\0\0\0`\�@̬�F\�y�={\���s\0\0\0N\\C!\�,c�x>\�\�\0\0\0L8E/>ח,��\�d\�-_\�\�ǲ�v\�^4,\0\0\0�V�a�v͊d\�Mg&?�\�s\�b]~{y4,\0\0\0�V�a\��\�k��\�<��ڦ\�e\�Ѱ\0\0\0�Z��Ń��\�Ԩ�\'\�巗�G\�\0\0\0j\�\Z�f�\�Ԩ�\'\�巗�G\�\0\0\0j\ZU��\0\0\0Ԋ5,\�SA\�zb]~{y4,\0\0\0�V�a�\�o75*\�u�\�e\�Ѱ\0\0\0�Z��\�\�\�%�n�RS�\"�ź�\�2\�hX\0\0\0@�X\�\"\�\�O.njXĲ�v\�^4,\0\0\0�V�a�~}�\�\�\�65,bY�k\�^F\r\0\0\0�\rݰX�fE\�\�\�55+\�u�M�v2�hX\0\0\0@m\r�\�듾%s��o�BS�\"�\�&�5ۢ�hX\0\0\0@�u\�b�Y�\�l�\��a\0\0\0�\�\r�\"�*K\�6�?)\r\0\0\0��nX\�\�M~R<\Z\0\0\0Pkݰ����\0\0\0\�4,�\r\0\0\0�iXT-\Z\0\0\0PӰ�Z4,\0\0\0��aQ�hX\0\0\0@MâjѰ\0\0\0���Eբa\0\0\05\r��E\�\0\0\0j\ZU��\0\0\0\�4,�\r\0\0\0�iXT-\Z\0\0\0PӰ�Z4,\0\0\0��aQ�hX\0\0\0@MâjѰ\0\0\0��\�\�\�ޚfR~y��E��a\0\0@W\�\�\�M6d��\r�jE\�\0\0��\�а\�d\�BâZѰ\0\0\0���hX�l\\hXT+\Z\0\0\0t���|�\�\�X7,�}\�\���\�\�;�\�\�\�7my\���-Z��i\�ڵk,�۽\�\�K\�\��}\�w\�}ɚ5k�\�y�嗛�u:\Z\0\0\0\�\�\0[:��As�M�{\�7�\����\�MoJn��\��u�\�G�/�0�~޼y\�QG�\�CI^��\�\'�\�O2}�\����\�oO\�;\���F\�N;\�\�|\�\�\�\�\�?�,]�4�wl�\�\�{\'g�yf�\�X�pa�\�\�&w\�}wrꩧ\�\�\���\�\�\�-�$�L���\�\'?�\0\0\0�*\�\�\�5\�\�\�1<%\�\�\'�L�=\�\�\�c�I\��\�\�&w\�qG�`���Yͅ]v\�%�\�P\���\�K\�\�\�\�\�X�jU�\�V[e\�\�Cʚ\�m\�\���vZ\�p��>��\�q\���N:)\�n�\�mb�q\��̙3�&Ɣ)S�k��6\�\�\�\�fgĺ�s\�&�\�{\�\�\�t̰h�q\0\0\�8\��QQWvâ��~8�˿�ˬ\�3b\�W��\�\�c�؀�Ń>�-�\�׭[�}�a�G4 ^|\�\�d֬YY�b�\�\�Y\�\"�~\�S�\�\�\��+�\�fl\�OiL4,\�\�c��坎�E{�\0\0@\�9\�h\�P����7\�tS6�a\�\�\�\�̉�q\�\�\'\'˖-Kx\��lVCc\�\�[\��V\��\��?9蠃�\�ĲƆŒ%K�\�D\�}D\�\��\�\�O�<\�\�\�k45�a��\�p\�\r�\�]u\�U\Z�Ѱ��\0\0@\�9\�h\�P����1�bŊ\�7�\�\�\�\�p�\���\�͎��E\\ߢ��?����\�\��0y\�{ޓ�\�\�7�!�\Z\r�hZL�6-\�\�m�ݖq\�\�;\�|\�\�\Z\�{�\�[f\�\����M�\�5\�\\�a\�e�\0\0@\�9\�(G\�\r�\�ʕ+��en�\�6\�\�[o�5.�\�\�{\�\�N\�s\�=�C=4���\�\�vۭ�a׾�G4.b?1;#ff4\���K.I\�\�w߬�1cƌd�\�\�nS��E,�SE\���n��Ew1n\0\0\0\���cѰ�_�\�ײ\�\�\�>\��\�t��q�\�\�gM�h(\�\�/��\�\�B\�\r�X�(Ro2D\�\"�KѸ\�[n�%9\���\�\��]w\�5�\����z\�q\�%_�җ�\�fXt\�\0\0\�q<\�Qv\�\�\�/N~\��ë́�\��\�իW\��\�Jȝwޙ�\�\�L>�\�g3,;\�\�\�K/\�\��\�_�E\�裏\���9s�SMb&EOOO\�я~4kTl��\�ɤI��-�\�\"�\�\�Vâ�7\0\0��s\�Q��\�,Z�(��D~y41\�Ԑ��\�1\�\�oN<\��\�\�O�\�[ħ�4\�>.�9u\�\�\��h�D\�\"\ZqJ\�s\�=�<\�\�S�\�^y\�ٵ.\Zo��0\�Z{\�W\�\�\�t4,\�c\�\0\0\0:΁G9Ʋaש\�/�\�\'>1�	�/\�S@.�\�\�\������_~�\�~�\�\�\���O?�t���\�Ѱ�\�Z\�\�\�\�\�/O�>�\�\�O<\�D�\�N;%3g\�lZ\�\�hX�Ǹ\0\0t��r�U\�b�ԛ��\�g|�H�\��e\��ھ�hX�Ǹ\0\0t��rT�a1ѣa\�\�\0\0\�q<ʡaQ�hX�Ǹ\0\0t��rhXT+\Z\�1n\0\0\0\���\ZՊ�E{�\0\0@\�9\�(��E��a\�\�\0\0\�q<ʡaQ�hX�Ǹ\0\0t��rhXT+\Z\�1n\0\0\0\���\ZՊ�E{�\0\0@\�9\�(��E��a\�\�\0@E%I\�{K�.�|����3gNV�J�I\�͟?�ɹs\�\�~\�\�\��A��]\��\�?Gg\�h�:b죎\0�k�E\�\�\�\\�r\�\�dݺuM��t>\�s����y\�O�O\�#�s\�Q�(�\�\�2v�\�#�Q�q�=ꈱ�:��\�\���?)?}}}Ϥ�\�]�\�\�x�CâZѰh�q�=\�\�D@׉\�\��F\�yH�\��\�\�x�CâZѰh�q�=\�\�D@\�q\�Q�8\�h��r7�\�F{�\�1T+\�\0�J\�B\�\�\����w_�,�\�\�Y\��X�\�NڋB�=<\�Qtܐrb\�(.#n�qb�ܚ��+:�#ʉ\�\0��R�\�X�fE�\�3��_\���e�.���<\n�\�hX��ȸ!\�ŸQ\\:FLjѠ\�gR�v�\�x��(/\�\0�J�B\�\�\�\�4\�<��ڦ\�e\�Qh�GâE\�\r)/ƍ\�-�fW�P�\�@Q^�\0t�\"�ƃ��\�T`\�\�\�\�\�ȣ\�h��E9��R^�\�3(Z4*̮�\"\�:��\0\�*E\n�E�\�j*0\�u�\�e\�Qh�GâE\�\r)/ƍዙ-�fW�@�\�@Q^�\0t�F��\�h��E9��R^�\�7\�,�I�\�Z�\�@Q^�\0t�\"�F\\\�;_`\�\�\�\�\�ȣ\�h��E9��R^�#��eav\�\�\�\�x\0@W)Rh,�\�\�MF=�.���<\n�\�hX��ȸ!\�Ÿ12�Y�\�\�)�\�x��(/\�\0�J�Bc\����E7��Ȉe�.���<\n�\�hX��ȸ!\�Ÿ1r\�Y�\�Wd<PG�\�\0]�H�y\�\'7\Z�,����F{x��\�!\�ĸ1r1�b\�\�\�~~m(:�#ʉ\�\0��R�\�X�>Yr\�w�\n�X뚶�G�і�ohX|<��\�Uhܐ\�b\�h\�\�7\�l3\�F\n�\�\�b<\0��Uh�]�\"y��󚊌zb]l����,\n�����iN\�\�\��G\r5nH�1n��qc5�#ʍ\�\0��2h��~}ҷdnr��_h*.\�mb[�ƈ\�:\��3\�\�̙\�ںu\�~���\�Ó鸱>�1��8��7�#�u\0]�U�1Ի!�Ż$\�G�1l�d��Q0��\'W�\\\�\��+\�g�\�嗥\�\�]�\�M\Zl|l9����V\�\0t�V�F�wCK\�6�?)�ưup1\�zFh\�ܹ�͛7\�����g̴��?\��e˖]�����t�9bPC�C�\'GQ��#\0\�*�\n�|\�0\�\�\�\'ţ\�(�\�AE\�\��8H�w\�Ӽ��Rz\�\�?͊⊎E�����Z\��\�?G\00n�*4d\�\�(d�\�\�\�>\��������V\��\�\�\�Soo\�A===�\'�:\'ͣi^�O%\�\�5�=g\���b��>\0h�B�ZQhi�#�0��\�\�?\�\�M(\�jE1:�N��Ooo\�4�lhNMl?+n�\�\'\0#�ШV\Z�\�\��C��Ɵv_\�\�޾\�#�uD{�N��Koo\�\����da\�/\0�B�ZQhj�\ZFk?@\��\�\�}�\�ӕ\�Պ:bd?�\�\�zzz�\�\�\��Z�\�p\�)�$�\\rI\�ӟ�4y\�G�իW\'!�ƿcy��\�\��\�~c���&�t��\�x\�\�\�|\�\�g?\�\��\�\�=\�\�l\�9\�c~}\�i���.�\�9\�\�\�\�ӧo���D�ШV\Z-�\��\�h\���\�~��\����:�ZQG_z��\�ԩS\�\�h�6mZr�$O<\�D֜(*��\�\�\�s���\��\�\��@\�1b�o�\��g�y\�f̘����\�[vBcy�?\�\�#_=\�\��u\�Q�;���B�Q�(4�v�\�\�4\�\�\�Lso�\'\�\�\�nE����\"\�\�i�ٰ}\�`�ƿ�^\�ƍPGT+\�\�:u\��J����p\�\�&�?���N\�0\�\�c?��\�\�q�\�\0L\0.<��s\�YS�,X���\��q��\�.�?餓~}\�q\�\�\�\�\�\�?\��\�v\n�jE�1@���x��(ͫ�\�h\�-i&՚�\�?0��z]7:HQ��#�\�0���Y�\"��\��\�B[b�\���iH:�\�M7\�t\�\�G�\\�\�\�o~\��8QH\�.n�ᇿ8Ѯ\�ШV\Z�\���\�\���\�|`Q47\�~�k���\0\�W�\�l\�(�:�ZQGהh<\rd�\�\�ɽ\�ޛ?D�\�\�C\�\�g�i@����Y�f�\�c�=6�\�/~�F$\�3cƌ��M�vd����B�ZQhd\�oL\��ך$\�Г\��y��o\�6�ƿcZ\�Ui^\�\�\�4�ذm]���\�\'�:6n�DQ��#�\�p�\����jV\�\��gZ\��\�\�ebf\�1\���\\�2?&�%\�7}�\��S�L\�\']I�Q�(4�\�\��Aǭivڰ~(\�Ls^�_\�6\�~}\��t��\�׸Q\"uD���چ�.}�\�<�\�\�k\�\�\�0\�\�Uy\n]\�\�;\�<>��5�\"/\�\�k��\�g\�L�<�\���\�6\n�je�\Z����\�\�x\�qn�\�5�/j�4�\�6\�gm�آ\��\�\�\�uk\�(�:�Z�\�uD!���덃�0f�r\�\\�l@H_\�}\�+_Yל褫��zʹi\�n\�\��QhT+�\�hU\�ǅ\�\Z\�=���u#Ӿ�m\�ߢ4��E\�\�TS�׫q�d\�je\��\�\�\�SA\��4�\��k<5d�\�\�	\�n� >\rd�\�,*\�?cƌU\�@�g�1t�F�2A����KjnM\�W�\�{\�<_۸\�\�\r\\�\�\�\0\�1\�\�ԸQ2uD�2A\�\�z{{g՛\\pA��/E\�o\�,�Y�\��c\�k�w\�8\�_\�G��\�\�\�o.H~�\�D�Q�L�Bc�\"?�\�_�\�\�j\�\�=/\".�W?\�x�\��ni\�qco�קqc�#��	XG6mڴ7�u�+\�fAٳ+\�\�~\Z�\�\�\�?V`��\�\�;8ꨣ�W_}5�\���>��ɓ\'�#�X�.\0oM3)�<O�Q��\�B�\�\�Z�*\�\�6\�U�G\���\r�\��\�W\�\�\�\�\�Ʀ^�ƍQTtlWGT+㱎\rE~_\�\�\�1[{,\��74-\�?V`��袋f����\�|G�}\�ًzzz�\�?��k79�+4��\�Xh�]\������\�� \�\�m_�m\��\�\�5\Z\�q\�\�\�h\�EE\�vuD�2\�\�P\�\�5]~^}��\�G���Tq�\r�9>�\�\�sΪ�N��\�[\��\�\�\�\Z�M\�\n�je<\ZE\�\Z)\�\�m<0\�1�n4\�\��\��_�[�W\�\��U\�uh\�EE\�vuD�2\�\�P\�\�u\�ԩs\�\�\�\�K�R\��\�K<�\�\�	�c��~���K�\�_\�\�\�C-K��\�\�Z\�-p�F�2��c-\�6(Z\�?Y\�x`\�u�᝵��<�����}E_ƍQ\�bLo9��#��\�XG����M��\�\�\�\�\�\�>�ȋ�ox�\�\�\�@78\�c^{\�\�g\���Z�z\�\�t Y�,U\�b�\�\'��\\h\�v\�m\�/�д|�\�s\�=\�\�\�?ߴ<��\�\�\�?ܴ�\n��F�߭|�ߵ\�\��\�WjZ]ܮ]�_۸�\��u�\�\�F\�p^wƍQ\�b,\�\'۫VG4\�/�\�R\�\���i�z�X�jU\�\�u\�\�5-/�u\�hh\���O���T�w\�\�yq�\�\�2u\�\�\��`�:\�\�C�_��\��\�|G�\�\�B�A�kR�B\�\�_\�\�]v\�%�\�\�K�\�_|\�\�\�\��\�%\��\�7,;\�3�϶�\�y晦�\�s\�\�7\'�{\�뒅6�\�䟟n\�\�ɓ�\�6\�,��\�\�\�A\�ժ\�Ni]<�8�xc~0\�\�u��q?n\�\�\�nK�o\�X\�\�3\�L��\��g\�_w\�uɶ\�n�<\�\�M\�E�=\�\�\��Ln�\�d�\�\��y\��ޗ,Z��i�h�D����o�\��\��MێU\�ύ�N\�\�yq�\r�\�7�A��>�\�_�\�]�j\�/{�k�ŭ��\�\�\�\�I|L\�o}kVH\�\�{\�w2cƌ�m\��\���\�O\�&��\�g�m>\�$;\�S�\�[l�\\t\�EM\��&��g3-\�\�\�:\�\��c-\�j\�{�\�g��;\�֍�]j\��0�n0\�y��\�\�\�θ1�Z�\�-\�\�*\��+V$ox\������̝;�\�\r�\�SO=�l�\�\�\�\�\�˳7G\�v�<\�N8���3\�uI\�(�\��wܱY\�O�\�O*SS�\�:b4��=m�}��\�\�eO\�a]\�\�SO}�\�s\�x\���\�v\�5,uU*4/^��\��\�\��ww\�uW\��׾\��\�_�\�\�����;������\�;\"Ѭ�Ї>�57v\�m�AO\'�\�\��-�\�2�i�_7\���F\�ߵ\r�\�W\�6�[7\Z���q��\��U-}\��\�+��3n���c{�ꈘyy\��\'\����#�<2y\�;ޑ����\�\�7ͼ<\�#��/�8���m�\�&�Q\�\��0�\�?�\�\�g?�ـmc�\��̟??\�.\���\�|&y\�ߜ\�\�g\�\�X\�*㱎\rE~_{]\�\�/|\���)!W^y\�5�\��SB�\�FU*4b�\��\�\�O\��\�?�\�d��\�˾�\�q\�Gl3\'\��hn�u\�YљN�L�\�߰�\���\��<\�&���\Z��*e<\ZE\�\Z)\�\�`�~`pUn\�h���q�\�\�\�y�@gy\Z7FQѱ�JuD��q\�i�\rX\��d5A㲨#\�4\�O|\�\�V[m�}b\�y睗L�4)�\�;�\�w\�=9\�C�5k\�\�\�&\Z1[#f�\�\�>ٵ2�\�n�lݻ\�\���\�2V�u\�h(\��\�SB��;�쳿~��\�\�_\�u\�	\'\\\�\�\�sl��Tݦ\�FU*4y\�Mΰ�7b\�\�\�O?��\��q\�}�C\�H�O͌\�s\�i\�=Qt\���\�M\�\�:\�\�(���3T1�Mm\�A\\H/\�-�\�6\��\�4o�z��\'P��^�\�Ԍ��\�\�^�:\�\��fˆE�\�Ѹ,j�9s\�dopD�\�\�ˮ{Q?u$���\�^{%7\�xcr��\�g��Ƶ0\�\�\���SVgX��\�ooz,c�\�XG��\"��\��\�\�M��Y3�\��\�%W��\�T�Ga\�3f��ʿ\�;\"���\�AdUz0���c\�U*4b�Ŧ\Z���ą�ⴎ��\�+�L\��\�w\�\�̈\��}~�\�\�Ź�w\�}wv\�H����	VhU\�\�R\�x�0Z\�/̓����\��\�\���\�\r\��4n��JG��կ&;\�C\�\�ӓ�\nob\�\�q�H\�v1;\�\�SO\�N!�Y���rJ�\��\"q��xS�~\ZI\\�b��\�\�N	y衇�����0\�\"\�L\�?��\��#�%�\��7	\�9K\'�|\�k\r\r��\�\�N<\�\�G\�:-\�\�.�Q:��8��I�\n�|p����~�\��\�\�q�i�\�� S_͊�\Z\��\�w��}\�c\�\�3g\�\�\�))\�Q�ee\Z�*\�\'\�6 �:\�n֎̿\�6\�su�?��ߦ0�6\���T3n��*u\��\�\��\�\�\�?��\�oi�&\Z�\��\�����o���nE\\\�\"�\�1�є��Qs\�\��_\�\".\�M��F}�\�;\��\�l&F�6c�	XG6mڴ7�u�+\�FA<\�c!Y\�J<��cƱ\�\��>餓~��\��&��U\��O�%S�L\�3��IU\n�H4,\Z?	�q�\�W\\1\�\"�1]3\�?\�u\�]���\��,4\�\".pS:?�}\�=\�̊�\�\�T\�2�\�\�T�cm\�B\\�\�\�W\�����=pu�M=�\Z6\�:5n��*uD\�r�ַ��͞�\�ŬY���\�ꫯ\�fS\�l�%K�d\�F\ro~\�v\'�|rr�\�\�gM��\�f�a�v\�\��SD�n�\�\">n�+_�J\�\�\"�3,\�\�Ԫ��1A\�\�\�\�~V�Yp�\�\��R\��64,\�\�u\�N8\�{����\�\��(z\�_�\�_.L�\�\�\�\�m�Rh�J4,.\\ش<\�\�\�o�qJH}�E�\�\��\�\�[�\�\�\'�D����ƕ�\�]��`V�6c�	\\hV\�5\�S����yπ-�\��4?�\r<\����-6\Z\�q\0\�3\�\�ոQ��\�ձH\\+��\�q\�̘YQ_��\�c�\�E\�oXĿ\�Դ֋ٴ���\�u+\�:\�}�!׶�\����\�mY3\�{\��^��#�װ\�y睓}\�\�7���leg\��L�2\�\�f��i\�J�e\�7u\�\��\�A\�\�\�#\�&O��\�\�\�\�_�\��q`T�\�.J�����}w�*\Z�哟�dr\�\�6-�\'\�#��qj\�?�\�?d\�\�;\�\�.�٪o�\�\�;.+h\���D\�#�h\�տ\�\�\�\�/4+�\���\�ƃ�\�Ҝ�\�4n4��P\�/j:n��\�`$o���k�׭q�$U�#\�\�}�R\Z\r�H�>\�\�\Z���ě�\����t\�טI�jժ�\�U\��#\nIk��\����瞛?訸��\�\�\r\�\"S�N\�\�#�xy\�ʕ���-˖-�6@��(Ϫ\Z��\��e�Rt�\��Ơ\��\�\�@<�\�\�\�\�\�6l�u�]\��cm\�G\�\�o5\�m{�\Z7JP\�:b\"F1�\�b��\��\�8�\�\�k\�\�\�Ьx5G��]fڴiGN�>��њi�afŊ4G\�\�[)4��Ff����Y\\k>�(��P�sϡ{\r\�:6nt�:�ZQG\�\�\�\�z\� f\�ƌ\�N��7�\n\��L@����z蚫��z\�H/\�\�\�p͊�&\�̊:�F��\�\�7\��@�\���4\�Ԛ.Z\�\�\�o?�p�+pv?��3\�\�ٸ\�A\�jEQ\�\��YZ\���\�@�k�t�i�M\�FG\�o\��1]���\�N�6\�3f���\�۟{\�\�W\�cEK\�v+/�\�KҁcI�b?�}w;�F��\�`Sq\0\�4��3\�\�\�o4\�\�4?Ls@�7\�o\�¦\��O�z]7:@Q��#�Kk��\�ħ\�ϴ�\�k\�m��5ά\�pq\Z\Z0\�G������>���\�:\��9s\�,z衇{\�g^Lǌ�O?�\�\�ŋ�䪫���\�O�!\�\��ؾ\�?�tS\ZՊB�I�:�_`\�u\�\�ݩ��k\�jE1<S�N�_�M�H\\�\�O�\�\�.��5+\��\���&O���tP8���\�\�\�]\rQ|�k\�\�cb��m\'\Z�F��\�hi�F{@\��\�\�|�\�\�5\�Պ:b�z;Ӣ�\��H̶�\���O��\�>n��U��\���o\0��ШV\Z�\Z���\�\�P}�\�z��t%uD������Ćq\�\r\�)���\\r\�%\�O�\�\�GIV�^�5\'\�k�;�\���O>�鶱�دkV\0��B�ZQhlR�\r\�\�\�}ݷ{�����V\�\�\�\�[4F��>��M\n�jE�1��<�\�v��7\�\��Ho7��#�u\�\�:u\�>����ҼҢ��\�\��\�\��}0\n�jE�Q\�p\"��=\�}�;w�	KQ��#F\�\���\�\�ރzzz�O�uN�GӼ��9_\�\�s6�?(�\�\��6(4��FaE&�n\�0$I\�{K�.�|����3gN\�{+\�&���6��\'\�Ν�_��aPEǃ�\�QSGT-\�|\�#\0�\ZՊBcX�:�j=#�t\�ҙ\��r�r\�\�dݺuM�\�\��\�\�=~�\�\�\�{>7>��\�P\�\�P\�\�QGT+\�\0��B�ZQh\�`�-g\�̊8X\���J�\�\�\�{&7\�\�?Gl\�`\�\�`\�\�uD���\0��(4��ƈ\�2\��f�\�i fVT#\�<�\�\���sĐ\�\�D�\����V\�\0t�F��\����\�i�:\�\� \�F�b\�1\�\�(0T+\�\0��B�ZQh�\�\�q\�\���_�\�*:n��\\_�\�\��ŷ|9K|\�\�\�I{1n�\��\�\���7\�l3\�F��RN�\0t�F��\�hφ�Vd\�X�fE�\�3��_\���e�.���<ƍ�Kǌ[\'O�\�\�׆\"ご\�\0]E�Q�(4ڣaQ�\"\�\�㋯ijV\�\�\�\�k����Ǹ12\�x1)ƌ\r��_O1E\�)/\�\0��B�ZQh�GâEƍo=��QQO�\�o/#�qcdbvEC\�\�\��z�)2Hy1\0\�U\ZՊB�=\Z\�(2n,�}VS���X�\�^F\�\�\�\�fW�eц\"ご\�\0]E�Q�(4ڣaQ�\"ㆆEy1n_nv�Ym(2Hy1\0\�U\ZՊB�=\Z\�(2nħ�\�\�ĺ�\�2\�7�g�\�fY�P�\�@ʋ\�\0���ШV\Z\�Ѱ(G�qc\�\�njT\�\�\�\�\�\�c\��AfW�e1BE\�)/\�\0��B�ZQh�GâEƍ\�+\�K\����fE,�u�\�e\�1n3(Z4)򙔿�+2Hy1\0\�U\ZՊB�=\Z\�(:n<����\Z�,���\�Fq1��E�\"�,��\�x \�\�x\0@WQhT+\n�\�hX��и�~}�\�\�\�65,bY�k\�^F\�F{�\�)4Hi1\0\�U\ZՊB�=<\�1Ը�v͊\�\�;\�kjV\�\�b��\�dd1n�Ǹў�\�)7\�\0�ʜ9s^[�n]\�<)?\�\�\�dZh�\�?G\������_�\�-��\�\����\�6��\�\�\�J{�\�QGT\'\�\0�\���\�\\�re\�=)?˗/�,-4\�\�?G\����\ZCͪ,f[�\r�\�7ڣ��N\�\0t��s\�\�7o޼\�����\�\�\�$��\�-[�\�Ҵ\�x,ͧ\�\�\�9\�(G��E�Y�%n�ߟ��E{�\�QG�}\�\0t��\��4�D\�+�\'~\�\�\�Wd�ɁG9\�\�6_0\�\�M~R<\�|\�#�3n�/�~m�;����#\0\0�΁G9�@\�4\�\�%���sDq\�\r\0\0�\�x�CâZѰh�q\0\0\�8\�а�V4,\�c\�\0\0\0:΁G94,�\r�\�7\0\0��s\�Q\r�jEâ=\�\r\0\0�\�x�CâZѰh�q\0\0\�8\�а�V4,\�c\�\0\0\0:΁G94,�\r�\�7\0\0��s\�Q\r�jEâ=\�\r\0\0�\�x�CâZѰh�q\0\0\�8\�а�V4,\�c\�\0\0\0:΁G94,�\r�\�7\0\0��s\�Q\r�jEâ=\�\r\0\0�\�x�CâZѰh�q\0\0\�8\�I~����_��aQ�hX�Ǹ\0\0t��\�\�\�oC6ٸа�V4,\�c\�\0\0\0:΁G{\Z\Z�l\\hXT+\Z\�1n\0\0\0\���=-\Z-\ZՊ�E{�\0\0@\�9\�hO�FE>Y\�b�\Z\�>�\�?\�\�#\�SO=մ]>w\�uWӲ|֮]�,Z���\�/�\�B\�\�K/e߯_�~��\�\�w_�f͚�}D^~�\�e���E{�\0\0@ǵ8��%\�\\F\�\��\�\�_�r\��s\�=��\�L�\�f�\�\�\'��Q\��$�{\�\�\�.��i]c\�\�;\�Sr\�\�7\'\�?�|�t\�\�\�\�ӧOO\�\�{\�\�\�3\�̶�\�\��m�\�6��SO=59ꨣ�|\��\�\�;\�5;\��\�d\�ύ?��\0\0�\n\�\�5\�\�\�1>%dٲeɻ\�\��lVE4v\�a��I�>�d\�ԩ\�^{한~�\�M�������\�\�\�O~2kr\�\�Gs\�\�N\�\�\��| �Ї>�\�\�\�I\'��l�\�v\�6�\�K�`��\���3gf��2eJr\�\�&}}}\�\�X7w\�\�d\�\�wo��N\�\0\0\0�\�P����hX{\�\��\�e���p�\���FĤI��\�n�m�m\�:\�\��ꯒu\�\�e�\�m�ݲ�}?\�\�cY\�\�_Lf͚�5+�/_�\�O|�ԧ>տ\�W\\�\�\�>���4&\Z{\�G\�\�NG\�\0\0��6T���\�E4	�\�� 9\�\�#��\�Dh<#fED���}̚8�裳�K}\�C\�\��n�\�[fM�k��f�}r\�!\��矟\�G|�SB�aq\�y\�%7\�pC�vW]uՀFc4,\0\0\0��jTԕݰX�zu\�\���\�\�iw\�qG�\�駟p�G̎�SE\�̙�;8\�3�\Z\�l�\�V\�\��\�\�%��\�����\�n�2�8∬��\�6\�\�\�\�[\�\�\���\�O&O�\�?\�\�а\0\0\0�\n*�a�t�}\�\�\�\�\��\�t\�MY\�!�#ј�@\�a���Z�*�\�-�ܒͼh\�&\Z\'�pB\��/�\�d\�}\�͚\Z3f\�H�\�~�dɒ%�װ�\�q�H|׭а\0\0\0�\n*�a\�\�\�\'o|\��kG\\p�Y3\�?�Av퉘q�\�\�7\�\�\�?�q�\�{X״�䷍\�F��q��]w\�5Y�bE�\�\�[g_�;\�\�K_�R�\�\0\0\0�����nE|}衇�[o�5kTĬ����\�?;]��M$Niհ8\�s�\���\�ǔ\�L����\��h֨\�|\�ͳ�yn�\�\�G�ƶ\Z\0\0\0PQe7,/^��\�_�ur\��&���\�\��\��\���\�7�)y\��S=\Z�53,\�\���\r8%$N�ϔhL\\T3>\Z5��Ѵ��E�\�\�xꩧ���\�\�+�SK\Zo��0\���q�\���a\0\0\0�\��{\�\'��\�o;�I\�\��&�\�_��q\�\�SC\�1~\�����o~\�\�\�*\���x\�E;\���^F|��E\\\�\"�\�\�_�}I~�O<�]Gc\�̙M\�:\r\0\0\0��M\�b��O\�/N�q�~���\�\�\�\�i�}Ѱ\0\0\0�\��hXL�hX\0\0\0@MâjѰ\0\0\0���Eբa\0\0\05\r��E\�\0\0\0j\ZU��\0\0\0\�4,�\r\0\0\0�iXT-\Z\0\0\0PӰ�Z4,\0\0\0��aQ�hX\0\0\0@MâjѰ\0\0\0���Eբa\0\0\05\r��E\�\0\0\0j\ZU��\0\0\0\�4,�\r\0\0\0�iXT-\Z\0\0\0PӰ�Z4,\0\0\0��aQ�hX\0\0\0@MâjѰ\0\0\0���Eբa\0\0\05\r��E\�\0\0\0j\ZU��\0\0\0\�4,�\r\0\0\0�iXT-\Z\0\0\0PӰ�Z4,\0\0\0��aQ�hX\0\0\0@MâjѰ\0\0\0�Ԝ9s^[�n]Ӂ���\�yxr\�\�\�\�\�\�\0\0\0L8\�\�\�r\�ʕM\�R~�/_~\�\�ٳ\�\�?G\0\0\00\�̝;w�y\�\�=\�\�\�\���c�\�\�޷lٲKgϞ�X�O\�#\0\0\0��\� 9\�\�O\�J\\CAJO�\�\�\�Y\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\��\0�\�M޶�}\r\0\0\0\0IEND�B`�',1),('1820703358228828163',1,'请假流程（会签）-leave5.bpmn20.xml','1820703358228828162',_binary '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:bioc=\"http://bpmn.io/schema/bpmn/biocolor/1.0\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:di=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"leave5\" name=\"请假流程（会签）\">\n    <startEvent id=\"startNode1\" name=\"开始\">\n      <outgoing>Flow_1a01nzj</outgoing>\n    </startEvent>\n    <userTask id=\"Activity_0x6b71j\" name=\"申请人\" flowable:formKey=\"static:1\">\n      <incoming>Flow_1a01nzj</incoming>\n      <outgoing>Flow_1wdq20a</outgoing>\n    </userTask>\n    <sequenceFlow id=\"Flow_1a01nzj\" sourceRef=\"startNode1\" targetRef=\"Activity_0x6b71j\" />\n    <userTask id=\"Activity_0dvsmdc\" name=\"串行会签\" flowable:assignee=\"${user}\">\n      <incoming>Flow_1wdq20a</incoming>\n      <outgoing>Flow_1gbyvno</outgoing>\n      <multiInstanceLoopCharacteristics isSequential=\"true\" flowable:collection=\"userList\" flowable:elementVariable=\"user\" />\n    </userTask>\n    <sequenceFlow id=\"Flow_1wdq20a\" sourceRef=\"Activity_0x6b71j\" targetRef=\"Activity_0dvsmdc\" />\n    <userTask id=\"Activity_194idnn\" name=\"并行会签\" flowable:assignee=\"${user}\">\n      <incoming>Flow_1gbyvno</incoming>\n      <outgoing>Flow_06trc15</outgoing>\n      <multiInstanceLoopCharacteristics flowable:collection=\"userList2\" flowable:elementVariable=\"user\" />\n    </userTask>\n    <sequenceFlow id=\"Flow_1gbyvno\" sourceRef=\"Activity_0dvsmdc\" targetRef=\"Activity_194idnn\" />\n    <userTask id=\"Activity_1o4clkg\" name=\"总经理\" flowable:assignee=\"1\">\n      <extensionElements />\n      <incoming>Flow_06trc15</incoming>\n      <outgoing>Flow_1jhko1g</outgoing>\n    </userTask>\n    <sequenceFlow id=\"Flow_06trc15\" sourceRef=\"Activity_194idnn\" targetRef=\"Activity_1o4clkg\" />\n    <endEvent id=\"Event_1it04q9\">\n      <incoming>Flow_1jhko1g</incoming>\n    </endEvent>\n    <sequenceFlow id=\"Flow_1jhko1g\" sourceRef=\"Activity_1o4clkg\" targetRef=\"Event_1it04q9\" />\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_flow\">\n    <bpmndi:BPMNPlane id=\"BPMNPlane_flow\" bpmnElement=\"leave5\">\n      <bpmndi:BPMNShape id=\"BPMNShape_startNode1\" bpmnElement=\"startNode1\" bioc:stroke=\"\">\n        <omgdc:Bounds x=\"240\" y=\"200\" width=\"30\" height=\"30\" />\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds x=\"242\" y=\"237\" width=\"23\" height=\"14\" />\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_0x6b71j_di\" bpmnElement=\"Activity_0x6b71j\">\n        <omgdc:Bounds x=\"320\" y=\"175\" width=\"100\" height=\"80\" />\n        <bpmndi:BPMNLabel />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_0dvsmdc_di\" bpmnElement=\"Activity_0dvsmdc\">\n        <omgdc:Bounds x=\"470\" y=\"175\" width=\"100\" height=\"80\" />\n        <bpmndi:BPMNLabel />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_194idnn_di\" bpmnElement=\"Activity_194idnn\">\n        <omgdc:Bounds x=\"620\" y=\"175\" width=\"100\" height=\"80\" />\n        <bpmndi:BPMNLabel />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_1o4clkg_di\" bpmnElement=\"Activity_1o4clkg\">\n        <omgdc:Bounds x=\"770\" y=\"175\" width=\"100\" height=\"80\" />\n        <bpmndi:BPMNLabel />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Event_1it04q9_di\" bpmnElement=\"Event_1it04q9\">\n        <omgdc:Bounds x=\"922\" y=\"197\" width=\"36\" height=\"36\" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge id=\"Flow_1a01nzj_di\" bpmnElement=\"Flow_1a01nzj\">\n        <di:waypoint x=\"270\" y=\"215\" />\n        <di:waypoint x=\"320\" y=\"215\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_1wdq20a_di\" bpmnElement=\"Flow_1wdq20a\">\n        <di:waypoint x=\"420\" y=\"215\" />\n        <di:waypoint x=\"470\" y=\"215\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_1gbyvno_di\" bpmnElement=\"Flow_1gbyvno\">\n        <di:waypoint x=\"570\" y=\"215\" />\n        <di:waypoint x=\"620\" y=\"215\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_06trc15_di\" bpmnElement=\"Flow_06trc15\">\n        <di:waypoint x=\"720\" y=\"215\" />\n        <di:waypoint x=\"770\" y=\"215\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_1jhko1g_di\" bpmnElement=\"Flow_1jhko1g\">\n        <di:waypoint x=\"870\" y=\"215\" />\n        <di:waypoint x=\"922\" y=\"215\" />\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('1820703358606315522',1,'请假流程（会签）-leave5.leave5.png','1820703358228828162',_binary '�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\�\0\0	\0\0\0Hy:\0\0�IDATx^\�\�	�u�\�\���by\�by���w\�}\�Qޚ�\�\"�@���@P��<\�\��(ޠQ|j��D\�qDA\r\�!\�\�!�\�\�׿~\�\�v\�\�\�w>��oe3\�;3d�\���\�==�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0���(��\\t\�E�s\�)��{�\�\�\�\�~\�;p\�\��O8ᄫV�X\�\�\�\�Vz5�\�+i\"z%M�����ʡ\�\�\�/�b͚5\�ڵk�\�o�]��w��\�?�\�rPx[�3j#���\�4��&\�\�^\�R\�y�RJY\�\�z\�\�k\��\�\�\�g\�Fz�O\�J��^I\�R�\0h�8�\�+\�y$~\�`p[�3j#�\�\'z%MD���t�W\0�T�\�\'�%ӗ�y�?�6ҫ��W\�D\�J�HWz@K�w0�\�\�\�E���8��OU��\�t;�Z�2\�U^\�+�j\"z�WM�+���\�3\�|��Ūc\�+�������,�K��ɧ+��^\��ҫ&�Wz\�D�\�+\0Zj<��\�g\�7Թ\�\�}\�\�\�ӕ�@�\�^\�U\�+�j\"]\�\0-5��\�o�?�o �ץ\�\�\�ӕ�@�\�^\�U\�+�j\"]\�\0-5��`\�\�\�\�\�\�u\�\�2�te0Ы��Wz\�D\�J��HWz@K\�JW�\�+z�WMD�\���t�W\0�\�x�8[g:ԉ\�\�\�e\�\�\�`�WyE�\���\�^5��\�\n��\Z\�`p�I_\�\�\�u\�\�2�te0Ы��Wz\�D\�J��HWz@K�g0�\�ʿ�~�ɾ� .�\�\�\�e\�\�\�`�WyE�\���\�^5��\�\n��\Z\�`��\�\����,\�N���z�W\�J���^\�U\�J�\0h�q\r�\�V\\p\�7���,�\�\�^&��z�W\�J���^\�U\�J�\0h�{\Zn��\�\���\�\n\�\�u�M�}2�te0Ы��Wz\�D\�J��HWz@K�9\�v[���\�_�٧oH\�Ķ^E�z�2\�U^\�+�j\"z�WM�+���F\�\�\�\�\�U\���+��^\��\�^M=z\���z�\�+\0Zj��`<�����\�\�\�d�\�\�`�WyE�F�^M-z5z\�jj\�J�\0h�\��\���D�ޞ�?]\�*�\�\�\�IoO\��\Z;\�\�\��ӕ^\�R�\r2}\�\�`�WyE���\�4��\�j�\�̙\�Y�f\�\Z\Z�\�\�\�\�e..sk�bݟ\�\�\�뮟ۧ��\�JW�\�+z%MD���t�W5{\�\�\�\�2��[�7�����\�6��A^\�\�`�WyE���\�4��\�j�ʅ\�\�w\�(\�\�de\�^z\0L�� �te0Ы��W\�D\�J�HWzuO\�̙�\�\�\�\�7\�E\�\�\�Bw\�\�w//^\\�q\�Ņ^X\\w\�uE�?\�\�qy\\ۥ\�����\�\'��\�9\�N9\�\�v\�a�]�p\�{\�\�ڝw޹zB�?�{\�\�M\�e_�h\�\�Ν�E��]f0\�+]\�*�\�4��&ҕ^mH9n1{\�\�?\�.l����C9��\�+�\�\�x\�\�\�}\��\�B����\���M\\���\�1\�\�\��\�\�\�\�\�\�\�+>�\�b\�ʕ��\Z�\�\�;\�\�],�h\�w|sz{]d0\�+]\�*�\�4��&ҕ^��\\?�̕��\�<���\�\�\�_�NP|\�N�H�<\�/}�&�\\\�~hѢEk\�\�SN9��뮻\�\�Q\�v����\�z\�.�\�򧡡����\�%��ҕ�@�\�^I\�+i\"]\�\�h\�\�9Y\�^ߣ�:*E�$n/ٛ|�=ɰ�+��\�\�c�]�\�N;˖-+\�\�\�\��c\\\��\��\�̙sK�\�h0\�+]\�*�\�4��&ҕ^�\�=���Uϝ;�8\�\�3\�\�s��ۍ\�\�Y$�\�=ɰ�*��sɒ%\�y睋s\�=7}�����y\�\�\�:<<�Cz]`0\�+]\�*�\�4��&ҕ^�֝�kd\�qS�\�Z\�~\�\��\�1��\�s<��b͚5\�\�Ĕ\�\�͝;\�歷\���\�}��� �te0Ы��W\�D\�J�HWz\�k\�G9\�U/V�.]������\�ً|����M\�\�\'���Xo�=ǩ\�v\�\�n�\�9s\�S\��n3�A^\�\�`�WyE���\�4��\��׬�\�9�i\rRr⮕\�c:����8`m�g�IGy\�\�\�\�\�Ǥ\�\�f��ҕ�@�\�^I\�+i\"]\�U-�>\�=�z�g�����\�C��x4$0���>��8[\�dO\�5^q�\�\�ͻ�|ry]�\�\�`�W�2\�U^\�+i\"z%M�+����\�%\�\�4>�x:\��\�\�E^�>F�c\��\��k\�}\��w|4\� �x\�7�O.��>��2䕮z�W\�J��^I\�J�\�\�\�\�C˙\�\�zq:\�ǵ�ߞ\�\�\�\�\�\nt\�\�\'���w\�qܟs<Uq?\�l�\�\r3g\�\�<},9)�\0_\�\�\�)�A^\�}0ЫvF���\�4�\�{UO�\�\�g\�\�8\�q:\��\�,�g��\�C=\�w|p�<Ш��\Z\Z\Z\�9},9\�y\�\��� �\�>\�U;�W\�D\�J�H��_\�\�\�\���\�?N\�Ɂ��\�y\���\�E�]3�ëk\�w\�ٳ2Gϓ\���\ry%\��@�\���&�W\�Dr\�Um<��={\����\�O?=\'*\�~,\�z\'\�1{\�\�ڋ.�(}h\�y\�wI�sZ�Xr2\�\��O\�����`0J�\��\�+i\"z%M$\�^\�F\�U_�\�?/�/\�����\�y��%�9@�̟?�\��\�\�\�@���\�\'�+\�ǒ�Q��\�TO\�9�\���n��\�\�\�?���\�\��.O\'�8��\��.\�!��\�(M��ޜy\�}���3\�8�\�ȵ\�^\�w\�=}O�Dz�x\�\�W\\pA\�v��^M=\�{\�z��1\�6u\�\�\�T:ѫ��Gi��W��\�g�����\��ܷM��]v\�5\�\�]�v\�ھ\�ڒ\�{U�Oi�_���>\�Y5\�_?�ٳgߔ�\�\0�\�\�w\�qG�<Ш\��n\Z剰�\�i0�\�\�[\����[nY�\�\'?���\�[ֻ\�[\��V\�/}i�\�\�\�w\�\��\�\�\r\r���\�o�{\�\�^\�ʕ+���\�?��f:z\�;ƀy\�{߻�\��\�w]oV�XQ<\��-\�m\Z\�\�\�/\�Ν[\�=\�yO\�\�\'?�z1%��_�\�\�m�}\�\�}\�\�Y�`A\�\�w���:ˡ�Z<\�)O��\ru���?��f:zUg\�=\�,>�яV_\�0�Ë\�˗\�m\�T�\"z\�L��W�e��\�+��\�/V_�\�7�)�\��\'W\\qE\�v��w޹x\�{\�[{\�#]�<\�\�(V�Zշ},�cQ�z\�\�\�.\�4�J�\�\�J=��\��{ϝ\�<\rt\�N;\�tǠ_��\�k�>��{�?+\�C\�\�U\�W��\�E��<\�\�<��\�_�\�\ro�Ϡ\�6^1�\�}\�[\r��\��m^\�/~\�\�\��U\�cz�8\��\�Q\�\�N�ҧlzu\�\�W?�\�̙S\�\�>\���\�gV]\�\�>ė�\�e\�ҥK�\�n���{�\"M�X�<\�Y\�*v\�a�j��^��J,�\�\��7CCC\�\���\�5�yM\�җ��\�\�\���⠃\���&�WSO쭽��\�_�\�-\�b�wa\�T�\��ѫ��O\�\�j�\\y\�\��\�w�ꅘ\��\�}Ջ.�\�\���G�\�[�^zi\�br|_\\}�\��?<�]<\�տW\�w\�s��\�\�/x�\�e�G<\�\��N̽W�Qz\�ׯ\�S[_>\�Y5e2lB\�\�c�����s\�9\�\�Y\�{\�zA-�� \��<�\�O�{�\"?\�\�S��?\��\���\�\'\�\��׿�u\�\��\��j���\��\�b���|嘇g�\�?�\��Ğ\�\��\�N\�Aν�ꪫ��k|{I�\��\\�\��\�f,2b\�\�\�\��\�3��L\�\�Y��o(�A�~�擟�d\�ַ��o\�\�G>\�\���\�\�}\�;ߩn;�t�Ƿ�\���\��\�\�\�\�\�\�_�bdQ/Fc�\�>\��*��8\�\�\�TD�&.\�^��82j�m�y\�$~�я\�<\�9}G	l��\�\�a�V����O|b�\��G?�Q\��>�8묳\�\�6:G1�p\�	\�vq�\�m�]\��K��|\��\�\�X�+�\��6�~\�\�d`:\�\�>\��,\�Gq\�Q�\�s\�\'\�^9\rq\�W,j\�~�~\���w�\�]\�ױw8��\�b\�M���\���\�\�b뭷Y \�\�\�{\�\�m\���|�ӟ^\�\�rJ\�Aν���m�\�Ȃ#\� \���:^=\�\�>�B8\�\�#�g?�\�\�\�{\�\�ቑ�=\�i\�텉=9\�Z�(�\�\�\�!���X�dIu\�m\�\�\�\�\�o|cu�\�~\��\�\�\�%�\\\�\�؛�^M>\�\��X�\�9^�\�W��|\�\�\�\�^\���m�\�Tl�W��s�\�J�\��\�\�^v\�9\�T�\�z/�߃\�|]xԣU�\'>� x\�k_[�t\�Iū^\��\��\�q�\�׏|O,�cot��\�V[U/\ZFW\�8�?},ӕ\�{UO��\�\Z�.�\�?�p��\�s�\�|\�\�\�`p\�npr���=\�q�\�\�\��\�\�x}\�̙#��-Z\�w�ubH�\�_\��\�]7\�\�}0ȹW�Ї�EC,4\�C�\�\�x?h\�\�qҥG>\�Uwb\�L��9\�ޓ�\�a��\'\�+_�Juc:\�{;�\�0�\�ŋ\�\�G\�\�{j�\�\�˖-�\�(�u\�� �WS\�X\�\�Q݉&:׫\�iC�\�|�\�_u��E\�^�ㅓx~��q�\�\�[��P�v^��\�\�sL\�׿��z�%\�\�\�M�\�v���w\�\�\���\�2]ɽW�\�\�k�\�A�C�ľży\�\�*�\��(\�\�\�\�5\�\0�y�X\�(�� \�\r-�{��Ch\�\�i�8\�\�O}\�\�b(\�\�\�\�\�\�\��D�v\�i\�a\�9�\�G\�2ܓ\��w�CP\�{z�u�_�\�\�F�\�\r�=-�\�\�z{\�\"\�b樣��\�to`�w�\�\�\��\�_F�\�\��F�(�Crc�8\�\\�=�\�x,�~x\�\�o2z5�\�\�\"c��a\�{\�\�\�w�\�\�\"5��F� {��\�TD��1\�^m(��\�g�\��\�\��q$L�\�_\�!׽\�ŋ/{\�G\���8*j\�\�w9G$\�\�/ׇe\�6\�\�x�%^p��\���\�\�\�ѐ>�\�JWz\�yqF�(��\�t\�m�\�\�\�Y \�H+\�1,�xP�Y�ȏ\�\'��MC[\�4�\�o\�\�!\�{\�\�ȶ\�9\�g�f���.Ic-���\�o�x\�+���\�W���磡��\�ѫX GO�/\�\�\��{f\�m\��\�\�\�\�\��\�=.f\"q\�l�p\�\r7T\�?\�g�}����\��㏯\�؃�\�\�\�\��\�w�\�⅜\�\�\'Y�/T\�j\�\�\�\�ϲ~��CX\�C��\�TD��5�\Z-ѳ\�}\�{\�\�>\��\�\�6\�6w��~\�i\�x\�q��\�8\� �qDU<祷�߃\'\�Et��S\�A���\�B\�\�LG�ҫ0<<�\�rf��^�\�\�h:\��\�,�o�Ǖ>V�c\�\'�7\�\�w\�y\�\�s\�FU\��\�\�\�[o�\�\�\�\�\�V��{\�Tݻ9>�\��Zq�X��*y�\�O:�=\�q��8Ĭ\�3%cȍ��\�}Zә�\�ѫ8qQݗ�o�y�=\�qB�\�>9>.l<��:q\�N;\�T}\'Ép.�첑\�c�!6���\�ę�ㅜ8ANt5�\�\�6��z\��\��W�\��:Nʕ.�\�l\�NE\��Y\�٫\�\�^\�8\�%�n��r�=~�ŋ\"��8zT\�u���\�n�\�V�\�$\�ѡz�σ\�!\�\�{/~7\�Qp@u\�\�\�=\�\�bM./w�W�rn\\R/N9\�t���ߞr\�\�\�6�r �Ӳe\�\�N�6��?��\���|bY�\�w�\�2��X �\�Y\�\�\��x@5 \�\�Z\�ىC�\�0�8\�I\�\��w\'��\��7\�x>NP�~\�t�+�A�\�<\�Ġ\��^�&\�z1�i\�y\�CR\��w�4\�Dpq\�ׯ~\��E�\\P|\�S��a�Cm\�M$\��1\�\�1ľ\�-o�.w2�ɛ�^\�\�4�^�ϛ�/��z\���ni�S�\����Wi\�\�{(^(�C\��c\�u\�\��x�q�u�o�=ޒ��C\�\�C�\�}\�q\�}|/�\�0G}tթ\�c��S��\��\��x�x(�\�J۠ӕ^\�\��\�\�X/N����9\�o\�\�\�#�W\�\�I#\�Q3g\�|j�$s�$�	\�/�C\�\'�\�q?\�}�Y��X�CG\�\�W\'\�Gơ\���ǫ�\�=zq8m�Ԥ\�.�w\�e�j\0Io#�k�Ҋ�{�\�\r:]��Wq���\�\�\�4_��\�G\�{g���Mt%\�.g�\�b\�\��\�\�㎫�\�\�\�g�mb���\�p\Z{ff̘Q��\�o���*\�\�Y�\�j~z�MF�&�xΈCX\�\�\�\�\�g�\�\�G6v�\"zլA\�\�}��ł9G�\�\�\�C�G�h�\�\�sb�{�\�\��\���ҕ^\�*�?_Y/P\�\�\�)\�g\�\�\�\��7{\�쭶\�~�[\�&7�K.�di��rU_u\�m0\�M}\�\�{\�x�kC�2Lw�bpL\�<Z�\�[\'kJ?\�v��W�K��\�Us\�ЫM)]\�U�r>ݲ�#\��K�.MG\�F\��\�,�\�Ǒ>6`0<<�\�ܹso\�X{�\�\�9��\�\�\�}u�� �te0Ы��W\�D\�J�HWz�\Z\Z\Z�F�X��\�\��&\�\�\�Z\��>&`{z�\�v\�\�<\�\�\�\'{\�8!׺\����{�k��ҕ�@�\�^I\�+i\"]\�UjΜ9��3\�Y\��5\��\�\�\"9n����=\�q�q�\�c61CCCO>v޼yלx\�7�\�s�\�\�\�~�\�\�\'�\���\�v�\�JW�\�+z%MD���t�W�)\�\�-\�\�\'��\�I�\�Eߘ\�\�z\����-\�\�l\�\�#�\�\'��\�f�\�\���._�|\�y\�wٵ\�^{K�<r\�\�W_}\�\�g�}��~\��#,Xpt�\�}�>\�iCy�+��^\���&�W\�D�ҫ���\�g\�.�#q\"���\�:�?9!W�8��K@e\�̙��O󇆆�*�<�\�\�)�<u\�\�\�c�\�{�\�`�W�2\�U^\�+i\"z%M�+�ڐY��\'y\�p\�H\�M�3\�\�\�\'\"��\�K\�\ZW�U\���\�\r�=0䕮z�W\�J��^I\�J�\�I�\'x݉�҅m��\��/.\�8\�\�\�殻\�j1\�\�\�\�~�\�v\��޸��]\�9�$�A^\�\�`�WyE���\�4��\�j�\�}\�\�\�$O1+}��\�JW�\�+z%MD���t�WU.l�*�K\�\�>\�\�wC�\�\�\���	�$\�JW�\�+z%MD���t�W�5gΜ��\�CCC�]���\�\�en]��?\�\�\�\�]?#�Oo�)0䕮z�W\�J��^I\�J�\0h)�A^\�\�`�WyE���\�4��\�\n��2䕮z�W\�J��^I\�J�\0h)�A^\�\�`�WyE���\�4��\�\n��2䕮m\�\�-�\�R�Z�j\�Ko+\�\�\�\�S\�*\�\�D/\�9z%M�+���y�+�A�z��\�!O8\�}\�m\�\Z�\Z|\�^�=�\�\�9G���t�W\0��� �te0hS�\�An�6\�j�\�D/\�9z%M�+���y�+��^\��\Z|\�Z\�N\�\�W\�D�\�+\0Z\�`�W�2\�U^ѫ�g�\�D/\�9z%M�+���y�+��^\��\Z|\�Z\�N\�\�W\�D�\�+\0Z\�`�W�2��Wރ\�m\�\�Xމ^�s\�J�HWz@K\�JW�6\��^�L42�\�\�^�=�\�\�9G���t�W\0��� �te0hS�\�An�6\�j�\�D/\�9z%M�+���y�+��^\��\Z|\�Z\�N\�\�W\�D�\�+\0Z\�`�W�2\�U^ѫ�g�\�D/\�9z%M�+���y�+��^\��\Z|\�Z\�N\�\�W\�D�\�+\0Z\�`�W�2��Wރ\�m\�\�Xމ^�s\�J�HWz@K-_��\�k\�\�������9\\U��?�6jS�\�\�DӖ��^MO\�Z\�N\�\�\\�W\�D�\�+\0Z\�N�j͚5}��d\�\�\�K/�SӟQ��W]߃�Wӓ�WiO&zy�\�+i\"]\�\0-�bŊw�\�7�^��Z��OO\�\�՗\\r\�Oʡ\�2oKFm�W\���&�W\�D�\�+\0Z,~\�+�en/S��G��w��N\r\�߳\�K��\'z%MD���t�W\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@G�����\�\�\0\0\0\0IEND�B`�',1),('1820703376704737283',1,'请假流程（子流程）-leave6.bpmn20.xml','1820703376704737282',_binary '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:bioc=\"http://bpmn.io/schema/bpmn/biocolor/1.0\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:di=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"leave6\" name=\"请假流程（子流程）\">\n    <startEvent id=\"startNode1\" name=\"开始\">\n      <outgoing>Flow_1mu0fz5</outgoing>\n    </startEvent>\n    <userTask id=\"Activity_0zy3g6j\" name=\"申请人\" flowable:formKey=\"static:1\">\n      <incoming>Flow_1mu0fz5</incoming>\n      <outgoing>Flow_03931vt</outgoing>\n    </userTask>\n    <sequenceFlow id=\"Flow_1mu0fz5\" sourceRef=\"startNode1\" targetRef=\"Activity_0zy3g6j\" />\n    <sequenceFlow id=\"Flow_03931vt\" sourceRef=\"Activity_0zy3g6j\" targetRef=\"Activity_15to8yb\" />\n    <subProcess id=\"Activity_15to8yb\">\n      <incoming>Flow_03931vt</incoming>\n      <outgoing>Flow_0e4ru1l</outgoing>\n      <startEvent id=\"Event_14f0d54\">\n        <outgoing>Flow_0y1q06j</outgoing>\n      </startEvent>\n      <userTask id=\"Activity_0x88dc2\" name=\"组长\" flowable:assignee=\"1\">\n        <extensionElements />\n        <incoming>Flow_0y1q06j</incoming>\n        <outgoing>Flow_1kj44n7</outgoing>\n      </userTask>\n      <sequenceFlow id=\"Flow_0y1q06j\" sourceRef=\"Event_14f0d54\" targetRef=\"Activity_0x88dc2\" />\n      <userTask id=\"Activity_15z7u3k\" name=\"部门副经理\" flowable:assignee=\"1\">\n        <extensionElements />\n        <incoming>Flow_1kj44n7</incoming>\n        <outgoing>Flow_1lrkvhq</outgoing>\n      </userTask>\n      <sequenceFlow id=\"Flow_1kj44n7\" sourceRef=\"Activity_0x88dc2\" targetRef=\"Activity_15z7u3k\" />\n      <userTask id=\"Activity_1p3e8iu\" name=\"部门经理\" flowable:assignee=\"1\">\n        <extensionElements />\n        <incoming>Flow_1lrkvhq</incoming>\n        <outgoing>Flow_161ozbd</outgoing>\n      </userTask>\n      <sequenceFlow id=\"Flow_1lrkvhq\" sourceRef=\"Activity_15z7u3k\" targetRef=\"Activity_1p3e8iu\" />\n      <endEvent id=\"Event_0ategpj\">\n        <incoming>Flow_161ozbd</incoming>\n      </endEvent>\n      <sequenceFlow id=\"Flow_161ozbd\" sourceRef=\"Activity_1p3e8iu\" targetRef=\"Event_0ategpj\" />\n    </subProcess>\n    <userTask id=\"Activity_03nnma3\" name=\"总经理\" flowable:assignee=\"1\">\n      <extensionElements />\n      <incoming>Flow_0e4ru1l</incoming>\n      <outgoing>Flow_19akbau</outgoing>\n    </userTask>\n    <sequenceFlow id=\"Flow_0e4ru1l\" sourceRef=\"Activity_15to8yb\" targetRef=\"Activity_03nnma3\" />\n    <endEvent id=\"Event_1ixvcma\">\n      <incoming>Flow_19akbau</incoming>\n    </endEvent>\n    <sequenceFlow id=\"Flow_19akbau\" sourceRef=\"Activity_03nnma3\" targetRef=\"Event_1ixvcma\" />\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_flow\">\n    <bpmndi:BPMNPlane id=\"BPMNPlane_flow\" bpmnElement=\"leave6\">\n      <bpmndi:BPMNShape id=\"BPMNShape_startNode1\" bpmnElement=\"startNode1\" bioc:stroke=\"\">\n        <omgdc:Bounds x=\"240\" y=\"200\" width=\"30\" height=\"30\" />\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds x=\"242\" y=\"237\" width=\"23\" height=\"14\" />\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_0zy3g6j_di\" bpmnElement=\"Activity_0zy3g6j\">\n        <omgdc:Bounds x=\"320\" y=\"175\" width=\"100\" height=\"80\" />\n        <bpmndi:BPMNLabel />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_0b5ys91_di\" bpmnElement=\"Activity_15to8yb\" isExpanded=\"true\">\n        <omgdc:Bounds x=\"460\" y=\"115\" width=\"750\" height=\"200\" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Event_14f0d54_di\" bpmnElement=\"Event_14f0d54\">\n        <omgdc:Bounds x=\"500.33333333333326\" y=\"197\" width=\"36\" height=\"36\" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_0x88dc2_di\" bpmnElement=\"Activity_0x88dc2\">\n        <omgdc:Bounds x=\"590\" y=\"175\" width=\"100\" height=\"80\" />\n        <bpmndi:BPMNLabel />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_15z7u3k_di\" bpmnElement=\"Activity_15z7u3k\">\n        <omgdc:Bounds x=\"750\" y=\"175\" width=\"100\" height=\"80\" />\n        <bpmndi:BPMNLabel />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_1p3e8iu_di\" bpmnElement=\"Activity_1p3e8iu\">\n        <omgdc:Bounds x=\"910\" y=\"175\" width=\"100\" height=\"80\" />\n        <bpmndi:BPMNLabel />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Event_0ategpj_di\" bpmnElement=\"Event_0ategpj\">\n        <omgdc:Bounds x=\"1072\" y=\"197\" width=\"36\" height=\"36\" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge id=\"Flow_0y1q06j_di\" bpmnElement=\"Flow_0y1q06j\">\n        <di:waypoint x=\"536\" y=\"215\" />\n        <di:waypoint x=\"590\" y=\"215\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_1kj44n7_di\" bpmnElement=\"Flow_1kj44n7\">\n        <di:waypoint x=\"690\" y=\"215\" />\n        <di:waypoint x=\"750\" y=\"215\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_1lrkvhq_di\" bpmnElement=\"Flow_1lrkvhq\">\n        <di:waypoint x=\"850\" y=\"215\" />\n        <di:waypoint x=\"910\" y=\"215\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_161ozbd_di\" bpmnElement=\"Flow_161ozbd\">\n        <di:waypoint x=\"1010\" y=\"215\" />\n        <di:waypoint x=\"1072\" y=\"215\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNShape id=\"Activity_03nnma3_di\" bpmnElement=\"Activity_03nnma3\">\n        <omgdc:Bounds x=\"1260\" y=\"175\" width=\"100\" height=\"80\" />\n        <bpmndi:BPMNLabel />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Event_1ixvcma_di\" bpmnElement=\"Event_1ixvcma\">\n        <omgdc:Bounds x=\"1412\" y=\"197\" width=\"36\" height=\"36\" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge id=\"Flow_1mu0fz5_di\" bpmnElement=\"Flow_1mu0fz5\">\n        <di:waypoint x=\"270\" y=\"215\" />\n        <di:waypoint x=\"320\" y=\"215\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_03931vt_di\" bpmnElement=\"Flow_03931vt\">\n        <di:waypoint x=\"420\" y=\"215\" />\n        <di:waypoint x=\"460\" y=\"215\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_0e4ru1l_di\" bpmnElement=\"Flow_0e4ru1l\">\n        <di:waypoint x=\"1210\" y=\"215\" />\n        <di:waypoint x=\"1260\" y=\"215\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_19akbau_di\" bpmnElement=\"Flow_19akbau\">\n        <di:waypoint x=\"1360\" y=\"215\" />\n        <di:waypoint x=\"1412\" y=\"215\" />\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('1820703377069641730',1,'请假流程（子流程）-leave6.leave6.png','1820703376704737282',_binary '�PNG\r\n\Z\n\0\0\0\rIHDR\0\0�\0\0E\0\0\09=?\0\04\�IDATx^\�\��\\ey7p���Rz\�\�[Koj�\�\���]\�ji�vY-NP ���E�\�[Z�~ �jk�D�\�M6 \�/@D.*�$%j\�7\�Ȝo\�s$\�\�w\����\���\�\�3{\'\�9\��\�w\�\�\�i\'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�ɬY�\�\�>�蛟�\�\�~k�]viz7)��RJ)�Z�\��\�\�}��\�|\�Wv\�}\�7\���\�N\0\0P�X\�~\�\�\����\�%\�\r7\�\�l޼�\0\0\��<\��_�\�_|k\�]w�n\'�\�\0\0\�쨣���\�/~q\�\�\0\0@!\�\�c��{\�}Y\�\�\0\0P�\���\��V�\�\0\0�\�\�{�\�o\�Y\0\0�\�<\�\�D\0\0�`�\�{\�}S\�\�\0\0P���\0�\�Dn\�A\0\0j�32\0\0P�\�\�9\�\0@MrF\0\0\n�=y\0\0�I\�\�\0\0@a\"�\� \0\05\�\0\0(L\�\�\�\0�&9#\0\0��ܞ�<\0\0\�$gd\0\0�0�\�s�\0��\�\0\0&r{\�\0\0P���\0�\�Dn\�A\0\0j�32\0\0P�\�\�9\�\0@MrF\0\0\n�=y\0\0�I\�\�\0\0@a\"�\� \0\05\�\0\0(L\�\�\�\0�&9#\0\0��ܞ�<\0\0\�$gd\0\0�0�\�s�\0��\�\0\0&r{\�\0\0P���\0�\�Dn\�A\0\0j�32\0\0P�\�\�9\�\0@MrF\0\0\n�=y\0\0�I\�\�\0\0@a\"�\� \0\05\�\0\0(L\�\�\�\0�&9#\0\0��ܞ�<\0\0\�$gd\0\0�0�\�s�\0��\�\0\0&r{\�\0\0P���\0�\�Dn\�A\0\0j�32\0\0P�\�\�9\�\0@MrF\0\0\n�=y\0\0�I\�\�\0\0@a\"�\� \0\05\�\0\0(L\�\�\�\0�&9#\0\0��ܞ�<\0\0\�$gd\0\0�0�\�s�\0��\�\0\0&r{\�\0\0P���\0�\�Dn\�A\0\0j�32\0\0P�\�\�9\�\0@MrF\0\0\n�=y\0\0�I\�\�\0\0@a\"�\� \0\05\�\0\0(L\�\�\�\0�&9#\0\0��ܞ�<\0\0\�$gd\0\0�0�\�s�\0��\�\0\0&r{\�\0\0P���\0�\�Dn\�A\0\0j�32\0\0P�\�\�9\�\0@MrF\0\0\n�=y\0\0�I\�\�\0\0@a\"�\� \0\05\�\0\0(L\�\�\�\0�&9#\0\0��ܞ�<\0\0\�$gd\0\0�0�\�s�\0��\�\0\0&r{\�\0\0P���\0�\�Dn\�A\0\0j�32\0\0P�\�\�9\�\0@MrF\0\0\n�=y\0\0�I\�\�\0\0@a\"�\� \0\05\�\0\0(L\�\�\�\0�&9#\0\0��ܞ�<\0\0\�$gd\0\0�0�\�s�\0\�^\�\�\�\�\��\�\�\�_��+V4�\�\�\�<W\���\�+W��ꪫ^�>\��J\�s\�=Mo܈��\�\�j\�+�߯�\�殻\�\�?�*\�vK�\�6�\���يܞ�|5櫭W\�\�\0��^(8�\��\�<\��\�ƍ�͛7�y�������\�_\��\�QarF�B��c\�h�\�\�\�W_]\�b��k�\���k�j\�?E\�\�\�\�|��\�\�|�q�lǓR~�R\�_k׮}�>�F�\��\nř�ƍ2jݺu\�UW]�DcM��S�O�Y5\��\"r{\�]d�ZNud�\n�8��gye����C/l\�?�\�\�L��\�\�\�F��5�WN\�?\�f\�\�0�\�\�9\�w�q��\�\�|�q���ګ�y\�QarF�Bƍ�����WV\�?\�f\�\�0�\�\�9\�w�q��\��|�q6\�`\�\���m\�\�=ͭW�\�~\�\�q[\�Nm_u \�L��eUm9���\�ӗ������`�\�s�\�\"\�nYՁ�*\0\�l6�`\�#\�7�\\��\�3=~��\�⾼�\�\�\�@0\��\n7ʪ\�r\�_Y����������`�\�s�\�\"\�nYՁ�*\0\�l6�\�\�[/�\nu߭O\�^m{u \�L��eUm9���\�SK�\�_\�\�0�\�\�9\�w�q��\��|�q6�`��\�N	���\�\�j۫� gd*d\�(�j[\�\�e���Z�o�����QDn\�A����eU\�\0��\��[>vҔ@0��/o���:rF�Bƍ�����WV鿩��\�j\�?E\�\�\�ȸ[Vu`�\n�8ʪ�����q���m!G��U�oj\���\��F�=�.2\�U��0\�f\�S�s Tܗ�W\�^9#S!\�FYU\�B��+�\�\�\�\�\�W�\��\"r{\�]d\�-�:0_`�\�&\�\��3%*\�\�۫m������q���m!G��U�oj\���\��F�=�.2\�U��0\�f���\�-W�qJ(�\�⾼�\�\�\�@0\��\n7ʪ\�r\�_Y����������`�\�s�\�\"\�nYՁ�*\0\�l6� ꋟzߔ`�\�\�\�\�U�A\�\�TȸQVն���\�*�7}\���\��F�=�.2\�U��0\�f6mj\�\�S�A\�\�M\�^msu \�L��eUm9���\�Ӕ������`�\�s�\�\"\�nYՁ�*\0\�\�ɂ��G\�o�\��wL	���b��}j۪� gd*d\�(�j[\�\�e��۲\�\��Vm���ܞ�|w˪\�Wg3�M���w\\\�|\����\\�Ml\�\�\�\������q���m!G��U�\�\��Tm���ܞ�|w˪\�Wg\��\'{U{�\�j\�\�W�A\�\�TȸQVն���\�*���ڬ\��F�=�.2\�U��0Φ�yU{��\�͏�f_9#S!\�FYU\�B��+�\���k�j\�?E\�\�\�ȸ[Vu`�\n�8�.\�\'�Q+?��}u \�L��eUm9���\���ͪ��`�\�s�\�\"\�nYՁ�*\0\�l�`�ګ�����q���m!G��U�O�Y�\�߶z衇�s\�=�Y�lYs\��7�\��\�~�MV�=n��c�؞\�ܞ�|w˪\�W\�ԢE��\�7\�^�`��\��\\ѫ/\�\�O��\�g�}\�\�\�\�\�\�\0`;eU�A\�ȝ\�\�c�5+W�l\�8\�椓N\�O\��.]ڟ\�-Y��9��\�7�\�\�\�\��\�\�ꫯ\�o���Ҫ���WV\�?\�f\�\���\�\�\'sͨ\�\�OwEn\�A����eU\�sbbb\�E��qy�6\�\�\�I*�_ߟ�m �U9#w\�\�\�ޜv\�i͡�ڜp\�	\��\�\�\�x\�\�]w\�\�<�\�\��m\�\��{\�\�\�v�rH󖷼�Y�zuzĺ7ʪ\�r\�_Y��T�U[�\�֊+�E�\�Ŕm�x�x<�\'r{\�]d\�-�:0_ݡ&&&\�썅�\�ظ��*/\��eU�A\�ȝ�v\�\�\�mo{[��.h֯_�7٪\�>�/�O=\�\�f͚5y�*7ʪ\�r\�_Y��T�U[�=�o|\�\�q\��N�u\�1\�4\�w\�V_���c���Q\�\��tG\�\�\�ȸ[Vu`��C,Z�\�,8�7�=�\�\�\�O�Ǎ\�\���\�S�\�\�\�_�\�\��\�}W�|\�\��p\�	�.]\���,Y\�\�^0{�w۝��r\�ix\�\���Ǚ`PVu l��;\�\�/\�/@�s\�9͆\r\�\�#�\�ǉ\�I\�\�vm�eUm9���\��ͪ���\�;\�h8\��-L.\\؜}\�\�\�}\�ݗ7ߪ\�>�/��\�\�\�c?tC\�\�\�ȸ[Vu`��\�z\�\�\���\�\�W���\�}�\�O�\�\�\�\��7�\�[�/n\�<\�\�fժUӾj�\��|\�cGy\�݇r\�^�\�Ƒ`PVu l�\�\�\�z׻�\�?���\�\�]\�%/�!y�\�\�ƚq���m!G��U�O�Y�\�\�Ln��\�)\��ַ���\�\�{\�#�\�\�ɋ9�?\��=�.2\�U��n����_\�\��\�1�\�\�\�\�_>�R�V�:��SN\�o\���\�g�!m�]l\�QG}�կ~\�M,xf~\�q\"�U�W�xq	�׿�\�\�#�<�\�\�!\�q_\��\�\�\�Q\�FYU\�B��+�\��j�j\�\�\�\�Ëر\�|\�E\�ͶK<\�\�ل\�3�\��=�.2\�U��n���{&\�\�\"\�|�����\�\�T�76|\�\�_~\�a�\�\\r\�%\�w�\�<v\�J|_|��E��>Ο0+�U�W�h\�|\�;�\�\�;�\�\�O<\�\��H\���QVն���\�*��ڬ\��/�kV_N\������\�q\�\�����fv\�\"�\� \�E\�ݲ�\�\�m׬��\�|�����kfC�zc\�\�,_���\�[�?��\�\�\�b�\�\�,^���.<8\�oeU�A�)V�\�}\�G\�ٙ\�Y\�\'ƞ\�\�??\�5v�eUm9���\��ͪ���\�v��K~\�\��I��\\�\�s�\�\"\�nYՁ�\�6y\�[Oc����\nę\�K�,ix\��<Nl�x�<pþ�\��¼Ϯʪ��\�Q��P��.���&\����-Z�h\�\�\Z\�FYU\�B��+�\��j�j\�a+V�>����\�\�!\�3�\�8\��=�.2\�U���lbbb\�\�x\�X\�\�\�cq�؀1v\�u\��\�;\�L\�\���p��\�\�>\�\��\�2���\�@0ȿ\ZE�\�8\�s\�\�\�\�\�}\�\�_/۸QVն���\�*��ڬ\��oX�p>X\0�\�3��?�,��2En\�A����eU\�#\�e�JO\�8\�c�\���\�7�\�M\�\�s\�\�/|d\��\��w�`PVu \�_�\�^��9\�C�G}4\�5/b�tPs\�m�\�Ɔq���m!G��U�O�Y�\�\�@oN2�\�oM�\�\�{\�&s*\�7���8\��=�.2\�U���$\�u_\�x:�W\0�q饗�}\�1\�l\�;\�V<�\�ŋ\�\��\�c\�*���\�@0ȿ\�9\�S�\�˗\�\�\�\\Мp\�	�\�a\�(�j[\�\�e��SmVm�7�\�1X\�8�\�\�\�\�\"\�;8�8\��=�.2\�U����7�-/i<�\�\�\���\�\���z�\�_��믿>�s\�\�k��jop�&GW	eU�A��(\�c�=ֿ6\��>�\�W��W�\�U�\�Gƍ�����WV\�?\�f\�\�!2\�ЂǼ�=8�>���SEn\�A����eU櫳�p\�§\�Ưͅ���\�\�c\�\�{Y\\F`��b?�\��W\�\�g�g\�c)Io\0��W\�Ϸg�AY\�V0�m�\�T�Bv|\�вe\�\�ͭ8�裛+��2\�\\��>��\�%��eո,\�\�n��Smָ\�\��l�\�\�sϝ\\\��w��)\�?8�8.\��=��\�v�a\�-�ښ��j6�ջ\�\�\�8�|��9\�s>v\�g\�q`N�|\�ɷ,X�`i>��\r�[�����`0\�~٩\��\����\�\�??\�܊}\�C��\�\�A<\�DڸQV�\�B��\�f\�?\�f�K�\r̦\���v\���\�\�\�*\�?8�RN$\���ܞ�|If;�0\�Um\�WG5��\�\���\�\�8�|��9\�S\�\�\�eE��\�\�[\�+�\�EC�\�Vp���j+̶_v*|!��\�on�\�\�|s+\�8^�\�W盋��`���q��\Z���\�\�\��\�\Z���M\�m��?\��Omq\�|��+e�ܞ�|Ir�\�7\��ø[V�5_\�l�kbb\�\�\�8�\�\�\�̲e\�6\�}\�\�y�S�\�~��z\�\r�XJ2\��=\�\0.�Um�i�d\�~٩\��\�#�<��\�\�`&qq�\�.�\�\�߯<�6n�U㲐��N�u�\��j�ƥ�r�Mׇ.���\�\��Ke�\�>�ዓ�|��\�\�|�\�jk�:�i�jJ\���gp{I\�iW�\�\0\�dɒ%�\�+_\�\���z�\�7\���\�d�;W\0/9�\���O\�裏N�}��馛��}\�kSn\��\��/|a\�\�%T[�`��\�\�\n_Ȏ�\�|�3�\�8\��\�\�E�\�\�E\r&\�%���\�g>\�lذ��\�ƍ\'o�\�7�1e\�u\�\�5�W�\�\�5k\�l\�}%׸,\�\�~\�5_�}s\�-�L�=��}�iӦ-��\�g?\�<\�\�#S#\�\��\�ۆ+���{\�\�\�\��x�Z�~��\�+�/\�\��\�\\\�eW�l�\Z��\�}�+�pbbb\�\�mg�\��\�X\�(K\�\�����{��z�\�\�\�\��#s\�m\�\�1v�jk�:�i�)W\�\�7/l<}4�{�1\�\�W���\����ǁ9\�\�ߣ\������A�\\\�\�\�>\���\�_��׷�דּ\�j����y�\�\�z\�q6H|�\�CMy�A]q\�\�\�;\�ܬZ�j\�}mW���V;������\��x0�8���7.UҸ1S�\�_�U\�\�׾�?Q�\�\��\�&>8\�\��\����\�b\�\�n������\��\�\��=��\�\���F}~\�+�|ƽ\��\�\�\�~\�\��\�1Y�3d\�\�x`�/\�\��7\���>�\�_��_hn�\�\�\�c��\��\�\�c�\�c\����ኾ\\�h\�\�dv\�\�wo��\�\�\�X�ti\�򗿼��\�˷��_�\�_\�bAsP1��	\�ڵk��=.s��ݑ�>\�^s\�3\�\\\�eԨ}\�V�MW�\�S[��yr֡,�_�Zm��3U����vZ�\�~\���\�v�!s�:Ɩ4�\�T�\�3.U\�x���\���\�;\�\�\��\�\��\�\�\�ܯ�gd_�_�oՊW��\�O�dr\�\��?���\'��:/*\�+\�Oy\�S��>���:�@��\�\�\��s\�9g\�>�\"p\��\��3�\�}mW[�pO\�\'\�\�\�N�/dt\�A���>\�\�W�\"\�\\�i~��\�\�[\�c2\�\�g?��c�\�?���\�\�\�>\�\�_�\�\�1a�ٟ�\�ɿ�\�5�\�/\�\�s\�=S�\�\Z�3s\�\�w�\�\�\�q\�\�>y\�s�\��\�\��N\�ۿ�\�\�QG\��گ�Z�x�5�w\�\��`٘�\�\����I\�\�]\0W]uU\�\��\�[<��\��\�\�/}\�/�<�\�\��\�x���}\���\�ƻba�\�_�r�\��￿{|\�G1��q,�ǋ\���\����1n����\�\�;�7�5�}9\�>�*�צ�q鿁\�\�\��3���\�\�C�8�χ\�\��\n��F\�X�뮻\�_������ؚOȊ�\�[\��:S�5_\�4}5��\�\�\��텍�\�Ȇqv\�\�>:\�\�3�\�\�>�_\����E ()\�z\�\�/�\�/M�=�\�?�\�O\��>\�\�S�׽\�u[l�\���\��?�\���?i�E\�\�Ţ\�\�\��/K\�\��������YM�����`0\�~٩\��\��p\��f\�}\�%�\�\�@I\�\�t\����\��\�\�b�\�\�?�\�\�=\�Bv|`h|\�Lo\�/�\�e!����/b0\��|�\��baL@c�0��˿�\�\�m/�\��\�E/zѴ���Im<�\r\�\�������u,X?\��\�\��C?\�C�	p<�\r�\�E�\��\�}�O�������2\�{n����\���x\�x\�&w\�ʕ�\�\�g\�/k\�\��?�?\r�H3��\�\�/G鳨�{m�\Z���M�F6��=��\�~\�o��G\�\�L\��w��\��j�\�3\��8�\�\��ק�#x�1�\�\�u�jk�:�\�\�\�~��\r�\�\�O�B��9�>�\�_\�\\�\�c)\�\�\�a%�XL�	�\�-W?\�?\�?{-��3\�\�\�!�]�i�LǤ���N\���Bvl�M\�Gԛ\��\�-��j+̶_v*|!;Τ��pK�<}\�a�囋6\�\�&\�\�J\Z7rŋ_O}\�S�;?\�s?\�?�%ޡ18�\�\��]Ȏ\�&.Uu�\�oq_\�\����R�/\�Iq\�g\��#���E,�\�\�h.�\�\�\�\�>\�l��8\\y�0*^<���稘\�ٵq�\���\�x��~\�_\�&ƒ\�\�\���\���D��\�8\�\�[b\���3�c3\�\���=��oG����\�\�}�-}\�f�MW\�\��\�øo�]�\�\��>f\��=��\�v�\�ָ;]\�	Tq�\�\�mq����Ӄږ1��\�u�jk�:�\�\�\�\�\�\�U%��q\\�X�1r\�\�\'��~>q\��,X�`i>��lm�VR0�뮻�zF\�`\�9δ~\����\�\��t\�Y������rʔ\�T���?�O�\�k�\�\n�헝\n_\�~\�\�\�|\�C\�7�\�\���\��=\�%[�8+i\�\�ׇ����\�[\�㶙\�Ȏ?c̈�o�ş\�qƂc\�gw\���T㲐\�v�\�\�\�S����\�����y�o�7\�<?\�c?\�|\�s�\�\�\�`��.�hV�Qq&m\\k�]v\�\�U��_�x\��ǎm\�\���bŊ�v1\�}ի^տ\�\�m\�\�X��\�\\v\�e�c�\�k\�\�9\�z�1��\�r\r�\�\�\�?�\�S�oG���ۚ���\�\�\�%\�\�t5.�70�>\\�l\�\�bG�\�٦\��\�X\�(K\�\�\�K2\��\�|��[����\��\�r ÷�2Ɩ:�\�Tm\�WG5��\�\���\�\�8�|��\�\r\�/^����<̉\�~\�\��\��I\�3\�tQI� Ί\�\�B\�\�E\�-�1���?�\�7\�zֳ&\�䎳�c����\�\��\�\�#%���:\�DQ��\�\�\�c�\�7�\"\�Ǝ\�G��\�\�z�\�\�\�_\���bgdƇ�$�c2o\���H\\�泟�\�\�,�\�m!\�\�\�e��w\�y\�K^\����\n\�q\��gD\�\�qi��:�h6��z\�Ӟ\��3>�\���n\�?OE\rn,d\�X\�}q��xQ�i�ς��ώ�boa�kf�\�_�u�\�ȷ\�~{�E�᳸\�\��||;�\�\�\�\�\\\�\�}\�v�MW�\�_�K;\�\�<����\�qQ�\�\�9\�wQ\�\�L\��\��,X\��c���\�R#\�ۍ:Ɩ8�\�T��\�Zo\�ڻ�\�\�裏~|h!{\�|���9\�\�#�8_��\�?��\��rM>��*)�^�z���3=\��\��b\�ju\\`p\�`q ?~\�;\��\�\��\��_\�ٚ\�w���][Ձ`�%�/h-Z��D�b�q\��z�m��4n\�K�\�Y�1����8\�e�3�5��\�P|�Νw\�9\�K�\�r\��\�ŧ�u�\��?�\�?\�\�T|XS�/t\�;?\��ٞ�:�\���\�\�O^\�\�\"{\�w�E\�j�\�v\�?�\r�cR\�Ҍ33cB�q\�\��7^��\�ü���u5\�äbq\�\�,�����\��\�\�\�Q��\�\�/��Ϣ\�\�骶��1�;�?�6\�~���\�\�\�T�\�s�\�6\�\�\�*\�\�\��\�׾�?\�\�e-\�]31\�;�\����\�2Ɩ6�\�T��\�\��\��66�n�\�\�\�\n��\�@�\�QG\�\�\�|\�;yLءz�oo`�c\�}\�}A>��*%D\�R��=��\�\�\�\�E\�\�oǊ\�\�d\�?�\�?fuFv\\O2\�ƌ\�\rn{�^\�\r�\Z�mU�A��(N|X_�HѦ\��\����0\�UI\�F��(\�\�\�$#\�t9�쳧,d\�\�\�?<y\�\�Bv�\�o\�3�g�\�ؒ�����\�8�?�\'gX���A���\����\�Z\�\��\�\�v���\Z\\B$���\�}��\�o\�\�|L��>�\�\�\�\�\�\�u�\�8��nذa\�\�\�\�\�{{\�g\�7���\�\�gqE\�\���o\�k.�r\�>�j�צ�\��o`\�ҥ��\�<׆\�\�\�\�x(O\�\�仨�qw����#ƻzc\�<\�\�/����c,�ێ:Ɩ8�\�T����7�-/i<�\�\�\���#�8\�K.�\�\�<(\�@��\�?�\�{z\�%y\�]VJ0��b��jժ)�Gœ{L\�\" ĥEgd\�D.\�\�1����\�\��\���W\�\�4\�\��Q�\��8q�Z\\�._b�q6vǸʿG%UL&v\�y\�樣�꿠?q�\��[9\�w=\�j\�k��&\'7\�|s���X`�3�\�z�\�o�\�\�x�lɒ%S\�SRն�3��� _\�\�p,\ZƂaL$��կ6\�֭�\�6�{\�6\�\�gV\�ٱ\�I\\�r���\����\�\�\�\�oQ�\��3�~\�~��K��bQ��9\�]`���\�Ό�\�E\�\�\�x\��bb}\�YgM��;|]\�8\�;.Kǖ��;�\�\�\�\�\\\�\�(}g\�u\\\�\�骶��\���G\\s�\�\"��\�~\�\�Cy\"�\� \�Em���\"F���\�\���\�Qq�\�8\�xN�05\�[\�s�(Ձ�\�H\�\�w\��=�\��\�\'/+Ǔ�S�p��\� �\�\��|v�ޓ\�9��em\�\'\�\�J3UL\�b�)\�>��~X�g\��\�\��]�\�3\�8��a1\�l�Ƙ�E\0ɏ�\�\�g*\��\�:\�F�\�l\���\�7ϋ\�O?�9\�\�\�c�\�q#*ޖF\�_�v\��s\�x\�\�<g\�g\��\��\�g$�X�-\�\�e�\�[\�\�,��:Μ�?c�0&�y\��`ٸ~�=^ ��>l4*3\�\�\Z\�.z\�\�k�\�\�sp\��}\�oO�\�\������3^D[�~���\�\�\�\�\�\\\�\�(}\�v�MW�\�߰x\�u�\�\�ַ�5\�=�b�}\�qP�\�\�9\�wQ\�\�\�*\�q	\�X؎�\�]Nw\r\�Q\�\�\�י�\�Ց\�ƲU%��q�؀1711\�:\�\�\�\�\�K_�\�ŽAe\�8�:VZ0��d\�\�j�\�u�:\�G�\",\�Y�\�\�\�|�KTċ\"��qV򸱭5<\�\�Zն�3\��\�1\�\�\�֞{�\�~\\K��S�\�U[�\r�K\�-~\�?�a>\�~�\�\�A�\"�\� \�E���\�Ձ�\�\�&&&\�\�g��<�>Ǒ�\r��>\��\�Qgf?q&\���:(\�keU�A�)V�\��\�?�_�\�W��\�\�qg\�(�j[\�\�e��SmVm��w\�q�� \�Bz��q.\�\�\�en���S�\�\�9\�w�q��\��|u�,X�\��\�\�\�K�\��\�1�3�_�\�W>r\�>��\0\��\�5�׍\�\��AYՁ`�U�\�����\�\����K\��\�V\�\�_\r�eUm9���\��ͪ�����V\\Gw�\�ҝ�ŗx\�\�˙\�~c��+r{\�]d\�-�:0_\�&�\�\��\�\�\�8�N����\�c*�`��g.\\�\�\�ŋ��\�\�k��\�c�\�\�cZ�\��\�?x^o0��W�\�\�\�\�\'�AYՁ`�e�\��׼�9\�\�#\�\�\�\��p�C=���Z7ʪ\�r\�_Y��T�U[�M\�;\�\�\�\�\�.�(o�]\�\�\�Ď}\�~)[\�\�\�ȸ[Vu`��\�z\�\�w\�\�\�3��\�\�\��X��\�\�/\�\r+\�\����t\�I�[�b\�-�\�~�==\�\�\�{\�Ȇ|\�\�[o�\�S�\�G.<\�\�#/\�m�Plߗk	eU�A~.\�8S:>�\�;\�\�wm���\�+^\�j\�\�0n�U�-\�迲J��6����I�\�7�� v\�\�\�MGߟ>�l^\�rώ�=�.2\�U��n����_^̞\�\�4\��\�\�\0з\�>�<�7P,Y�`�E�??948ş�|\�\�%�]�\�q&�U�9�3\�\�\��\�󶷽�ٰaC�{$\�⧞zj2W\�5�3\�FYU\�B��+�\��j�j뿭�3��/39\�\�\��C�c����8�\�L\�\�ܞ�|w˪\�W�\�~\�=3{\�2#;b<MgaG\�\�;`T�AYՁ`���;e͚5\�	\'�\�_\�~\��\�\�<�\��y��Z�n]s\�Yg\��L<N<^��eUm9���\��ͪ���L\\�z� �+>3\�\�\�kn�\�\�殻\�\�_\Z-ğ\�\��=\�\�\�\�F\�\�&v�Dn\�A����eU\�;D\\����\�гO�>�\�)\���\�\�\0\�H0(�:RD\�\�n��9\�\�c�\�{\\�xq�U\�k�����\�\�\�\���?W�^ݬ\\��9\�3��\�\�\�\�\�\�̸QVն���\�*��ڬ\��o�V�X�\�3nO\�\�\�\�\�=�\�s�\�\"\�nYՁ�\�՛�\�\�W\�qkU<^\�\0#ʪ���;->\��+�h��\���9\�\�����\�h\�\��{\�\�\�v��\�\�qg\�(�j[\�\�e��SmVm�7�/��Y�ti^H�U\�\�\�\�\�]�\�s�\�\"\�nYՁ�ꜘ��xQol\\ޫ\�y�|��\�\�\�\�\�`eU�A\�\�TȸQVն���\�*��ڬ\��o[=\�\�C͹\�\�,[��9�\����X^h��\�\�ql\�\�}�\�s�\�\"\�nYՁ�\�Z�h\�\�z\�\�\�,�\�ޟ+z\�\�^}\�\�4����x\���c��\0l���\�@0\��\n7ʪ\�r\�_Y��T�U[��(\"�\� \�E\�ݲ�\�U\0ƙ`PVu \�L��eUm9���\��ͪ��`�\�s�\�\"\�nYՁ�*\0\�L0(�:rF�Bƍ�����WV\�?\�f\�\�0�\�\�9\�w�q��\��|�q&�U9#S!\�FYU\�B��+�\��j�j\�?E\�\�\�ȸ[Vu`�\n�8ʪ�����q���m!G��U�O�Y�\��\"r{\�]d\�-�:0_`�	eU�A\�\�TȸQVն���\�*��ڬ\��F�=�.2\�U��0\����� gd*d\�(�j[\�\�e��SmVm���ܞ�|w˪\�Wg�AYՁ`�322n�U�-\�迲J��6����QDn\�A����eU\�\0�3���\�@0\��\n7ʪ\�r\�_Y��T�U[��(\"�\� \�E\�ݲ�\�U\0ƙ`PVu \�L��eUm9���\��ͪ��`�\�s�\�\"\�nYՁ�*\0\�L0(�:rF�Bƍ�����WV\�?\�f\�\�0�\�\�9\�w�q��\��|�q&�U9#S!\�FYU\�B��+�\��j�j\�?E\�\�\�ȸ[Vu`�\n�8ʪ�����q���m!G��U�O�Y�\��\"r{\�]d\�-�:0_`�	eU�A\�\�TȸQVն���\�*��ڬ\��F�=�.2\�U��0\����� gd*d\�(�j[\�\�e��SmVm���ܞ�|w˪\�Wg�AYՁ`�322n�U�-\�迲J��6����QDn\�A����eU\�\0�3���\�@0\��\n7ʪ\�r\�_Y��T�U[��(\"�\� \�E\�ݲ�\�U\0\�ي+߸q\�\'(5�\��9�\��M�gT����Po܈~�\�\�j�+~�-\�\�rJ��6�\���QDn\�A��\�W˩�\�Wg+W�\\\��Ly�R\�__�\�?\��\�?�\�\�L���\�ƸQF\�w\�}\�UW]�DcM��S�O�Y5\��\"r{\�]d�ZNud�\n�8\�M\0^�\��kk׮}\�+\�\�T\��}헾\��\�B�=�zq�&gd*t\�]w5W_}u�n\�:g&�T\���8W^ye�\�Q�\�~\�?�\�f\�\�0�\�\�9\�w��j�ձ�*\0\�.��\�\�^m��h�y�����.�����T,ęp\�\�������Zq\�_���\�_�Us��lEn\�A��>f�\�vui�\n\00)gd\0\0�0�\�s�\0��\�\0\0&r{\�\0\0P���\0�\�Dn\�A\0\0j�32\0\0P�\�\�9\�\0@MrF\0\0\n�=y\0\0�I\�\�\0\0@a\"�\� \0\05\�\0\0(L\�\�\�\0�&9#\0\0��ܞ�<\0\0\�$gd\0\0�0�\�s�\0��\�\0\0&r{\�\0\0P���\0�\�Dn\�A\0\0j�32\0\0P�\�\�9\�\0@MrF\0\0\n�=y\0\0�I\�\�\0\0@a\"�\� \0\05\�\0\0(L\�\�\�\0�&9#\0\0��ܞ�<\0\0\�$gd\0\0�0�\�s�\0��\�\0\0&r{\�\0\0P���\0�\�Dn\�A\0\0j�32\0\0P�\�\�9\�\0@MrF\0\0\n�=y\0\0�I\�\�\0\0@a\"�\� \0\05\�\0\0(L\�\�\�\0�&9#\0\0��ܞ�<\0\0\�$gd\0\0�0�\�s�\0��\�\0\0&r{\�\0\0P���\0�\�Dn\�A\0\0j�32\0\0P�\�\�9\�\0@MrF\0\0\n�=y\0\0�I\�\�\0\0@a\"�\� \0\05\�\0\0(L\�\�\�\0�&9#\0\0��ܞ�<\0\0\�$gd\0\0�0�\�s�\0��\�\0\0&r{\�\0\0P���\0�\�Dn\�A\0\0j�32\0\0P�\�\�9\�\0@MrF\0\0\n�=y\0\0�I\�\�\0\0@a\"�\� \0\05\�\0\0(L\�\�\�\0�&9#\0\0��ܞ�<\0\0\�$gd\0\0�0�\�s�\0��\�\0\0&r{\�\0\0P���\0�\�Dn\�A\0\0j�32\0\0P�\�\�9\�\0@MrF\0\0\n�=y\0\0�I\�\�\0\0@a\"�\� \0\05\�\0\0(L\�\�\�\0�&9#\0\0��ܞ�<\0\0\�$gd\0\0�0�\�s�\0��\�\0\0&r{\�\0\0P���\0�\�Dn\�A\0\0j�32\0\0P�\�\�9\�\0@MrF\0\0\n�=y\0\0�I\�\�\0\0@a\"�\� \0\05\�\0\0(L\�\�\�\0�\Z�\�\�\�7o\�9\0\0(ĦM�\�\�����\�\0�\Z\�~\���\�rV\0\0\nq饗^֋\�7\�,\0\0\�\�}\�\�߼\�^{}+�e\0\0�\�\�nW\�����\�\0�&;\�\�\�\�\�\�]�\�\�]f\0\0ڷiӦ�q&\�n�\�\��^f�:r{\�\0\0P�\�\�\�\�\�^m\�\�$��RJ)��j�\"�G>��n\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�\��}��*\�3�j\0\0\0\0IEND�B`�',1),('1820721459888590854',1,'hist.var-entity',NULL,_binary '�\�\0sr\0java.util.LinkedHashMap4�N\\l��\0Z\0accessOrderxr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0 \0\0\0t\0createBypt\0\ncreateTimept\0updateByt\0admint\0\nupdateTimet\02024-08-06 15:19:57t\0idt\01820702696808058882t\0usernamet\0admint\0durationt\02.50t\0	principalt\0admint\0contactPhonet\0111111111111t\0	leaveTypesr\0java.lang.Integer⠤\���8\0I\0valuexr\0java.lang.Number����\��\0\0xp\0\0\0t\0titlet\0	请年假t\0leaveReasont\0休息t\0	startDatet\02024-08-07 00:00:00t\0endDatet\02024-08-09 00:00:00x\0',NULL);
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
INSERT INTO `act_hi_actinst` VALUES ('1820721459888590858',1,'leave1:1:1820662237058514946','1820721459888590850','1820721459888590857','startNode1',NULL,NULL,'开始','startEvent',NULL,'2024-08-06 15:19:58.064','2024-08-06 15:19:58.064',1,0,NULL,''),('1820721459888590859',1,'leave1:1:1820662237058514946','1820721459888590850','1820721459888590857','Flow_1f4xioj',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-08-06 15:19:58.064','2024-08-06 15:19:58.064',2,0,NULL,''),('1820721459888590860',3,'leave1:1:1820662237058514946','1820721459888590850','1820721459888590857','Activity_14633hx','1820721459888590861',NULL,'申请人','userTask','1','2024-08-06 15:19:58.064','2024-08-06 15:20:04.712',3,6648,NULL,''),('1820721487784906753',1,'leave1:1:1820662237058514946','1820721459888590850','1820721459888590857','Flow_0cy98fl',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-08-06 15:20:04.715','2024-08-06 15:20:04.715',1,0,NULL,''),('1820721487801683970',3,'leave1:1:1820662237058514946','1820721459888590850','1820721459888590857','Activity_0lym9dc','1820721487801683971',NULL,'组长','userTask','1','2024-08-06 15:20:04.718','2024-08-06 15:20:04.893',2,175,NULL,''),('1820721488544075777',1,'leave1:1:1820662237058514946','1820721459888590850','1820721459888590857','Flow_1o16t5v',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-08-06 15:20:04.896','2024-08-06 15:20:04.896',1,0,NULL,''),('1820721488556658689',2,'leave1:1:1820662237058514946','1820721459888590850','1820721459888590857','Activity_1j25s1c','1820721488556658690',NULL,'部门领导','userTask','1','2024-08-06 15:20:04.898','2024-08-06 15:20:05.014',2,116,NULL,''),('1820721489051586562',1,'leave1:1:1820662237058514946','1820721459888590850','1820721459888590857','Flow_0s1t2f2',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-08-06 15:20:05.017','2024-08-06 15:20:05.017',1,0,NULL,''),('1820721489064169473',1,'leave1:1:1820662237058514946','1820721459888590850','1820721459888590857','Event_1jib7oq',NULL,NULL,NULL,'endEvent',NULL,'2024-08-06 15:20:05.019','2024-08-06 15:20:05.021',2,2,NULL,'');
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
INSERT INTO `act_hi_comment` VALUES ('1820721460295438339','event','2024-08-06 15:19:58.161','1','1820721459888590861',NULL,'AddUserLink','1_|_assignee',NULL),('1820721487663271938','pass','2024-08-06 15:20:04.686','1','1820721459888590861','1820721459888590850','AddComment','提交单据',_binary '提交单据'),('1820721488221114369','event','2024-08-06 15:20:04.819','1','1820721487801683971',NULL,'AddUserLink','1_|_assignee',NULL),('1820721488393080834','pass','2024-08-06 15:20:04.860','1','1820721487801683971','1820721459888590850','AddComment','流程引擎满足条件自动办理',_binary '流程引擎满足条件自动办理'),('1820721488917368834','pass','2024-08-06 15:20:04.985','1','1820721488556658690','1820721459888590850','AddComment','流程引擎满足条件自动办理',_binary '流程引擎满足条件自动办理');
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
INSERT INTO `act_hi_procinst` VALUES ('1820721459888590850',3,'1820721459888590850','1820702696808058882','leave1:1:1820662237058514946','2024-08-06 15:19:58.063','2024-08-06 15:20:05.057',6994,'1','startNode1','Event_1jib7oq',NULL,NULL,'','请假流程（普通流程）',NULL,NULL,NULL,NULL,NULL,NULL);
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
INSERT INTO `act_hi_taskinst` VALUES ('1820721459888590861',3,'leave1:1:1820662237058514946',NULL,'Activity_14633hx','1820721459888590850','1820721459888590857',NULL,NULL,NULL,NULL,NULL,'申请人',NULL,NULL,NULL,'1','2024-08-06 15:19:58.064',NULL,'2024-08-06 15:20:04.702',6638,NULL,50,NULL,'static:1',NULL,'','2024-08-06 15:20:04.702'),('1820721487801683971',3,'leave1:1:1820662237058514946',NULL,'Activity_0lym9dc','1820721459888590850','1820721459888590857',NULL,NULL,NULL,NULL,NULL,'组长',NULL,NULL,NULL,'1','2024-08-06 15:20:04.718',NULL,'2024-08-06 15:20:04.883',165,NULL,50,NULL,NULL,NULL,'','2024-08-06 15:20:04.883'),('1820721488556658690',2,'leave1:1:1820662237058514946',NULL,'Activity_1j25s1c','1820721459888590850','1820721459888590857',NULL,NULL,NULL,NULL,NULL,'部门领导',NULL,NULL,NULL,'1','2024-08-06 15:20:04.898',NULL,'2024-08-06 15:20:05.003',105,NULL,50,NULL,NULL,NULL,'','2024-08-06 15:20:05.003');
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
  `process_definition_id` varchar(255) NOT NULL COMMENT '流程定义id',
  `choose_way` varchar(255) DEFAULT NULL COMMENT '选择方式  role按角色选人  dept按部门选人  person自定义选人',
  `node_id` varchar(255) NOT NULL COMMENT '流程节点id',
  `node_name` varchar(255) NOT NULL COMMENT '流程节点名称',
  `assignee` varchar(255) DEFAULT NULL COMMENT '审批人员',
  `assignee_id` varchar(255) DEFAULT NULL COMMENT '审批人员id',
  `business_rule_id` bigint DEFAULT NULL COMMENT '业务规则id',
  `is_show` tinyint(1) NOT NULL COMMENT '是否弹出选人',
  `multiple` tinyint(1) NOT NULL COMMENT '是否会签',
  `multiple_column` varchar(255) DEFAULT NULL COMMENT '会签保存人员KEY值',
  `is_back` tinyint(1) NOT NULL COMMENT '是否可退回到当前节点,0不可退回当前节点,1可退回当前节点',
  `is_delegate` tinyint(1) NOT NULL COMMENT '是否可委托',
  `is_transmit` tinyint(1) NOT NULL COMMENT '是否可转办',
  `is_copy` tinyint(1) NOT NULL COMMENT '是否可抄送',
  `add_multi_instance` tinyint(1) DEFAULT NULL COMMENT '是否可加签',
  `delete_multi_instance` tinyint(1) DEFAULT NULL COMMENT '是否可减签',
  `task_listener` varchar(255) DEFAULT NULL COMMENT '任务监听',
  `auto_complete` tinyint(1) DEFAULT NULL COMMENT '自动审批,当前节点自动办理,下一节点不可弹窗选人',
  `field_list_json` text COMMENT '字段',
  `show_back` tinyint(1) DEFAULT NULL COMMENT '当前节点是否显示驳回,0不显示驳回按钮,1显示驳回按钮',
  `create_by` varchar(100) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(100) DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='节点分配人表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_node_assignee`
--

LOCK TABLES `act_node_assignee` WRITE;
/*!40000 ALTER TABLE `act_node_assignee` DISABLE KEYS */;
INSERT INTO `act_node_assignee` VALUES (1820718910171189250,'leave1:1:1820662237058514946','role','Activity_0lym9dc','组长','超级管理员','1',NULL,0,0,'',0,0,0,0,0,0,'',NULL,'',1,'admin','2024-08-06 15:09:50','admin','2024-08-06 15:09:50'),(1820719081768554497,'leave1:1:1820662237058514946','role','Activity_1j25s1c','部门领导','超级管理员','1',NULL,0,0,'',0,0,0,0,0,0,'',NULL,'',1,'admin','2024-08-06 15:10:31','admin','2024-08-06 15:10:31'),(1820720870416912385,'leave1:1:1820662237058514946','person','Activity_14633hx','申请人',NULL,NULL,NULL,0,0,'',0,0,0,0,0,0,'',NULL,'',0,'admin','2024-08-06 15:18:37','admin','2024-08-06 15:18:37');
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
  `process_definition_id` varchar(255) DEFAULT NULL COMMENT '流程定义id',
  `process_definition_key` varchar(255) DEFAULT NULL COMMENT '流程定义key',
  `process_definition_name` varchar(255) DEFAULT NULL COMMENT '流程定义名称',
  `table_name` varchar(255) DEFAULT NULL COMMENT '表名',
  `component_name` varchar(255) DEFAULT NULL COMMENT '组件名称',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `default_process` tinyint(1) DEFAULT NULL COMMENT 'true 为审批节点选人 false 为申请人选择全部人员',
  `task_listener` varchar(255) DEFAULT NULL COMMENT '任务监听',
  `create_by` varchar(100) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(100) DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='流程定义设置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_process_def_setting`
--

LOCK TABLES `act_process_def_setting` WRITE;
/*!40000 ALTER TABLE `act_process_def_setting` DISABLE KEYS */;
INSERT INTO `act_process_def_setting` VALUES (1820720401535668226,'leave1:1:1820662237058514946','leave1','请假流程（普通流程）','bs_leave','leave',NULL,0,'','admin','2024-08-06 15:19:49','admin','2024-08-06 15:19:49');
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
  `process_definition_id` varchar(255) NOT NULL COMMENT '流程定义id',
  `process_instance_id` varchar(255) NOT NULL COMMENT '流程实例id',
  `node_id` varchar(255) NOT NULL COMMENT '节点id',
  `assignee` varchar(255) NOT NULL COMMENT '办理人',
  `assignee_id` varchar(255) NOT NULL COMMENT '办理人id',
  `node_name` varchar(255) NOT NULL COMMENT '节点名称',
  `multiple` tinyint(1) NOT NULL COMMENT '是否会签',
  `multiple_column` varchar(255) DEFAULT NULL COMMENT '会签保存人员KEY值',
  `create_by` varchar(100) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(100) DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='流程节点分配人表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_process_node_assignee`
--

LOCK TABLES `act_process_node_assignee` WRITE;
/*!40000 ALTER TABLE `act_process_node_assignee` DISABLE KEYS */;
INSERT INTO `act_process_node_assignee` VALUES (1820721487533248513,'leave1:1:1820662237058514946','1820721459888590850','Activity_14633hx','疯狂的狮子Li','1','申请人',0,NULL,'admin','2024-08-06 15:20:05','admin','2024-08-06 15:20:05'),(1820721487575191554,'leave1:1:1820662237058514946','1820721459888590850','Activity_0lym9dc','疯狂的狮子Li','1','组长',0,NULL,'admin','2024-08-06 15:20:05','admin','2024-08-06 15:20:05'),(1820721487575191555,'leave1:1:1820662237058514946','1820721459888590850','Activity_1j25s1c','疯狂的狮子Li','1','部门领导',0,NULL,'admin','2024-08-06 15:20:05','admin','2024-08-06 15:20:05');
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
INSERT INTO `act_re_deployment` VALUES ('1820662234730676226','请假流程（普通流程）','alarm','leave1.bpmn20','','2024-08-06 03:24:37.684',NULL,NULL,'1820662234730676226',NULL),('1820703255543877634','请假流程（排他网关）','alarm','leave2.bpmn20','','2024-08-06 06:07:37.809',NULL,NULL,'1820703255543877634',NULL),('1820703298988478465','请假流程（并行网关）','alarm','leave3.bpmn20','','2024-08-06 06:07:48.167',NULL,NULL,'1820703298988478465',NULL),('1820703328734482433','请假流程（包容网关）','alarm','leave4.bpmn20','','2024-08-06 06:07:55.260',NULL,NULL,'1820703328734482433',NULL),('1820703358228828162','请假流程（会签）','alarm','leave5.bpmn20','','2024-08-06 06:08:02.292',NULL,NULL,'1820703358228828162',NULL),('1820703376704737282','请假流程（子流程）','alarm','leave6.bpmn20','','2024-08-06 06:08:06.696',NULL,NULL,'1820703376704737282',NULL);
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
INSERT INTO `act_re_model` VALUES ('1820663301459623937',3,'请假流程（普通流程）','leave1','alarm','2024-08-06 03:28:52.014','2024-08-06 03:28:52.045',1,'{\"name\":\"请假流程（普通流程）\",\"revision\":1,\"description\":null}',NULL,'1820663301493178370','1820663301593841666','');
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
INSERT INTO `act_re_procdef` VALUES ('leave1:1:1820662237058514946',2,'alarm','请假流程（普通流程）','leave1',1,'1820662234730676226','请假流程（普通流程）-leave1.bpmn20.xml','请假流程（普通流程）-leave1.leave1.png',NULL,0,1,1,'',NULL,NULL,NULL,0),('leave2:1:1820703257427120130',2,'alarm','请假流程（排他网关）','leave2',1,'1820703255543877634','请假流程（排他网关）-leave2.bpmn20.xml','请假流程（排他网关）-leave2.leave2.png',NULL,0,1,1,'',NULL,NULL,NULL,0),('leave3:1:1820703299458240513',2,'alarm','请假流程（并行网关）','leave3',1,'1820703298988478465','请假流程（并行网关）-leave3.bpmn20.xml','请假流程（并行网关）-leave3.leave3.png',NULL,0,1,1,'',NULL,NULL,NULL,0),('leave4:1:1820703329095192577',2,'alarm','请假流程（包容网关）','leave4',1,'1820703328734482433','请假流程（包容网关）-leave4.bpmn20.xml','请假流程（包容网关）-leave4.leave4.png',NULL,0,1,1,'',NULL,NULL,NULL,0),('leave5:1:1820703358627287042',2,'alarm','请假流程（会签）','leave5',1,'1820703358228828162','请假流程（会签）-leave5.bpmn20.xml','请假流程（会签）-leave5.leave5.png',NULL,0,1,1,'',NULL,NULL,NULL,0),('leave6:1:1820703377086418946',2,'alarm','请假流程（子流程）','leave6',1,'1820703376704737282','请假流程（子流程）-leave6.bpmn20.xml','请假流程（子流程）-leave6.leave6.png',NULL,0,1,1,'',NULL,NULL,NULL,0);
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
  `node_id` varchar(255) DEFAULT NULL COMMENT '节点id',
  `node_name` varchar(255) DEFAULT NULL COMMENT '节点名称',
  `instance_id` varchar(255) DEFAULT NULL COMMENT '流程实例id',
  `order_no` int DEFAULT NULL COMMENT '排序',
  `is_back` tinyint(1) DEFAULT NULL COMMENT '是否可退回',
  `task_type` varchar(255) DEFAULT NULL COMMENT '节点类型',
  `assignee` varchar(255) DEFAULT NULL COMMENT '审批人',
  `create_by` varchar(100) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(100) DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='任务节点表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_task_node`
--

LOCK TABLES `act_task_node` WRITE;
/*!40000 ALTER TABLE `act_task_node` DISABLE KEYS */;
INSERT INTO `act_task_node` VALUES (1820721488099479554,'Activity_14633hx','申请人','1820721459888590850',0,1,'userTask','1','admin','2024-08-06 15:20:05','admin','2024-08-06 15:20:05'),(1820721488804122625,'Activity_0lym9dc','组长','1820721459888590850',1,0,'userTask','1','admin','2024-08-06 15:20:05','admin','2024-08-06 15:20:05'),(1820721491073241090,'Activity_1j25s1c','部门领导','1820721459888590850',2,0,'userTask','1','admin','2024-08-06 15:20:05','admin','2024-08-06 15:20:05');
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
  `variable_name` varchar(255) DEFAULT NULL COMMENT '变量名称',
  `variable` varchar(255) DEFAULT NULL COMMENT '变量',
  `symbol` varchar(255) DEFAULT NULL COMMENT '操作符',
  `process_definition_key` varchar(255) DEFAULT NULL COMMENT '流程定义key',
  `is_str` tinyint(1) DEFAULT NULL COMMENT '是否字符串',
  `create_by` varchar(100) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(100) DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='变量条件表';
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
  `username` varchar(255) DEFAULT NULL COMMENT '申请人用户名',
  `duration` decimal(10,2) DEFAULT NULL COMMENT '请假时长，单位：天',
  `principal` varchar(255) DEFAULT NULL COMMENT '工作委托人',
  `contact_phone` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `leave_type` smallint DEFAULT NULL COMMENT '请假类型：1病假，2事假，3年假，4婚假，5产假，6丧假，7探亲，8调休，9其他',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `leave_reason` text COMMENT '请假原因',
  `start_date` datetime DEFAULT NULL COMMENT '请假开始时间',
  `end_date` datetime DEFAULT NULL COMMENT '请假结束时间',
  `create_by` varchar(100) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(100) DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='请假申请表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bs_leave`
--

LOCK TABLES `bs_leave` WRITE;
/*!40000 ALTER TABLE `bs_leave` DISABLE KEYS */;
INSERT INTO `bs_leave` VALUES (1820702696808058882,'admin',2.50,'admin','111111111111',3,'请年假','休息','2024-08-07 00:00:00','2024-08-09 00:00:00','admin','2024-08-06 14:05:24','admin','2024-08-06 15:19:58');
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
  `table_id` bigint NOT NULL COMMENT '编号',
  `table_name` varchar(200) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) COLLATE utf8mb4_general_ci DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) COLLATE utf8mb4_general_ci DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='代码生成业务表';
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
  `column_id` bigint NOT NULL COMMENT '编号',
  `table_id` bigint DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) COLLATE utf8mb4_general_ci DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典类型',
  `sort` int DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='代码生成业务表字段';
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
  `id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `code` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '编码',
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '名称',
  `note` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '说明',
  `status` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '状态',
  `type` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '类型',
  `json_str` longtext CHARACTER SET utf8mb3 COLLATE utf8_general_ci COMMENT 'json字符串',
  `api_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '请求地址',
  `thumb` text CHARACTER SET utf8mb3 COLLATE utf8_general_ci COMMENT '缩略图',
  `create_by` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识0-正常,1-已删除',
  `api_method` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '请求方法0-get,1-post',
  `api_code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '请求编码',
  `template` tinyint(1) DEFAULT NULL COMMENT '是否是模板 0-是,1-不是',
  `view_count` bigint DEFAULT '0' COMMENT '浏览次数',
  `css_str` text CHARACTER SET utf8mb3 COLLATE utf8_general_ci COMMENT 'css增强',
  `js_str` text CHARACTER SET utf8mb3 COLLATE utf8_general_ci COMMENT 'js增强',
  `tenant_id` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '多租户标识',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uniq_jmreport_code` (`code`) USING BTREE,
  KEY `uniq_jmreport_createby` (`create_by`) USING BTREE,
  KEY `uniq_jmreport_delflag` (`del_flag`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='在线excel设计器';
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
  `jimu_report_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '主键字段',
  `create_by` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人登录名称',
  `update_by` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新人登录名称',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime DEFAULT NULL COMMENT '更新日期',
  `db_code` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '数据集编码',
  `db_ch_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '数据集名字',
  `db_type` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '数据源类型',
  `db_table_name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '数据库表名',
  `db_dyn_sql` longtext CHARACTER SET utf8mb3 COLLATE utf8_general_ci COMMENT '动态查询SQL',
  `db_key` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '数据源KEY',
  `tb_db_key` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '填报数据源',
  `tb_db_table_name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '填报数据表',
  `java_type` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'java类数据集  类型（spring:springkey,class:java类名）',
  `java_value` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'java类数据源  数值（bean key/java类名）',
  `api_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '请求地址',
  `api_method` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '请求方法0-get,1-post',
  `is_list` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT '0' COMMENT '是否是列表0否1是 默认0',
  `is_page` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '是否作为分页,0:不分页，1:分页',
  `db_source` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '数据源',
  `db_source_type` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '数据库类型 MYSQL ORACLE SQLSERVER',
  `json_data` text CHARACTER SET utf8mb3 COLLATE utf8_general_ci COMMENT 'json数据，直接解析json内容',
  `api_convert` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'api转换器',
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
  `report_code` varchar(255) DEFAULT NULL COMMENT '报表编码',
  `report_name` varchar(255) DEFAULT NULL COMMENT '报表名称',
  `report_id` varchar(255) DEFAULT NULL COMMENT '报表id',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_by` varchar(100) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(100) DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='报表注册表';
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
  `role_id` bigint DEFAULT NULL COMMENT '角色id',
  `report_register_id` bigint DEFAULT NULL COMMENT '报表注册id',
  `create_by` varchar(100) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(100) DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='报表注册角色关联表';
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
  `config_id` bigint NOT NULL COMMENT '参数主键',
  `config_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) COLLATE utf8mb4_general_ci DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='参数配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_config`
--

LOCK TABLES `sys_config` WRITE;
/*!40000 ALTER TABLE `sys_config` DISABLE KEYS */;
INSERT INTO `sys_config` VALUES (1,'主框架页-默认皮肤样式名称','sys.index.skinName','skin-blue','Y','admin','2024-08-05 19:20:09','',NULL,'蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow'),(2,'用户管理-账号初始密码','sys.user.initPassword','123456','Y','admin','2024-08-05 19:20:09','',NULL,'初始化密码 123456'),(3,'主框架页-侧边栏主题','sys.index.sideTheme','theme-dark','Y','admin','2024-08-05 19:20:10','',NULL,'深色主题theme-dark，浅色主题theme-light'),(4,'账号自助-验证码开关','sys.account.captchaEnabled','true','Y','admin','2024-08-05 19:20:10','',NULL,'是否开启验证码功能（true开启，false关闭）'),(5,'账号自助-是否开启用户注册功能','sys.account.registerUser','false','Y','admin','2024-08-05 19:20:10','',NULL,'是否开启注册用户功能（true开启，false关闭）'),(11,'OSS预览列表资源开关','sys.oss.previewListResource','true','Y','admin','2024-08-05 19:20:10','',NULL,'true:开启, false:关闭');
/*!40000 ALTER TABLE `sys_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dept`
--

DROP TABLE IF EXISTS `sys_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dept` (
  `dept_id` bigint NOT NULL COMMENT '部门id',
  `parent_id` bigint DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(500) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '部门名称',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邮箱',
  `status` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='部门表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dept`
--

LOCK TABLES `sys_dept` WRITE;
/*!40000 ALTER TABLE `sys_dept` DISABLE KEYS */;
INSERT INTO `sys_dept` VALUES (100,0,'0','若依科技',0,'若依','15888888888','ry@qq.com','0','0','admin','2024-08-05 19:19:48','',NULL),(101,100,'0,100','深圳总公司',1,'若依','15888888888','ry@qq.com','0','0','admin','2024-08-05 19:19:48','',NULL),(102,100,'0,100','长沙分公司',2,'若依','15888888888','ry@qq.com','0','0','admin','2024-08-05 19:19:49','',NULL),(103,101,'0,100,101','研发部门',1,'若依','15888888888','ry@qq.com','0','0','admin','2024-08-05 19:19:49','',NULL),(104,101,'0,100,101','市场部门',2,'若依','15888888888','ry@qq.com','0','0','admin','2024-08-05 19:19:49','',NULL),(105,101,'0,100,101','测试部门',3,'若依','15888888888','ry@qq.com','0','0','admin','2024-08-05 19:19:49','',NULL),(106,101,'0,100,101','财务部门',4,'若依','15888888888','ry@qq.com','0','0','admin','2024-08-05 19:19:49','',NULL),(107,101,'0,100,101','运维部门',5,'若依','15888888888','ry@qq.com','0','0','admin','2024-08-05 19:19:49','',NULL),(108,102,'0,100,102','市场部门',1,'若依','15888888888','ry@qq.com','0','0','admin','2024-08-05 19:19:49','',NULL),(109,102,'0,100,102','财务部门',2,'若依','15888888888','ry@qq.com','0','0','admin','2024-08-05 19:19:49','',NULL);
/*!40000 ALTER TABLE `sys_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_data`
--

DROP TABLE IF EXISTS `sys_dict_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint NOT NULL COMMENT '字典编码',
  `dict_sort` int DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) COLLATE utf8mb4_general_ci DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='字典数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_data`
--

LOCK TABLES `sys_dict_data` WRITE;
/*!40000 ALTER TABLE `sys_dict_data` DISABLE KEYS */;
INSERT INTO `sys_dict_data` VALUES (1,1,'男','0','sys_user_sex','','','Y','0','admin','2024-08-05 19:20:07','',NULL,'性别男'),(2,2,'女','1','sys_user_sex','','','N','0','admin','2024-08-05 19:20:07','',NULL,'性别女'),(3,3,'未知','2','sys_user_sex','','','N','0','admin','2024-08-05 19:20:07','',NULL,'性别未知'),(4,1,'显示','0','sys_show_hide','','primary','Y','0','admin','2024-08-05 19:20:07','',NULL,'显示菜单'),(5,2,'隐藏','1','sys_show_hide','','danger','N','0','admin','2024-08-05 19:20:07','',NULL,'隐藏菜单'),(6,1,'正常','0','sys_normal_disable','','primary','Y','0','admin','2024-08-05 19:20:07','',NULL,'正常状态'),(7,2,'停用','1','sys_normal_disable','','danger','N','0','admin','2024-08-05 19:20:08','',NULL,'停用状态'),(12,1,'是','Y','sys_yes_no','','primary','Y','0','admin','2024-08-05 19:20:08','',NULL,'系统默认是'),(13,2,'否','N','sys_yes_no','','danger','N','0','admin','2024-08-05 19:20:08','',NULL,'系统默认否'),(14,1,'通知','1','sys_notice_type','','warning','Y','0','admin','2024-08-05 19:20:08','',NULL,'通知'),(15,2,'公告','2','sys_notice_type','','success','N','0','admin','2024-08-05 19:20:08','',NULL,'公告'),(16,1,'正常','0','sys_notice_status','','primary','Y','0','admin','2024-08-05 19:20:08','',NULL,'正常状态'),(17,2,'关闭','1','sys_notice_status','','danger','N','0','admin','2024-08-05 19:20:08','',NULL,'关闭状态'),(18,1,'新增','1','sys_oper_type','','info','N','0','admin','2024-08-05 19:20:08','',NULL,'新增操作'),(19,2,'修改','2','sys_oper_type','','info','N','0','admin','2024-08-05 19:20:08','',NULL,'修改操作'),(20,3,'删除','3','sys_oper_type','','danger','N','0','admin','2024-08-05 19:20:08','',NULL,'删除操作'),(21,4,'授权','4','sys_oper_type','','primary','N','0','admin','2024-08-05 19:20:08','',NULL,'授权操作'),(22,5,'导出','5','sys_oper_type','','warning','N','0','admin','2024-08-05 19:20:08','',NULL,'导出操作'),(23,6,'导入','6','sys_oper_type','','warning','N','0','admin','2024-08-05 19:20:08','',NULL,'导入操作'),(24,7,'强退','7','sys_oper_type','','danger','N','0','admin','2024-08-05 19:20:08','',NULL,'强退操作'),(25,8,'生成代码','8','sys_oper_type','','warning','N','0','admin','2024-08-05 19:20:09','',NULL,'生成操作'),(26,9,'清空数据','9','sys_oper_type','','danger','N','0','admin','2024-08-05 19:20:09','',NULL,'清空操作'),(27,1,'成功','0','sys_common_status','','primary','N','0','admin','2024-08-05 19:20:09','',NULL,'正常状态'),(28,2,'失败','1','sys_common_status','','danger','N','0','admin','2024-08-05 19:20:09','',NULL,'停用状态'),(29,99,'其他','0','sys_oper_type','','info','N','0','admin','2024-08-05 19:20:08','',NULL,'其他操作'),(39,1,'已撤销','cancel','act_status','','danger','N','0','1','2024-08-06 09:37:27',NULL,NULL,'已撤销'),(40,2,'草稿','draft','act_status','','info','N','0','1','2024-08-06 09:37:27',NULL,NULL,'草稿'),(41,3,'待审核','waiting','act_status','','primary','N','0','1','2024-08-06 09:37:27',NULL,NULL,'待审核'),(42,4,'已完成','finish','act_status','','success','N','0','1','2024-08-06 09:37:27',NULL,NULL,'已完成'),(43,5,'已作废','invalid','act_status','','danger','N','0','1','2024-08-06 09:37:27',NULL,NULL,'已作废'),(44,6,'已退回','back','act_status','','danger','N','0','1','2024-08-06 09:37:27',NULL,NULL,'已退回'),(45,7,'已终止','termination','act_status','','danger','N','0','1','2024-08-06 09:37:27',NULL,NULL,'已终止'),(46,1,'自定义表单','static','wf_form_type','','success','N','0','1','2024-08-06 09:37:27',NULL,NULL,'自定义表单'),(47,2,'动态表单','dynamic','wf_form_type','','primary','N','0','1','2024-08-06 09:37:27',NULL,NULL,'动态表单'),(1820702182615748609,0,'病假','1','bs_leave_type',NULL,'default','N','0','admin','2024-08-06 14:03:22','admin','2024-08-06 14:03:22',NULL),(1820702261103759361,1,'事假','2','bs_leave_type',NULL,'default','N','0','admin','2024-08-06 14:03:41','admin','2024-08-06 14:03:41',NULL),(1820702313578696706,2,'年假','3','bs_leave_type',NULL,'default','N','0','admin','2024-08-06 14:03:53','admin','2024-08-06 14:03:53',NULL);
/*!40000 ALTER TABLE `sys_dict_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_type`
--

DROP TABLE IF EXISTS `sys_dict_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint NOT NULL COMMENT '字典主键',
  `dict_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典类型',
  `status` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='字典类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_type`
--

LOCK TABLES `sys_dict_type` WRITE;
/*!40000 ALTER TABLE `sys_dict_type` DISABLE KEYS */;
INSERT INTO `sys_dict_type` VALUES (1,'用户性别','sys_user_sex','0','admin','2024-08-05 19:20:06','',NULL,'用户性别列表'),(2,'菜单状态','sys_show_hide','0','admin','2024-08-05 19:20:06','',NULL,'菜单状态列表'),(3,'系统开关','sys_normal_disable','0','admin','2024-08-05 19:20:06','',NULL,'系统开关列表'),(6,'系统是否','sys_yes_no','0','admin','2024-08-05 19:20:06','',NULL,'系统是否列表'),(7,'通知类型','sys_notice_type','0','admin','2024-08-05 19:20:07','',NULL,'通知类型列表'),(8,'通知状态','sys_notice_status','0','admin','2024-08-05 19:20:07','',NULL,'通知状态列表'),(9,'操作类型','sys_oper_type','0','admin','2024-08-05 19:20:07','',NULL,'操作类型列表'),(10,'系统状态','sys_common_status','0','admin','2024-08-05 19:20:07','',NULL,'登录状态列表'),(13,'业务状态','act_status','0','1','2024-08-06 09:35:27','admin','2024-08-06 15:30:09','业务状态列表'),(14,'表单类型','wf_form_type','0','1','2024-08-06 09:35:27',NULL,NULL,'表单类型列表'),(1820701865723498498,'请假类型','bs_leave_type','0','admin','2024-08-06 14:02:06','admin','2024-08-06 14:02:06',NULL);
/*!40000 ALTER TABLE `sys_dict_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_logininfor`
--

DROP TABLE IF EXISTS `sys_logininfor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint NOT NULL COMMENT '访问ID',
  `user_name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '操作系统',
  `status` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`),
  KEY `idx_sys_logininfor_s` (`status`),
  KEY `idx_sys_logininfor_lt` (`login_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='系统访问记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_logininfor`
--

LOCK TABLES `sys_logininfor` WRITE;
/*!40000 ALTER TABLE `sys_logininfor` DISABLE KEYS */;
INSERT INTO `sys_logininfor` VALUES (1820421027362451458,'admin','127.0.0.1','内网IP','Chrome','Windows 10 or Windows Server 2016','0','登录成功','2024-08-05 19:26:09'),(1820624543288868865,'admin','127.0.0.1','内网IP','Chrome','Windows 10 or Windows Server 2016','0','登录成功','2024-08-06 08:54:51'),(1820697414027644930,'admin','127.0.0.1','内网IP','Chrome','Windows 10 or Windows Server 2016','1','验证码已失效','2024-08-06 13:44:25'),(1820697433124311042,'admin','127.0.0.1','内网IP','Chrome','Windows 10 or Windows Server 2016','0','登录成功','2024-08-06 13:44:30'),(1820700250761269250,'admin','127.0.0.1','内网IP','Chrome','Windows 10 or Windows Server 2016','0','退出成功','2024-08-06 13:55:41'),(1820700268322820097,'admin','127.0.0.1','内网IP','Chrome','Windows 10 or Windows Server 2016','1','验证码错误','2024-08-06 13:55:46'),(1820700283606863873,'admin','127.0.0.1','内网IP','Chrome','Windows 10 or Windows Server 2016','0','登录成功','2024-08-06 13:55:49'),(1820707493154066434,'admin','127.0.0.1','内网IP','Chrome','Windows 10 or Windows Server 2016','0','退出成功','2024-08-06 14:24:28'),(1820707510950498306,'admin','127.0.0.1','内网IP','Chrome','Windows 10 or Windows Server 2016','0','登录成功','2024-08-06 14:24:32'),(1820724634469208065,'admin','127.0.0.1','内网IP','Chrome','Windows 10 or Windows Server 2016','0','退出成功','2024-08-06 15:32:35'),(1820724658934583297,'admin','127.0.0.1','内网IP','Chrome','Windows 10 or Windows Server 2016','0','登录成功','2024-08-06 15:32:41'),(1820724998891311106,'admin','127.0.0.1','内网IP','Chrome','Windows 10 or Windows Server 2016','0','退出成功','2024-08-06 15:34:02'),(1820725016444473346,'admin','127.0.0.1','内网IP','Chrome','Windows 10 or Windows Server 2016','0','登录成功','2024-08-06 15:34:06');
/*!40000 ALTER TABLE `sys_logininfor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_menu` (
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  `menu_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '组件路径',
  `query_param` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '路由参数',
  `is_frame` int DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '显示状态（0显示 1隐藏）',
  `status` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='菜单权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,'系统管理',0,1,'system',NULL,'',1,0,'M','0','0','','system','admin','2024-08-05 19:19:51','',NULL,'系统管理目录'),(2,'系统监控',0,2,'monitor',NULL,'',1,0,'M','0','0','','monitor','admin','2024-08-05 19:19:51','',NULL,'系统监控目录'),(3,'系统工具',0,3,'tool',NULL,'',1,0,'M','0','0','','tool','admin','2024-08-05 19:19:51','',NULL,'系统工具目录'),(4,'PLUS官网',0,16,'https://gitee.com/dromara/RuoYi-Vue-Plus',NULL,'',0,0,'M','0','0','','guide','admin','2024-08-05 19:19:51','admin','2024-08-06 15:33:25','RuoYi-Vue-Plus官网地址'),(5,'测试菜单',0,5,'demo',NULL,NULL,1,0,'M','0','0',NULL,'star','admin','2024-08-05 19:20:41',NULL,NULL,''),(100,'用户管理',1,1,'user','system/user/index','',1,0,'C','0','0','system:user:list','user','admin','2024-08-05 19:19:51','',NULL,'用户管理菜单'),(101,'角色管理',1,2,'role','system/role/index','',1,0,'C','0','0','system:role:list','peoples','admin','2024-08-05 19:19:51','',NULL,'角色管理菜单'),(102,'菜单管理',1,3,'menu','system/menu/index','',1,0,'C','0','0','system:menu:list','tree-table','admin','2024-08-05 19:19:51','',NULL,'菜单管理菜单'),(103,'部门管理',1,4,'dept','system/dept/index','',1,0,'C','0','0','system:dept:list','tree','admin','2024-08-05 19:19:52','',NULL,'部门管理菜单'),(104,'岗位管理',1,5,'post','system/post/index','',1,0,'C','0','0','system:post:list','post','admin','2024-08-05 19:19:52','',NULL,'岗位管理菜单'),(105,'字典管理',1,6,'dict','system/dict/index','',1,0,'C','0','0','system:dict:list','dict','admin','2024-08-05 19:19:52','',NULL,'字典管理菜单'),(106,'参数设置',1,7,'config','system/config/index','',1,0,'C','0','0','system:config:list','edit','admin','2024-08-05 19:19:52','',NULL,'参数设置菜单'),(107,'通知公告',1,8,'notice','system/notice/index','',1,0,'C','0','0','system:notice:list','message','admin','2024-08-05 19:19:52','',NULL,'通知公告菜单'),(108,'日志管理',1,9,'log','','',1,0,'M','0','0','','log','admin','2024-08-05 19:19:52','',NULL,'日志管理菜单'),(109,'在线用户',2,1,'online','monitor/online/index','',1,0,'C','0','0','monitor:online:list','online','admin','2024-08-05 19:19:52','',NULL,'在线用户菜单'),(112,'缓存列表',2,6,'cacheList','monitor/cache/list','',1,0,'C','0','0','monitor:cache:list','redis-list','admin','2024-08-05 19:19:52','',NULL,'缓存列表菜单'),(113,'缓存监控',2,5,'cache','monitor/cache/index','',1,0,'C','0','0','monitor:cache:list','redis','admin','2024-08-05 19:19:52','',NULL,'缓存监控菜单'),(114,'表单构建',3,1,'build','tool/build/index','',1,0,'C','0','0','tool:build:list','build','admin','2024-08-05 19:19:52','',NULL,'表单构建菜单'),(115,'代码生成',3,2,'gen','tool/gen/index','',1,0,'C','0','0','tool:gen:list','code','admin','2024-08-05 19:19:52','',NULL,'代码生成菜单'),(117,'Admin监控',2,5,'Admin','monitor/admin/index','',1,0,'C','0','0','monitor:admin:list','dashboard','admin','2024-08-05 19:19:52','',NULL,'Admin监控菜单'),(118,'文件管理',1,10,'oss','system/oss/index','',1,0,'C','0','0','system:oss:list','upload','admin','2024-08-05 19:19:52','',NULL,'文件管理菜单'),(120,'任务调度中心',2,5,'XxlJob','monitor/xxljob/index','',1,0,'C','0','0','monitor:xxljob:list','job','admin','2024-08-05 19:19:53','',NULL,'Xxl-Job控制台菜单'),(500,'操作日志',108,1,'operlog','monitor/operlog/index','',1,0,'C','0','0','monitor:operlog:list','form','admin','2024-08-05 19:19:53','',NULL,'操作日志菜单'),(501,'登录日志',108,2,'logininfor','monitor/logininfor/index','',1,0,'C','0','0','monitor:logininfor:list','logininfor','admin','2024-08-05 19:19:53','',NULL,'登录日志菜单'),(1001,'用户查询',100,1,'','','',1,0,'F','0','0','system:user:query','#','admin','2024-08-05 19:19:53','',NULL,''),(1002,'用户新增',100,2,'','','',1,0,'F','0','0','system:user:add','#','admin','2024-08-05 19:19:53','',NULL,''),(1003,'用户修改',100,3,'','','',1,0,'F','0','0','system:user:edit','#','admin','2024-08-05 19:19:53','',NULL,''),(1004,'用户删除',100,4,'','','',1,0,'F','0','0','system:user:remove','#','admin','2024-08-05 19:19:53','',NULL,''),(1005,'用户导出',100,5,'','','',1,0,'F','0','0','system:user:export','#','admin','2024-08-05 19:19:53','',NULL,''),(1006,'用户导入',100,6,'','','',1,0,'F','0','0','system:user:import','#','admin','2024-08-05 19:19:53','',NULL,''),(1007,'重置密码',100,7,'','','',1,0,'F','0','0','system:user:resetPwd','#','admin','2024-08-05 19:19:53','',NULL,''),(1008,'角色查询',101,1,'','','',1,0,'F','0','0','system:role:query','#','admin','2024-08-05 19:19:53','',NULL,''),(1009,'角色新增',101,2,'','','',1,0,'F','0','0','system:role:add','#','admin','2024-08-05 19:19:53','',NULL,''),(1010,'角色修改',101,3,'','','',1,0,'F','0','0','system:role:edit','#','admin','2024-08-05 19:19:53','',NULL,''),(1011,'角色删除',101,4,'','','',1,0,'F','0','0','system:role:remove','#','admin','2024-08-05 19:19:53','',NULL,''),(1012,'角色导出',101,5,'','','',1,0,'F','0','0','system:role:export','#','admin','2024-08-05 19:19:53','',NULL,''),(1013,'菜单查询',102,1,'','','',1,0,'F','0','0','system:menu:query','#','admin','2024-08-05 19:19:54','',NULL,''),(1014,'菜单新增',102,2,'','','',1,0,'F','0','0','system:menu:add','#','admin','2024-08-05 19:19:54','',NULL,''),(1015,'菜单修改',102,3,'','','',1,0,'F','0','0','system:menu:edit','#','admin','2024-08-05 19:19:54','',NULL,''),(1016,'菜单删除',102,4,'','','',1,0,'F','0','0','system:menu:remove','#','admin','2024-08-05 19:19:54','',NULL,''),(1017,'部门查询',103,1,'','','',1,0,'F','0','0','system:dept:query','#','admin','2024-08-05 19:19:54','',NULL,''),(1018,'部门新增',103,2,'','','',1,0,'F','0','0','system:dept:add','#','admin','2024-08-05 19:19:54','',NULL,''),(1019,'部门修改',103,3,'','','',1,0,'F','0','0','system:dept:edit','#','admin','2024-08-05 19:19:54','',NULL,''),(1020,'部门删除',103,4,'','','',1,0,'F','0','0','system:dept:remove','#','admin','2024-08-05 19:19:54','',NULL,''),(1021,'岗位查询',104,1,'','','',1,0,'F','0','0','system:post:query','#','admin','2024-08-05 19:19:54','',NULL,''),(1022,'岗位新增',104,2,'','','',1,0,'F','0','0','system:post:add','#','admin','2024-08-05 19:19:54','',NULL,''),(1023,'岗位修改',104,3,'','','',1,0,'F','0','0','system:post:edit','#','admin','2024-08-05 19:19:54','',NULL,''),(1024,'岗位删除',104,4,'','','',1,0,'F','0','0','system:post:remove','#','admin','2024-08-05 19:19:54','',NULL,''),(1025,'岗位导出',104,5,'','','',1,0,'F','0','0','system:post:export','#','admin','2024-08-05 19:19:54','',NULL,''),(1026,'字典查询',105,1,'#','','',1,0,'F','0','0','system:dict:query','#','admin','2024-08-05 19:19:54','',NULL,''),(1027,'字典新增',105,2,'#','','',1,0,'F','0','0','system:dict:add','#','admin','2024-08-05 19:19:54','',NULL,''),(1028,'字典修改',105,3,'#','','',1,0,'F','0','0','system:dict:edit','#','admin','2024-08-05 19:19:55','',NULL,''),(1029,'字典删除',105,4,'#','','',1,0,'F','0','0','system:dict:remove','#','admin','2024-08-05 19:19:55','',NULL,''),(1030,'字典导出',105,5,'#','','',1,0,'F','0','0','system:dict:export','#','admin','2024-08-05 19:19:55','',NULL,''),(1031,'参数查询',106,1,'#','','',1,0,'F','0','0','system:config:query','#','admin','2024-08-05 19:19:55','',NULL,''),(1032,'参数新增',106,2,'#','','',1,0,'F','0','0','system:config:add','#','admin','2024-08-05 19:19:55','',NULL,''),(1033,'参数修改',106,3,'#','','',1,0,'F','0','0','system:config:edit','#','admin','2024-08-05 19:19:55','',NULL,''),(1034,'参数删除',106,4,'#','','',1,0,'F','0','0','system:config:remove','#','admin','2024-08-05 19:19:55','',NULL,''),(1035,'参数导出',106,5,'#','','',1,0,'F','0','0','system:config:export','#','admin','2024-08-05 19:19:55','',NULL,''),(1036,'公告查询',107,1,'#','','',1,0,'F','0','0','system:notice:query','#','admin','2024-08-05 19:19:55','',NULL,''),(1037,'公告新增',107,2,'#','','',1,0,'F','0','0','system:notice:add','#','admin','2024-08-05 19:19:55','',NULL,''),(1038,'公告修改',107,3,'#','','',1,0,'F','0','0','system:notice:edit','#','admin','2024-08-05 19:19:55','',NULL,''),(1039,'公告删除',107,4,'#','','',1,0,'F','0','0','system:notice:remove','#','admin','2024-08-05 19:19:55','',NULL,''),(1040,'操作查询',500,1,'#','','',1,0,'F','0','0','monitor:operlog:query','#','admin','2024-08-05 19:19:55','',NULL,''),(1041,'操作删除',500,2,'#','','',1,0,'F','0','0','monitor:operlog:remove','#','admin','2024-08-05 19:19:56','',NULL,''),(1042,'日志导出',500,4,'#','','',1,0,'F','0','0','monitor:operlog:export','#','admin','2024-08-05 19:19:56','',NULL,''),(1043,'登录查询',501,1,'#','','',1,0,'F','0','0','monitor:logininfor:query','#','admin','2024-08-05 19:19:56','',NULL,''),(1044,'登录删除',501,2,'#','','',1,0,'F','0','0','monitor:logininfor:remove','#','admin','2024-08-05 19:19:56','',NULL,''),(1045,'日志导出',501,3,'#','','',1,0,'F','0','0','monitor:logininfor:export','#','admin','2024-08-05 19:19:56','',NULL,''),(1046,'在线查询',109,1,'#','','',1,0,'F','0','0','monitor:online:query','#','admin','2024-08-05 19:19:56','',NULL,''),(1047,'批量强退',109,2,'#','','',1,0,'F','0','0','monitor:online:batchLogout','#','admin','2024-08-05 19:19:56','',NULL,''),(1048,'单条强退',109,3,'#','','',1,0,'F','0','0','monitor:online:forceLogout','#','admin','2024-08-05 19:19:56','',NULL,''),(1050,'账户解锁',501,4,'#','','',1,0,'F','0','0','monitor:logininfor:unlock','#','admin','2024-08-05 19:19:56','',NULL,''),(1055,'生成查询',115,1,'#','','',1,0,'F','0','0','tool:gen:query','#','admin','2024-08-05 19:19:56','',NULL,''),(1056,'生成修改',115,2,'#','','',1,0,'F','0','0','tool:gen:edit','#','admin','2024-08-05 19:19:56','',NULL,''),(1057,'生成删除',115,3,'#','','',1,0,'F','0','0','tool:gen:remove','#','admin','2024-08-05 19:19:56','',NULL,''),(1058,'导入代码',115,2,'#','','',1,0,'F','0','0','tool:gen:import','#','admin','2024-08-05 19:19:56','',NULL,''),(1059,'预览代码',115,4,'#','','',1,0,'F','0','0','tool:gen:preview','#','admin','2024-08-05 19:19:56','',NULL,''),(1060,'生成代码',115,5,'#','','',1,0,'F','0','0','tool:gen:code','#','admin','2024-08-05 19:19:56','',NULL,''),(1500,'测试单表',5,1,'demo','demo/demo/index',NULL,1,0,'C','0','0','demo:demo:list','example','admin','2024-08-05 19:20:41','admin','2024-08-06 15:33:49','测试单表菜单'),(1501,'测试单表查询',1500,1,'#','',NULL,1,0,'F','0','0','demo:demo:query','#','admin','2024-08-05 19:20:41','',NULL,''),(1502,'测试单表新增',1500,2,'#','',NULL,1,0,'F','0','0','demo:demo:add','#','admin','2024-08-05 19:20:41','',NULL,''),(1503,'测试单表修改',1500,3,'#','',NULL,1,0,'F','0','0','demo:demo:edit','#','admin','2024-08-05 19:20:41','',NULL,''),(1504,'测试单表删除',1500,4,'#','',NULL,1,0,'F','0','0','demo:demo:remove','#','admin','2024-08-05 19:20:41','',NULL,''),(1505,'测试单表导出',1500,5,'#','',NULL,1,0,'F','0','0','demo:demo:export','#','admin','2024-08-05 19:20:41','',NULL,''),(1506,'测试树表',5,1,'tree','demo/tree/index',NULL,1,0,'C','0','0','demo:tree:list','example','admin','2024-08-05 19:20:41','admin','2024-08-06 15:33:56','测试树表菜单'),(1507,'测试树表查询',1506,1,'#','',NULL,1,0,'F','0','0','demo:tree:query','#','admin','2024-08-05 19:20:41','',NULL,''),(1508,'测试树表新增',1506,2,'#','',NULL,1,0,'F','0','0','demo:tree:add','#','admin','2024-08-05 19:20:42','',NULL,''),(1509,'测试树表修改',1506,3,'#','',NULL,1,0,'F','0','0','demo:tree:edit','#','admin','2024-08-05 19:20:42','',NULL,''),(1510,'测试树表删除',1506,4,'#','',NULL,1,0,'F','0','0','demo:tree:remove','#','admin','2024-08-05 19:20:42','',NULL,''),(1511,'测试树表导出',1506,5,'#','',NULL,1,0,'F','0','0','demo:tree:export','#','admin','2024-08-05 19:20:42','',NULL,''),(1600,'文件查询',118,1,'#','','',1,0,'F','0','0','system:oss:query','#','admin','2024-08-05 19:19:56','',NULL,''),(1601,'文件上传',118,2,'#','','',1,0,'F','0','0','system:oss:upload','#','admin','2024-08-05 19:19:57','',NULL,''),(1602,'文件下载',118,3,'#','','',1,0,'F','0','0','system:oss:download','#','admin','2024-08-05 19:19:57','',NULL,''),(1603,'文件删除',118,4,'#','','',1,0,'F','0','0','system:oss:remove','#','admin','2024-08-05 19:19:57','',NULL,''),(1604,'配置添加',118,5,'#','','',1,0,'F','0','0','system:oss:add','#','admin','2024-08-05 19:19:57','',NULL,''),(1605,'配置编辑',118,6,'#','','',1,0,'F','0','0','system:oss:edit','#','admin','2024-08-05 19:19:57','',NULL,''),(11616,'工作流',0,6,'workflow','','',1,0,'M','0','0','','documentation','1','2024-08-06 09:35:22','admin','2024-08-06 10:40:23',''),(11617,'模型管理',11616,2,'model','workflow/model/index','',1,1,'C','0','0','','education','1','2024-08-06 09:35:23','admin','2024-08-06 10:40:45',''),(11618,'我的任务',0,7,'task','','',1,0,'M','0','0','','tab','1','2024-08-06 09:35:23','admin','2024-08-06 10:39:34',''),(11619,'我的待办',11618,3,'taskWaiting','workflow/task/personalWaiting','',1,1,'C','0','0','','job','1','2024-08-06 09:35:23','admin','2024-08-06 10:42:15',''),(11620,'流程定义',11616,3,'processDefinition','workflow/definition/index','',1,1,'C','0','0','','dict','1','2024-08-06 09:35:23','admin','2024-08-06 10:40:54',''),(11621,'执行中实例',11630,1,'processInstance','workflow/instance/running','',1,1,'C','0','0','','job','1','2024-08-06 09:35:23','admin','2024-08-06 10:47:57',''),(11622,'流程分类',11616,1,'category','workflow/category/index','',1,0,'C','0','0','workflow:category:list','nested','1','2024-08-06 09:35:23','admin','2024-08-06 10:41:13',''),(11624,'流程分类新增',11622,2,'#','','',1,0,'F','0','0','workflow:category:add','#','1','2024-08-06 09:35:24',NULL,NULL,''),(11626,'流程分类删除',11622,4,'#','','',1,0,'F','0','0','workflow:category:remove','#','1','2024-08-06 09:35:24',NULL,NULL,''),(11628,'业务规则',11616,5,'businessRule','workflow/businessRule/index',NULL,1,0,'C','0','0','workflow:businessRule:list','skill','1','2024-08-06 09:37:27','admin','2024-08-06 10:38:42','表单管理菜单'),(11629,'全部待办',11618,1,'myDocument','workflow/task/waiting','',1,1,'C','0','0','','cascader','1','2024-08-06 09:35:23','admin','2024-08-06 10:41:31',''),(11630,'流程监控',11616,4,'monitor','','',1,0,'M','0','0','','monitor','1','2024-08-06 09:35:23',NULL,NULL,''),(11631,'已完成实例',11630,2,'allTaskWaiting','workflow/instance/finish','',1,1,'C','0','0','','log','1','2024-08-06 09:35:23','admin','2024-08-06 10:48:08',''),(11632,'我的已办',11618,4,'taskFinish','workflow/task/personalFinish','',1,1,'C','0','0','','log','1','2024-08-06 09:35:23','admin','2024-08-06 10:42:27',''),(11633,'全部已办',11618,2,'taskCopyList','workflow/task/finish','',1,1,'C','0','0','','druid','1','2024-08-06 09:35:23','admin','2024-08-06 10:41:46',''),(11638,'请假申请',5,1,'leave','demo/leave/index',NULL,1,0,'C','0','0','demo:leave:list','user','1','2024-08-06 09:35:26','admin','2024-08-06 13:54:25','请假申请菜单'),(11639,'请假申请查询',11638,1,'#','',NULL,1,0,'F','0','0','demo:leave:query','#','1','2024-08-06 09:35:26','admin','2024-08-06 13:54:53',''),(11640,'请假申请新增',11638,2,'#','',NULL,1,0,'F','0','0','demo:leave:add','#','1','2024-08-06 09:35:26','admin','2024-08-06 13:55:16',''),(11641,'请假申请修改',11638,3,'#','',NULL,1,0,'F','0','0','demo:leave:edit','#','1','2024-08-06 09:35:26','admin','2024-08-06 13:55:26',''),(11642,'请假申请删除',11638,4,'#','',NULL,1,0,'F','0','0','demo:leave:remove','#','1','2024-08-06 09:35:26','admin','2024-08-06 13:55:35',''),(11643,'请假申请导出',11638,5,'#','',NULL,1,0,'F','0','0','demo:leave:export','#','1','2024-08-06 09:35:26','admin','2024-08-06 13:54:42',''),(11644,'业务规则查询',11628,1,'#','',NULL,1,0,'F','0','0','workflow:businessRule:query','','1','2024-08-06 09:37:27','admin','2024-08-06 10:36:21',''),(11645,'业务规则新增',11628,2,'#','',NULL,1,0,'F','0','0','workflow:businessRule:add','','1','2024-08-06 09:37:28','admin','2024-08-06 10:36:40',''),(11646,'业务规则修改',11628,3,'#','',NULL,1,0,'F','0','0','workflow:businessRule:edit','','1','2024-08-06 09:37:28','admin','2024-08-06 10:36:56',''),(11647,'业务规则删除',11628,4,'#','',NULL,1,0,'F','0','0','workflow:businessRule:remove','','1','2024-08-06 09:37:28','admin','2024-08-06 10:37:15',''),(11648,'业务规则导出',11628,5,'#','',NULL,1,0,'F','0','0','workflow:businessRule:export','tree-table','1','2024-08-06 09:37:28','admin','2024-08-06 10:37:43',''),(1820710032800944129,'报表注册',3,3,'reportRegister','report/reportRegister/index',NULL,1,0,'C','0','0','report:reportRegister:list','documentation','admin','2024-08-06 14:34:34','admin','2024-08-06 14:34:34','');
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
  `send_id` bigint DEFAULT NULL COMMENT '消息发送者id',
  `record_id` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '消息接收者id',
  `type` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '消息类型1：站内信，2：邮件，3：短信',
  `title` varchar(300) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '标题',
  `read_time` datetime DEFAULT NULL COMMENT '阅读时间',
  `status` varchar(5) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '阅读状态0：未读，1：已读',
  `message_content` text COLLATE utf8mb4_general_ci COMMENT '消息内容',
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
  `notice_id` bigint NOT NULL COMMENT '公告ID',
  `notice_title` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob COMMENT '公告内容',
  `status` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='通知公告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_notice`
--

LOCK TABLES `sys_notice` WRITE;
/*!40000 ALTER TABLE `sys_notice` DISABLE KEYS */;
INSERT INTO `sys_notice` VALUES (1,'温馨提醒：2018-07-01 新版本发布啦','2',_binary '新版本内容','0','admin','2024-08-05 19:20:11','',NULL,'管理员'),(2,'维护通知：2018-07-01 系统凌晨维护','1',_binary '维护内容','0','admin','2024-08-05 19:20:11','',NULL,'管理员');
/*!40000 ALTER TABLE `sys_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_oper_log`
--

DROP TABLE IF EXISTS `sys_oper_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint NOT NULL COMMENT '日志主键',
  `title` varchar(50) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '模块标题',
  `business_type` int DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '请求方式',
  `operator_type` int DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '返回参数',
  `status` int DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`),
  KEY `idx_sys_oper_log_bt` (`business_type`),
  KEY `idx_sys_oper_log_s` (`status`),
  KEY `idx_sys_oper_log_ot` (`oper_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='操作日志记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_oper_log`
--

LOCK TABLES `sys_oper_log` WRITE;
/*!40000 ALTER TABLE `sys_oper_log` DISABLE KEYS */;
INSERT INTO `sys_oper_log` VALUES (1820640121722454017,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"createBy\":\"1\",\"createTime\":\"2024-08-06 09:35:23\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 09:56:45\",\"parentName\":null,\"parentId\":11616,\"children\":[],\"menuId\":11620,\"menuName\":\"流程定义\",\"orderNum\":3,\"path\":\"processDefinition\",\"component\":\"workflow/definition/index\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"1\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"\",\"icon\":\"process-definition\",\"remark\":\"\"}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-08-06 09:56:46'),(1820642672958193666,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"createBy\":\"1\",\"createTime\":\"2024-08-06 09:35:23\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 10:06:53\",\"parentName\":null,\"parentId\":11618,\"children\":[],\"menuId\":11619,\"menuName\":\"我的待办\",\"orderNum\":2,\"path\":\"taskWaiting\",\"component\":\"workflow/task/getTaskWaitByPage\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"1\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"\",\"icon\":\"waiting\",\"remark\":\"\"}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-08-06 10:06:54'),(1820644982874652673,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"createBy\":\"1\",\"createTime\":\"2024-08-06 09:35:23\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 10:16:04\",\"parentName\":null,\"parentId\":11618,\"children\":[],\"menuId\":11619,\"menuName\":\"我的待办\",\"orderNum\":2,\"path\":\"taskWaiting\",\"component\":\"workflow/task/personalWaiting\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"1\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"\",\"icon\":\"waiting\",\"remark\":\"\"}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-08-06 10:16:05'),(1820645096649342978,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"createBy\":\"1\",\"createTime\":\"2024-08-06 09:35:23\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 10:16:31\",\"parentName\":null,\"parentId\":11618,\"children\":[],\"menuId\":11632,\"menuName\":\"我的已办\",\"orderNum\":3,\"path\":\"taskFinish\",\"component\":\"workflow/task/personalFinish\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"1\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"\",\"icon\":\"finish\",\"remark\":\"\"}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-08-06 10:16:32'),(1820646977136181250,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"createBy\":\"1\",\"createTime\":\"2024-08-06 09:35:23\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 10:23:59\",\"parentName\":null,\"parentId\":11618,\"children\":[],\"menuId\":11629,\"menuName\":\"全部待办\",\"orderNum\":1,\"path\":\"myDocument\",\"component\":\"workflow/task/waiting\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"1\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"\",\"icon\":\"guide\",\"remark\":\"\"}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-08-06 10:24:00'),(1820647109122539521,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"createBy\":\"1\",\"createTime\":\"2024-08-06 09:35:23\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 10:24:31\",\"parentName\":null,\"parentId\":11618,\"children\":[],\"menuId\":11633,\"menuName\":\"全部已办\",\"orderNum\":4,\"path\":\"taskCopyList\",\"component\":\"workflow/task/finish\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"1\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"\",\"icon\":\"my-copy\",\"remark\":\"\"}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-08-06 10:24:31'),(1820647254438395905,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"createBy\":\"1\",\"createTime\":\"2024-08-06 09:35:23\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 10:25:06\",\"parentName\":null,\"parentId\":11618,\"children\":[],\"menuId\":11619,\"menuName\":\"我的待办\",\"orderNum\":3,\"path\":\"taskWaiting\",\"component\":\"workflow/task/personalWaiting\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"1\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"\",\"icon\":\"waiting\",\"remark\":\"\"}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-08-06 10:25:06'),(1820647277720977409,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"createBy\":\"1\",\"createTime\":\"2024-08-06 09:35:23\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 10:25:11\",\"parentName\":null,\"parentId\":11618,\"children\":[],\"menuId\":11632,\"menuName\":\"我的已办\",\"orderNum\":4,\"path\":\"taskFinish\",\"component\":\"workflow/task/personalFinish\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"1\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"\",\"icon\":\"finish\",\"remark\":\"\"}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-08-06 10:25:12'),(1820647298977710081,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"createBy\":\"1\",\"createTime\":\"2024-08-06 09:35:23\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 10:25:16\",\"parentName\":null,\"parentId\":11618,\"children\":[],\"menuId\":11633,\"menuName\":\"全部已办\",\"orderNum\":2,\"path\":\"taskCopyList\",\"component\":\"workflow/task/finish\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"1\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"\",\"icon\":\"my-copy\",\"remark\":\"\"}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-08-06 10:25:17'),(1820648019563331585,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/11627','127.0.0.1','内网IP','{}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-08-06 10:28:09'),(1820648037779193857,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/11625','127.0.0.1','内网IP','{}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-08-06 10:28:13'),(1820648058788462594,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/11623','127.0.0.1','内网IP','{}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-08-06 10:28:18'),(1820648317438607362,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"createBy\":\"1\",\"createTime\":\"2024-08-06 09:35:23\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 10:29:19\",\"parentName\":null,\"parentId\":11616,\"children\":[],\"menuId\":11617,\"menuName\":\"模型管理\",\"orderNum\":2,\"path\":\"model\",\"component\":\"workflow/model/index\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"1\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"\",\"icon\":\"model\",\"remark\":\"\"}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-08-06 10:29:20'),(1820649167166849026,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"createBy\":\"1\",\"createTime\":\"2024-08-06 09:35:23\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 10:32:42\",\"parentName\":null,\"parentId\":11630,\"children\":[],\"menuId\":11621,\"menuName\":\"执行中实例\",\"orderNum\":1,\"path\":\"processInstance\",\"component\":\"workflow/instance/running\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"1\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"\",\"icon\":\"tree-table\",\"remark\":\"\"}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-08-06 10:32:42'),(1820649319155843073,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"createBy\":\"1\",\"createTime\":\"2024-08-06 09:35:23\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 10:33:18\",\"parentName\":null,\"parentId\":11630,\"children\":[],\"menuId\":11631,\"menuName\":\"已完成实例\",\"orderNum\":2,\"path\":\"allTaskWaiting\",\"component\":\"workflow/instance/finish\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"1\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"\",\"icon\":\"waiting\",\"remark\":\"\"}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-08-06 10:33:18'),(1820649814972907521,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"createBy\":\"1\",\"createTime\":\"2024-08-06 09:37:27\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 10:35:16\",\"parentName\":null,\"parentId\":11616,\"children\":[],\"menuId\":11628,\"menuName\":\"流程规则\",\"orderNum\":5,\"path\":\"businessRule\",\"component\":\"workflow/businessRule/index\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"workflow:formManage:list\",\"icon\":\"tree-table\",\"remark\":\"表单管理菜单\"}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-08-06 10:35:17'),(1820649947697463298,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"createBy\":\"1\",\"createTime\":\"2024-08-06 09:37:27\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 10:35:48\",\"parentName\":null,\"parentId\":11616,\"children\":[],\"menuId\":11628,\"menuName\":\"业务规则\",\"orderNum\":5,\"path\":\"businessRule\",\"component\":\"workflow/businessRule/index\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"workflow:businessRule:list\",\"icon\":\"tree-table\",\"remark\":\"表单管理菜单\"}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-08-06 10:35:48'),(1820650085992054786,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"createBy\":\"1\",\"createTime\":\"2024-08-06 09:37:27\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 10:36:21\",\"parentName\":null,\"parentId\":11628,\"children\":[],\"menuId\":11644,\"menuName\":\"业务规则查询\",\"orderNum\":1,\"path\":\"#\",\"component\":\"\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"F\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"workflow:businessRule:query\",\"icon\":\"\",\"remark\":\"\"}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-08-06 10:36:21'),(1820650163645399041,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"createBy\":\"1\",\"createTime\":\"2024-08-06 09:37:28\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 10:36:39\",\"parentName\":null,\"parentId\":11628,\"children\":[],\"menuId\":11645,\"menuName\":\"业务规则新增\",\"orderNum\":2,\"path\":\"#\",\"component\":\"\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"F\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"workflow:businessRule:add\",\"icon\":\"\",\"remark\":\"\"}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-08-06 10:36:40'),(1820650231056252930,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"createBy\":\"1\",\"createTime\":\"2024-08-06 09:37:28\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 10:36:55\",\"parentName\":null,\"parentId\":11628,\"children\":[],\"menuId\":11646,\"menuName\":\"业务规则修改\",\"orderNum\":3,\"path\":\"#\",\"component\":\"\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"F\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"workflow:businessRule:edit\",\"icon\":\"\",\"remark\":\"\"}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-08-06 10:36:56'),(1820650312220229634,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"createBy\":\"1\",\"createTime\":\"2024-08-06 09:37:28\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 10:37:15\",\"parentName\":null,\"parentId\":11628,\"children\":[],\"menuId\":11647,\"menuName\":\"业务规则删除\",\"orderNum\":4,\"path\":\"#\",\"component\":\"\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"F\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"workflow:businessRule:remove\",\"icon\":\"\",\"remark\":\"\"}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-08-06 10:37:15'),(1820650430898061314,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"createBy\":\"1\",\"createTime\":\"2024-08-06 09:37:28\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 10:37:43\",\"parentName\":null,\"parentId\":11628,\"children\":[],\"menuId\":11648,\"menuName\":\"业务规则导出\",\"orderNum\":5,\"path\":\"#\",\"component\":\"\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"F\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"workflow:businessRule:export\",\"icon\":\"tree-table\",\"remark\":\"\"}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-08-06 10:37:43'),(1820650675266600961,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"createBy\":\"1\",\"createTime\":\"2024-08-06 09:37:27\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 10:38:41\",\"parentName\":null,\"parentId\":11616,\"children\":[],\"menuId\":11628,\"menuName\":\"业务规则\",\"orderNum\":5,\"path\":\"businessRule\",\"component\":\"workflow/businessRule/index\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"workflow:businessRule:list\",\"icon\":\"skill\",\"remark\":\"表单管理菜单\"}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-08-06 10:38:42'),(1820650894712586241,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"createBy\":\"1\",\"createTime\":\"2024-08-06 09:35:23\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 10:39:33\",\"parentName\":null,\"parentId\":0,\"children\":[],\"menuId\":11618,\"menuName\":\"我的任务\",\"orderNum\":7,\"path\":\"task\",\"component\":\"\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"M\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"\",\"icon\":\"tab\",\"remark\":\"\"}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-08-06 10:39:34'),(1820651098882916354,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"createBy\":\"1\",\"createTime\":\"2024-08-06 09:35:22\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 10:40:22\",\"parentName\":null,\"parentId\":0,\"children\":[],\"menuId\":11616,\"menuName\":\"工作流\",\"orderNum\":6,\"path\":\"workflow\",\"component\":\"\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"M\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"\",\"icon\":\"documentation\",\"remark\":\"\"}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-08-06 10:40:23'),(1820651193980370946,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"createBy\":\"1\",\"createTime\":\"2024-08-06 09:35:23\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 10:40:45\",\"parentName\":null,\"parentId\":11616,\"children\":[],\"menuId\":11617,\"menuName\":\"模型管理\",\"orderNum\":2,\"path\":\"model\",\"component\":\"workflow/model/index\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"1\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"\",\"icon\":\"education\",\"remark\":\"\"}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-08-06 10:40:45'),(1820651229925556225,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"createBy\":\"1\",\"createTime\":\"2024-08-06 09:35:23\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 10:40:53\",\"parentName\":null,\"parentId\":11616,\"children\":[],\"menuId\":11620,\"menuName\":\"流程定义\",\"orderNum\":3,\"path\":\"processDefinition\",\"component\":\"workflow/definition/index\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"1\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"\",\"icon\":\"dict\",\"remark\":\"\"}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-08-06 10:40:54'),(1820651308178685953,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"createBy\":\"1\",\"createTime\":\"2024-08-06 09:35:23\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 10:41:12\",\"parentName\":null,\"parentId\":11616,\"children\":[],\"menuId\":11622,\"menuName\":\"流程分类\",\"orderNum\":1,\"path\":\"category\",\"component\":\"workflow/category/index\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"workflow:category:list\",\"icon\":\"nested\",\"remark\":\"\"}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-08-06 10:41:13'),(1820651384124948481,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"createBy\":\"1\",\"createTime\":\"2024-08-06 09:35:23\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 10:41:30\",\"parentName\":null,\"parentId\":11618,\"children\":[],\"menuId\":11629,\"menuName\":\"全部待办\",\"orderNum\":1,\"path\":\"myDocument\",\"component\":\"workflow/task/waiting\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"1\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"\",\"icon\":\"cascader\",\"remark\":\"\"}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-08-06 10:41:31'),(1820651450311065601,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"createBy\":\"1\",\"createTime\":\"2024-08-06 09:35:23\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 10:41:46\",\"parentName\":null,\"parentId\":11618,\"children\":[],\"menuId\":11633,\"menuName\":\"全部已办\",\"orderNum\":2,\"path\":\"taskCopyList\",\"component\":\"workflow/task/finish\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"1\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"\",\"icon\":\"druid\",\"remark\":\"\"}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-08-06 10:41:46'),(1820651569546739713,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"createBy\":\"1\",\"createTime\":\"2024-08-06 09:35:23\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 10:42:14\",\"parentName\":null,\"parentId\":11618,\"children\":[],\"menuId\":11619,\"menuName\":\"我的待办\",\"orderNum\":3,\"path\":\"taskWaiting\",\"component\":\"workflow/task/personalWaiting\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"1\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"\",\"icon\":\"job\",\"remark\":\"\"}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-08-06 10:42:15'),(1820651621472223234,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"createBy\":\"1\",\"createTime\":\"2024-08-06 09:35:23\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 10:42:27\",\"parentName\":null,\"parentId\":11618,\"children\":[],\"menuId\":11632,\"menuName\":\"我的已办\",\"orderNum\":4,\"path\":\"taskFinish\",\"component\":\"workflow/task/personalFinish\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"1\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"\",\"icon\":\"log\",\"remark\":\"\"}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-08-06 10:42:27'),(1820651814800277505,'流程分类',1,'com.ruoyi.workflow.controller.ActCategoryController.add()','POST',1,'admin','研发部门','/workflow/category','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2024-08-06 10:43:13\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 10:43:13\",\"id\":\"1820651814552813569\",\"categoryName\":\"告警流程\",\"categoryCode\":null,\"parentId\":0,\"orderNum\":1}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-08-06 10:43:13'),(1820653006196523009,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"createBy\":\"1\",\"createTime\":\"2024-08-06 09:35:23\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 10:47:57\",\"parentName\":null,\"parentId\":11630,\"children\":[],\"menuId\":11621,\"menuName\":\"执行中实例\",\"orderNum\":1,\"path\":\"processInstance\",\"component\":\"workflow/instance/running\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"1\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"\",\"icon\":\"job\",\"remark\":\"\"}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-08-06 10:47:57'),(1820653051054604289,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"createBy\":\"1\",\"createTime\":\"2024-08-06 09:35:23\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 10:48:08\",\"parentName\":null,\"parentId\":11630,\"children\":[],\"menuId\":11631,\"menuName\":\"已完成实例\",\"orderNum\":2,\"path\":\"allTaskWaiting\",\"component\":\"workflow/instance/finish\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"1\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"\",\"icon\":\"log\",\"remark\":\"\"}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-08-06 10:48:08'),(1820659123077201921,'流程分类',1,'com.ruoyi.workflow.controller.ActCategoryController.add()','POST',1,'admin','研发部门','/workflow/category','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2024-08-06 11:12:15\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 11:12:15\",\"id\":\"1820659122791989249\",\"categoryName\":\"1\",\"categoryCode\":null,\"parentId\":\"1820651814552813569\",\"orderNum\":1}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-08-06 11:12:16'),(1820661580431835137,'流程分类',3,'com.ruoyi.workflow.controller.ActCategoryController.delete()','DELETE',1,'admin','研发部门','/workflow/category/1820659122791989249','127.0.0.1','内网IP','{}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-08-06 11:22:02'),(1820662042790936578,'流程定义管理',1,'com.ruoyi.workflow.controller.ActProcessDefinitionController.deployByFile()','POST',1,'admin','研发部门','/workflow/definition/deployByFile','127.0.0.1','内网IP','\"alarm\"','',1,'流程分类不能为空(文件名 = 流程名称-流程key)','2024-08-06 11:23:52'),(1820662237876404225,'流程定义管理',1,'com.ruoyi.workflow.controller.ActProcessDefinitionController.deployByFile()','POST',1,'admin','研发部门','/workflow/definition/deployByFile','127.0.0.1','内网IP','\"alarm\"','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-08-06 11:24:38'),(1820663302084575233,'模型管理',2,'com.ruoyi.workflow.controller.ActModelController.convertToModel()','PUT',1,'admin','研发部门','/workflow/model/convertToModel/leave1:1:1820662237058514946','127.0.0.1','内网IP','\"leave1:1:1820662237058514946\"','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-08-06 11:28:52'),(1820699773789212673,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"createBy\":\"1\",\"createTime\":\"2024-08-06 09:35:26\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 13:53:47\",\"parentName\":null,\"parentId\":5,\"children\":[],\"menuId\":11638,\"menuName\":\"请假申请\",\"orderNum\":1,\"path\":\"leave\",\"component\":\"demo/leave/index\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"workflow:leave:list\",\"icon\":\"user\",\"remark\":\"请假申请菜单\"}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-08-06 13:53:48'),(1820699930551324673,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"createBy\":\"1\",\"createTime\":\"2024-08-06 09:35:26\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 13:54:24\",\"parentName\":null,\"parentId\":5,\"children\":[],\"menuId\":11638,\"menuName\":\"请假申请\",\"orderNum\":1,\"path\":\"leave\",\"component\":\"demo/leave/index\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"demo:leave:list\",\"icon\":\"user\",\"remark\":\"请假申请菜单\"}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-08-06 13:54:25'),(1820700000931745794,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"createBy\":\"1\",\"createTime\":\"2024-08-06 09:35:26\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 13:54:41\",\"parentName\":null,\"parentId\":11638,\"children\":[],\"menuId\":11643,\"menuName\":\"请假申请导出\",\"orderNum\":5,\"path\":\"#\",\"component\":\"\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"F\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"demo:leave:export\",\"icon\":\"#\",\"remark\":\"\"}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-08-06 13:54:42'),(1820700049078161410,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"createBy\":\"1\",\"createTime\":\"2024-08-06 09:35:26\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 13:54:53\",\"parentName\":null,\"parentId\":11638,\"children\":[],\"menuId\":11639,\"menuName\":\"请假申请查询\",\"orderNum\":1,\"path\":\"#\",\"component\":\"\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"F\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"demo:leave:query\",\"icon\":\"#\",\"remark\":\"\"}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-08-06 13:54:53'),(1820700144016232450,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"createBy\":\"1\",\"createTime\":\"2024-08-06 09:35:26\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 13:55:15\",\"parentName\":null,\"parentId\":11638,\"children\":[],\"menuId\":11640,\"menuName\":\"请假申请新增\",\"orderNum\":2,\"path\":\"#\",\"component\":\"\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"F\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"demo:leave:add\",\"icon\":\"#\",\"remark\":\"\"}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-08-06 13:55:16'),(1820700184470294529,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"createBy\":\"1\",\"createTime\":\"2024-08-06 09:35:26\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 13:55:25\",\"parentName\":null,\"parentId\":11638,\"children\":[],\"menuId\":11641,\"menuName\":\"请假申请修改\",\"orderNum\":3,\"path\":\"#\",\"component\":\"\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"F\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"demo:leave:edit\",\"icon\":\"#\",\"remark\":\"\"}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-08-06 13:55:26'),(1820700224890802177,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"createBy\":\"1\",\"createTime\":\"2024-08-06 09:35:26\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 13:55:35\",\"parentName\":null,\"parentId\":11638,\"children\":[],\"menuId\":11642,\"menuName\":\"请假申请删除\",\"orderNum\":4,\"path\":\"#\",\"component\":\"\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"F\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"demo:leave:remove\",\"icon\":\"#\",\"remark\":\"\"}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-08-06 13:55:35'),(1820701866105180162,'字典类型',1,'com.ruoyi.web.controller.system.SysDictTypeController.add()','POST',1,'admin','研发部门','/system/dict/type','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2024-08-06 14:02:06\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 14:02:06\",\"dictId\":\"1820701865723498498\",\"dictName\":\"请假类型\",\"dictType\":\"bs_leave_type\",\"status\":\"0\",\"remark\":null}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-08-06 14:02:07'),(1820702182968070146,'字典数据',1,'com.ruoyi.web.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2024-08-06 14:03:22\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 14:03:22\",\"dictCode\":\"1820702182615748609\",\"dictSort\":0,\"dictLabel\":\"病假\",\"dictValue\":\"1\",\"dictType\":\"bs_leave_type\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-08-06 14:03:22'),(1820702261342834689,'字典数据',1,'com.ruoyi.web.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2024-08-06 14:03:40\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 14:03:40\",\"dictCode\":\"1820702261103759361\",\"dictSort\":1,\"dictLabel\":\"事假\",\"dictValue\":\"2\",\"dictType\":\"bs_leave_type\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-08-06 14:03:41'),(1820702313859715073,'字典数据',1,'com.ruoyi.web.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2024-08-06 14:03:53\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 14:03:53\",\"dictCode\":\"1820702313578696706\",\"dictSort\":2,\"dictLabel\":\"年假\",\"dictValue\":\"3\",\"dictType\":\"bs_leave_type\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-08-06 14:03:53'),(1820702697105854465,'请假业务',1,'com.ruoyi.demo.controller.BsLeaveController.add()','POST',1,'admin','研发部门','/demo/leave','127.0.0.1','内网IP','{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":null,\"username\":\"admin\",\"duration\":\"2.5\",\"principal\":\"admin\",\"contactPhone\":\"111111111111\",\"leaveType\":3,\"title\":\"请年假\",\"leaveReason\":\"休息\",\"startDate\":\"2024-08-07 00:00:00\",\"endDate\":\"2024-08-09 00:00:00\",\"actNodeAssignee\":null}','{\"code\":200,\"msg\":\"操作成功\",\"data\":{\"createBy\":\"admin\",\"createTime\":\"2024-08-06 14:05:24\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 14:05:24\",\"id\":\"1820702696808058882\",\"username\":\"admin\",\"duration\":\"2.5\",\"principal\":\"admin\",\"contactPhone\":\"111111111111\",\"leaveType\":3,\"title\":\"请年假\",\"leaveReason\":\"休息\",\"startDate\":\"2024-08-07 00:00:00\",\"endDate\":\"2024-08-09 00:00:00\"}}',0,'','2024-08-06 14:05:25'),(1820702698074738690,'流程实例管理',1,'com.ruoyi.workflow.controller.ActProcessInstanceController.startWorkFlow()','POST',1,'admin','研发部门','/workflow/processInstance/startWorkFlow','127.0.0.1','内网IP','{\"businessKey\":\"1820702696808058882\",\"processKey\":\"leave\",\"assignees\":null,\"tableName\":\"bs_leave\",\"variables\":{\"entity\":{\"createBy\":\"admin\",\"createTime\":\"2024-08-06 14:05:24\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 14:05:24\",\"id\":\"1820702696808058882\",\"username\":\"admin\",\"duration\":\"2.5\",\"principal\":\"admin\",\"contactPhone\":\"111111111111\",\"leaveType\":3,\"title\":\"请年假\",\"leaveReason\":\"休息\",\"startDate\":\"2024-08-07 00:00:00\",\"endDate\":\"2024-08-09 00:00:00\"},\"userId\":\"1\",\"_FLOWABLE_SKIP_EXPRESSION_ENABLED\":true}}','',1,'No process definition found for key \'leave\'','2024-08-06 14:05:25'),(1820703258203066369,'流程定义管理',1,'com.ruoyi.workflow.controller.ActProcessDefinitionController.deployByFile()','POST',1,'admin','研发部门','/workflow/definition/deployByFile','127.0.0.1','内网IP','\"alarm\"','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-08-06 14:07:38'),(1820703300263546882,'流程定义管理',1,'com.ruoyi.workflow.controller.ActProcessDefinitionController.deployByFile()','POST',1,'admin','研发部门','/workflow/definition/deployByFile','127.0.0.1','内网IP','\"alarm\"','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-08-06 14:07:48'),(1820703329812418561,'流程定义管理',1,'com.ruoyi.workflow.controller.ActProcessDefinitionController.deployByFile()','POST',1,'admin','研发部门','/workflow/definition/deployByFile','127.0.0.1','内网IP','\"alarm\"','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-08-06 14:07:56'),(1820703359277404162,'流程定义管理',1,'com.ruoyi.workflow.controller.ActProcessDefinitionController.deployByFile()','POST',1,'admin','研发部门','/workflow/definition/deployByFile','127.0.0.1','内网IP','\"alarm\"','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-08-06 14:08:03'),(1820703378042720257,'流程定义管理',1,'com.ruoyi.workflow.controller.ActProcessDefinitionController.deployByFile()','POST',1,'admin','研发部门','/workflow/definition/deployByFile','127.0.0.1','内网IP','\"alarm\"','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-08-06 14:08:07'),(1820703719840747521,'请假业务',2,'com.ruoyi.demo.controller.BsLeaveController.edit()','PUT',1,'admin','研发部门','/demo/leave','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2024-08-06 14:05:24\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 14:05:24\",\"id\":\"1820702696808058882\",\"username\":\"admin\",\"duration\":\"2.5\",\"principal\":\"admin\",\"contactPhone\":\"111111111111\",\"leaveType\":3,\"title\":\"请年假\",\"leaveReason\":\"休息\",\"startDate\":\"2024-08-07 00:00:00\",\"endDate\":\"2024-08-09 00:00:00\",\"actNodeAssignee\":null}','{\"code\":200,\"msg\":\"操作成功\",\"data\":{\"createBy\":\"admin\",\"createTime\":\"2024-08-06 14:05:24\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 14:09:28\",\"id\":\"1820702696808058882\",\"username\":\"admin\",\"duration\":\"2.5\",\"principal\":\"admin\",\"contactPhone\":\"111111111111\",\"leaveType\":3,\"title\":\"请年假\",\"leaveReason\":\"休息\",\"startDate\":\"2024-08-07 00:00:00\",\"endDate\":\"2024-08-09 00:00:00\"}}',0,'','2024-08-06 14:09:29'),(1820703720490864642,'流程实例管理',1,'com.ruoyi.workflow.controller.ActProcessInstanceController.startWorkFlow()','POST',1,'admin','研发部门','/workflow/processInstance/startWorkFlow','127.0.0.1','内网IP','{\"businessKey\":\"1820702696808058882\",\"processKey\":\"leave\",\"assignees\":null,\"tableName\":\"bs_leave\",\"variables\":{\"entity\":{\"createBy\":\"admin\",\"createTime\":\"2024-08-06 14:05:24\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 14:09:28\",\"id\":\"1820702696808058882\",\"username\":\"admin\",\"duration\":\"2.5\",\"principal\":\"admin\",\"contactPhone\":\"111111111111\",\"leaveType\":3,\"title\":\"请年假\",\"leaveReason\":\"休息\",\"startDate\":\"2024-08-07 00:00:00\",\"endDate\":\"2024-08-09 00:00:00\"},\"userId\":\"1\",\"_FLOWABLE_SKIP_EXPRESSION_ENABLED\":true}}','',1,'No process definition found for key \'leave\'','2024-08-06 14:09:29'),(1820703822840270849,'请假业务',2,'com.ruoyi.demo.controller.BsLeaveController.edit()','PUT',1,'admin','研发部门','/demo/leave','127.0.0.1','内网IP','{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"1820702696808058882\",\"username\":\"admin\",\"duration\":\"2.50\",\"principal\":\"admin\",\"contactPhone\":\"111111111111\",\"leaveType\":3,\"title\":\"请年假\",\"leaveReason\":\"休息\",\"startDate\":\"2024-08-07 00:00:00\",\"endDate\":\"2024-08-09 00:00:00\",\"actNodeAssignee\":null}','{\"code\":200,\"msg\":\"操作成功\",\"data\":{\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 14:09:52\",\"id\":\"1820702696808058882\",\"username\":\"admin\",\"duration\":\"2.50\",\"principal\":\"admin\",\"contactPhone\":\"111111111111\",\"leaveType\":3,\"title\":\"请年假\",\"leaveReason\":\"休息\",\"startDate\":\"2024-08-07 00:00:00\",\"endDate\":\"2024-08-09 00:00:00\"}}',0,'','2024-08-06 14:09:53'),(1820703825801449473,'流程实例管理',1,'com.ruoyi.workflow.controller.ActProcessInstanceController.startWorkFlow()','POST',1,'admin','研发部门','/workflow/processInstance/startWorkFlow','127.0.0.1','内网IP','{\"businessKey\":\"1820702696808058882\",\"processKey\":\"leave1\",\"assignees\":null,\"tableName\":\"bs_leave\",\"variables\":{\"entity\":{\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 14:09:52\",\"id\":\"1820702696808058882\",\"username\":\"admin\",\"duration\":\"2.50\",\"principal\":\"admin\",\"contactPhone\":\"111111111111\",\"leaveType\":3,\"title\":\"请年假\",\"leaveReason\":\"休息\",\"startDate\":\"2024-08-07 00:00:00\",\"endDate\":\"2024-08-09 00:00:00\"},\"userId\":\"1\",\"_FLOWABLE_SKIP_EXPRESSION_ENABLED\":true}}','{\"code\":200,\"msg\":\"提交成功\",\"data\":{\"processInstanceId\":\"1820703824446689282\",\"taskId\":\"1820703824526381058\"}}',0,'','2024-08-06 14:09:54'),(1820707619507474434,'请假业务',2,'com.ruoyi.demo.controller.BsLeaveController.edit()','PUT',1,'admin','研发部门','/demo/leave','127.0.0.1','内网IP','{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"1820702696808058882\",\"username\":\"admin\",\"duration\":\"2.50\",\"principal\":\"admin\",\"contactPhone\":\"111111111111\",\"leaveType\":3,\"title\":\"请年假\",\"leaveReason\":\"休息\",\"startDate\":\"2024-08-07 00:00:00\",\"endDate\":\"2024-08-09 00:00:00\",\"actNodeAssignee\":null}','{\"code\":200,\"msg\":\"操作成功\",\"data\":{\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 14:24:58\",\"id\":\"1820702696808058882\",\"username\":\"admin\",\"duration\":\"2.50\",\"principal\":\"admin\",\"contactPhone\":\"111111111111\",\"leaveType\":3,\"title\":\"请年假\",\"leaveReason\":\"休息\",\"startDate\":\"2024-08-07 00:00:00\",\"endDate\":\"2024-08-09 00:00:00\"}}',0,'','2024-08-06 14:24:58'),(1820707620371501057,'流程实例管理',1,'com.ruoyi.workflow.controller.ActProcessInstanceController.startWorkFlow()','POST',1,'admin','研发部门','/workflow/processInstance/startWorkFlow','127.0.0.1','内网IP','{\"businessKey\":\"1820702696808058882\",\"processKey\":\"leave1\",\"assignees\":null,\"tableName\":\"bs_leave\",\"variables\":{\"entity\":{\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 14:24:58\",\"id\":\"1820702696808058882\",\"username\":\"admin\",\"duration\":\"2.50\",\"principal\":\"admin\",\"contactPhone\":\"111111111111\",\"leaveType\":3,\"title\":\"请年假\",\"leaveReason\":\"休息\",\"startDate\":\"2024-08-07 00:00:00\",\"endDate\":\"2024-08-09 00:00:00\"},\"userId\":\"1\"}}','{\"code\":200,\"msg\":\"提交成功\",\"data\":{\"processInstanceId\":\"1820703824446689282\",\"taskId\":\"1820703824526381058\"}}',0,'','2024-08-06 14:24:58'),(1820710032977104898,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2024-08-06 14:34:33\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 14:34:33\",\"parentName\":null,\"parentId\":3,\"children\":[],\"menuId\":\"1820710032800944129\",\"menuName\":\"报表注册\",\"orderNum\":3,\"path\":\"reportRegister\",\"component\":\"report/reportRegister/index\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"report:reportRegister:list\",\"icon\":\"documentation\",\"remark\":null}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-08-06 14:34:34'),(1820718910502539266,'流程节点人员设置管理',1,'com.ruoyi.workflow.controller.ActNodeAssigneeController.add()','POST',1,'admin','研发部门','/workflow/actNodeAssignee','127.0.0.1','内网IP','{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":null,\"processDefinitionId\":\"leave1:1:1820662237058514946\",\"chooseWay\":\"role\",\"nodeId\":\"Activity_0lym9dc\",\"nodeName\":\"组长\",\"assignee\":\"超级管理员\",\"assigneeId\":\"1\",\"businessRuleId\":null,\"isShow\":false,\"multiple\":false,\"multipleColumn\":\"\",\"isBack\":false,\"isDelegate\":false,\"isTransmit\":false,\"isCopy\":false,\"addMultiInstance\":false,\"deleteMultiInstance\":false,\"taskListener\":\"\",\"autoComplete\":null,\"fieldListJson\":\"\",\"showBack\":true,\"taskListenerList\":[],\"fieldList\":[],\"index\":1}','{\"code\":200,\"msg\":\"操作成功\",\"data\":{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":null,\"processDefinitionId\":\"leave1:1:1820662237058514946\",\"chooseWay\":\"role\",\"nodeId\":\"Activity_0lym9dc\",\"nodeName\":\"组长\",\"assignee\":\"超级管理员\",\"assigneeId\":\"1\",\"businessRuleId\":null,\"isShow\":false,\"multiple\":false,\"multipleColumn\":\"\",\"isBack\":false,\"isDelegate\":false,\"isTransmit\":false,\"isCopy\":false,\"addMultiInstance\":false,\"deleteMultiInstance\":false,\"taskListener\":\"\",\"autoComplete\":null,\"fieldListJson\":\"\",\"showBack\":true,\"taskListenerList\":[],\"fieldList\":[],\"index\":1}}',0,'','2024-08-06 15:09:50'),(1820719082162819074,'流程节点人员设置管理',1,'com.ruoyi.workflow.controller.ActNodeAssigneeController.add()','POST',1,'admin','研发部门','/workflow/actNodeAssignee','127.0.0.1','内网IP','{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":null,\"processDefinitionId\":\"leave1:1:1820662237058514946\",\"chooseWay\":\"role\",\"nodeId\":\"Activity_1j25s1c\",\"nodeName\":\"部门领导\",\"assignee\":\"超级管理员\",\"assigneeId\":\"1\",\"businessRuleId\":null,\"isShow\":false,\"multiple\":false,\"multipleColumn\":\"\",\"isBack\":false,\"isDelegate\":false,\"isTransmit\":false,\"isCopy\":false,\"addMultiInstance\":false,\"deleteMultiInstance\":false,\"taskListener\":\"\",\"autoComplete\":null,\"fieldListJson\":\"\",\"showBack\":true,\"taskListenerList\":[],\"fieldList\":[],\"index\":1}','{\"code\":200,\"msg\":\"操作成功\",\"data\":{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":null,\"processDefinitionId\":\"leave1:1:1820662237058514946\",\"chooseWay\":\"role\",\"nodeId\":\"Activity_1j25s1c\",\"nodeName\":\"部门领导\",\"assignee\":\"超级管理员\",\"assigneeId\":\"1\",\"businessRuleId\":null,\"isShow\":false,\"multiple\":false,\"multipleColumn\":\"\",\"isBack\":false,\"isDelegate\":false,\"isTransmit\":false,\"isCopy\":false,\"addMultiInstance\":false,\"deleteMultiInstance\":false,\"taskListener\":\"\",\"autoComplete\":null,\"fieldListJson\":\"\",\"showBack\":true,\"taskListenerList\":[],\"fieldList\":[],\"index\":1}}',0,'','2024-08-06 15:10:31'),(1820720401808297986,'流程定义设置',1,'com.ruoyi.workflow.controller.ActProcessDefSettingController.add()','POST',1,'admin','研发部门','/workflow/processDefSetting','127.0.0.1','内网IP','{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":null,\"processDefinitionId\":\"leave1:1:1820662237058514946\",\"processDefinitionKey\":\"leave1\",\"processDefinitionName\":\"请假流程（普通流程）\",\"tableName\":\"bs_leave\",\"componentName\":\"leave\",\"remark\":null,\"settingIds\":null,\"defaultProcess\":false,\"taskListener\":null,\"taskListenerList\":[]}','{\"code\":200,\"msg\":\"操作成功\",\"data\":{\"id\":\"1820720401535668226\",\"processDefinitionId\":\"leave1:1:1820662237058514946\",\"processDefinitionKey\":\"leave1\",\"tableName\":\"bs_leave\",\"processDefinitionName\":\"请假流程（普通流程）\",\"componentName\":\"leave\",\"remark\":null,\"defaultProcess\":false,\"taskListener\":\"\",\"taskListenerList\":[]}}',0,'','2024-08-06 15:15:46'),(1820720533081624578,'流程实例管理',3,'com.ruoyi.workflow.controller.ActProcessInstanceController.deleteRuntimeProcessAndHisInst()','DELETE',1,'admin','研发部门','/workflow/processInstance/deleteRuntimeProcessAndHisInst/1820703824446689282','127.0.0.1','内网IP','{}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-08-06 15:16:17'),(1820720633849778177,'请假业务',2,'com.ruoyi.demo.controller.BsLeaveController.edit()','PUT',1,'admin','研发部门','/demo/leave','127.0.0.1','内网IP','{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"1820702696808058882\",\"username\":\"admin\",\"duration\":\"2.50\",\"principal\":\"admin\",\"contactPhone\":\"111111111111\",\"leaveType\":3,\"title\":\"请年假\",\"leaveReason\":\"休息\",\"startDate\":\"2024-08-07 00:00:00\",\"endDate\":\"2024-08-09 00:00:00\",\"actNodeAssignee\":null}','{\"code\":200,\"msg\":\"操作成功\",\"data\":{\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 15:16:41\",\"id\":\"1820702696808058882\",\"username\":\"admin\",\"duration\":\"2.50\",\"principal\":\"admin\",\"contactPhone\":\"111111111111\",\"leaveType\":3,\"title\":\"请年假\",\"leaveReason\":\"休息\",\"startDate\":\"2024-08-07 00:00:00\",\"endDate\":\"2024-08-09 00:00:00\"}}',0,'','2024-08-06 15:16:41'),(1820720635686883330,'流程实例管理',1,'com.ruoyi.workflow.controller.ActProcessInstanceController.startWorkFlow()','POST',1,'admin','研发部门','/workflow/processInstance/startWorkFlow','127.0.0.1','内网IP','{\"businessKey\":\"1820702696808058882\",\"processKey\":\"leave1\",\"assignees\":null,\"tableName\":\"bs_leave\",\"variables\":{\"entity\":{\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 15:16:41\",\"id\":\"1820702696808058882\",\"username\":\"admin\",\"duration\":\"2.50\",\"principal\":\"admin\",\"contactPhone\":\"111111111111\",\"leaveType\":3,\"title\":\"请年假\",\"leaveReason\":\"休息\",\"startDate\":\"2024-08-07 00:00:00\",\"endDate\":\"2024-08-09 00:00:00\"},\"userId\":\"1\",\"_FLOWABLE_SKIP_EXPRESSION_ENABLED\":true}}','{\"code\":200,\"msg\":\"提交成功\",\"data\":{\"processInstanceId\":\"1820720634709610498\",\"taskId\":\"1820720634734776321\"}}',0,'','2024-08-06 15:16:42'),(1820720737797214210,'任务管理',1,'com.ruoyi.workflow.controller.ActTaskController.completeTask()','POST',1,'admin','研发部门','/workflow/task/completeTask','127.0.0.1','内网IP','{\"taskId\":\"1820720634734776321\",\"isCopy\":false,\"fileId\":null,\"assigneeIds\":null,\"assigneeNames\":null,\"message\":\"提交单据\",\"sendMessage\":{\"title\":\"\",\"type\":[\"1\"],\"messageContent\":\"\"},\"defaultProcess\":true,\"processNodeList\":[{\"nodeId\":\"Activity_0lym9dc\",\"nodeName\":\"组长\",\"nodeType\":null,\"sourceFlowNodeType\":null,\"taskId\":null,\"expression\":null,\"expressionStr\":null,\"chooseWay\":\"person\",\"assignee\":\"疯狂的狮子Li\",\"assigneeId\":\"1\",\"businessRuleId\":null,\"isShow\":false,\"multiple\":false,\"multipleColumn\":\"\",\"sourceFlowElementId\":null,\"x\":null,\"first\":false,\"transactor\":\"疯狂的狮子Li\",\"transactorId\":\"1\",\"disabled\":false},{\"nodeId\":\"Activity_1j25s1c\",\"nodeName\":\"部门领导\",\"nodeType\":null,\"sourceFlowNodeType\":null,\"taskId\":null,\"expression\":null,\"expressionStr\":null,\"chooseWay\":\"person\",\"assignee\":\"疯狂的狮子Li\",\"assigneeId\":\"1\",\"businessRuleId\":null,\"isShow\":false,\"multiple\":false,\"multipleColumn\":\"\",\"sourceFlowElementId\":null,\"x\":null,\"first\":false,\"transactor\":\"疯狂的狮子Li\",\"transactorId\":\"1\",\"disabled\":false}],\"assigneeMap\":{},\"variables\":{\"entity\":{\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 15:16:41\",\"id\":\"1820702696808058882\",\"username\":\"admin\",\"duration\":\"2.50\",\"principal\":\"admin\",\"contactPhone\":\"111111111111\",\"leaveType\":3,\"title\":\"请年假\",\"leaveReason\":\"休息\",\"startDate\":\"2024-08-07 00:00:00\",\"endDate\":\"2024-08-09 00:00:00\"},\"userId\":\"1\"}}','',1,'办理失败:请检查【申请人】节点配置','2024-08-06 15:17:06'),(1820720870798594049,'流程节点人员设置管理',1,'com.ruoyi.workflow.controller.ActNodeAssigneeController.add()','POST',1,'admin','研发部门','/workflow/actNodeAssignee','127.0.0.1','内网IP','{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":null,\"processDefinitionId\":\"leave1:1:1820662237058514946\",\"chooseWay\":\"person\",\"nodeId\":\"Activity_14633hx\",\"nodeName\":\"申请人\",\"assignee\":null,\"assigneeId\":null,\"businessRuleId\":null,\"isShow\":false,\"multiple\":false,\"multipleColumn\":\"\",\"isBack\":false,\"isDelegate\":false,\"isTransmit\":false,\"isCopy\":false,\"addMultiInstance\":false,\"deleteMultiInstance\":false,\"taskListener\":\"\",\"autoComplete\":null,\"fieldListJson\":\"\",\"showBack\":false,\"taskListenerList\":[],\"fieldList\":[],\"index\":0}','{\"code\":200,\"msg\":\"操作成功\",\"data\":{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":null,\"processDefinitionId\":\"leave1:1:1820662237058514946\",\"chooseWay\":\"person\",\"nodeId\":\"Activity_14633hx\",\"nodeName\":\"申请人\",\"assignee\":null,\"assigneeId\":null,\"businessRuleId\":null,\"isShow\":false,\"multiple\":false,\"multipleColumn\":\"\",\"isBack\":false,\"isDelegate\":false,\"isTransmit\":false,\"isCopy\":false,\"addMultiInstance\":false,\"deleteMultiInstance\":false,\"taskListener\":\"\",\"autoComplete\":null,\"fieldListJson\":\"\",\"showBack\":false,\"taskListenerList\":[],\"fieldList\":[],\"index\":0}}',0,'','2024-08-06 15:17:38'),(1820720934459740161,'流程节点人员设置管理',1,'com.ruoyi.workflow.controller.ActNodeAssigneeController.add()','POST',1,'admin','研发部门','/workflow/actNodeAssignee','127.0.0.1','内网IP','{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"1820720870416912385\",\"processDefinitionId\":\"leave1:1:1820662237058514946\",\"chooseWay\":\"person\",\"nodeId\":\"Activity_14633hx\",\"nodeName\":\"申请人\",\"assignee\":null,\"assigneeId\":null,\"businessRuleId\":null,\"isShow\":false,\"multiple\":false,\"multipleColumn\":\"\",\"isBack\":false,\"isDelegate\":false,\"isTransmit\":false,\"isCopy\":false,\"addMultiInstance\":false,\"deleteMultiInstance\":false,\"taskListener\":\"\",\"autoComplete\":null,\"fieldListJson\":\"\",\"showBack\":false,\"taskListenerList\":[],\"fieldList\":[],\"index\":0}','{\"code\":200,\"msg\":\"操作成功\",\"data\":{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"1820720870416912385\",\"processDefinitionId\":\"leave1:1:1820662237058514946\",\"chooseWay\":\"person\",\"nodeId\":\"Activity_14633hx\",\"nodeName\":\"申请人\",\"assignee\":null,\"assigneeId\":null,\"businessRuleId\":null,\"isShow\":false,\"multiple\":false,\"multipleColumn\":\"\",\"isBack\":false,\"isDelegate\":false,\"isTransmit\":false,\"isCopy\":false,\"addMultiInstance\":false,\"deleteMultiInstance\":false,\"taskListener\":\"\",\"autoComplete\":null,\"fieldListJson\":\"\",\"showBack\":false,\"taskListenerList\":[],\"fieldList\":[],\"index\":0}}',0,'','2024-08-06 15:17:53'),(1820721032468041730,'流程实例管理',3,'com.ruoyi.workflow.controller.ActProcessInstanceController.deleteRuntimeProcessAndHisInst()','DELETE',1,'admin','研发部门','/workflow/processInstance/deleteRuntimeProcessAndHisInst/1820720634709610498','127.0.0.1','内网IP','{}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-08-06 15:18:16'),(1820721118526771201,'流程节点人员设置管理',1,'com.ruoyi.workflow.controller.ActNodeAssigneeController.add()','POST',1,'admin','研发部门','/workflow/actNodeAssignee','127.0.0.1','内网IP','{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"1820720870416912385\",\"processDefinitionId\":\"leave1:1:1820662237058514946\",\"chooseWay\":\"person\",\"nodeId\":\"Activity_14633hx\",\"nodeName\":\"申请人\",\"assignee\":null,\"assigneeId\":null,\"businessRuleId\":null,\"isShow\":false,\"multiple\":false,\"multipleColumn\":\"\",\"isBack\":false,\"isDelegate\":false,\"isTransmit\":false,\"isCopy\":false,\"addMultiInstance\":false,\"deleteMultiInstance\":false,\"taskListener\":\"\",\"autoComplete\":null,\"fieldListJson\":\"\",\"showBack\":false,\"taskListenerList\":[],\"fieldList\":[],\"index\":0}','{\"code\":200,\"msg\":\"操作成功\",\"data\":{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"1820720870416912385\",\"processDefinitionId\":\"leave1:1:1820662237058514946\",\"chooseWay\":\"person\",\"nodeId\":\"Activity_14633hx\",\"nodeName\":\"申请人\",\"assignee\":null,\"assigneeId\":null,\"businessRuleId\":null,\"isShow\":false,\"multiple\":false,\"multipleColumn\":\"\",\"isBack\":false,\"isDelegate\":false,\"isTransmit\":false,\"isCopy\":false,\"addMultiInstance\":false,\"deleteMultiInstance\":false,\"taskListener\":\"\",\"autoComplete\":null,\"fieldListJson\":\"\",\"showBack\":false,\"taskListenerList\":[],\"fieldList\":[],\"index\":0}}',0,'','2024-08-06 15:18:37'),(1820721420093034498,'流程定义设置',1,'com.ruoyi.workflow.controller.ActProcessDefSettingController.add()','POST',1,'admin','研发部门','/workflow/processDefSetting','127.0.0.1','内网IP','{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"1820720401535668226\",\"processDefinitionId\":\"leave1:1:1820662237058514946\",\"processDefinitionKey\":\"leave1\",\"processDefinitionName\":\"请假流程（普通流程）\",\"tableName\":\"bs_leave\",\"componentName\":\"leave\",\"remark\":null,\"settingIds\":null,\"defaultProcess\":false,\"taskListener\":\"\",\"taskListenerList\":[]}','{\"code\":200,\"msg\":\"操作成功\",\"data\":{\"id\":\"1820720401535668226\",\"processDefinitionId\":\"leave1:1:1820662237058514946\",\"processDefinitionKey\":\"leave1\",\"tableName\":\"bs_leave\",\"processDefinitionName\":\"请假流程（普通流程）\",\"componentName\":\"leave\",\"remark\":null,\"defaultProcess\":false,\"taskListener\":\"\",\"taskListenerList\":[]}}',0,'','2024-08-06 15:19:49'),(1820721458445750273,'请假业务',2,'com.ruoyi.demo.controller.BsLeaveController.edit()','PUT',1,'admin','研发部门','/demo/leave','127.0.0.1','内网IP','{\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 15:16:41\",\"id\":\"1820702696808058882\",\"username\":\"admin\",\"duration\":\"2.50\",\"principal\":\"admin\",\"contactPhone\":\"111111111111\",\"leaveType\":3,\"title\":\"请年假\",\"leaveReason\":\"休息\",\"startDate\":\"2024-08-07 00:00:00\",\"endDate\":\"2024-08-09 00:00:00\",\"actNodeAssignee\":null}','{\"code\":200,\"msg\":\"操作成功\",\"data\":{\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 15:19:57\",\"id\":\"1820702696808058882\",\"username\":\"admin\",\"duration\":\"2.50\",\"principal\":\"admin\",\"contactPhone\":\"111111111111\",\"leaveType\":3,\"title\":\"请年假\",\"leaveReason\":\"休息\",\"startDate\":\"2024-08-07 00:00:00\",\"endDate\":\"2024-08-09 00:00:00\"}}',0,'','2024-08-06 15:19:58'),(1820721460874252289,'流程实例管理',1,'com.ruoyi.workflow.controller.ActProcessInstanceController.startWorkFlow()','POST',1,'admin','研发部门','/workflow/processInstance/startWorkFlow','127.0.0.1','内网IP','{\"businessKey\":\"1820702696808058882\",\"processKey\":\"leave1\",\"assignees\":null,\"tableName\":\"bs_leave\",\"variables\":{\"entity\":{\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 15:19:57\",\"id\":\"1820702696808058882\",\"username\":\"admin\",\"duration\":\"2.50\",\"principal\":\"admin\",\"contactPhone\":\"111111111111\",\"leaveType\":3,\"title\":\"请年假\",\"leaveReason\":\"休息\",\"startDate\":\"2024-08-07 00:00:00\",\"endDate\":\"2024-08-09 00:00:00\"},\"userId\":\"1\",\"_FLOWABLE_SKIP_EXPRESSION_ENABLED\":true}}','{\"code\":200,\"msg\":\"提交成功\",\"data\":{\"processInstanceId\":\"1820721459888590850\",\"taskId\":\"1820721459888590861\"}}',0,'','2024-08-06 15:19:58'),(1820721491740135426,'任务管理',1,'com.ruoyi.workflow.controller.ActTaskController.completeTask()','POST',1,'admin','研发部门','/workflow/task/completeTask','127.0.0.1','内网IP','{\"taskId\":\"1820721459888590861\",\"isCopy\":false,\"fileId\":null,\"assigneeIds\":null,\"assigneeNames\":null,\"message\":\"提交单据\",\"sendMessage\":{\"title\":\"\",\"type\":[\"1\"],\"messageContent\":\"\"},\"defaultProcess\":true,\"processNodeList\":[{\"nodeId\":\"Activity_14633hx\",\"nodeName\":\"申请人\",\"nodeType\":null,\"sourceFlowNodeType\":null,\"taskId\":null,\"expression\":null,\"expressionStr\":null,\"chooseWay\":\"person\",\"assignee\":\"疯狂的狮子Li\",\"assigneeId\":\"1\",\"businessRuleId\":null,\"isShow\":false,\"multiple\":false,\"multipleColumn\":\"\",\"sourceFlowElementId\":null,\"x\":null,\"first\":false,\"transactor\":\"疯狂的狮子Li\",\"transactorId\":\"1\",\"disabled\":false},{\"nodeId\":\"Activity_0lym9dc\",\"nodeName\":\"组长\",\"nodeType\":null,\"sourceFlowNodeType\":null,\"taskId\":null,\"expression\":null,\"expressionStr\":null,\"chooseWay\":\"person\",\"assignee\":\"疯狂的狮子Li\",\"assigneeId\":\"1\",\"businessRuleId\":null,\"isShow\":false,\"multiple\":false,\"multipleColumn\":\"\",\"sourceFlowElementId\":null,\"x\":null,\"first\":false,\"transactor\":\"疯狂的狮子Li\",\"transactorId\":\"1\",\"disabled\":false},{\"nodeId\":\"Activity_1j25s1c\",\"nodeName\":\"部门领导\",\"nodeType\":null,\"sourceFlowNodeType\":null,\"taskId\":null,\"expression\":null,\"expressionStr\":null,\"chooseWay\":\"person\",\"assignee\":\"疯狂的狮子Li\",\"assigneeId\":\"1\",\"businessRuleId\":null,\"isShow\":false,\"multiple\":false,\"multipleColumn\":\"\",\"sourceFlowElementId\":null,\"x\":null,\"first\":false,\"transactor\":\"疯狂的狮子Li\",\"transactorId\":\"1\",\"disabled\":false}],\"assigneeMap\":{},\"variables\":{\"entity\":{\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 15:19:57\",\"id\":\"1820702696808058882\",\"username\":\"admin\",\"duration\":\"2.50\",\"principal\":\"admin\",\"contactPhone\":\"111111111111\",\"leaveType\":3,\"title\":\"请年假\",\"leaveReason\":\"休息\",\"startDate\":\"2024-08-07 00:00:00\",\"endDate\":\"2024-08-09 00:00:00\"},\"userId\":\"1\"}}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-08-06 15:20:06'),(1820724024009232386,'字典类型',2,'com.ruoyi.web.controller.system.SysDictTypeController.edit()','PUT',1,'admin','研发部门','/system/dict/type','127.0.0.1','内网IP','{\"createBy\":\"1\",\"createTime\":\"2024-08-06 09:35:27\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 15:30:09\",\"dictId\":13,\"dictName\":\"业务状态\",\"dictType\":\"act_status\",\"status\":\"0\",\"remark\":\"业务状态列表\"}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-08-06 15:30:09'),(1820724845182652418,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2024-08-05 19:19:51\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 15:33:25\",\"parentName\":null,\"parentId\":0,\"children\":[],\"menuId\":4,\"menuName\":\"PLUS官网\",\"orderNum\":16,\"path\":\"https://gitee.com/dromara/RuoYi-Vue-Plus\",\"component\":null,\"queryParam\":\"\",\"isFrame\":\"0\",\"isCache\":\"0\",\"menuType\":\"M\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"\",\"icon\":\"guide\",\"remark\":\"RuoYi-Vue-Plus官网地址\"}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-08-06 15:33:25'),(1820724944835121154,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2024-08-05 19:20:41\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 15:33:48\",\"parentName\":null,\"parentId\":5,\"children\":[],\"menuId\":1500,\"menuName\":\"测试单表\",\"orderNum\":1,\"path\":\"demo\",\"component\":\"demo/demo/index\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"demo:demo:list\",\"icon\":\"example\",\"remark\":\"测试单表菜单\"}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-08-06 15:33:49'),(1820724975218659330,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2024-08-05 19:20:41\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-06 15:33:56\",\"parentName\":null,\"parentId\":5,\"children\":[],\"menuId\":1506,\"menuName\":\"测试树表\",\"orderNum\":1,\"path\":\"tree\",\"component\":\"demo/tree/index\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"demo:tree:list\",\"icon\":\"example\",\"remark\":\"测试树表菜单\"}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-08-06 15:33:56');
/*!40000 ALTER TABLE `sys_oper_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_oss`
--

DROP TABLE IF EXISTS `sys_oss`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_oss` (
  `oss_id` bigint NOT NULL COMMENT '对象存储主键',
  `file_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '文件名',
  `original_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '原名',
  `file_suffix` varchar(10) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '文件后缀名',
  `url` varchar(500) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'URL地址',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '上传人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新人',
  `service` varchar(20) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'minio' COMMENT '服务商',
  PRIMARY KEY (`oss_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='OSS对象存储表';
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
  `oss_config_id` bigint NOT NULL COMMENT '主建',
  `config_key` varchar(20) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '配置key',
  `access_key` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'accessKey',
  `secret_key` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '秘钥',
  `bucket_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '桶名称',
  `prefix` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '前缀',
  `endpoint` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '访问站点',
  `domain` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '自定义域名',
  `is_https` char(1) COLLATE utf8mb4_general_ci DEFAULT 'N' COMMENT '是否https（Y=是,N=否）',
  `region` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '域',
  `access_policy` char(1) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1' COMMENT '桶权限类型(0=private 1=public 2=custom)',
  `status` char(1) COLLATE utf8mb4_general_ci DEFAULT '1' COMMENT '是否默认（0=是,1=否）',
  `ext1` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '扩展字段',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`oss_config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='对象存储配置表';
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
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  `post_code` varchar(64) COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='岗位信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_post`
--

LOCK TABLES `sys_post` WRITE;
/*!40000 ALTER TABLE `sys_post` DISABLE KEYS */;
INSERT INTO `sys_post` VALUES (1,'ceo','董事长',1,'0','admin','2024-08-05 19:19:50','',NULL,''),(2,'se','项目经理',2,'0','admin','2024-08-05 19:19:50','',NULL,''),(3,'hr','人力资源',3,'0','admin','2024-08-05 19:19:50','',NULL,''),(4,'user','普通员工',4,'0','admin','2024-08-05 19:19:50','',NULL,'');
/*!40000 ALTER TABLE `sys_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `role_name` varchar(30) COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) COLLATE utf8mb4_general_ci DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示',
  `status` char(1) COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='角色信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,'超级管理员','admin',1,'1',1,1,'0','0','admin','2024-08-05 19:19:51','',NULL,'超级管理员'),(2,'普通角色','common',2,'2',1,1,'0','0','admin','2024-08-05 19:19:51','',NULL,'普通角色'),(3,'本部门及以下','test1',3,'4',1,1,'0','0','admin','2024-08-05 19:20:42','admin',NULL,NULL),(4,'仅本人','test2',4,'5',1,1,'0','0','admin','2024-08-05 19:20:42','admin',NULL,NULL);
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_dept`
--

DROP TABLE IF EXISTS `sys_role_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='角色和部门关联表';
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
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='角色和菜单关联表';
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
  `uuid` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '第三方系统的唯一ID',
  `source` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '第三方用户来源',
  `access_token` varchar(1000) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户的授权令牌',
  `expire_in` bigint DEFAULT NULL COMMENT '第三方用户的授权令牌的有效期',
  `refresh_token` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '刷新令牌',
  `open_id` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '第三方用户的 open id',
  `uid` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '第三方用户的 ID',
  `access_code` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '个别平台的授权信息',
  `union_id` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '第三方用户的 union id',
  `scope` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '第三方用户授予的权限',
  `token_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '个别平台的授权信息',
  `id_token` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'id token',
  `mac_algorithm` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '小米平台用户的附带属性',
  `mac_key` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '小米平台用户的附带属性',
  `code` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户的授权code',
  `oauth_token` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Twitter平台用户的附带属性',
  `oauth_token_secret` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Twitter平台用户的附带属性',
  `sys_user_id` bigint DEFAULT NULL COMMENT '系统用户id',
  `del_flag` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除标志（0代表存在 2代表删除）',
  `username` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户名',
  `nickname` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户昵称',
  `avatar` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户头像',
  `blog` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户网址',
  `company` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '所在公司',
  `location` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '位置',
  `email` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户邮箱',
  `remark` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户备注（各平台中的用户个人介绍）',
  `gender` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '性别',
  `create_by` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
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
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(10) COLLATE utf8mb4_general_ci DEFAULT 'sys_user' COMMENT '用户类型（sys_user系统用户）',
  `email` varchar(50) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '手机号码',
  `sex` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '密码',
  `status` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,103,'admin','疯狂的狮子Li','sys_user','crazyLionLi@163.com','15888888888','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2024-08-06 15:34:06','admin','2024-08-05 19:19:49','admin','2024-08-06 15:34:06','管理员'),(2,105,'lionli','疯狂的狮子Li','sys_user','crazyLionLi@qq.com','15666666666','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2024-08-05 19:19:49','admin','2024-08-05 19:19:49','',NULL,'测试员'),(3,108,'test','本部门及以下 密码666666','sys_user','','','0','','$2a$10$b8yUzN0C71sbz.PhNOCgJe.Tu1yWC3RNrTyjSQ8p1W0.aaUXUJ.Ne','0','0','127.0.0.1','2024-08-05 19:20:41','admin','2024-08-05 19:20:41','test','2024-08-05 19:20:41',NULL),(4,102,'test1','仅本人 密码666666','sys_user','','','0','','$2a$10$b8yUzN0C71sbz.PhNOCgJe.Tu1yWC3RNrTyjSQ8p1W0.aaUXUJ.Ne','0','0','127.0.0.1','2024-08-05 19:20:41','admin','2024-08-05 19:20:41','test1','2024-08-05 19:20:41',NULL);
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_post`
--

DROP TABLE IF EXISTS `sys_user_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_post` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户与岗位关联表';
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
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户和角色关联表';
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
  `id` bigint NOT NULL COMMENT '主键',
  `dept_id` bigint DEFAULT NULL COMMENT '部门id',
  `user_id` bigint DEFAULT NULL COMMENT '用户id',
  `order_num` int DEFAULT '0' COMMENT '排序号',
  `test_key` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'key键',
  `value` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '值',
  `version` int DEFAULT '0' COMMENT '版本',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  `del_flag` int DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='测试单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_demo`
--

LOCK TABLES `test_demo` WRITE;
/*!40000 ALTER TABLE `test_demo` DISABLE KEYS */;
INSERT INTO `test_demo` VALUES (1,102,4,1,'测试数据权限','测试',0,'2024-08-05 19:20:50','admin',NULL,NULL,0),(2,102,3,2,'子节点1','111',0,'2024-08-05 19:20:50','admin',NULL,NULL,0),(3,102,3,3,'子节点2','222',0,'2024-08-05 19:20:50','admin',NULL,NULL,0),(4,108,4,4,'测试数据','demo',0,'2024-08-05 19:20:51','admin',NULL,NULL,0),(5,108,3,13,'子节点11','1111',0,'2024-08-05 19:20:51','admin',NULL,NULL,0),(6,108,3,12,'子节点22','2222',0,'2024-08-05 19:20:51','admin',NULL,NULL,0),(7,108,3,11,'子节点33','3333',0,'2024-08-05 19:20:51','admin',NULL,NULL,0),(8,108,3,10,'子节点44','4444',0,'2024-08-05 19:20:51','admin',NULL,NULL,0),(9,108,3,9,'子节点55','5555',0,'2024-08-05 19:20:51','admin',NULL,NULL,0),(10,108,3,8,'子节点66','6666',0,'2024-08-05 19:20:51','admin',NULL,NULL,0),(11,108,3,7,'子节点77','7777',0,'2024-08-05 19:20:52','admin',NULL,NULL,0),(12,108,3,6,'子节点88','8888',0,'2024-08-05 19:20:52','admin',NULL,NULL,0),(13,108,3,5,'子节点99','9999',0,'2024-08-05 19:20:52','admin',NULL,NULL,0);
/*!40000 ALTER TABLE `test_demo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_tree`
--

DROP TABLE IF EXISTS `test_tree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test_tree` (
  `id` bigint NOT NULL COMMENT '主键',
  `parent_id` bigint DEFAULT '0' COMMENT '父id',
  `dept_id` bigint DEFAULT NULL COMMENT '部门id',
  `user_id` bigint DEFAULT NULL COMMENT '用户id',
  `tree_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '值',
  `version` int DEFAULT '0' COMMENT '版本',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  `del_flag` int DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='测试树表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_tree`
--

LOCK TABLES `test_tree` WRITE;
/*!40000 ALTER TABLE `test_tree` DISABLE KEYS */;
INSERT INTO `test_tree` VALUES (1,0,102,4,'测试数据权限',0,'2024-08-05 19:20:52','admin',NULL,NULL,0),(2,1,102,3,'子节点1',0,'2024-08-05 19:20:52','admin',NULL,NULL,0),(3,2,102,3,'子节点2',0,'2024-08-05 19:20:52','admin',NULL,NULL,0),(4,0,108,4,'测试树1',0,'2024-08-05 19:20:52','admin',NULL,NULL,0),(5,4,108,3,'子节点11',0,'2024-08-05 19:20:52','admin',NULL,NULL,0),(6,4,108,3,'子节点22',0,'2024-08-05 19:20:53','admin',NULL,NULL,0),(7,4,108,3,'子节点33',0,'2024-08-05 19:20:53','admin',NULL,NULL,0),(8,5,108,3,'子节点44',0,'2024-08-05 19:20:53','admin',NULL,NULL,0),(9,6,108,3,'子节点55',0,'2024-08-05 19:20:53','admin',NULL,NULL,0),(10,7,108,3,'子节点66',0,'2024-08-05 19:20:53','admin',NULL,NULL,0),(11,7,108,3,'子节点77',0,'2024-08-05 19:20:53','admin',NULL,NULL,0),(12,10,108,3,'子节点88',0,'2024-08-05 19:20:53','admin',NULL,NULL,0),(13,10,108,3,'子节点99',0,'2024-08-05 19:20:53','admin',NULL,NULL,0);
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
  `app_name` varchar(64) NOT NULL COMMENT '执行器AppName',
  `title` varchar(12) NOT NULL COMMENT '执行器名称',
  `address_type` tinyint NOT NULL DEFAULT '0' COMMENT '执行器地址类型：0=自动注册、1=手动录入',
  `address_list` text COMMENT '执行器地址列表，多地址逗号分隔',
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xxl_job_group`
--

LOCK TABLES `xxl_job_group` WRITE;
/*!40000 ALTER TABLE `xxl_job_group` DISABLE KEYS */;
INSERT INTO `xxl_job_group` VALUES (1,'xxl-job-executor','示例执行器',0,NULL,'2024-08-06 15:39:39');
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
  `job_group` int NOT NULL COMMENT '执行器主键ID',
  `job_desc` varchar(255) NOT NULL,
  `add_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `author` varchar(64) DEFAULT NULL COMMENT '作者',
  `alarm_email` varchar(255) DEFAULT NULL COMMENT '报警邮件',
  `schedule_type` varchar(50) NOT NULL DEFAULT 'NONE' COMMENT '调度类型',
  `schedule_conf` varchar(128) DEFAULT NULL COMMENT '调度配置，值含义取决于调度类型',
  `misfire_strategy` varchar(50) NOT NULL DEFAULT 'DO_NOTHING' COMMENT '调度过期策略',
  `executor_route_strategy` varchar(50) DEFAULT NULL COMMENT '执行器路由策略',
  `executor_handler` varchar(255) DEFAULT NULL COMMENT '执行器任务handler',
  `executor_param` varchar(512) DEFAULT NULL COMMENT '执行器任务参数',
  `executor_block_strategy` varchar(50) DEFAULT NULL COMMENT '阻塞处理策略',
  `executor_timeout` int NOT NULL DEFAULT '0' COMMENT '任务执行超时时间，单位秒',
  `executor_fail_retry_count` int NOT NULL DEFAULT '0' COMMENT '失败重试次数',
  `glue_type` varchar(50) NOT NULL COMMENT 'GLUE类型',
  `glue_source` mediumtext COMMENT 'GLUE源代码',
  `glue_remark` varchar(128) DEFAULT NULL COMMENT 'GLUE备注',
  `glue_updatetime` datetime DEFAULT NULL COMMENT 'GLUE更新时间',
  `child_jobid` varchar(255) DEFAULT NULL COMMENT '子任务ID，多个逗号分隔',
  `trigger_status` tinyint NOT NULL DEFAULT '0' COMMENT '调度状态：0-停止，1-运行',
  `trigger_last_time` bigint NOT NULL DEFAULT '0' COMMENT '上次调度时间',
  `trigger_next_time` bigint NOT NULL DEFAULT '0' COMMENT '下次调度时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xxl_job_info`
--

LOCK TABLES `xxl_job_info` WRITE;
/*!40000 ALTER TABLE `xxl_job_info` DISABLE KEYS */;
INSERT INTO `xxl_job_info` VALUES (1,1,'测试任务1','2018-11-03 22:21:31','2018-11-03 22:21:31','XXL','','CRON','0 0 0 * * ? *','DO_NOTHING','FIRST','demoJobHandler','','SERIAL_EXECUTION',0,0,'BEAN','','GLUE代码初始化','2018-11-03 22:21:31','',0,0,0);
/*!40000 ALTER TABLE `xxl_job_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xxl_job_lock`
--

DROP TABLE IF EXISTS `xxl_job_lock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `xxl_job_lock` (
  `lock_name` varchar(50) NOT NULL COMMENT '锁名称',
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
  `job_group` int NOT NULL COMMENT '执行器主键ID',
  `job_id` int NOT NULL COMMENT '任务，主键ID',
  `executor_address` varchar(255) DEFAULT NULL COMMENT '执行器地址，本次执行的地址',
  `executor_handler` varchar(255) DEFAULT NULL COMMENT '执行器任务handler',
  `executor_param` varchar(512) DEFAULT NULL COMMENT '执行器任务参数',
  `executor_sharding_param` varchar(20) DEFAULT NULL COMMENT '执行器任务分片参数，格式如 1/2',
  `executor_fail_retry_count` int NOT NULL DEFAULT '0' COMMENT '失败重试次数',
  `trigger_time` datetime DEFAULT NULL COMMENT '调度-时间',
  `trigger_code` int NOT NULL COMMENT '调度-结果',
  `trigger_msg` text COMMENT '调度-日志',
  `handle_time` datetime DEFAULT NULL COMMENT '执行-时间',
  `handle_code` int NOT NULL COMMENT '执行-状态',
  `handle_msg` text COMMENT '执行-日志',
  `alarm_status` tinyint NOT NULL DEFAULT '0' COMMENT '告警状态：0-默认、1-无需告警、2-告警成功、3-告警失败',
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
  `trigger_day` datetime DEFAULT NULL COMMENT '调度-时间',
  `running_count` int NOT NULL DEFAULT '0' COMMENT '运行中-日志数量',
  `suc_count` int NOT NULL DEFAULT '0' COMMENT '执行成功-日志数量',
  `fail_count` int NOT NULL DEFAULT '0' COMMENT '执行失败-日志数量',
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
  `job_id` int NOT NULL COMMENT '任务，主键ID',
  `glue_type` varchar(50) DEFAULT NULL COMMENT 'GLUE类型',
  `glue_source` mediumtext COMMENT 'GLUE源代码',
  `glue_remark` varchar(128) NOT NULL COMMENT 'GLUE备注',
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
  `username` varchar(50) NOT NULL COMMENT '账号',
  `password` varchar(50) NOT NULL COMMENT '密码',
  `role` tinyint NOT NULL COMMENT '角色：0-普通用户、1-管理员',
  `permission` varchar(255) DEFAULT NULL COMMENT '权限：执行器ID列表，多个逗号分割',
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
