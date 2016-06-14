/*
SQLyog Ultimate v8.53 
MySQL - 5.6.28 : Database - maindata
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`maindata` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `maindata`;

/*Table structure for table `zh_data_dictionary` */

DROP TABLE IF EXISTS `zh_data_dictionary`;

CREATE TABLE `zh_data_dictionary` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(16) NOT NULL,
  `remark` text,
  `type` varchar(32) NOT NULL,
  `value` varchar(8) NOT NULL,
  `fk_category_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_layhfd1butuigsscgucmp2okd` (`fk_category_id`),
  CONSTRAINT `fk_layhfd1butuigsscgucmp2okd` FOREIGN KEY (`fk_category_id`) REFERENCES `zh_dictionary_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `zh_data_dictionary` */

insert  into `zh_data_dictionary`(`id`,`name`,`remark`,`type`,`value`,`fk_category_id`) values (1,'启用','','java.lang.Integer','1',1),(2,'禁用','','java.lang.Integer','2',1),(3,'删除','','java.lang.Integer','3',1),(10,'菜单类型','','java.lang.Integer','1',2),(11,'安全类型','','java.lang.Integer','2',2);

/*Table structure for table `zh_dictionary_category` */

DROP TABLE IF EXISTS `zh_dictionary_category`;

CREATE TABLE `zh_dictionary_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(16) NOT NULL,
  `name` varchar(32) NOT NULL,
  `remark` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_9qkei4dxobl1lm4oa0ys8c3nr` (`code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `zh_dictionary_category` */

insert  into `zh_dictionary_category`(`id`,`code`,`name`,`remark`) values (1,'state','状态',NULL),(2,'resource-type','资源类型',NULL);

/*Table structure for table `zh_group` */

DROP TABLE IF EXISTS `zh_group`;

CREATE TABLE `zh_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(16) NOT NULL,
  `remark` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_byw2jrrrxrueqimkmgj3o842j` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `zh_group` */

insert  into `zh_group`(`id`,`name`,`remark`) values (1,'普通用户',''),(2,'运维人员',''),(3,'超级管理员','');

/*Table structure for table `zh_group_resource` */

DROP TABLE IF EXISTS `zh_group_resource`;

CREATE TABLE `zh_group_resource` (
  `fk_resource_id` bigint(20) NOT NULL,
  `fk_group_id` bigint(20) NOT NULL,
  PRIMARY KEY (`fk_resource_id`,`fk_group_id`),
  KEY `fk_q82fpmfh128qxoeyymrkg71e2` (`fk_group_id`),
  CONSTRAINT `fk_3tjs4wt3vvoibo1fvcvog5srd` FOREIGN KEY (`fk_resource_id`) REFERENCES `zh_resource` (`id`),
  CONSTRAINT `fk_q82fpmfh128qxoeyymrkg71e2` FOREIGN KEY (`fk_group_id`) REFERENCES `zh_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `zh_group_resource` */

insert  into `zh_group_resource`(`fk_resource_id`,`fk_group_id`) values (1,1),(2,1),(6,1),(7,1),(9,1),(11,1),(13,1),(15,1),(16,1),(18,1),(20,1),(22,1),(15,2),(16,2),(17,2),(18,2),(19,2),(20,2),(21,2),(22,2),(23,2),(1,3),(2,3),(3,3),(4,3),(5,3),(6,3),(7,3),(8,3),(9,3),(10,3),(11,3),(12,3),(13,3),(14,3),(15,3),(16,3),(17,3),(18,3),(19,3),(20,3),(21,3),(22,3),(23,3);

/*Table structure for table `zh_group_user` */

DROP TABLE IF EXISTS `zh_group_user`;

CREATE TABLE `zh_group_user` (
  `fk_group_id` bigint(20) NOT NULL,
  `fk_user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`fk_group_id`,`fk_user_id`),
  KEY `fk_7k068ltfepa1q75qtmvxuawk` (`fk_user_id`),
  CONSTRAINT `fk_7k068ltfepa1q75qtmvxuawk` FOREIGN KEY (`fk_user_id`) REFERENCES `zh_user` (`id`),
  CONSTRAINT `fk_rgmkki7dggfag6ow6eivljmwv` FOREIGN KEY (`fk_group_id`) REFERENCES `zh_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `zh_group_user` */

insert  into `zh_group_user`(`fk_group_id`,`fk_user_id`) values (1,3),(1,4),(3,5);

/*Table structure for table `zh_order` */

DROP TABLE IF EXISTS `zh_order`;

CREATE TABLE `zh_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pay_type` int(11) DEFAULT NULL,
  `order_price` bigint(20) DEFAULT NULL,
  `base_price` bigint(20) DEFAULT NULL,
  `order_status` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `zh_order` */

/*Table structure for table `zh_order_product` */

DROP TABLE IF EXISTS `zh_order_product`;

CREATE TABLE `zh_order_product` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `buy_count` int(11) DEFAULT NULL,
  `cost` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `zh_order_product` */

/*Table structure for table `zh_product` */

DROP TABLE IF EXISTS `zh_product`;

CREATE TABLE `zh_product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(50) DEFAULT NULL COMMENT '名称',
  `brand_id` bigint(20) DEFAULT NULL COMMENT '品牌id',
  `price` bigint(20) DEFAULT NULL COMMENT '价格',
  `cur_status` int(11) DEFAULT NULL COMMENT '商品状态',
  `type_id` bigint(20) DEFAULT NULL COMMENT '类型id',
  `detail` mediumtext COMMENT '详细',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `zh_product` */

