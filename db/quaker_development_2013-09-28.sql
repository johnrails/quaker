# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.6.14)
# Database: quaker_development
# Generation Time: 2013-09-28 21:05:03 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table us_states
# ------------------------------------------------------------

DROP TABLE IF EXISTS `us_states`;

CREATE TABLE `us_states` (
  `state_code` varchar(2) NOT NULL,
  `state_abbrev` varchar(2) NOT NULL,
  `state_full` varchar(30) NOT NULL,
  `state_long` varchar(48) NOT NULL,
  `country_abbrev` varchar(2) NOT NULL,
  `country_name` varchar(30) NOT NULL,
  PRIMARY KEY (`state_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `us_states` WRITE;
/*!40000 ALTER TABLE `us_states` DISABLE KEYS */;

INSERT INTO `us_states` (`state_code`, `state_abbrev`, `state_full`, `state_long`, `country_abbrev`, `country_name`)
VALUES
	('01','AL','Alabama','State of Alabama','US','United States'),
	('02','AK','Alaska','State of Alaska','US','United States'),
	('04','AZ','Arizona','State of Arizona','US','United States'),
	('05','AR','Arkansas','State of Arkansas','US','United States'),
	('06','CA','California','State of California','US','United States'),
	('08','CO','Colorado','State of Colorado','US','United States'),
	('09','CT','Connecticut','State of Connecticut','US','United States'),
	('10','DE','Delaware','State of Delaware','US','United States'),
	('11','DC','District of Columbia','District of Columbia','US','United States'),
	('12','FL','Florida','State of Florida','US','United States'),
	('13','GA','Georgia','State of Georgia','US','United States'),
	('15','HI','Hawaii','State of Hawaii','US','United States'),
	('16','ID','Idaho','State of Idaho','US','United States'),
	('17','IL','Illinois','State of Illinois','US','United States'),
	('18','IN','Indiana','State of Indiana','US','United States'),
	('19','IA','Iowa','State of Iowa','US','United States'),
	('20','KS','Kansas','State of Kansas','US','United States'),
	('21','KY','Kentucky','Commonwealth of Kentucky','US','United States'),
	('22','LA','Louisiana','State of Louisiana','US','United States'),
	('23','ME','Maine','State of Maine','US','United States'),
	('24','MD','Maryland','State of Maryland','US','United States'),
	('25','MA','Massachusetts','Commonwealth of Massachusetts','US','United States'),
	('26','MI','Michigan','State of Michigan','US','United States'),
	('27','MN','Minnesota','State of Minnesota','US','United States'),
	('28','MS','Mississippi','State of Mississippi','US','United States'),
	('29','MO','Missouri','State of Missouri','US','United States'),
	('30','MT','Montana','State of Montana','US','United States'),
	('31','NE','Nebraska','State of Nebraska','US','United States'),
	('32','NV','Nevada','State of Nevada','US','United States'),
	('33','NH','New Hampshire','State of New Hampshire','US','United States'),
	('34','NJ','New Jersey','State of New Jersey','US','United States'),
	('35','NM','New Mexico','State of New Mexico','US','United States'),
	('36','NY','New York','State of New York','US','United States'),
	('37','NC','North Carolina','State of North Carolina','US','United States'),
	('38','ND','North Dakota','State of North Dakota','US','United States'),
	('39','OH','Ohio','State of Ohio','US','United States'),
	('40','OK','Oklahoma','State of Oklahoma','US','United States'),
	('41','OR','Oregon','State of Oregon','US','United States'),
	('42','PA','Pennsylvania','Commonwealth of Pennsylvania','US','United States'),
	('44','RI','Rhode Island','State of Rhode Island and Providence Plantations','US','United States'),
	('45','SC','South Carolina','State of South Carolina','US','United States'),
	('46','SD','South Dakota','State of South Dakota','US','United States'),
	('47','TN','Tennessee','State of Tennessee','US','United States'),
	('48','TX','Texas','State of Texas','US','United States'),
	('49','UT','Utah','State of Utah','US','United States'),
	('50','VT','Vermont','State of Vermont','US','United States'),
	('51','VA','Virginia','Commonwealth of Virginia','US','United States'),
	('53','WA','Washington','State of Washington','US','United States'),
	('54','WV','West Virginia','State of West Virginia','US','United States'),
	('55','WI','Wisconsin','State of Wisconsin','US','United States'),
	('56','WY','Wyoming','State of Wyoming','US','United States'),
	('60','AS','American Samoa','Territory of American Samoa','US','United States'),
	('64','FM','Federated States of Micronesia','Federated States of Micronesia','FM','Federated States of Micronesia'),
	('66','GU','Guam','Territory of Guam','US','United States'),
	('68','MH','Marshall Islands','Republic of the Marshall Islands','RM','Marshall Islands'),
	('69','MP','Northern Mariana Islands','Commonwealth of the Northern Mariana Islands','US','United States'),
	('70','PW','Republic of Palau','Republic of Palau','PS','Republic of Palau'),
	('72','PR','Puerto Rico','Commonwealth of Puerto Rico','US','United States'),
	('74','UM','U.S. Minor Outlying Islands','United States Minor Outlying Islands','US','United States'),
	('78','VI','Virgin Islands','United States Virgin Islands','US','United States');

/*!40000 ALTER TABLE `us_states` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
