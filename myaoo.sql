-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: myaoo
-- ------------------------------------------------------
-- Server version	5.7.17-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add permission',3,'add_permission'),(8,'Can change permission',3,'change_permission'),(9,'Can delete permission',3,'delete_permission'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add album',7,'add_album'),(20,'Can change album',7,'change_album'),(21,'Can delete album',7,'delete_album');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$36000$xVd39IiqeGfK$PF1W9o6hXjMhlI8UNjdltojVbfOTLCzzIQzOKf6h03s=','2017-08-04 03:01:54',0,'john','','','lennon@126.com',0,1,'2017-08-02 07:27:15'),(2,'pbkdf2_sha256$36000$tjgFclRaZ7dO$TIJqom8KXrpnp9CqJvQRrnmBUA3ZMzYuwpUD1EBrO5E=','2017-08-04 03:02:08',0,'Tom','','','tom@126.com',0,1,'2017-08-03 11:09:24'),(3,'pbkdf2_sha256$36000$ICFRKIRVC9WF$yMMSov12zRoKnGU8f4QBRcTMimLfavSfz490ZZcBLzY=','2017-08-04 03:47:40',1,'Arno','','','arno@126.com',1,1,'2017-08-04 01:34:50'),(4,'pbkdf2_sha256$36000$IASbDARf5U8z$N4mSY2gxxkHZpvfu7MiUNAphDN/fPVY3KSbypYBLTsY=','2017-08-24 02:22:48',0,'Luce','','','person@126.com',0,1,'2017-08-04 03:09:41'),(5,'pbkdf2_sha256$36000$PDSGyzehVuC0$HTMndA5MNg6bm7eowlWcEx5whTuJYZA7jloj6Adr+pM=','2017-08-24 02:37:07',0,'Jake','','','person@126.com',0,1,'2017-08-24 02:17:06');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_user`
--

