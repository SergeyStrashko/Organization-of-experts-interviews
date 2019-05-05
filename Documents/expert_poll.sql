-- --------------------------------------------------------
-- Сервер:                       127.0.0.1
-- Версія сервера:               5.5.58-log - MySQL Community Server (GPL)
-- ОС сервера:                   Win64
-- HeidiSQL Версія:              9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for Expert_Poll
CREATE DATABASE IF NOT EXISTS `Expert_Poll` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `Expert_Poll`;

-- Dumping structure for таблиця Expert_Poll.Answer
CREATE TABLE IF NOT EXISTS `Answer` (
  `id_answer` int(10) unsigned NOT NULL,
  `answer` varchar(50) DEFAULT NULL,
  `id_question` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id_answer`),
  KEY `FK_Answer_Question` (`id_question`),
  CONSTRAINT `FK_Answer_Question` FOREIGN KEY (`id_question`) REFERENCES `Question` (`id_question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table Expert_Poll.Answer: ~0 rows (приблизно)
/*!40000 ALTER TABLE `Answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `Answer` ENABLE KEYS */;

-- Dumping structure for таблиця Expert_Poll.Expert
CREATE TABLE IF NOT EXISTS `Expert` (
  `id_expert` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(50) DEFAULT '0',
  `password` varchar(50) DEFAULT '0',
  `email` varchar(50) DEFAULT '0',
  PRIMARY KEY (`id_expert`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table Expert_Poll.Expert: ~0 rows (приблизно)
/*!40000 ALTER TABLE `Expert` DISABLE KEYS */;
/*!40000 ALTER TABLE `Expert` ENABLE KEYS */;

-- Dumping structure for таблиця Expert_Poll.Form
CREATE TABLE IF NOT EXISTS `Form` (
  `id_form` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_form`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table Expert_Poll.Form: ~0 rows (приблизно)
/*!40000 ALTER TABLE `Form` DISABLE KEYS */;
/*!40000 ALTER TABLE `Form` ENABLE KEYS */;

-- Dumping structure for таблиця Expert_Poll.Question
CREATE TABLE IF NOT EXISTS `Question` (
  `id_question` int(10) unsigned NOT NULL,
  `id_form` int(10) unsigned DEFAULT NULL,
  `number` int(10) unsigned DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `question` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_question`),
  KEY `id_form` (`id_form`),
  CONSTRAINT `FK_Question_Form` FOREIGN KEY (`id_form`) REFERENCES `Form` (`id_form`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table Expert_Poll.Question: ~0 rows (приблизно)
/*!40000 ALTER TABLE `Question` DISABLE KEYS */;
/*!40000 ALTER TABLE `Question` ENABLE KEYS */;

-- Dumping structure for таблиця Expert_Poll.Session
CREATE TABLE IF NOT EXISTS `Session` (
  `id_expert` int(10) unsigned DEFAULT NULL,
  `id_form` int(10) unsigned DEFAULT NULL,
  `id_question` int(10) unsigned DEFAULT NULL,
  `id_answer` int(10) unsigned DEFAULT NULL,
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  KEY `id_expert` (`id_expert`),
  KEY `id_form` (`id_form`),
  KEY `id_question` (`id_question`),
  KEY `id_answer` (`id_answer`),
  CONSTRAINT `FK_Session_Expert` FOREIGN KEY (`id_expert`) REFERENCES `Expert` (`id_expert`),
  CONSTRAINT `FK_Session_Form` FOREIGN KEY (`id_form`) REFERENCES `Form` (`id_form`),
  CONSTRAINT `FK_Session_Question` FOREIGN KEY (`id_question`) REFERENCES `Question` (`id_question`),
  CONSTRAINT `FK_Session_Answer` FOREIGN KEY (`id_answer`) REFERENCES `Answer` (`id_answer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table Expert_Poll.Session: ~0 rows (приблизно)
/*!40000 ALTER TABLE `Session` DISABLE KEYS */;
/*!40000 ALTER TABLE `Session` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
