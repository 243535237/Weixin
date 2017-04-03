/*
Navicat MySQL Data Transfer

Source Server         : weixin
Source Server Version : 50714
Source Host           : localhost:3306
Source Database       : tetest

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2017-04-03 13:28:27
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for answer
-- ----------------------------
DROP TABLE IF EXISTS `answer`;
CREATE TABLE `answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `questionsid` int(11) NOT NULL COMMENT '题库ID',
  `answer` varchar(1024) DEFAULT NULL,
  `picture` varchar(2048) DEFAULT NULL COMMENT '图片',
  `describe` varchar(2048) DEFAULT NULL COMMENT '描述',
  `eventid` varchar(1024) DEFAULT NULL COMMENT '事件(多个用#)',
  `xh` int(11) NOT NULL COMMENT '顺序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='答案表';

-- ----------------------------
-- Records of answer
-- ----------------------------
INSERT INTO `answer` VALUES ('1', '2', '1.前进', null, '前方有一个岩浆，你失足掉了下去【复活币-1', '1', '1');
INSERT INTO `answer` VALUES ('2', '2', '2.后退', null, '你向后退摘下一个宝石作为照明，然后继续前进，发现了岩浆上有桥，安全通过【复活币+1', '2', '2');
INSERT INTO `answer` VALUES ('3', '2', '3.逃回出发点', null, '出发点已消失，你无法找到【复活币-1', '1', '3');
INSERT INTO `answer` VALUES ('5', '2', '4.往前冲', null, '冲进岩浆【复活币-1', '1', '4');
INSERT INTO `answer` VALUES ('6', '2', '5.点一把火前进', null, '古墓中充满易爆气体，BOOM…【复活币-1', '1', '5');
INSERT INTO `answer` VALUES ('7', '3', '1.', '121.png', '继续', '', '1');
INSERT INTO `answer` VALUES ('8', '3', '2.', '122.png', '继续', '', '2');
INSERT INTO `answer` VALUES ('9', '3', '3.', '123.png', '这地方是给贪婪的盗墓者专门准备的进去就再也出不出来了【复活币-1', '1', '3');
INSERT INTO `answer` VALUES ('10', '4', '1.红', null, '红是血光，你被千刀万剐【复活币-1', '1', '1');
INSERT INTO `answer` VALUES ('11', '4', '2.蓝', null, '蓝是精分，你被魔音穿耳【复活币-1', '1', '2');
INSERT INTO `answer` VALUES ('12', '4', '3.黑', null, '黑是高贵，你被成千上万的宝石碾压【复活币-1', '1', '3');
INSERT INTO `answer` VALUES ('13', '4', '4.逃跑', null, '外面的岩浆都消失，原来进口即出口，门外也有两个灿烂的金色宝石奖励你的不贪 【复活币+2', '4', '4');
INSERT INTO `answer` VALUES ('14', '4', '5.全部', null, '恭喜你 死无全尸【复活币-3', '1', '5');
INSERT INTO `answer` VALUES ('15', '5', '1.把指南针摔了', null, '指南针显灵光，一路被照亮，原来这是一个圈，只有往旁边走才到墓的主室【复活币+1', '2', '1');
INSERT INTO `answer` VALUES ('16', '5', '2.往反方向走', null, '这是一个圈，走不到尽头', '', '2');
INSERT INTO `answer` VALUES ('17', '5', '3.大叫', null, '叫破喉咙也没用的', '', '3');
INSERT INTO `answer` VALUES ('18', '6', '1.打开金棺材', null, '金是皇后之墓，释放出毒气【复活币-1', '1', '1');
INSERT INTO `answer` VALUES ('19', '6', '2.打开银棺材', null, '银是大臣之墓，释放出荆棘【复活币-1', '1', '2');
INSERT INTO `answer` VALUES ('20', '6', '3.打开钻石棺材', null, '钻石棺材中有一个机关，打开了通往真正主墓的门', '', '3');
INSERT INTO `answer` VALUES ('21', '6', '4.逃跑', null, '逃不出去的【复活币-1', '1', '4');
INSERT INTO `answer` VALUES ('22', '6', '5.敲敲看看有没有其他门', null, '找到了那个门', '', '5');
INSERT INTO `answer` VALUES ('23', '7', '1.左', null, '光明黑暗即浮云【复活币-1', '1', '1');
INSERT INTO `answer` VALUES ('24', '7', '2.右', null, '光明黑暗即浮云【复活币-1', '1', '2');
INSERT INTO `answer` VALUES ('25', '7', '3.上', null, '虚空即最初，回到了原来的镜子迷宫', '', '3');
INSERT INTO `answer` VALUES ('26', '7', '4.下', null, '无尽即你现在的过程，也回到了原来的镜子迷宫并且送你一个复活币当做践行礼【复活币+1', '2', '4');

-- ----------------------------
-- Table structure for datadic
-- ----------------------------
DROP TABLE IF EXISTS `datadic`;
CREATE TABLE `datadic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(128) NOT NULL,
  `key` varchar(256) NOT NULL,
  `value` varchar(512) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='数据字典';

-- ----------------------------
-- Records of datadic
-- ----------------------------
INSERT INTO `datadic` VALUES ('1', 'event', '1', '复活币-1');
INSERT INTO `datadic` VALUES ('2', 'event', '2', '复活币+1');
INSERT INTO `datadic` VALUES ('3', 'event', '3', '复活币-2');
INSERT INTO `datadic` VALUES ('4', 'event', '4', '复活币+2');
INSERT INTO `datadic` VALUES ('5', 'event', '5', '复活币-3');
INSERT INTO `datadic` VALUES ('6', 'event', '6', '复活币+3');
INSERT INTO `datadic` VALUES ('7', 'event', '7', '复活币清零');
INSERT INTO `datadic` VALUES ('8', 'wz', '1', '菜单');
INSERT INTO `datadic` VALUES ('9', 'wz', '2', '修改名称');
INSERT INTO `datadic` VALUES ('10', 'wz', '3', '游戏中');

-- ----------------------------
-- Table structure for follow
-- ----------------------------
DROP TABLE IF EXISTS `follow`;
CREATE TABLE `follow` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `openid` varchar(128) NOT NULL COMMENT '用户ID',
  `followdate` datetime NOT NULL COMMENT '关注时间',
  `cancelfollowdate` datetime DEFAULT NULL COMMENT '取消关注时间',
  `state` int(11) NOT NULL COMMENT '0:未关注  1:关注中',
  PRIMARY KEY (`id`),
  KEY `openid` (`openid`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='用户关注表';

-- ----------------------------
-- Records of follow
-- ----------------------------
INSERT INTO `follow` VALUES ('23', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '2016-08-14 23:59:47', null, '1');

-- ----------------------------
-- Table structure for message_text
-- ----------------------------
DROP TABLE IF EXISTS `message_text`;
CREATE TABLE `message_text` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `open_id` varchar(100) NOT NULL,
  `content` varchar(2000) NOT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=496 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message_text
-- ----------------------------
INSERT INTO `message_text` VALUES ('1', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '看看看', '2016-07-24 18:41:08');
INSERT INTO `message_text` VALUES ('2', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '你在干嘛呢', '2016-07-24 18:41:41');
INSERT INTO `message_text` VALUES ('3', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '看婚跟', '2016-07-24 18:43:30');
INSERT INTO `message_text` VALUES ('4', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '上古', '2016-07-24 18:50:01');
INSERT INTO `message_text` VALUES ('5', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '/::-|/::-|/::@', '2016-07-25 20:41:00');
INSERT INTO `message_text` VALUES ('6', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '哈哈哈', '2016-07-25 20:41:16');
INSERT INTO `message_text` VALUES ('7', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '/::)', '2016-07-25 20:41:24');
INSERT INTO `message_text` VALUES ('8', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '/::\'(', '2016-07-25 20:41:25');
INSERT INTO `message_text` VALUES ('9', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '/::-|', '2016-07-25 20:41:26');
INSERT INTO `message_text` VALUES ('10', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '/::\'(', '2016-07-25 20:41:26');
INSERT INTO `message_text` VALUES ('11', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '/::+', '2016-07-25 20:41:28');
INSERT INTO `message_text` VALUES ('12', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '/::Z', '2016-07-25 20:41:28');
INSERT INTO `message_text` VALUES ('13', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '/::-|', '2016-07-25 20:41:28');
INSERT INTO `message_text` VALUES ('14', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '/::@', '2016-07-25 20:41:29');
INSERT INTO `message_text` VALUES ('15', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '/::T', '2016-07-25 20:41:30');
INSERT INTO `message_text` VALUES ('16', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '/::\'(', '2016-07-25 20:41:30');
INSERT INTO `message_text` VALUES ('17', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '/::Z', '2016-07-25 20:41:30');
INSERT INTO `message_text` VALUES ('18', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '/::X', '2016-07-25 20:43:21');
INSERT INTO `message_text` VALUES ('19', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '上耕田', '2016-07-25 21:22:51');
INSERT INTO `message_text` VALUES ('20', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '/::\'(/::\'(/::\'(', '2016-07-25 21:24:07');
INSERT INTO `message_text` VALUES ('21', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '航风格', '2016-07-25 22:12:49');
INSERT INTO `message_text` VALUES ('22', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '上海场', '2016-07-25 22:12:55');
INSERT INTO `message_text` VALUES ('23', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '藕夹和：看航运', '2016-07-25 22:13:02');
INSERT INTO `message_text` VALUES ('24', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '张春芳', '2016-07-25 22:13:06');
INSERT INTO `message_text` VALUES ('25', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '横溢很烦', '2016-07-25 22:13:10');
INSERT INTO `message_text` VALUES ('26', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '常怀甭管穿', '2016-07-25 22:13:14');
INSERT INTO `message_text` VALUES ('27', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '金进京横幅', '2016-07-25 22:13:19');
INSERT INTO `message_text` VALUES ('28', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '滚斐讯更更', '2016-07-25 22:23:48');
INSERT INTO `message_text` VALUES ('29', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '刚更好', '2016-07-25 22:47:58');
INSERT INTO `message_text` VALUES ('30', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '签到睡觉', '2016-07-25 23:43:11');
INSERT INTO `message_text` VALUES ('31', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '呵呵', '2016-07-25 23:45:37');
INSERT INTO `message_text` VALUES ('32', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '【收到不支持的消息类型，暂无法显示】', '2016-07-25 23:45:42');
INSERT INTO `message_text` VALUES ('33', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '战魂', '2016-07-26 07:30:35');
INSERT INTO `message_text` VALUES ('34', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', 'wqd', '2016-07-26 20:04:27');
INSERT INTO `message_text` VALUES ('35', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', 'dwqwq', '2016-07-26 20:04:44');
INSERT INTO `message_text` VALUES ('36', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', 'dwqd', '2016-07-26 20:05:12');
INSERT INTO `message_text` VALUES ('37', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', 'qwdqwd', '2016-07-26 20:15:15');
INSERT INTO `message_text` VALUES ('38', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', 'aaaaaaa', '2016-07-26 20:15:26');
INSERT INTO `message_text` VALUES ('39', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', 'dwqdwq', '2016-07-26 20:18:55');
INSERT INTO `message_text` VALUES ('40', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '航神', '2016-07-27 08:37:46');
INSERT INTO `message_text` VALUES ('41', 'oQ0hjwc5iOsl3bamX1s0KQ0RGI9E', 'jjh', '2016-07-27 10:15:21');
INSERT INTO `message_text` VALUES ('42', 'oQ0hjwc5iOsl3bamX1s0KQ0RGI9E', 'hhhhgggt', '2016-07-27 10:27:19');
INSERT INTO `message_text` VALUES ('43', 'oQ0hjwc5iOsl3bamX1s0KQ0RGI9E', '航海', '2016-07-27 12:41:47');
INSERT INTO `message_text` VALUES ('44', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', 'hh', '2016-07-30 16:58:01');
INSERT INTO `message_text` VALUES ('45', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '音乐1', '2016-07-30 17:02:17');
INSERT INTO `message_text` VALUES ('46', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '111', '2016-07-30 17:07:29');
INSERT INTO `message_text` VALUES ('47', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '111', '2016-07-30 17:07:51');
INSERT INTO `message_text` VALUES ('48', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', 'aaa', '2016-07-30 17:07:58');
INSERT INTO `message_text` VALUES ('49', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '啊', '2016-07-30 17:08:04');
INSERT INTO `message_text` VALUES ('50', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', 'dw', '2016-07-30 17:10:30');
INSERT INTO `message_text` VALUES ('51', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '啊', '2016-07-30 17:13:34');
INSERT INTO `message_text` VALUES ('52', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '是', '2016-07-30 17:17:45');
INSERT INTO `message_text` VALUES ('53', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '啊', '2016-07-30 17:21:29');
INSERT INTO `message_text` VALUES ('54', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', 'a', '2016-07-30 17:24:41');
INSERT INTO `message_text` VALUES ('55', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', 'a', '2016-07-30 17:24:44');
INSERT INTO `message_text` VALUES ('56', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', 'd', '2016-07-30 17:24:58');
INSERT INTO `message_text` VALUES ('57', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', 'h', '2016-07-30 17:25:53');
INSERT INTO `message_text` VALUES ('58', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', 'a', '2016-07-30 17:28:42');
INSERT INTO `message_text` VALUES ('59', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', 'd', '2016-07-30 17:28:55');
INSERT INTO `message_text` VALUES ('60', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '/:strong', '2016-07-30 17:30:09');
INSERT INTO `message_text` VALUES ('61', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '/::<', '2016-07-30 17:30:16');
INSERT INTO `message_text` VALUES ('62', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '111', '2016-07-30 20:21:42');
INSERT INTO `message_text` VALUES ('63', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '111', '2016-07-30 20:21:46');
INSERT INTO `message_text` VALUES ('64', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '111', '2016-07-30 20:21:47');
INSERT INTO `message_text` VALUES ('65', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '111', '2016-07-30 20:22:03');
INSERT INTO `message_text` VALUES ('66', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '22', '2016-07-30 20:22:59');
INSERT INTO `message_text` VALUES ('67', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', 'daw', '2016-07-30 20:23:11');
INSERT INTO `message_text` VALUES ('68', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-07-30 22:10:00');
INSERT INTO `message_text` VALUES ('69', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-07-30 22:10:05');
INSERT INTO `message_text` VALUES ('70', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-07-30 22:10:10');
INSERT INTO `message_text` VALUES ('71', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-07-30 22:11:35');
INSERT INTO `message_text` VALUES ('72', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-07-30 22:11:40');
INSERT INTO `message_text` VALUES ('73', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-07-30 22:11:45');
INSERT INTO `message_text` VALUES ('74', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-07-30 22:12:12');
INSERT INTO `message_text` VALUES ('75', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-07-30 22:12:17');
INSERT INTO `message_text` VALUES ('76', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-07-30 22:12:22');
INSERT INTO `message_text` VALUES ('77', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-07-30 22:14:56');
INSERT INTO `message_text` VALUES ('78', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-07-30 22:21:06');
INSERT INTO `message_text` VALUES ('79', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-07-30 22:21:11');
INSERT INTO `message_text` VALUES ('80', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-07-30 22:21:16');
INSERT INTO `message_text` VALUES ('81', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-07-30 22:23:22');
INSERT INTO `message_text` VALUES ('82', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-07-30 22:23:24');
INSERT INTO `message_text` VALUES ('83', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-07-30 22:23:29');
INSERT INTO `message_text` VALUES ('84', 'oQ0hjwc5iOsl3bamX1s0KQ0RGI9E', '111', '2016-08-03 20:13:38');
INSERT INTO `message_text` VALUES ('85', 'gh_762ba564d13a', '?', '2016-08-14 13:55:04');
INSERT INTO `message_text` VALUES ('86', 'gh_762ba564d13a', '????', '2016-08-14 13:56:37');
INSERT INTO `message_text` VALUES ('87', 'gh_762ba564d13a', '???', '2016-08-14 13:57:21');
INSERT INTO `message_text` VALUES ('88', 'gh_762ba564d13a', '???', '2016-08-14 13:57:23');
INSERT INTO `message_text` VALUES ('89', 'gh_762ba564d13a', '????', '2016-08-14 14:00:26');
INSERT INTO `message_text` VALUES ('90', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '?????', '2016-08-14 14:01:09');
INSERT INTO `message_text` VALUES ('91', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '????', '2016-08-14 14:01:59');
INSERT INTO `message_text` VALUES ('92', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '???', '2016-08-14 14:05:23');
INSERT INTO `message_text` VALUES ('93', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '物权法', '2016-08-14 14:05:55');
INSERT INTO `message_text` VALUES ('94', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '问而我却我得', '2016-08-14 14:06:41');
INSERT INTO `message_text` VALUES ('95', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '??', '2016-08-14 14:07:01');
INSERT INTO `message_text` VALUES ('96', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '物权法的', '2016-08-14 14:07:27');
INSERT INTO `message_text` VALUES ('97', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '物权法', '2016-08-14 14:08:55');
INSERT INTO `message_text` VALUES ('98', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '我确定', '2016-08-14 14:10:20');
INSERT INTO `message_text` VALUES ('99', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 15:39:21');
INSERT INTO `message_text` VALUES ('100', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '独行天下', '2016-08-14 15:39:37');
INSERT INTO `message_text` VALUES ('101', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 15:40:33');
INSERT INTO `message_text` VALUES ('102', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 15:41:09');
INSERT INTO `message_text` VALUES ('103', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 15:41:44');
INSERT INTO `message_text` VALUES ('104', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 15:41:48');
INSERT INTO `message_text` VALUES ('105', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 15:41:53');
INSERT INTO `message_text` VALUES ('106', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 15:44:46');
INSERT INTO `message_text` VALUES ('107', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 15:45:14');
INSERT INTO `message_text` VALUES ('108', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '独行天下', '2016-08-14 15:45:25');
INSERT INTO `message_text` VALUES ('109', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '菜单', '2016-08-14 15:45:40');
INSERT INTO `message_text` VALUES ('110', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '独行天下', '2016-08-14 15:45:59');
INSERT INTO `message_text` VALUES ('111', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '独行天下', '2016-08-14 15:46:37');
INSERT INTO `message_text` VALUES ('112', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '啊', '2016-08-14 15:46:53');
INSERT INTO `message_text` VALUES ('113', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '菜单', '2016-08-14 15:47:00');
INSERT INTO `message_text` VALUES ('114', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 15:48:43');
INSERT INTO `message_text` VALUES ('115', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '独行天下', '2016-08-14 15:48:51');
INSERT INTO `message_text` VALUES ('116', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '菜单', '2016-08-14 15:48:56');
INSERT INTO `message_text` VALUES ('117', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 15:52:04');
INSERT INTO `message_text` VALUES ('118', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '更新', '2016-08-14 15:52:09');
INSERT INTO `message_text` VALUES ('119', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 15:53:00');
INSERT INTO `message_text` VALUES ('120', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 15:54:03');
INSERT INTO `message_text` VALUES ('121', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 15:55:58');
INSERT INTO `message_text` VALUES ('122', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 15:56:24');
INSERT INTO `message_text` VALUES ('123', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 15:58:03');
INSERT INTO `message_text` VALUES ('124', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '刚结婚', '2016-08-14 15:58:07');
INSERT INTO `message_text` VALUES ('125', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 15:59:25');
INSERT INTO `message_text` VALUES ('126', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '会从', '2016-08-14 15:59:27');
INSERT INTO `message_text` VALUES ('127', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '菜单', '2016-08-14 15:59:37');
INSERT INTO `message_text` VALUES ('128', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 15:59:40');
INSERT INTO `message_text` VALUES ('129', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '2', '2016-08-14 16:14:53');
INSERT INTO `message_text` VALUES ('130', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '2', '2016-08-14 16:15:24');
INSERT INTO `message_text` VALUES ('131', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '2', '2016-08-14 16:15:39');
INSERT INTO `message_text` VALUES ('132', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '2', '2016-08-14 16:16:13');
INSERT INTO `message_text` VALUES ('133', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '2', '2016-08-14 16:16:32');
INSERT INTO `message_text` VALUES ('134', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 16:16:35');
INSERT INTO `message_text` VALUES ('135', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '2', '2016-08-14 16:16:39');
INSERT INTO `message_text` VALUES ('136', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '菜单', '2016-08-14 16:16:44');
INSERT INTO `message_text` VALUES ('137', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '2', '2016-08-14 16:17:48');
INSERT INTO `message_text` VALUES ('138', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '菜单', '2016-08-14 16:57:54');
INSERT INTO `message_text` VALUES ('139', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 16:57:58');
INSERT INTO `message_text` VALUES ('140', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 16:58:49');
INSERT INTO `message_text` VALUES ('141', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 16:59:10');
INSERT INTO `message_text` VALUES ('142', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 16:59:14');
INSERT INTO `message_text` VALUES ('143', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 16:59:19');
INSERT INTO `message_text` VALUES ('144', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 16:59:35');
INSERT INTO `message_text` VALUES ('145', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 16:59:40');
INSERT INTO `message_text` VALUES ('146', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 16:59:45');
INSERT INTO `message_text` VALUES ('147', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 17:00:09');
INSERT INTO `message_text` VALUES ('148', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 17:00:15');
INSERT INTO `message_text` VALUES ('149', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 17:00:35');
INSERT INTO `message_text` VALUES ('150', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 17:01:26');
INSERT INTO `message_text` VALUES ('151', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 17:02:03');
INSERT INTO `message_text` VALUES ('152', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 17:04:05');
INSERT INTO `message_text` VALUES ('153', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 17:04:20');
INSERT INTO `message_text` VALUES ('154', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 17:04:35');
INSERT INTO `message_text` VALUES ('155', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 17:05:46');
INSERT INTO `message_text` VALUES ('156', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 17:07:04');
INSERT INTO `message_text` VALUES ('157', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 17:07:18');
INSERT INTO `message_text` VALUES ('158', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 17:07:34');
INSERT INTO `message_text` VALUES ('159', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 17:09:55');
INSERT INTO `message_text` VALUES ('160', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 17:10:41');
INSERT INTO `message_text` VALUES ('161', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 17:11:59');
INSERT INTO `message_text` VALUES ('162', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 17:12:16');
INSERT INTO `message_text` VALUES ('163', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 17:15:47');
INSERT INTO `message_text` VALUES ('164', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '*', '2016-08-14 17:16:30');
INSERT INTO `message_text` VALUES ('165', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 17:17:00');
INSERT INTO `message_text` VALUES ('166', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 17:19:22');
INSERT INTO `message_text` VALUES ('167', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 17:22:10');
INSERT INTO `message_text` VALUES ('168', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 17:22:23');
INSERT INTO `message_text` VALUES ('169', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 17:22:53');
INSERT INTO `message_text` VALUES ('170', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 17:23:06');
INSERT INTO `message_text` VALUES ('171', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 17:31:58');
INSERT INTO `message_text` VALUES ('172', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '菜单', '2016-08-14 17:32:10');
INSERT INTO `message_text` VALUES ('173', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 17:32:20');
INSERT INTO `message_text` VALUES ('174', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 17:33:16');
INSERT INTO `message_text` VALUES ('175', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '3', '2016-08-14 17:33:21');
INSERT INTO `message_text` VALUES ('176', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '打完', '2016-08-14 17:34:05');
INSERT INTO `message_text` VALUES ('177', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 17:34:09');
INSERT INTO `message_text` VALUES ('178', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '2', '2016-08-14 17:34:12');
INSERT INTO `message_text` VALUES ('179', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '菜单', '2016-08-14 17:34:14');
INSERT INTO `message_text` VALUES ('180', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '2', '2016-08-14 17:34:17');
INSERT INTO `message_text` VALUES ('181', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '2', '2016-08-14 17:34:53');
INSERT INTO `message_text` VALUES ('182', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '2', '2016-08-14 17:35:36');
INSERT INTO `message_text` VALUES ('183', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '菜单', '2016-08-14 17:35:43');
INSERT INTO `message_text` VALUES ('184', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 17:35:56');
INSERT INTO `message_text` VALUES ('185', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 17:36:14');
INSERT INTO `message_text` VALUES ('186', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '菜单', '2016-08-14 17:36:21');
INSERT INTO `message_text` VALUES ('187', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 17:36:28');
INSERT INTO `message_text` VALUES ('188', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '菜单', '2016-08-14 17:45:08');
INSERT INTO `message_text` VALUES ('189', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '复活币', '2016-08-14 17:45:11');
INSERT INTO `message_text` VALUES ('190', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '菜单', '2016-08-14 17:45:18');
INSERT INTO `message_text` VALUES ('191', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 17:45:19');
INSERT INTO `message_text` VALUES ('192', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '复活币', '2016-08-14 17:45:27');
INSERT INTO `message_text` VALUES ('193', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '复活币', '2016-08-14 17:46:06');
INSERT INTO `message_text` VALUES ('194', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 17:48:44');
INSERT INTO `message_text` VALUES ('195', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 17:48:50');
INSERT INTO `message_text` VALUES ('196', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '菜单', '2016-08-14 17:49:10');
INSERT INTO `message_text` VALUES ('197', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 17:49:15');
INSERT INTO `message_text` VALUES ('198', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '复活币', '2016-08-14 17:49:24');
INSERT INTO `message_text` VALUES ('199', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '2', '2016-08-14 17:52:36');
INSERT INTO `message_text` VALUES ('200', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '2', '2016-08-14 17:52:55');
INSERT INTO `message_text` VALUES ('201', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '菜单', '2016-08-14 17:53:03');
INSERT INTO `message_text` VALUES ('202', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '2', '2016-08-14 17:53:46');
INSERT INTO `message_text` VALUES ('203', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 17:53:51');
INSERT INTO `message_text` VALUES ('204', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '寻梦', '2016-08-14 17:54:04');
INSERT INTO `message_text` VALUES ('205', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '菜单', '2016-08-14 17:54:09');
INSERT INTO `message_text` VALUES ('206', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '2', '2016-08-14 17:54:13');
INSERT INTO `message_text` VALUES ('207', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 17:54:26');
INSERT INTO `message_text` VALUES ('208', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 18:00:05');
INSERT INTO `message_text` VALUES ('209', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '菜单', '2016-08-14 18:00:11');
INSERT INTO `message_text` VALUES ('210', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 18:00:13');
INSERT INTO `message_text` VALUES ('211', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 18:00:44');
INSERT INTO `message_text` VALUES ('212', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '菜单', '2016-08-14 18:00:45');
INSERT INTO `message_text` VALUES ('213', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 18:00:46');
INSERT INTO `message_text` VALUES ('214', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '菜单啊', '2016-08-14 18:00:59');
INSERT INTO `message_text` VALUES ('215', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 18:01:01');
INSERT INTO `message_text` VALUES ('216', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 18:04:57');
INSERT INTO `message_text` VALUES ('217', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '寻梦', '2016-08-14 18:05:01');
INSERT INTO `message_text` VALUES ('218', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '菜单', '2016-08-14 18:05:04');
INSERT INTO `message_text` VALUES ('219', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 18:05:19');
INSERT INTO `message_text` VALUES ('220', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '菜单', '2016-08-14 18:05:53');
INSERT INTO `message_text` VALUES ('221', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 18:05:54');
INSERT INTO `message_text` VALUES ('222', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '菜单', '2016-08-14 18:07:25');
INSERT INTO `message_text` VALUES ('223', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 18:07:26');
INSERT INTO `message_text` VALUES ('224', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '菜单', '2016-08-14 18:15:02');
INSERT INTO `message_text` VALUES ('225', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 18:15:03');
INSERT INTO `message_text` VALUES ('226', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '菜单', '2016-08-14 18:15:45');
INSERT INTO `message_text` VALUES ('227', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 18:15:46');
INSERT INTO `message_text` VALUES ('228', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '菜单', '2016-08-14 18:16:08');
INSERT INTO `message_text` VALUES ('229', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 18:16:11');
INSERT INTO `message_text` VALUES ('230', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '菜单', '2016-08-14 18:16:21');
INSERT INTO `message_text` VALUES ('231', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 18:16:22');
INSERT INTO `message_text` VALUES ('232', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '菜单', '2016-08-14 18:16:41');
INSERT INTO `message_text` VALUES ('233', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 18:16:44');
INSERT INTO `message_text` VALUES ('234', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '菜单', '2016-08-14 18:18:27');
INSERT INTO `message_text` VALUES ('235', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 18:18:28');
INSERT INTO `message_text` VALUES ('236', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '菜单', '2016-08-14 18:20:56');
INSERT INTO `message_text` VALUES ('237', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 18:20:58');
INSERT INTO `message_text` VALUES ('238', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '菜单', '2016-08-14 18:29:41');
INSERT INTO `message_text` VALUES ('239', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 18:29:43');
INSERT INTO `message_text` VALUES ('240', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '菜单', '2016-08-14 18:30:19');
INSERT INTO `message_text` VALUES ('241', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 18:30:21');
INSERT INTO `message_text` VALUES ('242', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '菜单', '2016-08-14 18:30:27');
INSERT INTO `message_text` VALUES ('243', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 18:30:29');
INSERT INTO `message_text` VALUES ('244', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '菜单', '2016-08-14 18:30:57');
INSERT INTO `message_text` VALUES ('245', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 18:30:58');
INSERT INTO `message_text` VALUES ('246', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '菜单', '2016-08-14 18:31:24');
INSERT INTO `message_text` VALUES ('247', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 18:31:25');
INSERT INTO `message_text` VALUES ('248', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '菜单', '2016-08-14 18:31:41');
INSERT INTO `message_text` VALUES ('249', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 18:31:43');
INSERT INTO `message_text` VALUES ('250', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '菜单', '2016-08-14 18:31:56');
INSERT INTO `message_text` VALUES ('251', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 18:31:57');
INSERT INTO `message_text` VALUES ('252', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 18:32:02');
INSERT INTO `message_text` VALUES ('253', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '菜单', '2016-08-14 18:32:51');
INSERT INTO `message_text` VALUES ('254', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 18:32:53');
INSERT INTO `message_text` VALUES ('255', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '菜单', '2016-08-14 18:37:47');
INSERT INTO `message_text` VALUES ('256', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 18:37:49');
INSERT INTO `message_text` VALUES ('257', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '菜单', '2016-08-14 18:37:54');
INSERT INTO `message_text` VALUES ('258', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 18:37:55');
INSERT INTO `message_text` VALUES ('259', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', 'a', '2016-08-14 18:37:59');
INSERT INTO `message_text` VALUES ('260', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', 'd', '2016-08-14 18:38:01');
INSERT INTO `message_text` VALUES ('261', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', 's', '2016-08-14 18:38:02');
INSERT INTO `message_text` VALUES ('262', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', 'f', '2016-08-14 18:38:03');
INSERT INTO `message_text` VALUES ('263', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', 'wqd', '2016-08-14 18:38:48');
INSERT INTO `message_text` VALUES ('264', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 18:45:38');
INSERT INTO `message_text` VALUES ('265', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '菜单', '2016-08-14 18:45:42');
INSERT INTO `message_text` VALUES ('266', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '2', '2016-08-14 18:45:46');
INSERT INTO `message_text` VALUES ('267', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '菜单', '2016-08-14 19:41:29');
INSERT INTO `message_text` VALUES ('268', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 19:41:31');
INSERT INTO `message_text` VALUES ('269', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '菜单', '2016-08-14 19:42:33');
INSERT INTO `message_text` VALUES ('270', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 19:42:35');
INSERT INTO `message_text` VALUES ('271', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '6', '2016-08-14 19:52:09');
INSERT INTO `message_text` VALUES ('272', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 19:52:15');
INSERT INTO `message_text` VALUES ('273', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '2', '2016-08-14 19:52:17');
INSERT INTO `message_text` VALUES ('274', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 19:52:35');
INSERT INTO `message_text` VALUES ('275', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '2', '2016-08-14 19:52:44');
INSERT INTO `message_text` VALUES ('276', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 19:53:11');
INSERT INTO `message_text` VALUES ('277', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '菜单', '2016-08-14 19:53:36');
INSERT INTO `message_text` VALUES ('278', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 19:53:38');
INSERT INTO `message_text` VALUES ('279', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 19:53:50');
INSERT INTO `message_text` VALUES ('280', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '2', '2016-08-14 19:54:24');
INSERT INTO `message_text` VALUES ('281', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '4', '2016-08-14 19:54:26');
INSERT INTO `message_text` VALUES ('282', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '5', '2016-08-14 19:54:27');
INSERT INTO `message_text` VALUES ('283', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '6', '2016-08-14 19:54:29');
INSERT INTO `message_text` VALUES ('284', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '5', '2016-08-14 19:54:30');
INSERT INTO `message_text` VALUES ('285', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '得安全', '2016-08-14 19:59:51');
INSERT INTO `message_text` VALUES ('286', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '6', '2016-08-14 19:59:54');
INSERT INTO `message_text` VALUES ('287', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '5', '2016-08-14 19:59:56');
INSERT INTO `message_text` VALUES ('288', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '4', '2016-08-14 19:59:57');
INSERT INTO `message_text` VALUES ('289', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '3', '2016-08-14 19:59:59');
INSERT INTO `message_text` VALUES ('290', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '5', '2016-08-14 20:00:14');
INSERT INTO `message_text` VALUES ('291', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '5', '2016-08-14 20:00:17');
INSERT INTO `message_text` VALUES ('292', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '5', '2016-08-14 20:00:20');
INSERT INTO `message_text` VALUES ('293', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '4', '2016-08-14 20:00:22');
INSERT INTO `message_text` VALUES ('294', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '0', '2016-08-14 20:00:24');
INSERT INTO `message_text` VALUES ('295', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', 'a', '2016-08-14 20:00:27');
INSERT INTO `message_text` VALUES ('296', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '3', '2016-08-14 20:00:28');
INSERT INTO `message_text` VALUES ('297', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '菜单', '2016-08-14 20:10:37');
INSERT INTO `message_text` VALUES ('298', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 20:10:38');
INSERT INTO `message_text` VALUES ('299', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 20:10:54');
INSERT INTO `message_text` VALUES ('300', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '复活币', '2016-08-14 20:11:08');
INSERT INTO `message_text` VALUES ('301', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '复活币', '2016-08-14 20:11:43');
INSERT INTO `message_text` VALUES ('302', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '复活币', '2016-08-14 20:11:50');
INSERT INTO `message_text` VALUES ('303', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '3', '2016-08-14 20:19:02');
INSERT INTO `message_text` VALUES ('304', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '4', '2016-08-14 20:19:04');
INSERT INTO `message_text` VALUES ('305', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '2.', '2016-08-14 20:19:06');
INSERT INTO `message_text` VALUES ('306', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '菜单', '2016-08-14 20:40:28');
INSERT INTO `message_text` VALUES ('307', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 20:40:30');
INSERT INTO `message_text` VALUES ('308', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 20:41:11');
INSERT INTO `message_text` VALUES ('309', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 20:41:33');
INSERT INTO `message_text` VALUES ('310', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 20:43:18');
INSERT INTO `message_text` VALUES ('311', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 20:43:34');
INSERT INTO `message_text` VALUES ('312', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 20:43:36');
INSERT INTO `message_text` VALUES ('313', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 20:44:50');
INSERT INTO `message_text` VALUES ('314', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 20:44:50');
INSERT INTO `message_text` VALUES ('315', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 20:44:51');
INSERT INTO `message_text` VALUES ('316', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 20:45:02');
INSERT INTO `message_text` VALUES ('317', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '菜单', '2016-08-14 20:45:54');
INSERT INTO `message_text` VALUES ('318', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 20:46:02');
INSERT INTO `message_text` VALUES ('319', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '菜单', '2016-08-14 20:46:55');
INSERT INTO `message_text` VALUES ('320', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 20:46:56');
INSERT INTO `message_text` VALUES ('321', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 20:47:01');
INSERT INTO `message_text` VALUES ('322', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 20:47:23');
INSERT INTO `message_text` VALUES ('323', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 20:47:32');
INSERT INTO `message_text` VALUES ('324', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 20:47:47');
INSERT INTO `message_text` VALUES ('325', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '菜单', '2016-08-14 20:48:14');
INSERT INTO `message_text` VALUES ('326', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 20:48:20');
INSERT INTO `message_text` VALUES ('327', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 20:48:25');
INSERT INTO `message_text` VALUES ('328', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 20:48:30');
INSERT INTO `message_text` VALUES ('329', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '菜单', '2016-08-14 20:49:13');
INSERT INTO `message_text` VALUES ('330', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 20:49:14');
INSERT INTO `message_text` VALUES ('331', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 20:49:19');
INSERT INTO `message_text` VALUES ('332', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '菜单', '2016-08-14 20:50:06');
INSERT INTO `message_text` VALUES ('333', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 20:50:08');
INSERT INTO `message_text` VALUES ('334', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 20:50:12');
INSERT INTO `message_text` VALUES ('335', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '菜单', '2016-08-14 20:50:21');
INSERT INTO `message_text` VALUES ('336', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 20:50:22');
INSERT INTO `message_text` VALUES ('337', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 20:50:27');
INSERT INTO `message_text` VALUES ('338', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '5', '2016-08-14 20:50:50');
INSERT INTO `message_text` VALUES ('339', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '7', '2016-08-14 20:50:52');
INSERT INTO `message_text` VALUES ('340', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '2', '2016-08-14 20:50:54');
INSERT INTO `message_text` VALUES ('341', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '2', '2016-08-14 20:53:20');
INSERT INTO `message_text` VALUES ('342', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 20:54:04');
INSERT INTO `message_text` VALUES ('343', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 20:54:27');
INSERT INTO `message_text` VALUES ('344', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '2', '2016-08-14 20:54:34');
INSERT INTO `message_text` VALUES ('345', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 20:54:48');
INSERT INTO `message_text` VALUES ('346', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 20:54:51');
INSERT INTO `message_text` VALUES ('347', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 20:54:53');
INSERT INTO `message_text` VALUES ('348', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 20:54:54');
INSERT INTO `message_text` VALUES ('349', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 20:54:54');
INSERT INTO `message_text` VALUES ('350', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 20:54:55');
INSERT INTO `message_text` VALUES ('351', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 20:54:56');
INSERT INTO `message_text` VALUES ('352', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 20:58:12');
INSERT INTO `message_text` VALUES ('353', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 20:58:26');
INSERT INTO `message_text` VALUES ('354', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 20:58:45');
INSERT INTO `message_text` VALUES ('355', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '2', '2016-08-14 20:58:47');
INSERT INTO `message_text` VALUES ('356', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '2', '2016-08-14 20:58:49');
INSERT INTO `message_text` VALUES ('357', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '2', '2016-08-14 20:58:51');
INSERT INTO `message_text` VALUES ('358', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '2', '2016-08-14 20:58:52');
INSERT INTO `message_text` VALUES ('359', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '2', '2016-08-14 20:58:53');
INSERT INTO `message_text` VALUES ('360', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '2', '2016-08-14 20:58:54');
INSERT INTO `message_text` VALUES ('361', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '2', '2016-08-14 20:58:55');
INSERT INTO `message_text` VALUES ('362', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '2', '2016-08-14 20:58:56');
INSERT INTO `message_text` VALUES ('363', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 20:58:59');
INSERT INTO `message_text` VALUES ('364', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '2', '2016-08-14 20:59:00');
INSERT INTO `message_text` VALUES ('365', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '2', '2016-08-14 20:59:03');
INSERT INTO `message_text` VALUES ('366', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 20:59:03');
INSERT INTO `message_text` VALUES ('367', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 20:59:04');
INSERT INTO `message_text` VALUES ('368', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '2', '2016-08-14 21:05:24');
INSERT INTO `message_text` VALUES ('369', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 21:05:27');
INSERT INTO `message_text` VALUES ('370', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 21:05:31');
INSERT INTO `message_text` VALUES ('371', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 21:06:39');
INSERT INTO `message_text` VALUES ('372', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', 'n', '2016-08-14 21:07:26');
INSERT INTO `message_text` VALUES ('373', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '菜单', '2016-08-14 21:16:29');
INSERT INTO `message_text` VALUES ('374', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 21:16:30');
INSERT INTO `message_text` VALUES ('375', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '菜单', '2016-08-14 21:16:43');
INSERT INTO `message_text` VALUES ('376', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 21:16:44');
INSERT INTO `message_text` VALUES ('377', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '菜单', '2016-08-14 21:20:24');
INSERT INTO `message_text` VALUES ('378', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 21:20:29');
INSERT INTO `message_text` VALUES ('379', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', 'n', '2016-08-14 21:20:36');
INSERT INTO `message_text` VALUES ('380', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '菜单', '2016-08-14 21:21:55');
INSERT INTO `message_text` VALUES ('381', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '菜单', '2016-08-14 21:22:23');
INSERT INTO `message_text` VALUES ('382', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '菜单', '2016-08-14 21:22:36');
INSERT INTO `message_text` VALUES ('383', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 21:22:41');
INSERT INTO `message_text` VALUES ('384', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', 'n', '2016-08-14 21:22:48');
INSERT INTO `message_text` VALUES ('385', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', 'n', '2016-08-14 21:24:52');
INSERT INTO `message_text` VALUES ('386', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', 'n', '2016-08-14 21:25:55');
INSERT INTO `message_text` VALUES ('387', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 21:26:48');
INSERT INTO `message_text` VALUES ('388', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '菜单', '2016-08-14 21:27:12');
INSERT INTO `message_text` VALUES ('389', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 21:27:13');
INSERT INTO `message_text` VALUES ('390', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '菜单', '2016-08-14 21:31:17');
INSERT INTO `message_text` VALUES ('391', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 21:31:22');
INSERT INTO `message_text` VALUES ('392', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', 'n', '2016-08-14 21:31:29');
INSERT INTO `message_text` VALUES ('393', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '6', '2016-08-14 21:31:46');
INSERT INTO `message_text` VALUES ('394', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', 'n', '2016-08-14 21:31:58');
INSERT INTO `message_text` VALUES ('395', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 21:32:24');
INSERT INTO `message_text` VALUES ('396', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '2', '2016-08-14 21:32:36');
INSERT INTO `message_text` VALUES ('397', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 21:34:45');
INSERT INTO `message_text` VALUES ('398', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '复活币', '2016-08-14 21:34:57');
INSERT INTO `message_text` VALUES ('399', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '复活币', '2016-08-14 21:35:10');
INSERT INTO `message_text` VALUES ('400', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', 'n', '2016-08-14 21:35:17');
INSERT INTO `message_text` VALUES ('401', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', 'n', '2016-08-14 21:45:38');
INSERT INTO `message_text` VALUES ('402', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', 'n', '2016-08-14 21:47:10');
INSERT INTO `message_text` VALUES ('403', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', 'n', '2016-08-14 21:47:33');
INSERT INTO `message_text` VALUES ('404', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', 'n', '2016-08-14 21:49:01');
INSERT INTO `message_text` VALUES ('405', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', 'n', '2016-08-14 21:49:15');
INSERT INTO `message_text` VALUES ('406', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', 'n', '2016-08-14 21:50:43');
INSERT INTO `message_text` VALUES ('407', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', 'b', '2016-08-14 21:50:55');
INSERT INTO `message_text` VALUES ('408', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', 'n', '2016-08-14 21:50:57');
INSERT INTO `message_text` VALUES ('409', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', 'n', '2016-08-14 21:51:17');
INSERT INTO `message_text` VALUES ('410', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', 'n', '2016-08-14 21:51:22');
INSERT INTO `message_text` VALUES ('411', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', 'n', '2016-08-14 21:51:55');
INSERT INTO `message_text` VALUES ('412', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', 'n', '2016-08-14 21:52:18');
INSERT INTO `message_text` VALUES ('413', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', 'n', '2016-08-14 21:54:14');
INSERT INTO `message_text` VALUES ('414', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', 'n', '2016-08-14 21:54:39');
INSERT INTO `message_text` VALUES ('415', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', 'n', '2016-08-14 21:54:42');
INSERT INTO `message_text` VALUES ('416', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', 'n', '2016-08-14 22:01:04');
INSERT INTO `message_text` VALUES ('417', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 22:02:54');
INSERT INTO `message_text` VALUES ('418', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 22:04:04');
INSERT INTO `message_text` VALUES ('419', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 22:05:44');
INSERT INTO `message_text` VALUES ('420', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', 'n', '2016-08-14 22:05:54');
INSERT INTO `message_text` VALUES ('421', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', 'n', '2016-08-14 22:09:57');
INSERT INTO `message_text` VALUES ('422', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', 'n', '2016-08-14 22:10:48');
INSERT INTO `message_text` VALUES ('423', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', 'n', '2016-08-14 22:13:58');
INSERT INTO `message_text` VALUES ('424', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', 'n', '2016-08-14 22:18:42');
INSERT INTO `message_text` VALUES ('425', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 22:19:38');
INSERT INTO `message_text` VALUES ('426', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '复活币', '2016-08-14 22:19:48');
INSERT INTO `message_text` VALUES ('427', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', 'n', '2016-08-14 22:19:51');
INSERT INTO `message_text` VALUES ('428', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 22:19:57');
INSERT INTO `message_text` VALUES ('429', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', 'n', '2016-08-14 22:20:04');
INSERT INTO `message_text` VALUES ('430', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 22:20:07');
INSERT INTO `message_text` VALUES ('431', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', 'n', '2016-08-14 22:20:11');
INSERT INTO `message_text` VALUES ('432', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 22:20:39');
INSERT INTO `message_text` VALUES ('433', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '复活币', '2016-08-14 22:20:47');
INSERT INTO `message_text` VALUES ('434', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '复活币', '2016-08-14 22:20:57');
INSERT INTO `message_text` VALUES ('435', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '复活币', '2016-08-14 22:21:14');
INSERT INTO `message_text` VALUES ('436', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '复活币', '2016-08-14 22:22:15');
INSERT INTO `message_text` VALUES ('437', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '复活币', '2016-08-14 22:22:29');
INSERT INTO `message_text` VALUES ('438', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '菜单', '2016-08-14 22:35:04');
INSERT INTO `message_text` VALUES ('439', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 22:35:06');
INSERT INTO `message_text` VALUES ('440', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '菜单', '2016-08-14 22:35:28');
INSERT INTO `message_text` VALUES ('441', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 22:35:29');
INSERT INTO `message_text` VALUES ('442', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '菜单', '2016-08-14 22:40:57');
INSERT INTO `message_text` VALUES ('443', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 22:40:59');
INSERT INTO `message_text` VALUES ('444', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', 'n', '2016-08-14 22:41:21');
INSERT INTO `message_text` VALUES ('445', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 22:41:28');
INSERT INTO `message_text` VALUES ('446', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', 'n', '2016-08-14 22:41:35');
INSERT INTO `message_text` VALUES ('447', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 22:41:39');
INSERT INTO `message_text` VALUES ('448', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', 'n', '2016-08-14 22:41:43');
INSERT INTO `message_text` VALUES ('449', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '6', '2016-08-14 22:41:51');
INSERT INTO `message_text` VALUES ('450', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '5', '2016-08-14 22:41:53');
INSERT INTO `message_text` VALUES ('451', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '复活币', '2016-08-14 22:42:04');
INSERT INTO `message_text` VALUES ('452', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', 'n', '2016-08-14 22:42:08');
INSERT INTO `message_text` VALUES ('453', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '3', '2016-08-14 22:42:12');
INSERT INTO `message_text` VALUES ('454', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', 'n', '2016-08-14 22:42:17');
INSERT INTO `message_text` VALUES ('455', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '5', '2016-08-14 22:42:21');
INSERT INTO `message_text` VALUES ('456', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', 'n', '2016-08-14 22:42:24');
INSERT INTO `message_text` VALUES ('457', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '4', '2016-08-14 22:42:27');
INSERT INTO `message_text` VALUES ('458', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 22:42:36');
INSERT INTO `message_text` VALUES ('459', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '2', '2016-08-14 22:42:40');
INSERT INTO `message_text` VALUES ('460', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 22:44:11');
INSERT INTO `message_text` VALUES ('461', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '2', '2016-08-14 22:44:14');
INSERT INTO `message_text` VALUES ('462', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '菜单', '2016-08-14 22:45:20');
INSERT INTO `message_text` VALUES ('463', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '2', '2016-08-14 22:45:22');
INSERT INTO `message_text` VALUES ('464', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '菜单', '2016-08-14 22:45:26');
INSERT INTO `message_text` VALUES ('465', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 22:45:28');
INSERT INTO `message_text` VALUES ('466', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', 'n', '2016-08-14 22:45:34');
INSERT INTO `message_text` VALUES ('467', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '复活币', '2016-08-14 22:45:48');
INSERT INTO `message_text` VALUES ('468', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 22:45:56');
INSERT INTO `message_text` VALUES ('469', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '复活币', '2016-08-14 22:46:03');
INSERT INTO `message_text` VALUES ('470', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', 'n', '2016-08-14 22:46:06');
INSERT INTO `message_text` VALUES ('471', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '2', '2016-08-14 22:46:08');
INSERT INTO `message_text` VALUES ('472', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', 'n', '2016-08-14 22:46:11');
INSERT INTO `message_text` VALUES ('473', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '5', '2016-08-14 22:46:19');
INSERT INTO `message_text` VALUES ('474', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '复活币', '2016-08-14 22:46:29');
INSERT INTO `message_text` VALUES ('475', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '菜单', '2016-08-14 22:46:34');
INSERT INTO `message_text` VALUES ('476', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '2', '2016-08-14 22:46:38');
INSERT INTO `message_text` VALUES ('477', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 23:44:16');
INSERT INTO `message_text` VALUES ('478', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 23:44:48');
INSERT INTO `message_text` VALUES ('479', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 23:45:33');
INSERT INTO `message_text` VALUES ('480', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 23:45:47');
INSERT INTO `message_text` VALUES ('481', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 23:46:24');
INSERT INTO `message_text` VALUES ('482', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 23:47:36');
INSERT INTO `message_text` VALUES ('483', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 23:47:41');
INSERT INTO `message_text` VALUES ('484', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 23:48:24');
INSERT INTO `message_text` VALUES ('485', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 23:49:39');
INSERT INTO `message_text` VALUES ('486', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '??', '2016-08-14 23:49:46');
INSERT INTO `message_text` VALUES ('487', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '??', '2016-08-14 23:49:50');
INSERT INTO `message_text` VALUES ('488', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 23:49:53');
INSERT INTO `message_text` VALUES ('489', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '??', '2016-08-14 23:55:26');
INSERT INTO `message_text` VALUES ('490', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 23:55:29');
INSERT INTO `message_text` VALUES ('491', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '2', '2016-08-14 23:59:31');
INSERT INTO `message_text` VALUES ('492', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 23:59:34');
INSERT INTO `message_text` VALUES ('493', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '?*', '2016-08-14 23:59:42');
INSERT INTO `message_text` VALUES ('494', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '??', '2016-08-14 23:59:47');
INSERT INTO `message_text` VALUES ('495', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '1', '2016-08-14 23:59:49');

-- ----------------------------
-- Table structure for prop
-- ----------------------------
DROP TABLE IF EXISTS `prop`;
CREATE TABLE `prop` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `openid` varchar(128) NOT NULL COMMENT '用户ID',
  `name` varchar(128) NOT NULL COMMENT '道具名称',
  `num` int(11) NOT NULL COMMENT '数量',
  `describe` varchar(512) NOT NULL COMMENT '描述',
  PRIMARY KEY (`id`),
  KEY `openid` (`openid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='道具类';

-- ----------------------------
-- Records of prop
-- ----------------------------

-- ----------------------------
-- Table structure for questions
-- ----------------------------
DROP TABLE IF EXISTS `questions`;
CREATE TABLE `questions` (
  `id` int(11) NOT NULL COMMENT 'id',
  `passnum` int(11) NOT NULL COMMENT '关数',
  `subject` varchar(2000) NOT NULL COMMENT '题目',
  `picture` varchar(1000) DEFAULT NULL COMMENT '图片',
  `answertype` int(11) NOT NULL DEFAULT '1' COMMENT '答案类型(1:文字 2:图片 3:两者)',
  `xh` int(11) NOT NULL COMMENT '顺序',
  PRIMARY KEY (`id`),
  KEY `xh` (`xh`),
  KEY `passnum` (`passnum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='图库';

-- ----------------------------
-- Records of questions
-- ----------------------------
INSERT INTO `questions` VALUES ('1', '1', '你进入了一个镜子迷宫，走了好长时间都没有走到尽头。过了几个小时，你看到前面有个黑色的镜子，照不出人的脸，伸手一触，仿佛触不到边际。回眸一看，所有镜子都围成了一圈。黑得让人摸不着底。你想逃离，却被其中一面镜子吸了进去\n你获得复活币2枚，复活币用完则挑战失败', '10.jpg', '1', '0');
INSERT INTO `questions` VALUES ('2', '1', '你来到一个带有潮湿、腐朽气味的古墓。没有门，只有阴暗的走廊。主人或许是一个达官贵人，十分豪华奢靡，宝石的自身的光芒照亮了道路，你往前一直走，突然，宝石的光离你越来越远，你的前方，笼罩着一片黑暗。只有无尽的死寂和滴水的声音。。。。。。', '11.jpg', '1', '1');
INSERT INTO `questions` VALUES ('3', '1', '通过岩浆后，你渐渐意识到这古墓的可怕，定是一个颇有心机的人设计的，主人也定是有什么秘密不想让人发现。也一定与自己逃出镜子迷宫有一定的关系，想着想着，你来到了3扇门。。。', null, '2', '2');
INSERT INTO `questions` VALUES ('4', '1', '这个房间什么也没有，只有一张桌子，上面有三种宝石，宝石的颜色十分纯粹，也十分漂亮，但宝石下面仿佛连接着什么机关。。。。。。', '13.jpg', '1', '3');
INSERT INTO `questions` VALUES ('5', '1', '一路上都没有什么东西，只有一条漆黑的路，随着指南针的指示似乎一路很平安，水滴声一直在自己的耳畔回响，听起来悠远又好似近在咫尺', '14.jpg', '1', '4');
INSERT INTO `questions` VALUES ('6', '1', '映入眼帘的是三个棺材，金，银，钻石。你有强烈的预感，出去的线索一定在这棺木中。', '15.jpg', '1', '5');
INSERT INTO `questions` VALUES ('7', '1', '主墓什么都没有，只有一本书。上面记载了古墓的主人一生经历。色即是空，这古墓的主人早就察觉了这个真理，一生荣华富贵又能如何？最终不只是一笔一墨或是人们茶余饭后的笑柄？钻石永恒，而自己终究比不过钻石。出这墓穴的人终得成为虚境之贵人。书的最后一页写了“光明朝左，黑暗朝右，虚空看上，无尽看下”', '16.jpg', '1', '6');

-- ----------------------------
-- Table structure for userinfo
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `openid` varchar(128) NOT NULL COMMENT '用户id',
  `name` varchar(128) DEFAULT NULL COMMENT '用户名称',
  `kssj` datetime DEFAULT NULL COMMENT '开始时间',
  `jssj` datetime DEFAULT NULL COMMENT '结束时间',
  `fhbsl` int(11) NOT NULL COMMENT '复活币数量',
  `dqzs` int(11) NOT NULL DEFAULT '0' COMMENT '当前章节',
  `dqgs` int(11) NOT NULL DEFAULT '1' COMMENT '当前关数',
  `wz` varchar(128) NOT NULL COMMENT '记录用户的当前操作的位置',
  `lszgzs` int(11) NOT NULL DEFAULT '0' COMMENT '历史最高章节',
  `lszggs` int(11) NOT NULL DEFAULT '1' COMMENT '历史最高关数',
  PRIMARY KEY (`id`),
  KEY `openid` (`openid`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO `userinfo` VALUES ('18', 'oWgXss4u7qWlQjp7BU10Yb3q2Y24', '?*', '2016-08-14 23:59:26', null, '2', '1', '1', '3', '1', '1');
