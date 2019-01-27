-- MySQL dump 10.13  Distrib 5.7.21, for Linux (x86_64)
--
-- Host: localhost    Database: bootdo
-- ------------------------------------------------------
-- Server version	5.7.21-1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `oa_notify`
--

DROP TABLE IF EXISTS `oa_notify`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_notify` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `type` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '类型',
  `title` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '标题',
  `content` varchar(2000) COLLATE utf8_bin DEFAULT NULL COMMENT '内容',
  `files` varchar(2000) COLLATE utf8_bin DEFAULT NULL COMMENT '附件',
  `status` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '状态',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `oa_notify_del_flag` (`del_flag`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='通知通告';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_notify`
--

LOCK TABLES `oa_notify` WRITE;
/*!40000 ALTER TABLE `oa_notify` DISABLE KEYS */;
INSERT INTO `oa_notify` VALUES (41,'3','十九大召开了','十九大召开了，竟然没邀请我','','1',1,NULL,NULL,'2017-10-10 17:21:11','',NULL),(42,'3','苹果发布新手机了','有全面屏的iphoneX','','1',1,NULL,NULL,'2017-10-10 18:51:14','',NULL),(43,'3','十九大要消灭贫困人口','我还只有两三年的活头了','','1',1,NULL,NULL,'2017-10-11 09:56:35','',NULL),(44,'3','骑士又输了','捉急','','1',1,NULL,NULL,'2017-10-26 13:59:34','',NULL),(45,'3','火箭5连败','没有保罗不行呀','','1',1,NULL,NULL,'2017-12-30 12:10:20','',NULL);
/*!40000 ALTER TABLE `oa_notify` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_notify_record`
--

DROP TABLE IF EXISTS `oa_notify_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_notify_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `notify_id` bigint(20) DEFAULT NULL COMMENT '通知通告ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '接受人',
  `is_read` tinyint(1) DEFAULT '0' COMMENT '阅读标记',
  `read_date` date DEFAULT NULL COMMENT '阅读时间',
  PRIMARY KEY (`id`),
  KEY `oa_notify_record_notify_id` (`notify_id`),
  KEY `oa_notify_record_user_id` (`user_id`),
  KEY `oa_notify_record_read_flag` (`is_read`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='通知通告发送记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_notify_record`
--

LOCK TABLES `oa_notify_record` WRITE;
/*!40000 ALTER TABLE `oa_notify_record` DISABLE KEYS */;
INSERT INTO `oa_notify_record` VALUES (18,41,1,1,'2019-01-12'),(19,42,1,1,'2017-10-26'),(20,43,136,0,NULL),(21,43,133,0,NULL),(22,43,130,0,NULL),(23,43,1,1,'2017-10-26'),(24,44,1,1,'2019-01-12'),(25,45,1,1,'2019-01-20'),(26,45,135,0,NULL);
/*!40000 ALTER TABLE `oa_notify_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dept`
--

DROP TABLE IF EXISTS `sys_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '上级部门ID，一级部门为0',
  `name` varchar(50) DEFAULT NULL COMMENT '部门名称',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  `del_flag` tinyint(4) DEFAULT '0' COMMENT '是否删除  -1：已删除  0：正常',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='部门管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dept`
--

LOCK TABLES `sys_dept` WRITE;
/*!40000 ALTER TABLE `sys_dept` DISABLE KEYS */;
INSERT INTO `sys_dept` VALUES (6,0,'研发部',1,1),(7,6,'研發一部',1,1),(8,6,'研发二部',2,1),(9,0,'销售部',2,1),(10,9,'销售一部',1,1),(11,0,'产品部',3,1),(12,11,'产品一部',1,1),(13,0,'测试部',5,1),(14,13,'测试一部',1,1),(15,13,'测试二部',2,1);
/*!40000 ALTER TABLE `sys_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict`
--

DROP TABLE IF EXISTS `sys_dict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_dict` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '标签名',
  `value` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '数据值',
  `type` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '类型',
  `description` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '描述',
  `sort` decimal(10,0) DEFAULT NULL COMMENT '排序（升序）',
  `parent_id` bigint(64) DEFAULT '0' COMMENT '父级编号',
  `create_by` int(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_dict_value` (`value`),
  KEY `sys_dict_label` (`name`),
  KEY `sys_dict_del_flag` (`del_flag`)
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='字典表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict`
--

LOCK TABLES `sys_dict` WRITE;
/*!40000 ALTER TABLE `sys_dict` DISABLE KEYS */;
INSERT INTO `sys_dict` VALUES (1,'正常','0','del_flag','删除标记',10,0,1,NULL,1,NULL,NULL,'0'),(3,'显示','1','show_hide','显示/隐藏',10,0,1,NULL,1,NULL,NULL,'0'),(4,'隐藏','0','show_hide','显示/隐藏',20,0,1,NULL,1,NULL,NULL,'0'),(5,'是','1','yes_no','是/否',10,0,1,NULL,1,NULL,NULL,'0'),(6,'否','0','yes_no','是/否',20,0,1,NULL,1,NULL,NULL,'0'),(7,'红色','red','color','颜色值',10,0,1,NULL,1,NULL,NULL,'0'),(8,'绿色','green','color','颜色值',20,0,1,NULL,1,NULL,NULL,'0'),(9,'蓝色','blue','color','颜色值',30,0,1,NULL,1,NULL,NULL,'0'),(10,'黄色','yellow','color','颜色值',40,0,1,NULL,1,NULL,NULL,'0'),(11,'橙色','orange','color','颜色值',50,0,1,NULL,1,NULL,NULL,'0'),(12,'默认主题','default','theme','主题方案',10,0,1,NULL,1,NULL,NULL,'0'),(13,'天蓝主题','cerulean','theme','主题方案',20,0,1,NULL,1,NULL,NULL,'0'),(14,'橙色主题','readable','theme','主题方案',30,0,1,NULL,1,NULL,NULL,'0'),(15,'红色主题','united','theme','主题方案',40,0,1,NULL,1,NULL,NULL,'0'),(16,'Flat主题','flat','theme','主题方案',60,0,1,NULL,1,NULL,NULL,'0'),(17,'国家','1','sys_area_type','区域类型',10,0,1,NULL,1,NULL,NULL,'0'),(18,'省份、直辖市','2','sys_area_type','区域类型',20,0,1,NULL,1,NULL,NULL,'0'),(19,'地市','3','sys_area_type','区域类型',30,0,1,NULL,1,NULL,NULL,'0'),(20,'区县','4','sys_area_type','区域类型',40,0,1,NULL,1,NULL,NULL,'0'),(21,'公司','1','sys_office_type','机构类型',60,0,1,NULL,1,NULL,NULL,'0'),(22,'部门','2','sys_office_type','机构类型',70,0,1,NULL,1,NULL,NULL,'0'),(23,'小组','3','sys_office_type','机构类型',80,0,1,NULL,1,NULL,NULL,'0'),(24,'其它','4','sys_office_type','机构类型',90,0,1,NULL,1,NULL,NULL,'0'),(25,'综合部','1','sys_office_common','快捷通用部门',30,0,1,NULL,1,NULL,NULL,'0'),(26,'开发部','2','sys_office_common','快捷通用部门',40,0,1,NULL,1,NULL,NULL,'0'),(27,'人力部','3','sys_office_common','快捷通用部门',50,0,1,NULL,1,NULL,NULL,'0'),(28,'一级','1','sys_office_grade','机构等级',10,0,1,NULL,1,NULL,NULL,'0'),(29,'二级','2','sys_office_grade','机构等级',20,0,1,NULL,1,NULL,NULL,'0'),(30,'三级','3','sys_office_grade','机构等级',30,0,1,NULL,1,NULL,NULL,'0'),(31,'四级','4','sys_office_grade','机构等级',40,0,1,NULL,1,NULL,NULL,'0'),(32,'所有数据','1','sys_data_scope','数据范围',10,0,1,NULL,1,NULL,NULL,'0'),(33,'所在公司及以下数据','2','sys_data_scope','数据范围',20,0,1,NULL,1,NULL,NULL,'0'),(34,'所在公司数据','3','sys_data_scope','数据范围',30,0,1,NULL,1,NULL,NULL,'0'),(35,'所在部门及以下数据','4','sys_data_scope','数据范围',40,0,1,NULL,1,NULL,NULL,'0'),(36,'所在部门数据','5','sys_data_scope','数据范围',50,0,1,NULL,1,NULL,NULL,'0'),(37,'仅本人数据','8','sys_data_scope','数据范围',90,0,1,NULL,1,NULL,NULL,'0'),(38,'按明细设置','9','sys_data_scope','数据范围',100,0,1,NULL,1,NULL,NULL,'0'),(39,'系统管理','1','sys_user_type','用户类型',10,0,1,NULL,1,NULL,NULL,'0'),(40,'部门经理','2','sys_user_type','用户类型',20,0,1,NULL,1,NULL,NULL,'0'),(41,'普通用户','3','sys_user_type','用户类型',30,0,1,NULL,1,NULL,NULL,'0'),(67,'接入日志','1','sys_log_type','日志类型',30,0,1,NULL,1,NULL,NULL,'0'),(68,'异常日志','2','sys_log_type','日志类型',40,0,1,NULL,1,NULL,NULL,'0'),(69,'请假流程','leave','act_type','流程类型',10,0,1,NULL,1,NULL,NULL,'0'),(70,'审批测试流程','test_audit','act_type','流程类型',20,0,1,NULL,1,NULL,NULL,'0'),(73,'增删改查','crud','gen_category','代码生成分类',10,0,1,NULL,1,NULL,NULL,'1'),(74,'增删改查（包含从表）','crud_many','gen_category','代码生成分类',20,0,1,NULL,1,NULL,NULL,'1'),(75,'树结构','tree','gen_category','代码生成分类',30,0,1,NULL,1,NULL,NULL,'1'),(76,'=','=','gen_query_type','查询方式',10,0,1,NULL,1,NULL,NULL,'1'),(77,'!=','!=','gen_query_type','查询方式',20,0,1,NULL,1,NULL,NULL,'1'),(78,'&gt;','&gt;','gen_query_type','查询方式',30,0,1,NULL,1,NULL,NULL,'1'),(79,'&lt;','&lt;','gen_query_type','查询方式',40,0,1,NULL,1,NULL,NULL,'1'),(80,'Between','between','gen_query_type','查询方式',50,0,1,NULL,1,NULL,NULL,'1'),(81,'Like','like','gen_query_type','查询方式',60,0,1,NULL,1,NULL,NULL,'1'),(82,'Left Like','left_like','gen_query_type','查询方式',70,0,1,NULL,1,NULL,NULL,'1'),(83,'Right Like','right_like','gen_query_type','查询方式',80,0,1,NULL,1,NULL,NULL,'1'),(84,'文本框','input','gen_show_type','字段生成方案',10,0,1,NULL,1,NULL,NULL,'1'),(85,'文本域','textarea','gen_show_type','字段生成方案',20,0,1,NULL,1,NULL,NULL,'1'),(86,'下拉框','select','gen_show_type','字段生成方案',30,0,1,NULL,1,NULL,NULL,'1'),(87,'复选框','checkbox','gen_show_type','字段生成方案',40,0,1,NULL,1,NULL,NULL,'1'),(88,'单选框','radiobox','gen_show_type','字段生成方案',50,0,1,NULL,1,NULL,NULL,'1'),(89,'日期选择','dateselect','gen_show_type','字段生成方案',60,0,1,NULL,1,NULL,NULL,'1'),(90,'人员选择','userselect','gen_show_type','字段生成方案',70,0,1,NULL,1,NULL,NULL,'1'),(91,'部门选择','officeselect','gen_show_type','字段生成方案',80,0,1,NULL,1,NULL,NULL,'1'),(92,'区域选择','areaselect','gen_show_type','字段生成方案',90,0,1,NULL,1,NULL,NULL,'1'),(93,'String','String','gen_java_type','Java类型',10,0,1,NULL,1,NULL,NULL,'1'),(94,'Long','Long','gen_java_type','Java类型',20,0,1,NULL,1,NULL,NULL,'1'),(95,'仅持久层','dao','gen_category','代码生成分类',40,0,1,NULL,1,NULL,NULL,'1'),(96,'男','1','sex','性别',10,0,1,NULL,1,NULL,NULL,'0'),(97,'女','2','sex','性别',20,0,1,NULL,1,NULL,NULL,'0'),(98,'Integer','Integer','gen_java_type','Java类型',30,0,1,NULL,1,NULL,NULL,'1'),(99,'Double','Double','gen_java_type','Java类型',40,0,1,NULL,1,NULL,NULL,'1'),(100,'Date','java.util.Date','gen_java_type','Java类型',50,0,1,NULL,1,NULL,NULL,'1'),(104,'Custom','Custom','gen_java_type','Java类型',90,0,1,NULL,1,NULL,NULL,'1'),(105,'会议通告','1','oa_notify_type','通知通告类型',10,0,1,NULL,1,NULL,NULL,'0'),(106,'奖惩通告','2','oa_notify_type','通知通告类型',20,0,1,NULL,1,NULL,NULL,'0'),(107,'活动通告','3','oa_notify_type','通知通告类型',30,0,1,NULL,1,NULL,NULL,'0'),(108,'草稿','0','oa_notify_status','通知通告状态',10,0,1,NULL,1,NULL,NULL,'0'),(109,'发布','1','oa_notify_status','通知通告状态',20,0,1,NULL,1,NULL,NULL,'0'),(110,'未读','0','oa_notify_read','通知通告状态',10,0,1,NULL,1,NULL,NULL,'0'),(111,'已读','1','oa_notify_read','通知通告状态',20,0,1,NULL,1,NULL,NULL,'0'),(112,'草稿','0','oa_notify_status','通知通告状态',10,0,1,NULL,1,NULL,'','0'),(113,'删除','0','del_flag','删除标记',NULL,NULL,NULL,NULL,NULL,NULL,'',''),(121,'编码','code','hobby','爱好',NULL,NULL,NULL,NULL,NULL,NULL,'',''),(122,'绘画','painting','hobby','爱好',NULL,NULL,NULL,NULL,NULL,NULL,'','');
/*!40000 ALTER TABLE `sys_dict` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_file`
--

DROP TABLE IF EXISTS `sys_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_file` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL COMMENT '文件类型',
  `url` varchar(200) DEFAULT NULL COMMENT 'URL地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8 COMMENT='文件上传';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_file`
--

LOCK TABLES `sys_file` WRITE;
/*!40000 ALTER TABLE `sys_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_log`
--

DROP TABLE IF EXISTS `sys_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) DEFAULT NULL COMMENT '用户操作',
  `time` int(11) DEFAULT NULL COMMENT '响应时间',
  `method` varchar(200) DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) DEFAULT NULL COMMENT '请求参数',
  `ip` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=678 DEFAULT CHARSET=utf8 COMMENT='系统日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_log`
--

LOCK TABLES `sys_log` WRITE;
/*!40000 ALTER TABLE `sys_log` DISABLE KEYS */;
INSERT INTO `sys_log` VALUES (609,1,'admin','登录',58,'com.bootdo.system.controller.LoginController.ajaxLogin()',NULL,'127.0.0.1','2019-01-12 17:19:52'),(610,1,'admin','请求访问主页',71,'com.bootdo.system.controller.LoginController.index()',NULL,'127.0.0.1','2019-01-12 17:19:52'),(611,1,'admin','添加用户',15,'com.bootdo.system.controller.UserController.add()',NULL,'127.0.0.1','2019-01-12 17:20:26'),(612,1,'admin','编辑用户',16,'com.bootdo.system.controller.UserController.edit()',NULL,'127.0.0.1','2019-01-12 17:20:31'),(613,1,'admin','添加角色',0,'com.bootdo.system.controller.RoleController.add()',NULL,'127.0.0.1','2019-01-12 17:20:37'),(614,1,'admin','编辑角色',11,'com.bootdo.system.controller.RoleController.edit()',NULL,'127.0.0.1','2019-01-12 17:20:41'),(615,1,'admin','编辑角色',2,'com.bootdo.system.controller.RoleController.edit()',NULL,'127.0.0.1','2019-01-12 17:20:46'),(616,1,'admin','添加菜单',2,'com.bootdo.system.controller.MenuController.add()',NULL,'127.0.0.1','2019-01-12 17:20:53'),(617,1,'admin','编辑菜单',10,'com.bootdo.system.controller.MenuController.edit()',NULL,'127.0.0.1','2019-01-12 17:21:02'),(618,1,'admin','删除菜单',10,'com.bootdo.system.controller.MenuController.remove()',NULL,'127.0.0.1','2019-01-12 17:25:21'),(619,1,'admin','删除菜单',7,'com.bootdo.system.controller.MenuController.remove()',NULL,'127.0.0.1','2019-01-12 17:25:28'),(620,1,'admin','删除菜单',5,'com.bootdo.system.controller.MenuController.remove()',NULL,'127.0.0.1','2019-01-12 17:25:34'),(621,1,'admin','删除菜单',4,'com.bootdo.system.controller.MenuController.remove()',NULL,'127.0.0.1','2019-01-12 17:25:38'),(622,1,'admin','删除菜单',7,'com.bootdo.system.controller.MenuController.remove()',NULL,'127.0.0.1','2019-01-12 17:25:41'),(623,1,'admin','删除菜单',4,'com.bootdo.system.controller.MenuController.remove()',NULL,'127.0.0.1','2019-01-12 17:25:44'),(624,1,'admin','删除菜单',11,'com.bootdo.system.controller.MenuController.remove()',NULL,'127.0.0.1','2019-01-12 17:25:49'),(625,1,'admin','删除菜单',4,'com.bootdo.system.controller.MenuController.remove()',NULL,'127.0.0.1','2019-01-12 17:25:54'),(626,1,'admin','删除菜单',6,'com.bootdo.system.controller.MenuController.remove()',NULL,'127.0.0.1','2019-01-12 17:25:59'),(627,1,'admin','删除菜单',5,'com.bootdo.system.controller.MenuController.remove()',NULL,'127.0.0.1','2019-01-12 17:26:03'),(628,1,'admin','删除菜单',4,'com.bootdo.system.controller.MenuController.remove()',NULL,'127.0.0.1','2019-01-12 17:26:05'),(629,1,'admin','删除菜单',8,'com.bootdo.system.controller.MenuController.remove()',NULL,'127.0.0.1','2019-01-12 17:26:07'),(630,1,'admin','删除菜单',4,'com.bootdo.system.controller.MenuController.remove()',NULL,'127.0.0.1','2019-01-12 17:26:10'),(631,1,'admin','登录',4,'com.bootdo.system.controller.LoginController.ajaxLogin()',NULL,'127.0.0.1','2019-01-12 17:26:16'),(632,1,'admin','请求访问主页',11,'com.bootdo.system.controller.LoginController.index()',NULL,'127.0.0.1','2019-01-12 17:26:16'),(633,1,'admin','error',NULL,'http://localhost:8000/index','org.springframework.web.HttpRequestMethodNotSupportedException: Request method \'POST\' not supported',NULL,'2019-01-12 17:27:19'),(634,1,'admin','请求访问主页',8,'com.bootdo.system.controller.LoginController.index()',NULL,'127.0.0.1','2019-01-12 17:27:22'),(635,1,'admin','请求访问主页',6,'com.bootdo.system.controller.LoginController.index()',NULL,'127.0.0.1','2019-01-12 17:39:24'),(636,1,'admin','请求访问主页',11,'com.bootdo.system.controller.LoginController.index()',NULL,'127.0.0.1','2019-01-12 17:39:25'),(637,1,'admin','请求访问主页',36,'com.bootdo.system.controller.LoginController.index()',NULL,'127.0.0.1','2019-01-12 17:39:25'),(638,1,'admin','请求访问主页',12,'com.bootdo.system.controller.LoginController.index()',NULL,'127.0.0.1','2019-01-12 17:39:26'),(639,1,'admin','请求访问主页',25,'com.bootdo.system.controller.LoginController.index()',NULL,'127.0.0.1','2019-01-12 17:39:26'),(640,1,'admin','请求访问主页',10,'com.bootdo.system.controller.LoginController.index()',NULL,'127.0.0.1','2019-01-12 17:40:01'),(641,1,'admin','请求访问主页',5,'com.bootdo.system.controller.LoginController.index()',NULL,'127.0.0.1','2019-01-12 17:40:02'),(642,1,'admin','请求访问主页',5,'com.bootdo.system.controller.LoginController.index()',NULL,'127.0.0.1','2019-01-12 17:40:03'),(643,1,'admin','请求访问主页',15,'com.bootdo.system.controller.LoginController.index()',NULL,'127.0.0.1','2019-01-12 17:44:16'),(644,1,'admin','请求访问主页',18,'com.bootdo.system.controller.LoginController.index()',NULL,'127.0.0.1','2019-01-12 17:44:16'),(645,1,'admin','请求访问主页',13,'com.bootdo.system.controller.LoginController.index()',NULL,'127.0.0.1','2019-01-12 17:44:16'),(646,1,'admin','请求访问主页',9,'com.bootdo.system.controller.LoginController.index()',NULL,'127.0.0.1','2019-01-12 17:44:16'),(647,1,'admin','请求访问主页',15,'com.bootdo.system.controller.LoginController.index()',NULL,'127.0.0.1','2019-01-12 17:44:17'),(648,1,'admin','请求访问主页',5,'com.bootdo.system.controller.LoginController.index()',NULL,'127.0.0.1','2019-01-12 17:44:17'),(649,1,'admin','请求访问主页',31,'com.bootdo.system.controller.LoginController.index()',NULL,'127.0.0.1','2019-01-12 17:44:17'),(650,1,'admin','请求访问主页',34,'com.bootdo.system.controller.LoginController.index()',NULL,'127.0.0.1','2019-01-12 17:44:17'),(651,1,'admin','请求访问主页',12,'com.bootdo.system.controller.LoginController.index()',NULL,'127.0.0.1','2019-01-12 17:44:17'),(652,1,'admin','添加用户',1,'com.bootdo.system.controller.UserController.add()',NULL,'127.0.0.1','2019-01-12 17:45:21'),(653,1,'admin','添加角色',0,'com.bootdo.system.controller.RoleController.add()',NULL,'127.0.0.1','2019-01-12 17:45:24'),(654,1,'admin','添加菜单',0,'com.bootdo.system.controller.MenuController.add()',NULL,'127.0.0.1','2019-01-12 17:45:27'),(655,1,'admin','请求访问主页',9,'com.bootdo.system.controller.LoginController.index()',NULL,'127.0.0.1','2019-01-12 17:48:05'),(656,1,'admin','请求访问主页',8,'com.bootdo.system.controller.LoginController.index()',NULL,'127.0.0.1','2019-01-12 17:51:27'),(657,1,'admin','请求访问主页',13,'com.bootdo.system.controller.LoginController.index()',NULL,'127.0.0.1','2019-01-12 17:51:27'),(658,1,'admin','请求访问主页',13,'com.bootdo.system.controller.LoginController.index()',NULL,'127.0.0.1','2019-01-12 17:51:27'),(659,1,'admin','请求访问主页',5,'com.bootdo.system.controller.LoginController.index()',NULL,'127.0.0.1','2019-01-12 17:59:56'),(660,1,'admin','请求访问主页',4,'com.bootdo.system.controller.LoginController.index()',NULL,'127.0.0.1','2019-01-12 17:59:56'),(661,1,'admin','请求访问主页',4,'com.bootdo.system.controller.LoginController.index()',NULL,'127.0.0.1','2019-01-12 17:59:56'),(662,1,'admin','请求访问主页',26,'com.bootdo.system.controller.LoginController.index()',NULL,'127.0.0.1','2019-01-12 17:59:57'),(663,1,'admin','添加菜单',1,'com.bootdo.system.controller.MenuController.add()',NULL,'127.0.0.1','2019-01-12 18:00:01'),(664,1,'admin','请求访问主页',7,'com.bootdo.system.controller.LoginController.index()',NULL,'127.0.0.1','2019-01-12 18:13:48'),(665,1,'admin','请求访问主页',9,'com.bootdo.system.controller.LoginController.index()',NULL,'127.0.0.1','2019-01-12 18:13:49'),(666,1,'admin','请求访问主页',7,'com.bootdo.system.controller.LoginController.index()',NULL,'127.0.0.1','2019-01-12 18:13:49'),(667,1,'admin','请求访问主页',13,'com.bootdo.system.controller.LoginController.index()',NULL,'127.0.0.1','2019-01-12 18:13:49'),(668,1,'admin','请求访问主页',13,'com.bootdo.system.controller.LoginController.index()',NULL,'127.0.0.1','2019-01-12 18:13:49'),(669,1,'admin','请求访问主页',13,'com.bootdo.system.controller.LoginController.index()',NULL,'127.0.0.1','2019-01-12 18:13:49'),(670,1,'admin','请求访问主页',10,'com.bootdo.system.controller.LoginController.index()',NULL,'127.0.0.1','2019-01-12 18:13:49'),(671,1,'admin','请求访问主页',12,'com.bootdo.system.controller.LoginController.index()',NULL,'127.0.0.1','2019-01-12 18:13:50'),(672,1,'admin','请求访问主页',5,'com.bootdo.system.controller.LoginController.index()',NULL,'127.0.0.1','2019-01-12 18:13:50'),(673,1,'admin','添加角色',0,'com.bootdo.system.controller.RoleController.add()',NULL,'127.0.0.1','2019-01-12 18:14:00'),(674,1,'admin','登录',57,'com.bootdo.system.controller.LoginController.ajaxLogin()','[\"admin\",\"111111\"]','127.0.0.1','2019-01-20 17:32:05'),(675,1,'admin','请求访问主页',48,'com.bootdo.system.controller.LoginController.index()','[]','127.0.0.1','2019-01-20 17:32:05'),(676,1,'admin','更新用户',14,'com.bootdo.system.controller.UserController.updatePeronal()','[{\"birth\":613407600000,\"city\":\"成都市\",\"district\":\"双流区\",\"email\":\"admin@example.com\",\"hobby\":\"122;121;\",\"liveAddress\":\"ccc\",\"mobile\":\"17699999999\",\"name\":\"超级管理员\",\"province\":\"四川省\",\"sex\":96,\"userId\":1}]','127.0.0.1','2019-01-20 17:35:48'),(677,1,'admin','更新用户',8,'com.bootdo.system.controller.UserController.updatePeronal()','[{\"birth\":613407600000,\"city\":\"成都市\",\"district\":\"双流区\",\"email\":\"admin@example.com\",\"hobby\":\"122;121;\",\"liveAddress\":\"abcdefg\",\"mobile\":\"17699999999\",\"name\":\"超级管理员\",\"province\":\"四川省\",\"sex\":96,\"userId\":1}]','127.0.0.1','2019-01-20 17:37:41');
/*!40000 ALTER TABLE `sys_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8 COMMENT='菜单管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,0,'基础管理','','',0,'fa fa-bars',0,'2017-08-09 22:49:47',NULL),(2,3,'系统菜单','sys/menu/','sys:menu:menu',1,'fa fa-th-list',2,'2017-08-09 22:55:15',NULL),(3,0,'系统管理',NULL,NULL,0,'fa fa-desktop',1,'2017-08-09 23:06:55','2017-08-14 14:13:43'),(6,3,'用户管理','sys/user/','sys:user:user',1,'fa fa-user',0,'2017-08-10 14:12:11',NULL),(7,3,'角色管理','sys/role','sys:role:role',1,'fa fa-paw',1,'2017-08-10 14:13:19',NULL),(12,6,'新增','','sys:user:add',2,'',0,'2017-08-14 10:51:35',NULL),(13,6,'编辑','','sys:user:edit',2,'',0,'2017-08-14 10:52:06',NULL),(14,6,'删除',NULL,'sys:user:remove',2,NULL,0,'2017-08-14 10:52:24',NULL),(15,7,'新增','','sys:role:add',2,'',0,'2017-08-14 10:56:37',NULL),(20,2,'新增','','sys:menu:add',2,'',0,'2017-08-14 10:59:32',NULL),(21,2,'编辑','','sys:menu:edit',2,'',0,'2017-08-14 10:59:56',NULL),(22,2,'删除','','sys:menu:remove',2,'',0,'2017-08-14 11:00:26',NULL),(24,6,'批量删除','','sys:user:batchRemove',2,'',0,'2017-08-14 17:27:18',NULL),(25,6,'停用',NULL,'sys:user:disable',2,NULL,0,'2017-08-14 17:27:43',NULL),(26,6,'重置密码','','sys:user:resetPwd',2,'',0,'2017-08-14 17:28:34',NULL),(27,91,'系统日志','common/log','common:log',1,'fa fa-warning',0,'2017-08-14 22:11:53',NULL),(28,27,'刷新',NULL,'sys:log:list',2,NULL,0,'2017-08-14 22:30:22',NULL),(29,27,'删除',NULL,'sys:log:remove',2,NULL,0,'2017-08-14 22:30:43',NULL),(30,27,'清空',NULL,'sys:log:clear',2,NULL,0,'2017-08-14 22:31:02',NULL),(48,77,'代码生成','common/generator','common:generator',1,'fa fa-code',3,NULL,NULL),(55,7,'编辑','','sys:role:edit',2,'',NULL,NULL,NULL),(56,7,'删除','','sys:role:remove',2,NULL,NULL,NULL,NULL),(57,91,'运行监控','/druid/index.html','',1,'fa fa-caret-square-o-right',1,NULL,NULL),(61,2,'批量删除','','sys:menu:batchRemove',2,NULL,NULL,NULL,NULL),(62,7,'批量删除','','sys:role:batchRemove',2,NULL,NULL,NULL,NULL),(71,1,'文件管理','/common/sysFile','common:sysFile:sysFile',1,'fa fa-folder-open',2,NULL,NULL),(72,77,'计划任务','common/job','common:taskScheduleJob',1,'fa fa-hourglass-1',4,NULL,NULL),(73,3,'部门管理','/system/sysDept','system:sysDept:sysDept',1,'fa fa-users',3,NULL,NULL),(74,73,'增加','/system/sysDept/add','system:sysDept:add',2,NULL,1,NULL,NULL),(75,73,'刪除','system/sysDept/remove','system:sysDept:remove',2,NULL,2,NULL,NULL),(76,73,'编辑','/system/sysDept/edit','system:sysDept:edit',2,NULL,3,NULL,NULL),(77,0,'系统工具','','',0,'fa fa-gear',4,NULL,NULL),(78,1,'数据字典','/common/dict','common:dict:dict',1,'fa fa-book',1,NULL,NULL),(79,78,'增加','/common/dict/add','common:dict:add',2,NULL,2,NULL,NULL),(80,78,'编辑','/common/dict/edit','common:dict:edit',2,NULL,2,NULL,NULL),(81,78,'删除','/common/dict/remove','common:dict:remove',2,'',3,NULL,NULL),(83,78,'批量删除','/common/dict/batchRemove','common:dict:batchRemove',2,'',4,NULL,NULL),(84,0,'办公管理','','',0,'fa fa-laptop',5,NULL,NULL),(85,84,'通知公告','oa/notify','oa:notify:notify',1,'fa fa-pencil-square',NULL,NULL,NULL),(86,85,'新增','oa/notify/add','oa:notify:add',2,'fa fa-plus',1,NULL,NULL),(87,85,'编辑','oa/notify/edit','oa:notify:edit',2,'fa fa-pencil-square-o',2,NULL,NULL),(88,85,'删除','oa/notify/remove','oa:notify:remove',2,'fa fa-minus',NULL,NULL,NULL),(89,85,'批量删除','oa/notify/batchRemove','oa:notify:batchRemove',2,'',NULL,NULL,NULL),(90,84,'我的通知','oa/notify/selfNotify','',1,'fa fa-envelope-square',NULL,NULL,NULL),(91,0,'系统监控','','',0,'fa fa-video-camera',5,NULL,NULL),(92,91,'在线用户','sys/online','',1,'fa fa-user',NULL,NULL,NULL),(97,0,'图表管理','','',0,'fa fa-bar-chart',7,NULL,NULL),(98,97,'百度chart','/chart/graph_echarts.html','',1,'fa fa-area-chart',NULL,NULL,NULL),(104,77,'swagger','/swagger-ui.html','',1,'',NULL,NULL,NULL);
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `role_sign` varchar(100) DEFAULT NULL COMMENT '角色标识',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `user_id_create` bigint(255) DEFAULT NULL COMMENT '创建用户id',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8 COMMENT='角色';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,'超级用户角色','admin','拥有最高权限',2,'2017-08-12 00:43:52','2017-08-12 19:14:59'),(59,'普通用户',NULL,'基本用户权限',NULL,NULL,NULL);
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_menu`
--

DROP TABLE IF EXISTS `sys_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3284 DEFAULT CHARSET=utf8 COMMENT='角色与菜单对应关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
INSERT INTO `sys_role_menu` VALUES (367,44,1),(368,44,32),(369,44,33),(370,44,34),(371,44,35),(372,44,28),(373,44,29),(374,44,30),(375,44,38),(376,44,4),(377,44,27),(378,45,38),(379,46,3),(380,46,20),(381,46,21),(382,46,22),(383,46,23),(384,46,11),(385,46,12),(386,46,13),(387,46,14),(388,46,24),(389,46,25),(390,46,26),(391,46,15),(392,46,2),(393,46,6),(394,46,7),(598,50,38),(632,38,42),(737,51,38),(738,51,39),(739,51,40),(740,51,41),(741,51,4),(742,51,32),(743,51,33),(744,51,34),(745,51,35),(746,51,27),(747,51,28),(748,51,29),(749,51,30),(750,51,1),(1064,54,53),(1095,55,2),(1096,55,6),(1097,55,7),(1098,55,3),(1099,55,50),(1100,55,49),(1101,55,1),(1856,53,28),(1857,53,29),(1858,53,30),(1859,53,27),(1860,53,57),(1861,53,71),(1862,53,48),(1863,53,72),(1864,53,1),(1865,53,7),(1866,53,55),(1867,53,56),(1868,53,62),(1869,53,15),(1870,53,2),(1871,53,61),(1872,53,20),(1873,53,21),(1874,53,22),(2084,56,68),(2085,56,60),(2086,56,59),(2087,56,58),(2088,56,51),(2089,56,50),(2090,56,49),(2243,48,72),(2247,63,-1),(2248,63,84),(2249,63,85),(2250,63,88),(2251,63,87),(2252,64,84),(2253,64,89),(2254,64,88),(2255,64,87),(2256,64,86),(2257,64,85),(2258,65,89),(2259,65,88),(2260,65,86),(2262,67,48),(2263,68,88),(2264,68,87),(2265,69,89),(2266,69,88),(2267,69,86),(2268,69,87),(2269,69,85),(2270,69,84),(2271,70,85),(2272,70,89),(2273,70,88),(2274,70,87),(2275,70,86),(2276,70,84),(2277,71,87),(2278,72,59),(2279,73,48),(2280,74,88),(2281,74,87),(2282,75,88),(2283,75,87),(2284,76,85),(2285,76,89),(2286,76,88),(2287,76,87),(2288,76,86),(2289,76,84),(2292,78,88),(2293,78,87),(2294,78,NULL),(2295,78,NULL),(2296,78,NULL),(2308,80,87),(2309,80,86),(2310,80,-1),(2311,80,84),(2312,80,85),(2328,79,72),(2329,79,48),(2330,79,77),(2331,79,84),(2332,79,89),(2333,79,88),(2334,79,87),(2335,79,86),(2336,79,85),(2337,79,-1),(2338,77,89),(2339,77,88),(2340,77,87),(2341,77,86),(2342,77,85),(2343,77,84),(2344,77,72),(2345,77,-1),(2346,77,77),(2974,57,93),(2975,57,99),(2976,57,95),(2977,57,101),(2978,57,96),(2979,57,94),(2980,57,-1),(2981,58,93),(2982,58,99),(2983,58,95),(2984,58,101),(2985,58,96),(2986,58,94),(2987,58,-1),(3115,1,103),(3116,1,98),(3117,1,101),(3118,1,99),(3119,1,95),(3120,1,92),(3121,1,57),(3122,1,30),(3123,1,29),(3124,1,28),(3125,1,90),(3126,1,89),(3127,1,88),(3128,1,87),(3129,1,86),(3130,1,72),(3131,1,48),(3132,1,68),(3133,1,60),(3134,1,59),(3135,1,58),(3136,1,51),(3137,1,76),(3138,1,75),(3139,1,74),(3140,1,62),(3141,1,56),(3142,1,55),(3143,1,15),(3144,1,26),(3145,1,25),(3146,1,24),(3147,1,14),(3148,1,13),(3149,1,12),(3150,1,61),(3151,1,22),(3152,1,21),(3153,1,20),(3154,1,83),(3155,1,81),(3156,1,80),(3157,1,79),(3158,1,71),(3159,1,102),(3160,1,97),(3161,1,96),(3162,1,94),(3163,1,93),(3164,1,27),(3165,1,91),(3166,1,85),(3167,1,84),(3168,1,50),(3169,1,49),(3170,1,73),(3171,1,7),(3172,1,6),(3173,1,2),(3174,1,3),(3175,1,78),(3176,1,1),(3177,1,104),(3178,1,77),(3179,1,-1),(3232,59,98),(3233,59,101),(3234,59,99),(3235,59,95),(3236,59,90),(3237,59,89),(3238,59,88),(3239,59,87),(3240,59,86),(3241,59,68),(3242,59,60),(3243,59,59),(3244,59,58),(3245,59,51),(3246,59,76),(3247,59,75),(3248,59,74),(3249,59,62),(3250,59,56),(3251,59,55),(3252,59,15),(3253,59,26),(3254,59,25),(3255,59,24),(3256,59,14),(3257,59,13),(3258,59,12),(3259,59,61),(3260,59,22),(3261,59,21),(3262,59,20),(3263,59,83),(3264,59,81),(3265,59,80),(3266,59,79),(3267,59,71),(3268,59,97),(3269,59,96),(3270,59,94),(3271,59,93),(3272,59,85),(3273,59,84),(3274,59,50),(3275,59,49),(3276,59,73),(3277,59,7),(3278,59,6),(3279,59,2),(3280,59,3),(3281,59,78),(3282,59,1),(3283,59,-1);
/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_task`
--

DROP TABLE IF EXISTS `sys_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_task` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cron_expression` varchar(255) DEFAULT NULL COMMENT 'cron表达式',
  `method_name` varchar(255) DEFAULT NULL COMMENT '任务调用的方法名',
  `is_concurrent` varchar(255) DEFAULT NULL COMMENT '任务是否有状态',
  `description` varchar(255) DEFAULT NULL COMMENT '任务描述',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `bean_class` varchar(255) DEFAULT NULL COMMENT '任务执行时调用哪个类的方法 包名+类名',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `job_status` varchar(255) DEFAULT NULL COMMENT '任务状态',
  `job_group` varchar(255) DEFAULT NULL COMMENT '任务分组',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `spring_bean` varchar(255) DEFAULT NULL COMMENT 'Spring bean',
  `job_name` varchar(255) DEFAULT NULL COMMENT '任务名',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='定时任务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_task`
--

LOCK TABLES `sys_task` WRITE;
/*!40000 ALTER TABLE `sys_task` DISABLE KEYS */;
INSERT INTO `sys_task` VALUES (2,'0/10 * * * * ?','run1','1','','4028ea815a3d2a8c015a3d2f8d2a0002','com.bootdo.common.task.WelcomeJob','2017-05-19 18:30:56','0','group1','2017-05-19 18:31:07',NULL,'','welcomJob');
/*!40000 ALTER TABLE `sys_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `name` varchar(100) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL COMMENT '密码',
  `dept_id` bigint(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `status` tinyint(255) DEFAULT NULL COMMENT '状态 0:禁用，1:正常',
  `user_id_create` bigint(255) DEFAULT NULL COMMENT '创建用户id',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  `sex` bigint(32) DEFAULT NULL COMMENT '性别',
  `birth` datetime DEFAULT NULL COMMENT '出身日期',
  `pic_id` bigint(32) DEFAULT NULL,
  `live_address` varchar(500) DEFAULT NULL COMMENT '现居住地',
  `hobby` varchar(255) DEFAULT NULL COMMENT '爱好',
  `province` varchar(255) DEFAULT NULL COMMENT '省份',
  `city` varchar(255) DEFAULT NULL COMMENT '所在城市',
  `district` varchar(255) DEFAULT NULL COMMENT '所在地区',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8 COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,'admin','超级管理员','27bd386e70f280e24c2f4f2a549b82cf',6,'admin@example.com','17699999999',1,1,'2017-08-15 21:40:39','2017-08-15 21:41:00',96,'1989-06-10 00:00:00',138,'abcdefg','122;121;','四川省','成都市','双流区'),(2,'test','临时用户','6cf3bb3deba2aadbd41ec9a22511084e',6,'test@bootdo.com',NULL,1,1,'2017-08-14 13:43:05','2017-08-14 21:15:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(36,'ldh','刘德华','bfd9394475754fbe45866eba97738c36',7,'ldh@bootdo.com',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(123,'zxy','张学友','35174ba93f5fe7267f1fb3c1bf903781',6,'zxy@bootdo',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(124,'wyf','吴亦凡','e179e6f687bbd57b9d7efc4746c8090a',6,'wyf@bootdo.com',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(130,'lh','鹿晗','7924710cd673f68967cde70e188bb097',9,'lh@bootdo.com',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(131,'lhc','令狐冲','d515538e17ecb570ba40344b5618f5d4',6,'lhc@bootdo.com',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(132,'lyf','刘亦菲','7fdb1d9008f45950c1620ba0864e5fbd',13,'lyf@bootdo.com',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(134,'lyh','李彦宏','dc26092b3244d9d432863f2738180e19',8,'lyh@bootdo.com',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(135,'wjl','王健林','3967697dfced162cf6a34080259b83aa',6,'wjl@bootod.com',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(136,'gdg','郭德纲','3bb1bda86bc02bf6478cd91e42135d2f',9,'gdg@bootdo.com',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8 COMMENT='用户与角色对应关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` VALUES (73,30,48),(74,30,49),(75,30,50),(76,31,48),(77,31,49),(78,31,52),(79,32,48),(80,32,49),(81,32,50),(82,32,51),(83,32,52),(84,33,38),(85,33,49),(86,33,52),(87,34,50),(88,34,51),(89,34,52),(106,124,1),(110,1,1),(111,2,1),(113,131,48),(117,135,1),(120,134,1),(121,134,48),(123,130,1),(124,NULL,48),(125,132,52),(126,132,49),(127,123,48),(132,36,48);
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'bootdo'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-01-26 16:46:27
