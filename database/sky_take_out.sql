-- MySQL dump 10.13  Distrib 8.0.37, for Win64 (x86_64)
--
-- Host: localhost    Database: sky_take_out
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Current Database: `sky_take_out`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `sky_take_out` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `sky_take_out`;

--
-- Table structure for table `address_book`
--

DROP TABLE IF EXISTS `address_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address_book` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint NOT NULL COMMENT '用户id',
  `consignee` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '收货人',
  `sex` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '性别',
  `phone` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '手机号',
  `province_code` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '省级区划编号',
  `province_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '省级名称',
  `city_code` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '市级区划编号',
  `city_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '市级名称',
  `district_code` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '区级区划编号',
  `district_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '区级名称',
  `detail` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '详细地址',
  `label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '标签',
  `is_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT '默认 0 否 1是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='地址簿';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_book`
--

LOCK TABLES `address_book` WRITE;
/*!40000 ALTER TABLE `address_book` DISABLE KEYS */;
INSERT INTO `address_book` VALUES (3,4,'贾浩伟','0','19723026455','61','陕西省','6104','咸阳市','610402','秦都区','陕西国际商贸学院','3',1);
/*!40000 ALTER TABLE `address_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type` int DEFAULT NULL COMMENT '类型   1 菜品分类 2 套餐分类',
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '分类名称',
  `sort` int NOT NULL DEFAULT '0' COMMENT '顺序',
  `status` int DEFAULT NULL COMMENT '分类状态 0:禁用，1:启用',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_user` bigint DEFAULT NULL COMMENT '创建人',
  `update_user` bigint DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_category_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='菜品及套餐分类';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (11,1,'酒水饮料',10,1,'2022-06-09 22:09:18','2022-06-09 22:09:18',1,1),(12,1,'传统主食',9,1,'2022-06-09 22:09:32','2022-06-09 22:18:53',1,1),(13,2,'人气套餐',12,1,'2022-06-09 22:11:38','2022-06-10 11:04:40',1,1),(15,2,'商务套餐',13,1,'2022-06-09 22:14:10','2022-06-10 11:04:48',1,1),(16,1,'蜀味烤鱼',4,1,'2022-06-09 22:15:37','2022-08-31 14:27:25',1,1),(17,1,'蜀味牛蛙',5,1,'2022-06-09 22:16:14','2022-08-31 14:39:44',1,1),(18,1,'特色蒸菜',6,1,'2022-06-09 22:17:42','2022-06-09 22:17:42',1,1),(19,1,'新鲜时蔬',7,1,'2022-06-09 22:18:12','2022-06-09 22:18:28',1,1),(20,1,'水煮鱼',8,1,'2022-06-09 22:22:29','2022-06-09 22:23:45',1,1),(21,1,'汤类',11,1,'2022-06-10 10:51:47','2022-06-10 10:51:47',1,1);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dish`
--

DROP TABLE IF EXISTS `dish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dish` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '菜品名称',
  `category_id` bigint NOT NULL COMMENT '菜品分类id',
  `price` decimal(10,2) DEFAULT NULL COMMENT '菜品价格',
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '图片',
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '描述信息',
  `status` int DEFAULT '1' COMMENT '0 停售 1 起售',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_user` bigint DEFAULT NULL COMMENT '创建人',
  `update_user` bigint DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_dish_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='菜品';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dish`
--

LOCK TABLES `dish` WRITE;
/*!40000 ALTER TABLE `dish` DISABLE KEYS */;
INSERT INTO `dish` VALUES (46,'王老吉',11,6.00,'https://sky-take-out-jiahaowei.oss-cn-beijing.aliyuncs.com/724e4add-d6b8-4049-a3fe-f611dcd54b6b.png','',1,'2022-06-09 22:40:47','2026-09-10 17:07:20',1,1),(47,'北冰洋',11,4.00,'https://sky-take-out-jiahaowei.oss-cn-beijing.aliyuncs.com/82545160-81c7-47e0-9aa6-92a120cb0a03.png','还是小时候的味道',1,'2022-06-10 09:18:49','2026-09-10 17:07:05',1,1),(48,'雪花啤酒',11,4.00,'https://sky-take-out-jiahaowei.oss-cn-beijing.aliyuncs.com/579b65c8-de81-4555-8eb0-e7234d046886.png','',1,'2022-06-10 09:22:54','2026-09-10 17:06:48',1,1),(49,'米饭',12,2.00,'https://sky-take-out-jiahaowei.oss-cn-beijing.aliyuncs.com/8ac4fe6f-2a9a-458c-823a-2c19fadffde7.png','精选五常大米',1,'2022-06-10 09:30:17','2026-09-10 17:06:33',1,1),(50,'馒头',12,1.00,'https://sky-take-out-jiahaowei.oss-cn-beijing.aliyuncs.com/ba96fd70-1081-47c4-a29e-e1b0b1b82fe3.png','优质面粉',1,'2022-06-10 09:34:28','2026-09-10 17:06:17',1,1),(51,'老坛酸菜鱼',20,56.00,'https://sky-take-out-jiahaowei.oss-cn-beijing.aliyuncs.com/c5be40d9-dd91-4313-ac09-eb1fbe917187.png','原料：汤，草鱼，酸菜',1,'2022-06-10 09:40:51','2026-09-10 17:12:23',1,1),(52,'经典酸菜鮰鱼',20,66.00,'https://sky-take-out-jiahaowei.oss-cn-beijing.aliyuncs.com/2e4fa399-4f49-4f14-a62b-c454c96de038.png','原料：酸菜，江团，鮰鱼',1,'2022-06-10 09:46:02','2026-09-10 17:11:50',1,1),(53,'蜀味水煮草鱼',20,38.00,'https://sky-take-out-jiahaowei.oss-cn-beijing.aliyuncs.com/17f2a9d0-6909-4510-8220-5faaa2daca5c.png','原料：草鱼，汤',1,'2022-06-10 09:48:37','2026-09-10 17:12:46',1,1),(54,'清炒小油菜',19,18.00,'https://sky-take-out-jiahaowei.oss-cn-beijing.aliyuncs.com/85f1fbf0-a31a-404a-8b2a-5cf0748c8b08.png','原料：小油菜',1,'2022-06-10 09:51:46','2026-09-10 17:12:58',1,1),(55,'蒜蓉娃娃菜',19,18.00,'https://sky-take-out-jiahaowei.oss-cn-beijing.aliyuncs.com/f9080dfe-c134-43a9-8e91-313f1313f752.png','原料：蒜，娃娃菜',1,'2022-06-10 09:53:37','2026-09-10 17:14:06',1,1),(56,'清炒西兰花',19,18.00,'https://sky-take-out-jiahaowei.oss-cn-beijing.aliyuncs.com/9ecd8860-00bb-408d-ba2b-dbbb78ef21c0.png','原料：西兰花',1,'2022-06-10 09:55:44','2026-09-10 17:14:20',1,1),(57,'炝炒圆白菜',19,18.00,'https://sky-take-out-jiahaowei.oss-cn-beijing.aliyuncs.com/b561a2fa-ac08-4e4a-81e4-dff14327351c.png','原料：圆白菜',1,'2022-06-10 09:58:35','2026-09-10 17:14:33',1,1),(58,'清蒸鲈鱼',18,98.00,'https://sky-take-out-jiahaowei.oss-cn-beijing.aliyuncs.com/de508698-9531-4dfe-baa2-7e49c062082a.png','原料：鲈鱼',1,'2022-06-10 10:12:28','2026-09-10 17:14:47',1,1),(59,'东坡肘子',18,138.00,'https://sky-take-out-jiahaowei.oss-cn-beijing.aliyuncs.com/67db9947-cd81-47da-a448-f5e1ec124097.png','原料：猪肘棒',1,'2022-06-10 10:24:03','2026-09-10 17:15:00',1,1),(60,'梅菜扣肉',18,58.00,'https://sky-take-out-jiahaowei.oss-cn-beijing.aliyuncs.com/b4ffb965-b3a5-4421-af2c-003ab37900d0.png','原料：猪肉，梅菜',1,'2022-06-10 10:26:03','2026-09-10 17:15:15',1,1),(61,'剁椒鱼头',18,66.00,'https://sky-take-out-jiahaowei.oss-cn-beijing.aliyuncs.com/a2654173-91bc-4786-854b-a9c275806986.png','原料：鲢鱼，剁椒',1,'2022-06-10 10:28:54','2026-09-10 17:15:30',1,1),(62,'金汤酸菜牛蛙',17,88.00,'https://sky-take-out-jiahaowei.oss-cn-beijing.aliyuncs.com/d30486c6-bbe9-4f06-934d-6fb1ba73a95b.png','原料：鲜活牛蛙，酸菜',1,'2022-06-10 10:33:05','2026-09-10 17:15:44',1,1),(63,'香锅牛蛙',17,88.00,'https://sky-take-out-jiahaowei.oss-cn-beijing.aliyuncs.com/81e23fd6-f424-429a-93c9-e09d94ae8214.png','配料：鲜活牛蛙，莲藕，青笋',1,'2022-06-10 10:35:40','2026-09-10 17:16:03',1,1),(64,'馋嘴牛蛙',17,88.00,'https://sky-take-out-jiahaowei.oss-cn-beijing.aliyuncs.com/83289485-b902-487b-af1e-63e014f87b9c.png','配料：鲜活牛蛙，丝瓜，黄豆芽',1,'2022-06-10 10:37:52','2026-09-10 17:16:18',1,1),(65,'草鱼2斤',16,68.00,'https://sky-take-out-jiahaowei.oss-cn-beijing.aliyuncs.com/ad03bfa2-ce09-40dc-bc6d-7efabcd3da36.png','原料：草鱼，黄豆芽，莲藕',1,'2022-06-10 10:41:08','2026-09-10 17:16:31',1,1),(66,'江团鱼2斤',16,119.00,'https://sky-take-out-jiahaowei.oss-cn-beijing.aliyuncs.com/3b773c8e-f13a-499a-8fb7-dca25b1522c5.png','配料：江团鱼，黄豆芽，莲藕',1,'2022-06-10 10:42:42','2026-09-10 17:16:46',1,1),(67,'鮰鱼2斤',16,72.00,'https://sky-take-out-jiahaowei.oss-cn-beijing.aliyuncs.com/5eb9863d-d2b8-4ae5-aebf-3ba7e4c9dece.png','原料：鮰鱼，黄豆芽，莲藕',1,'2022-06-10 10:43:56','2026-09-11 12:38:57',1,1),(68,'鸡蛋汤',21,6.00,'https://sky-take-out-jiahaowei.oss-cn-beijing.aliyuncs.com/68a4f460-97d3-47ae-b0e4-8b17f437a11c.png','配料：鸡蛋，紫菜',1,'2022-06-10 10:54:25','2026-09-11 12:38:54',1,1),(69,'平菇豆腐汤',21,20.00,'https://sky-take-out-jiahaowei.oss-cn-beijing.aliyuncs.com/f5acff94-d0ea-4e11-b2e6-d9e668381949.png','配料：豆腐，平菇',1,'2022-06-10 10:55:02','2026-09-04 23:26:28',1,1),(71,'黄河大鲤鱼',20,99.00,'https://sky-take-out-jiahaowei.oss-cn-beijing.aliyuncs.com/a0a677f5-47ad-484f-8571-36c7a917e56b.png','正宗黄河大鲤鱼',1,'2026-09-04 16:16:15','2026-09-05 00:33:39',1,1);
/*!40000 ALTER TABLE `dish` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dish_flavor`
--

DROP TABLE IF EXISTS `dish_flavor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dish_flavor` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dish_id` bigint NOT NULL COMMENT '菜品',
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '口味名称',
  `value` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '口味数据list',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='菜品口味关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dish_flavor`
--

LOCK TABLES `dish_flavor` WRITE;
/*!40000 ALTER TABLE `dish_flavor` DISABLE KEYS */;
INSERT INTO `dish_flavor` VALUES (40,10,'甜味','[\"无糖\",\"少糖\",\"半糖\",\"多糖\",\"全糖\"]'),(41,7,'忌口','[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]'),(42,7,'温度','[\"热饮\",\"常温\",\"去冰\",\"少冰\",\"多冰\"]'),(45,6,'忌口','[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]'),(46,6,'辣度','[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]'),(47,5,'辣度','[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]'),(48,5,'甜味','[\"无糖\",\"少糖\",\"半糖\",\"多糖\",\"全糖\"]'),(49,2,'甜味','[\"无糖\",\"少糖\",\"半糖\",\"多糖\",\"全糖\"]'),(50,4,'甜味','[\"无糖\",\"少糖\",\"半糖\",\"多糖\",\"全糖\"]'),(51,3,'甜味','[\"无糖\",\"少糖\",\"半糖\",\"多糖\",\"全糖\"]'),(52,3,'忌口','[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]'),(104,71,'','[]'),(110,69,'甜味','[\"无糖\",\"少糖\",\"半糖\",\"多糖\",\"全糖\"]'),(111,52,'忌口','[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]'),(112,52,'辣度','[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]'),(113,51,'辣度','[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]'),(114,53,'忌口','[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]'),(115,53,'辣度','[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]'),(116,54,'忌口','[\"不要葱\",\"不要蒜\",\"不要香菜\"]'),(117,56,'忌口','[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]'),(118,57,'忌口','[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]'),(119,60,'忌口','[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]'),(120,65,'辣度','[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]'),(121,66,'辣度','[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]'),(122,67,'辣度','[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]');
/*!40000 ALTER TABLE `dish_flavor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '姓名',
  `username` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '用户名',
  `password` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '密码',
  `phone` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '手机号',
  `sex` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '性别',
  `id_number` varchar(18) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '身份证号',
  `status` int NOT NULL DEFAULT '1' COMMENT '状态 0:禁用，1:启用',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_user` bigint DEFAULT NULL COMMENT '创建人',
  `update_user` bigint DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='员工信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'管理员','admin','e10adc3949ba59abbe56e057f20f883e','13812312312','1','110101199001010047',1,'2022-02-15 15:51:20','2022-02-17 09:16:20',10,1),(2,'贾浩伟','jiahaowei','e10adc3949ba59abbe56e057f20f883e','19999999999','男','64',1,'2026-09-03 18:59:17','2026-09-03 18:59:17',10,10),(3,'张三','zhangsan1','e10adc3949ba59abbe56e057f20f883e','13897346746','1','210210200304302013',1,'2026-09-03 19:03:07','2026-09-04 13:05:51',10,1),(6,'李四','lisi','e10adc3949ba59abbe56e057f20f883e','18879897878','1','210222302020203030',1,'2026-09-03 19:40:16','2026-09-03 19:40:16',1,1);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '名字',
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '图片',
  `order_id` bigint NOT NULL COMMENT '订单id',
  `dish_id` bigint DEFAULT NULL COMMENT '菜品id',
  `setmeal_id` bigint DEFAULT NULL COMMENT '套餐id',
  `dish_flavor` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '口味',
  `number` int NOT NULL DEFAULT '1' COMMENT '数量',
  `amount` decimal(10,2) NOT NULL COMMENT '金额',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='订单明细表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
INSERT INTO `order_detail` VALUES (5,'鮰鱼2斤','https://sky-take-out-jiahaowei.oss-cn-beijing.aliyuncs.com/5eb9863d-d2b8-4ae5-aebf-3ba7e4c9dece.png',4,67,NULL,'不辣',1,72.00),(6,'草鱼2斤','https://sky-take-out-jiahaowei.oss-cn-beijing.aliyuncs.com/ad03bfa2-ce09-40dc-bc6d-7efabcd3da36.png',4,65,NULL,'不辣',1,68.00),(7,'清炒西兰花','https://sky-take-out-jiahaowei.oss-cn-beijing.aliyuncs.com/9ecd8860-00bb-408d-ba2b-dbbb78ef21c0.png',4,56,NULL,'不要葱',1,18.00),(8,'江团鱼2斤','https://sky-take-out-jiahaowei.oss-cn-beijing.aliyuncs.com/3b773c8e-f13a-499a-8fb7-dca25b1522c5.png',5,66,NULL,'不辣',1,119.00),(9,'草鱼2斤','https://sky-take-out-jiahaowei.oss-cn-beijing.aliyuncs.com/ad03bfa2-ce09-40dc-bc6d-7efabcd3da36.png',5,65,NULL,'不辣',1,68.00),(10,'雪花啤酒','https://sky-take-out-jiahaowei.oss-cn-beijing.aliyuncs.com/579b65c8-de81-4555-8eb0-e7234d046886.png',6,48,NULL,NULL,1,4.00),(11,'北冰洋','https://sky-take-out-jiahaowei.oss-cn-beijing.aliyuncs.com/82545160-81c7-47e0-9aa6-92a120cb0a03.png',6,47,NULL,NULL,1,4.00),(12,'测试','https://sky-take-out-jiahaowei.oss-cn-beijing.aliyuncs.com/5987d79f-3ae3-4474-89da-77f67a089a59.png',6,NULL,32,NULL,1,99.00),(13,'鮰鱼2斤','https://sky-take-out-jiahaowei.oss-cn-beijing.aliyuncs.com/5eb9863d-d2b8-4ae5-aebf-3ba7e4c9dece.png',7,67,NULL,'不辣',1,72.00),(14,'草鱼2斤','https://sky-take-out-jiahaowei.oss-cn-beijing.aliyuncs.com/ad03bfa2-ce09-40dc-bc6d-7efabcd3da36.png',7,65,NULL,'不辣',1,68.00),(15,'清炒西兰花','https://sky-take-out-jiahaowei.oss-cn-beijing.aliyuncs.com/9ecd8860-00bb-408d-ba2b-dbbb78ef21c0.png',7,56,NULL,'不要葱',1,18.00),(16,'鮰鱼2斤','https://sky-take-out-jiahaowei.oss-cn-beijing.aliyuncs.com/5eb9863d-d2b8-4ae5-aebf-3ba7e4c9dece.png',8,67,NULL,'不辣',1,72.00),(17,'馒头','https://sky-take-out-jiahaowei.oss-cn-beijing.aliyuncs.com/ba96fd70-1081-47c4-a29e-e1b0b1b82fe3.png',8,50,NULL,NULL,1,1.00),(18,'鸡蛋汤','https://sky-take-out-jiahaowei.oss-cn-beijing.aliyuncs.com/68a4f460-97d3-47ae-b0e4-8b17f437a11c.png',8,68,NULL,NULL,1,6.00),(19,'炝炒圆白菜','https://sky-take-out-jiahaowei.oss-cn-beijing.aliyuncs.com/b561a2fa-ac08-4e4a-81e4-dff14327351c.png',9,57,NULL,'不要葱',1,18.00),(20,'炝炒圆白菜','https://sky-take-out-jiahaowei.oss-cn-beijing.aliyuncs.com/b561a2fa-ac08-4e4a-81e4-dff14327351c.png',10,57,NULL,'不要葱',1,18.00),(21,'北冰洋','https://sky-take-out-jiahaowei.oss-cn-beijing.aliyuncs.com/82545160-81c7-47e0-9aa6-92a120cb0a03.png',11,47,NULL,NULL,1,4.00),(22,'测试','https://sky-take-out-jiahaowei.oss-cn-beijing.aliyuncs.com/5987d79f-3ae3-4474-89da-77f67a089a59.png',12,NULL,32,NULL,1,99.00),(23,'蜀味水煮草鱼','https://sky-take-out-jiahaowei.oss-cn-beijing.aliyuncs.com/17f2a9d0-6909-4510-8220-5faaa2daca5c.png',13,53,NULL,'不要葱,不辣',1,38.00),(24,'清炒西兰花','https://sky-take-out-jiahaowei.oss-cn-beijing.aliyuncs.com/9ecd8860-00bb-408d-ba2b-dbbb78ef21c0.png',14,56,NULL,'不要葱',1,18.00),(25,'老坛酸菜鱼','https://sky-take-out-jiahaowei.oss-cn-beijing.aliyuncs.com/c5be40d9-dd91-4313-ac09-eb1fbe917187.png',15,51,NULL,'不辣',1,56.00),(26,'鮰鱼2斤','https://sky-take-out-jiahaowei.oss-cn-beijing.aliyuncs.com/5eb9863d-d2b8-4ae5-aebf-3ba7e4c9dece.png',16,67,NULL,'不辣',1,72.00),(27,'草鱼2斤','https://sky-take-out-jiahaowei.oss-cn-beijing.aliyuncs.com/ad03bfa2-ce09-40dc-bc6d-7efabcd3da36.png',16,65,NULL,'不辣',1,68.00),(28,'清炒西兰花','https://sky-take-out-jiahaowei.oss-cn-beijing.aliyuncs.com/9ecd8860-00bb-408d-ba2b-dbbb78ef21c0.png',16,56,NULL,'不要葱',1,18.00),(29,'鮰鱼2斤','https://sky-take-out-jiahaowei.oss-cn-beijing.aliyuncs.com/5eb9863d-d2b8-4ae5-aebf-3ba7e4c9dece.png',17,67,NULL,'不辣',1,72.00),(30,'草鱼2斤','https://sky-take-out-jiahaowei.oss-cn-beijing.aliyuncs.com/ad03bfa2-ce09-40dc-bc6d-7efabcd3da36.png',17,65,NULL,'不辣',1,68.00),(31,'清炒西兰花','https://sky-take-out-jiahaowei.oss-cn-beijing.aliyuncs.com/9ecd8860-00bb-408d-ba2b-dbbb78ef21c0.png',17,56,NULL,'不要葱',1,18.00),(32,'鮰鱼2斤','https://sky-take-out-jiahaowei.oss-cn-beijing.aliyuncs.com/5eb9863d-d2b8-4ae5-aebf-3ba7e4c9dece.png',18,67,NULL,'不辣',1,72.00),(33,'鮰鱼2斤','https://sky-take-out-jiahaowei.oss-cn-beijing.aliyuncs.com/5eb9863d-d2b8-4ae5-aebf-3ba7e4c9dece.png',19,67,NULL,'不辣',1,72.00),(34,'草鱼2斤','https://sky-take-out-jiahaowei.oss-cn-beijing.aliyuncs.com/ad03bfa2-ce09-40dc-bc6d-7efabcd3da36.png',19,65,NULL,'不辣',1,68.00),(35,'清炒西兰花','https://sky-take-out-jiahaowei.oss-cn-beijing.aliyuncs.com/9ecd8860-00bb-408d-ba2b-dbbb78ef21c0.png',19,56,NULL,'不要葱',1,18.00),(36,'鮰鱼2斤','https://sky-take-out-jiahaowei.oss-cn-beijing.aliyuncs.com/5eb9863d-d2b8-4ae5-aebf-3ba7e4c9dece.png',20,67,NULL,'不辣',1,72.00);
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `number` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '订单号',
  `status` int NOT NULL DEFAULT '1' COMMENT '订单状态 1待付款 2待接单 3已接单 4派送中 5已完成 6已取消 7退款',
  `user_id` bigint NOT NULL COMMENT '下单用户',
  `address_book_id` bigint NOT NULL COMMENT '地址id',
  `order_time` datetime NOT NULL COMMENT '下单时间',
  `checkout_time` datetime DEFAULT NULL COMMENT '结账时间',
  `pay_method` int NOT NULL DEFAULT '1' COMMENT '支付方式 1微信,2支付宝',
  `pay_status` tinyint NOT NULL DEFAULT '0' COMMENT '支付状态 0未支付 1已支付 2退款',
  `amount` decimal(10,2) NOT NULL COMMENT '实收金额',
  `remark` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '备注',
  `phone` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '手机号',
  `address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '地址',
  `user_name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '用户名称',
  `consignee` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '收货人',
  `cancel_reason` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '订单取消原因',
  `rejection_reason` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '订单拒绝原因',
  `cancel_time` datetime DEFAULT NULL COMMENT '订单取消时间',
  `estimated_delivery_time` datetime DEFAULT NULL COMMENT '预计送达时间',
  `delivery_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '配送状态  1立即送出  0选择具体时间',
  `delivery_time` datetime DEFAULT NULL COMMENT '送达时间',
  `pack_amount` int DEFAULT NULL COMMENT '打包费',
  `tableware_number` int DEFAULT NULL COMMENT '餐具数量',
  `tableware_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '餐具数量状态  1按餐量提供  0选择具体数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='订单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (4,'1789447354347',5,4,3,'2026-09-15 12:42:34',NULL,1,0,167.00,'','19723026455',NULL,NULL,'贾浩伟','订单超时,自动取消',NULL,'2026-09-16 17:40:41','2026-09-15 13:42:00',0,NULL,3,0,0),(5,'1789456584598',5,4,3,'2026-09-15 15:16:25','2026-09-15 15:16:27',1,2,195.00,'','19723026455',NULL,NULL,'贾浩伟','用户取消',NULL,'2026-09-15 18:41:30','2026-09-15 16:16:00',0,NULL,2,0,0),(6,'1789468269423',5,4,3,'2026-09-15 18:31:09','2026-09-15 18:31:15',1,2,116.00,'','19723026455',NULL,NULL,'贾浩伟','用户取消',NULL,'2026-09-15 18:41:21','2026-09-15 19:31:00',0,NULL,3,0,0),(7,'1789547071990',5,4,3,'2026-09-16 16:24:32','2026-09-16 16:24:38',1,1,167.00,'','19723026455',NULL,NULL,'贾浩伟',NULL,NULL,NULL,'2026-09-16 17:24:00',0,'2026-09-16 16:25:11',3,0,0),(8,'1789555120818',5,4,3,'2026-09-16 18:38:41','2026-09-16 18:38:48',1,1,99.00,'','19723026455',NULL,NULL,'贾浩伟',NULL,NULL,NULL,'2026-09-16 19:38:00',0,NULL,6,0,0),(9,'1789556385959',5,4,3,'2026-09-16 18:59:46',NULL,1,0,25.00,'','19723026455',NULL,NULL,'贾浩伟','订单超时,自动取消',NULL,'2026-09-16 19:14:46','2026-09-16 19:59:00',0,NULL,1,0,0),(10,'1789556634902',5,4,3,'2026-09-16 19:03:55',NULL,1,0,25.00,'','19723026455',NULL,NULL,'贾浩伟','订单超时,自动取消',NULL,'2026-09-16 19:18:56','2026-09-16 20:03:00',0,NULL,1,0,0),(11,'1789556743902',5,4,3,'2026-09-16 19:05:44',NULL,1,0,11.00,'','19723026455',NULL,NULL,'贾浩伟','订单超时,自动取消',NULL,'2026-09-16 19:20:46','2026-09-16 20:05:00',0,NULL,1,0,0),(12,'1789557265668',5,4,3,'2026-09-16 19:14:26','2026-09-16 19:14:28',1,1,106.00,'','19723026455',NULL,NULL,'贾浩伟',NULL,NULL,NULL,'2026-09-16 20:14:00',0,NULL,1,0,0),(13,'1789558265897',5,4,3,'2026-09-16 19:31:06','2026-09-16 19:31:08',1,1,45.00,'','19723026455',NULL,NULL,'贾浩伟',NULL,NULL,NULL,'2026-09-16 20:31:00',0,'2026-09-18 11:34:08',1,0,0),(14,'1789559171184',5,4,3,'2026-09-16 19:46:11','2026-09-16 19:46:19',1,1,25.00,'','19723026455',NULL,NULL,'贾浩伟',NULL,NULL,NULL,'2026-09-16 20:46:00',0,'2026-09-18 11:34:44',1,0,0),(15,'1789702405363',5,4,3,'2026-09-18 11:33:25','2026-09-18 11:33:27',1,1,63.00,'','19723026455',NULL,NULL,'贾浩伟',NULL,NULL,NULL,'2026-09-18 12:33:00',0,'2026-09-18 11:34:45',1,0,0),(16,'1789702535724',6,4,3,'2026-09-18 11:35:36',NULL,1,0,167.00,'','19723026455',NULL,NULL,'贾浩伟','用户取消',NULL,'2026-09-18 11:36:16','2026-09-18 12:35:00',0,NULL,3,0,0),(17,'1789702555755',5,4,3,'2026-09-18 11:35:56','2026-09-18 11:35:58',1,1,167.00,'','19723026455',NULL,NULL,'贾浩伟',NULL,NULL,NULL,'2026-09-18 12:35:00',0,'2026-09-18 11:36:51',3,0,0),(18,'1789708559960',5,4,3,'2026-09-18 13:16:00','2026-09-18 13:16:02',1,1,79.00,'','19723026455',NULL,NULL,'贾浩伟',NULL,NULL,NULL,'2026-09-18 14:15:00',0,'2026-09-18 13:20:33',1,0,0),(19,'1789708666399',5,4,3,'2026-09-18 13:17:46','2026-09-18 13:17:49',1,1,167.00,'','19723026455',NULL,NULL,'贾浩伟',NULL,NULL,NULL,'2026-09-18 14:17:00',0,'2026-09-18 13:20:34',3,0,0),(20,'1789708783054',5,4,3,'2026-09-18 13:19:43','2026-09-18 13:19:45',1,1,79.00,'','19723026455',NULL,NULL,'贾浩伟',NULL,NULL,NULL,'2026-09-18 14:19:00',0,'2026-09-18 13:20:35',1,0,0);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setmeal`
--

DROP TABLE IF EXISTS `setmeal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `setmeal` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `category_id` bigint NOT NULL COMMENT '菜品分类id',
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '套餐名称',
  `price` decimal(10,2) NOT NULL COMMENT '套餐价格',
  `status` int DEFAULT '1' COMMENT '售卖状态 0:停售 1:起售',
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '描述信息',
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '图片',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_user` bigint DEFAULT NULL COMMENT '创建人',
  `update_user` bigint DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_setmeal_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='套餐';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setmeal`
--

LOCK TABLES `setmeal` WRITE;
/*!40000 ALTER TABLE `setmeal` DISABLE KEYS */;
INSERT INTO `setmeal` VALUES (32,13,'测试',99.00,1,'测试','https://sky-take-out-jiahaowei.oss-cn-beijing.aliyuncs.com/5987d79f-3ae3-4474-89da-77f67a089a59.png','2026-09-05 00:35:15','2026-09-11 13:55:17',1,1);
/*!40000 ALTER TABLE `setmeal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setmeal_dish`
--

DROP TABLE IF EXISTS `setmeal_dish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `setmeal_dish` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `setmeal_id` bigint DEFAULT NULL COMMENT '套餐id',
  `dish_id` bigint DEFAULT NULL COMMENT '菜品id',
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '菜品名称 （冗余字段）',
  `price` decimal(10,2) DEFAULT NULL COMMENT '菜品单价（冗余字段）',
  `copies` int DEFAULT NULL COMMENT '菜品份数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='套餐菜品关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setmeal_dish`
--

LOCK TABLES `setmeal_dish` WRITE;
/*!40000 ALTER TABLE `setmeal_dish` DISABLE KEYS */;
INSERT INTO `setmeal_dish` VALUES (48,33,58,NULL,NULL,61),(49,33,91,NULL,NULL,2),(50,33,45,NULL,NULL,20),(53,50,68,NULL,NULL,76),(54,50,54,NULL,NULL,99),(55,32,66,NULL,NULL,18);
/*!40000 ALTER TABLE `setmeal_dish` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopping_cart`
--

DROP TABLE IF EXISTS `shopping_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shopping_cart` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '商品名称',
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '图片',
  `user_id` bigint NOT NULL COMMENT '主键',
  `dish_id` bigint DEFAULT NULL COMMENT '菜品id',
  `setmeal_id` bigint DEFAULT NULL COMMENT '套餐id',
  `dish_flavor` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '口味',
  `number` int NOT NULL DEFAULT '1' COMMENT '数量',
  `amount` decimal(10,2) NOT NULL COMMENT '金额',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='购物车';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping_cart`
--

LOCK TABLES `shopping_cart` WRITE;
/*!40000 ALTER TABLE `shopping_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `shopping_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `openid` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '微信用户唯一标识',
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '姓名',
  `phone` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '手机号',
  `sex` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '性别',
  `id_number` varchar(18) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '身份证号',
  `avatar` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '头像',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='用户信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (4,'o5nNs3abDO9DXih6Gp-PZg0i682M',NULL,NULL,NULL,NULL,NULL,'2026-09-10 16:04:37');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'sky_take_out'
--

--
-- Dumping routines for database 'sky_take_out'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-18 18:03:52
