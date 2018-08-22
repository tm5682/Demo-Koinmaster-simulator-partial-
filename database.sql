/*
SQLyog Community v12.4.1 (64 bit)
MySQL - 10.1.22-MariaDB : Database - simul_app
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`simul_app` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `simul_app`;

/*Table structure for table `asset_table` */

DROP TABLE IF EXISTS `asset_table`;

CREATE TABLE `asset_table` (
  `assertid` int(4) NOT NULL AUTO_INCREMENT,
  `assert_name` varchar(20) DEFAULT NULL,
  `24hrvolume` double DEFAULT NULL,
  `last_price_usd` double DEFAULT NULL,
  `last_price_btc` double DEFAULT NULL,
  `last_bid_usd` double DEFAULT NULL,
  `last_bid_btc` double DEFAULT NULL,
  `last_ask_usd` double DEFAULT NULL,
  `last_ask_btc` double DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`assertid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `asset_table` */

/*Table structure for table `order_btc` */

DROP TABLE IF EXISTS `order_btc`;

CREATE TABLE `order_btc` (
  `orderid` int(8) NOT NULL AUTO_INCREMENT,
  `userid` int(8) NOT NULL,
  `order_type` varchar(40) DEFAULT NULL,
  `order_qua` int(10) DEFAULT NULL,
  `price_per_unit` double DEFAULT NULL,
  `status` varchar(49) DEFAULT NULL,
  `coin` varchar(40) DEFAULT NULL,
  `currency` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`orderid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `order_btc` */

insert  into `order_btc`(`orderid`,`userid`,`order_type`,`order_qua`,`price_per_unit`,`status`,`coin`,`currency`) values 
(1,13,'sell',123,101,'published','LTC',NULL),
(6,12,'sell',12,10260.333333333334,'published','XRP',NULL),
(7,13,'buy',12,10260.25,'published','LTC',NULL);

/*Table structure for table `resource` */

DROP TABLE IF EXISTS `resource`;

CREATE TABLE `resource` (
  `article_blog_id` int(4) NOT NULL COMMENT 'Article blog ID',
  `content` varchar(500) DEFAULT NULL COMMENT 'Article content',
  `associated_colum` int(100) DEFAULT NULL COMMENT 'Associated_colum',
  PRIMARY KEY (`article_blog_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `resource` */

/*Table structure for table `stream_data` */

DROP TABLE IF EXISTS `stream_data`;

CREATE TABLE `stream_data` (
  `coin_id` int(4) NOT NULL AUTO_INCREMENT,
  `Coin` varchar(12) DEFAULT NULL,
  `Ask_usd` float unsigned DEFAULT NULL,
  `Ask_btc` float DEFAULT NULL,
  `Buy_usd` float DEFAULT NULL,
  `Buy_btc` float DEFAULT NULL,
  `Last_price_usd` float DEFAULT NULL,
  `last_price_btc` float DEFAULT NULL,
  PRIMARY KEY (`coin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `stream_data` */

insert  into `stream_data`(`coin_id`,`Coin`,`Ask_usd`,`Ask_btc`,`Buy_usd`,`Buy_btc`,`Last_price_usd`,`last_price_btc`) values 
(1,'XRP',0.18,0.0003,0.17,0.0002,0.17,0.00025),
(2,'LTC',46,0.02,45,0.014,47,0.017);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `userid` int(4) NOT NULL AUTO_INCREMENT COMMENT 'User_ID',
  `username` varchar(100) DEFAULT NULL COMMENT 'User name',
  `email` varchar(50) DEFAULT NULL COMMENT 'Email Address',
  `password` varchar(100) DEFAULT NULL COMMENT 'Password',
  `logindetail` varchar(100) DEFAULT NULL COMMENT 'Login_detail',
  `IPAddress` varchar(50) DEFAULT NULL COMMENT 'IP Address',
  `Location` varchar(100) DEFAULT NULL COMMENT 'User location',
  `Rem_virtual_usd` float DEFAULT NULL COMMENT 'User virtual USD',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`userid`,`username`,`email`,`password`,`logindetail`,`IPAddress`,`Location`,`Rem_virtual_usd`,`created_at`,`updated_at`) values 
(12,'ad','Ashley.Jay1120@gmail.com','a',NULL,NULL,NULL,25000000,'2017-07-17 16:42:09','2017-07-17 16:42:09'),
(13,'sambath','sambath.khan@yahoo.com','123',NULL,NULL,NULL,25000000,'2017-06-10 17:48:54','2017-07-18 17:49:01');

/*Table structure for table `user_req` */

DROP TABLE IF EXISTS `user_req`;

CREATE TABLE `user_req` (
  `ord_usd_id` int(4) NOT NULL AUTO_INCREMENT,
  `userid` int(4) DEFAULT NULL,
  `order_type` varchar(10) DEFAULT NULL,
  `order_qua` int(10) DEFAULT NULL,
  `price_per_unit` float DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `coin` varchar(30) DEFAULT NULL,
  `currency` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ord_usd_id`)
) ENGINE=InnoDB AUTO_INCREMENT=216 DEFAULT CHARSET=utf8;

/*Data for the table `user_req` */

insert  into `user_req`(`ord_usd_id`,`userid`,`order_type`,`order_qua`,`price_per_unit`,`status`,`coin`,`currency`) values 
(214,13,'buy',1,1000,'published','XRP','USD'),
(215,13,'buy',1,122,'published','XRP','USD');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
