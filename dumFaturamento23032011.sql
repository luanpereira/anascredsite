/*
SQLyog Community Edition- MySQL GUI v8.03 
MySQL - 5.1.36-community-log : Database - bdmauricio
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

/*Table structure for table `jos_banner` */

DROP TABLE IF EXISTS `jos_banner`;

CREATE TABLE `jos_banner` (
  `bid` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL DEFAULT '0',
  `type` varchar(30) NOT NULL DEFAULT 'banner',
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `imptotal` int(11) NOT NULL DEFAULT '0',
  `impmade` int(11) NOT NULL DEFAULT '0',
  `clicks` int(11) NOT NULL DEFAULT '0',
  `imageurl` varchar(100) NOT NULL DEFAULT '',
  `clickurl` varchar(200) NOT NULL DEFAULT '',
  `date` datetime DEFAULT NULL,
  `showBanner` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `editor` varchar(50) DEFAULT NULL,
  `custombannercode` text,
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `sticky` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `tags` text NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY (`bid`),
  KEY `viewbanner` (`showBanner`),
  KEY `idx_banner_catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `jos_banner` */

/*Table structure for table `jos_bannerclient` */

DROP TABLE IF EXISTS `jos_bannerclient`;

CREATE TABLE `jos_bannerclient` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `contact` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `extrainfo` text NOT NULL,
  `checked_out` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out_time` time DEFAULT NULL,
  `editor` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `jos_bannerclient` */

/*Table structure for table `jos_bannertrack` */

DROP TABLE IF EXISTS `jos_bannertrack`;

CREATE TABLE `jos_bannertrack` (
  `track_date` date NOT NULL,
  `track_type` int(10) unsigned NOT NULL,
  `banner_id` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `jos_bannertrack` */

/*Table structure for table `jos_categories` */

DROP TABLE IF EXISTS `jos_categories`;

CREATE TABLE `jos_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `image` varchar(255) NOT NULL DEFAULT '',
  `section` varchar(50) NOT NULL DEFAULT '',
  `image_position` varchar(30) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `editor` varchar(50) DEFAULT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `count` int(11) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cat_idx` (`section`,`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `jos_categories` */

insert  into `jos_categories`(`id`,`parent_id`,`title`,`name`,`alias`,`image`,`section`,`image_position`,`description`,`published`,`checked_out`,`checked_out_time`,`editor`,`ordering`,`access`,`count`,`params`) values (1,0,'Diretoria','','diretoria','','com_contact_details','left','',1,0,'0000-00-00 00:00:00',NULL,1,0,0,''),(2,0,'Casamento','','casamento','','1','left','',1,0,'0000-00-00 00:00:00',NULL,1,0,0,''),(3,0,'Aniversário','','aniversario','','1','left','',1,0,'0000-00-00 00:00:00',NULL,2,0,0,''),(4,0,'Banco de Imagens','','banco-de-imagens','','1','left','',1,0,'0000-00-00 00:00:00',NULL,3,0,0,''),(5,0,'Álbuns','','albuns','','1','left','',1,0,'0000-00-00 00:00:00',NULL,4,0,0,'');

/*Table structure for table `jos_components` */

DROP TABLE IF EXISTS `jos_components`;

CREATE TABLE `jos_components` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `link` varchar(255) NOT NULL DEFAULT '',
  `menuid` int(11) unsigned NOT NULL DEFAULT '0',
  `parent` int(11) unsigned NOT NULL DEFAULT '0',
  `admin_menu_link` varchar(255) NOT NULL DEFAULT '',
  `admin_menu_alt` varchar(255) NOT NULL DEFAULT '',
  `option` varchar(50) NOT NULL DEFAULT '',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `admin_menu_img` varchar(255) NOT NULL DEFAULT '',
  `iscore` tinyint(4) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `parent_option` (`parent`,`option`(32))
) ENGINE=MyISAM AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;

/*Data for the table `jos_components` */

insert  into `jos_components`(`id`,`name`,`link`,`menuid`,`parent`,`admin_menu_link`,`admin_menu_alt`,`option`,`ordering`,`admin_menu_img`,`iscore`,`params`,`enabled`) values (1,'Banners','',0,0,'','Banner Management','com_banners',0,'js/ThemeOffice/component.png',0,'track_impressions=0\ntrack_clicks=0\ntag_prefix=\n\n',1),(2,'Banners','',0,1,'option=com_banners','Active Banners','com_banners',1,'js/ThemeOffice/edit.png',0,'',1),(3,'Clients','',0,1,'option=com_banners&c=client','Manage Clients','com_banners',2,'js/ThemeOffice/categories.png',0,'',1),(4,'Web Links','option=com_weblinks',0,0,'','Manage Weblinks','com_weblinks',0,'js/ThemeOffice/component.png',0,'show_comp_description=1\ncomp_description=\nshow_link_hits=1\nshow_link_description=1\nshow_other_cats=1\nshow_headings=1\nshow_page_title=1\nlink_target=0\nlink_icons=\n\n',1),(5,'Links','',0,4,'option=com_weblinks','View existing weblinks','com_weblinks',1,'js/ThemeOffice/edit.png',0,'',1),(6,'Categories','',0,4,'option=com_categories&section=com_weblinks','Manage weblink categories','',2,'js/ThemeOffice/categories.png',0,'',1),(7,'Contacts','option=com_contact',0,0,'','Edit contact details','com_contact',0,'js/ThemeOffice/component.png',1,'contact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_fax=\nicon_misc=\nshow_headings=1\nshow_position=1\nshow_email=0\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nbannedEmail=\nbannedSubject=\nbannedText=\nsession=1\ncustomReply=0\n\n',1),(8,'Contacts','',0,7,'option=com_contact','Edit contact details','com_contact',0,'js/ThemeOffice/edit.png',1,'',1),(9,'Categories','',0,7,'option=com_categories&section=com_contact_details','Manage contact categories','',2,'js/ThemeOffice/categories.png',1,'contact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_fax=\nicon_misc=\nshow_headings=1\nshow_position=1\nshow_email=0\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nbannedEmail=\nbannedSubject=\nbannedText=\nsession=1\ncustomReply=0\n\n',1),(10,'Polls','option=com_poll',0,0,'option=com_poll','Manage Polls','com_poll',0,'js/ThemeOffice/component.png',0,'',1),(11,'News Feeds','option=com_newsfeeds',0,0,'','News Feeds Management','com_newsfeeds',0,'js/ThemeOffice/component.png',0,'',1),(12,'Feeds','',0,11,'option=com_newsfeeds','Manage News Feeds','com_newsfeeds',1,'js/ThemeOffice/edit.png',0,'show_headings=1\nshow_name=1\nshow_articles=1\nshow_link=1\nshow_cat_description=1\nshow_cat_items=1\nshow_feed_image=1\nshow_feed_description=1\nshow_item_description=1\nfeed_word_count=0\n\n',1),(13,'Categories','',0,11,'option=com_categories&section=com_newsfeeds','Manage Categories','',2,'js/ThemeOffice/categories.png',0,'',1),(14,'User','option=com_user',0,0,'','','com_user',0,'',1,'',1),(15,'Search','option=com_search',0,0,'option=com_search','Search Statistics','com_search',0,'js/ThemeOffice/component.png',1,'enabled=0\n\n',1),(16,'Categories','',0,1,'option=com_categories&section=com_banner','Categories','',3,'',1,'',1),(17,'Wrapper','option=com_wrapper',0,0,'','Wrapper','com_wrapper',0,'',1,'',1),(18,'Mail To','',0,0,'','','com_mailto',0,'',1,'',1),(19,'Media Manager','',0,0,'option=com_media','Media Manager','com_media',0,'',1,'upload_extensions=bmp,csv,doc,epg,gif,ico,jpg,odg,odp,ods,odt,pdf,png,ppt,swf,txt,xcf,xls,BMP,CSV,DOC,EPG,GIF,ICO,JPG,ODG,ODP,ODS,ODT,PDF,PNG,PPT,SWF,TXT,XCF,XLS\nupload_maxsize=10000000\nfile_path=images\nimage_path=images/stories\nrestrict_uploads=1\nallowed_media_usergroup=3\ncheck_mime=1\nimage_extensions=bmp,gif,jpg,png\nignore_extensions=\nupload_mime=image/jpeg,image/gif,image/png,image/bmp,application/x-shockwave-flash,application/msword,application/excel,application/pdf,application/powerpoint,text/plain,application/x-zip\nupload_mime_illegal=text/html\nenable_flash=0\n\n',1),(20,'Articles','option=com_content',0,0,'','','com_content',0,'',1,'show_noauth=0\nshow_title=1\nlink_titles=0\nshow_intro=1\nshow_section=0\nlink_section=0\nshow_category=0\nlink_category=0\nshow_author=0\nshow_create_date=0\nshow_modify_date=0\nshow_item_navigation=0\nshow_readmore=1\nshow_vote=0\nshow_icons=1\nshow_pdf_icon=0\nshow_print_icon=0\nshow_email_icon=1\nshow_hits=1\nfeed_summary=0\nfilter_tags=\nfilter_attritbutes=\n\n',1),(21,'Configuration Manager','',0,0,'','Configuration','com_config',0,'',1,'',1),(22,'Installation Manager','',0,0,'','Installer','com_installer',0,'',1,'',1),(23,'Language Manager','',0,0,'','Languages','com_languages',0,'',1,'site=pt-BR\nadministrator=pt-BR\n\n',1),(24,'Mass mail','',0,0,'','Mass Mail','com_massmail',0,'',1,'mailSubjectPrefix=\nmailBodySuffix=\n\n',1),(25,'Menu Editor','',0,0,'','Menu Editor','com_menus',0,'',1,'',1),(27,'Messaging','',0,0,'','Messages','com_messages',0,'',1,'',1),(28,'Modules Manager','',0,0,'','Modules','com_modules',0,'',1,'',1),(29,'Plugin Manager','',0,0,'','Plugins','com_plugins',0,'',1,'',1),(30,'Template Manager','',0,0,'','Templates','com_templates',0,'',1,'',1),(31,'User Manager','',0,0,'','Users','com_users',0,'',1,'allowUserRegistration=1\nnew_usertype=Registered\nuseractivation=1\nfrontend_userparams=1\n\n',1),(32,'Cache Manager','',0,0,'','Cache','com_cache',0,'',1,'',1),(33,'Control Panel','',0,0,'','Control Panel','com_cpanel',0,'',1,'',1),(44,'Advanced Flash Mp3 Player','option=com_mp3player',0,0,'option=com_mp3player','Advanced Flash Mp3 Player','com_mp3player',0,'js/ThemeOffice/component.png',0,'',1),(45,'Albums','',0,44,'option=com_mp3player&act=albums','Albums','com_mp3player',0,'js/ThemeOffice/component.png',0,'',1),(46,'Songs','',0,44,'option=com_mp3player&act=songs','Songs','com_mp3player',1,'js/ThemeOffice/component.png',0,'',1),(47,'Phoca Gallery','option=com_phocagallery',0,0,'option=com_phocagallery','Phoca Gallery','com_phocagallery',0,'components/com_phocagallery/assets/images/icon-16-pg-menu.png',0,'',1),(48,'Control Panel','',0,47,'option=com_phocagallery','Control Panel','com_phocagallery',0,'components/com_phocagallery/assets/images/icon-16-pg-control-panel.png',0,'',1),(49,'Images','',0,47,'option=com_phocagallery&view=phocagallerys','Images','com_phocagallery',1,'components/com_phocagallery/assets/images/icon-16-pg-menu-gal.png',0,'',1),(50,'Categories','',0,47,'option=com_phocagallery&view=phocagallerycs','Categories','com_phocagallery',2,'components/com_phocagallery/assets/images/icon-16-pg-menu-cat.png',0,'',1),(51,'Themes','',0,47,'option=com_phocagallery&view=phocagalleryt','Themes','com_phocagallery',3,'components/com_phocagallery/assets/images/icon-16-pg-menu-theme.png',0,'',1),(52,'Category Rating','',0,47,'option=com_phocagallery&view=phocagalleryra','Category Rating','com_phocagallery',4,'components/com_phocagallery/assets/images/icon-16-pg-menu-vote.png',0,'',1),(53,'Image Rating','',0,47,'option=com_phocagallery&view=phocagalleryraimg','Image Rating','com_phocagallery',5,'components/com_phocagallery/assets/images/icon-16-pg-menu-vote-img.png',0,'',1),(54,'Category Comments','',0,47,'option=com_phocagallery&view=phocagallerycos','Category Comments','com_phocagallery',6,'components/com_phocagallery/assets/images/icon-16-pg-menu-comment.png',0,'',1),(55,'Image Comments','',0,47,'option=com_phocagallery&view=phocagallerycoimgs','Image Comments','com_phocagallery',7,'components/com_phocagallery/assets/images/icon-16-pg-menu-comment-img.png',0,'',1),(56,'Users','',0,47,'option=com_phocagallery&view=phocagalleryusers','Users','com_phocagallery',8,'components/com_phocagallery/assets/images/icon-16-pg-menu-users.png',0,'',1),(57,'Info','',0,47,'option=com_phocagallery&view=phocagalleryin','Info','com_phocagallery',9,'components/com_phocagallery/assets/images/icon-16-pg-menu-info.png',0,'',1),(58,'FlippingBook','option=com_flippingbook',0,0,'option=com_flippingbook','FlippingBook','com_flippingbook',0,'components/com_flippingbook/images/icon_fb.png',0,'',1),(59,'Configuration','',0,58,'option=com_flippingbook&task=configuration','Configuration','com_flippingbook',0,'components/com_flippingbook/images/icon_config.png',0,'',1),(60,'Manage Categories','',0,58,'option=com_flippingbook&task=category_manager','Manage Categories','com_flippingbook',1,'components/com_flippingbook/images/icon_cm.png',0,'',1),(61,'Manage Books','',0,58,'option=com_flippingbook&task=book_manager','Manage Books','com_flippingbook',2,'components/com_flippingbook/images/icon_bm.png',0,'',1),(62,'Manage Pages','',0,58,'option=com_flippingbook&task=page_manager','Manage Pages','com_flippingbook',3,'components/com_flippingbook/images/icon_pm.png',0,'',1),(63,'Batch Add Pages','',0,58,'option=com_flippingbook&task=batch_add_pages','Batch Add Pages','com_flippingbook',4,'components/com_flippingbook/images/icon_batch.png',0,'',1),(64,'Manage Files','',0,58,'option=com_flippingbook&task=file_manager','Manage Files','com_flippingbook',5,'components/com_flippingbook/images/icon_fm.png',0,'',1);

/*Table structure for table `jos_contact_details` */

DROP TABLE IF EXISTS `jos_contact_details`;

CREATE TABLE `jos_contact_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `con_position` varchar(255) DEFAULT NULL,
  `address` text,
  `suburb` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `postcode` varchar(100) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `misc` mediumtext,
  `image` varchar(255) DEFAULT NULL,
  `imagepos` varchar(20) DEFAULT NULL,
  `email_to` varchar(255) DEFAULT NULL,
  `default_con` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `catid` int(11) NOT NULL DEFAULT '0',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mobile` varchar(255) NOT NULL DEFAULT '',
  `webpage` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `jos_contact_details` */

insert  into `jos_contact_details`(`id`,`name`,`alias`,`con_position`,`address`,`suburb`,`state`,`country`,`postcode`,`telephone`,`fax`,`misc`,`image`,`imagepos`,`email_to`,`default_con`,`published`,`checked_out`,`checked_out_time`,`ordering`,`params`,`user_id`,`catid`,`access`,`mobile`,`webpage`) values (1,'Maurício Moreira','mauricio-moreira','Proprietário/Fotógrafo','Rua 08, Quadra A, Nº 20, Loja 02 - São Francisco\r\nCEP 65076-060 - São Luis - MA','','','','','+ 55 (98) 3235 9634','','','',NULL,'mauriciomoreira@globo.com',0,1,0,'0000-00-00 00:00:00',1,'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=0\nbanned_email=\nbanned_subject=\nbanned_text=',0,1,0,'+ 55 (98) 9975-5085','');

/*Table structure for table `jos_content` */

DROP TABLE IF EXISTS `jos_content`;

CREATE TABLE `jos_content` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `title_alias` varchar(255) NOT NULL DEFAULT '',
  `introtext` mediumtext NOT NULL,
  `fulltext` mediumtext NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `sectionid` int(11) unsigned NOT NULL DEFAULT '0',
  `mask` int(11) unsigned NOT NULL DEFAULT '0',
  `catid` int(11) unsigned NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `images` text NOT NULL,
  `urls` text NOT NULL,
  `attribs` text NOT NULL,
  `version` int(11) unsigned NOT NULL DEFAULT '1',
  `parentid` int(11) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `access` int(11) unsigned NOT NULL DEFAULT '0',
  `hits` int(11) unsigned NOT NULL DEFAULT '0',
  `metadata` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_section` (`sectionid`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `jos_content` */

insert  into `jos_content`(`id`,`title`,`alias`,`title_alias`,`introtext`,`fulltext`,`state`,`sectionid`,`mask`,`catid`,`created`,`created_by`,`created_by_alias`,`modified`,`modified_by`,`checked_out`,`checked_out_time`,`publish_up`,`publish_down`,`images`,`urls`,`attribs`,`version`,`parentid`,`ordering`,`metakey`,`metadesc`,`access`,`hits`,`metadata`) values (1,'O Fotógrafo','o-fotografo','','<p> </p>\r\n<table border=\"0\" cellpadding=\"10\">\r\n<tbody>\r\n<tr>\r\n<td valign=\"top\">\r\n<p style=\"text-align: justify; text-indent: 35.4pt; line-height:2;\">Nascido na capital maranhense, Maurício Moreira iniciou sua carreia em 1999 enquanto cursava Desenho Industrial na Universidade Federal Do Maranhão (UFMA).</p>\r\n<p style=\"text-align: justify; text-indent: 35.4pt; line-height:2;\">De fotógrafo de eventos sociais passou ao fotojornalismo, lançando a exposição “Segredos do Olhar”. Há 9 anos montou seu próprio estúdio, Maurício Moreira Fotografia, onde continua atuando na área de eventos sociais diversificando seu campo com fotos de estúdio, publicidade, fotos aéreas e banco de imagens.</p>\r\n<p style=\"text-align: justify; text-indent: 35.4pt; line-height:2;\">Homem de família e ludovicense nato, Maurício sabe como é importante registrar em detalhes cada momento de uma ocasião, do casamento ao cotidiano das pessoas. Cada segundo, gesto, sensação é captada pelas lentes sensíveis deste profissional experiente e talentoso.</p>\r\n</td>\r\n<td>\r\n<div style=\"padding-left:20px;\"><img src=\"images/stories/mauricio.png\" border=\"0\" width=\"250\" style=\"float: right;\" /></div>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>','',1,0,0,0,'2011-04-06 04:14:18',62,'','2011-04-06 05:52:45',62,0,'0000-00-00 00:00:00','2011-04-06 04:14:18','0000-00-00 00:00:00','','','show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=',13,0,2,'','',0,29,'robots=\nauthor='),(2,'Desenvolvimento','desenvolvimento','','<p>Página em Construção!</p>','',1,0,0,0,'2011-04-06 05:56:39',62,'','0000-00-00 00:00:00',0,0,'0000-00-00 00:00:00','2011-04-06 05:56:39','0000-00-00 00:00:00','','','show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=',1,0,1,'','',0,28,'robots=\nauthor=');

/*Table structure for table `jos_content_frontpage` */

DROP TABLE IF EXISTS `jos_content_frontpage`;

CREATE TABLE `jos_content_frontpage` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `jos_content_frontpage` */

/*Table structure for table `jos_content_rating` */

DROP TABLE IF EXISTS `jos_content_rating`;

CREATE TABLE `jos_content_rating` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `rating_sum` int(11) unsigned NOT NULL DEFAULT '0',
  `rating_count` int(11) unsigned NOT NULL DEFAULT '0',
  `lastip` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `jos_content_rating` */

/*Table structure for table `jos_core_acl_aro` */

DROP TABLE IF EXISTS `jos_core_acl_aro`;

CREATE TABLE `jos_core_acl_aro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `section_value` varchar(240) NOT NULL DEFAULT '0',
  `value` varchar(240) NOT NULL DEFAULT '',
  `order_value` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `hidden` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `jos_section_value_value_aro` (`section_value`(100),`value`(100)),
  KEY `jos_gacl_hidden_aro` (`hidden`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `jos_core_acl_aro` */

insert  into `jos_core_acl_aro`(`id`,`section_value`,`value`,`order_value`,`name`,`hidden`) values (10,'users','62',0,'Administrator',0),(11,'users','63',0,'Maurício Moreira',0);

/*Table structure for table `jos_core_acl_aro_groups` */

DROP TABLE IF EXISTS `jos_core_acl_aro_groups`;

CREATE TABLE `jos_core_acl_aro_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `jos_gacl_parent_id_aro_groups` (`parent_id`),
  KEY `jos_gacl_lft_rgt_aro_groups` (`lft`,`rgt`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

/*Data for the table `jos_core_acl_aro_groups` */

insert  into `jos_core_acl_aro_groups`(`id`,`parent_id`,`name`,`lft`,`rgt`,`value`) values (17,0,'ROOT',1,22,'ROOT'),(28,17,'USERS',2,21,'USERS'),(29,28,'Public Frontend',3,12,'Public Frontend'),(18,29,'Registered',4,11,'Registered'),(19,18,'Author',5,10,'Author'),(20,19,'Editor',6,9,'Editor'),(21,20,'Publisher',7,8,'Publisher'),(30,28,'Public Backend',13,20,'Public Backend'),(23,30,'Manager',14,19,'Manager'),(24,23,'Administrator',15,18,'Administrator'),(25,24,'Super Administrator',16,17,'Super Administrator');

/*Table structure for table `jos_core_acl_aro_map` */

DROP TABLE IF EXISTS `jos_core_acl_aro_map`;

CREATE TABLE `jos_core_acl_aro_map` (
  `acl_id` int(11) NOT NULL DEFAULT '0',
  `section_value` varchar(230) NOT NULL DEFAULT '0',
  `value` varchar(100) NOT NULL,
  PRIMARY KEY (`acl_id`,`section_value`,`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `jos_core_acl_aro_map` */

/*Table structure for table `jos_core_acl_aro_sections` */

DROP TABLE IF EXISTS `jos_core_acl_aro_sections`;

CREATE TABLE `jos_core_acl_aro_sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(230) NOT NULL DEFAULT '',
  `order_value` int(11) NOT NULL DEFAULT '0',
  `name` varchar(230) NOT NULL DEFAULT '',
  `hidden` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `jos_gacl_value_aro_sections` (`value`),
  KEY `jos_gacl_hidden_aro_sections` (`hidden`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `jos_core_acl_aro_sections` */

insert  into `jos_core_acl_aro_sections`(`id`,`value`,`order_value`,`name`,`hidden`) values (10,'users',1,'Users',0);

/*Table structure for table `jos_core_acl_groups_aro_map` */

DROP TABLE IF EXISTS `jos_core_acl_groups_aro_map`;

CREATE TABLE `jos_core_acl_groups_aro_map` (
  `group_id` int(11) NOT NULL DEFAULT '0',
  `section_value` varchar(240) NOT NULL DEFAULT '',
  `aro_id` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `group_id_aro_id_groups_aro_map` (`group_id`,`section_value`,`aro_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `jos_core_acl_groups_aro_map` */

insert  into `jos_core_acl_groups_aro_map`(`group_id`,`section_value`,`aro_id`) values (24,'',11),(25,'',10);

/*Table structure for table `jos_core_log_items` */

DROP TABLE IF EXISTS `jos_core_log_items`;

CREATE TABLE `jos_core_log_items` (
  `time_stamp` date NOT NULL DEFAULT '0000-00-00',
  `item_table` varchar(50) NOT NULL DEFAULT '',
  `item_id` int(11) unsigned NOT NULL DEFAULT '0',
  `hits` int(11) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `jos_core_log_items` */

/*Table structure for table `jos_core_log_searches` */

DROP TABLE IF EXISTS `jos_core_log_searches`;

CREATE TABLE `jos_core_log_searches` (
  `search_term` varchar(128) NOT NULL DEFAULT '',
  `hits` int(11) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `jos_core_log_searches` */

/*Table structure for table `jos_flippingbook_books` */

DROP TABLE IF EXISTS `jos_flippingbook_books`;

CREATE TABLE `jos_flippingbook_books` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alias` text NOT NULL,
  `allow_pages_unload` tinyint(1) NOT NULL,
  `always_opened` tinyint(1) NOT NULL,
  `auto_flip_size` int(4) NOT NULL,
  `background_color` varchar(10) NOT NULL,
  `background_image` varchar(255) NOT NULL,
  `background_image_placement` varchar(10) NOT NULL,
  `book_height` varchar(6) NOT NULL,
  `book_width` varchar(6) NOT NULL,
  `category_id` int(6) NOT NULL,
  `center_book` tinyint(1) NOT NULL,
  `checked_out` int(11) NOT NULL,
  `checked_out_time` int(11) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `description` text NOT NULL,
  `direction` varchar(6) NOT NULL,
  `download_size` varchar(100) NOT NULL,
  `download_title` varchar(100) NOT NULL,
  `download_url` varchar(255) NOT NULL,
  `dynamic_shadows_depth` varchar(5) NOT NULL,
  `emailIcon` tinyint(1) NOT NULL,
  `first_last_buttons` tinyint(1) NOT NULL,
  `first_page` int(4) NOT NULL,
  `flash_height` varchar(6) NOT NULL,
  `flash_width` varchar(6) NOT NULL,
  `flip_corner_style` varchar(20) NOT NULL,
  `frame_color` varchar(10) NOT NULL,
  `frame_width` int(4) NOT NULL,
  `fullscreen_enabled` tinyint(1) NOT NULL,
  `fullscreen_hint` text NOT NULL,
  `go_to_page_field` tinyint(1) NOT NULL,
  `hardcover` tinyint(1) NOT NULL,
  `hits` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `navigation_bar` varchar(255) NOT NULL,
  `navigation_bar_placement` varchar(10) NOT NULL,
  `new_window_height` int(4) NOT NULL,
  `new_window_width` int(4) NOT NULL,
  `open_book_in` int(4) NOT NULL,
  `ordering` int(6) NOT NULL,
  `page_background_color` varchar(10) NOT NULL,
  `preview_image` varchar(255) NOT NULL,
  `print_enabled` tinyint(1) NOT NULL,
  `printIcon` tinyint(1) NOT NULL,
  `published` tinyint(1) NOT NULL,
  `scale_content` tinyint(1) NOT NULL,
  `show_book_description` tinyint(1) NOT NULL,
  `show_book_title` tinyint(1) NOT NULL,
  `show_pages_description` tinyint(1) NOT NULL,
  `show_slide_show_button` tinyint(4) NOT NULL,
  `show_zoom_hint` tinyint(1) NOT NULL,
  `slideshow_auto_play` tinyint(1) NOT NULL,
  `slideshow_button` tinyint(1) NOT NULL,
  `slideshow_display_duration` int(5) NOT NULL,
  `sound_control_button` int(1) NOT NULL,
  `static_shadows_depth` varchar(5) NOT NULL,
  `static_shadows_type` varchar(15) NOT NULL,
  `title` text NOT NULL,
  `transparent_pages` tinyint(1) NOT NULL,
  `zoom_enabled` tinyint(1) NOT NULL,
  `zoom_image_height` int(5) NOT NULL,
  `zoom_image_width` int(5) NOT NULL,
  `zoom_ui_color` varchar(10) NOT NULL,
  `zooming_method` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `jos_flippingbook_books` */

insert  into `jos_flippingbook_books`(`id`,`alias`,`allow_pages_unload`,`always_opened`,`auto_flip_size`,`background_color`,`background_image`,`background_image_placement`,`book_height`,`book_width`,`category_id`,`center_book`,`checked_out`,`checked_out_time`,`created`,`description`,`direction`,`download_size`,`download_title`,`download_url`,`dynamic_shadows_depth`,`emailIcon`,`first_last_buttons`,`first_page`,`flash_height`,`flash_width`,`flip_corner_style`,`frame_color`,`frame_width`,`fullscreen_enabled`,`fullscreen_hint`,`go_to_page_field`,`hardcover`,`hits`,`modified`,`navigation_bar`,`navigation_bar_placement`,`new_window_height`,`new_window_width`,`open_book_in`,`ordering`,`page_background_color`,`preview_image`,`print_enabled`,`printIcon`,`published`,`scale_content`,`show_book_description`,`show_book_title`,`show_pages_description`,`show_slide_show_button`,`show_zoom_hint`,`slideshow_auto_play`,`slideshow_button`,`slideshow_display_duration`,`sound_control_button`,`static_shadows_depth`,`static_shadows_type`,`title`,`transparent_pages`,`zoom_enabled`,`zoom_image_height`,`zoom_image_width`,`zoom_ui_color`,`zooming_method`) values (1,'flippingbook-in-action',0,0,75,'dedede','abstract_background_blue.jpg','fit','400','300',1,1,0,0,'2009-01-01 00:00:00','This sample book demonstrates several ways of using the component.<br />   FlippingBook engine works with <strong>JPG, PNG, GIF and SWF</strong> (Flash) files. The JPG is convenient for creating picture albums, PNG or GIF format - for text, screenshots, drafts. The SWF format is convenient for presentations with animation, video, links etc.<em> You can modify this text in administration back-end  (Components &gt; FlippingBook &gt; Manage Books &gt; FlippingBook In Action  &gt; Description).</em>','LTR','100 Kb','Download Book','http://localhost/my-book.pdf','2',1,1,1,'500','100%','manually','FFFFFF',0,1,'',1,1,7,'2008-01-01 00:00:00','navigation.swf','bottom',640,640,1,1,'EEEEEE','book_preview.png',1,1,1,1,1,1,1,1,1,0,1,5000,1,'1','Asymmetric','FlippingBook In Action',0,1,800,600,'8f9ea6',0),(2,'book-site',0,0,50,'FFFFFF','','center','400','300',2,1,0,0,'2011-04-24 00:51:46','<p>Book que ilustra os principais trabalhos realizados pelo profissional Maurício Moreira reunidos em um só lugar.</p>','LTR','0 Kb','Download Book','','1',0,1,1,'500','100%','manually','FFFFFF',0,1,'',1,0,17,'2011-04-24 02:36:26','navigation.swf','bottom',0,0,1,1,'EEEEEE','album-casamento-pronto-001.jpg',1,0,1,1,0,0,0,0,1,0,1,5000,1,'1','Asymmetric','Book Site',0,1,800,600,'8f9ea6',0);

/*Table structure for table `jos_flippingbook_categories` */

DROP TABLE IF EXISTS `jos_flippingbook_categories`;

CREATE TABLE `jos_flippingbook_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `alias` text NOT NULL,
  `description` text NOT NULL,
  `published` tinyint(1) NOT NULL,
  `ordering` int(6) NOT NULL,
  `checked_out_time` int(11) NOT NULL DEFAULT '0',
  `checked_out` int(11) NOT NULL,
  `emailIcon` tinyint(1) NOT NULL,
  `printIcon` tinyint(1) NOT NULL,
  `columns` int(2) NOT NULL,
  `preview_image` text NOT NULL,
  `show_title` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `jos_flippingbook_categories` */

insert  into `jos_flippingbook_categories`(`id`,`title`,`alias`,`description`,`published`,`ordering`,`checked_out_time`,`checked_out`,`emailIcon`,`printIcon`,`columns`,`preview_image`,`show_title`) values (1,'Default Category','default-category','Category description',1,1,0,0,1,1,2,'category_preview.png',1),(2,'Álbum Padrão','album-padrao','',1,2,0,0,0,0,1,'',0);

/*Table structure for table `jos_flippingbook_config` */

DROP TABLE IF EXISTS `jos_flippingbook_config`;

CREATE TABLE `jos_flippingbook_config` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

/*Data for the table `jos_flippingbook_config` */

insert  into `jos_flippingbook_config`(`id`,`name`,`value`) values (1,'categoryListTitle','Categoria+Book'),(2,'closeSpeed','3'),(3,'columns','3'),(4,'downloadComplete','Complete'),(5,'dropShadowEnabled','1'),(6,'emailIcon','0'),(7,'flipSound','glossy_magazine.mp3'),(8,'gotoSpeed','3'),(9,'hardcoverSound',''),(10,'moveSpeed','2'),(11,'preloaderType','Progress Bar'),(12,'printIcon','0'),(13,'printTitle','Imprimir+P%C3%A1ginas'),(14,'rigidPageSpeed','5'),(15,'theme','white.css'),(16,'zoomHint','Duplo+Click+para+Zoom'),(17,'zoomOnClick','1'),(18,'version','1.5.11');

/*Table structure for table `jos_flippingbook_pages` */

DROP TABLE IF EXISTS `jos_flippingbook_pages`;

CREATE TABLE `jos_flippingbook_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file` varchar(255) NOT NULL,
  `book_id` int(4) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `link_url` text NOT NULL,
  `zoom_url` text NOT NULL,
  `zoom_height` int(4) NOT NULL DEFAULT '800',
  `zoom_width` int(4) NOT NULL DEFAULT '600',
  `checked_out_time` int(11) NOT NULL DEFAULT '0',
  `checked_out` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Data for the table `jos_flippingbook_pages` */

insert  into `jos_flippingbook_pages`(`id`,`file`,`book_id`,`description`,`ordering`,`published`,`link_url`,`zoom_url`,`zoom_height`,`zoom_width`,`checked_out_time`,`checked_out`) values (1,'my-book_01.swf',1,'<strong>Page 1. New features:</strong>- SEO version. HTML version for search engine indexing, non-flash computers and mobile devices<br />- RTL books support<br />- Ability to bind a desired page to a menu item<br /><em>You can modify this text in administration back-end (Components &gt; FlippingBook &gt; Manage Pages &gt; page properties &gt; Description).</em>',1,1,'','',800,600,0,0),(2,'my-book_02.jpg',1,'<strong>Page 2. Create your own web-publications.</strong> There&rsquo;s nothing easier than creating a web-magazine, newspaper or booklet now. The zooming function enables your visitors to view even the smallest text. The batch adding function helps create books with several mouse-clicks. ',2,1,'','my-book_zoom_02.jpg',800,600,0,0),(3,'my-book_03.jpg',1,'<strong>Page 3. New navigation bar</strong> is based on the flash technology. You can download the navigation bar source file from our web-site and change its look with the help of Adobe Flash. Navigation panel helps you switch to the full-screen mode, zoom and print pages, find the needed page quickly and even download the pre-prepared offline version of the book in the pdf-format, for example.',3,1,'','my-book_zoom_03.jpg',800,600,0,0),(4,'my-book_04.jpg',1,'<strong>Page 4-5.</strong> Many people prefer selecting the products by printed catalogues instead of browsing through many trivial web-pages. By using our FlippingBook technology you can create an illusion of having a 3D catalogue before you.<br />You can attach individual link that will be displayed on the navigation bar to each page. This feature allows you to place the Buy Now button leading to the online shop under each page, or Download button that enables visitors to save the file attached to the page.<br />If you want to set one description for a whole spread &ndash; just leave a blank description field for one page.',4,1,'/product-in-a-shop.html','my-book_zoom_04.jpg',800,600,0,0),(5,'my-book_05.jpg',1,'',5,1,'/product-in-a-shop.html','my-book_zoom_05.jpg',800,600,0,0),(6,'my-book_06.jpg',1,'<strong>Page 6.</strong> Create <a href=\"http://page-flip-tools.com/online-demo/\">page flip photo albums</a> that attract attention, surprise your visitors! You do not have to be a computer expert or a web-designer to create photo albums. This component is very easy to use: all you need is to create images of the right size, upload them to the server and place them in the book.',6,1,'','my-book_zoom_06.jpg',800,600,0,0),(7,'my-book_07.jpg',1,'<strong>Page 7.</strong> Portfolio created with the help of FlippingBook technology will impress your visitors and potential customers and stay in their memory for a long time. For example, if you are a web-designer, you can place a screenshot of a web-site on the page and the <em>Visit site</em> link under the page.',7,1,'http://page-flip-tools.com','my-book_zoom_07.jpg',800,600,0,0),(8,'my-book_08.jpg',1,'<strong>Page 8.</strong> If you are experiencing problems with FlippingBook, feel free to contact us. In your message, please describe your problem (or attach the screenshot), detail your order number, the email address that you used for the order and site URL with FlippingBook installed. You can find contact information on our site.',8,1,'','my-book_zoom_08.jpg',800,600,0,0),(9,'casamento 234.jpg',2,'<p>teste de descrição imagem 1</p>',8,1,'','',800,600,0,0),(10,'imagem1.jpg',2,'<p>imagem 2 descricao</p>',7,1,'','',800,600,0,0),(11,'casamento-8731.jpg',2,'<p>descricao imagem 3</p>',6,1,'','',800,600,0,0),(12,'album-casamento-pronto-001.jpg',2,'',5,1,'','',800,600,0,0),(13,'album-fotografia-de-casamento-01.jpg',2,'',1,1,'','',800,600,0,0),(14,'mg_5333-280x195.jpg',2,'',4,1,'','',800,600,0,0),(15,'foto-beni-jr-fest_vafe-0203-202.jpg',2,'',3,1,'','',800,600,0,0),(16,'sao-luis-do-maranhao.jpg',2,'',2,1,'','',800,600,0,0);

/*Table structure for table `jos_groups` */

DROP TABLE IF EXISTS `jos_groups`;

CREATE TABLE `jos_groups` (
  `id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `jos_groups` */

insert  into `jos_groups`(`id`,`name`) values (0,'Public'),(1,'Registered'),(2,'Special');

/*Table structure for table `jos_menu` */

DROP TABLE IF EXISTS `jos_menu`;

CREATE TABLE `jos_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menutype` varchar(75) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `alias` varchar(255) NOT NULL DEFAULT '',
  `link` text,
  `type` varchar(50) NOT NULL DEFAULT '',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `parent` int(11) unsigned NOT NULL DEFAULT '0',
  `componentid` int(11) unsigned NOT NULL DEFAULT '0',
  `sublevel` int(11) DEFAULT '0',
  `ordering` int(11) DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `pollid` int(11) NOT NULL DEFAULT '0',
  `browserNav` tinyint(4) DEFAULT '0',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `utaccess` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `lft` int(11) unsigned NOT NULL DEFAULT '0',
  `rgt` int(11) unsigned NOT NULL DEFAULT '0',
  `home` int(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `componentid` (`componentid`,`menutype`,`published`,`access`),
  KEY `menutype` (`menutype`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `jos_menu` */

insert  into `jos_menu`(`id`,`menutype`,`name`,`alias`,`link`,`type`,`published`,`parent`,`componentid`,`sublevel`,`ordering`,`checked_out`,`checked_out_time`,`pollid`,`browserNav`,`access`,`utaccess`,`params`,`lft`,`rgt`,`home`) values (1,'menuleft','página inicial','home','index.php?option=com_content&view=frontpage','component',1,0,20,0,2,0,'0000-00-00 00:00:00',0,0,0,3,'num_leading_articles=1\nnum_intro_articles=4\nnum_columns=2\nnum_links=4\norderby_pri=\norderby_sec=front\nmulti_column_order=1\nshow_pagination=2\nshow_pagination_results=1\nshow_feed_link=1\nshow_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=0\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n',0,0,1),(2,'menuDireito','CONTATO','contato','index.php?option=com_contact&view=contact&id=1','component',1,0,7,0,2,0,'0000-00-00 00:00:00',0,0,0,0,'show_contact_list=0\nshow_category_crumb=0\ncontact_icons=\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_headings=\nshow_position=\nshow_email=\nshow_telephone=\nshow_mobile=\nshow_fax=\nallow_vcard=\nbanned_email=\nbanned_subject=\nbanned_text=\nvalidate_session=\ncustom_reply=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n',0,0,0),(3,'menuleft','o fotógrafo','o-fotografo','index.php?option=com_content&view=article&id=1','component',-2,0,20,0,1,0,'0000-00-00 00:00:00',0,0,0,0,'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n',0,0,0),(4,'menuleft','portifólio','portifolio','','separator',1,0,0,0,3,0,'0000-00-00 00:00:00',0,0,0,0,'menu_image=-1\n\n',0,0,0),(5,'menuleft','Casamentos','casamentos','index.php?option=com_phocagallery&view=category&id=1','component',1,4,47,1,1,0,'0000-00-00 00:00:00',0,0,0,0,'show_pagination_categories=0\nshow_pagination_category=1\nshow_pagination_limit_categories=0\nshow_pagination_limit_category=1\ndisplay_cat_name_title=0\ndisplay_cat_name_breadcrumbs=0\ncategories_columns=\nequal_percentage_width=\ndisplay_image_categories=\ncategories_box_width=\nimage_categories_size=\ncategories_image_ordering=\ncategories_display_avatar=\ndisplay_subcategories=\ndisplay_empty_categories=\nhide_categories=\nshow_categories=\ndisplay_access_category=\ndefault_pagination_categories=\npagination_categories=\nfont_color=\nbackground_color=\nbackground_color_hover=\nimage_background_color=\nimage_background_shadow=\nborder_color=\nborder_color_hover=\nmargin_box=\npadding_box=\ndisplay_new=\ndisplay_hot=\ndisplay_name=\ndisplay_icon_detail=\ndisplay_icon_download=\ndisplay_icon_folder=\nfont_size_name=\nchar_length_name=\ncategory_box_space=\ndisplay_categories_sub=\ndisplay_subcat_page=\ndisplay_category_icon_image=\ncategory_image_ordering=\ndisplay_back_button=\ndisplay_categories_back_button=\ndefault_pagination_category=\npagination_category=\ndisplay_img_desc_box=\nfont_size_img_desc=\nimg_desc_box_height=\nchar_length_img_desc=\ndisplay_categories_cv=\ndisplay_subcat_page_cv=\ndisplay_category_icon_image_cv=\ncategory_image_ordering_cv=\ndisplay_back_button_cv=\ndisplay_categories_back_button_cv=\ncategories_columns_cv=\ndisplay_image_categories_cv=\nimage_categories_size_cv=\ndetail_window=\ndetail_window_background_color=\nmodal_box_overlay_color=\nmodal_box_overlay_opacity=\nmodal_box_border_color=\nmodal_box_border_width=\nsb_slideshow_delay=\nsb_lang=\nhighslide_class=\nhighslide_opacity=\nhighslide_outline_type=\nhighslide_fullimg=\nhighslide_close_button=\nhighslide_slideshow=\njak_slideshow_delay=\njak_orientation=\njak_description=\njak_description_height=\ndisplay_description_detail=\ndisplay_title_description=\nfont_size_desc=\nfont_color_desc=\ndescription_detail_height=\ndescription_lightbox_font_size=\ndescription_lightbox_font_color=\ndescription_lightbox_bg_color=\nslideshow_delay=\nslideshow_pause=\nslideshow_random=\ndetail_buttons=\nphocagallery_width=\nphocagallery_center=\ncategory_ordering=\nimage_ordering=\ngallery_metadesc=\ngallery_metakey=\nalt_value=\nenable_user_cp=\nenable_upload_avatar=\nenable_avatar_approve=\nenable_usercat_approve=\nenable_usersubcat_approve=\nuser_subcat_count=\nmax_create_cat_char=\nenable_userimage_approve=\nmax_upload_char=\nupload_maxsize=\nupload_maxres_width=\nupload_maxres_height=\nuser_images_max_size=\nenable_java=\nenable_java_admin=\njava_resize_width=\njava_resize_height=\njava_box_width=\njava_box_height=\ndisplay_rating=\ndisplay_rating_img=\ndisplay_comment=\ndisplay_comment_img=\ncomment_width=\nmax_comment_char=\ndisplay_comment_nopup=\nexternal_comment_system=\nfb_comment_app_id=\nfb_comment_width=\nenable_piclens=\nstart_piclens=\npiclens_image=\nswitch_image=\nswitch_width=\nswitch_height=\nswitch_fixed_size=\nenable_overlib=\nol_bg_color=\nol_fg_color=\nol_tf_color=\nol_cf_color=\noverlib_overlay_opacity=\noverlib_image_rate=\ncreate_watermark=\nwatermark_position_x=\nwatermark_position_y=\ndisplay_icon_vm=\ndisplay_category_statistics=\ndisplay_main_cat_stat=\ndisplay_lastadded_cat_stat=\ncount_lastadded_cat_stat=\ndisplay_mostviewed_cat_stat=\ncount_mostviewed_cat_stat=\ndisplay_camera_info=\nexif_information=\ndisplay_categories_geotagging=\ncategories_lng=\ncategories_lat=\ncategories_zoom=\ncategories_map_width=\ncategories_map_height=\ndisplay_icon_geotagging=\ndisplay_category_geotagging=\ncategory_map_width=\ncategory_map_height=\npagination_thumbnail_creation=\nclean_thumbnails=\nenable_thumb_creation=\ncrop_thumbnail=\njpeg_quality=\nenable_picasa_loading=\npicasa_load_pagination=\nicon_format=\nlarge_image_width=\nlarge_image_height=\nmedium_image_width=\nmedium_image_height=\nsmall_image_width=\nsmall_image_height=\nfront_modal_box_width=\nfront_modal_box_height=\nadmin_modal_box_width=\nadmin_modal_box_height=\nfolder_permissions=\njfile_thumbs=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n',0,0,0),(6,'menuleft','Aniversários','aniversarios','index.php?option=com_phocagallery&view=category&id=2','component',1,4,47,1,2,0,'0000-00-00 00:00:00',0,0,0,0,'show_pagination_categories=0\nshow_pagination_category=1\nshow_pagination_limit_categories=0\nshow_pagination_limit_category=1\ndisplay_cat_name_title=0\ndisplay_cat_name_breadcrumbs=0\ncategories_columns=\nequal_percentage_width=\ndisplay_image_categories=\ncategories_box_width=\nimage_categories_size=\ncategories_image_ordering=\ncategories_display_avatar=\ndisplay_subcategories=\ndisplay_empty_categories=\nhide_categories=\nshow_categories=\ndisplay_access_category=\ndefault_pagination_categories=\npagination_categories=\nfont_color=\nbackground_color=\nbackground_color_hover=\nimage_background_color=\nimage_background_shadow=\nborder_color=\nborder_color_hover=\nmargin_box=\npadding_box=\ndisplay_new=\ndisplay_hot=\ndisplay_name=\ndisplay_icon_detail=\ndisplay_icon_download=\ndisplay_icon_folder=\nfont_size_name=\nchar_length_name=\ncategory_box_space=\ndisplay_categories_sub=\ndisplay_subcat_page=\ndisplay_category_icon_image=\ncategory_image_ordering=\ndisplay_back_button=\ndisplay_categories_back_button=\ndefault_pagination_category=\npagination_category=\ndisplay_img_desc_box=\nfont_size_img_desc=\nimg_desc_box_height=\nchar_length_img_desc=\ndisplay_categories_cv=\ndisplay_subcat_page_cv=\ndisplay_category_icon_image_cv=\ncategory_image_ordering_cv=\ndisplay_back_button_cv=\ndisplay_categories_back_button_cv=\ncategories_columns_cv=\ndisplay_image_categories_cv=\nimage_categories_size_cv=\ndetail_window=\ndetail_window_background_color=\nmodal_box_overlay_color=\nmodal_box_overlay_opacity=\nmodal_box_border_color=\nmodal_box_border_width=\nsb_slideshow_delay=\nsb_lang=\nhighslide_class=\nhighslide_opacity=\nhighslide_outline_type=\nhighslide_fullimg=\nhighslide_close_button=\nhighslide_slideshow=\njak_slideshow_delay=\njak_orientation=\njak_description=\njak_description_height=\ndisplay_description_detail=\ndisplay_title_description=\nfont_size_desc=\nfont_color_desc=\ndescription_detail_height=\ndescription_lightbox_font_size=\ndescription_lightbox_font_color=\ndescription_lightbox_bg_color=\nslideshow_delay=\nslideshow_pause=\nslideshow_random=\ndetail_buttons=\nphocagallery_width=\nphocagallery_center=\ncategory_ordering=\nimage_ordering=\ngallery_metadesc=\ngallery_metakey=\nalt_value=\nenable_user_cp=\nenable_upload_avatar=\nenable_avatar_approve=\nenable_usercat_approve=\nenable_usersubcat_approve=\nuser_subcat_count=\nmax_create_cat_char=\nenable_userimage_approve=\nmax_upload_char=\nupload_maxsize=\nupload_maxres_width=\nupload_maxres_height=\nuser_images_max_size=\nenable_java=\nenable_java_admin=\njava_resize_width=\njava_resize_height=\njava_box_width=\njava_box_height=\ndisplay_rating=\ndisplay_rating_img=\ndisplay_comment=\ndisplay_comment_img=\ncomment_width=\nmax_comment_char=\ndisplay_comment_nopup=\nexternal_comment_system=\nfb_comment_app_id=\nfb_comment_width=\nenable_piclens=\nstart_piclens=\npiclens_image=\nswitch_image=\nswitch_width=\nswitch_height=\nswitch_fixed_size=\nenable_overlib=\nol_bg_color=\nol_fg_color=\nol_tf_color=\nol_cf_color=\noverlib_overlay_opacity=\noverlib_image_rate=\ncreate_watermark=\nwatermark_position_x=\nwatermark_position_y=\ndisplay_icon_vm=\ndisplay_category_statistics=\ndisplay_main_cat_stat=\ndisplay_lastadded_cat_stat=\ncount_lastadded_cat_stat=\ndisplay_mostviewed_cat_stat=\ncount_mostviewed_cat_stat=\ndisplay_camera_info=\nexif_information=\ndisplay_categories_geotagging=\ncategories_lng=\ncategories_lat=\ncategories_zoom=\ncategories_map_width=\ncategories_map_height=\ndisplay_icon_geotagging=\ndisplay_category_geotagging=\ncategory_map_width=\ncategory_map_height=\npagination_thumbnail_creation=\nclean_thumbnails=\nenable_thumb_creation=\ncrop_thumbnail=\njpeg_quality=\nenable_picasa_loading=\npicasa_load_pagination=\nicon_format=\nlarge_image_width=\nlarge_image_height=\nmedium_image_width=\nmedium_image_height=\nsmall_image_width=\nsmall_image_height=\nfront_modal_box_width=\nfront_modal_box_height=\nadmin_modal_box_width=\nadmin_modal_box_height=\nfolder_permissions=\njfile_thumbs=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n',0,0,0),(7,'menuleft','Álbuns','albuns','index.php?option=com_flippingbook&view=book&id=2&page=1','component',1,4,58,1,4,0,'0000-00-00 00:00:00',0,0,0,0,'page_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n',0,0,0),(8,'menuleft','Banco de Imagens','paisagens','index.php?option=com_phocagallery&view=category&id=3','component',1,4,47,1,3,0,'0000-00-00 00:00:00',0,0,0,0,'show_pagination_categories=0\nshow_pagination_category=1\nshow_pagination_limit_categories=0\nshow_pagination_limit_category=1\ndisplay_cat_name_title=0\ndisplay_cat_name_breadcrumbs=0\ncategories_columns=\nequal_percentage_width=\ndisplay_image_categories=\ncategories_box_width=\nimage_categories_size=\ncategories_image_ordering=\ncategories_display_avatar=\ndisplay_subcategories=\ndisplay_empty_categories=\nhide_categories=\nshow_categories=\ndisplay_access_category=\ndefault_pagination_categories=\npagination_categories=\nfont_color=\nbackground_color=\nbackground_color_hover=\nimage_background_color=\nimage_background_shadow=\nborder_color=\nborder_color_hover=\nmargin_box=\npadding_box=\ndisplay_new=\ndisplay_hot=\ndisplay_name=\ndisplay_icon_detail=\ndisplay_icon_download=\ndisplay_icon_folder=\nfont_size_name=\nchar_length_name=\ncategory_box_space=\ndisplay_categories_sub=\ndisplay_subcat_page=\ndisplay_category_icon_image=\ncategory_image_ordering=\ndisplay_back_button=\ndisplay_categories_back_button=\ndefault_pagination_category=\npagination_category=\ndisplay_img_desc_box=\nfont_size_img_desc=\nimg_desc_box_height=\nchar_length_img_desc=\ndisplay_categories_cv=\ndisplay_subcat_page_cv=\ndisplay_category_icon_image_cv=\ncategory_image_ordering_cv=\ndisplay_back_button_cv=\ndisplay_categories_back_button_cv=\ncategories_columns_cv=\ndisplay_image_categories_cv=\nimage_categories_size_cv=\ndetail_window=\ndetail_window_background_color=\nmodal_box_overlay_color=\nmodal_box_overlay_opacity=\nmodal_box_border_color=\nmodal_box_border_width=\nsb_slideshow_delay=\nsb_lang=\nhighslide_class=\nhighslide_opacity=\nhighslide_outline_type=\nhighslide_fullimg=\nhighslide_close_button=\nhighslide_slideshow=\njak_slideshow_delay=\njak_orientation=\njak_description=\njak_description_height=\ndisplay_description_detail=\ndisplay_title_description=\nfont_size_desc=\nfont_color_desc=\ndescription_detail_height=\ndescription_lightbox_font_size=\ndescription_lightbox_font_color=\ndescription_lightbox_bg_color=\nslideshow_delay=\nslideshow_pause=\nslideshow_random=\ndetail_buttons=\nphocagallery_width=\nphocagallery_center=\ncategory_ordering=\nimage_ordering=\ngallery_metadesc=\ngallery_metakey=\nalt_value=\nenable_user_cp=\nenable_upload_avatar=\nenable_avatar_approve=\nenable_usercat_approve=\nenable_usersubcat_approve=\nuser_subcat_count=\nmax_create_cat_char=\nenable_userimage_approve=\nmax_upload_char=\nupload_maxsize=\nupload_maxres_width=\nupload_maxres_height=\nuser_images_max_size=\nenable_java=\nenable_java_admin=\njava_resize_width=\njava_resize_height=\njava_box_width=\njava_box_height=\ndisplay_rating=\ndisplay_rating_img=\ndisplay_comment=\ndisplay_comment_img=\ncomment_width=\nmax_comment_char=\ndisplay_comment_nopup=\nexternal_comment_system=\nfb_comment_app_id=\nfb_comment_width=\nenable_piclens=\nstart_piclens=\npiclens_image=\nswitch_image=\nswitch_width=\nswitch_height=\nswitch_fixed_size=\nenable_overlib=\nol_bg_color=\nol_fg_color=\nol_tf_color=\nol_cf_color=\noverlib_overlay_opacity=\noverlib_image_rate=\ncreate_watermark=\nwatermark_position_x=\nwatermark_position_y=\ndisplay_icon_vm=\ndisplay_category_statistics=\ndisplay_main_cat_stat=\ndisplay_lastadded_cat_stat=\ncount_lastadded_cat_stat=\ndisplay_mostviewed_cat_stat=\ncount_mostviewed_cat_stat=\ndisplay_camera_info=\nexif_information=\ndisplay_categories_geotagging=\ncategories_lng=\ncategories_lat=\ncategories_zoom=\ncategories_map_width=\ncategories_map_height=\ndisplay_icon_geotagging=\ndisplay_category_geotagging=\ncategory_map_width=\ncategory_map_height=\npagination_thumbnail_creation=\nclean_thumbnails=\nenable_thumb_creation=\ncrop_thumbnail=\njpeg_quality=\nenable_picasa_loading=\npicasa_load_pagination=\nicon_format=\nlarge_image_width=\nlarge_image_height=\nmedium_image_width=\nmedium_image_height=\nsmall_image_width=\nsmall_image_height=\nfront_modal_box_width=\nfront_modal_box_height=\nadmin_modal_box_width=\nadmin_modal_box_height=\nfolder_permissions=\njfile_thumbs=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n',0,0,0),(9,'menuDireito','o fotógrafo','o-fotografo','index.php?option=com_content&view=article&id=1','component',1,0,20,0,1,0,'0000-00-00 00:00:00',0,0,0,0,'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n',0,0,0);

/*Table structure for table `jos_menu_types` */

DROP TABLE IF EXISTS `jos_menu_types`;

CREATE TABLE `jos_menu_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menutype` varchar(75) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `menutype` (`menutype`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `jos_menu_types` */

insert  into `jos_menu_types`(`id`,`menutype`,`title`,`description`) values (1,'menuleft','Menu Esquerdo','esquerdo'),(2,'menuDireito','Menu Direito','direto');

/*Table structure for table `jos_messages` */

DROP TABLE IF EXISTS `jos_messages`;

CREATE TABLE `jos_messages` (
  `message_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id_from` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id_to` int(10) unsigned NOT NULL DEFAULT '0',
  `folder_id` int(10) unsigned NOT NULL DEFAULT '0',
  `date_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `state` int(11) NOT NULL DEFAULT '0',
  `priority` int(1) unsigned NOT NULL DEFAULT '0',
  `subject` text NOT NULL,
  `message` text NOT NULL,
  PRIMARY KEY (`message_id`),
  KEY `useridto_state` (`user_id_to`,`state`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `jos_messages` */

/*Table structure for table `jos_messages_cfg` */

DROP TABLE IF EXISTS `jos_messages_cfg`;

CREATE TABLE `jos_messages_cfg` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cfg_name` varchar(100) NOT NULL DEFAULT '',
  `cfg_value` varchar(255) NOT NULL DEFAULT '',
  UNIQUE KEY `idx_user_var_name` (`user_id`,`cfg_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `jos_messages_cfg` */

/*Table structure for table `jos_migration_backlinks` */

DROP TABLE IF EXISTS `jos_migration_backlinks`;

CREATE TABLE `jos_migration_backlinks` (
  `itemid` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `url` text NOT NULL,
  `sefurl` text NOT NULL,
  `newurl` text NOT NULL,
  PRIMARY KEY (`itemid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `jos_migration_backlinks` */

/*Table structure for table `jos_modules` */

DROP TABLE IF EXISTS `jos_modules`;

CREATE TABLE `jos_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `content` text NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `position` varchar(50) DEFAULT NULL,
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `module` varchar(50) DEFAULT NULL,
  `numnews` int(11) NOT NULL DEFAULT '0',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `showtitle` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `params` text NOT NULL,
  `iscore` tinyint(4) NOT NULL DEFAULT '0',
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  `control` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `published` (`published`,`access`),
  KEY `newsfeeds` (`module`,`published`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

/*Data for the table `jos_modules` */

insert  into `jos_modules`(`id`,`title`,`content`,`ordering`,`position`,`checked_out`,`checked_out_time`,`published`,`module`,`numnews`,`access`,`showtitle`,`params`,`iscore`,`client_id`,`control`) values (1,'Menu Esquerdo','',0,'menu_left',62,'2011-04-06 06:04:03',1,'mod_mainmenu',0,0,0,'menutype=menuleft\nmenu_style=list\nstartLevel=0\nendLevel=0\nshowAllChildren=1\nwindow_open=\nshow_whitespace=0\ncache=1\ntag_id=menu_left\nclass_sfx=\nmoduleclass_sfx=_menu\nmaxdepth=10\nmenu_images=0\nmenu_images_align=0\nmenu_images_link=0\nexpand_menu=0\nactivate_parent=0\nfull_active_id=0\nindent_image=0\nindent_image1=\nindent_image2=\nindent_image3=\nindent_image4=\nindent_image5=\nindent_image6=\nspacer=\nend_spacer=\n\n',1,0,''),(2,'Login','',1,'login',0,'0000-00-00 00:00:00',1,'mod_login',0,0,1,'',1,1,''),(3,'Popular','',3,'cpanel',0,'0000-00-00 00:00:00',1,'mod_popular',0,2,1,'',0,1,''),(4,'Recent added Articles','',4,'cpanel',0,'0000-00-00 00:00:00',1,'mod_latest',0,2,1,'ordering=c_dsc\nuser_id=0\ncache=0\n\n',0,1,''),(5,'Menu Stats','',5,'cpanel',0,'0000-00-00 00:00:00',1,'mod_stats',0,2,1,'',0,1,''),(6,'Unread Messages','',1,'header',0,'0000-00-00 00:00:00',1,'mod_unread',0,2,1,'',1,1,''),(7,'Online Users','',2,'header',0,'0000-00-00 00:00:00',1,'mod_online',0,2,1,'',1,1,''),(8,'Toolbar','',1,'toolbar',0,'0000-00-00 00:00:00',1,'mod_toolbar',0,2,1,'',1,1,''),(9,'Quick Icons','',1,'icon',0,'0000-00-00 00:00:00',1,'mod_quickicon',0,2,1,'',1,1,''),(10,'Logged in Users','',2,'cpanel',0,'0000-00-00 00:00:00',1,'mod_logged',0,2,1,'',0,1,''),(11,'Footer','',0,'footer',0,'0000-00-00 00:00:00',1,'mod_footer',0,0,1,'',1,1,''),(12,'Admin Menu','',1,'menu',0,'0000-00-00 00:00:00',1,'mod_menu',0,2,1,'',0,1,''),(13,'Admin SubMenu','',1,'submenu',0,'0000-00-00 00:00:00',1,'mod_submenu',0,2,1,'',0,1,''),(14,'User Status','',1,'status',0,'0000-00-00 00:00:00',1,'mod_status',0,2,1,'',0,1,''),(15,'Title','',1,'title',0,'0000-00-00 00:00:00',1,'mod_title',0,2,1,'',0,1,''),(16,'ImageSlideShow','',2,'showcase',0,'0000-00-00 00:00:00',1,'mod_briaskISS',0,0,1,'moduleclass_sfx=\nDirectory=images/stories/fruit\npxHeight=200\npxWidth=200\ntransDelay=50\nnextDelay=15000\nTitle=An Image Slideshow\nURL=http://www.joomla.org\nEnableLink=0\nSequence=0\nResize=0\n\n',0,0,''),(17,'F O T O G R A F I A','',1,'left',0,'0000-00-00 00:00:00',1,'mod_accordionmenu',0,0,1,'menutype=\nstartLevel=0\nendLevel=0\nwindow_open=\nactivate_hovering=1\nhover_time=200\nduration_time=400\nshow_images=0\ncache=1\ntag_id=\nclass_sfx=\nmoduleclass_sfx=submenu\nmaxdepth=10\n\n',0,0,''),(18,'supersized','',0,'supersized',62,'2011-04-17 05:18:57',1,'mod_supersized',0,0,0,'image_01=paginainicial/imagem1.jpg\nimage_02=paginainicial/imagem2.jpg\nimage_03=paginainicial/imagem3.jpg\nimage_04=paginainicial/imagem4.jpg\nimage_05=paginainicial/imagem5.jpg\nimage_06=paginainicial/imagem6.jpg\nimage_07=paginainicial/imagem7.jpg\nimage_08=paginainicial/imagem8.jpg\nimage_09=paginainicial/imagem9.jpg\nimage_10=paginainicial/imagem10.jpg\n\n',0,0,''),(19,'paginainicial','',0,'frontpage',0,'0000-00-00 00:00:00',1,'mod_custom',0,0,0,'moduleclass_sfx=\n\n',0,0,''),(20,'Logo (Direito)','<p><img src=\"images/stories/marcas vertical borda - mesclado .png\" border=\"0\" width=\"350\" /></p>',0,'logo',0,'0000-00-00 00:00:00',0,'mod_custom',0,0,0,'moduleclass_sfx=right\n\n',0,0,''),(21,'Menu Direito','',0,'menu_right',0,'0000-00-00 00:00:00',1,'mod_mainmenu',0,0,0,'menutype=menuDireito\nmenu_style=list\nstartLevel=0\nendLevel=0\nshowAllChildren=1\nwindow_open=\nshow_whitespace=0\ncache=1\ntag_id=menu_right\nclass_sfx=\nmoduleclass_sfx=\nmaxdepth=10\nmenu_images=0\nmenu_images_align=0\nmenu_images_link=0\nexpand_menu=0\nactivate_parent=0\nfull_active_id=0\nindent_image=0\nindent_image1=\nindent_image2=\nindent_image3=\nindent_image4=\nindent_image5=\nindent_image6=\nspacer=\nend_spacer=\n\n',0,0,''),(23,'Logo (Centro)','<p><img src=\"images/stories/marcas vertical borda - mesclado .png\" border=\"0\" width=\"350\" /></p>',2,'logo',0,'0000-00-00 00:00:00',1,'mod_custom',0,0,0,'moduleclass_sfx=\n\n',0,0,''),(25,'musica','',0,'left',0,'0000-00-00 00:00:00',0,'albumdata',0,0,1,'',0,0,''),(26,'Phoca Gallery Image Module','',2,'left',0,'0000-00-00 00:00:00',0,'mod_phocagallery_image',0,0,1,'@phocahead=GENERAL SETTINGS LABEL\nimage_ordering=9\nlimit_count=1\n@phocahead=DESIGN SETTINGS LABEL\nmodule_type=shadow1\n@spacer=Default\nfont_color=#b36b00\nbackground_color=#fcfcfc\nbackground_color_hover=#f5f5f5\nimage_background_color=#f5f5f5\nborder_color=#e8e8e8\nborder_color_hover=#b36b00\nimage_background_shadow=shadow1\ndisplay_name=1\ndisplay_icon_detail=1\nfont_size_name=12\nchar_length_name=11\n@spacer=Mosaic\npadding_mosaic=3\n@phocahead=DETAIL SETTINGS LABEL\n@spacer=Detail Window Warning\n@spacer=Modal Box\nmodal_box_overlay_color=#000000\nmodal_box_overlay_opacity=0.3\nmodal_box_border_color=#6b6b6b\nmodal_box_border_width=2\n@spacer=Shadow Box\nsb_slideshow_delay=5\n@spacer=Highslide\nhighslide_class=rounded-white\nhighslide_outline_type=rounded-white\n@spacer=Highslide (Image Only)\nhighslide_slideshow=1\nhighslide_description=1\n@spacer=JAK Lightbox\njak_slideshow_delay=5\n@spacer=JAK LIGHTBOX ORIENTATION WARNING\njak_orientation=none\njak_description=1\njak_description_height=10\n@phocahead=DEFAULT DESCRIPTION SETTINGS LABEL\ndescription_detail_height=16\ndetail_buttons=1\n',0,0,'');

/*Table structure for table `jos_modules_menu` */

DROP TABLE IF EXISTS `jos_modules_menu`;

CREATE TABLE `jos_modules_menu` (
  `moduleid` int(11) NOT NULL DEFAULT '0',
  `menuid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`moduleid`,`menuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `jos_modules_menu` */

insert  into `jos_modules_menu`(`moduleid`,`menuid`) values (1,0),(16,0),(17,2),(18,0),(19,1),(20,2),(20,3),(20,4),(20,5),(20,6),(20,7),(20,8),(21,0),(23,0),(25,0),(26,0);

/*Table structure for table `jos_mp3player` */

DROP TABLE IF EXISTS `jos_mp3player`;

CREATE TABLE `jos_mp3player` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `albumName` text NOT NULL,
  `xmlFile` text NOT NULL,
  `order` text NOT NULL,
  `published` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `jos_mp3player` */

insert  into `jos_mp3player`(`id`,`albumName`,`xmlFile`,`order`,`published`) values (1,'Default Album','default.xml','1',0);

/*Table structure for table `jos_mp3player_default` */

DROP TABLE IF EXISTS `jos_mp3player_default`;

CREATE TABLE `jos_mp3player_default` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mylabel` text NOT NULL,
  `mydata` text NOT NULL,
  `order` text NOT NULL,
  `published` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `jos_mp3player_default` */

insert  into `jos_mp3player_default`(`id`,`mylabel`,`mydata`,`order`,`published`) values (1,'Test Song','test.mp3','1',0);

/*Table structure for table `jos_newsfeeds` */

DROP TABLE IF EXISTS `jos_newsfeeds`;

CREATE TABLE `jos_newsfeeds` (
  `catid` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `alias` varchar(255) NOT NULL DEFAULT '',
  `link` text NOT NULL,
  `filename` varchar(200) DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `numarticles` int(11) unsigned NOT NULL DEFAULT '1',
  `cache_time` int(11) unsigned NOT NULL DEFAULT '3600',
  `checked_out` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `rtl` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `published` (`published`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `jos_newsfeeds` */

/*Table structure for table `jos_phocagallery` */

DROP TABLE IF EXISTS `jos_phocagallery`;

CREATE TABLE `jos_phocagallery` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `catid` int(11) NOT NULL DEFAULT '0',
  `sid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(250) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `filename` varchar(250) NOT NULL DEFAULT '',
  `description` text,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hits` int(11) NOT NULL DEFAULT '0',
  `latitude` varchar(20) NOT NULL DEFAULT '',
  `longitude` varchar(20) NOT NULL DEFAULT '',
  `zoom` int(3) NOT NULL DEFAULT '0',
  `geotitle` varchar(255) NOT NULL DEFAULT '',
  `videocode` text,
  `vmproductid` int(11) NOT NULL DEFAULT '0',
  `imgorigsize` int(11) NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `approved` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text,
  `metakey` text,
  `metadesc` text,
  `extlink1` text,
  `extlink2` text,
  `extid` varchar(255) NOT NULL DEFAULT '',
  `extl` varchar(255) NOT NULL DEFAULT '',
  `extm` varchar(255) NOT NULL DEFAULT '',
  `exts` varchar(255) NOT NULL DEFAULT '',
  `exto` varchar(255) NOT NULL DEFAULT '',
  `extw` varchar(255) NOT NULL DEFAULT '',
  `exth` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`,`published`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `jos_phocagallery` */

insert  into `jos_phocagallery`(`id`,`catid`,`sid`,`title`,`alias`,`filename`,`description`,`date`,`hits`,`latitude`,`longitude`,`zoom`,`geotitle`,`videocode`,`vmproductid`,`imgorigsize`,`published`,`approved`,`checked_out`,`checked_out_time`,`ordering`,`params`,`metakey`,`metadesc`,`extlink1`,`extlink2`,`extid`,`extl`,`extm`,`exts`,`exto`,`extw`,`exth`) values (6,1,0,'Casamento 03','casamento-03','Casamentos/casamento i.jpg','','2011-04-23 00:43:23',2,'','',0,'','',0,118880,1,1,0,'0000-00-00 00:00:00',3,NULL,'','','','','','','','','','',''),(5,1,0,'Casamento 02','casamento-02','Casamentos/casamento 234.jpg','','2011-04-23 00:42:50',4,'','',0,'','',0,22309,1,1,0,'0000-00-00 00:00:00',2,NULL,'','','','','','','','','','',''),(4,1,0,'Casamento 01','casamento-01','Casamentos/casamento-8731.jpg','','2011-04-23 00:42:18',2,'','',0,'','',0,143316,1,1,0,'0000-00-00 00:00:00',1,NULL,'','','','','','','','','','',''),(7,2,0,'Aniversário 01','aniversario-01','Aniversarios/foto-beni-jr-fest_vafe-0203-202.jpg','','2011-04-23 01:19:17',1,'','',0,'','',0,88117,1,1,0,'0000-00-00 00:00:00',1,NULL,'','','','','','','','','','',''),(8,2,0,'Aniversário 02','aniversario-02','Aniversarios/mg_5333-280x195.jpg','','2011-04-23 01:27:18',0,'','',0,'','',0,23169,1,1,0,'0000-00-00 00:00:00',2,NULL,'','','','','','','','','','',''),(9,2,0,'Aniversário 03','aniversario-03','Aniversarios/img_0065.jpg','','2011-04-23 01:28:22',0,'','',0,'','',0,32333,1,1,0,'0000-00-00 00:00:00',3,NULL,'','','','','','','','','','',''),(10,3,0,'Banco de Imagens 01','banco-de-imagens-01','Banco_de_Imagens/9227798_1.jpg','','2011-04-23 01:38:32',1,'','',0,'','',0,56163,1,1,0,'0000-00-00 00:00:00',1,NULL,'','','','','','','','','','',''),(11,3,0,'Banco de Imagens 02','banco-de-imagens-02','Banco_de_Imagens/3870641863_29a2b675c0.jpg','','2011-04-23 01:38:57',2,'','',0,'','',0,120516,1,1,0,'0000-00-00 00:00:00',2,NULL,'','','','','','','','','','',''),(12,3,0,'Banco de Imagens 03','banco-de-imagens-03','Banco_de_Imagens/sao-luis-do-maranhao.jpg','','2011-04-23 01:39:18',1,'','',0,'','',0,173552,1,1,0,'0000-00-00 00:00:00',3,NULL,'','','','','','','','','','','');

/*Table structure for table `jos_phocagallery_categories` */

DROP TABLE IF EXISTS `jos_phocagallery_categories`;

CREATE TABLE `jos_phocagallery_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `owner_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `image` varchar(255) NOT NULL DEFAULT '',
  `section` varchar(50) NOT NULL DEFAULT '',
  `image_position` varchar(30) NOT NULL DEFAULT '',
  `description` text,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `approved` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `editor` varchar(50) DEFAULT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `count` int(11) NOT NULL DEFAULT '0',
  `hits` int(11) NOT NULL DEFAULT '0',
  `accessuserid` text,
  `uploaduserid` text,
  `deleteuserid` text,
  `userfolder` text,
  `latitude` varchar(20) NOT NULL DEFAULT '',
  `longitude` varchar(20) NOT NULL DEFAULT '',
  `zoom` int(3) NOT NULL DEFAULT '0',
  `geotitle` varchar(255) NOT NULL DEFAULT '',
  `extid` varchar(255) NOT NULL DEFAULT '',
  `exta` varchar(255) NOT NULL DEFAULT '',
  `extu` varchar(255) NOT NULL DEFAULT '',
  `extauth` varchar(255) NOT NULL DEFAULT '',
  `params` text,
  `metakey` text,
  `metadesc` text,
  PRIMARY KEY (`id`),
  KEY `cat_idx` (`section`,`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `jos_phocagallery_categories` */

insert  into `jos_phocagallery_categories`(`id`,`parent_id`,`owner_id`,`title`,`name`,`alias`,`image`,`section`,`image_position`,`description`,`date`,`published`,`approved`,`checked_out`,`checked_out_time`,`editor`,`ordering`,`access`,`count`,`hits`,`accessuserid`,`uploaduserid`,`deleteuserid`,`userfolder`,`latitude`,`longitude`,`zoom`,`geotitle`,`extid`,`exta`,`extu`,`extauth`,`params`,`metakey`,`metadesc`) values (1,0,-1,'Casamentos','','casamento','','','left','','2011-04-18 01:15:28',1,1,0,'0000-00-00 00:00:00',NULL,1,0,0,30,'-2','-2','62','','','',0,'','','','','',NULL,'',''),(2,0,-1,'Aniversários','','aniversarios','','','left','','2011-04-18 01:16:57',1,1,0,'0000-00-00 00:00:00',NULL,2,0,0,12,'-2','-2','62','','','',0,'','','','','',NULL,'',''),(3,0,-1,'Banco de Imagens','','banco-de-imagens','','','left','','2011-04-18 01:17:38',1,1,0,'0000-00-00 00:00:00',NULL,3,0,0,3,'-2','-2','62','','','',0,'','','','','',NULL,'',''),(4,0,-1,'Álbuns','','albuns','','','left','','2011-04-18 01:23:16',1,1,0,'0000-00-00 00:00:00',NULL,4,0,0,1,'-2','-2','62','','','',0,'','','','','',NULL,'','');

/*Table structure for table `jos_phocagallery_comments` */

DROP TABLE IF EXISTS `jos_phocagallery_comments`;

CREATE TABLE `jos_phocagallery_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catid` int(11) NOT NULL DEFAULT '0',
  `userid` int(11) NOT NULL DEFAULT '0',
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `title` varchar(255) NOT NULL DEFAULT '',
  `comment` text,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `jos_phocagallery_comments` */

/*Table structure for table `jos_phocagallery_img_comments` */

DROP TABLE IF EXISTS `jos_phocagallery_img_comments`;

CREATE TABLE `jos_phocagallery_img_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imgid` int(11) NOT NULL DEFAULT '0',
  `userid` int(11) NOT NULL DEFAULT '0',
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `title` varchar(255) NOT NULL DEFAULT '',
  `comment` text,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `jos_phocagallery_img_comments` */

/*Table structure for table `jos_phocagallery_img_votes` */

DROP TABLE IF EXISTS `jos_phocagallery_img_votes`;

CREATE TABLE `jos_phocagallery_img_votes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imgid` int(11) NOT NULL DEFAULT '0',
  `userid` int(11) NOT NULL DEFAULT '0',
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `rating` tinyint(1) NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `jos_phocagallery_img_votes` */

/*Table structure for table `jos_phocagallery_img_votes_statistics` */

DROP TABLE IF EXISTS `jos_phocagallery_img_votes_statistics`;

CREATE TABLE `jos_phocagallery_img_votes_statistics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imgid` int(11) NOT NULL DEFAULT '0',
  `count` int(11) NOT NULL DEFAULT '0',
  `average` float(8,6) NOT NULL DEFAULT '0.000000',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `jos_phocagallery_img_votes_statistics` */

/*Table structure for table `jos_phocagallery_user` */

DROP TABLE IF EXISTS `jos_phocagallery_user`;

CREATE TABLE `jos_phocagallery_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL DEFAULT '0',
  `avatar` varchar(40) NOT NULL DEFAULT '',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `approved` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `jos_phocagallery_user` */

/*Table structure for table `jos_phocagallery_votes` */

DROP TABLE IF EXISTS `jos_phocagallery_votes`;

CREATE TABLE `jos_phocagallery_votes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catid` int(11) NOT NULL DEFAULT '0',
  `userid` int(11) NOT NULL DEFAULT '0',
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `rating` tinyint(1) NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `jos_phocagallery_votes` */

/*Table structure for table `jos_phocagallery_votes_statistics` */

DROP TABLE IF EXISTS `jos_phocagallery_votes_statistics`;

CREATE TABLE `jos_phocagallery_votes_statistics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catid` int(11) NOT NULL DEFAULT '0',
  `count` int(11) NOT NULL DEFAULT '0',
  `average` float(8,6) NOT NULL DEFAULT '0.000000',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `jos_phocagallery_votes_statistics` */

/*Table structure for table `jos_plugins` */

DROP TABLE IF EXISTS `jos_plugins`;

CREATE TABLE `jos_plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `element` varchar(100) NOT NULL DEFAULT '',
  `folder` varchar(100) NOT NULL DEFAULT '',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `published` tinyint(3) NOT NULL DEFAULT '0',
  `iscore` tinyint(3) NOT NULL DEFAULT '0',
  `client_id` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_folder` (`published`,`client_id`,`access`,`folder`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

/*Data for the table `jos_plugins` */

insert  into `jos_plugins`(`id`,`name`,`element`,`folder`,`access`,`ordering`,`published`,`iscore`,`client_id`,`checked_out`,`checked_out_time`,`params`) values (1,'Authentication - Joomla','joomla','authentication',0,1,1,1,0,0,'0000-00-00 00:00:00',''),(2,'Authentication - LDAP','ldap','authentication',0,2,0,1,0,0,'0000-00-00 00:00:00','host=\nport=389\nuse_ldapV3=0\nnegotiate_tls=0\nno_referrals=0\nauth_method=bind\nbase_dn=\nsearch_string=\nusers_dn=\nusername=\npassword=\nldap_fullname=fullName\nldap_email=mail\nldap_uid=uid\n\n'),(3,'Authentication - GMail','gmail','authentication',0,4,0,0,0,0,'0000-00-00 00:00:00',''),(4,'Authentication - OpenID','openid','authentication',0,3,0,0,0,0,'0000-00-00 00:00:00',''),(5,'User - Joomla!','joomla','user',0,0,1,0,0,0,'0000-00-00 00:00:00','autoregister=1\n\n'),(6,'Search - Content','content','search',0,1,1,1,0,0,'0000-00-00 00:00:00','search_limit=50\nsearch_content=1\nsearch_uncategorised=1\nsearch_archived=1\n\n'),(7,'Search - Contacts','contacts','search',0,3,1,1,0,0,'0000-00-00 00:00:00','search_limit=50\n\n'),(8,'Search - Categories','categories','search',0,4,1,0,0,0,'0000-00-00 00:00:00','search_limit=50\n\n'),(9,'Search - Sections','sections','search',0,5,1,0,0,0,'0000-00-00 00:00:00','search_limit=50\n\n'),(10,'Search - Newsfeeds','newsfeeds','search',0,6,1,0,0,0,'0000-00-00 00:00:00','search_limit=50\n\n'),(11,'Search - Weblinks','weblinks','search',0,2,1,1,0,0,'0000-00-00 00:00:00','search_limit=50\n\n'),(12,'Content - Pagebreak','pagebreak','content',0,10000,1,1,0,0,'0000-00-00 00:00:00','enabled=1\ntitle=1\nmultipage_toc=1\nshowall=1\n\n'),(13,'Content - Rating','vote','content',0,4,1,1,0,0,'0000-00-00 00:00:00',''),(14,'Content - Email Cloaking','emailcloak','content',0,5,1,0,0,0,'0000-00-00 00:00:00','mode=1\n\n'),(15,'Content - Code Hightlighter (GeSHi)','geshi','content',0,5,0,0,0,0,'0000-00-00 00:00:00',''),(16,'Content - Load Module','loadmodule','content',0,6,1,0,0,0,'0000-00-00 00:00:00','enabled=1\nstyle=0\n\n'),(17,'Content - Page Navigation','pagenavigation','content',0,2,1,1,0,0,'0000-00-00 00:00:00','position=1\n\n'),(18,'Editor - No Editor','none','editors',0,0,1,1,0,0,'0000-00-00 00:00:00',''),(19,'Editor - TinyMCE','tinymce','editors',0,0,1,1,0,0,'0000-00-00 00:00:00','mode=advanced\nskin=0\ncompressed=0\ncleanup_startup=0\ncleanup_save=2\nentity_encoding=raw\nlang_mode=0\nlang_code=en\ntext_direction=ltr\ncontent_css=1\ncontent_css_custom=\nrelative_urls=1\nnewlines=0\ninvalid_elements=applet\nextended_elements=\ntoolbar=top\ntoolbar_align=left\nhtml_height=550\nhtml_width=750\nelement_path=1\nfonts=1\npaste=1\nsearchreplace=1\ninsertdate=1\nformat_date=%Y-%m-%d\ninserttime=1\nformat_time=%H:%M:%S\ncolors=1\ntable=1\nsmilies=1\nmedia=1\nhr=1\ndirectionality=1\nfullscreen=1\nstyle=1\nlayer=1\nxhtmlxtras=1\nvisualchars=1\nnonbreaking=1\ntemplate=0\nadvimage=1\nadvlink=1\nautosave=1\ncontextmenu=1\ninlinepopups=1\nsafari=1\ncustom_plugin=\ncustom_button=\n\n'),(20,'Editor - XStandard Lite 2.0','xstandard','editors',0,0,0,1,0,0,'0000-00-00 00:00:00',''),(21,'Editor Button - Image','image','editors-xtd',0,0,1,0,0,0,'0000-00-00 00:00:00',''),(22,'Editor Button - Pagebreak','pagebreak','editors-xtd',0,0,1,0,0,0,'0000-00-00 00:00:00',''),(23,'Editor Button - Readmore','readmore','editors-xtd',0,0,1,0,0,0,'0000-00-00 00:00:00',''),(24,'XML-RPC - Joomla','joomla','xmlrpc',0,7,0,1,0,0,'0000-00-00 00:00:00',''),(25,'XML-RPC - Blogger API','blogger','xmlrpc',0,7,0,1,0,0,'0000-00-00 00:00:00','catid=1\nsectionid=0\n\n'),(27,'System - SEF','sef','system',0,1,1,0,0,0,'0000-00-00 00:00:00',''),(28,'System - Debug','debug','system',0,2,1,0,0,0,'0000-00-00 00:00:00','queries=1\nmemory=1\nlangauge=1\n\n'),(29,'System - Legacy','legacy','system',0,3,0,1,0,0,'0000-00-00 00:00:00','route=0\n\n'),(30,'System - Cache','cache','system',0,4,0,1,0,0,'0000-00-00 00:00:00','browsercache=0\ncachetime=15\n\n'),(31,'System - Log','log','system',0,5,0,1,0,0,'0000-00-00 00:00:00',''),(32,'System - Remember Me','remember','system',0,6,1,1,0,0,'0000-00-00 00:00:00',''),(33,'System - Backlink','backlink','system',0,7,0,1,0,0,'0000-00-00 00:00:00',''),(34,'System - Mootools Upgrade','mtupgrade','system',0,8,0,1,0,0,'0000-00-00 00:00:00','');

/*Table structure for table `jos_poll_data` */

DROP TABLE IF EXISTS `jos_poll_data`;

CREATE TABLE `jos_poll_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pollid` int(11) NOT NULL DEFAULT '0',
  `text` text NOT NULL,
  `hits` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `pollid` (`pollid`,`text`(1))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `jos_poll_data` */

/*Table structure for table `jos_poll_date` */

DROP TABLE IF EXISTS `jos_poll_date`;

CREATE TABLE `jos_poll_date` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `vote_id` int(11) NOT NULL DEFAULT '0',
  `poll_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `poll_id` (`poll_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `jos_poll_date` */

/*Table structure for table `jos_poll_menu` */

DROP TABLE IF EXISTS `jos_poll_menu`;

CREATE TABLE `jos_poll_menu` (
  `pollid` int(11) NOT NULL DEFAULT '0',
  `menuid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pollid`,`menuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `jos_poll_menu` */

/*Table structure for table `jos_polls` */

DROP TABLE IF EXISTS `jos_polls`;

CREATE TABLE `jos_polls` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `voters` int(9) NOT NULL DEFAULT '0',
  `checked_out` int(11) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `access` int(11) NOT NULL DEFAULT '0',
  `lag` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `jos_polls` */

/*Table structure for table `jos_sections` */

DROP TABLE IF EXISTS `jos_sections`;

CREATE TABLE `jos_sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `image` text NOT NULL,
  `scope` varchar(50) NOT NULL DEFAULT '',
  `image_position` varchar(30) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `count` int(11) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_scope` (`scope`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `jos_sections` */

insert  into `jos_sections`(`id`,`title`,`name`,`alias`,`image`,`scope`,`image_position`,`description`,`published`,`checked_out`,`checked_out_time`,`ordering`,`access`,`count`,`params`) values (1,'site','','site','','content','left','',1,0,'0000-00-00 00:00:00',1,0,4,'');

/*Table structure for table `jos_session` */

DROP TABLE IF EXISTS `jos_session`;

CREATE TABLE `jos_session` (
  `username` varchar(150) DEFAULT '',
  `time` varchar(14) DEFAULT '',
  `session_id` varchar(200) NOT NULL DEFAULT '0',
  `guest` tinyint(4) DEFAULT '1',
  `userid` int(11) DEFAULT '0',
  `usertype` varchar(50) DEFAULT '',
  `gid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `client_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `data` longtext,
  PRIMARY KEY (`session_id`(64)),
  KEY `whosonline` (`guest`,`usertype`),
  KEY `userid` (`userid`),
  KEY `time` (`time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `jos_session` */

insert  into `jos_session`(`username`,`time`,`session_id`,`guest`,`userid`,`usertype`,`gid`,`client_id`,`data`) values ('admin','1303615024','j6hgodo37tjonlg644cbaqbsk4',0,62,'Super Administrator',25,1,'__default|a:8:{s:15:\"session.counter\";i:132;s:19:\"session.timer.start\";i:1303606206;s:18:\"session.timer.last\";i:1303613161;s:17:\"session.timer.now\";i:1303615024;s:22:\"session.client.browser\";s:120:\"Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US) AppleWebKit/534.16 (KHTML, like Gecko) Chrome/10.0.648.204 Safari/534.16\";s:8:\"registry\";O:9:\"JRegistry\":3:{s:17:\"_defaultNameSpace\";s:7:\"session\";s:9:\"_registry\";a:4:{s:7:\"session\";a:1:{s:4:\"data\";O:8:\"stdClass\":0:{}}s:11:\"application\";a:1:{s:4:\"data\";O:8:\"stdClass\":1:{s:4:\"lang\";s:0:\"\";}}s:10:\"com_cpanel\";a:1:{s:4:\"data\";O:8:\"stdClass\":1:{s:9:\"mtupgrade\";O:8:\"stdClass\":1:{s:7:\"checked\";b:1;}}}s:9:\"com_menus\";a:1:{s:4:\"data\";O:8:\"stdClass\":1:{s:8:\"menutype\";s:8:\"menuleft\";}}}s:7:\"_errors\";a:0:{}}s:4:\"user\";O:5:\"JUser\":19:{s:2:\"id\";s:2:\"62\";s:4:\"name\";s:13:\"Administrator\";s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:23:\"contato@luanpereira.com\";s:8:\"password\";s:65:\"14c3be69f119751d30ee97f88fe618e5:aX7wHhxUeVDfQr3bEdA9ka4MqHnSMcoH\";s:14:\"password_clear\";s:0:\"\";s:8:\"usertype\";s:19:\"Super Administrator\";s:5:\"block\";s:1:\"0\";s:9:\"sendEmail\";s:1:\"1\";s:3:\"gid\";s:2:\"25\";s:12:\"registerDate\";s:19:\"2011-04-03 23:38:17\";s:13:\"lastvisitDate\";s:19:\"2011-04-23 14:39:56\";s:10:\"activation\";s:0:\"\";s:6:\"params\";s:0:\"\";s:3:\"aid\";i:2;s:5:\"guest\";i:0;s:7:\"_params\";O:10:\"JParameter\":7:{s:4:\"_raw\";s:0:\"\";s:4:\"_xml\";N;s:9:\"_elements\";a:0:{}s:12:\"_elementPath\";a:1:{i:0;s:60:\"C:\\wamp\\www\\mauricio\\libraries\\joomla\\html\\parameter\\element\";}s:17:\"_defaultNameSpace\";s:8:\"_default\";s:9:\"_registry\";a:1:{s:8:\"_default\";a:1:{s:4:\"data\";O:8:\"stdClass\":0:{}}}s:7:\"_errors\";a:0:{}}s:9:\"_errorMsg\";N;s:7:\"_errors\";a:0:{}}s:13:\"session.token\";s:32:\"28be13e53c1fae455411fd37f6f43bfb\";}'),('','1303616986','q4jtnpe0r45vgkfqruf82bp7g5',1,0,'',0,0,'__default|a:8:{s:15:\"session.counter\";i:81;s:19:\"session.timer.start\";i:1303606555;s:18:\"session.timer.last\";i:1303616969;s:17:\"session.timer.now\";i:1303616986;s:22:\"session.client.browser\";s:120:\"Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US) AppleWebKit/534.16 (KHTML, like Gecko) Chrome/10.0.648.204 Safari/534.16\";s:8:\"registry\";O:9:\"JRegistry\":3:{s:17:\"_defaultNameSpace\";s:7:\"session\";s:9:\"_registry\";a:1:{s:7:\"session\";a:1:{s:4:\"data\";O:8:\"stdClass\":0:{}}}s:7:\"_errors\";a:0:{}}s:4:\"user\";O:5:\"JUser\":19:{s:2:\"id\";i:0;s:4:\"name\";N;s:8:\"username\";N;s:5:\"email\";N;s:8:\"password\";N;s:14:\"password_clear\";s:0:\"\";s:8:\"usertype\";N;s:5:\"block\";N;s:9:\"sendEmail\";i:0;s:3:\"gid\";i:0;s:12:\"registerDate\";N;s:13:\"lastvisitDate\";N;s:10:\"activation\";N;s:6:\"params\";N;s:3:\"aid\";i:0;s:5:\"guest\";i:1;s:7:\"_params\";O:10:\"JParameter\":7:{s:4:\"_raw\";s:0:\"\";s:4:\"_xml\";N;s:9:\"_elements\";a:0:{}s:12:\"_elementPath\";a:1:{i:0;s:60:\"C:\\wamp\\www\\mauricio\\libraries\\joomla\\html\\parameter\\element\";}s:17:\"_defaultNameSpace\";s:8:\"_default\";s:9:\"_registry\";a:1:{s:8:\"_default\";a:1:{s:4:\"data\";O:8:\"stdClass\":0:{}}}s:7:\"_errors\";a:0:{}}s:9:\"_errorMsg\";N;s:7:\"_errors\";a:0:{}}s:13:\"session.token\";s:32:\"751a8d7dc28a25967161268d4e4e48b7\";}');

/*Table structure for table `jos_stats_agents` */

DROP TABLE IF EXISTS `jos_stats_agents`;

CREATE TABLE `jos_stats_agents` (
  `agent` varchar(255) NOT NULL DEFAULT '',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `hits` int(11) unsigned NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `jos_stats_agents` */

/*Table structure for table `jos_templates_menu` */

DROP TABLE IF EXISTS `jos_templates_menu`;

CREATE TABLE `jos_templates_menu` (
  `template` varchar(255) NOT NULL DEFAULT '',
  `menuid` int(11) NOT NULL DEFAULT '0',
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`menuid`,`client_id`,`template`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `jos_templates_menu` */

insert  into `jos_templates_menu`(`template`,`menuid`,`client_id`) values ('mauricio2',0,0),('khepri',0,1);

/*Table structure for table `jos_users` */

DROP TABLE IF EXISTS `jos_users`;

CREATE TABLE `jos_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `username` varchar(150) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `usertype` varchar(25) NOT NULL DEFAULT '',
  `block` tinyint(4) NOT NULL DEFAULT '0',
  `sendEmail` tinyint(4) DEFAULT '0',
  `gid` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `registerDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastvisitDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `activation` varchar(100) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usertype` (`usertype`),
  KEY `idx_name` (`name`),
  KEY `gid_block` (`gid`,`block`),
  KEY `username` (`username`),
  KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

/*Data for the table `jos_users` */

insert  into `jos_users`(`id`,`name`,`username`,`email`,`password`,`usertype`,`block`,`sendEmail`,`gid`,`registerDate`,`lastvisitDate`,`activation`,`params`) values (62,'Administrator','admin','contato@luanpereira.com','14c3be69f119751d30ee97f88fe618e5:aX7wHhxUeVDfQr3bEdA9ka4MqHnSMcoH','Super Administrator',0,1,25,'2011-04-03 23:38:17','2011-04-24 00:50:40','',''),(63,'Maurício Moreira','mauricio','mauriciomoreira@globo.com','0cc28900e737a61644f6645234957f4a:ga6xUFoqOCyy2YPcifNNAEuIRGB8UKhQ','Administrator',0,1,24,'2011-04-17 05:14:28','2011-04-17 05:16:06','','admin_language=\nlanguage=\neditor=\nhelpsite=\ntimezone=0\n\n');

/*Table structure for table `jos_weblinks` */

DROP TABLE IF EXISTS `jos_weblinks`;

CREATE TABLE `jos_weblinks` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `catid` int(11) NOT NULL DEFAULT '0',
  `sid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(250) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(250) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hits` int(11) NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `approved` tinyint(1) NOT NULL DEFAULT '1',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`,`published`,`archived`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `jos_weblinks` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
