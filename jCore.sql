-- phpMyAdmin SQL Dump
-- version 2.9.0
-- http://www.phpmyadmin.net
-- 
-- Host: localhost
-- Generation Time: Jul 24, 2009 at 03:09 PM
-- Server version: 5.0.67
-- PHP Version: 5.2.6
-- 
-- Database: `jcore_client`
-- 

-- --------------------------------------------------------

-- 
-- Table structure for table `ads`
-- 

DROP TABLE IF EXISTS `ads`;
CREATE TABLE `ads` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `Location` varchar(255) NOT NULL default '',
  `Title` varchar(255) NOT NULL default '',
  `URL` varchar(255) NOT NULL default '',
  `AdCode` mediumtext,
  `TimeStamp` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `BlockID` smallint(5) unsigned NOT NULL default '0',
  `StartDate` date default NULL,
  `EndDate` date default NULL,
  `ShowOn` varchar(15) default NULL,
  `Deactivated` tinyint(1) NOT NULL default '0',
  `Shown` int(10) unsigned NOT NULL default '0',
  `Clicked` int(10) unsigned NOT NULL default '0',
  `OrderID` mediumint(9) NOT NULL default '0',
  PRIMARY KEY  (`ID`),
  KEY `ShowOn` (`ShowOn`),
  KEY `OrderID` (`OrderID`),
  KEY `BlockID` (`BlockID`,`StartDate`,`EndDate`,`Deactivated`)
) ENGINE=MyISAM;

-- 
-- Dumping data for table `ads`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `bfprotection`
-- 

DROP TABLE IF EXISTS `bfprotection`;
CREATE TABLE `bfprotection` (
  `Username` varchar(100) NOT NULL default '',
  `IP` bigint(20) NOT NULL default '0',
  `TimeStamp` timestamp NOT NULL default CURRENT_TIMESTAMP,
  KEY `IP` (`IP`)
) ENGINE=MyISAM;

-- 
-- Dumping data for table `bfprotection`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `bfprotectionbans`
-- 

DROP TABLE IF EXISTS `bfprotectionbans`;
CREATE TABLE `bfprotectionbans` (
  `IP` bigint(20) NOT NULL default '0',
  `EndTimeStamp` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `Usernames` mediumtext NULL,
  KEY `IP` (`IP`)
) ENGINE=MyISAM;

-- 
-- Dumping data for table `bfprotectionbans`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `blocks`
-- 

DROP TABLE IF EXISTS `blocks`;
CREATE TABLE `blocks` (
  `ID` smallint(5) unsigned NOT NULL auto_increment,
  `Title` varchar(255) NOT NULL default '',
  `Content` mediumtext NULL,
  `BlockID` varchar(100) NOT NULL default '',
  `Class` varchar(255) NOT NULL default '',
  `Deactivated` tinyint(1) unsigned NOT NULL default '0',
  `TypeID` tinyint(3) unsigned NOT NULL default '0',
  `SubBlockOfID` smallint(5) unsigned NOT NULL default '0',
  `MenuItemIDs` varchar(255) NOT NULL default '',
  `MenuItemExcept` tinyint(1) unsigned NOT NULL default '0',
  `LanguageIDs` varchar(255) NOT NULL default '',
  `LanguageExcept` tinyint(1) unsigned NOT NULL default '0',
  `ViewableBy` tinyint(1) unsigned NOT NULL default '0',
  `Limit` tinyint(3) unsigned NOT NULL default '5',
  `OrderID` mediumint(9) NOT NULL default '0',
  PRIMARY KEY  (`ID`),
  KEY `SubBlockOfID` (`SubBlockOfID`),
  KEY `TypeID` (`TypeID`),
  KEY `Deactivated` (`Deactivated`,`OrderID`),
  KEY `ViewableBy` (`ViewableBy`)
) ENGINE=MyISAM;

-- 
-- Dumping data for table `blocks`
-- 

INSERT INTO `blocks` (`ID`, `Title`, `Content`, `BlockID`, `Class`, `Deactivated`, `TypeID`, `SubBlockOfID`, `MenuItemIDs`, `MenuItemExcept`, `LanguageIDs`, `LanguageExcept`, `ViewableBy`, `Limit`, `OrderID`) VALUES 
(1, 'Content', '', 'content', '', 0, 1, 2, '', 0, '', 0, 0, 0, 3),
(2, 'Website', '', 'website', '', 0, 0, 0, '', 0, '', 0, 0, 0, 1),
(3, 'Left Menu', '', 'left-menu', '', 0, 3, 2, '', 0, '', 0, 0, 0, 2),
(4, 'Header', '<a href=''%SITE_URL%''>%PAGE_TITLE%</a>', 'header', '', 0, 0, 2, '', 0, '', 0, 0, 0, 1),
(5, 'Footer', '{url}validXHTML{/url}\r\n{url}validCSS{/url}\r\nCopyright %NOW_YEAR% &copy; %PAGE_TITLE%<br />\r\nPowered by <a href=''http://jcore.net'' target=''_blank''>jCore</a>', 'footer', '', 0, 0, 2, '', 0, '', 0, 0, 0, 4);

-- --------------------------------------------------------

-- 
-- Table structure for table `dynamicformfields`
-- 

DROP TABLE IF EXISTS `dynamicformfields`;
CREATE TABLE `dynamicformfields` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `FormID` smallint(5) unsigned NOT NULL default '0',
  `Title` varchar(255) NOT NULL default '',
  `Name` varchar(255) NOT NULL default '',
  `TypeID` tinyint(3) unsigned NOT NULL default '0',
  `ValueType` tinyint(3) unsigned NOT NULL default '1',
  `Required` tinyint(1) unsigned NOT NULL default '0',
  `Attributes` varchar(255) NOT NULL default '',
  `Style` varchar(255) NOT NULL default '',
  `OrderID` mediumint(9) NOT NULL default '0',
  `Protected` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`ID`),
  KEY `FormID` (`FormID`,`OrderID`)
) ENGINE=MyISAM;

-- 
-- Dumping data for table `dynamicformfields`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `dynamicformfieldvalues`
-- 

DROP TABLE IF EXISTS `dynamicformfieldvalues`;
CREATE TABLE `dynamicformfieldvalues` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `FieldID` int(10) unsigned NOT NULL default '0',
  `Value` mediumtext NULL,
  `ValueTitle` varchar(255) NOT NULL default '',
  `Selected` tinyint(1) unsigned NOT NULL default '0',
  `OrderID` mediumint(9) NOT NULL default '0',
  PRIMARY KEY  (`ID`),
  KEY `FieldID` (`FieldID`,`Selected`),
  KEY `OrderID` (`OrderID`)
) ENGINE=MyISAM;

-- 
-- Dumping data for table `dynamicformfieldvalues`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `dynamicforms`
-- 

DROP TABLE IF EXISTS `dynamicforms`;
CREATE TABLE `dynamicforms` (
  `ID` smallint(5) unsigned NOT NULL auto_increment,
  `Title` varchar(255) NOT NULL default '',
  `FormID` varchar(255) NOT NULL default '',
  `Method` varchar(10) NOT NULL default 'post',
  `SendNotificationEmail` tinyint(1) unsigned NOT NULL default '0',
  `SQLTable` varchar(100) NOT NULL default '',
  `Protected` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM;

-- 
-- Dumping data for table `dynamicforms`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `languages`
-- 

DROP TABLE IF EXISTS `languages`;
CREATE TABLE `languages` (
  `ID` tinyint(3) unsigned NOT NULL auto_increment,
  `Title` varchar(100) NOT NULL default '',
  `Path` varchar(255) NOT NULL default '',
  `Locale` varchar(10) NOT NULL default 'en_US',
  `Default` tinyint(1) unsigned NOT NULL default '0',
  `Deactivated` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`ID`),
  KEY `Path` (`Path`),
  KEY `Default` (`Default`),
  KEY `Deactivated` (`Deactivated`)
) ENGINE=MyISAM;

-- 
-- Dumping data for table `languages`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `menuitemmodules`
-- 

DROP TABLE IF EXISTS `menuitemmodules`;
CREATE TABLE `menuitemmodules` (
  `MenuItemID` mediumint(8) unsigned NOT NULL default '0',
  `ModuleID` tinyint(3) unsigned NOT NULL default '0',
  KEY `MenuID` (`MenuItemID`)
) ENGINE=MyISAM;

-- 
-- Dumping data for table `menuitemmodules`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `menuitems`
-- 