DROP TABLE IF EXISTS `blog_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  `password` varchar(30) NOT NULL,
  `message_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `message_id` (`message_id`)
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_user`
--

LOCK TABLES `blog_user` WRITE;
/*!40000 ALTER TABLE `blog_user` DISABLE KEYS */;
INSERT INTO `blog_user` VALUES (1,'王林','123qwe',31),(2,'王达','123qwe',7),(3,'水电费','dd',467),(4,'艾林峰','阿萨德',123),(5,'看似简单','sd',97),(6,'成小春','36nvd',547),(7,'冯锡范','lsdf',4582),(8,'赵子咯','duh',1009),(9,'就开始更多','是',332),(10,'就是大红','加快速度',1245),(11,'热天','人 恩特',67532),(12,'nida ','djfpf ',84570),(13,'会计师电话费 ','看见对方',84),(14,'很快就关于 ','打回',67),(15,'麦克风','发过火',676),(16,'回地方规划','涉及到',845),(122,'温柔','让我',35345);
/*!40000 ALTER TABLE `blog_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `books` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `author` varchar(30) NOT NULL,
  `date` varchar(30) NOT NULL,
  `description` varchar(500) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,'雪国','川端康成','1948-08-07','《雪国》是川端康成最高代表作，其间描绘的虚无之美、洁净之美与悲哀之美达到极致，令人怦然心动，又惆怅不已。作品中唯美的意象描写融入至人物情感的表达之中，往往带着淡淡的哀思，表现了川端康成的物哀思想。'),(2,'麦田里的守望者','杰罗姆·大卫·塞林格','1951-08-25','《麦田里的守望者》原作名《The Catcher in the Rye》是美国作家杰罗姆·大卫·塞林格唯一的一部长篇小说，塞林格将故事的起止局限于16岁的中学生霍尔顿·考尔菲德从离开学校到纽约游荡的三天时间内，并借鉴了意识流天马行空的写作方法，充分探索了一个十几岁少年的内心世界。愤怒与焦虑是此书的两大主题，主人公的经历和思想在青少年中引起强烈共鸣，受到读者，特别是广大中学生的热烈欢迎。《纽约时报》的书评写道：在美国，阅读《麦田里的守望者》就像毕业要获得导师的首肯一样重要。其后，《麦田里的守望者》直接影响了这一类小说的创作。'),(3,'战争与和平','列夫·尼古拉耶维奇·托尔斯泰','','一八一二年，俄、法两国再度交战，安德烈·保尔康斯基在战役中身受重伤，而俄军节节败退，眼见莫斯科将陷于敌人之手了。罗斯托夫将原本用来搬运家产的马车，改去运送伤兵，娜达莎方能于伤兵中发现将要死去的安德烈·保尔康斯基。她向他谢罪并热诚看护他，但一切都是徒劳了，安德烈·保尔康斯基仍然逃不过死亡之神而去世了。彼尔化装成农夫，想伺机刺杀拿破仑，但却被法军逮捕而成为俘虏。其妻爱伦于战火中，仍继续其放荡行为，最后因误服堕胎药而死亡。几番奋战后，俄国终于赢得胜利，彼尔于莫斯科巧遇娜达莎，便结为夫妇，而安德烈·保尔康斯基的妹妹玛莉亚也与娜达莎之兄尼克拉结婚。'),(4,'巴黎圣母院','维克多·雨果','','丑聋人卡西莫多被巴黎圣母院的神父克罗德收养，做撞钟人，外表正经的克罗德神父自从遇见美丽的吉普赛少女拉·爱斯梅拉达后，被其美色所诱而神魂颠倒，指使卡西莫多强行掳走爱斯梅拉达，途中被福比斯骑兵上尉队长所救，爱斯梅拉达因而爱上了福比斯。但福比斯生性风流，被怀恨在心的克罗德刺杀，却没有死，并嫁祸于爱斯梅拉达，令她被判死刑，行刑时，卡西莫多将爱斯梅拉达救走并藏身于圣母院中，乞丐群众为救爱斯美拉达而冲入教堂，误与卡西莫多大战，爱斯梅拉达被由克罗德带领的军队绞杀在广场上，卡西莫多愤然将克罗德从教堂顶楼摔落地下，之后抚着爱斯梅拉达的尸体殉情。'),(5,'童年','马克西姆·高尔基','','讲了小主人公高尔基（阿廖沙）在父亲去世后，随母亲寄住在外祖父家中度过的岁月。其间，他得到外祖母的疼爱、呵护，受到外祖母所讲述的优美童话的熏陶，同时也亲眼目睹两个舅舅为争夺家产而争吵打架以及在生活琐事中表现出来的自私、贪婪。高尔基（阿廖沙）就是在这种“令人窒息的、充满可怕景象的狭小天地里”度过了自己的童年。'),(6,'呼啸山庄','艾米莉·勃朗特','','一个爱到极致的男人，做出了疯狂的行为。他用“爱”杀人，却也用爱自杀。凯瑟琳生前死后，他都活在痛苦里。凯瑟琳弥留之际，他还用说话去刺伤她。但是，希斯克力夫承受的却是两份伤痛，他自己的和凯瑟琳的。我很欣赏用情如此的男子。虽说有点变态和残酷，却怎么也恨不起他。还满同情他的。甚至很感动于他的疯狂的爱。相对来说，凯瑟琳就太自私了。她爱希斯克力夫，又嫁给富有的林惇，可以说，呼啸山庄和画眉田庄的悲剧有一大部分是她亲手造就的。 希斯克力夫，很疯狂。但很迷人。当然，也不失为一个好丈夫。只是，笨了一点。凯瑟琳：她坏、她自私、可是她对爱的执着，使她也因此散发着好女人与坏女人的混合着的魅力。'),(7,'大卫·科波菲尔','查尔斯·狄更斯','','《大卫·科波菲尔》通过主人公大卫一生的悲欢离合，多层次地揭示了当时社会的真实面貌，突出地表现了金钱对婚姻、家庭和社会的腐蚀作用。小说中一系列悲剧的形成都是金钱导致的。摩德斯通骗娶大卫的母亲是觊觎她的财产；艾米丽的私奔是经受不起金钱的诱惑；威克菲尔一家的痛苦，海穆的绝望，无一不是金钱造成的恶果。而卑鄙小人希普也是在金钱诱惑下一步步堕落的，最后落得个终身监禁的可耻下场。狄更斯正是从人道主义的思想出发，暴露了金钱的罪恶，从而揭开“维多利亚盛世”的美丽帷幕，显现出隐藏其后的社会真相。'),(8,'红与黑','司汤达','','《红与黑》是19世纪法国乃至欧洲文学的一座丰碑。小说围绕主人公于连的个人奋斗及两次爱情经历的描写，揭示了复辟王朝时期的波澜的阶级大博斗，反映了政治黑暗、教会腐败，贵族反动和资产阶级利欲熏心的广阔生活画面。于连的两次爱情动机都是以爱情占有为出发点最终要达到自己的政治目的。'),(9,'悲惨世界','维克多·雨果','','《悲惨世界》一书中，雨果以卓越的艺术魅力展示了资本主义社会奴役劳动人民、逼良为娼的残酷现实。雨果的这部传世之作，创造了一部反映法国现代社会生活和政治生活的长篇史话。全书时间跨度长达近半个世纪，个人命运与历史题材的结合，气势磅礴，色彩瑰丽，最大限度地体现了雨果在叙事方面的过人才华。在内容上的丰厚、深广与复杂而言，它无疑在雨果数量众多的作品中居于首位。'),(10,'安娜·卡列尼娜','列夫·尼古拉耶维奇·托尔斯泰','','《安娜·卡列尼娜》是俄国著名作家列夫·托尔斯泰的代表作品。本书通过女主人公安娜的追求爱情悲剧，和列文在农村面临危机而进行的改革与探索这两条线索，描绘了俄国从莫斯科到外省乡村广阔而丰富多彩的图景，先后描写了150多个人物，是一部社会百科全书式的作品。'),(11,'约翰·克利斯朵夫','罗曼·罗兰','','《约翰·克利斯朵夫》（Jean-Christophe）是一部通过主人公一生经历去反映现实社会一系列矛盾冲突，宣扬人道主义和英雄主义的长篇小说。小说描写了主人公奋斗的一生，从儿时音乐才能的觉醒、到青年时代对权贵的蔑视和反抗、再到成年后在事业上的追求和成功、最后达到精神宁静的崇高境界。'),(12,'飘','玛格丽特·米切尔','','《飘》所讲述的是一个以美国南北战争为背景的爱情故事。\n小说的主人公思嘉·奥哈拉是美国佐治亚州一位富足且颇有地位的种植园主的女儿。父亲杰拉尔德是爱尔兰的移民。刚到佐治亚州时，杰拉尔德身无分文，靠赌博赢得了塔罗庄园的所有权。于是就开始在这块红色的土地上创业，编织着他的美国之梦。直到43岁的时候，他才和芳龄15的埃伦——一个东海岸法国移民的女儿——结了婚。杰拉尔德心地善良，但脾气暴躁，而年轻的妻子则有着良好的家庭教育和严格的道德观念。她亲手操持着整个庄园的日常事务，甚至还为庄园里的黑奴看病，接生。因此，夫妇俩受到周围白人庄园主的尊敬，也深得黑人奴隶的爱戴。女儿思嘉.奥哈拉在这种环境中慢慢长大了。');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2017-08-04 03:58:30','1','Alfa',2,'[{\"changed\": {\"fields\": [\"num_stars\"]}}]',7,3);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(2,'auth','group'),(3,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'myapp','album'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2017-08-02 07:22:39'),(2,'auth','0001_initial','2017-08-02 07:22:48'),(3,'admin','0001_initial','2017-08-02 07:22:52'),(4,'admin','0002_logentry_remove_auto_add','2017-08-02 07:22:52'),(5,'contenttypes','0002_remove_content_type_name','2017-08-02 07:22:53'),(6,'auth','0002_alter_permission_name_max_length','2017-08-02 07:22:54'),(7,'auth','0003_alter_user_email_max_length','2017-08-02 07:22:55'),(8,'auth','0004_alter_user_username_opts','2017-08-02 07:22:55'),(9,'auth','0005_alter_user_last_login_null','2017-08-02 07:22:56'),(10,'auth','0006_require_contenttypes_0002','2017-08-02 07:22:56'),(11,'auth','0007_alter_validators_add_error_messages','2017-08-02 07:22:56'),(12,'auth','0008_alter_user_username_max_length','2017-08-02 07:22:57'),(13,'sessions','0001_initial','2017-08-02 07:22:57'),(14,'myapp','0001_initial','2017-08-04 03:39:10');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0vp01hwagtuzeurzl6mxitw23b1jc67w','YzdjNDA0NzQ4NmE3YjY3ODg2MWZmNWZmZDJlYTE1MTgyMTI2ZjRlOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2ZTA0YjQxODI1MzJmYjhmY2M1MThiOTJhYjRhMzk2YjljYTE5YTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=','2017-08-31 09:48:50'),('253babia806syot6exj7k2j4jgpovv0l','YzdjNDA0NzQ4NmE3YjY3ODg2MWZmNWZmZDJlYTE1MTgyMTI2ZjRlOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2ZTA0YjQxODI1MzJmYjhmY2M1MThiOTJhYjRhMzk2YjljYTE5YTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=','2017-08-31 09:48:53'),('2ytw5zus83dena92wuru2eo5apr17k7t','YzdjNDA0NzQ4NmE3YjY3ODg2MWZmNWZmZDJlYTE1MTgyMTI2ZjRlOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2ZTA0YjQxODI1MzJmYjhmY2M1MThiOTJhYjRhMzk2YjljYTE5YTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=','2017-09-01 11:28:54'),('4lnjuct8ob58iq60w5kjdwc1x4f1g353','YzdjNDA0NzQ4NmE3YjY3ODg2MWZmNWZmZDJlYTE1MTgyMTI2ZjRlOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2ZTA0YjQxODI1MzJmYjhmY2M1MThiOTJhYjRhMzk2YjljYTE5YTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=','2017-08-31 09:51:02'),('51bv3ht37f7nx96kjv3khm59ii1zfnse','YzdjNDA0NzQ4NmE3YjY3ODg2MWZmNWZmZDJlYTE1MTgyMTI2ZjRlOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2ZTA0YjQxODI1MzJmYjhmY2M1MThiOTJhYjRhMzk2YjljYTE5YTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=','2017-09-01 11:31:25'),('5ynneie5zjqfbs5okmgjrf0tv6g8k73v','YzdjNDA0NzQ4NmE3YjY3ODg2MWZmNWZmZDJlYTE1MTgyMTI2ZjRlOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2ZTA0YjQxODI1MzJmYjhmY2M1MThiOTJhYjRhMzk2YjljYTE5YTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=','2017-08-31 09:16:35'),('6rsuem6c6f6gmb9pbcru26oyp8ccy1sr','YzdjNDA0NzQ4NmE3YjY3ODg2MWZmNWZmZDJlYTE1MTgyMTI2ZjRlOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2ZTA0YjQxODI1MzJmYjhmY2M1MThiOTJhYjRhMzk2YjljYTE5YTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=','2017-09-04 10:29:07'),('7amlxetdn9xlapal0k2fwadhto0hmmh6','YzdjNDA0NzQ4NmE3YjY3ODg2MWZmNWZmZDJlYTE1MTgyMTI2ZjRlOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2ZTA0YjQxODI1MzJmYjhmY2M1MThiOTJhYjRhMzk2YjljYTE5YTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=','2017-09-07 02:22:48'),('7hx87115a5t1zx88vt1kqohstqeq9973','YzdjNDA0NzQ4NmE3YjY3ODg2MWZmNWZmZDJlYTE1MTgyMTI2ZjRlOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2ZTA0YjQxODI1MzJmYjhmY2M1MThiOTJhYjRhMzk2YjljYTE5YTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=','2017-09-01 10:20:28'),('8p430v5zdjkzvbq79fcdxmre1nex6z25','YzdjNDA0NzQ4NmE3YjY3ODg2MWZmNWZmZDJlYTE1MTgyMTI2ZjRlOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2ZTA0YjQxODI1MzJmYjhmY2M1MThiOTJhYjRhMzk2YjljYTE5YTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=','2017-08-31 09:51:14'),('a1frf4pcz4216qq6215xvbgu7oituytd','ZTdjNTdmMzM3M2MxNTY0OTZkZDg5ZGJlNmRlNmZiNDgwYmNjNTkzNTp7Il9hdXRoX3VzZXJfaGFzaCI6ImYxNTZiNWIzYzM5MTA0OTNjNWUzM2ZlY2Y2MWE2MTZjNWE4YjViZDIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI1In0=','2017-09-07 02:17:21'),('a6uhvuxixel8iuiisexclshbkoy9m4zk','YzdjNDA0NzQ4NmE3YjY3ODg2MWZmNWZmZDJlYTE1MTgyMTI2ZjRlOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2ZTA0YjQxODI1MzJmYjhmY2M1MThiOTJhYjRhMzk2YjljYTE5YTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=','2017-09-01 05:13:15'),('aaeuytt1gc709xyyxirvnsv4nfehrotd','YzdjNDA0NzQ4NmE3YjY3ODg2MWZmNWZmZDJlYTE1MTgyMTI2ZjRlOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2ZTA0YjQxODI1MzJmYjhmY2M1MThiOTJhYjRhMzk2YjljYTE5YTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=','2017-09-01 02:11:41'),('aot6pmlil4im8ai4soyfl8999frev8sn','YzdjNDA0NzQ4NmE3YjY3ODg2MWZmNWZmZDJlYTE1MTgyMTI2ZjRlOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2ZTA0YjQxODI1MzJmYjhmY2M1MThiOTJhYjRhMzk2YjljYTE5YTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=','2017-09-04 10:30:05'),('b9bdy8g2qjx0cfkcoy8khoi958mzl0h0','YzdjNDA0NzQ4NmE3YjY3ODg2MWZmNWZmZDJlYTE1MTgyMTI2ZjRlOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2ZTA0YjQxODI1MzJmYjhmY2M1MThiOTJhYjRhMzk2YjljYTE5YTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=','2017-08-31 09:49:50'),('ba47kftmnfai4orpoliau8v6mji5u6nm','YzdjNDA0NzQ4NmE3YjY3ODg2MWZmNWZmZDJlYTE1MTgyMTI2ZjRlOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2ZTA0YjQxODI1MzJmYjhmY2M1MThiOTJhYjRhMzk2YjljYTE5YTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=','2017-08-31 09:49:52'),('ccq37kms66mt3yw6orlllibnh968owxv','YzdjNDA0NzQ4NmE3YjY3ODg2MWZmNWZmZDJlYTE1MTgyMTI2ZjRlOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2ZTA0YjQxODI1MzJmYjhmY2M1MThiOTJhYjRhMzk2YjljYTE5YTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=','2017-09-06 10:34:08'),('cnsi3aoc5ihc9yms7w46mpm7dmtmxx0r','YzdjNDA0NzQ4NmE3YjY3ODg2MWZmNWZmZDJlYTE1MTgyMTI2ZjRlOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2ZTA0YjQxODI1MzJmYjhmY2M1MThiOTJhYjRhMzk2YjljYTE5YTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=','2017-08-31 09:51:30'),('d9jn3yzoc61c308a9epkka2zif3cvdtx','YzdjNDA0NzQ4NmE3YjY3ODg2MWZmNWZmZDJlYTE1MTgyMTI2ZjRlOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2ZTA0YjQxODI1MzJmYjhmY2M1MThiOTJhYjRhMzk2YjljYTE5YTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=','2017-08-31 10:04:57'),('edplxkbsa608u27f5jozlbw0s0xj61zp','YzdjNDA0NzQ4NmE3YjY3ODg2MWZmNWZmZDJlYTE1MTgyMTI2ZjRlOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2ZTA0YjQxODI1MzJmYjhmY2M1MThiOTJhYjRhMzk2YjljYTE5YTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=','2017-08-31 09:48:45'),('el7uupc44wc2ab2i13q2e7pll0kdjw6e','YzdjNDA0NzQ4NmE3YjY3ODg2MWZmNWZmZDJlYTE1MTgyMTI2ZjRlOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2ZTA0YjQxODI1MzJmYjhmY2M1MThiOTJhYjRhMzk2YjljYTE5YTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=','2017-09-04 10:29:04'),('evqem8mog7hwxp3871irxk5snm4c8jq9','YzdjNDA0NzQ4NmE3YjY3ODg2MWZmNWZmZDJlYTE1MTgyMTI2ZjRlOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2ZTA0YjQxODI1MzJmYjhmY2M1MThiOTJhYjRhMzk2YjljYTE5YTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=','2017-08-31 09:51:20'),('f7m0fkxrrj27hjvfvx0dwzntf1epsg6h','YzdjNDA0NzQ4NmE3YjY3ODg2MWZmNWZmZDJlYTE1MTgyMTI2ZjRlOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2ZTA0YjQxODI1MzJmYjhmY2M1MThiOTJhYjRhMzk2YjljYTE5YTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=','2017-09-01 04:24:26'),('fr4a0udmmgiubd8bkrf8v6gb542cteps','YzdjNDA0NzQ4NmE3YjY3ODg2MWZmNWZmZDJlYTE1MTgyMTI2ZjRlOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2ZTA0YjQxODI1MzJmYjhmY2M1MThiOTJhYjRhMzk2YjljYTE5YTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=','2017-08-31 09:53:13'),('fuj28auzqdyxd73gwdcettf5g7ce5eg3','YzdjNDA0NzQ4NmE3YjY3ODg2MWZmNWZmZDJlYTE1MTgyMTI2ZjRlOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2ZTA0YjQxODI1MzJmYjhmY2M1MThiOTJhYjRhMzk2YjljYTE5YTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=','2017-09-05 03:18:53'),('gha3c2b9apxm8va3y2eyv9vrxagx5j5i','YzdjNDA0NzQ4NmE3YjY3ODg2MWZmNWZmZDJlYTE1MTgyMTI2ZjRlOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2ZTA0YjQxODI1MzJmYjhmY2M1MThiOTJhYjRhMzk2YjljYTE5YTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=','2017-08-31 08:50:08'),('gsq2rscg14soghxcod9oz6iacz50m1aj','YzdjNDA0NzQ4NmE3YjY3ODg2MWZmNWZmZDJlYTE1MTgyMTI2ZjRlOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2ZTA0YjQxODI1MzJmYjhmY2M1MThiOTJhYjRhMzk2YjljYTE5YTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=','2017-09-01 06:03:00'),('gtnhsour5ud73grs6kai9abynvavgdnt','YzdjNDA0NzQ4NmE3YjY3ODg2MWZmNWZmZDJlYTE1MTgyMTI2ZjRlOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2ZTA0YjQxODI1MzJmYjhmY2M1MThiOTJhYjRhMzk2YjljYTE5YTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=','2017-09-05 03:20:09'),('h8h0p1e7dafys8hm2fz9uy5uces8jz7q','YzdjNDA0NzQ4NmE3YjY3ODg2MWZmNWZmZDJlYTE1MTgyMTI2ZjRlOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2ZTA0YjQxODI1MzJmYjhmY2M1MThiOTJhYjRhMzk2YjljYTE5YTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=','2017-09-07 02:08:58'),('hw8mwl5pcqvuqv4c20vrrt98n9jl9d7q','YzdjNDA0NzQ4NmE3YjY3ODg2MWZmNWZmZDJlYTE1MTgyMTI2ZjRlOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2ZTA0YjQxODI1MzJmYjhmY2M1MThiOTJhYjRhMzk2YjljYTE5YTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=','2017-09-06 10:34:38'),('hyw53ej7qjlynws8bzlgb968za20jjut','YzdjNDA0NzQ4NmE3YjY3ODg2MWZmNWZmZDJlYTE1MTgyMTI2ZjRlOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2ZTA0YjQxODI1MzJmYjhmY2M1MThiOTJhYjRhMzk2YjljYTE5YTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=','2017-08-31 09:24:25'),('i5oki5nqfdjkkna8y0o7d7a5fm4ne6va','YzdjNDA0NzQ4NmE3YjY3ODg2MWZmNWZmZDJlYTE1MTgyMTI2ZjRlOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2ZTA0YjQxODI1MzJmYjhmY2M1MThiOTJhYjRhMzk2YjljYTE5YTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=','2017-09-01 04:22:11'),('j6dk0oqrlj1wfkyt3boqyeqh6yvb7ota','YzdjNDA0NzQ4NmE3YjY3ODg2MWZmNWZmZDJlYTE1MTgyMTI2ZjRlOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2ZTA0YjQxODI1MzJmYjhmY2M1MThiOTJhYjRhMzk2YjljYTE5YTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=','2017-08-31 09:48:19'),('ldrfojzske6m8rmwcha7as9qw2bku0l9','YzdjNDA0NzQ4NmE3YjY3ODg2MWZmNWZmZDJlYTE1MTgyMTI2ZjRlOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2ZTA0YjQxODI1MzJmYjhmY2M1MThiOTJhYjRhMzk2YjljYTE5YTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=','2017-09-04 09:59:46'),('ltfhci8qhs71o04qiioua8k04yz6hybe','YzdjNDA0NzQ4NmE3YjY3ODg2MWZmNWZmZDJlYTE1MTgyMTI2ZjRlOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2ZTA0YjQxODI1MzJmYjhmY2M1MThiOTJhYjRhMzk2YjljYTE5YTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=','2017-09-04 10:31:59'),('m8enlszwjs30ksp6510md5ea3o8z4psf','YzdjNDA0NzQ4NmE3YjY3ODg2MWZmNWZmZDJlYTE1MTgyMTI2ZjRlOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2ZTA0YjQxODI1MzJmYjhmY2M1MThiOTJhYjRhMzk2YjljYTE5YTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=','2017-08-31 08:48:36'),('mkzo2nrajcmm3ehd56yv6bmpnw9juf8m','YzdjNDA0NzQ4NmE3YjY3ODg2MWZmNWZmZDJlYTE1MTgyMTI2ZjRlOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2ZTA0YjQxODI1MzJmYjhmY2M1MThiOTJhYjRhMzk2YjljYTE5YTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=','2017-09-01 02:12:31'),('mvouu8piqzlmngl43mxasjwt5trpcpub','YzdjNDA0NzQ4NmE3YjY3ODg2MWZmNWZmZDJlYTE1MTgyMTI2ZjRlOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2ZTA0YjQxODI1MzJmYjhmY2M1MThiOTJhYjRhMzk2YjljYTE5YTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=','2017-08-31 09:49:47'),('nu1xxylsb72cmu98jiikuadm5098xcaw','YzdjNDA0NzQ4NmE3YjY3ODg2MWZmNWZmZDJlYTE1MTgyMTI2ZjRlOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2ZTA0YjQxODI1MzJmYjhmY2M1MThiOTJhYjRhMzk2YjljYTE5YTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=','2017-09-01 02:13:31'),('nx2qonkdilk773ed15vkyk2cwjviyllh','YzdjNDA0NzQ4NmE3YjY3ODg2MWZmNWZmZDJlYTE1MTgyMTI2ZjRlOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2ZTA0YjQxODI1MzJmYjhmY2M1MThiOTJhYjRhMzk2YjljYTE5YTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=','2017-09-05 04:04:11'),('nx9vgvcwbhr8y02zcrrba18ah2dyvxnw','YzdjNDA0NzQ4NmE3YjY3ODg2MWZmNWZmZDJlYTE1MTgyMTI2ZjRlOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2ZTA0YjQxODI1MzJmYjhmY2M1MThiOTJhYjRhMzk2YjljYTE5YTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=','2017-08-31 10:19:21'),('ogcdswgox6us4ao0ed1k48we3p1htiqa','YzdjNDA0NzQ4NmE3YjY3ODg2MWZmNWZmZDJlYTE1MTgyMTI2ZjRlOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2ZTA0YjQxODI1MzJmYjhmY2M1MThiOTJhYjRhMzk2YjljYTE5YTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=','2017-08-31 09:48:38'),('ohv3nj2jf0kfo6d6lkqn8nnr4m1zh4vg','YzdjNDA0NzQ4NmE3YjY3ODg2MWZmNWZmZDJlYTE1MTgyMTI2ZjRlOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2ZTA0YjQxODI1MzJmYjhmY2M1MThiOTJhYjRhMzk2YjljYTE5YTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=','2017-09-01 09:31:27'),('orjzle3v20rmbu7ibiurz7zeipj5v43i','YzdjNDA0NzQ4NmE3YjY3ODg2MWZmNWZmZDJlYTE1MTgyMTI2ZjRlOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2ZTA0YjQxODI1MzJmYjhmY2M1MThiOTJhYjRhMzk2YjljYTE5YTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=','2017-08-31 10:31:36'),('oxam10eyg45vikw90r4rk8qxe20upoe3','YzdjNDA0NzQ4NmE3YjY3ODg2MWZmNWZmZDJlYTE1MTgyMTI2ZjRlOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2ZTA0YjQxODI1MzJmYjhmY2M1MThiOTJhYjRhMzk2YjljYTE5YTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=','2017-08-31 10:16:03'),('pxd3v7jiixjajsq3nr79wsgnlbytmkgo','YzdjNDA0NzQ4NmE3YjY3ODg2MWZmNWZmZDJlYTE1MTgyMTI2ZjRlOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2ZTA0YjQxODI1MzJmYjhmY2M1MThiOTJhYjRhMzk2YjljYTE5YTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=','2017-08-31 10:07:18'),('r1eze5i4s3metcacwe173393q9v177j1','YzdjNDA0NzQ4NmE3YjY3ODg2MWZmNWZmZDJlYTE1MTgyMTI2ZjRlOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2ZTA0YjQxODI1MzJmYjhmY2M1MThiOTJhYjRhMzk2YjljYTE5YTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=','2017-08-31 10:31:04'),('rqbilxhktjuqgye4rz8snn2r1plzy8h4','YzdjNDA0NzQ4NmE3YjY3ODg2MWZmNWZmZDJlYTE1MTgyMTI2ZjRlOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2ZTA0YjQxODI1MzJmYjhmY2M1MThiOTJhYjRhMzk2YjljYTE5YTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=','2017-08-31 08:55:44'),('sc9j0ls2263hjxsi51uw2rxhnxnyl6m6','ZTdjNTdmMzM3M2MxNTY0OTZkZDg5ZGJlNmRlNmZiNDgwYmNjNTkzNTp7Il9hdXRoX3VzZXJfaGFzaCI6ImYxNTZiNWIzYzM5MTA0OTNjNWUzM2ZlY2Y2MWE2MTZjNWE4YjViZDIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI1In0=','2017-09-07 02:37:07'),('smtjabpz302wt3lkw8lrs8ledsr3ugzh','YzdjNDA0NzQ4NmE3YjY3ODg2MWZmNWZmZDJlYTE1MTgyMTI2ZjRlOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2ZTA0YjQxODI1MzJmYjhmY2M1MThiOTJhYjRhMzk2YjljYTE5YTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=','2017-09-01 04:23:37'),('tsut9beaqxjs1sloccvx9iriwiz9847o','YzdjNDA0NzQ4NmE3YjY3ODg2MWZmNWZmZDJlYTE1MTgyMTI2ZjRlOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2ZTA0YjQxODI1MzJmYjhmY2M1MThiOTJhYjRhMzk2YjljYTE5YTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=','2017-09-07 01:53:07'),('u6k5s3oo1w0iqs06h1iz0wluq0zltlbg','YzdjNDA0NzQ4NmE3YjY3ODg2MWZmNWZmZDJlYTE1MTgyMTI2ZjRlOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2ZTA0YjQxODI1MzJmYjhmY2M1MThiOTJhYjRhMzk2YjljYTE5YTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=','2017-08-31 08:48:20'),('ugedq93jjsp469u3r4giv3cq0oqj6ck7','YzdjNDA0NzQ4NmE3YjY3ODg2MWZmNWZmZDJlYTE1MTgyMTI2ZjRlOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2ZTA0YjQxODI1MzJmYjhmY2M1MThiOTJhYjRhMzk2YjljYTE5YTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=','2017-09-07 01:53:18'),('vl12zeo0ozgk9at0vh6lr7s7z3jz3mbx','YzdjNDA0NzQ4NmE3YjY3ODg2MWZmNWZmZDJlYTE1MTgyMTI2ZjRlOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2ZTA0YjQxODI1MzJmYjhmY2M1MThiOTJhYjRhMzk2YjljYTE5YTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=','2017-09-05 04:19:02'),('vm8aqzm5arsvmoryedrda6x7r246bjip','YzdjNDA0NzQ4NmE3YjY3ODg2MWZmNWZmZDJlYTE1MTgyMTI2ZjRlOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2ZTA0YjQxODI1MzJmYjhmY2M1MThiOTJhYjRhMzk2YjljYTE5YTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=','2017-09-06 09:52:41'),('vpbsjnf35bv8grc75ygu79bksefgv2rj','YzdjNDA0NzQ4NmE3YjY3ODg2MWZmNWZmZDJlYTE1MTgyMTI2ZjRlOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2ZTA0YjQxODI1MzJmYjhmY2M1MThiOTJhYjRhMzk2YjljYTE5YTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=','2017-08-31 09:49:55'),('vvzgv0hdwdiq79d76gy2z1wknqfpyxg8','YzdjNDA0NzQ4NmE3YjY3ODg2MWZmNWZmZDJlYTE1MTgyMTI2ZjRlOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2ZTA0YjQxODI1MzJmYjhmY2M1MThiOTJhYjRhMzk2YjljYTE5YTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=','2017-09-01 02:12:45'),('wmkqo5pkvj3x3wg2uzle5ossf55cvlyz','YzdjNDA0NzQ4NmE3YjY3ODg2MWZmNWZmZDJlYTE1MTgyMTI2ZjRlOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2ZTA0YjQxODI1MzJmYjhmY2M1MThiOTJhYjRhMzk2YjljYTE5YTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=','2017-09-06 09:30:31'),('x79pkk853s04sj6ffr4l0w77ixsgtq5z','YzdjNDA0NzQ4NmE3YjY3ODg2MWZmNWZmZDJlYTE1MTgyMTI2ZjRlOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2ZTA0YjQxODI1MzJmYjhmY2M1MThiOTJhYjRhMzk2YjljYTE5YTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=','2017-09-01 02:13:38'),('yo63bfosp82fu6pyufe0tf9ieamcq3ex','YzdjNDA0NzQ4NmE3YjY3ODg2MWZmNWZmZDJlYTE1MTgyMTI2ZjRlOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2ZTA0YjQxODI1MzJmYjhmY2M1MThiOTJhYjRhMzk2YjljYTE5YTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=','2017-08-31 10:09:20');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myapp_album`
--

DROP TABLE IF EXISTS `myapp_album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `myapp_album` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `release_date` date NOT NULL,
  `num_stars` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myapp_album`
--

LOCK TABLES `myapp_album` WRITE;
/*!40000 ALTER TABLE `myapp_album` DISABLE KEYS */;
INSERT INTO `myapp_album` VALUES (1,'Alfa','2017-08-18',120),(2,'大哥','2017-08-18',12);
/*!40000 ALTER TABLE `myapp_album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `students` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(8) NOT NULL,
  `sex` char(4) NOT NULL,
  `age` tinyint(3) unsigned NOT NULL,
  `tel` char(13) DEFAULT '-',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'yuan','女',20,'12343434');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-08-24 11:22:38
