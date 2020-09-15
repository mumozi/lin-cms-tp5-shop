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
-- 資料表結構 `order`
--

DROP TABLE IF EXISTS `order`;
CREATE TABLE IF NOT EXISTS `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_no` varchar(20) NOT NULL COMMENT '订单号',
  `user_id` int(11) NOT NULL COMMENT '外键，用户id，注意并不是openid',
  `delete_time` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `total_price` decimal(6,2) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1:未支付， 2：已支付，3：已发货 , 4: 已支付，但库存不足',
  `snap_img` varchar(255) DEFAULT NULL COMMENT '订单快照图片',
  `snap_name` varchar(80) DEFAULT NULL COMMENT '订单快照名称',
  `total_count` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) DEFAULT NULL,
  `snap_items` text COMMENT '订单其他信息快照（json)',
  `snap_address` varchar(500) DEFAULT NULL COMMENT '地址快照',
  `prepay_id` varchar(100) DEFAULT NULL COMMENT '订单微信支付的预订单id（用于发送模板消息）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_no` (`order_no`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `order`
--

INSERT INTO `order` (`id`, `order_no`, `user_id`, `delete_time`, `create_time`, `total_price`, `status`, `snap_img`, `snap_name`, `total_count`, `update_time`, `snap_items`, `snap_address`, `prepay_id`) VALUES
(1, 'C902910033532723', 58, NULL, 1567391003, '0.02', 3, 'http://qinchenju.com/course/images/product-dryfruit@1.png', '梨花带雨 3个等', 2, 1567391003, '[{\"id\":2,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"main_img_url\":\"http:\\/\\/qinchenju.com\\/course\\/images\\/product-dryfruit@1.png\",\"count\":1,\"totalPrice\":0.01,\"price\":\"0.01\",\"counts\":1},{\"id\":25,\"name\":\"\\u5c0f\\u660e\\u7684\\u5999\\u8106\\u89d2 120\\u514b\",\"main_img_url\":\"http:\\/\\/qinchenju.com\\/course\\/images\\/product-cake@1.png\",\"count\":1,\"totalPrice\":0.01,\"price\":\"0.01\",\"counts\":1}]', '{\"name\":\"\\u6c81\\u5c18\",\"mobile\":\"18824908371\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u6d77\\u73e0\\u533a\",\"detail\":null,\"update_time\":\"1970-01-01 08:00:00\"}', NULL),
(2, 'C902911669242605', 58, NULL, 1567391166, '0.03', 3, 'http://qinchenju.com/course/images/product-tea@1.png', '红袖枸杞 6克*3袋等', 3, 1567391166, '[{\"id\":4,\"name\":\"\\u7ea2\\u8896\\u67b8\\u675e 6\\u514b*3\\u888b\",\"main_img_url\":\"http:\\/\\/qinchenju.com\\/course\\/images\\/product-tea@1.png\",\"count\":1,\"totalPrice\":0.01,\"price\":\"0.01\",\"counts\":1},{\"id\":7,\"name\":\"\\u6ce5\\u84bf \\u534a\\u65a4\",\"main_img_url\":\"http:\\/\\/qinchenju.com\\/course\\/images\\/product-vg@2.png\",\"count\":1,\"totalPrice\":0.01,\"price\":\"0.01\",\"counts\":1},{\"id\":25,\"name\":\"\\u5c0f\\u660e\\u7684\\u5999\\u8106\\u89d2 120\\u514b\",\"main_img_url\":\"http:\\/\\/qinchenju.com\\/course\\/images\\/product-cake@1.png\",\"count\":1,\"totalPrice\":0.01,\"price\":\"0.01\",\"counts\":1}]', '{\"name\":\"\\u6c81\\u5c18\",\"mobile\":\"18824908371\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u6d77\\u73e0\\u533a\",\"detail\":null,\"update_time\":\"1970-01-01 08:00:00\"}', NULL),
(3, 'C902912420904046', 58, NULL, 1567391241, '0.02', 1, 'http://qinchenju.com/course/images/product-dryfruit@7.png', '珍奇异果 3个等', 2, 1567391241, '[{\"id\":12,\"name\":\"\\u73cd\\u5947\\u5f02\\u679c 3\\u4e2a\",\"main_img_url\":\"http:\\/\\/qinchenju.com\\/course\\/images\\/product-dryfruit@7.png\",\"count\":1,\"totalPrice\":0.01,\"price\":\"0.01\",\"counts\":1},{\"id\":14,\"name\":\"\\u829d\\u9ebb 50\\u514b\",\"main_img_url\":\"http:\\/\\/qinchenju.com\\/course\\/images\\/product-rice@3.png\",\"count\":1,\"totalPrice\":0.01,\"price\":\"0.01\",\"counts\":1}]', '{\"name\":\"\\u6c81\\u5c18\",\"mobile\":\"18824908371\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u6d77\\u73e0\\u533a\",\"detail\":null,\"update_time\":\"1970-01-01 08:00:00\"}', NULL),
(4, 'C902913215516356', 58, NULL, 1567391321, '0.03', 2, 'http://qinchenju.com/course/images/product-tea@1.png', '红袖枸杞 6克*3袋等', 3, 1567391321, '[{\"id\":4,\"name\":\"\\u7ea2\\u8896\\u67b8\\u675e 6\\u514b*3\\u888b\",\"main_img_url\":\"http:\\/\\/qinchenju.com\\/course\\/images\\/product-tea@1.png\",\"count\":1,\"totalPrice\":0.01,\"price\":\"0.01\",\"counts\":1},{\"id\":21,\"name\":\"\\u897f\\u6e56\\u9f99\\u4e95 8\\u514b*3\\u888b\",\"main_img_url\":\"http:\\/\\/qinchenju.com\\/course\\/images\\/product-tea@3.png\",\"count\":1,\"totalPrice\":0.01,\"price\":\"0.01\",\"counts\":1},{\"id\":22,\"name\":\"\\u6885\\u5170\\u6e05\\u82b1\\u7cd5 1\\u4e2a\",\"main_img_url\":\"http:\\/\\/qinchenju.com\\/course\\/images\\/product-cake-a@3.png\",\"count\":1,\"totalPrice\":0.01,\"price\":\"0.01\",\"counts\":1}]', '{\"name\":\"\\u6c81\\u5c18\",\"mobile\":\"18824908371\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u6d77\\u73e0\\u533a\",\"detail\":null,\"update_time\":\"1970-01-01 08:00:00\"}', NULL),
(5, 'C902913671736499', 58, NULL, 1567391367, '0.10', 1, 'http://qinchenju.com/course/images/product-tea@2.png', '碧螺春 12克*3袋', 10, 1567391367, '[{\"id\":20,\"name\":\"\\u78a7\\u87ba\\u6625 12\\u514b*3\\u888b\",\"main_img_url\":\"http:\\/\\/qinchenju.com\\/course\\/images\\/product-tea@2.png\",\"count\":10,\"totalPrice\":0.1,\"price\":\"0.01\",\"counts\":10}]', '{\"name\":\"\\u6c81\\u5c18\",\"mobile\":\"18824908371\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u6d77\\u73e0\\u533a\",\"detail\":null,\"update_time\":\"1970-01-01 08:00:00\"}', NULL),
(6, 'C902914156547433', 58, NULL, 1567391415, '0.05', 2, 'http://qinchenju.com/course/images/product-tea@2.png', '碧螺春 12克*3袋', 5, 1567391415, '[{\"id\":20,\"name\":\"\\u78a7\\u87ba\\u6625 12\\u514b*3\\u888b\",\"main_img_url\":\"http:\\/\\/qinchenju.com\\/course\\/images\\/product-tea@2.png\",\"count\":5,\"totalPrice\":0.05,\"price\":\"0.01\",\"counts\":5}]', '{\"name\":\"\\u6c81\\u5c18\",\"mobile\":\"18824908371\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u6d77\\u73e0\\u533a\",\"detail\":null,\"update_time\":\"1970-01-01 08:00:00\"}', NULL),
(7, 'C902914386765474', 58, NULL, 1567391438, '0.03', 1, 'http://qinchenju.com/course/images/product-fry@3.png', '碧水葵花籽 128克等', 3, 1567391438, '[{\"id\":19,\"name\":\"\\u78a7\\u6c34\\u8475\\u82b1\\u7c7d 128\\u514b\",\"main_img_url\":\"http:\\/\\/qinchenju.com\\/course\\/images\\/product-fry@3.png\",\"count\":1,\"totalPrice\":0.01,\"price\":\"0.01\",\"counts\":1},{\"id\":27,\"name\":\"\\u9508\\u8272\\u74dc\\u5b50 100\\u514b\",\"main_img_url\":\"http:\\/\\/qinchenju.com\\/course\\/images\\/product-fry@4.png\",\"count\":1,\"totalPrice\":0.01,\"price\":\"0.01\",\"counts\":1},{\"id\":28,\"name\":\"\\u6625\\u6ce5\\u82b1\\u751f 200\\u514b\",\"main_img_url\":\"http:\\/\\/qinchenju.com\\/course\\/images\\/product-fry@5.png\",\"count\":1,\"totalPrice\":0.01,\"price\":\"0.01\",\"counts\":1}]', '{\"name\":\"\\u6c81\\u5c18\",\"mobile\":\"18824908371\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u6d77\\u73e0\\u533a\",\"detail\":null,\"update_time\":\"1970-01-01 08:00:00\"}', NULL),
(8, 'C902914640332147', 58, NULL, 1567391464, '0.02', 1, 'http://qinchenju.com/course/images/product-vg@4.png', '土豆 半斤等', 2, 1567391464, '[{\"id\":32,\"name\":\"\\u571f\\u8c46 \\u534a\\u65a4\",\"main_img_url\":\"http:\\/\\/qinchenju.com\\/course\\/images\\/product-vg@4.png\",\"count\":1,\"totalPrice\":0.01,\"price\":\"0.01\",\"counts\":1},{\"id\":33,\"name\":\"\\u9752\\u6912 \\u534a\\u65a4\",\"main_img_url\":\"http:\\/\\/qinchenju.com\\/course\\/images\\/product-vg@5.png\",\"count\":1,\"totalPrice\":0.01,\"price\":\"0.01\",\"counts\":1}]', '{\"name\":\"\\u6c81\\u5c18\",\"mobile\":\"18824908371\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u6d77\\u73e0\\u533a\",\"detail\":null,\"update_time\":\"1970-01-01 08:00:00\"}', NULL),
(9, 'C902914838331875', 58, NULL, 1567391483, '0.01', 1, 'http://qinchenju.com/course/images/product-dryfruit@8.png', '红衣青瓜 混搭160克', 1, 1567391483, '[{\"id\":26,\"name\":\"\\u7ea2\\u8863\\u9752\\u74dc \\u6df7\\u642d160\\u514b\",\"main_img_url\":\"http:\\/\\/qinchenju.com\\/course\\/images\\/product-dryfruit@8.png\",\"count\":1,\"totalPrice\":0.01,\"price\":\"0.01\",\"counts\":1}]', '{\"name\":\"\\u6c81\\u5c18\",\"mobile\":\"18824908371\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u6d77\\u73e0\\u533a\",\"detail\":null,\"update_time\":\"1970-01-01 08:00:00\"}', NULL),
(10, 'C902915087752933', 58, NULL, 1567391508, '0.05', 1, 'http://qinchenju.com/course/images/product-dryfruit-a@6.png', '贵妃笑 100克等', 5, 1567391508, '[{\"id\":11,\"name\":\"\\u8d35\\u5983\\u7b11 100\\u514b\",\"main_img_url\":\"http:\\/\\/qinchenju.com\\/course\\/images\\/product-dryfruit-a@6.png\",\"count\":1,\"totalPrice\":0.01,\"price\":\"0.01\",\"counts\":1},{\"id\":26,\"name\":\"\\u7ea2\\u8863\\u9752\\u74dc \\u6df7\\u642d160\\u514b\",\"main_img_url\":\"http:\\/\\/qinchenju.com\\/course\\/images\\/product-dryfruit@8.png\",\"count\":4,\"totalPrice\":0.04,\"price\":\"0.01\",\"counts\":4}]', '{\"name\":\"\\u6c81\\u5c18\",\"mobile\":\"18824908371\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u6d77\\u73e0\\u533a\",\"detail\":null,\"update_time\":\"1970-01-01 08:00:00\"}', NULL),
(11, 'C902915201508540', 58, NULL, 1567391520, '0.01', 2, 'http://qinchenju.com/course/images/product-dryfruit@5.png', '万紫千凤梨 300克', 1, 1567391520, '[{\"id\":10,\"name\":\"\\u4e07\\u7d2b\\u5343\\u51e4\\u68a8 300\\u514b\",\"main_img_url\":\"http:\\/\\/qinchenju.com\\/course\\/images\\/product-dryfruit@5.png\",\"count\":1,\"totalPrice\":0.01,\"price\":\"0.01\",\"counts\":1}]', '{\"name\":\"\\u6c81\\u5c18\",\"mobile\":\"18824908371\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u6d77\\u73e0\\u533a\",\"detail\":null,\"update_time\":\"1970-01-01 08:00:00\"}', NULL),
(12, 'C902915332158698', 58, NULL, 1567391533, '0.01', 1, 'http://qinchenju.com/course/images/product-dryfruit@4.png', '冬木红枣 500克', 1, 1567391533, '[{\"id\":9,\"name\":\"\\u51ac\\u6728\\u7ea2\\u67a3 500\\u514b\",\"main_img_url\":\"http:\\/\\/qinchenju.com\\/course\\/images\\/product-dryfruit@4.png\",\"count\":1,\"totalPrice\":0.01,\"price\":\"0.01\",\"counts\":1}]', '{\"name\":\"\\u6c81\\u5c18\",\"mobile\":\"18824908371\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u6d77\\u73e0\\u533a\",\"detail\":null,\"update_time\":\"1970-01-01 08:00:00\"}', NULL),
(13, 'C902915517026718', 58, NULL, 1567391551, '0.01', 1, 'http://qinchenju.com/course/images/product-dryfruit@4.png', '冬木红枣 500克', 1, 1567391551, '[{\"id\":9,\"name\":\"\\u51ac\\u6728\\u7ea2\\u67a3 500\\u514b\",\"main_img_url\":\"http:\\/\\/qinchenju.com\\/course\\/images\\/product-dryfruit@4.png\",\"count\":1,\"totalPrice\":0.01,\"price\":\"0.01\",\"counts\":1}]', '{\"name\":\"\\u6c81\\u5c18\",\"mobile\":\"18824908371\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u6d77\\u73e0\\u533a\",\"detail\":null,\"update_time\":\"1970-01-01 08:00:00\"}', NULL),
(14, 'C902915631429399', 58, NULL, 1567391563, '0.01', 3, 'http://qinchenju.com/course/images/product-dryfruit@3.png', '夏日芒果 3个', 1, 1567391563, '[{\"id\":8,\"name\":\"\\u590f\\u65e5\\u8292\\u679c 3\\u4e2a\",\"main_img_url\":\"http:\\/\\/qinchenju.com\\/course\\/images\\/product-dryfruit@3.png\",\"count\":1,\"totalPrice\":0.01,\"price\":\"0.01\",\"counts\":1}]', '{\"name\":\"\\u6c81\\u5c18\",\"mobile\":\"18824908371\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u6d77\\u73e0\\u533a\",\"detail\":null,\"update_time\":\"1970-01-01 08:00:00\"}', NULL),
(15, 'C902915748696636', 58, NULL, 1567391574, '0.01', 1, 'http://qinchenju.com/course/images/product-dryfruit@2.png', '春生龙眼 500克', 1, 1567391574, '[{\"id\":5,\"name\":\"\\u6625\\u751f\\u9f99\\u773c 500\\u514b\",\"main_img_url\":\"http:\\/\\/qinchenju.com\\/course\\/images\\/product-dryfruit@2.png\",\"count\":1,\"totalPrice\":0.01,\"price\":\"0.01\",\"counts\":1}]', '{\"name\":\"\\u6c81\\u5c18\",\"mobile\":\"18824908371\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u6d77\\u73e0\\u533a\",\"detail\":null,\"update_time\":\"1970-01-01 08:00:00\"}', NULL),
(16, 'C902915874689080', 58, NULL, 1567391587, '0.01', 1, 'http://qinchenju.com/course/images/product-dryfruit@2.png', '春生龙眼 500克', 1, 1567391587, '[{\"id\":5,\"name\":\"\\u6625\\u751f\\u9f99\\u773c 500\\u514b\",\"main_img_url\":\"http:\\/\\/qinchenju.com\\/course\\/images\\/product-dryfruit@2.png\",\"count\":1,\"totalPrice\":0.01,\"price\":\"0.01\",\"counts\":1}]', '{\"name\":\"\\u6c81\\u5c18\",\"mobile\":\"18824908371\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u6d77\\u73e0\\u533a\",\"detail\":null,\"update_time\":\"1970-01-01 08:00:00\"}', NULL),
(17, 'C902203104786342', 62, NULL, 1567420310, '0.02', 2, 'http://qinchenju.com/course/images/product-dryfruit@1.png', '梨花带雨 3个等', 2, 1567420310, '[{\"id\":2,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"main_img_url\":\"http:\\/\\/qinchenju.com\\/course\\/images\\/product-dryfruit@1.png\",\"count\":1,\"totalPrice\":0.01,\"price\":\"0.01\",\"counts\":1},{\"id\":15,\"name\":\"\\u7334\\u5934\\u83c7 370\\u514b\",\"main_img_url\":\"http:\\/\\/qinchenju.com\\/course\\/images\\/product-rice@4.png\",\"count\":1,\"totalPrice\":0.01,\"price\":\"0.01\",\"counts\":1}]', '{\"name\":\"\\u6c81\\u96ea\",\"mobile\":\"18824908020\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u6d77\\u73e0\\u533a\",\"detail\":\"\\u70df\\u96e8\\u8def9\\u53f7\",\"update_time\":\"1970-01-01 08:00:00\"}', NULL),
(18, 'C903905945547703', 62, NULL, 1567490594, '0.03', 1, 'http://qinchenju.com/course/images/product-dryfruit@1.png', '梨花带雨 3个等', 3, 1567490594, '[{\"id\":2,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"main_img_url\":\"http:\\/\\/qinchenju.com\\/course\\/images\\/product-dryfruit@1.png\",\"count\":1,\"totalPrice\":0.01,\"price\":\"0.01\",\"counts\":1},{\"id\":9,\"name\":\"\\u51ac\\u6728\\u7ea2\\u67a3 500\\u514b\",\"main_img_url\":\"http:\\/\\/qinchenju.com\\/course\\/images\\/product-dryfruit@4.png\",\"count\":1,\"totalPrice\":0.01,\"price\":\"0.01\",\"counts\":1},{\"id\":15,\"name\":\"\\u7334\\u5934\\u83c7 370\\u514b\",\"main_img_url\":\"http:\\/\\/qinchenju.com\\/course\\/images\\/product-rice@4.png\",\"count\":1,\"totalPrice\":0.01,\"price\":\"0.01\",\"counts\":1}]', '{\"name\":\"\\u6c81\\u96ea\",\"mobile\":\"18824908020\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u6d77\\u73e0\\u533a\",\"detail\":\"\\u70df\\u96e8\\u8def9\\u53f7\",\"update_time\":\"1970-01-01 08:00:00\"}', NULL),
(19, 'C903906634023384', 62, NULL, 1567490663, '0.02', 1, 'http://qinchenju.com/course/images/product-rice@2.png', '绿豆 125克等', 2, 1567490663, '[{\"id\":13,\"name\":\"\\u7eff\\u8c46 125\\u514b\",\"main_img_url\":\"http:\\/\\/qinchenju.com\\/course\\/images\\/product-rice@2.png\",\"count\":1,\"totalPrice\":0.01,\"price\":\"0.01\",\"counts\":1},{\"id\":14,\"name\":\"\\u829d\\u9ebb 50\\u514b\",\"main_img_url\":\"http:\\/\\/qinchenju.com\\/course\\/images\\/product-rice@3.png\",\"count\":1,\"totalPrice\":0.01,\"price\":\"0.01\",\"counts\":1}]', '{\"name\":\"\\u6c81\\u96ea\",\"mobile\":\"18824908020\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u6d77\\u73e0\\u533a\",\"detail\":\"\\u70df\\u96e8\\u8def9\\u53f7\",\"update_time\":\"1970-01-01 08:00:00\"}', NULL),
(20, 'C903906920662485', 62, NULL, 1567490692, '0.02', 4, 'http://qinchenju.com/course/images/product-tea@1.png', '红袖枸杞 6克*3袋等', 2, 1567490692, '[{\"id\":4,\"name\":\"\\u7ea2\\u8896\\u67b8\\u675e 6\\u514b*3\\u888b\",\"main_img_url\":\"http:\\/\\/qinchenju.com\\/course\\/images\\/product-tea@1.png\",\"count\":1,\"totalPrice\":0.01,\"price\":\"0.01\",\"counts\":1},{\"id\":6,\"name\":\"\\u5c0f\\u7ea2\\u7684\\u732a\\u8033\\u6735 120\\u514b\",\"main_img_url\":\"http:\\/\\/qinchenju.com\\/course\\/images\\/product-cake@2.png\",\"count\":1,\"totalPrice\":0.01,\"price\":\"0.01\",\"counts\":1}]', '{\"name\":\"\\u6c81\\u96ea\",\"mobile\":\"18824908020\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u6d77\\u73e0\\u533a\",\"detail\":\"\\u70df\\u96e8\\u8def9\\u53f7\",\"update_time\":\"1970-01-01 08:00:00\"}', NULL);