DROP TABLE IF EXISTS `menuitems`;
CREATE TABLE `menuitems` (
  `ID` mediumint(8) unsigned NOT NULL auto_increment,
  `Title` varchar(150) NOT NULL default '',
  `Path` varchar(255) NOT NULL default '',
  `Link` varchar(255) NOT NULL default '',
  `Hidden` tinyint(1) unsigned NOT NULL default '0',
  `Deactivated` tinyint(1) unsigned NOT NULL default '0',
  `ViewableBy` tinyint(1) unsigned NOT NULL default '0',
  `SubMenuOfID` mediumint(8) unsigned NOT NULL default '0',
  `MenuID` tinyint(3) unsigned NOT NULL default '1',
  `LanguageID` tinyint(3) unsigned NOT NULL default '0',
  `Limit` tinyint(3) unsigned NOT NULL default '0',
  `OrderID` mediumint(9) NOT NULL default '0',
  PRIMARY KEY  (`ID`),
  KEY `Path` (`Path`),
  KEY `Deactivated` (`Deactivated`,`SubMenuOfID`,`OrderID`),
  KEY `Hidden` (`Hidden`),
  KEY `MenuID` (`MenuID`),
  KEY `LanguageID` (`LanguageID`)
) ENGINE=MyISAM;

-- 
-- Dumping data for table `menuitems`
-- 

INSERT INTO `menuitems` (`ID`, `Title`, `Path`, `Link`, `Hidden`, `Deactivated`, `ViewableBy`, `SubMenuOfID`, `MenuID`, `LanguageID`, `Limit`, `OrderID`) VALUES 
(1, 'Home', 'home', '', 0, 0, 0, 0, 1, 0, 0, 1),
(2, 'What next?', 'what-next', '', 0, 0, 0, 0, 1, 0, 0, 2);

-- --------------------------------------------------------

-- 
-- Table structure for table `menus`
-- 

DROP TABLE IF EXISTS `menus`;
CREATE TABLE `menus` (
  `ID` tinyint(3) unsigned NOT NULL auto_increment,
  `Title` varchar(255) NOT NULL default '',
  `Name` varchar(100) NOT NULL default '',
  `BlockID` smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY  (`ID`),
  KEY `BlockID` (`BlockID`)
) ENGINE=MyISAM;

-- 
-- Dumping data for table `menus`
-- 

INSERT INTO `menus` (`ID`, `Title`, `Name`, `BlockID`) VALUES 
(1, 'Main Menu', 'main-menu', 3);

-- --------------------------------------------------------

-- 
-- Table structure for table `modules`
-- 

DROP TABLE IF EXISTS `modules`;
CREATE TABLE `modules` (
  `ID` tinyint(3) unsigned NOT NULL auto_increment,
  `Name` varchar(100) NOT NULL default '',
  `Installed` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM;

-- 
-- Dumping data for table `modules`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `postattachments`
-- 

DROP TABLE IF EXISTS `postattachments`;
CREATE TABLE `postattachments` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `OrderID` mediumint(9) NOT NULL default '0',
  `Location` varchar(255) NOT NULL default '',
  `Title` varchar(255) NOT NULL default '',
  `TimeStamp` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `HumanMimeType` varchar(255) NOT NULL default '',
  `FileSize` int(10) unsigned NOT NULL default '0',
  `PostID` int(10) unsigned NOT NULL default '1',
  `Downloads` int(10) unsigned NOT NULL default '0',
  KEY `ID` (`ID`),
  KEY `OrderID` (`OrderID`),
  KEY `PostID` (`PostID`),
  KEY `TimeStamp` (`TimeStamp`)
) ENGINE=MyISAM;

-- 
-- Dumping data for table `postattachments`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `postcomments`
-- 

DROP TABLE IF EXISTS `postcomments`;
CREATE TABLE `postcomments` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `PostID` int(10) unsigned NOT NULL default '0',
  `UserName` varchar(100) NOT NULL default '',
  `UserID` mediumint(8) unsigned NOT NULL default '0',
  `Comment` text NULL,
  `TimeStamp` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `IP` bigint(20) NOT NULL default '0',
  `SubCommentOfID` int(10) unsigned NOT NULL default '0',
  `Rating` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`ID`),
  KEY `TimeStamp` (`TimeStamp`),
  KEY `PostID` (`PostID`,`UserName`),
  KEY `UserID` (`UserID`)
) ENGINE=MyISAM;

-- 
-- Dumping data for table `postcomments`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `postcommentsratings`
-- 

DROP TABLE IF EXISTS `postcommentsratings`;
CREATE TABLE `postcommentsratings` (
  `CommentID` int(10) unsigned NOT NULL default '0',
  `UserID` mediumint(8) unsigned NOT NULL default '0',
  `IP` bigint(20) NOT NULL default '0',
  `TimeStamp` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `Rating` tinyint(1) NOT NULL default '0',
  KEY `CommentID` (`CommentID`,`UserID`,`IP`,`TimeStamp`),
  KEY `Rating` (`Rating`)
) ENGINE=MyISAM;

-- 
-- Dumping data for table `postcommentsratings`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `postpictures`
-- 

DROP TABLE IF EXISTS `postpictures`;
CREATE TABLE `postpictures` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `OrderID` mediumint(9) NOT NULL default '0',
  `Location` varchar(255) NOT NULL default '',
  `Title` varchar(255) NOT NULL default '',
  `TimeStamp` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `URL` varchar(255) NOT NULL default '',
  `PostID` int(10) unsigned NOT NULL default '1',
  KEY `ID` (`ID`),
  KEY `OrderID` (`OrderID`),
  KEY `PostID` (`PostID`),
  KEY `TimeStamp` (`TimeStamp`)
) ENGINE=MyISAM;

-- 
-- Dumping data for table `postpictures`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `posts`
-- 

DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `MenuItemID` mediumint(8) unsigned NOT NULL default '0',
  `Title` varchar(255) NOT NULL default '',
  `Path` varchar(255) NOT NULL default '',
  `TimeStamp` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `StartDate` date default NULL,
  `EndDate` date default NULL,
  `Content` mediumtext NULL,
  `Keywords` varchar(255) NOT NULL default '',
  `Views` int(10) unsigned NOT NULL default '0',
  `Comments` smallint(5) unsigned NOT NULL default '0',
  `Pictures` smallint(5) unsigned NOT NULL default '0',
  `Attachments` smallint(5) unsigned NOT NULL default '0',
  `EnableComments` tinyint(1) unsigned NOT NULL default '0',
  `EnableGuestComments` tinyint(1) unsigned NOT NULL default '0',
  `Deactivated` tinyint(1) unsigned NOT NULL default '0',
  `PartialContent` tinyint(1) unsigned NOT NULL default '0',
  `OnMainPage` tinyint(1) unsigned NOT NULL default '0',
  `BlockID` smallint(5) unsigned NOT NULL default '0',
  `UserID` mediumint(8) unsigned NOT NULL default '0',
  `OrderID` mediumint(9) NOT NULL default '0',
  PRIMARY KEY  (`ID`),
  KEY `MenuID` (`MenuItemID`,`Deactivated`,`OrderID`),
  KEY `OnMainPage` (`OnMainPage`),
  KEY `StartDate` (`StartDate`,`EndDate`),
  KEY `Path` (`Path`),
  KEY `BlockID` (`BlockID`),
  KEY `UserID` (`UserID`)
) ENGINE=MyISAM;

-- 
-- Dumping data for table `posts`
-- 

INSERT INTO `posts` (`ID`, `MenuItemID`, `Title`, `Path`, `TimeStamp`, `StartDate`, `EndDate`, `Content`, `Keywords`, `Views`, `Comments`, `Pictures`, `Attachments`, `EnableComments`, `EnableGuestComments`, `Deactivated`, `PartialContent`, `OnMainPage`, `BlockID`, `UserID`, `OrderID`) VALUES 
(1, 1, 'Welcome to jCore', 'welcome-to-jcore', '2009-07-24 09:52:03', NULL, NULL, '<p>Welcome to jCore, if you see this message it meens you have successfully set up jCore on your server and you can now start customizing this site.</p>\r\n<p>To access the admin area just click here:<br />\r\n<a href="%SITE_URL%admin">%SITE_URL%admin</a> &nbsp;</p>\r\n<p>Your login information to the admin are:<br />\r\n<strong>Username</strong>: admin<br />\r\n<strong>Password</strong>: jcore</p>\r\n<div class="tooltip notification"><span>IMPORTANT: Please change your password as soon as possible in the admin (Member Management -&gt; Users)</span></div>\r\n<p>Have fun.</p>', '', 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1),
(2, 2, 'What to do next', 'what-to-do-next', '2009-07-24 10:02:00', NULL, NULL, '<p>As on the first page noted, the first thing you should do is to change your admin password (and or username if you want to), then you can go to the Content Management area and start setting up your menu items like About, News, Contact and so on. You can add as many posts (content) as you wish under a menu item. To read more about the content management feature please see <a target="_blank" href="http://jcore.net/features/content-management">Features -&gt; Content Management</a></p>\r\n<p>The second thing you should do when menus are set up is to look in the Site Layout &amp;&nbsp;Functionality and start setting up your own Blocks (Layout Blocks). Layout blocks are the div tags that you will be able to customize from css and js. Each block can have unlimited subblocks and you can even limit them to show it only for a defined menu and/or language. To lear more about blocks please see <a target="_blank" href="http://jcore.net/features/dynamic-web-20-layout">Features -&gt; Dynamic Web 2.0 Layout</a></p>\r\n<p>Once all your blocks are set up and you have the site''s design done from css/js you can start adding custom modules/content to your site, if you have any questions please see the <a target="_blank" href="http://jcore.net/features">Features</a> section.</p>', '', 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1);

