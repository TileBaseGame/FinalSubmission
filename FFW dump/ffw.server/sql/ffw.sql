/*
SQLyog Ultimate v12.5.0 (64 bit)
MySQL - 5.7.16 : Database - ffw
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ffw` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `ffw`;

/*Table structure for table `t_commander` */

DROP TABLE IF EXISTS `t_commander`;

CREATE TABLE `t_commander` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `image` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `t_commander` */

insert  into `t_commander`(`id`,`name`,`description`,`image`) values 
(1,'commander1','commander 1',NULL),
(2,'commander2','commander 2',NULL);

/*Table structure for table `t_unit` */

DROP TABLE IF EXISTS `t_unit`;

CREATE TABLE `t_unit` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `move` int(11) DEFAULT NULL,
  `basic_attack` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `t_unit` */

insert  into `t_unit`(`id`,`label`,`type`,`description`,`move`,`basic_attack`) values 
(1,'warrior','melee','high health, defense, medium attack',4,1),
(2,'mage','ranged','low health, low defense, high attack',3,5),
(3,'bard','support',NULL,3,3);

/*Table structure for table `t_unit_abilities` */

DROP TABLE IF EXISTS `t_unit_abilities`;

CREATE TABLE `t_unit_abilities` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `unit_id` bigint(20) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `cooldown` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

/*Data for the table `t_unit_abilities` */

insert  into `t_unit_abilities`(`id`,`unit_id`,`name`,`description`,`cooldown`) values 
(1,1,'CHARGE','Charge towards unit, range 3. Usable if adjacent tile to target is unoccupied, does basic attack damage',3),
(2,1,'STUN','Does small damage (10-25% normal attack),  stuns target for one round (they do not get their next turn)',3),
(3,1,'COVER','Take damage instead of an ally until warriors next turn (any number of hits)',0),
(4,1,'BRUTAL BLOW','Do 150% - 200% basic attack damage',2),
(5,1,'POISONED BLADES','50% basic attack damage, 50% attack damage per turn for 3 turns',3),
(6,1,'SLICE AND DICE','Attack for 20% damage 10 times',4),
(7,1,'HARPOON','Range 4, pull opponent unit to empty space in front of warrior. Root for 1 turn, 50% basic attack damage',3),
(8,2,'FIREBALL','Does basic attack damage over a radius of 2 tiles',2),
(9,2,'POISON','Poisons an unit, doing 50% attack damage over 4 turns',2),
(10,2,'TELEPORT','Move to an empty tile within 4 tiles (each height moved upwards counts as .5 of a movement)',3),
(11,2,'ARCANE MISSILES','Each volley does 25% damage',2),
(12,2,'GLACIAL SHARD ','Do 200% damage to single target',4),
(13,3,'MARIONETTE ','Move an allied or enemy unit their move',3),
(14,3,'RESTORITIVE SERONADE','Does 150% attack healing',2),
(15,3,'LAMENT OF FATE','Ally: do 50% more damage for 2 turns; Enemy: do 50% less damage for 2 turns',3),
(16,3,'DIS CHORD','Slows a unit (half movement 2 turns)',3),
(17,3,'VICIOUS MOCKING','Displays an insulting message on screen saying how bad the other player is. Makes other player feel bad about themselves',0);

/*Table structure for table `t_user` */

DROP TABLE IF EXISTS `t_user`;

CREATE TABLE `t_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `passwd` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `t_user` */

insert  into `t_user`(`id`,`email`,`name`,`passwd`) values 
(1,'lily@163.com','lily','123456'),
(2,'joe@gmail.com','joe','123456'),
(3,'goodman@hotmail.com','goodman','good'),
(4,'test@gmail.com','test','t');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
