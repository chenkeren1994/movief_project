/*
 Navicat Premium Data Transfer

 Source Server         : movie
 Source Server Type    : MySQL
 Source Server Version : 50635
 Source Host           : localhost
 Source Database       : movie

 Target Server Type    : MySQL
 Target Server Version : 50635
 File Encoding         : utf-8

 Date: 08/09/2017 08:47:40 AM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `pwd` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `is_super` smallint(6) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `role_id` (`role_id`),
  KEY `ix_admin_addtime` (`addtime`),
  CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Records of `admin`
-- ----------------------------
BEGIN;
INSERT INTO `admin` VALUES ('1', 'imoocmovie', 'pbkdf2:sha256:50000$kekmRJXJ$739435fe72b65692e3b07b80c11eb6b8b3cde2865b47316593c92f7c4cae7b09', '0', '3', '2017-08-10 10:55:39'), ('2', 'abc123', 'pbkdf2:sha256:50000$A0ii8Qhy$5e4aee2dcf8618e4ddbafbb5f24143d8bc63ee2f1062f39c664b6b5461d41724', '1', '2', '2017-08-04 08:19:54'), ('3', 'def123', 'pbkdf2:sha256:50000$UklJtJn5$f226343446b08b7d41eaf97595c50cf6163de06b2a7c0d2cd214ee0751c8dcfc', '1', '3', '2017-08-04 08:21:28');
COMMIT;

-- ----------------------------
--  Table structure for `adminlog`
-- ----------------------------
DROP TABLE IF EXISTS `adminlog`;
CREATE TABLE `adminlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) DEFAULT NULL,
  `ip` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_id` (`admin_id`),
  KEY `ix_adminlog_addtime` (`addtime`),
  CONSTRAINT `adminlog_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Records of `adminlog`
-- ----------------------------
BEGIN;
INSERT INTO `adminlog` VALUES ('1', '1', '123', '2017-08-07 13:04:44'), ('2', '1', '127.0.0.1', '2017-08-04 05:04:30'), ('3', '1', '127.0.0.1', '2017-08-04 05:11:05'), ('4', '3', '127.0.0.1', '2017-08-04 08:35:23'), ('5', '1', '127.0.0.1', '2017-08-04 08:35:33'), ('6', '3', '127.0.0.1', '2017-08-04 09:18:29'), ('7', '2', '127.0.0.1', '2017-08-04 09:26:59'), ('8', '1', '127.0.0.1', '2017-08-04 09:31:47'), ('9', '1', '127.0.0.1', '2017-08-04 14:07:04'), ('10', '1', '127.0.0.1', '2017-08-05 05:58:21'), ('11', '1', '127.0.0.1', '2017-08-05 07:43:42');
COMMIT;

-- ----------------------------
--  Table structure for `auth`
-- ----------------------------
DROP TABLE IF EXISTS `auth`;
CREATE TABLE `auth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `url` (`url`),
  KEY `ix_auth_addtime` (`addtime`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Records of `auth`
-- ----------------------------
BEGIN;
INSERT INTO `auth` VALUES ('1', '添加标签', '/admin/tag/add/', '2017-08-04 05:49:26'), ('2', '编辑标签', '/admin/tag/edit/<int:id>/', '2017-08-04 05:51:21'), ('3', '标签列表', '/admin/tag/list/<int:page>/', '2017-08-04 05:52:09'), ('4', '删除标签', '/admin/tag/del/<int:id>/', '2017-08-04 05:52:35'), ('12', 'abcd', '22', '2017-08-04 06:26:17');
COMMIT;

-- ----------------------------
--  Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text COLLATE utf8_bin,
  `movie_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `movie_id` (`movie_id`),
  KEY `user_id` (`user_id`),
  KEY `ix_comment_addtime` (`addtime`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`),
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Records of `comment`
-- ----------------------------
BEGIN;
INSERT INTO `comment` VALUES ('2', '不错', '7', '2', '2017-08-04 09:24:11'), ('4', '给力', '7', '4', '2017-08-04 09:24:11'), ('5', '难看', '8', '5', '2017-08-04 09:24:11'), ('6', '无聊', '8', '6', '2017-08-04 09:24:11'), ('7', '乏味', '8', '7', '2017-08-04 09:24:11'), ('8', '无感', '8', '8', '2017-08-04 09:24:11'), ('18', '<p>一个海豹</p>', '7', '48', '2017-08-08 07:48:53'), ('19', '<p><img src=\"http://img.baidu.com/hi/jx2/j_0018.gif\"/></p>', '7', '48', '2017-08-08 07:50:19'), ('20', '<p><img src=\"http://img.baidu.com/hi/jx2/j_0058.gif\"/></p>', '7', '48', '2017-08-08 07:50:24'), ('21', '<p><img src=\"http://img.baidu.com/hi/jx2/j_0003.gif\"/></p>', '7', '48', '2017-08-08 07:50:29'), ('22', '<p><img src=\"http://img.baidu.com/hi/jx2/j_0042.gif\"/></p>', '7', '48', '2017-08-08 07:50:34'), ('23', '<p><img src=\"http://img.baidu.com/hi/jx2/j_0002.gif\"/></p>', '7', '48', '2017-08-08 07:55:45'), ('24', '<p><img src=\"http://img.baidu.com/hi/jx2/j_0079.gif\"/></p>', '7', '48', '2017-08-08 08:26:10'), ('25', '<p><img src=\"http://img.baidu.com/hi/jx2/j_0002.gif\"/></p>', '7', '48', '2017-08-08 08:26:55'), ('26', '<p><img src=\"http://img.baidu.com/hi/jx2/j_0002.gif\"/></p>', '8', '52', '2017-08-08 13:30:07'), ('27', '<p>11<img src=\"http://img.baidu.com/hi/jx2/j_0056.gif\"/></p>', '7', '52', '2017-08-08 13:50:40'), ('28', '<p>好看啊啊啊啊</p>', '8', '48', '2017-08-09 00:31:07'), ('29', '<p>太难看了<img src=\"http://img.baidu.com/hi/jx2/j_0014.gif\"/></p>', '10', '48', '2017-08-09 00:34:53');
COMMIT;

-- ----------------------------
--  Table structure for `movie`
-- ----------------------------
DROP TABLE IF EXISTS `movie`;
CREATE TABLE `movie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `info` text COLLATE utf8_bin,
  `logo` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `star` smallint(6) DEFAULT NULL,
  `playnum` bigint(20) DEFAULT NULL,
  `commentnum` bigint(20) DEFAULT NULL,
  `tag_id` int(11) DEFAULT NULL,
  `area` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `release_time` date DEFAULT NULL,
  `length` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`),
  UNIQUE KEY `url` (`url`),
  UNIQUE KEY `logo` (`logo`),
  KEY `tag_id` (`tag_id`),
  KEY `ix_movie_addtime` (`addtime`),
  CONSTRAINT `movie_ibfk_1` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Records of `movie`
-- ----------------------------
BEGIN;
INSERT INTO `movie` VALUES ('7', '变形金刚', '201708031914328736707b332d4107b0e17ed8ac7b28cd.mp4', '变形金刚', '201708031911067203791d8e044ea1bc5dc7325b5b4e45.jpg', '1', '50', '3', '1', '美国', '2017-08-09', '133', '2017-08-03 11:11:06'), ('8', '战狼2', '20170803183703eb33c0bd9deb4b30a5d39fa87f9ed6d9.mp4', '战狼2 吴京导演', '2017080318370390e7fde1457049df95f4d20ec7702139.jpeg', '5', '42', '2', '2', '中国大陆', '2017-09-06', '120分钟', '2017-08-03 10:37:04'), ('10', '天刀队长', '20170804215958b3f614d9b7f3482382615945c4d8e78a.mp4', '天刀队长', '20170804215958d50fbad984bd441d92618b869ccfcbbe.png', '2', '4', '1', '7', '日本', '2017-08-25', '99分钟', '2017-08-04 13:59:59'), ('13', '特种部队', '201708051420156bffa13fd89342ed8717fcf062127a63.mp4', '特种部队', '201708051420369ca9c1e5ffd94c488f83739436dc282c.jpeg', '1', '1', '0', '1', '中国香港', '2017-08-17', '133', '2017-08-05 06:15:40');
COMMIT;

-- ----------------------------
--  Table structure for `moviecol`
-- ----------------------------
DROP TABLE IF EXISTS `moviecol`;
CREATE TABLE `moviecol` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `movie_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `movie_id` (`movie_id`),
  KEY `user_id` (`user_id`),
  KEY `ix_moviecol_addtime` (`addtime`),
  CONSTRAINT `moviecol_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`),
  CONSTRAINT `moviecol_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Records of `moviecol`
-- ----------------------------
BEGIN;
INSERT INTO `moviecol` VALUES ('18', '8', '48', '2017-08-09 00:34:34'), ('19', '10', '48', '2017-08-09 00:34:43');
COMMIT;

-- ----------------------------
--  Table structure for `oplog`
-- ----------------------------
DROP TABLE IF EXISTS `oplog`;
CREATE TABLE `oplog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) DEFAULT NULL,
  `ip` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `reason` varchar(600) COLLATE utf8_bin DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_id` (`admin_id`),
  KEY `ix_oplog_addtime` (`addtime`),
  CONSTRAINT `oplog_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Records of `oplog`
-- ----------------------------
BEGIN;
INSERT INTO `oplog` VALUES ('1', '1', '123', 'dd', '2017-08-22 12:59:17'), ('2', '1', '127.0.0.1', '添加标签123', '2017-08-04 04:48:35'), ('3', '1', '127.0.0.1', '添加标签456', '2017-08-04 04:48:39'), ('4', '1', '127.0.0.1', '添加标签789', '2017-08-04 04:48:44'), ('5', '3', '127.0.0.1', '添加标签abcabc', '2017-08-04 09:25:29');
COMMIT;

-- ----------------------------
--  Table structure for `preview`
-- ----------------------------
DROP TABLE IF EXISTS `preview`;
CREATE TABLE `preview` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`),
  UNIQUE KEY `logo` (`logo`),
  KEY `ix_preview_addtime` (`addtime`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Records of `preview`
-- ----------------------------
BEGIN;
INSERT INTO `preview` VALUES ('1', '战狼2', '20170805143505f4b225e40bd9436f8ac719138312955c.jpeg', '2017-08-03 12:00:57'), ('2', '变形金刚5', '20170805143448694bd3ac506042f5b0d8907e2ac3d33d.jpeg', '2017-08-03 12:02:54'), ('3', '战狼1', '201708051436040977069f45bc47e4bf93893416799f28.jpeg', '2017-08-04 14:07:31'), ('7', '特种部队', '20170805143243920a20f0a365488a89f0d2efa3d5cfbe.jpeg', '2017-08-05 06:22:27');
COMMIT;

-- ----------------------------
--  Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `auths` varchar(600) COLLATE utf8_bin DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `ix_role_addtime` (`addtime`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Records of `role`
-- ----------------------------
BEGIN;
INSERT INTO `role` VALUES ('2', '标签管理员2', '1,3', '2017-08-04 06:57:22'), ('3', '标签管理员', '1,2,3,4', '2017-08-04 06:57:45');
COMMIT;

-- ----------------------------
--  Table structure for `tag`
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `addTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `ix_tag_addTime` (`addTime`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `tag`
-- ----------------------------
BEGIN;
INSERT INTO `tag` VALUES ('1', '科幻', '2017-08-03 02:32:49'), ('2', '动作', '2017-08-03 02:36:14'), ('3', '爱情', '2017-08-03 02:36:42'), ('7', '魔幻', '2017-08-03 05:55:32'), ('8', '123', '2017-08-04 04:48:35'), ('9', '456', '2017-08-04 04:48:39'), ('10', '789', '2017-08-04 04:48:44');
COMMIT;

-- ----------------------------
--  Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `pwd` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `phone` varchar(11) CHARACTER SET utf8mb4 DEFAULT NULL,
  `info` text CHARACTER SET utf8mb4,
  `face` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  `uuid` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `face` (`face`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `ix_user_addtime` (`addtime`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Records of `user`
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES ('2', '虎', '1233', '1233@123.com', '13888888883', '虎', '1f405.png', '2017-08-03 21:41:48', 'd32a72bdac524478b7e4f6dfc8394fc2'), ('3', '兔', '1234', '1234@123.com', '13888888884', '兔', '1f407.png', '2017-08-03 21:41:48', 'd32a72bdac524478b7e4f6dfc8394fc3'), ('4', '龙', '1235', '1235@123.com', '13888888885', '龙', '1f409.png', '2017-08-03 21:41:48', 'd32a72bdac524478b7e4f6dfc8394fc4'), ('5', '蛇', '1236', '1236@123.com', '13888888886', '蛇', '1f40d.png', '2017-08-03 21:41:48', 'd32a72bdac524478b7e4f6dfc8394fc5'), ('6', '马', '1237', '1237@123.com', '13888888887', '马', '1f434.png', '2017-08-03 21:41:48', 'd32a72bdac524478b7e4f6dfc8394fc6'), ('7', '羊', '1238', '1238@123.com', '13888888888', '羊', '1f411.png', '2017-08-03 21:41:48', 'd32a72bdac524478b7e4f6dfc8394fc7'), ('8', '猴', '1239', '1239@123.com', '13888888889', '猴', '1f412.png', '2017-08-03 21:41:48', 'd32a72bdac524478b7e4f6dfc8394fc8'), ('9', '鸡', '1240', '1240@123.com', '13888888891', '鸡', '1f413.png', '2017-08-03 21:41:48', 'd32a72bdac524478b7e4f6dfc8394fc9'), ('10', '狗', '1241', '1241@123.com', '13888888892', '狗', '1f415.png', '2017-08-03 21:41:48', 'd32a72bdac524478b7e4f6dfc8394fd0'), ('11', '猪', '1242', '1242@123.com', '13888888893', '猪', '1f416.png', '2017-08-03 21:41:48', 'd32a72bdac524478b7e4f6dfc8394fd1'), ('48', 'imooc', 'pbkdf2:sha256:50000$xWclAbDx$1d83bcb9297f74d27ee324a83cfdce06eb0d9cdad5a36ac7635ef7d6c2da9376', '43333232@qq.com', '15698840518', '我是还是一个海豹', '20170805150133671a7e6b9b28433aa4a76874d0ba098e.png', '2017-08-04 11:25:28', '986c20f0b56843539b113b9ec6fdaae8'), ('52', 'chenkeren1994', 'pbkdf2:sha256:50000$j5gT1ARw$de9e4889611667cf78a216affcca96fa903e52de123efe9954ee0b2037740f62', '763272238@qq.com', '15698840513', null, null, '2017-08-08 13:29:29', 'ca243605317a45e4a0ff7a608c404265');
COMMIT;

-- ----------------------------
--  Table structure for `userlog`
-- ----------------------------
DROP TABLE IF EXISTS `userlog`;
CREATE TABLE `userlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `ip` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `ix_userlog_addtime` (`addtime`),
  CONSTRAINT `userlog_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Records of `userlog`
-- ----------------------------
BEGIN;
INSERT INTO `userlog` VALUES ('1', null, '192.168.4.1', '2017-08-04 09:25:51'), ('2', '2', '192.168.4.2', '2017-08-04 09:25:51'), ('3', '3', '192.168.4.3', '2017-08-04 09:25:51'), ('4', '4', '192.168.4.4', '2017-08-04 09:25:51'), ('5', '5', '192.168.4.5', '2017-08-04 09:25:51'), ('6', '6', '192.168.4.6', '2017-08-04 09:25:51'), ('7', '7', '192.168.4.7', '2017-08-04 09:25:51'), ('8', '8', '192.168.4.8', '2017-08-04 09:25:51'), ('9', '9', '192.168.4.9', '2017-08-04 09:25:51'), ('10', '48', '127.0.0.1', '2017-08-04 11:38:58'), ('11', '48', '127.0.0.1', '2017-08-04 11:40:15'), ('12', '48', '127.0.0.1', '2017-08-04 11:42:32'), ('13', '48', '127.0.0.1', '2017-08-04 11:46:21'), ('14', '48', '127.0.0.1', '2017-08-04 11:47:51'), ('15', '48', '127.0.0.1', '2017-08-04 11:48:30'), ('16', '48', '127.0.0.1', '2017-08-04 13:23:20'), ('17', '48', '127.0.0.1', '2017-08-04 13:32:26'), ('18', '48', '127.0.0.1', '2017-08-05 04:28:42'), ('19', '48', '127.0.0.1', '2017-08-05 06:44:42'), ('20', null, '127.0.0.1', '2017-08-05 07:07:20'), ('21', null, '127.0.0.1', '2017-08-05 07:15:08'), ('22', null, '127.0.0.1', '2017-08-05 07:16:11'), ('23', '48', '127.0.0.1', '2017-08-05 07:35:45'), ('24', '48', '127.0.0.1', '2017-08-05 07:42:09'), ('25', '48', '127.0.0.1', '2017-08-06 06:17:46'), ('26', '48', '127.0.0.1', '2017-08-08 07:18:39'), ('27', '48', '127.0.0.1', '2017-08-08 07:23:16'), ('28', '48', '127.0.0.1', '2017-08-08 07:25:01'), ('29', '48', '127.0.0.1', '2017-08-08 07:25:32'), ('30', '48', '127.0.0.1', '2017-08-08 08:05:36'), ('31', '52', '127.0.0.1', '2017-08-08 13:29:51'), ('32', '48', '127.0.0.1', '2017-08-09 00:07:04'), ('33', '48', '127.0.0.1', '2017-08-09 00:24:20');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
