-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2020-03-04 08:24:32
-- 服务器版本： 10.1.13-MariaDB
-- PHP Version: 5.6.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `zxkf`
--
CREATE DATABASE IF NOT EXISTS `zxkf` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `zxkf`;

-- --------------------------------------------------------

--
-- 表的结构 `zxkf_carousel`
--

DROP TABLE IF EXISTS `zxkf_carousel`;
CREATE TABLE IF NOT EXISTS `zxkf_carousel` (
  `pid` int(11) NOT NULL COMMENT '轮播图图片id',
  `purl` varchar(512) DEFAULT NULL COMMENT '轮播图图片url'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 插入之前先把表清空（truncate） `zxkf_carousel`
--

TRUNCATE TABLE `zxkf_carousel`;
--
-- 转存表中的数据 `zxkf_carousel`
--

INSERT INTO `zxkf_carousel` (`pid`, `purl`) VALUES(1, '');

-- --------------------------------------------------------

--
-- 表的结构 `zxkf_collect`
--

DROP TABLE IF EXISTS `zxkf_collect`;
CREATE TABLE IF NOT EXISTS `zxkf_collect` (
  `cid` int(11) NOT NULL COMMENT '收藏房屋id',
  `userid` int(11) DEFAULT NULL COMMENT '用户id',
  `plistid` int(11) DEFAULT NULL COMMENT '对应的房屋列表的id',
  `cdate` bigint(20) DEFAULT NULL COMMENT '收藏时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 插入之前先把表清空（truncate） `zxkf_collect`
--

TRUNCATE TABLE `zxkf_collect`;
--
-- 转存表中的数据 `zxkf_collect`
--

INSERT INTO `zxkf_collect` (`cid`, `userid`, `plistid`, `cdate`) VALUES(1, 1, 1, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `zxkf_login`
--

DROP TABLE IF EXISTS `zxkf_login`;
CREATE TABLE IF NOT EXISTS `zxkf_login` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(32) DEFAULT NULL COMMENT '用户注册姓名',
  `upwd` varchar(128) DEFAULT NULL COMMENT '注册密码',
  `email` varchar(64) DEFAULT NULL COMMENT '注册邮箱',
  `phone` varchar(16) DEFAULT NULL COMMENT '注册电话',
  `avatar` varchar(128) DEFAULT NULL COMMENT '用户头像',
  `user_name` varchar(32) DEFAULT NULL COMMENT '用户昵称',
  `gender` tinyint(4) DEFAULT NULL COMMENT '用户性别',
  `searchHistory` varchar(255) DEFAULT NULL COMMENT '搜索历史记录',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

--
-- 插入之前先把表清空（truncate） `zxkf_login`
--

TRUNCATE TABLE `zxkf_login`;
--
-- 转存表中的数据 `zxkf_login`
--

INSERT INTO `zxkf_login` (`uid`, `uname`, `upwd`, `email`, `phone`, `avatar`, `user_name`, `gender`, `searchHistory`) VALUES(5, 'admin', '123456', 'jack@qq.com', '18309225865', 'http://127.0.0.1:3000/profile.jpg', '天天', 1, NULL);
INSERT INTO `zxkf_login` (`uid`, `uname`, `upwd`, `email`, `phone`, `avatar`, `user_name`, `gender`, `searchHistory`) VALUES(8, 'tian', '123456', 'tian@qq.com', '18309225861', 'http://127.0.0.1:3000/202003041515_24.jpeg', '天天', 1, '雁塔2,雁塔2,雁塔1');
INSERT INTO `zxkf_login` (`uid`, `uname`, `upwd`, `email`, `phone`, `avatar`, `user_name`, `gender`, `searchHistory`) VALUES(14, NULL, '123456', NULL, '18309225864', 'http://127.0.0.1:3000/profile.jpg', NULL, NULL, NULL);
INSERT INTO `zxkf_login` (`uid`, `uname`, `upwd`, `email`, `phone`, `avatar`, `user_name`, `gender`, `searchHistory`) VALUES(15, NULL, '123456', NULL, '18309225862', 'http://127.0.0.1:3000/profile.jpg', NULL, NULL, '雁塔7,雁塔9,雁塔4');
INSERT INTO `zxkf_login` (`uid`, `uname`, `upwd`, `email`, `phone`, `avatar`, `user_name`, `gender`, `searchHistory`) VALUES(16, NULL, '123456', NULL, '18309225863', 'http://127.0.0.1:3000/profile.jpg', NULL, NULL, NULL);
INSERT INTO `zxkf_login` (`uid`, `uname`, `upwd`, `email`, `phone`, `avatar`, `user_name`, `gender`, `searchHistory`) VALUES(17, NULL, '123456', NULL, '18309225866', 'http://127.0.0.1:3000/202003041516_40.jpeg', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `zxkf_orderlist`
--

DROP TABLE IF EXISTS `zxkf_orderlist`;
CREATE TABLE IF NOT EXISTS `zxkf_orderlist` (
  `oid` int(11) NOT NULL COMMENT '预约id',
  `userid` int(11) DEFAULT NULL COMMENT '用户id',
  `plistid` int(11) DEFAULT NULL COMMENT '预约的房屋所在的房屋列表的id',
  `odate` bigint(20) DEFAULT NULL COMMENT '预约时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 插入之前先把表清空（truncate） `zxkf_orderlist`
--

TRUNCATE TABLE `zxkf_orderlist`;
--
-- 转存表中的数据 `zxkf_orderlist`
--

INSERT INTO `zxkf_orderlist` (`oid`, `userid`, `plistid`, `odate`) VALUES(1, 1, 1, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `zxkf_product_details`
--

DROP TABLE IF EXISTS `zxkf_product_details`;
CREATE TABLE IF NOT EXISTS `zxkf_product_details` (
  `did` int(11) NOT NULL,
  `bed` tinyint(4) DEFAULT NULL,
  `closet` tinyint(4) DEFAULT NULL,
  `writetable` tinyint(4) DEFAULT NULL,
  `sofa` tinyint(4) DEFAULT NULL,
  `tv` tinyint(4) DEFAULT NULL,
  `kitchen` tinyint(4) DEFAULT NULL,
  `toilet` tinyint(4) DEFAULT NULL,
  `aircondition` tinyint(4) DEFAULT NULL,
  `onlyrestroom` tinyint(4) DEFAULT NULL,
  `notfirstfloor` tinyint(4) DEFAULT NULL,
  `refrigerator` tinyint(4) DEFAULT NULL,
  `nearsubway` tinyint(4) DEFAULT NULL,
  `elevatorrome` tinyint(4) DEFAULT NULL,
  `fid` int(11) DEFAULT NULL,
  `newpublish` tinyint(4) NOT NULL COMMENT '新上架：1 非新上架：0',
  `paymonth` tinyint(4) NOT NULL COMMENT '租金月付',
  `imgurl` varchar(255) NOT NULL COMMENT '房屋图片',
  `address` char(64) DEFAULT NULL COMMENT '商品标题+地址',
  `housesize` smallint(255) NOT NULL COMMENT '房间面积',
  `floor` smallint(255) NOT NULL COMMENT '房间楼层',
  `price` varchar(10) NOT NULL COMMENT '房屋租金'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 插入之前先把表清空（truncate） `zxkf_product_details`
--

TRUNCATE TABLE `zxkf_product_details`;
--
-- 转存表中的数据 `zxkf_product_details`
--

INSERT INTO `zxkf_product_details` (`did`, `bed`, `closet`, `writetable`, `sofa`, `tv`, `kitchen`, `toilet`, `aircondition`, `onlyrestroom`, `notfirstfloor`, `refrigerator`, `nearsubway`, `elevatorrome`, `fid`, `newpublish`, `paymonth`, `imgurl`, `address`, `housesize`, `floor`, `price`) VALUES(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 4, 1, 1, './img/like/like1.png', '西安雁塔太白南路', 15, 10, '1200');
INSERT INTO `zxkf_product_details` (`did`, `bed`, `closet`, `writetable`, `sofa`, `tv`, `kitchen`, `toilet`, `aircondition`, `onlyrestroom`, `notfirstfloor`, `refrigerator`, `nearsubway`, `elevatorrome`, `fid`, `newpublish`, `paymonth`, `imgurl`, `address`, `housesize`, `floor`, `price`) VALUES(2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 5, 1, 0, './img/like/like4.png', '高新区 高新一路', 15, 10, '1200');
INSERT INTO `zxkf_product_details` (`did`, `bed`, `closet`, `writetable`, `sofa`, `tv`, `kitchen`, `toilet`, `aircondition`, `onlyrestroom`, `notfirstfloor`, `refrigerator`, `nearsubway`, `elevatorrome`, `fid`, `newpublish`, `paymonth`, `imgurl`, `address`, `housesize`, `floor`, `price`) VALUES(3, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 6, 1, 0, './img/like/like3.png', '高新区 高新一路科技一路十字', 15, 10, '1200');
INSERT INTO `zxkf_product_details` (`did`, `bed`, `closet`, `writetable`, `sofa`, `tv`, `kitchen`, `toilet`, `aircondition`, `onlyrestroom`, `notfirstfloor`, `refrigerator`, `nearsubway`, `elevatorrome`, `fid`, `newpublish`, `paymonth`, `imgurl`, `address`, `housesize`, `floor`, `price`) VALUES(4, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 7, 0, 0, './img/like/like2.png', '高新区 高新一路科技一路十字', 15, 10, '1200');
INSERT INTO `zxkf_product_details` (`did`, `bed`, `closet`, `writetable`, `sofa`, `tv`, `kitchen`, `toilet`, `aircondition`, `onlyrestroom`, `notfirstfloor`, `refrigerator`, `nearsubway`, `elevatorrome`, `fid`, `newpublish`, `paymonth`, `imgurl`, `address`, `housesize`, `floor`, `price`) VALUES(5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 8, 1, 0, './img/like/like5.png', '雁塔区 锦业路 锦业五街', 25, 8, '2000');

-- --------------------------------------------------------

--
-- 表的结构 `zxkf_product_list`
--

DROP TABLE IF EXISTS `zxkf_product_list`;
CREATE TABLE IF NOT EXISTS `zxkf_product_list` (
  `pid` int(11) NOT NULL COMMENT '商品id',
  `title` tinyint(4) DEFAULT NULL COMMENT '是否合租1：整租 0：合租',
  `address` char(64) DEFAULT NULL COMMENT '商品标题+地址',
  `price` int(6) DEFAULT NULL COMMENT '月租',
  `housesize` char(6) DEFAULT NULL COMMENT '房间大小',
  `floor` char(8) DEFAULT NULL COMMENT '楼层',
  `houselayout` char(10) DEFAULT NULL COMMENT '房间布局',
  `imgurl` varchar(255) DEFAULT NULL COMMENT '房间图片路径',
  `renttype` tinyint(4) DEFAULT NULL COMMENT '整租：1； 合租：0',
  `citybelong` varchar(16) NOT NULL COMMENT '房屋所属城市',
  `annoucement` varchar(32) NOT NULL COMMENT '广告',
  `liverandom` varchar(8) NOT NULL COMMENT '随时入住'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 插入之前先把表清空（truncate） `zxkf_product_list`
--

TRUNCATE TABLE `zxkf_product_list`;
--
-- 转存表中的数据 `zxkf_product_list`
--

INSERT INTO `zxkf_product_list` (`pid`, `title`, `address`, `price`, `housesize`, `floor`, `houselayout`, `imgurl`, `renttype`, `citybelong`, `annoucement`, `liverandom`) VALUES(1, 1, '西安雁塔太白南路', 9999, '999M2', '32/40层', '1室1厅1卫1厨', './img/like/like3.png', 1, '西安', '水电煤网费涨就赔', '随时入住');
INSERT INTO `zxkf_product_list` (`pid`, `title`, `address`, `price`, `housesize`, `floor`, `houselayout`, `imgurl`, `renttype`, `citybelong`, `annoucement`, `liverandom`) VALUES(4, 2, '西安雁塔太白南路', 9999, '999', '32/40层', '1室1厅1卫1厨', './img/like/like1.png', 0, '西安', '水电煤网费涨就赔', '随时入住');
INSERT INTO `zxkf_product_list` (`pid`, `title`, `address`, `price`, `housesize`, `floor`, `houselayout`, `imgurl`, `renttype`, `citybelong`, `annoucement`, `liverandom`) VALUES(5, 3, '高新区 高新一路', 2000, '96', '3', '2室1厅1卫', './img/like/like2.png', 0, '西安', '水电煤网费涨就赔', '随时入住');
INSERT INTO `zxkf_product_list` (`pid`, `title`, `address`, `price`, `housesize`, `floor`, `houselayout`, `imgurl`, `renttype`, `citybelong`, `annoucement`, `liverandom`) VALUES(6, 0, '高新区 高新一路科技一路十字', 2000, '100', '4', '1室1厅1卫', './img/like/like3.png', 1, '西安', '水电煤网费涨就赔', '随时入住');
INSERT INTO `zxkf_product_list` (`pid`, `title`, `address`, `price`, `housesize`, `floor`, `houselayout`, `imgurl`, `renttype`, `citybelong`, `annoucement`, `liverandom`) VALUES(7, 0, '高新区 高新一路科技一路十字', 2000, '100', '7', '1室1厅1卫', './img/like/like4.png', 1, '西安', '水电煤网费涨就赔', '随时入住');
INSERT INTO `zxkf_product_list` (`pid`, `title`, `address`, `price`, `housesize`, `floor`, `houselayout`, `imgurl`, `renttype`, `citybelong`, `annoucement`, `liverandom`) VALUES(8, 0, '雁塔区 锦业路 锦业五街', 2300, '88', '8', '5室1厅1厨', './img/like/like5.png', 0, '西安', '干净、舒适，欢迎入住', '随时入住');

-- --------------------------------------------------------

--
-- 表的结构 `zxkf_recommend`
--

DROP TABLE IF EXISTS `zxkf_recommend`;
CREATE TABLE IF NOT EXISTS `zxkf_recommend` (
  `rid` int(11) NOT NULL COMMENT '推荐房屋的id',
  `userid` int(11) DEFAULT NULL COMMENT '推荐的用户的id',
  `plistid` int(11) DEFAULT NULL COMMENT '推荐的房屋所在的房屋列表id',
  `rdate` bigint(20) DEFAULT NULL COMMENT '推荐日期'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 插入之前先把表清空（truncate） `zxkf_recommend`
--

TRUNCATE TABLE `zxkf_recommend`;
--
-- 转存表中的数据 `zxkf_recommend`
--

INSERT INTO `zxkf_recommend` (`rid`, `userid`, `plistid`, `rdate`) VALUES(1, 1, 1, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `zxkf_roommate`
--

DROP TABLE IF EXISTS `zxkf_roommate`;
CREATE TABLE IF NOT EXISTS `zxkf_roommate` (
  `rid` int(11) NOT NULL,
  `img` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `address` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `price` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `type` varchar(16) CHARACTER SET utf8 DEFAULT NULL,
  `getset` varchar(128) CHARACTER SET utf8 DEFAULT NULL,
  `date` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `ditie` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `newDate` varchar(32) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 插入之前先把表清空（truncate） `zxkf_roommate`
--

TRUNCATE TABLE `zxkf_roommate`;
--
-- 转存表中的数据 `zxkf_roommate`
--

INSERT INTO `zxkf_roommate` (`rid`, `img`, `address`, `price`, `type`, `getset`, `date`, `ditie`, `newDate`) VALUES(1, './img/roomate/01.jpg', '太白南路', '2200 ', '整租', '限男', '2019.02.12', '1号地铁', '2019.09.18');
INSERT INTO `zxkf_roommate` (`rid`, `img`, `address`, `price`, `type`, `getset`, `date`, `ditie`, `newDate`) VALUES(2, './img/roomate/02.jpg', '科技路', '2000 ', '整租', '限男', '2019.02.18', '1号地铁', '2019.09.16');
INSERT INTO `zxkf_roommate` (`rid`, `img`, `address`, `price`, `type`, `getset`, `date`, `ditie`, `newDate`) VALUES(3, './img/roomate/03.jpg', '高新路', '2300 ', '合租', '限女', '2019.02.19', '3号地铁', '2019.09.15');
INSERT INTO `zxkf_roommate` (`rid`, `img`, `address`, `price`, `type`, `getset`, `date`, `ditie`, `newDate`) VALUES(4, './img/roomate/02.jpg', '小寨', '1200 ', '合租', '限男', '2019.02.18', '2号地铁', '2019.09.14');
INSERT INTO `zxkf_roommate` (`rid`, `img`, `address`, `price`, `type`, `getset`, `date`, `ditie`, `newDate`) VALUES(5, './img/roomate/01.jpg', '雁塔路', '2100 ', '整租', '限女', '2019.02.13', '3号地铁', '2019.09.12');
INSERT INTO `zxkf_roommate` (`rid`, `img`, `address`, `price`, `type`, `getset`, `date`, `ditie`, `newDate`) VALUES(6, './img/roomate/03.jpg', '太白南路', '2000 ', '整租', '限男', '2019.02.25', '2号地铁', '2019.09.13');

-- --------------------------------------------------------

--
-- 表的结构 `zxkf_vipuser`
--

DROP TABLE IF EXISTS `zxkf_vipuser`;
CREATE TABLE IF NOT EXISTS `zxkf_vipuser` (
  `vuid` int(11) NOT NULL COMMENT '找室友用户id',
  `vuname` varchar(32) DEFAULT NULL COMMENT '找室友用户姓名',
  `upwd` varchar(32) DEFAULT NULL COMMENT '用户密码',
  `email` varchar(64) DEFAULT NULL COMMENT '用户邮箱',
  `phone` varchar(16) DEFAULT NULL COMMENT '用户电话',
  `avatar` varchar(128) DEFAULT NULL COMMENT '用户头像',
  `user_name` varchar(32) DEFAULT NULL COMMENT '用户昵称',
  `gender` tinyint(4) DEFAULT NULL COMMENT '用户性别'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 插入之前先把表清空（truncate） `zxkf_vipuser`
--

TRUNCATE TABLE `zxkf_vipuser`;
--
-- 转存表中的数据 `zxkf_vipuser`
--

INSERT INTO `zxkf_vipuser` (`vuid`, `vuname`, `upwd`, `email`, `phone`, `avatar`, `user_name`, `gender`) VALUES(1, '向华', '123456', '向华@163.com', '13366669999', NULL, '小小小', 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