-- --------------------------------------------------------

-- 
-- Table structure for table `ptprotectionbans`
-- 

DROP TABLE IF EXISTS `ptprotectionbans`;
CREATE TABLE `ptprotectionbans` (
  `UserID` mediumint(8) NOT NULL default '0',
  `EndTimeStamp` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `IPs` mediumtext NULL,
  KEY `UserID` (`UserID`)
) ENGINE=MyISAM;

-- 
-- Dumping data for table `ptprotectionbans`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `rssfeeds`
-- 

DROP TABLE IF EXISTS `rssfeeds`;
CREATE TABLE `rssfeeds` (
  `ID` tinyint(3) unsigned NOT NULL auto_increment,
  `Title` varchar(255) NOT NULL default '',
  `FeedURL` varchar(255) NOT NULL default '',
  `Deactivated` tinyint(1) unsigned NOT NULL default '0',
  `OrderID` mediumint(9) NOT NULL default '0',
  PRIMARY KEY  (`ID`),
  KEY `Deactivated` (`Deactivated`),
  KEY `OrderID` (`OrderID`)
) ENGINE=MyISAM;

-- 
-- Dumping data for table `rssfeeds`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `settings`
-- 

DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings` (
  `ID` varchar(100) NOT NULL default '',
  `Value` mediumtext NULL,
  `TypeID` tinyint(1) unsigned NOT NULL default '1',
  `OrderID` smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY  (`ID`),
  KEY `OrderID` (`OrderID`)
) ENGINE=MyISAM;

-- 
-- Dumping data for table `settings`
-- 

INSERT INTO `settings` (`ID`, `Value`, `TypeID`, `OrderID`) VALUES 
('Page_Title', 'jCore - the Webmaster''s Multisite CMS', 1, 1),
('Meta_Title', 'jCore - the Webmaster''s Multisite CMS', 1, 1),
('Picture_Thumbnail_Height', '0', 2, 2),
('Meta_Keywords', 'jcore, cms, content management system, php, mysql, lamp, web cms', 1, 1),
('Meta_Description', 'jCore is the web Content Management System build especially for webmasters to easily maintenance multiple websites', 1, 1),
('Webmaster_Email', 'support@jcore.net', 1, 1),
('Webmaster_BCC_Email', '', 1, 1),
('Picture_Thumbnail_Width', '150', 2, 2),
('Page_Settings', '', 0, 1),
('Picture_Settings', '', 0, 2),
('Brute_Force_Protection', '', 0, 3),
('Brute_Force_Maximum_Failure_Attempts', '5', 2, 3),
('Brute_Force_Protection_Time_Minutes', '60', 2, 3),
('Brute_Force_Maximum_Failure_Attempts_Before_TwoWeeks_Ban', '30', 2, 3),
('Brute_Force_Email_Notification', '1', 3, 3),
('Password_Trading_Protection', '', 0, 4),
('Password_Trading_Maximum_Simultaneous_Logins', '3', 2, 4),
('Password_Trading_Protection_Time_Minutes', '60', 2, 4),
('Password_Trading_Email_Notification', '1', 3, 4),
('Maintenance_Settings', '', 0, 5),
('Maintenance_Suspend_Website', '0', 3, 5),
('Maintenance_Suspend_Text', '<html>\r\n<head>\r\n<title>Site Under Maintenance</title>\r\n</head>\r\n<body>\r\n<div style=''margin: 100px auto; border: solid 1px #CCCCCC; width: 500px; padding: 10px; text-align: center; font-family: Arial, Helvetica, Sans-serif;''>\r\n<h1>Site under maintenance</h1>\r\n<p>We are currently making enhancements and/or fixing issues. We appreciate your patience during this time, and encourage you to return here shortly.</p>\r\n</div>\r\n</body>\r\n</html>', 4, 5),
('Maintenance_Notification_Text', '', 4, 5),
('Page_TimeZone', 'Europe/London', 1, 1),
('Page_Charset', 'utf-8', 1, 1),
('Page_404_Error_Text', '<div class=''posts''>\r\n<div class=''post selected''>\r\n<h1 class=''post-title''>\r\nAddress Not Found\r\n<span>{url}uri{/url}</span>\r\n</h1>\r\n<div class=''post-content''>\r\n<p>\r\nUnfortunately the page you are looking for can''t be found on the server {url}server{/url}.\r\n</p>\r\n<p>\r\nSuggestions:\r\n</p>\r\n<ul>\r\n<li>Check the spelling of the address you typed.</li>\r\n<li>Are you certain this page exists? The link may have expired.</li>\r\n<li>If you are still having problems, please visit the <b>Main Page</b>.</li>\r\n</ul>\r\n<div class=''button''>\r\n<a href=''%SITE_URL%''>Main Page</a>\r\n</div>\r\n<div class=''clear-both''></div>\r\n</div>\r\n</div>\r\n</div>', 4, 1);

-- --------------------------------------------------------

-- 
-- Table structure for table `userlogins`
-- 

DROP TABLE IF EXISTS `userlogins`;
CREATE TABLE `userlogins` (
  `SessionID` varchar(100) NOT NULL default '',
  `UserID` mediumint(8) unsigned NOT NULL default '0',
  `FromIP` bigint(20) NOT NULL default '0',
  `TimeStamp` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `KeepIt` tinyint(4) NOT NULL default '0',
  KEY `UserID` (`UserID`),
  KEY `ID` (`SessionID`)
) ENGINE=MyISAM;

-- 
-- Dumping data for table `userlogins`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `userpermissions`
-- 

DROP TABLE IF EXISTS `userpermissions`;
CREATE TABLE `userpermissions` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `UserID` mediumint(8) unsigned NOT NULL default '0',
  `Path` varchar(255) NOT NULL default '',
  `PermissionTypeID` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`ID`),
  KEY `UserID` (`UserID`,`Path`)
) ENGINE=MyISAM;

-- 
-- Dumping data for table `userpermissions`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `userrequests`
-- 

DROP TABLE IF EXISTS `userrequests`;
CREATE TABLE `userrequests` (
  `UserID` mediumint(8) unsigned NOT NULL default '0',
  `TimeStamp` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `RequestTypeID` tinyint(3) unsigned NOT NULL default '0',
  `RequestID` varchar(100) NOT NULL default '',
  `FromIP` bigint(20) NOT NULL default '0',
  KEY `UserID` (`UserID`,`TimeStamp`,`RequestID`),
  KEY `FromIP` (`FromIP`)
) ENGINE=MyISAM;

-- 
-- Dumping data for table `userrequests`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `users`
-- 

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `ID` mediumint(8) unsigned NOT NULL auto_increment,
  `UserName` varchar(100) NOT NULL default '',
  `Password` varchar(100) NOT NULL default '',
  `Email` varchar(100) NOT NULL default '',
  `Website` varchar(255) NOT NULL default '',
  `TimeStamp` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `StayLoggedIn` tinyint(1) unsigned NOT NULL default '0',
  `LastVisitTimeStamp` timestamp NOT NULL default '0000-00-00 00:00:00',
  `Admin` tinyint(1) unsigned NOT NULL default '0',
  `IP` bigint(20) NOT NULL default '0',
  `Suspended` tinyint(1) unsigned NOT NULL default '0',
  `DisableNotificationEmails` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`ID`),
  KEY `UserName` (`UserName`,`Email`,`TimeStamp`),
  KEY `Admin` (`Admin`),
  KEY `Suspended` (`Suspended`)
) ENGINE=MyISAM;

-- 
-- Dumping data for table `users`
-- 

INSERT INTO `users` (`ID`, `UserName`, `Password`, `Email`, `Website`, `TimeStamp`, `StayLoggedIn`, `LastVisitTimeStamp`, `Admin`, `IP`, `Suspended`, `DisableNotificationEmails`) VALUES 
(1, 'admin', '30c6bb566785a74868c1e62f4a40c67fac8ffcb5640efcb', 'admin@jcore.net', 'http://jcore.net', '2009-07-23 14:33:13', 0, '2009-07-24 12:15:39', 1, 2130706433, 0, 0);


-- --------------------------------------------------------

-- 
-- Modification / Changes for ver. 0.2
-- 

DROP TABLE IF EXISTS `massemails`;
CREATE TABLE `massemails` (
`ID` MEDIUMINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY ,
`UserID` MEDIUMINT UNSIGNED NOT NULL default '0' ,
`From` VARCHAR( 255 ) NOT NULL default '' ,
`To` TEXT NULL,
`Subject` VARCHAR( 255 ) NOT NULL default '' ,
`Message` MEDIUMTEXT NULL,
`TimeStamp` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
`EmailsSentOut` MEDIUMINT UNSIGNED NOT NULL default '0' ,
INDEX ( `TimeStamp`, `UserID` )
) ENGINE = MYISAM ;

INSERT INTO `settings` (
`ID` ,
`Value` ,
`TypeID` ,
`OrderID`
)
VALUES (
'Functionality_Settings', '', '0', '6'
), (
'Ajax_Paging', '0', '3', '6'
);

ALTER TABLE `dynamicforms` CHANGE `Method` `Method` VARCHAR( 10 ) NOT NULL DEFAULT 'post';

ALTER TABLE `dynamicformfields` ADD `AdditionalText` VARCHAR( 255 ) NOT NULL  default '' AFTER `Required` ;


-- --------------------------------------------------------

-- 
-- Modification / Changes for ver. 0.3
-- 

INSERT INTO  `settings` (
`ID` ,
`Value` ,
`TypeID` ,
`OrderID`
)
VALUES (
'Email_Settings',  '',  '0',  '7'
), (
'Email_Use_SMTP',  '0',  '3',  '7'
), (
'Email_Use_SSL_SMTP',  '0',  '3',  '7'
), (
'Email_SMTP_Host',  'localhost',  '1',  '7'
), (
'Email_SMTP_Port',  '25',  '1',  '7'
), (
'Email_SMTP_Username',  '',  '1',  '7'
), (
'Email_SMTP_Password',  '',  '1',  '7'
);

INSERT INTO  `settings` (
`ID` ,
`Value` ,
`TypeID` ,
`OrderID`
)
VALUES (
'Blog_Ping_On_New_Posts',  '0',  '3',  '6'
), (
'Blog_Ping_Servers',  'http://rpc.pingomatic.com/',  '1',  '6'
);

ALTER TABLE  `posts` ADD  `DisplayRelatedPosts` TINYINT( 1 ) UNSIGNED NOT NULL DEFAULT  '0' AFTER  `OnMainPage`;

INSERT INTO  `settings` (
`ID` ,
`Value` ,
`TypeID` ,
`OrderID`
)
VALUES 
('jQuery_Settings',  '',  '0',  '8'), 
('jQuery_Load_Plugins',  'cookie, loading, mailme, qtip, rating, ajaxlinks, ajaxform, lightbox, ui, ui.datepicker, tabby, fctoggle',  '1',  '8');

ALTER TABLE  `menuitemmodules` ADD  `ModuleItemID` INT UNSIGNED NOT NULL DEFAULT  '0';


-- --------------------------------------------------------

-- 
-- Modification / Changes for ver. 0.4
-- 

ALTER TABLE  `blocks` ADD  `Caching` TINYINT( 1 ) UNSIGNED NOT NULL DEFAULT  '0' AFTER  `ViewableBy` ,
ADD  `CacheOnlyForGuests` TINYINT( 1 ) UNSIGNED NOT NULL DEFAULT  '0' AFTER `Caching`,
ADD  `CacheRefreshTime` SMALLINT UNSIGNED NOT NULL DEFAULT  '10' AFTER  `CacheOnlyForGuests` ,
ADD  `CacheContent` LONGTEXT NULL AFTER  `CacheRefreshTime` ,
ADD  `CacheTimeStamp` TIMESTAMP NOT NULL default CURRENT_TIMESTAMP AFTER  `CacheContent`;

ALTER TABLE  `posts` ADD INDEX (  `TimeStamp` );

DROP TABLE IF EXISTS `noteattachments`;
CREATE TABLE `noteattachments` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `OrderID` mediumint(9) NOT NULL default '0',
  `Location` varchar(255) NOT NULL default '',
  `Title` varchar(255) NOT NULL default '',
  `TimeStamp` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `HumanMimeType` varchar(255) NOT NULL default '',
  `FileSize` int(10) unsigned NOT NULL default '0',
  `NoteID` int(10) unsigned NOT NULL default '1',
  `Downloads` int(10) unsigned NOT NULL default '0',
  KEY `ID` (`ID`),
  KEY `OrderID` (`OrderID`),
  KEY `NoteID` (`NoteID`),
  KEY `TimeStamp` (`TimeStamp`)
) ENGINE=MyISAM;

DROP TABLE IF EXISTS `notecomments`;
CREATE TABLE `notecomments` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `NoteID` int(10) unsigned NOT NULL default '0',
  `UserName` varchar(100) NOT NULL default '',
  `UserID` mediumint(8) unsigned NOT NULL default '0',
  `Comment` text NULL,
  `TimeStamp` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `IP` bigint(20) NOT NULL default '0',
  `SubCommentOfID` int(10) unsigned NOT NULL default '0',
  `Rating` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`ID`),
  KEY `TimeStamp` (`TimeStamp`),
  KEY `NoteID` (`NoteID`,`UserName`),
  KEY `UserID` (`UserID`)
) ENGINE=MyISAM;

DROP TABLE IF EXISTS `notecommentsratings`;
CREATE TABLE `notecommentsratings` (
  `CommentID` int(10) unsigned NOT NULL default '0',
  `UserID` mediumint(8) unsigned NOT NULL default '0',
  `IP` bigint(20) NOT NULL default '0',
  `TimeStamp` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `Rating` tinyint(1) NOT NULL default '0',
  KEY `CommentID` (`CommentID`,`UserID`,`IP`,`TimeStamp`),
  KEY `Rating` (`Rating`)
) ENGINE=MyISAM;

DROP TABLE IF EXISTS `notes`;
CREATE TABLE `notes` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `Title` varchar(255) NOT NULL default '',
  `TimeStamp` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `DueDate` date default NULL,
  `Content` mediumtext NULL,
  `Comments` smallint(5) unsigned NOT NULL default '0',
  `Attachments` smallint(5) unsigned NOT NULL default '0',
  `StatusID` tinyint(1) unsigned NOT NULL default '1',
  `UserID` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`ID`),
  KEY `TimeStamp` (`TimeStamp`),
  KEY `StatusID` (`StatusID`),
  KEY `DueDate` (`DueDate`),
  KEY `UserID` (`UserID`)
) ENGINE=MyISAM;

INSERT INTO  `settings` (
`ID` ,
`Value` ,
`TypeID` ,
`OrderID`
)
VALUES (
'Picture_Watermark',  '0',  '3',  '2'
), (
'Picture_Watermark_Text',  'Copyright (c) 2009',  '1',  '2'
), (
'Picture_Watermark_Text_Font',  'fonts/arial.ttf',  '1',  '2'
), (
'Picture_Watermark_Logo',  '',  '1',  '2'
), (
'Picture_Watermark_Position',  '100% 100%',  '1',  '2'
);

INSERT INTO  `settings` (
`ID` ,
`Value` ,
`TypeID` ,
`OrderID`
)
VALUES (
'Security_Image_Settings',  '',  '0',  '9'
), (
'Security_Image_Code_Length',  '7',  '1',  '9'
), (
'Security_Image_Font',  'fonts/arial.ttf',  '1',  '9'
), (
'Security_Image_Font_Size',  '15',  '1',  '9'
), (
'Security_Image_Random_Lines',  '7',  '1',  '9'
), (
'Security_Image_Foreground_Color',  '#000000',  '1',  '9'
), (
'Security_Image_Background_Color',  '#ffffc8',  '1',  '9'
);


-- --------------------------------------------------------

-- 
-- Modification / Changes for ver. 0.5
-- 

ALTER TABLE  `modules` ADD  `Searchable` TINYINT( 1 ) UNSIGNED NOT NULL DEFAULT  '0',
ADD INDEX (  `Searchable` );

ALTER TABLE  `modules` CHANGE  `ID`  `ID` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE  `postpictures` ADD  `Views` INT UNSIGNED NOT NULL DEFAULT  '0';

ALTER TABLE  `postpictures` ADD  `Thumbnail` TINYINT( 1 ) UNSIGNED NOT NULL DEFAULT  '0';

INSERT INTO `settings` (`ID`, `Value`, `TypeID`, `OrderID`) VALUES ('Default_Locale', 'en_US', '1', '6');

ALTER TABLE  `menuitems` ADD  `Posts` SMALLINT UNSIGNED NOT NULL DEFAULT  '0' AFTER  `Limit`;

UPDATE `menuitems` SET `Posts` = 1;

INSERT INTO `settings` (`ID`, `Value`, `TypeID`, `OrderID`) VALUES 
('Brute_Force_Protection_Enabled', '1', '3', '3'),
('Password_Trading_Protection_Enabled', '1', '3', '4'),
('Admin_Settings', '', '0', '10'),
('Admin_Items_Counter_Enabled', '1', '3', '10');

DROP TABLE IF EXISTS `postkeywords`;
CREATE TABLE  `postkeywords` (
`Keyword` VARCHAR( 100 ) NOT NULL default '' ,
`Counter` SMALLINT UNSIGNED NOT NULL DEFAULT  '0',
INDEX (  `Counter` )
) ENGINE = MYISAM ;

ALTER TABLE `users` ADD `SkipIPCheck` TINYINT( 1 ) UNSIGNED NOT NULL DEFAULT '0' AFTER `DisableNotificationEmails`;

-- --------------------------------------------------------

-- 
-- Modification / Changes for ver. 0.6
-- 

DELETE FROM `settings` WHERE `ID` = 'Meta_Title';

UPDATE  `settings` SET `OrderID` =  '10' WHERE  `ID` =  'Admin_Settings';

UPDATE  `settings` SET `OrderID` =  '10' WHERE  `ID` =  'Admin_Items_Counter_Enabled';

UPDATE  `settings` SET  `Value` =  '30' WHERE  `ID` =  'Security_Image_Font_Size';

UPDATE  `settings` SET  `Value` =  'fonts/VeraSansBold.ttf' WHERE  `ID` =  'Security_Image_Font';

UPDATE `settings` SET `ID` = 'Maintenance_Website_Suspended' WHERE `ID` = 'Maintenance_Suspend_Website';

UPDATE `settings` SET `Value` = 'cookie, loading, mailme, qtip, rating, ajaxlinks, ajaxform, lightbox, fctoggle, tabby, ui, ui.datepicker, colorpicker, tipsy, dropdownmenu' WHERE `ID` = 'jQuery_Load_Plugins';

INSERT INTO  `settings` (
`ID` ,
`Value` ,
`TypeID` ,
`OrderID`
)
VALUES 
('jQuery_Load_Admin_Plugins',  '',  '1',  '8'),
('jQuery_Disabled',  '',  '3',  '8');

INSERT INTO  `settings` (
`ID` ,
`Value` ,
`TypeID` ,
`OrderID`
)
VALUES 
('Security_Image_Random_Words',  '1',  '3',  '9'),
('Security_Image_Random_Fonts',  '',  '3',  '9'),
('Registrations_Suspended', '', '3', '5'),
('Logins_Suspended', '', '3', '5'),
('Minimum_Password_Length',  '5',  '1',  '6');

UPDATE  `settings` SET `OrderID` =  `OrderID`+1 WHERE  `OrderID` > 7;

INSERT INTO  `settings` (
`ID` ,
`Value` ,
`TypeID` ,
`OrderID`
)
VALUES 
('Comments_Settings',  '',  '0',  '8'),
('Moderated_Comments',  '',  '3',  '8'),
('Moderated_Comments_By_Approval',  '',  '3',  '8'),
('Moderated_Comments_Pending_Minutes',  '0',  '1',  '8');

ALTER TABLE `posts` ADD `Rating` tinyint(1) unsigned NOT NULL default '0' AFTER `EnableGuestComments`, 
ADD `EnableRating` tinyint(1) unsigned NOT NULL default '0' AFTER `Rating`, 
ADD `EnableGuestRating` tinyint(1) unsigned NOT NULL default '0' AFTER `EnableRating`;

DROP TABLE IF EXISTS `postratings`;
CREATE TABLE `postratings` (`PostID` int(10) unsigned NOT NULL default '0', `UserID` mediumint(8) unsigned NOT NULL default '0', `IP` bigint(20) NOT NULL default '0', `TimeStamp` timestamp NOT NULL default CURRENT_TIMESTAMP, `Rating` tinyint(1) NOT NULL default '0', KEY `Rating` (`Rating`), KEY `PostID` (`PostID`,`UserID`,`IP`,`TimeStamp`) ) ENGINE=MyISAM;

ALTER TABLE  `posts` ADD  `URL` VARCHAR( 255 ) NOT NULL default '' AFTER  `Path`;

ALTER TABLE  `postcomments` ADD  `Pending` TINYINT( 1 ) UNSIGNED NOT NULL DEFAULT  '0', ADD INDEX (  `Pending` );

ALTER TABLE  `notecomments` ADD  `Pending` TINYINT( 1 ) UNSIGNED NOT NULL DEFAULT  '0', ADD INDEX (  `Pending` );

ALTER TABLE  `userrequests` ADD  `Data` TEXT NULL DEFAULT NULL;

ALTER TABLE  `dynamicformfields` ADD  `PlaceholderText` VARCHAR( 255 ) NOT NULL default '' AFTER  `Required`;

ALTER TABLE  `dynamicformfields` ADD  `TooltipText` VARCHAR( 255 ) NOT NULL default '' AFTER  `PlaceholderText`;

ALTER TABLE  `menuitems` ADD  `SEOTitle` VARCHAR( 255 ) NOT NULL default '' AFTER  `Link` ,
ADD  `SEODescription` TEXT NULL AFTER  `SEOTitle` ,
ADD  `SEOKeywords` VARCHAR( 255 ) NOT NULL default '' AFTER  `SEODescription`;

ALTER TABLE  `menuitemmodules` CHANGE  `ModuleItemID`  `ModuleItemID` INT( 10 ) NOT NULL DEFAULT  '0';

DROP TABLE IF EXISTS `blocks`;
CREATE TABLE `blocks` (
  `ID` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `Title` varchar(255) NOT NULL default '',
  `Content` mediumtext NULL,
  `BlockID` varchar(100) NOT NULL default '',
  `Class` varchar(255) NOT NULL default '',
  `Deactivated` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `TypeID` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `SubBlockOfID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `MenuItemIDs` varchar(255) NOT NULL default '',
  `MenuItemExcept` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `LanguageIDs` varchar(255) NOT NULL default '',
  `LanguageExcept` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ViewableBy` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Caching` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `CacheOnlyForGuests` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `CacheRefreshTime` smallint(5) unsigned NOT NULL DEFAULT '10',
  `CacheContent` longtext NULL,
  `CacheTimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Limit` tinyint(3) unsigned NOT NULL DEFAULT '5',
  `OrderID` mediumint(9) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `SubBlockOfID` (`SubBlockOfID`),
  KEY `TypeID` (`TypeID`),
  KEY `Deactivated` (`Deactivated`,`OrderID`),
  KEY `ViewableBy` (`ViewableBy`)
) ENGINE=MyISAM;

