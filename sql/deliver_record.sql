-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1:3306
-- 產生時間： 
-- 伺服器版本： 5.7.26
-- PHP 版本： 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `zerg`
--

-- --------------------------------------------------------

--
-- 資料表結構 `deliver_record`
--

DROP TABLE IF EXISTS `deliver_record`;
CREATE TABLE IF NOT EXISTS `deliver_record` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `order_no` varchar(20) NOT NULL COMMENT '交易订单号',
  `comp` varchar(10) NOT NULL COMMENT '快递公司编码',
  `number` varchar(20) NOT NULL COMMENT '快递单号',
  `operator` varchar(10) NOT NULL COMMENT '发货人姓名',
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `number` (`number`),
  KEY `operator` (`operator`),
  KEY `order_no` (`order_no`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