/*Table structure for table `zh_product_type` */

DROP TABLE IF EXISTS `zh_product_type`;

CREATE TABLE `zh_product_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(20) DEFAULT NULL,
  `parent_type_id` bigint(20) DEFAULT NULL,
  `cur_status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `zh_product_type` */

/*Table structure for table `zh_resource` */

DROP TABLE IF EXISTS `zh_resource`;

CREATE TABLE `zh_resource` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `permission` varchar(64) DEFAULT NULL,
  `remark` text,
  `sort` int(11) NOT NULL,
  `name` varchar(16) NOT NULL,
  `type` int(2) NOT NULL,
  `value` varchar(256) DEFAULT NULL,
  `fk_parent_id` bigint(20) DEFAULT NULL,
  `icon` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_aunvlvm32xb4e6590jc9oooq` (`name`),
  KEY `fk_k2heqvi9muk4cjyyd53r9y37x` (`fk_parent_id`),
  CONSTRAINT `fk_k2heqvi9muk4cjyyd53r9y37x` FOREIGN KEY (`fk_parent_id`) REFERENCES `zh_resource` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

/*Data for the table `zh_resource` */

insert  into `zh_resource`(`id`,`permission`,`remark`,`sort`,`name`,`type`,`value`,`fk_parent_id`,`icon`) values (1,'','',1,'权限管理',1,'',NULL,'glyphicon glyphicon-briefcase'),(2,'perms[user:list]','',2,'用户管理',1,'/account/user/list/**',1,'glyphicon glyphicon-user'),(3,'perms[user:insert],authc','',3,'创建用户',2,'/account/user/insert/**',2,''),(4,'perms[user:update],authc','',4,'修改用户',2,'/account/user/update/**',2,''),(5,'perms[user:delete],authc','',5,'删除用户',2,'/account/user/delete/**',2,''),(6,'perms[user:edit],authc','',6,'查看用户',2,'/account/user/edit/**',2,''),(7,'perms[group:list]','',7,'组管理',1,'/account/group/list/**',1,'glyphicon glyphicon-briefcase'),(8,'perms[group:save],authc','',8,'创建和编辑组',2,'/account/group/save/**',7,''),(9,'perms[group:edit],authc','',9,'查看组',2,'/account/group/edit/**',7,''),(10,'perms[group:delete],authc','',10,'删除组',2,'/account/group/delete/**',7,''),(11,'perms[resource:list]','',11,'资源管理',1,'/account/resource/list/**',1,'glyphicon glyphicon-link'),(12,'perms[resource:save],authc','',12,'创建和编辑资源',2,'/account/resource/save/**',11,''),(13,'perms[resource:edit],authc','',13,'查看资源',2,'/account/resource/edit/**',11,''),(14,'perms[resource:delete],authc','',14,'删除资源',2,'/account/resource/delete/**',11,''),(15,'','',15,'系统管理',1,'',NULL,'glyphicon glyphicon-cog'),(16,'perms[data-dictionary:list]','',16,'数据字典管理',1,'/variable/data-dictionary/list/**',15,'glyphicon glyphicon-list-alt'),(17,'perms[data-dictionary:save],authc','',17,'创建和编辑数据字典',2,'/variable/data-dictionary/save/**',16,''),(18,'perms[data-dictionary:edit],authc','',18,'查看数据字典',2,'/variable/data-dictionary/edit/**',16,''),(19,'perms[data-dictionary:delete],authc','',19,'删除数据字典',2,'/variable/data-dictionary/delete/**',16,''),(20,'perms[dictionary-category:list]','',20,'字典类别管理',1,'/variable/dictionary-category/list/**',15,'glyphicon glyphicon-folder-close'),(21,'perms[dictionary-category:save],authc','',21,'创建和编辑字典类别',2,'/variable/dictionary-category/save/**',20,''),(22,'perms[dictionary-category:edit],authc','',22,'查看字典类别',2,'/variable/dictionary-category/edit/**',20,''),(23,'perms[dictionary-category:delete],authc','',20,'删除字典类别',2,'/variable/dictionary-category/delete/**',20,''),(24,'','',23,'资产管理',1,'',NULL,''),(25,'','',24,'商品管理',1,'',NULL,''),(26,'','',25,'订单管理',1,'',NULL,'');

/*Table structure for table `zh_shopping_cart` */

DROP TABLE IF EXISTS `zh_shopping_cart`;

CREATE TABLE `zh_shopping_cart` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `zh_shopping_cart` */

/*Table structure for table `zh_trans_flow` */

DROP TABLE IF EXISTS `zh_trans_flow`;

CREATE TABLE `zh_trans_flow` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `trans_type` int(11) DEFAULT NULL,
  `trans_cost` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `zh_trans_flow` */

/*Table structure for table `zh_user` */

DROP TABLE IF EXISTS `zh_user`;

CREATE TABLE `zh_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(64) DEFAULT NULL,
  `password` varchar(32) NOT NULL,
  `nickname` varchar(16) NOT NULL,
  `state` int(2) NOT NULL,
  `username` varchar(16) NOT NULL,
  `referees_id` bigint(20) DEFAULT NULL COMMENT '推荐人id',
  `referees_code` char(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_4wv83hfajry5tdoamn8wsqa6x` (`username`,`email`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `zh_user` */

insert  into `zh_user`(`id`,`email`,`password`,`nickname`,`state`,`username`,`referees_id`,`referees_code`) values (3,'maintain@baseframework.com','e10adc3949ba59abbe56e057f20f883e','运维用户',1,'maintain',NULL,NULL),(4,'user@baseframework.com','e10adc3949ba59abbe56e057f20f883e','普通用户',1,'user',NULL,NULL),(5,'administrator@baseframework.com','e10adc3949ba59abbe56e057f20f883e','超级管理员',1,'admin',NULL,NULL);

/*Table structure for table `zh_user_address` */

DROP TABLE IF EXISTS `zh_user_address`;

CREATE TABLE `zh_user_address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` binary(20) DEFAULT NULL,
  `provice_id` bigint(20) DEFAULT NULL,
  `city_id` bigint(20) DEFAULT NULL,
  `area_id` bigint(20) DEFAULT NULL,
  `address_detail` text,
  `custor_name` varchar(50) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `is_default` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `zh_user_address` */

/*Table structure for table `zh_user_assets` */

DROP TABLE IF EXISTS `zh_user_assets`;

CREATE TABLE `zh_user_assets` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `free_balance` bigint(20) DEFAULT NULL COMMENT '可用余额',
  `freeze_funds` bigint(20) DEFAULT NULL COMMENT '冻结资金',
  `capital_account` varchar(50) DEFAULT NULL COMMENT '资金账户',
  `cur_status` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `platform_gold` bigint(20) DEFAULT NULL COMMENT '金币',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `zh_user_assets` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