INSERT INTO `blocks` (`ID`, `Title`, `Content`, `BlockID`, `Class`, `Deactivated`, `TypeID`, `SubBlockOfID`, `MenuItemIDs`, `MenuItemExcept`, `LanguageIDs`, `LanguageExcept`, `ViewableBy`, `Caching`, `CacheOnlyForGuests`, `CacheRefreshTime`, `CacheContent`, `CacheTimeStamp`, `Limit`, `OrderID`) VALUES
(1, 'Background', '', 'background', '', 0, 0, 0, '', 0, '', 0, 0, 0, 0, 10, '', '0000-00-00 00:00:00', 0, 1),
(2, 'Website', '', 'website', '', 0, 0, 1, '', 0, '', 0, 0, 0, 0, 10, '', '2010-08-10 19:03:37', 0, 1),
(3, 'Header Menu', '<div class=''bookmarking''>\r\n<script type="text/javascript">addthis_pub = ''pijulius'';</script>\r\n<a class=''normallink'' href="http://www.addthis.com/bookmark.php" onmouseover="return addthis_open(this, '''', ''[URL]'', ''[TITLE]'')" onmouseout="addthis_close()" onclick="return addthis_sendto()"><img src="http://s9.addthis.com/button1-bm.gif" width="125" height="16" style="border: 0;" alt="Bookmark and Share this" /></a><script type="text/javascript" src="http://s7.addthis.com/js/152/addthis_widget.js"></script>\r\n</div>', 'header-menu', '', 0, 3, 2, '', 0, '', 0, 0, 0, 0, 10, '', '0000-00-00 00:00:00', 0, 1),
(4, 'Header', '<div class=''logo''>\r\n<a href=''%SITE_URL%''></a>\r\n<div class=''slogan''></div>\r\n</div>\r\n<div class=''header-image''>\r\n<a class=''tipsy'' href=''http://sea-weed.deviantart.com/'' target=''_blank'' title=''Picture Copyright &copy; by Iliana (~sea-weed)''>&copy;</a>\r\n</div>', 'header', '', 0, 0, 2, '', 0, '', 0, 0, 0, 0, 10, '', '2010-08-10 18:38:40', 0, 2),
(5, 'Content', '', 'content', '', 0, 0, 2, '', 0, '', 0, 0, 0, 0, 10, '', '2010-08-10 19:03:37', 0, 3),
(6, 'Sidebar', '', 'sidebar', '', 0, 0, 5, '', 0, '', 0, 0, 0, 0, 10, '', '2010-08-25 18:26:42', 0, 1),
(7, 'Side Menu', '<h2 class=''sidebar-title''>Navigation</h2>\r\n', 'side-menu', '', 0, 3, 6, '', 0, '', 0, 0, 0, 0, 10, '', '0000-00-00 00:00:00', 0, 1),
(8, 'Content Bar', '', 'content-bar', '', 0, 0, 5, '', 0, '', 0, 0, 0, 0, 10, '', '2010-08-25 18:26:42', 0, 2),
(9, 'Page Content', '', 'pagecontent', '', 0, 1, 8, '', 0, '', 0, 0, 0, 0, 10, '', '2010-08-25 17:45:03', 0, 1),
(10, 'Clear Booth', '', '', 'clear-both', 0, 0, 5, '', 0, '', 0, 0, 0, 0, 10, '', '2010-08-25 18:26:42', 0, 3),
(11, 'Footer', '<div class=''footercontent''>\r\n<div class=''copyright''>\r\nCopyright %NOW_YEAR% &copy; %PAGE_TITLE%<br />Powered by <a href=''http://jcore.net'' target=''_blank''>jCore</a>\r\n</div>\r\n</div>', 'footer', '', 0, 0, 0, '', 0, '', 0, 0, 0, 0, 10, '', '2010-08-10 19:02:33', 0, 2);

UPDATE  `menus` SET  `Title` =  'Right Menu',
`Name` =  'right-menu', `BlockID` =  '7' WHERE  `ID` =1;

INSERT INTO `menus` SET  `Title` =  'Top Menu',
`Name` =  'main-menu', `BlockID` =  '3';

INSERT INTO `menuitems` (`ID`, `Title`, `Path`, `Link`, `SEOTitle`, `SEODescription`, `SEOKeywords`, `Hidden`, `Deactivated`, `ViewableBy`, `SubMenuOfID`, `MenuID`, `LanguageID`, `Limit`, `Posts`, `OrderID`) VALUES ('3', 'Home', 'home', '', '', '', '', '0', '0', '0', '0', '2', '0', '0', '0', '3'), ('4', 'What next?', 'what-next', '', '', '', '', '0', '0', '0', '0', '2', '0', '0', '0', '4');

-- --------------------------------------------------------

-- 
-- Modification / Changes for ver. 0.7
-- 

ALTER TABLE  `languages` ADD  `OrderID` MEDIUMINT NOT NULL DEFAULT  '0',
ADD INDEX (  `OrderID` );

ALTER TABLE  `menus` ADD  `OrderID` MEDIUMINT NOT NULL DEFAULT  '0',
ADD INDEX (  `OrderID` );

ALTER TABLE  `dynamicforms` ADD  `SendNotificationEmailTo` VARCHAR( 100 ) NOT NULL DEFAULT  '' AFTER  `SendNotificationEmail`;

ALTER TABLE  `dynamicforms` ADD  `SuccessMessage` TEXT NULL DEFAULT NULL;

INSERT INTO  `settings` (
`ID` ,
`Value` ,
`TypeID` ,
`OrderID`
)
VALUES (
'Email_PGP_Encrypt',  '0',  '3',  '7'
), (
'Email_PGP_Public_Keys_Directory',  '/home/user/pgpkeys/',  '1',  '7'
), (
'Email_PGP_Binary',  '/usr/bin/gpg',  '1',  '7'
);

ALTER TABLE  `dynamicformfields` ADD  `Values` TEXT NULL DEFAULT NULL AFTER  `ValueType`;

DROP TABLE  `dynamicformfieldvalues`;

ALTER TABLE  `dynamicformfields` ADD  `ViewableBy` TINYINT( 1 ) UNSIGNED NOT NULL DEFAULT  '0' AFTER  `Required` ,
ADD INDEX (  `ViewableBy` );

ALTER TABLE  `dynamicformfields` ADD  `Searchable` TINYINT( 1 ) UNSIGNED NOT NULL DEFAULT  '0' AFTER  `Required` ,
ADD INDEX (  `Searchable` );

ALTER TABLE  `dynamicformfields` ADD  `DataPreview` TINYINT( 1 ) UNSIGNED NOT NULL DEFAULT  '0' AFTER  `ViewableBy` ,
ADD INDEX (  `DataPreview` );

INSERT INTO `settings` (`ID`, `Value`, `TypeID`, `OrderID`) VALUES 
('Admin_Favorite_Links_Enabled', '1', '3', '11');

DROP TABLE IF EXISTS `favoritelinks`;
CREATE TABLE `favoritelinks` (
  `ID` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `Title` varchar(100) NOT NULL DEFAULT '',
  `Link` varchar(255) NOT NULL DEFAULT '',
  `Deactivated` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `OrderID` mediumint(9) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `Deactivated` (`Deactivated`),
  KEY `OrderID` (`OrderID`)
) ENGINE=MyISAM;

INSERT INTO `favoritelinks` (`ID`, `Title`, `Link`, `Deactivated`, `OrderID`) VALUES (NULL, 'Pages / Posts', '?path=admin/content/menuitems', '0', '1'), (NULL, 'Modules', '?path=admin/modules', '0', '2'), (NULL, 'Settings', '?path=admin/site/settings', '0', '3'), (NULL, 'Users', '?path=admin/members/users', '0', '4'), (NULL, 'Template', '?path=admin/site/template', '0', '5'), (NULL, 'View Website', '/', '0', '6'), (NULL, 'Logout', '?logout=1', '0', '7');

ALTER TABLE  `dynamicforms` ADD  `ProtectedSQLTable` TINYINT( 1 ) UNSIGNED NOT NULL DEFAULT  '0' AFTER  `Protected` ,
ADD  `BrowseDataURL` VARCHAR( 255 ) NOT NULL DEFAULT  '' AFTER  `ProtectedSQLTable`;

INSERT INTO `settings` (`ID`, `Value`, `TypeID`, `OrderID`) VALUES 
('Username_Changes_Disabled', '0', '3', '6');

INSERT INTO `settings` (`ID`, `Value`, `TypeID`, `OrderID`) VALUES 
('Page_Date_Format', '%a, %d %b %Y', '1', '1'),
('Page_Time_Format', '%H:%M:%S %Z', '1', '1'),
('Page_First_Weekday', 'Sunday', '1', '1');

DROP TABLE IF EXISTS `notificationemails`;
CREATE TABLE `notificationemails` (
  `ID` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `EmailID` varchar(100) NOT NULL DEFAULT '',
  `Subject` varchar(255) NOT NULL DEFAULT '',
  `Body` MEDIUMTEXT NULL,
  PRIMARY KEY (`ID`),
  KEY `EmailID` (`EmailID`)
) ENGINE=MyISAM;

INSERT INTO `dynamicforms` 
(`Title`, `FormID`, `Method`, `SendNotificationEmail`, `SQLTable`, `Protected`, `ProtectedSQLTable`, `BrowseDataURL`) VALUES
('Posts', 'posts', 'post', 0, 'posts', 1, 1, '?path=admin/content/menuitems');

SET @postsformid = LAST_INSERT_ID();

INSERT INTO `dynamicformfields` 
(`FormID`, `Title`, `Name`, `TypeID`, `ValueType`, `Required`, `Searchable`, `PlaceholderText`, `TooltipText`, `AdditionalText`, `Attributes`, `Style`, `OrderID`, `Protected`) VALUES
(@postsformid, 'Title', 'Title', 1, 1, 1, 1, '', '', '', '', 'width: 350px;', 1, 1),
(@postsformid, 'Content', 'Content', 19, 6, 0, 1, '', '', '', '', 'height: 400px;', 2, 1),
(@postsformid, 'Blogging Options', '', 13, 0, 0, 0, '', '', '', '', '', 3, 0),
(@postsformid, 'Created on', 'TimeStamp', 16, 4, 0, 0, '', '', '', '', 'width: 170px;', 4, 1),
(@postsformid, 'Path', 'Path', 1, 1, 0, 0, '', '', '', '', 'width: 300px;', 5, 1),
(@postsformid, 'Keywords', 'Keywords', 1, 1, 0, 1, '', 'e.g. oranges, lemons, limes', '', '', 'width: 250px;', 6, 1),
(@postsformid, 'Link to URL', 'URL', 1, 7, 0, 0, '', 'e.g. http://domain.com', '', '', 'width: 300px;', 7, 1),
(@postsformid, ' ', '', 14, 0, 0, 0, '', '', '', '', '', 8, 0),
(@postsformid, 'Announcement Options', '', 13, 0, 0, 0, '', '', '', '', '', 9, 0),
(@postsformid, 'Start Date', 'StartDate', 17, 5, 0, 0, '', '', '', '', 'width: 100px;', 10, 1),
(@postsformid, 'End Date', 'EndDate', 17, 5, 0, 0, '', '', '', '', 'width: 100px;', 11, 1),
(@postsformid, ' ', '', 14, 0, 0, 0, '', '', '', '', '', 12, 0),
(@postsformid, 'Display Options', '', 13, 0, 0, 0, '', '', '', '', '', 13, 0),
(@postsformid, 'Display On Mainpage', 'OnMainPage', 3, 10, 0, 0, '', '', '', '', '', 14, 1),
(@postsformid, 'In Block', 'BlockID', 5, 2, 0, 0, '', '', '', '', '', 15, 1),
(@postsformid, 'Partial Content', 'PartialContent', 3, 10, 0, 0, '', '', '', '', '', 16, 1),
(@postsformid, 'Display Related Posts', 'DisplayRelatedPosts', 3, 10, 0, 0, '', '', '', '', '', 17, 1),
(@postsformid, ' ', '', 14, 0, 0, 0, '', '', '', '', '', 18, 0),
(@postsformid, 'Rating Options', '', 13, 0, 0, 0, '', '', '', '', '', 19, 0),
(@postsformid, 'Enable Rating', 'EnableRating', 3, 10, 0, 0, '', '', '', '', '', 20, 1),
(@postsformid, 'Enable Guest Rating', 'EnableGuestRating', 3, 10, 0, 0, '', '', '', '', '', 21, 1),
(@postsformid, ' ', '', 14, 0, 0, 0, '', '', '', '', '', 22, 0),
(@postsformid, 'Comments Options', '', 13, 0, 0, 0, '', '', '', '', '', 23, 0),
(@postsformid, 'Enable Comments', 'EnableComments', 3, 10, 0, 0, '', '', '', '', '', 24, 1),
(@postsformid, 'Enable Guest Comments', 'EnableGuestComments', 3, 10, 0, 0, '', '', '', '', '', 25, 1),
(@postsformid, ' ', '', 14, 0, 0, 0, '', '', '', '', '', 26, 0),
(@postsformid, 'Additional Options', '', 13, 0, 0, 0, '', '', '', '', '', 27, 0),
(@postsformid, 'Deactivated', 'Deactivated', 3, 10, 0, 0, '', '', '<span class=''comment'' style=''text-decoration: line-through;''>(marked with strike through)</span>', '', '', 28, 1),
(@postsformid, 'Order', 'OrderID', 1, 2, 0, 0, '', '', '', '', 'width: 50px;', 29, 1),
(@postsformid, ' ', '', 14, 0, 0, 0, '', '', '', '', '', 30, 0);

ALTER TABLE  `users` ADD  `ShowAvatar` TINYINT( 1 ) UNSIGNED NOT NULL DEFAULT  '1' AFTER  `Suspended`;

INSERT INTO `settings` (`ID`, `Value`, `TypeID`, `OrderID`) VALUES 
('Avatars_Disabled', '0', '3', '6'),
('Avatars_Size', '64', '1', '6'),
('Default_Avatar_URL', '', '1', '6');

ALTER TABLE  `notecomments` ADD  `Email` VARCHAR( 100 ) NOT NULL DEFAULT  '' AFTER  `UserName`;
ALTER TABLE  `postcomments` ADD  `Email` VARCHAR( 100 ) NOT NULL DEFAULT  '' AFTER  `UserName`;

UPDATE `settings` SET `Value` = 'cookie, loading, mailme, rating, ajaxlinks, ajaxform, lightbox, fctoggle, tabby, ui, ui.datepicker, colorpicker, tipsy, dropdownmenu' WHERE `ID` = 'jQuery_Load_Plugins';

ALTER TABLE  `postkeywords` ADD  `MenuItemIDs` VARCHAR( 255 ) NOT NULL DEFAULT  '',
ADD INDEX (  `MenuItemIDs` );

DROP TABLE IF EXISTS `templates`;
CREATE TABLE `templates` (
  `ID` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `Name` (`Name`)
) ENGINE=MyISAM;

ALTER TABLE  `blocks` ADD  `TemplateID` SMALLINT UNSIGNED NOT NULL DEFAULT  '0' AFTER  `ID` ,
ADD INDEX (  `TemplateID` );

INSERT INTO  `settings` (
`ID` ,
`Value` ,
`TypeID` ,
`OrderID`
)
VALUES 
('Website_Template',  '',  '5',  '1'),
('Website_Template_SetForAdmin',  '0',  '5',  '1');

-- Should not be run when upgrading

UPDATE  `menus` SET  `Title` =  'Top Menu',
`Name` =  'main-menu', `BlockID` =  '3', `OrderID` = 2 WHERE  `ID` =1;

UPDATE `menus` SET  `Title` =  'Right Menu',
`Name` =  'right-menu', `BlockID` =  '7', `OrderID` = 1 WHERE `ID` = 2;

UPDATE  `menuitems` SET  `MenuID` =  '3' WHERE `MenuID` = 2;
UPDATE  `menuitems` SET  `MenuID` =  '2' WHERE `MenuID` = 1;
UPDATE  `menuitems` SET  `MenuID` =  '1' WHERE `MenuID` = 3;

UPDATE `blocks` SET `MenuItemIDs` = 'A', `MenuItemExcept` = 1 WHERE `ID` IN (6, 3, 4);

INSERT INTO `blocks` (`ID`, `Title`, `Content`, `BlockID`, `Class`, `Deactivated`, `TypeID`, `SubBlockOfID`, `MenuItemIDs`, `MenuItemExcept`, `LanguageIDs`, `LanguageExcept`, `ViewableBy`, `Caching`, `CacheOnlyForGuests`, `CacheRefreshTime`, `CacheContent`, `CacheTimeStamp`, `Limit`, `OrderID`) VALUES
(NULL, 'Admin Menu', '<ul id=''main-menu''><li class=''menu''><a href=''%SITE_URL%admin/''><span>{translate}Admin Home{/translate}</span></a></li><li class=''menu''><a href=''%SITE_URL%'' target=''_blank''><span>{translate}View Website{/translate}</span></a></li><li class=''menu''><a href=''http://jcore.net/help'' target=''_blank''><span>{translate}Get Help{/translate}</span></a></li><li class=''menu''><a href=''http://jcore.net'' target=''_blank''><span>jCore.net</span></a></li></ul>', 'header-menu', '', 0, 0, 2, 'A', 0, '', 0, 0, 0, 0, 10, '', '0000-00-00 00:00:00', 0, 1);


-- --------------------------------------------------------

-- 
-- Modification / Changes for ver. 0.8
-- 

RENAME TABLE `menuitems` TO `pages`;
RENAME TABLE `menuitemmodules` TO `pagemodules`;
ALTER TABLE  `pages` CHANGE  `SubMenuOfID`  `SubPageOfID` MEDIUMINT( 8 ) UNSIGNED NOT NULL DEFAULT  '0';
ALTER TABLE  `pagemodules` CHANGE  `MenuItemID`  `PageID` MEDIUMINT( 8 ) UNSIGNED NOT NULL DEFAULT  '0';

ALTER TABLE  `blocks` CHANGE  `MenuItemIDs`  `PageIDs` VARCHAR( 255 ) NOT NULL ,
CHANGE  `MenuItemExcept`  `PageExcept` TINYINT( 1 ) UNSIGNED NOT NULL DEFAULT  '0';

ALTER TABLE  `posts` CHANGE  `MenuItemID`  `PageID` MEDIUMINT( 8 ) UNSIGNED NOT NULL;
ALTER TABLE  `postkeywords` CHANGE  `MenuItemIDs`  `PageIDs` VARCHAR( 255 ) NOT NULL DEFAULT  '';

UPDATE `favoritelinks` SET `Link` = REPLACE(`Link`, 'admin/content/menuitems', 'admin/content/pages');
UPDATE `dynamicforms` SET `BrowseDataURL` = REPLACE(`BrowseDataURL`, 'admin/content/menuitems', 'admin/content/postsatglance');
UPDATE `userpermissions` SET `Path` = REPLACE(`Path`, 'admin/content/menuitems', 'admin/content/pages');

ALTER TABLE  `blocks` CHANGE  `Limit`  `Limit` TINYINT( 3 ) UNSIGNED NOT NULL DEFAULT  '0';
ALTER TABLE  `pages` ADD  `PostKeywords` VARCHAR( 255 ) NOT NULL DEFAULT  '' AFTER  `Link`;

INSERT INTO `settings` (`ID`, `Value`, `TypeID`, `OrderID`) VALUES 
('Instant_User_Registration', '0', '3', '6');

DROP TABLE IF EXISTS `usergroups`;
CREATE TABLE `usergroups` (
  `ID` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `GroupName` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM;

DROP TABLE IF EXISTS `usergrouppermissions`;
CREATE TABLE `usergrouppermissions` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `GroupID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `Path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PermissionTypeID` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `UserID` (`GroupID`,`Path`)
) ENGINE=MyISAM;

ALTER TABLE  `users` ADD  `GroupID` SMALLINT UNSIGNED NOT NULL DEFAULT  '0' AFTER  `ID` ,
ADD INDEX (  `GroupID` );

ALTER TABLE  `dynamicforms` ADD  `SendAutoResponse` TINYINT( 1 ) UNSIGNED NOT NULL DEFAULT  '0' AFTER  `SendNotificationEmailTo` ,
ADD  `AutoResponseFrom` VARCHAR( 255 ) NOT NULL DEFAULT  '' AFTER  `SendAutoResponse` ,
ADD  `AutoResponseSubject` VARCHAR( 255 ) NOT NULL DEFAULT  '' AFTER  `AutoResponseFrom` ,
ADD  `AutoResponseMessage` MEDIUMTEXT NULL DEFAULT NULL AFTER  `AutoResponseSubject`;

ALTER TABLE  `dynamicforms` ADD INDEX (  `FormID` );
ALTER TABLE  `modules` ADD INDEX (  `Name` );

UPDATE  `settings` SET  `TypeID` =  '10' WHERE  `ID` =  'Security_Image_Foreground_Color';
UPDATE  `settings` SET  `TypeID` =  '10' WHERE  `ID` =  'Security_Image_Background_Color';

ALTER TABLE  `dynamicforms` ADD  `LocaleFile` VARCHAR( 255 ) NOT NULL DEFAULT  '' AFTER  `AutoResponseMessage`;

CREATE TABLE IF NOT EXISTS `pageforms` (
  `PageID` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `FormID` smallint(5) unsigned NOT NULL DEFAULT '0',
  KEY `PageID` (`PageID`)
) ENGINE=MyISAM;

ALTER TABLE  `notecomments` CHANGE  `Rating`  `Rating` SMALLINT NOT NULL DEFAULT  '0';
UPDATE `notecomments` SET `Rating` = `Rating`-7 WHERE `Rating`;

ALTER TABLE  `postcomments` CHANGE  `Rating`  `Rating` SMALLINT NOT NULL DEFAULT  '0';
UPDATE `postcomments` SET `Rating` = `Rating`-7 WHERE `Rating`;

UPDATE `dynamicformfields` SET `OrderID` = `OrderID`-1 WHERE `Name` = 'BlockID' AND `Protected`;
UPDATE `dynamicformfields` SET `OrderID` = `OrderID`+1 WHERE `Name` = 'OnMainPage' AND `Protected`;

-- --------------------------------------------------------

-- 
-- Modification / Changes for ver. 0.9
-- 

ALTER TABLE  `pages` ADD INDEX (  `ViewableBy` );

DROP TABLE IF EXISTS `menuitems`;
CREATE TABLE IF NOT EXISTS `menuitems` (
  `ID` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `Title` varchar(150) NOT NULL default '',
  `Path` varchar(255) NOT NULL default '',
  `Link` varchar(255) NOT NULL default '',
  `Deactivated` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ViewableBy` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `SubMenuItemOfID` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `MenuID` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `LanguageID` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `OrderID` mediumint(9) NOT NULL DEFAULT '0',
  `PageID` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `Deactivated` (`Deactivated`,`SubMenuItemOfID`,`OrderID`),
  KEY `Path` (`Path`),
  KEY `MenuID` (`MenuID`),
  KEY `LanguageID` (`LanguageID`),
  KEY `ViewableBy` (`ViewableBy`)
) ENGINE=MyISAM;

ALTER TABLE  `menus` ADD  `IncludeNewPages` TINYINT( 1 ) UNSIGNED NOT NULL DEFAULT  '0' AFTER  `Name`;
UPDATE `menus` SET `IncludeNewPages` = 1 WHERE `ID` = 2;

INSERT INTO `menuitems` 
SELECT NULL, `Title`, `Path`, `Link`, `Deactivated`, `ViewableBy`, `SubPageOfID` AS `SubMenuItemOfID`, `MenuID`, `LanguageID`, `OrderID`, `ID` AS `PageID`
FROM `pages` WHERE `MenuID` = 2;

INSERT INTO `menuitems` 
SELECT NULL, `Title`, `Path`, `Link`, `Deactivated`, `ViewableBy`, `SubPageOfID` AS `SubMenuItemOfID`, 1 AS `MenuID`, `LanguageID`, `OrderID`, `ID` AS `PageID`
FROM `pages` WHERE `MenuID` = 2;

UPDATE `menus` SET `OrderID` = `ID`;
DELETE FROM `pages` WHERE `MenuID` = 1;

ALTER TABLE  `pages` CHANGE  `ViewableBy`  `AccessibleBy` TINYINT( 1 ) UNSIGNED NOT NULL DEFAULT  '0';
ALTER TABLE  `pages` DROP  `Link` , DROP  `Hidden` , DROP  `MenuID`;

INSERT INTO  `settings` (`ID` ,`Value` ,`TypeID` ,`OrderID`)
VALUES ('Manual_Gettext',  '0',  '3',  '6');

ALTER TABLE  `bfprotection` CHANGE  `IP`  `IP` DECIMAL( 39, 0 ) NOT NULL DEFAULT  '0';
ALTER TABLE  `bfprotectionbans` CHANGE  `IP`  `IP` DECIMAL( 39, 0 ) NOT NULL DEFAULT  '0';
ALTER TABLE  `notecomments` CHANGE  `IP`  `IP` DECIMAL( 39, 0 ) NOT NULL DEFAULT  '0';
ALTER TABLE  `notecommentsratings` CHANGE  `IP`  `IP` DECIMAL( 39, 0 ) NOT NULL DEFAULT  '0';
ALTER TABLE  `postcomments` CHANGE  `IP`  `IP` DECIMAL( 39, 0 ) NOT NULL DEFAULT  '0';
ALTER TABLE  `postcommentsratings` CHANGE  `IP`  `IP` DECIMAL( 39, 0 ) NOT NULL DEFAULT  '0';
ALTER TABLE  `postratings` CHANGE  `IP`  `IP` DECIMAL( 39, 0 ) NOT NULL DEFAULT  '0';
ALTER TABLE  `userlogins` CHANGE  `FromIP`  `FromIP` DECIMAL( 39, 0 ) NOT NULL DEFAULT  '0';
ALTER TABLE  `userrequests` CHANGE  `FromIP`  `FromIP` DECIMAL( 39, 0 ) NOT NULL DEFAULT  '0';
ALTER TABLE  `users` CHANGE  `IP`  `IP` DECIMAL( 39, 0 ) NOT NULL DEFAULT  '0';