-- --------------------------------------------------------

--
-- 資料表結構 `order_product`
--

DROP TABLE IF EXISTS `order_product`;
CREATE TABLE IF NOT EXISTS `order_product` (
  `order_id` int(11) NOT NULL COMMENT '联合主键，订单id',
  `product_id` int(11) NOT NULL COMMENT '联合主键，商品id',
  `count` int(11) NOT NULL COMMENT '商品数量',
  `delete_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`product_id`,`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `order_product`
--

INSERT INTO `order_product` (`order_id`, `product_id`, `count`, `delete_time`, `update_time`) VALUES
(1, 2, 1, NULL, NULL),
(17, 2, 1, NULL, NULL),
(18, 2, 1, NULL, NULL),
(2, 4, 1, NULL, NULL),
(4, 4, 1, NULL, NULL),
(20, 4, 1, NULL, NULL),
(15, 5, 1, NULL, NULL),
(16, 5, 1, NULL, NULL),
(20, 6, 1, NULL, NULL),
(2, 7, 1, NULL, NULL),
(14, 8, 1, NULL, NULL),
(12, 9, 1, NULL, NULL),
(13, 9, 1, NULL, NULL),
(18, 9, 1, NULL, NULL),
(11, 10, 1, NULL, NULL),
(10, 11, 4, NULL, NULL),
(3, 12, 1, NULL, NULL),
(19, 13, 1, NULL, NULL),
(3, 14, 1, NULL, NULL),
(19, 14, 1, NULL, NULL),
(17, 15, 1, NULL, NULL),
(18, 15, 1, NULL, NULL),
(7, 19, 1, NULL, NULL),
(5, 20, 10, NULL, NULL),
(6, 20, 5, NULL, NULL),
(4, 21, 1, NULL, NULL),
(4, 22, 1, NULL, NULL),
(1, 25, 1, NULL, NULL),
(2, 25, 1, NULL, NULL),
(9, 26, 1, NULL, NULL),
(10, 26, 1, NULL, NULL),
(7, 27, 1, NULL, NULL),
(7, 28, 1, NULL, NULL),
(8, 32, 1, NULL, NULL),
(8, 33, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- 資料表結構 `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(50) NOT NULL,
  `nickname` varchar(50) DEFAULT NULL,
  `extend` varchar(255) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL COMMENT '注册时间',
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `openid` (`openid`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `user`
--

INSERT INTO `user` (`id`, `openid`, `nickname`, `extend`, `delete_time`, `create_time`, `update_time`) VALUES
(58, 'o5r750LTt0qTddYCQ8BbkjnQqIoE', '沁尘', 'https://wx.qlogo.cn/mmopen/vi_32/o42RgcY9XQSk1osWiaic1N3CfJTSwMPwOmNibKr22FZ2TiaA7qe1EgSKkaaADltum7EcbAtmzQGxGHaLzdqmfTf2HA/132', NULL, 1561656004, 1561656004),
(59, 'o5r750LTt0qTddYCQ8BbkjnQqIoA', '沁芸', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJrCYh7AraxkSCovXg0lHGkxL2SIo8G3Y8Vzjchh9LbWgKibiaxqIzXaZLnMKrHV6dZGceUcdlWDKUQ/132', NULL, 1561656050, 1561656050),
(61, 'o5r750LTt0qTddYCQ8BbkjnQqIoB', '沁阳', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKEkJNtEdYa6w51kIreKTEMcG6UWnAT1azGlvFVtVDjFWMF7v3dHpAB4LNGqMicTCRic9llX4pk0I5Q/132', NULL, 1561656104, 1561656104),
(62, 'o5r750FwecqLkQQ0oTtuSOA18QEY', '沁雪', NULL, NULL, 1567420116, 1567420116);

-- --------------------------------------------------------

--
-- 資料表結構 `user_address`
--

DROP TABLE IF EXISTS `user_address`;
CREATE TABLE IF NOT EXISTS `user_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL COMMENT '收获人姓名',
  `mobile` varchar(20) NOT NULL COMMENT '手机号',
  `province` varchar(20) DEFAULT NULL COMMENT '省',
  `city` varchar(20) DEFAULT NULL COMMENT '市',
  `country` varchar(20) DEFAULT NULL COMMENT '区',
  `detail` varchar(100) DEFAULT NULL COMMENT '详细地址',
  `delete_time` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL COMMENT '外键',
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `user_address`
--

INSERT INTO `user_address` (`id`, `name`, `mobile`, `province`, `city`, `country`, `detail`, `delete_time`, `user_id`, `update_time`) VALUES
(1, '沁尘', '18824908371', '广东省', '广州市', '海珠区', '烟雨路7号', NULL, 58, NULL),
(2, '沁芸', '18824908330', '广东省', '广州市', '海珠区', '烟雨路8号', NULL, 59, NULL),
(4, '沁阳', '18824908320', '广东省', '广州市', '海珠区', '烟雨路9号', NULL, 61, NULL),
(5, '沁雪', '18824908020', '广东省', '广州市', '海珠区', '烟雨路9号', NULL, 62, NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
