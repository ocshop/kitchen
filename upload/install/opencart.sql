-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 16, 2011 at 05:01 PM
-- Server version: 5.1.36
-- PHP Version: 5.3.4

-- --------------------------------------------------------

--
-- Database: `ocshop`
--

-- --------------------------------------------------------

CREATE TABLE `oc_product_profile` (
  `product_id` int(11) NOT NULL,
  `profile_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`profile_id`,`customer_group_id`)
) ENGINE=MyISAM COLLATE=utf8_general_ci;



CREATE TABLE `oc_profile` (
  `profile_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `price` decimal(10,4) NOT NULL,
  `frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `duration` int(10) unsigned NOT NULL,
  `cycle` int(10) unsigned NOT NULL,
  `trial_status` tinyint(4) NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `trial_frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `trial_duration` int(10) unsigned NOT NULL,
  `trial_cycle` int(10) unsigned NOT NULL,
  PRIMARY KEY (`profile_id`)
) ENGINE=MyISAM COLLATE=utf8_general_ci;


CREATE TABLE `oc_profile_description` (
  `profile_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`profile_id`,`language_id`)
) ENGINE=MyISAM COLLATE=utf8_general_ci;

--
-- Table structure for table `oc_order_recurring`
--

DROP TABLE IF EXISTS `oc_order_recurring`;
CREATE TABLE `oc_order_recurring` (
  `order_recurring_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `status` tinyint(4) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `profile_id` int(11) NOT NULL,
  `profile_name` varchar(255) NOT NULL,
  `profile_description` varchar(255) NOT NULL,
  `recurring_frequency` varchar(25) NOT NULL,
  `recurring_cycle` smallint(6) NOT NULL,
  `recurring_duration` smallint(6) NOT NULL,
  `recurring_price` decimal(10,4) NOT NULL,
  `trial` tinyint(1) NOT NULL,
  `trial_frequency` varchar(25) NOT NULL,
  `trial_cycle` smallint(6) NOT NULL,
  `trial_duration` smallint(6) NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `profile_reference` varchar(255) NOT NULL,
  PRIMARY KEY (`order_recurring_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_recurring_transaction`
--

DROP TABLE IF EXISTS `oc_order_recurring_transaction`;
CREATE TABLE `oc_order_recurring_transaction` (
  `order_recurring_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_recurring_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `amount` decimal(10,4) NOT NULL,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`order_recurring_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oc_address`
--

DROP TABLE IF EXISTS `oc_address`;
CREATE TABLE `oc_address` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `company` varchar(32) NOT NULL,
  `company_id` varchar(32) NOT NULL,
  `tax_id` varchar(32) NOT NULL,    
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL DEFAULT '0',
  `zone_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`address_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_address`
--


-- --------------------------------------------------------

--
-- Table structure for table `oc_affiliate`
--

DROP TABLE IF EXISTS `oc_affiliate`;
CREATE TABLE `oc_affiliate` (
  `affiliate_id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `company` varchar(32) NOT NULL,
  `website` varchar(255) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `commission` decimal(4,2) NOT NULL DEFAULT '0.00',
  `tax` varchar(64) NOT NULL,
  `payment` varchar(6) NOT NULL,
  `cheque` varchar(100) NOT NULL,
  `paypal` varchar(64) NOT NULL,
  `bank_name` varchar(64) NOT NULL,
  `bank_branch_number` varchar(64) NOT NULL,
  `bank_swift_code` varchar(64) NOT NULL,
  `bank_account_name` varchar(64) NOT NULL,
  `bank_account_number` varchar(64) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`affiliate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_affiliate`
--


-- --------------------------------------------------------

--
-- Table structure for table `oc_affiliate_transaction`
--

DROP TABLE IF EXISTS `oc_affiliate_transaction`;
CREATE TABLE `oc_affiliate_transaction` (
  `affiliate_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `affiliate_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`affiliate_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_affiliate_transaction`
--


-- --------------------------------------------------------

--
-- Table structure for table `oc_attribute`
--

DROP TABLE IF EXISTS `oc_attribute`;
CREATE TABLE `oc_attribute` (
  `attribute_id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`attribute_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_attribute`
--

INSERT INTO `oc_attribute` (`attribute_id`, `attribute_group_id`, `sort_order`) VALUES
(1, 6, 1),
(2, 6, 5),
(3, 6, 3),
(4, 3, 1),
(5, 3, 2),
(6, 3, 3),
(7, 3, 4),
(8, 3, 5),
(9, 3, 6),
(10, 3, 7),
(11, 3, 8);

-- --------------------------------------------------------

--
-- Table structure for table `oc_attribute_description`
--

DROP TABLE IF EXISTS `oc_attribute_description`;
CREATE TABLE `oc_attribute_description` (
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`attribute_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_attribute_description`
--

INSERT INTO `oc_attribute_description` (`attribute_id`, `language_id`, `name`) VALUES
(1, 1, 'Description'),
(2, 1, 'No. of Cores'),
(4, 1, 'test 1'),
(5, 1, 'test 2'),
(6, 1, 'test 3'),
(7, 1, 'test 4'),
(8, 1, 'test 5'),
(9, 1, 'test 6'),
(10, 1, 'test 7'),
(11, 1, 'test 8'),
(3, 1, 'Clockspeed');

-- --------------------------------------------------------

--
-- Table structure for table `oc_attribute_group`
--

DROP TABLE IF EXISTS `oc_attribute_group`;
CREATE TABLE `oc_attribute_group` (
  `attribute_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`attribute_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_attribute_group`
--

INSERT INTO `oc_attribute_group` (`attribute_group_id`, `sort_order`) VALUES
(3, 2),
(4, 1),
(5, 3),
(6, 4);

-- --------------------------------------------------------

--
-- Table structure for table `oc_attribute_group_description`
--

DROP TABLE IF EXISTS `oc_attribute_group_description`;
CREATE TABLE `oc_attribute_group_description` (
  `attribute_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`attribute_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_attribute_group_description`
--

INSERT INTO `oc_attribute_group_description` (`attribute_group_id`, `language_id`, `name`) VALUES
(3, 1, 'Память'),
(4, 1, 'Technical'),
(5, 1, 'Материнская плата'),
(6, 1, 'Процессор'),
(3, 2, 'Memory'),
(4, 2, 'Technical'),
(5, 2, 'Motherboard'),
(6, 2, 'Processor');

-- --------------------------------------------------------

--
-- Table structure for table `oc_banner`
--

DROP TABLE IF EXISTS `oc_banner`;
CREATE TABLE `oc_banner` (
  `banner_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`banner_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_banner`
--

INSERT INTO `oc_banner` (`banner_id`, `name`, `status`) VALUES
(15, 'slideshow', 1),
(16, 'banners', 1),
(20, 'banners-bottom', 1),
(21, 'Manufacturers', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_banner_image`
--

DROP TABLE IF EXISTS `oc_banner_image`;
CREATE TABLE `oc_banner_image` (
  `banner_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `banner_id` int(11) NOT NULL,
  `link` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`banner_image_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_banner_image`
--

INSERT INTO `oc_banner_image` (`banner_image_id`, `banner_id`, `link`, `image`) VALUES
(364, 15, 'index.php?route=product/product&amp;product_id=32', 'data/slide-2.jpg'),
(367, 20, 'index.php?route=product/product&amp;product_id=28', 'data/banner-3.jpg'),
(369, 16, 'index.php?route=product/product&amp;product_id=28', 'data/banner-1.jpg'),
(368, 16, 'index.php?route=product/product&amp;product_id=29', 'data/banner-2.jpg'),
(363, 15, 'index.php?route=product/product&amp;product_id=28', 'data/slide-1.jpg'),
(362, 15, 'index.php?route=product/product&amp;product_id=29', 'data/slide-3.jpg'),
(366, 20, 'index.php?route=product/product&amp;product_id=29', 'data/banner-4.jpg'),
(365, 20, 'index.php?route=product/product&amp;product_id=32', 'data/banner-5.jpg'),
(371, 21, 'index.php?route=product/manufacturer/info&amp;manufacturer_id=5', 'data/demo/htc_logo.jpg'),
(372, 21, 'index.php?route=product/manufacturer/info&amp;manufacturer_id=8', 'data/demo/apple_logo.jpg'),
(373, 21, 'index.php?route=product/manufacturer/info&amp;manufacturer_id=9', 'data/demo/canon_logo.jpg'),
(374, 21, 'index.php?route=product/manufacturer/info&amp;manufacturer_id=10', 'data/demo/sony_logo.jpg'),
(375, 21, 'index.php?route=product/manufacturer/info&amp;manufacturer_id=6', 'data/demo/palm_logo.jpg'),
(376, 21, 'index.php?route=product/manufacturer/info&amp;manufacturer_id=7', 'data/demo/hp_logo.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `oc_banner_image_description`
--

DROP TABLE IF EXISTS `oc_banner_image_description`;
CREATE TABLE `oc_banner_image_description` (
  `banner_image_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `banner_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`banner_image_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_banner_image_description`
--

INSERT INTO `oc_banner_image_description` (`banner_image_id`, `language_id`, `banner_id`, `title`, `description`) VALUES
(364, 7, 15, 'slide-3', '&lt;h1&gt;Curabitur vel fringilla&lt;/h1&gt;\r\n&lt;h2&gt;ligula tincidunt est&lt;/h2&gt;\r\n'),
(364, 6, 15, 'slide-3', '&lt;h1&gt;Curabitur vel fringilla&lt;/h1&gt;\r\n&lt;h2&gt;ligula tincidunt est&lt;/h2&gt;\r\n'),
(369, 7, 16, 'banner-1', '&lt;h2&gt;Clearance&lt;/h2&gt;\r\n&lt;h1&gt;Sale&lt;/h1&gt;'),
(367, 1, 20, 'banner-3', '&lt;h1&gt;bread&lt;/h1&gt;\r\n&lt;h3&gt;boards&lt;/h3&gt;\r\n&lt;h2&gt;&lt;span&gt;get up to&lt;/span&gt;25% off&lt;/h2&gt;'),
(369, 6, 16, 'banner-1', '&lt;h2&gt;Clearance&lt;/h2&gt;\r\n&lt;h1&gt;Sale&lt;/h1&gt;'),
(366, 7, 20, 'banner-4', '&lt;h1&gt;owl&lt;/h1&gt;\r\n&lt;h3&gt;esspresso&lt;/h3&gt;\r\n&lt;h2&gt;&lt;span&gt;get up to&lt;/span&gt;25% off&lt;/h2&gt;'),
(366, 6, 20, 'banner-4', '&lt;h1&gt;owl&lt;/h1&gt;\r\n&lt;h3&gt;esspresso&lt;/h3&gt;\r\n&lt;h2&gt;&lt;span&gt;get up to&lt;/span&gt;25% off&lt;/h2&gt;'),
(364, 1, 15, 'slide-3', '&lt;h1&gt;Curabitur vel fringilla&lt;/h1&gt;\r\n&lt;h2&gt;ligula tincidunt est&lt;/h2&gt;\r\n'),
(369, 1, 16, 'banner-1', '&lt;h2&gt;Clearance&lt;/h2&gt;\r\n&lt;h1&gt;Sale&lt;/h1&gt;\r\n'),
(368, 7, 16, 'banner-2', '&lt;h2&gt;black&lt;/h2&gt;\r\n&lt;h1&gt;collection&lt;/h1&gt;'),
(368, 6, 16, 'banner-2', '&lt;h2&gt;black&lt;/h2&gt;\r\n&lt;h1&gt;collection&lt;/h1&gt;'),
(368, 1, 16, 'banner-2', '&lt;h2&gt;black&lt;/h2&gt;\r\n&lt;h1&gt;collection&lt;/h1&gt;'),
(366, 1, 20, 'banner-4', '&lt;h1&gt;owl&lt;/h1&gt;\r\n&lt;h3&gt;esspresso&lt;/h3&gt;\r\n&lt;h2&gt;&lt;span&gt;get up to&lt;/span&gt;25% off&lt;/h2&gt;'),
(365, 7, 20, 'banner-5', '&lt;h1&gt;textured deep&lt;/h1&gt;\r\n&lt;h3&gt;bowls&lt;/h3&gt;\r\n&lt;h2&gt;&lt;span&gt;get up to&lt;/span&gt;25% off&lt;/h2&gt;'),
(365, 6, 20, 'banner-5', '&lt;h1&gt;textured deep&lt;/h1&gt;\r\n&lt;h3&gt;bowls&lt;/h3&gt;\r\n&lt;h2&gt;&lt;span&gt;get up to&lt;/span&gt;25% off&lt;/h2&gt;'),
(365, 1, 20, 'banner-5', '&lt;h1&gt;textured deep&lt;/h1&gt;\r\n&lt;h3&gt;bowls&lt;/h3&gt;\r\n&lt;h2&gt;&lt;span&gt;get up to&lt;/span&gt;25% off&lt;/h2&gt;'),
(363, 7, 15, 'slide-1', '&lt;h1&gt;Lorem ipsum dolore&lt;/h1&gt;\r\n&lt;h2&gt;roin turpis nibh&lt;/h2&gt;\r\n'),
(363, 6, 15, 'slide-1', '&lt;h1&gt;Lorem ipsum dolore&lt;/h1&gt;\r\n&lt;h2&gt;roin turpis nibh&lt;/h2&gt;\r\n\r\n'),
(363, 1, 15, 'slide-1', '&lt;h1&gt;Lorem ipsum dolore&lt;/h1&gt;\r\n&lt;h2&gt;roin turpis nibh&lt;/h2&gt;\r\n'),
(362, 7, 15, 'slide-2', '&lt;h1&gt;Praesent vestibulum&lt;/h1&gt;\r\n&lt;h2&gt;rutrum ante&lt;/h2&gt;'),
(362, 6, 15, 'slide-2', '&lt;h1&gt;Praesent vestibulum&lt;/h1&gt;\r\n&lt;h2&gt;rutrum ante&lt;/h2&gt;'),
(362, 1, 15, 'slide-2', '&lt;h1&gt;Praesent vestibulum&lt;/h1&gt;\r\n&lt;h2&gt;rutrum ante&lt;/h2&gt;\r\n'),
(367, 6, 20, 'banner-3', '&lt;h1&gt;bread&lt;/h1&gt;\r\n&lt;h3&gt;boards&lt;/h3&gt;\r\n&lt;h2&gt;&lt;span&gt;get up to&lt;/span&gt;25% off&lt;/h2&gt;'),
(367, 7, 20, 'banner-3', '&lt;h1&gt;bread&lt;/h1&gt;\r\n&lt;h3&gt;boards&lt;/h3&gt;\r\n&lt;h2&gt;&lt;span&gt;get up to&lt;/span&gt;25% off&lt;/h2&gt;'),
(371, 2, 21, 'HTC', ''),
(371, 1, 21, 'HTC', ''),
(372, 1, 21, 'Apple', ''),
(372, 2, 21, 'Apple', ''),
(373, 1, 21, 'Canon', ''),
(373, 2, 21, 'Canon', ''),
(374, 1, 21, 'Sony', ''),
(374, 2, 21, 'Sony', ''),
(375, 1, 21, 'Palm', ''),
(375, 2, 21, 'Palm', ''),
(376, 1, 21, 'Hewlett-Packard', ''),
(376, 2, 21, 'Hewlett-Packard', '');
-- --------------------------------------------------------

--
-- Table structure for table `oc_category`
--

DROP TABLE IF EXISTS `oc_category`;
CREATE TABLE `oc_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `top` tinyint(1) NOT NULL,
  `column` int(3) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_category`
--

INSERT INTO `oc_category` (`category_id`, `image`, `parent_id`, `top`, `column`, `sort_order`, `status`, `date_added`, `date_modified`) VALUES
(25, '', 0, 1, 1, 3, 1, '2009-01-31 01:04:25', '2011-05-30 12:14:55'),
(27, 'data/promo/Coffee Maker Bosch Assimo/Coffee Maker Bosch Assimo 1.png', 20, 0, 0, 2, 1, '2009-01-31 01:55:34', '2014-08-14 10:39:13'),
(20, 'data/demo/compaq_presario.jpg', 0, 1, 1, 1, 1, '2009-01-05 21:49:43', '2014-08-27 07:37:42'),
(24, '', 0, 1, 1, 5, 1, '2009-01-20 02:36:26', '2014-08-27 18:42:03'),
(18, 'data/demo/hp_2.jpg', 20, 1, 0, 2, 1, '2009-01-05 21:49:15', '2014-08-27 18:24:52'),
(17, '', 20, 1, 1, 4, 1, '2009-01-03 21:08:57', '2014-08-27 18:25:52'),
(28, 'data/promo/Coffee Maker Bosch Assimo/Coffee Maker Bosch Assimo 1.png', 25, 0, 0, 1, 1, '2009-02-02 13:11:12', '2014-08-14 14:52:11'),
(26, 'data/promo/Coffee Machine Malongo Espresso-gold/Coffee Machine Malongo Espresso-gold 1.png', 20, 0, 0, 1, 1, '2009-01-31 01:55:14', '2014-08-14 10:38:42'),
(29, 'data/promo/John Lewis Funky Napkin Holder/John Lewis Funky Napkin Holder 2 copy.png', 25, 0, 0, 1, 1, '2009-02-02 13:11:37', '2014-08-14 14:52:26'),
(30, 'data/promo/Kalorik Meat Grinder MGR25959 Stainless Steel Blade/Kalorik Meat Grinder MGR25959 Stainless Steel Blade 1.png', 25, 0, 0, 1, 1, '2009-02-02 13:11:59', '2014-08-14 14:52:43'),
(31, 'data/promo/Coffee Machine Bugatti Diva/Coffee Machine Bugatti Diva 1.png', 25, 0, 0, 1, 1, '2009-02-03 14:17:24', '2014-08-14 14:53:12'),
(32, 'data/promo/LG Refrigerator/LG Refrigerator - Floral collection T676 1.png', 25, 0, 0, 1, 1, '2009-02-03 14:17:34', '2014-08-14 14:51:56'),
(33, '', 0, 1, 1, 6, 1, '2009-02-03 14:17:55', '2011-05-30 12:15:25'),
(34, 'data/demo/ipod_touch_4.jpg', 0, 1, 4, 7, 1, '2009-02-03 14:18:11', '2011-05-30 12:15:31'),
(35, 'data/promo/Bugatti Uma Electronic Kitchen Scale and Timer/Bugatti Uma Electronic Kitchen Scale and Timer 2 copy.png', 28, 0, 0, 0, 1, '2010-09-17 10:06:48', '2014-08-14 14:54:02'),
(36, 'data/promo/Bugatti Uma Electronic Kitchen Scale and Timer/Bugatti Uma Electronic Kitchen Scale and Timer 3 copy.png', 28, 0, 0, 0, 1, '2010-09-17 10:07:13', '2014-08-14 14:54:18'),
(37, 'data/promo/John Lewis Classic II Universal Steamer and Lid/John Lewis Classic II Universal Steamer and Lid 1 copy.png', 34, 0, 0, 0, 1, '2010-09-18 14:03:39', '2014-08-14 15:11:41'),
(38, 'data/promo/Hood/Hood Scholtes HSE 159 IX 1.png', 34, 0, 0, 0, 1, '2010-09-18 14:03:51', '2014-08-14 15:04:48'),
(39, 'data/promo/John Lewis Classic II Universal Steamer and Lid/John Lewis Classic II Universal Steamer and Lid 2 copy.png', 34, 0, 0, 0, 1, '2010-09-18 14:04:17', '2014-08-14 15:11:58'),
(40, 'data/promo/John Lewis Classic II Universal Steamer and Lid/John Lewis Classic II Universal Steamer and Lid 3 copy.png', 34, 0, 0, 0, 1, '2010-09-18 14:05:36', '2014-08-14 15:12:16'),
(41, 'data/promo/John Lewis Funky Napkin Holder/John Lewis Funky Napkin Holder 1 copy.png', 34, 0, 0, 0, 1, '2010-09-18 14:05:49', '2014-08-14 15:12:33'),
(42, 'data/promo/LG Refrigerator/LG Refrigerator - Floral collection T676 1.png', 34, 0, 0, 0, 1, '2010-09-18 14:06:34', '2014-08-14 15:12:48'),
(43, 'data/promo/Bugatti Uma Electronic Kitchen Scale and Timer/Bugatti Uma Electronic Kitchen Scale and Timer 1 copy.png', 34, 0, 0, 0, 1, '2010-09-18 14:06:49', '2014-08-14 15:00:32'),
(44, 'data/promo/Bugatti Uma Electronic Kitchen Scale and Timer/Bugatti Uma Electronic Kitchen Scale and Timer 2 copy.png', 34, 0, 0, 0, 1, '2010-09-21 15:39:21', '2014-08-14 15:00:50'),
(45, 'data/promo/Kalorik Meat Grinder MGR25959 Stainless Steel Blade/Kalorik Meat Grinder MGR25959 Stainless Steel Blade 1.png', 18, 0, 0, 0, 1, '2010-09-24 18:29:16', '2014-08-14 14:43:06'),
(46, 'data/promo/Coffee Machine Malongo Espresso-gold/Coffee Machine Malongo Espresso-gold 1.png', 18, 0, 0, 0, 1, '2010-09-24 18:29:31', '2014-08-14 14:42:35'),
(47, 'data/promo/Bugatti Uma Electronic Kitchen Scale and Timer/Bugatti Uma Electronic Kitchen Scale and Timer 3 copy.png', 34, 0, 0, 0, 1, '2010-11-07 11:13:16', '2014-08-14 15:01:08'),
(48, 'data/promo/Coffee Machine Bugatti Diva/Coffee Machine Bugatti Diva 1.png', 34, 0, 0, 0, 1, '2010-11-07 11:13:33', '2014-08-14 15:01:26'),
(49, 'data/promo/Coffee Machine Bugatti Diva/Coffee Machine Bugatti Diva 2.png', 34, 0, 0, 0, 1, '2010-11-07 11:14:04', '2014-08-14 15:01:43'),
(50, 'data/promo/Coffee Machine Bugatti Diva/Coffee Machine Bugatti Diva 3.png', 34, 0, 0, 0, 1, '2010-11-07 11:14:23', '2014-08-14 15:01:58'),
(51, 'data/promo/Coffee Machine Malongo Espresso-gold/Coffee Machine Malongo Espresso-gold 1.png', 34, 0, 0, 0, 1, '2010-11-07 11:14:38', '2014-08-14 15:02:17'),
(52, 'data/promo/Coffee Maker Bosch Assimo/Coffee Maker Bosch Assimo 2.png', 34, 0, 0, 0, 1, '2010-11-07 11:16:09', '2014-08-14 15:03:15'),
(53, 'data/promo/Coffee Maker Bosch Assimo/Coffee Maker Bosch Assimo 1.png', 34, 0, 0, 0, 1, '2010-11-07 11:28:53', '2014-08-14 15:02:36'),
(54, 'data/promo/Coffee Maker Bosch Assimo/Coffee Maker Bosch Assimo 3.png', 34, 0, 0, 0, 1, '2010-11-07 11:29:16', '2014-08-14 15:03:41'),
(55, 'data/promo/Hamilton Beach 72703 Ensemble 3 Cup Chopper/Hamilton Beach 72703 Ensemble 3 Cup Chopper 1.png', 34, 0, 0, 0, 1, '2010-11-08 10:31:32', '2014-08-14 15:04:07'),
(56, 'data/promo/Hood/Hood CDA EVCK4SS 40cm Cylinder 1.png', 34, 0, 0, 0, 1, '2010-11-08 10:31:50', '2014-08-14 15:04:30'),
(57, '', 20, 1, 1, 3, 1, '2011-04-26 08:53:16', '2014-08-27 18:37:50'),
(58, '', 52, 0, 0, 0, 1, '2011-05-08 13:44:16', '2011-05-08 13:44:16');

-- --------------------------------------------------------

--
-- Table structure for table `oc_category_description`
--

DROP TABLE IF EXISTS `oc_category_description`;
CREATE TABLE `oc_category_description` (
  `category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  `seo_title` varchar(255) NOT NULL, 
  `seo_h1` varchar(255) NOT NULL,
  PRIMARY KEY (`category_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_category_description`
--

INSERT INTO `oc_category_description` (`category_id`, `language_id`, `name`, `description`, `meta_description`, `meta_keyword`, `seo_title`, `seo_h1`) VALUES
(33, 1, 'Камеры', '', '', '', '', ''),
(29, 2, 'Mice and Trackballs', '', '', '', '', ''),
(27, 2, 'Mac', '', '', '', '', ''),
(26, 2, 'PC', '', '', '', '', ''),
(17, 1, 'Софт', '', '', '', '', ''),
(25, 1, 'Компоненты', '', '', '', '', ''),
(24, 2, 'PDAs', '', '', '', '', ''),
(20, 2, 'Desktops', '&lt;p&gt;Example of category description text&lt;/p&gt;\r\n', 'Example of category description', '', '', ''),
(35, 2, 'test 1', '', '', '', '', ''),
(36, 2, 'test 2', '', '', '', '', ''),
(37, 2, 'test 5', '', '', '', '', ''),
(38, 2, 'test 4', '', '', '', '', ''),
(39, 2, 'test 6', '', '', '', '', ''),
(40, 2, 'test 7', '', '', '', '', ''),
(41, 2, 'test 8', '', '', '', '', ''),
(42, 2, 'test 9', '', '', '', '', ''),
(43, 2, 'test 11', '', '', '', '', ''),
(34, 1, 'MP3 Плееры', '&lt;p&gt;\r\n	Shop Laptop feature only the best laptop deals on the market. By comparing laptop deals from the likes of PC World, Comet, Dixons, The Link and Carphone Warehouse, Shop Laptop has the most comprehensive selection of laptops on the internet. At Shop Laptop, we pride ourselves on offering customers the very best laptop deals. From refurbished laptops to netbooks, Shop Laptop ensures that every laptop - in every colour, style, size and technical spec - is featured on the site at the lowest possible price.&lt;/p&gt;\r\n', '', '', '', ''),
(18, 1, 'Ноутбуки', '&lt;p&gt;Shop Laptop feature only the best laptop deals on the market. By comparing laptop deals from the likes of PC World, Comet, Dixons, The Link and Carphone Warehouse, Shop Laptop has the most comprehensive selection of laptops on the internet. At Shop Laptop, we pride ourselves on offering customers the very best laptop deals. From refurbished laptops to netbooks, Shop Laptop ensures that every laptop - in every colour, style, size and technical spec - is featured on the site at the lowest possible price.&lt;/p&gt;\r\n', '', '', '', ''),
(44, 2, 'test 12', '', '', '', '', ''),
(45, 2, 'Windows', '', '', '', '', ''),
(46, 2, 'Macs', '', '', '', '', ''),
(47, 2, 'test 15', '', '', '', '', ''),
(48, 2, 'test 16', '', '', '', '', ''),
(49, 2, 'test 17', '', '', '', '', ''),
(50, 2, 'test 18', '', '', '', '', ''),
(51, 2, 'test 19', '', '', '', '', ''),
(52, 2, 'test 20', '', '', '', '', ''),
(53, 2, 'test 21', '', '', '', '', ''),
(54, 2, 'test 22', '', '', '', '', ''),
(55, 2, 'test 23', '', '', '', '', ''),
(56, 2, 'test 24', '', '', '', '', ''),
(58, 1, 'test 25', '', '', '', '', ''),
(28, 1, 'Мониторы', '', '', '', '', ''),
(33, 2, 'Cameras', '', '', '', '', ''),
(32, 1, 'Веб-камеры', '', '', '', '', ''),
(31, 1, 'Сканеры', '', '', '', '', ''),
(30, 1, 'Принтеры', '', '', '', '', ''),
(29, 1, 'Мышки', '', '', '', '', ''),
(27, 1, 'Mac', '', '', '', '', ''),
(26, 1, 'PC', '', '', '', '', ''),
(17, 2, 'Software', '', '', '', '', ''),
(25, 2, 'Components', '', '', '', '', ''),
(24, 1, 'PDA', '', '', '', '', ''),
(20, 1, 'Компьютеры', '&lt;p&gt;Пример текста в описания категории&lt;/p&gt;\r\n', 'Пример описания категории', '', '', ''),
(35, 1, 'test 1', '', '', '', '', ''),
(36, 1, 'test 2', '', '', '', '', ''),
(37, 1, 'test 5', '', '', '', '', ''),
(38, 1, 'test 4', '', '', '', '', ''),
(39, 1, 'test 6', '', '', '', '', ''),
(40, 1, 'test 7', '', '', '', '', ''),
(41, 1, 'test 8', '', '', '', '', ''),
(42, 1, 'test 9', '', '', '', '', ''),
(43, 1, 'test 11', '', '', '', '', ''),
(34, 2, 'MP3 Players', '&lt;p&gt;\r\n	Shop Laptop feature only the best laptop deals on the market. By comparing laptop deals from the likes of PC World, Comet, Dixons, The Link and Carphone Warehouse, Shop Laptop has the most comprehensive selection of laptops on the internet. At Shop Laptop, we pride ourselves on offering customers the very best laptop deals. From refurbished laptops to netbooks, Shop Laptop ensures that every laptop - in every colour, style, size and technical spec - is featured on the site at the lowest possible price.&lt;/p&gt;\r\n', '', '', '', ''),
(18, 2, 'Laptops', '&lt;p&gt;Shop Laptop feature only the best laptop deals on the market. By comparing laptop deals from the likes of PC World, Comet, Dixons, The Link and Carphone Warehouse, Shop Laptop has the most comprehensive selection of laptops on the internet. At Shop Laptop, we pride ourselves on offering customers the very best laptop deals. From refurbished laptops to netbooks, Shop Laptop ensures that every laptop - in every colour, style, size and technical spec - is featured on the site at the lowest possible price.&lt;/p&gt;\r\n', '', '', '', ''),
(44, 1, 'test 12', '', '', '', '', ''),
(45, 1, 'Windows', '', '', '', '', ''),
(46, 1, 'Macs', '', '', '', '', ''),
(47, 1, 'test 15', '', '', '', '', ''),
(48, 1, 'test 16', '', '', '', '', ''),
(49, 1, 'test 17', '', '', '', '', ''),
(50, 1, 'test 18', '', '', '', '', ''),
(51, 1, 'test 19', '', '', '', '', ''),
(52, 1, 'test 20', '', '', '', '', ''),
(53, 1, 'test 21', '', '', '', '', ''),
(54, 1, 'test 22', '', '', '', '', ''),
(55, 1, 'test 23', '', '', '', '', ''),
(56, 1, 'test 24', '', '', '', '', ''),
(57, 1, 'Планшеты', '', '', '', '', ''),
(58, 2, 'test 25', '', '', '', '', ''),
(32, 2, 'Web Cameras', '', '', '', '', ''),
(28, 2, 'Monitors', '', '', '', '', ''),
(30, 2, 'Printers', '', '', '', '', ''),
(31, 2, 'Scanners', '', '', '', '', ''),
(57, 2, 'Tablets', '', '', '', '', '');

-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_category_path`;
CREATE TABLE `oc_category_path` (
  `category_id` int(11) NOT NULL,
  `path_id` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`path_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_category_path`
--

INSERT INTO `oc_category_path` (`category_id`, `path_id`, `level`) VALUES
(25, 25, 0),
(28, 25, 0),
(28, 28, 1),
(35, 28, 1),
(35, 25, 0),
(35, 35, 2),
(36, 28, 1),
(36, 25, 0),
(36, 36, 2),
(29, 25, 0),
(29, 29, 1),
(30, 25, 0),
(30, 30, 1),
(31, 25, 0),
(31, 31, 1),
(32, 25, 0),
(32, 32, 1),
(20, 20, 0),
(27, 20, 0),
(27, 27, 1),
(26, 20, 0),
(26, 26, 1),
(24, 24, 0),
(18, 18, 1),
(45, 18, 1),
(45, 45, 2),
(46, 18, 1),
(46, 46, 2),
(17, 17, 1),
(33, 33, 0),
(34, 34, 0),
(37, 34, 0),
(37, 37, 1),
(38, 34, 0),
(38, 38, 1),
(39, 34, 0),
(39, 39, 1),
(40, 34, 0),
(40, 40, 1),
(41, 34, 0),
(41, 41, 1),
(42, 34, 0),
(42, 42, 1),
(43, 34, 0),
(43, 43, 1),
(44, 34, 0),
(44, 44, 1),
(47, 34, 0),
(47, 47, 1),
(48, 34, 0),
(48, 48, 1),
(49, 34, 0),
(49, 49, 1),
(50, 34, 0),
(50, 50, 1),
(51, 34, 0),
(51, 51, 1),
(52, 34, 0),
(52, 52, 1),
(58, 34, 0),
(58, 52, 1),
(58, 58, 2),
(53, 34, 0),
(53, 53, 1),
(54, 34, 0),
(54, 54, 1),
(55, 34, 0),
(55, 55, 1),
(56, 34, 0),
(56, 56, 1),
(57, 57, 1),
(18, 20, 0),
(45, 20, 0),
(46, 20, 0),
(17, 20, 0),
(57, 20, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_category_filter`
--

DROP TABLE IF EXISTS `oc_category_filter`;
CREATE TABLE `oc_category_filter` (
  `category_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_category_filter`
--

-- --------------------------------------------------------

--
-- Table structure for table `oc_category_option`
--

DROP TABLE IF EXISTS `oc_category_option`;
CREATE TABLE `oc_category_option` (
  `option_id` int(10) NOT NULL AUTO_INCREMENT,
  `status` int(1) DEFAULT '0',
  `sort_order` int(10) DEFAULT '0',
  PRIMARY KEY (`option_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=5 ;

--
-- Dumping data for table `oc_category_option`
--

INSERT INTO `oc_category_option` (`option_id`, `status`, `sort_order`) VALUES
(1, 1, 2),
(2, 1, 1),
(3, 1, 0),
(4, 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `oc_category_option_description`
--

DROP TABLE IF EXISTS `oc_category_option_description`;
CREATE TABLE `oc_category_option_description` (
  `option_id` int(10) NOT NULL,
  `language_id` int(10) NOT NULL,
  `name` varchar(127) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`option_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `oc_category_option_description`
--

INSERT INTO `oc_category_option_description` (`option_id`, `language_id`, `name`) VALUES
(1, 1, 'Размер'),
(1, 2, 'Size'),
(2, 1, 'Производители'),
(2, 2, 'Manufactured'),
(3, 1, 'Цена'),
(3, 2, 'Price'),
(4, 1, 'Экран'),
(4, 2, 'Экран');

-- --------------------------------------------------------

--
-- Table structure for table `oc_category_to_layout`
--

DROP TABLE IF EXISTS `oc_category_to_layout`;
CREATE TABLE `oc_category_to_layout` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_category_to_layout`
--

-- --------------------------------------------------------

--
-- Table structure for table `oc_category_to_store`
--

DROP TABLE IF EXISTS `oc_category_to_store`;
CREATE TABLE `oc_category_to_store` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_category_to_store`
--

INSERT INTO `oc_category_to_store` (`category_id`, `store_id`) VALUES
(17, 0),
(18, 0),
(20, 0),
(24, 0),
(25, 0),
(26, 0),
(27, 0),
(28, 0),
(29, 0),
(30, 0),
(31, 0),
(32, 0),
(33, 0),
(34, 0),
(35, 0),
(36, 0),
(37, 0),
(38, 0),
(39, 0),
(40, 0),
(41, 0),
(42, 0),
(43, 0),
(44, 0),
(45, 0),
(46, 0),
(47, 0),
(48, 0),
(49, 0),
(50, 0),
(51, 0),
(52, 0),
(53, 0),
(54, 0),
(55, 0),
(56, 0),
(57, 0),
(58, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_coolfilter_group`
--

DROP TABLE IF EXISTS `oc_coolfilter_group`;
CREATE TABLE `oc_coolfilter_group` (
  `coolfilter_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`coolfilter_group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=2 ;

--
-- Dumping data for table `oc_coolfilter_group`
--

INSERT INTO `oc_coolfilter_group` (`coolfilter_group_id`, `sort_order`) VALUES
(1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_coolfilter_group_description`
--

DROP TABLE IF EXISTS `oc_coolfilter_group_description`;
CREATE TABLE `oc_coolfilter_group_description` (
  `coolfilter_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`coolfilter_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `oc_coolfilter_group_description`
--

INSERT INTO `oc_coolfilter_group_description` (`coolfilter_group_id`, `language_id`, `name`) VALUES
(1, 1, 'Первая'),
(1, 2, 'Первая');

-- --------------------------------------------------------

--
-- Table structure for table `oc_coolfilter_group_option_to_coolfilter_group`
--

DROP TABLE IF EXISTS `oc_coolfilter_group_option_to_coolfilter_group`;
CREATE TABLE `oc_coolfilter_group_option_to_coolfilter_group` (
  `option_id` int(11) NOT NULL,
  `coolfilter_group_id` int(11) NOT NULL,
  PRIMARY KEY (`coolfilter_group_id`,`option_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `oc_coolfilter_group_option_to_coolfilter_group`
--

INSERT INTO `oc_coolfilter_group_option_to_coolfilter_group` (`option_id`, `coolfilter_group_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_coolfilter_group_to_category`
--

DROP TABLE IF EXISTS `oc_coolfilter_group_to_category`;
CREATE TABLE `oc_coolfilter_group_to_category` (
  `coolfilter_group_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`coolfilter_group_id`,`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `oc_coolfilter_group_to_category`
--

INSERT INTO `oc_coolfilter_group_to_category` (`coolfilter_group_id`, `category_id`) VALUES
(1, 17),
(1, 18),
(1, 20),
(1, 24),
(1, 25),
(1, 26),
(1, 27),
(1, 28),
(1, 29),
(1, 30),
(1, 31),
(1, 32),
(1, 33),
(1, 34),
(1, 35),
(1, 36),
(1, 37),
(1, 38),
(1, 39),
(1, 40),
(1, 41),
(1, 42),
(1, 43),
(1, 44),
(1, 45),
(1, 46),
(1, 47),
(1, 48),
(1, 49),
(1, 50),
(1, 51),
(1, 52),
(1, 53),
(1, 54),
(1, 55),
(1, 56),
(1, 57),
(1, 58);

-- --------------------------------------------------------

--
-- Table structure for table `oc_type_option`
--

DROP TABLE IF EXISTS `oc_type_option`;
CREATE TABLE `oc_type_option` (
  `option_id` int(11) NOT NULL,
  `type_index` varchar(250) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`type_index`,`option_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `oc_type_option`
--

INSERT INTO `oc_type_option` (`option_id`, `type_index`) VALUES
(2, 'manufacter'),
(1, 'option_11'),
(4, 'parametere_1'),
(3, 'price');

-- --------------------------------------------------------

--
-- Table structure for table `oc_style_option`
--

DROP TABLE IF EXISTS `oc_style_option`;
CREATE TABLE `oc_style_option` (
  `option_id` int(11) NOT NULL,
  `style_id` varchar(250) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`style_id`,`option_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `oc_style_option`
--

INSERT INTO `oc_style_option` (`option_id`, `style_id`) VALUES
(1, 'checkbox'),
(2, 'checkbox'),
(4, 'checkbox'),
(3, 'slider');

-- --------------------------------------------------------



--
-- Table structure for table `oc_country`
--

DROP TABLE IF EXISTS `oc_country`;
CREATE TABLE `oc_country` (
  `country_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `iso_code_2` varchar(2) NOT NULL,
  `iso_code_3` varchar(3) NOT NULL,
  `address_format` text NOT NULL,
  `postcode_required` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`country_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_country`
--

INSERT INTO `oc_country` (`country_id`, `name`, `iso_code_2`, `iso_code_3`, `address_format`, `postcode_required`, `status`) VALUES
(11, 'Армения', 'AM', 'ARM', '', 0, 1),
(15, 'Азербайджан', 'AZ', 'AZE', '', 0, 1),
(20, 'Белоруссия (Беларусь)', 'BY', 'BLR', '', 0, 1),
(80, 'Грузия', 'GE', 'GEO', '', 0, 1),
(109, 'Казахстан', 'KZ', 'KAZ', '', 0, 1),
(115, 'Киргизия (Кыргызстан)', 'KG', 'KGZ', '', 0, 1),
(140, 'Молдова', 'MD', 'MDA', '', 0, 1),
(176, 'Российская Федерация', 'RU', 'RUS', '', 0, 1),
(207, 'Таджикистан', 'TJ', 'TJK', '', 0, 1),
(216, 'Туркменистан', 'TM', 'TKM', '', 0, 1),
(220, 'Украина', 'UA', 'UKR', '', 0, 1),
(226, 'Узбекистан', 'UZ', 'UZB', '', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_coupon`
--

DROP TABLE IF EXISTS `oc_coupon`;
CREATE TABLE `oc_coupon` (
  `coupon_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `code` varchar(10) NOT NULL,
  `type` char(1) NOT NULL,
  `discount` decimal(15,4) NOT NULL,
  `logged` tinyint(1) NOT NULL,
  `shipping` tinyint(1) NOT NULL,
  `total` decimal(15,4) NOT NULL,
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  `uses_total` int(11) NOT NULL,
  `uses_customer` varchar(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`coupon_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_coupon`
--

INSERT INTO `oc_coupon` (`coupon_id`, `name`, `code`, `type`, `discount`, `logged`, `shipping`, `total`, `date_start`, `date_end`, `uses_total`, `uses_customer`, `status`, `date_added`) VALUES
(4, '-10% скидка', '2222', 'P', 10.0000, 0, 0, 0.0000, '2011-01-01', '2012-01-01', 10, '10', 1, '2009-01-27 13:55:03'),
(5, 'Бесплатная доставка', '3333', 'P', 0.0000, 0, 1, 100.0000, '2009-03-01', '2009-08-31', 10, '10', 1, '2009-03-14 21:13:53'),
(6, '-10.00 скидка', '1111', 'F', 10.0000, 0, 0, 10.0000, '1970-11-01', '2020-11-01', 100000, '10000', 1, '2009-03-14 21:15:18');

-- --------------------------------------------------------

--
-- Table structure for table `oc_coupon_category`
--

DROP TABLE IF EXISTS `oc_coupon_category`;
CREATE TABLE `oc_coupon_category` (
  `coupon_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`coupon_id`,`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_coupon_history`
--

-- --------------------------------------------------------

--
-- Table structure for table `oc_coupon_history`
--

DROP TABLE IF EXISTS `oc_coupon_history`;
CREATE TABLE `oc_coupon_history` (
  `coupon_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`coupon_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_coupon_history`
--

-- --------------------------------------------------------

--
-- Table structure for table `oc_coupon_product`
--

DROP TABLE IF EXISTS `oc_coupon_product`;
CREATE TABLE `oc_coupon_product` (
  `coupon_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`coupon_product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_coupon_product`
--

-- --------------------------------------------------------

--
-- Table structure for table `oc_currency`
--

DROP TABLE IF EXISTS `oc_currency`;
CREATE TABLE `oc_currency` (
  `currency_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `code` varchar(3) NOT NULL,
  `symbol_left` varchar(12) NOT NULL,
  `symbol_right` varchar(12) NOT NULL,
  `decimal_place` char(1) NOT NULL,
  `value` float(15,8) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`currency_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_currency`
--

INSERT INTO `oc_currency` (`currency_id`, `title`, `code`, `symbol_left`, `symbol_right`, `decimal_place`, `value`, `status`, `date_modified`) VALUES
(1, 'Рубль', 'RUB', '', ' р.', '2', 35.37199974, 1, '2012-03-31 17:33:53'),
(2, 'Гривна', 'UAH', '', ' грн.', '2', 9.37199974, 1, '2012-03-31 17:33:53'),
(3, 'US Dollar', 'USD', '$', '', '2', 1.00000000, 1, '2012-03-31 17:33:53'),
(4, 'Euro', 'EUR', '', '€', '2', 0.74959999, 1, '2012-03-31 17:33:53');

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer`
--

DROP TABLE IF EXISTS `oc_customer`;
CREATE TABLE `oc_customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `cart` text,
  `wishlist` text,
  `newsletter` tinyint(1) NOT NULL DEFAULT '0',
  `address_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `token` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`customer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_customer`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer_field`
--

DROP TABLE IF EXISTS `oc_customer_field`;
CREATE TABLE `oc_customer_field` (
  `customer_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `custom_field_value_id` int(11) NOT NULL,
  `name` int(128) NOT NULL,
  `value` text NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`customer_id`,`custom_field_id`,`custom_field_value_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_customer_field`
--

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_group`
--

DROP TABLE IF EXISTS `oc_customer_group`;
CREATE TABLE `oc_customer_group` (
  `customer_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `approval` int(1) NOT NULL,
  `company_id_display` int(1) NOT NULL,
  `company_id_required` int(1) NOT NULL,
  `tax_id_display` int(1) NOT NULL,
  `tax_id_required` int(1) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_customer_group`
--

INSERT INTO `oc_customer_group` (`customer_group_id`, `approval`, `company_id_display`, `company_id_required`, `tax_id_display`, `tax_id_required`, `sort_order`) VALUES
(1, 0, 1, 0, 0, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_group_description`
--

DROP TABLE IF EXISTS `oc_customer_group_description`;
CREATE TABLE `oc_customer_group_description` (
  `customer_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`customer_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_customer_group_description`
--

INSERT INTO `oc_customer_group_description` (`customer_group_id`, `language_id`, `name`, `description`) VALUES
(1, 1, 'Default', 'test');

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_history`
--

DROP TABLE IF EXISTS `oc_customer_history`;
CREATE TABLE `oc_customer_history` (
  `customer_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_customer_history`
--

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_ip`
--

DROP TABLE IF EXISTS `oc_customer_ip`;
CREATE TABLE `oc_customer_ip` (
  `customer_ip_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_ip_id`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_customer_ip`
--

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_ban_ip`
--

DROP TABLE IF EXISTS `oc_customer_ban_ip`;
CREATE TABLE `oc_customer_ban_ip` (
  `customer_ban_ip_id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(40) NOT NULL,
  PRIMARY KEY (`customer_ban_ip_id`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_online`
--

DROP TABLE IF EXISTS `oc_customer_online`;
CREATE TABLE `oc_customer_online` (
  `ip` varchar(40) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `url` text NOT NULL,
  `referer` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_reward`
--

DROP TABLE IF EXISTS `oc_customer_reward`;
CREATE TABLE `oc_customer_reward` (
  `customer_reward_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `points` int(8) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`customer_reward_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_customer_reward`
--

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_transaction`
--

DROP TABLE IF EXISTS `oc_customer_transaction`;
CREATE TABLE `oc_customer_transaction` (
  `customer_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_customer_transaction`
--

-- --------------------------------------------------------

--
-- Table structure for table `oc_custom_field`
--

DROP TABLE IF EXISTS `oc_custom_field`;
CREATE TABLE `oc_custom_field` (
  `custom_field_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `value` text NOT NULL,
  `required` tinyint(1) NOT NULL,
  `location` varchar(32) NOT NULL,
  `position` int(3) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`custom_field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_custom_field`
--

-- --------------------------------------------------------

--
-- Table structure for table `oc_custom_field_description`
--

DROP TABLE IF EXISTS `oc_custom_field_description`;
CREATE TABLE `oc_custom_field_description` (
  `custom_field_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`custom_field_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_custom_field_description`
--

-- --------------------------------------------------------

--
-- Table structure for table `oc_custom_field_to_customer_group`
--

DROP TABLE IF EXISTS `oc_custom_field_to_customer_group`;
CREATE TABLE `oc_custom_field_to_customer_group` (
  `custom_field_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  PRIMARY KEY (`custom_field_id`,`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_custom_field_to_customer_group`
--

-- --------------------------------------------------------

--
-- Table structure for table `oc_custom_field_value`
--

DROP TABLE IF EXISTS `oc_custom_field_value`;
CREATE TABLE `oc_custom_field_value` (
  `custom_field_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `custom_field_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`custom_field_value_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_custom_field_value`
--

-- --------------------------------------------------------

--
-- Table structure for table `oc_custom_field_value_description`
--

DROP TABLE IF EXISTS `oc_custom_field_value_description`;
CREATE TABLE `oc_custom_field_value_description` (
  `custom_field_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`custom_field_value_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_custom_field_value_description`
--

-- --------------------------------------------------------

--
-- Table structure for table `oc_download`
--

DROP TABLE IF EXISTS `oc_download`;
CREATE TABLE `oc_download` (
  `download_id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(128) NOT NULL,
  `mask` varchar(128) NOT NULL,
  `remaining` int(11) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`download_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_download`
--

-- --------------------------------------------------------

--
-- Table structure for table `oc_download_description`
--

DROP TABLE IF EXISTS `oc_download_description`;
CREATE TABLE `oc_download_description` (
  `download_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`download_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_download_description`
--

-- --------------------------------------------------------

--
-- Table structure for table `oc_filter_group`
--

DROP TABLE IF EXISTS `oc_filter_group`;
CREATE TABLE `oc_filter_group` (
  `filter_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`filter_group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `oc_filter_group`
--

INSERT INTO `oc_filter_group` (`filter_group_id`, `sort_order`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_filter_group_description`
--

DROP TABLE IF EXISTS `oc_filter_group_description`;
CREATE TABLE `oc_filter_group_description` (
  `filter_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`filter_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_filter_group_description`
--

INSERT INTO `oc_filter_group_description` (`filter_group_id`, `language_id`, `name`) VALUES
(1, 1, 'Экран'),
(1, 2, 'Экран');

-- --------------------------------------------------------

--
-- Table structure for table `oc_filter`
--

DROP TABLE IF EXISTS `oc_filter`;
CREATE TABLE `oc_filter` (
  `filter_id` int(11) NOT NULL AUTO_INCREMENT,
  `filter_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`filter_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `oc_filter`
--

INSERT INTO `oc_filter` (`filter_id`, `filter_group_id`, `sort_order`) VALUES
(1, 1, 0),
(2, 1, 1),
(3, 1, 2),
(4, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `oc_filter_description`
--

DROP TABLE IF EXISTS `oc_filter_description`;
CREATE TABLE `oc_filter_description` (
  `filter_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `filter_group_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`filter_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_filter_description`
--

INSERT INTO `oc_filter_description` (`filter_id`, `language_id`, `filter_group_id`, `name`) VALUES
(1, 1, 1, '15'),
(1, 2, 1, '15'),
(2, 1, 1, '17'),
(2, 2, 1, '17'),
(3, 1, 1, '19'),
(3, 2, 1, '19'),
(4, 1, 1, '22'),
(4, 2, 1, '22');

-- --------------------------------------------------------

--
-- Table structure for table `oc_extension`
--

DROP TABLE IF EXISTS `oc_extension`;
CREATE TABLE `oc_extension` (
  `extension_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `code` varchar(32) NOT NULL,
  PRIMARY KEY (`extension_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_extension`
--

INSERT INTO `oc_extension` (`extension_id`, `type`, `code`) VALUES
(23, 'payment', 'cod'),
(22, 'total', 'shipping'),
(57, 'total', 'sub_total'),
(58, 'total', 'tax'),
(59, 'total', 'total'),
(468, 'module', 'latest'),
(390, 'total', 'credit'),
(387, 'shipping', 'flat'),
(349, 'total', 'handling'),
(350, 'total', 'low_order_fee'),
(389, 'total', 'coupon'),
(445, 'module', 'filter'),
(464, 'module', 'account'),
(393, 'total', 'reward'),
(398, 'total', 'voucher'),
(407, 'payment', 'free_checkout'),
(444, 'module', 'featured'),
(440, 'module', 'banner'),
(467, 'module', 'information'),
(465, 'module', 'affiliate'),
(466, 'module', 'bestseller'),
(456, 'module', 'newcarousel'),
(449, 'module', 'special'),
(481, 'shipping', 'free'),
(486, 'module', 'compare'),
(487, 'module', 'vqmod_manager'),
(488, 'module', 'coolfilter'),
(489, 'module', 'category'),
(490, 'module', 'viewed'),
(491, 'module', 'reviews'),
(492, 'module', 'product_tab'),
(493, 'module', 'carousel'),
(494, 'module', 'blog_category'),
(495, 'module', 'blog_latest'),
(496, 'module', 'blog_mostviewed'),
(497, 'module', 'blog_featured'),
(498, 'module', 'blog_reviews'),
(499, 'module', 'featuredarticle'),
(500, 'module', 'featuredwb');

-- --------------------------------------------------------

--
-- Table structure for table `oc_geo_zone`
--

DROP TABLE IF EXISTS `oc_geo_zone`;
CREATE TABLE `oc_geo_zone` (
  `geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`geo_zone_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_geo_zone`
--

INSERT INTO `oc_geo_zone` (`geo_zone_id`, `name`, `description`, `date_modified`, `date_added`) VALUES
(3, 'НДС', 'Облагаемые НДС', '2010-02-26 22:33:24', '2009-01-06 23:26:25');

-- --------------------------------------------------------

--
-- Table structure for table `oc_information`
--

DROP TABLE IF EXISTS `oc_information`;
CREATE TABLE `oc_information` (
  `information_id` int(11) NOT NULL AUTO_INCREMENT,
  `bottom` int(1) NOT NULL DEFAULT '0',
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`information_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_information`
--

INSERT INTO `oc_information` (`information_id`, `bottom`, `sort_order`, `status`) VALUES
(3, 1, 3, 1),
(4, 1, 1, 1),
(5, 1, 4, 1),
(6, 1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_information_description`
--

DROP TABLE IF EXISTS `oc_information_description`;
CREATE TABLE `oc_information_description` (
  `information_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `description` text NOT NULL,
  `meta_description` varchar(255) NOT NULL, 
  `meta_keyword` varchar(255) NOT NULL, 
  `seo_title` varchar(255) NOT NULL, 
  `seo_h1` varchar(255) NOT NULL,
  PRIMARY KEY  (`information_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- 
-- Dumping data for table `oc_information_description`
-- 

INSERT INTO `oc_information_description` (`information_id`, `language_id`, `title`, `description`, `meta_description`, `meta_keyword`, `seo_title`, `seo_h1`) VALUES
(4, 1, 'О нас', '&lt;p&gt;\r\n	О нас&lt;/p&gt;\r\n', '', '', '', ''),
(5, 1, 'Условия соглашения', '&lt;p&gt;\r\n	Условия соглашения&lt;/p&gt;\r\n', '', '', '', ''),
(3, 1, 'Политика Безопасности', '&lt;p&gt;\r\n	Политика Безопасности&lt;/p&gt;\r\n', '', '', '', ''),
(6, 1, 'Информация о доставке', '&lt;p&gt;\r\n	Информация о доставке&lt;/p&gt;\r\n', '', '', '', ''),
(4, 2, 'About Us', '&lt;p&gt;\r\n	About Us&lt;/p&gt;\r\n', '', '', '', ''),
(5, 2, 'Terms &amp; Conditions', '&lt;p&gt;\r\n	Terms &amp;amp; Conditions&lt;/p&gt;\r\n', '', '', '', ''),
(3, 2, 'Privacy Policy', '&lt;p&gt;\r\n	Privacy Policy&lt;/p&gt;\r\n', '', '', '', ''),
(6, 2, 'Delivery Information', '&lt;p&gt;\r\n	Delivery Information&lt;/p&gt;\r\n', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `oc_information_to_layout`
--

DROP TABLE IF EXISTS `oc_information_to_layout`;
CREATE TABLE `oc_information_to_layout` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`information_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_information_to_layout`
--


-- --------------------------------------------------------

--
-- Table structure for table `oc_information_to_store`
--

DROP TABLE IF EXISTS `oc_information_to_store`;
CREATE TABLE `oc_information_to_store` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`information_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_information_to_store`
--

INSERT INTO `oc_information_to_store` (`information_id`, `store_id`) VALUES
(3, 0),
(4, 0),
(5, 0),
(6, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_language`
--

DROP TABLE IF EXISTS `oc_language`;
CREATE TABLE `oc_language` (
  `language_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `code` varchar(5) NOT NULL,
  `locale` varchar(255) NOT NULL,
  `image` varchar(64) NOT NULL,
  `directory` varchar(32) NOT NULL,
  `filename` varchar(64) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_language`
--

INSERT INTO `oc_language` (`language_id`, `name`, `code`, `locale`, `image`, `directory`, `filename`, `sort_order`, `status`) VALUES
(1, 'Russian', 'ru', 'ru_RU.UTF-8,ru_RU,russian', 'ru.png', 'russian', 'russian', 1, 1),
(2, 'English', 'en', 'en_US.UTF-8,en_US,en-gb,english', 'gb.png', 'english', 'english', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_layout`
--

DROP TABLE IF EXISTS `oc_layout`;
CREATE TABLE `oc_layout` (
  `layout_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`layout_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_layout`
--

INSERT INTO `oc_layout` (`layout_id`, `name`) VALUES
(1, 'Главная'),
(2, 'Продукт'),
(3, 'Категория'),
(4, 'По-умолчанию'),
(5, 'Производитель'),
(6, 'Аккаунт'),
(7, 'Оформление заказ'),
(8, 'Контакты'),
(9, 'Карта сайта'),
(10, 'Партнерская программа'),
(11, 'Информация'),
(12, 'Блог'),
(13, 'Категории Блога'),
(14, 'Статьи Блога'),
(15, 'Новинки'),
(16, 'Акции');

-- --------------------------------------------------------

--
-- Table structure for table `oc_layout_route`
--

DROP TABLE IF EXISTS `oc_layout_route`;
CREATE TABLE `oc_layout_route` (
  `layout_route_id` int(11) NOT NULL AUTO_INCREMENT,
  `layout_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `route` varchar(255) NOT NULL,
  PRIMARY KEY (`layout_route_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_layout_route`
--

INSERT INTO `oc_layout_route` (`layout_route_id`, `layout_id`, `store_id`, `route`) VALUES
(30, 6, 0, 'account'),
(17, 10, 0, 'affiliate/'),
(29, 3, 0, 'product/category'),
(26, 1, 0, 'common/home'),
(20, 2, 0, 'product/product'),
(24, 11, 0, 'information/information'),
(22, 5, 0, 'product/manufacturer'),
(23, 7, 0, 'checkout/'),
(31, 8, 0, 'information/contact'),
(32, 9, 0, 'information/sitemap'),
(33, 12, 0, 'blog/latest'),
(34, 13, 0, 'blog/news'),
(35, 14, 0, 'blog/article'),
(36, 15, 0, 'product/latest'),
(37, 16, 0, 'product/special');

-- --------------------------------------------------------

--
-- Table structure for table `oc_length_class`
--

DROP TABLE IF EXISTS `oc_length_class`;
CREATE TABLE `oc_length_class` (
  `length_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `value` decimal(15,8) NOT NULL,
  PRIMARY KEY (`length_class_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_length_class`
--

INSERT INTO `oc_length_class` (`length_class_id`, `value`) VALUES
(1, '1.00000000'),
(2, '10.00000000'),
(3, '0.39370000');

-- --------------------------------------------------------

--
-- Table structure for table `oc_length_class_description`
--

DROP TABLE IF EXISTS `oc_length_class_description`;
CREATE TABLE `oc_length_class_description` (
  `length_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL,
  PRIMARY KEY (`length_class_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_length_class_description`
--

INSERT INTO `oc_length_class_description` (`length_class_id`, `language_id`, `title`, `unit`) VALUES
(1, 1, 'Сантиметр', 'см'),
(2, 1, 'Миллиметр', 'мм'),
(3, 1, 'Дюйм', 'in'),
(1, 2, 'Centimeter', 'cm'),
(2, 2, 'Millimeter', 'mm'),
(3, 2, 'Inch', 'in');

-- --------------------------------------------------------

--
-- Table structure for table `oc_manufacturer`
--

DROP TABLE IF EXISTS `oc_manufacturer`;
CREATE TABLE `oc_manufacturer` (
  `manufacturer_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`manufacturer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_manufacturer`
--

INSERT INTO `oc_manufacturer` (`manufacturer_id`, `name`, `image`, `sort_order`) VALUES
(5, 'HTC', 'data/demo/htc_logo.jpg', 0),
(6, 'Palm', 'data/demo/palm_logo.jpg', 0),
(7, 'Hewlett-Packard', 'data/demo/hp_logo.jpg', 0),
(8, 'Apple', 'data/demo/apple_logo.jpg', 0),
(9, 'Canon', 'data/demo/canon_logo.jpg', 0),
(10, 'Sony', 'data/demo/sony_logo.jpg', 0);

-- --------------------------------------------------------

-- 
-- Table structure for table `oc_manufacturer_description`
-- 

DROP TABLE IF EXISTS `oc_manufacturer_description`;
CREATE TABLE `oc_manufacturer_description` (
  `manufacturer_id` int(11) NOT NULL default '0',
  `language_id` int(11) NOT NULL default '0',
  `description` text NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  `seo_title` varchar(255) NOT NULL,
  `seo_h1` varchar(255) NOT NULL,
  PRIMARY KEY  (`manufacturer_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `oc_manufacturer_description`
-- 

INSERT INTO `oc_manufacturer_description` (`manufacturer_id`, `language_id`, `description`, `meta_description`, `meta_keyword`, `seo_title`, `seo_h1`) VALUES
(5, 1, '', '', '', '', ''),
(6, 1, '', '', '', '', ''),
(7, 1, '', '', '', '', ''),
(8, 1, '', '', '', '', ''),
(9, 1, '', '', '', '', ''),
(10, 1, '', '', '', '', ''),
(5, 2, '', '', '', '', ''),
(6, 2, '', '', '', '', ''),
(7, 2, '', '', '', '', ''),
(8, 2, '', '', '', '', ''),
(9, 2, '', '', '', '', ''),
(10, 2, '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `oc_manufacturer_to_layout`
--

DROP TABLE IF EXISTS `oc_manufacturer_to_layout`;
CREATE TABLE `oc_manufacturer_to_layout` (
  `manufacturer_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`manufacturer_id`,`store_id`),
  KEY `cae9af8f5afbde96d0404991762c91ea` (`layout_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_manufacturer_to_layout`
--

-- --------------------------------------------------------

--
-- Table structure for table `oc_manufacturer_to_store`
--

DROP TABLE IF EXISTS `oc_manufacturer_to_store`;
CREATE TABLE `oc_manufacturer_to_store` (
  `manufacturer_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`manufacturer_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_manufacturer_to_store`
--

INSERT INTO `oc_manufacturer_to_store` (`manufacturer_id`, `store_id`) VALUES
(5, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_option`
--

DROP TABLE IF EXISTS `oc_option`;
CREATE TABLE `oc_option` (
  `option_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`option_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_option`
--

INSERT INTO `oc_option` (`option_id`, `type`, `sort_order`) VALUES
(1, 'radio', 2),
(2, 'checkbox', 3),
(4, 'text', 4),
(5, 'select', 1),
(6, 'textarea', 5),
(7, 'file', 6),
(8, 'date', 7),
(9, 'time', 8),
(10, 'datetime', 9),
(11, 'select', 1),
(12, 'date', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_option_description`
--

DROP TABLE IF EXISTS `oc_option_description`;
CREATE TABLE `oc_option_description` (
  `option_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`option_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_option_description`
--

INSERT INTO `oc_option_description` (`option_id`, `language_id`, `name`) VALUES
(1, 1, 'Radio'),
(2, 1, 'Checkbox'),
(4, 1, 'Text'),
(6, 1, 'Textarea'),
(8, 1, 'Date'),
(7, 1, 'File'),
(5, 1, 'Select'),
(9, 1, 'Time'),
(10, 1, 'Date &amp; Time'),
(12, 1, 'Delivery Date'),
(11, 1, 'Size'),
(1, 2, 'Radio'),
(2, 2, 'Checkbox'),
(4, 2, 'Text'),
(6, 2, 'Textarea'),
(8, 2, 'Date'),
(7, 2, 'File'),
(5, 2, 'Select'),
(9, 2, 'Time'),
(10, 2, 'Date &amp; Time'),
(12, 2, 'Delivery Date'),
(11, 2, 'Size');

-- --------------------------------------------------------

--
-- Table structure for table `oc_option_value`
--

DROP TABLE IF EXISTS `oc_option_value`;
CREATE TABLE `oc_option_value` (
  `option_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `option_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`option_value_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_option_value`
--

INSERT INTO `oc_option_value` (`option_value_id`, `option_id`, `sort_order`) VALUES
(43, 1, 3),
(32, 1, 1),
(45, 2, 4),
(44, 2, 3),
(42, 5, 4),
(41, 5, 3),
(39, 5, 1),
(40, 5, 2),
(31, 1, 2),
(23, 2, 1),
(24, 2, 2),
(46, 11, 1),
(47, 11, 2),
(48, 11, 3);

-- --------------------------------------------------------

--
-- Table structure for table `oc_option_value_description`
--

DROP TABLE IF EXISTS `oc_option_value_description`;
CREATE TABLE `oc_option_value_description` (
  `option_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`option_value_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_option_value_description`
--

INSERT INTO `oc_option_value_description` (`option_value_id`, `language_id`, `option_id`, `name`) VALUES
(43, 1, 1, 'Large'),
(32, 1, 1, 'Small'),
(45, 1, 2, 'Checkbox 4'),
(44, 1, 2, 'Checkbox 3'),
(31, 1, 1, 'Medium'),
(42, 1, 5, 'Yellow'),
(41, 1, 5, 'Green'),
(39, 1, 5, 'Red'),
(40, 1, 5, 'Blue'),
(23, 1, 2, 'Checkbox 1'),
(24, 1, 2, 'Checkbox 2'),
(48, 1, 11, 'Large'),
(47, 1, 11, 'Medium'),
(46, 1, 11, 'Small'),
(43, 2, 1, 'Large'),
(32, 2, 1, 'Small'),
(45, 2, 2, 'Checkbox 4'),
(44, 2, 2, 'Checkbox 3'),
(31, 2, 1, 'Medium'),
(42, 2, 5, 'Yellow'),
(41, 2, 5, 'Green'),
(39, 2, 5, 'Red'),
(40, 2, 5, 'Blue'),
(23, 2, 2, 'Checkbox 1'),
(24, 2, 2, 'Checkbox 2'),
(48, 2, 11, 'Large'),
(47, 2, 11, 'Medium'),
(46, 2, 11, 'Small');

-- --------------------------------------------------------

--
-- Table structure for table `oc_order`
--

DROP TABLE IF EXISTS `oc_order`;
CREATE TABLE `oc_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_no` int(11) NOT NULL DEFAULT '0',
  `invoice_prefix` varchar(26) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `store_name` varchar(64) NOT NULL,
  `store_url` varchar(255) NOT NULL,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `payment_firstname` varchar(32) NOT NULL,
  `payment_lastname` varchar(32) NOT NULL,
  `payment_company` varchar(32) NOT NULL,
  `payment_company_id` varchar(32) NOT NULL,
  `payment_tax_id` varchar(32) NOT NULL,    
  `payment_address_1` varchar(128) NOT NULL,
  `payment_address_2` varchar(128) NOT NULL,
  `payment_city` varchar(128) NOT NULL,
  `payment_postcode` varchar(10) NOT NULL,
  `payment_country` varchar(128) NOT NULL,
  `payment_country_id` int(11) NOT NULL,
  `payment_zone` varchar(128) NOT NULL,
  `payment_zone_id` int(11) NOT NULL,
  `payment_address_format` text NOT NULL,
  `payment_method` varchar(128) NOT NULL,
  `payment_code` varchar(128) NOT NULL,
  `shipping_firstname` varchar(32) NOT NULL,
  `shipping_lastname` varchar(32) NOT NULL,
  `shipping_company` varchar(32) NOT NULL,
  `shipping_address_1` varchar(128) NOT NULL,
  `shipping_address_2` varchar(128) NOT NULL,
  `shipping_city` varchar(128) NOT NULL,
  `shipping_postcode` varchar(10) NOT NULL,
  `shipping_country` varchar(128) NOT NULL,
  `shipping_country_id` int(11) NOT NULL,
  `shipping_zone` varchar(128) NOT NULL,
  `shipping_zone_id` int(11) NOT NULL,
  `shipping_address_format` text NOT NULL,
  `shipping_method` varchar(128) NOT NULL,
  `shipping_code` varchar(128) NOT NULL,  
  `comment` text NOT NULL,
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `order_status_id` int(11) NOT NULL DEFAULT '0',
  `affiliate_id` int(11) NOT NULL,
  `commission` decimal(15,4) NOT NULL,
  `language_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `currency_code` varchar(3) NOT NULL,
  `currency_value` decimal(15,8) NOT NULL DEFAULT '1.0000',
  `ip` varchar(40) NOT NULL,
  `forwarded_ip` varchar(40) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `accept_language` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_order`
--


-- --------------------------------------------------------

--
-- Table structure for table `oc_order_download`
--

DROP TABLE IF EXISTS `oc_order_download`;
CREATE TABLE `oc_order_download` (
  `order_download_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_product_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `filename` varchar(128) NOT NULL,
  `mask` varchar(128) NOT NULL,
  `remaining` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_download_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_order_download`
--

DROP TABLE IF EXISTS `oc_order_fraud`;
CREATE TABLE `oc_order_fraud` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `country_match` varchar(3) NOT NULL,
  `country_code` varchar(2) NOT NULL,
  `high_risk_country` varchar(3) NOT NULL,
  `distance` int(11) NOT NULL,
  `ip_region` varchar(255) NOT NULL,
  `ip_city` varchar(255) NOT NULL,
  `ip_latitude` decimal(10,6) NOT NULL,
  `ip_longitude` decimal(10,6) NOT NULL,
  `ip_isp` varchar(255) NOT NULL,
  `ip_org` varchar(255) NOT NULL,
  `ip_asnum` int(11) NOT NULL,
  `ip_user_type` varchar(255) NOT NULL,
  `ip_country_confidence` varchar(3) NOT NULL,
  `ip_region_confidence` varchar(3) NOT NULL,
  `ip_city_confidence` varchar(3) NOT NULL,
  `ip_postal_confidence` varchar(3) NOT NULL,
  `ip_postal_code` varchar(10) NOT NULL,
  `ip_accuracy_radius` int(11) NOT NULL,
  `ip_net_speed_cell` varchar(255) NOT NULL,
  `ip_metro_code` int(3) NOT NULL,
  `ip_area_code` int(3) NOT NULL,
  `ip_time_zone` varchar(255) NOT NULL,
  `ip_region_name` varchar(255) NOT NULL,
  `ip_domain` varchar(255) NOT NULL,
  `ip_country_name` varchar(255) NOT NULL,
  `ip_continent_code` varchar(2) NOT NULL,
  `ip_corporate_proxy` varchar(3) NOT NULL,
  `anonymous_proxy` varchar(3) NOT NULL,
  `proxy_score` int(3) NOT NULL,
  `is_trans_proxy` varchar(3) NOT NULL,
  `free_mail` varchar(3) NOT NULL,
  `carder_email` varchar(3) NOT NULL,
  `high_risk_username` varchar(3) NOT NULL,
  `high_risk_password` varchar(3) NOT NULL,
  `bin_match` varchar(10) NOT NULL,
  `bin_country` varchar(2) NOT NULL,
  `bin_name_match` varchar(3) NOT NULL,
  `bin_name` varchar(255) NOT NULL,
  `bin_phone_match` varchar(3) NOT NULL,
  `bin_phone` varchar(32) NOT NULL,
  `customer_phone_in_billing_location` varchar(8) NOT NULL,
  `ship_forward` varchar(3) NOT NULL,
  `city_postal_match` varchar(3) NOT NULL,
  `ship_city_postal_match` varchar(3) NOT NULL,
  `score` decimal(10,5) NOT NULL,
  `explanation` text NOT NULL,
  `risk_score` decimal(10,5) NOT NULL,
  `queries_remaining` int(11) NOT NULL,
  `maxmind_id` varchar(8) NOT NULL,
  `error` text NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_field`
--

DROP TABLE IF EXISTS `oc_order_field`;
CREATE TABLE `oc_order_field` (
  `order_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `custom_field_value_id` int(11) NOT NULL,
  `name` int(128) NOT NULL,
  `value` text NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`order_id`,`custom_field_id`,`custom_field_value_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_order_field`
--

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_history`
--

DROP TABLE IF EXISTS `oc_order_history`;
CREATE TABLE `oc_order_history` (
  `order_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_status_id` int(5) NOT NULL,
  `notify` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`order_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_order_history`
--


-- --------------------------------------------------------


--
-- Table structure for table `oc_order_option`
--

DROP TABLE IF EXISTS `oc_order_option`;
CREATE TABLE `oc_order_option` (
  `order_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_product_id` int(11) NOT NULL,
  `product_option_id` int(11) NOT NULL,
  `product_option_value_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(32) NOT NULL,
  PRIMARY KEY (`order_option_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_order_option`
--


-- --------------------------------------------------------

--
-- Table structure for table `oc_order_product`
--

DROP TABLE IF EXISTS `oc_order_product`;
CREATE TABLE `oc_order_product` (
  `order_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `tax` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `reward` int(8) NOT NULL,
  PRIMARY KEY (`order_product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_order_product`
--

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_status`
--

DROP TABLE IF EXISTS `oc_order_status`;
CREATE TABLE `oc_order_status` (
  `order_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`order_status_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_order_status`
--

INSERT INTO `oc_order_status` (`order_status_id`, `language_id`, `name`) VALUES
(1, 1, 'Ожидание'),
(2, 1, 'В обработке'),
(3, 1, 'Доставлено'),
(7, 1, 'Отменено'),
(5, 1, 'Сделка завершена'),
(8, 1, 'Возврат'),
(9, 1, 'Отмена и аннулирование'),
(10, 1, 'Неудавшийся'),
(11, 1, 'Возмещенный'),
(12, 1, 'Полностью измененный'),
(13, 1, 'Полный возврат'),
(1, 2, 'Pending'),
(2, 2, 'Processing'),
(3, 2, 'Shipped'),
(7, 2, 'Canceled'),
(5, 2, 'Complete'),
(8, 2, 'Denied'),
(9, 2, 'Canceled Reversal'),
(10, 2, 'Failed'),
(11, 2, 'Refunded'),
(12, 2, 'Reversed'),
(13, 2, 'Chargeback');

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_total`
--

DROP TABLE IF EXISTS `oc_order_total`;
CREATE TABLE `oc_order_total` (
  `order_total_id` int(10) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `code` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `text` varchar(255) NOT NULL,
  `value` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`order_total_id`),
  KEY `idx_orders_total_orders_id` (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_order_total`
--

-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_order_voucher`;
CREATE TABLE `oc_order_voucher` (
  `order_voucher_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `voucher_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  PRIMARY KEY (`order_voucher_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_order_voucher`
--

-- --------------------------------------------------------

--
-- Table structure for table `oc_product`
--

DROP TABLE IF EXISTS `oc_product`;
CREATE TABLE `oc_product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(64) NOT NULL,
  `sku` varchar(64) NOT NULL,
  `upc` varchar(12) NOT NULL,
  `ean` varchar(14) NOT NULL,
  `jan` varchar(13) NOT NULL,
  `isbn` varchar(13) NOT NULL,
  `mpn` varchar(64) NOT NULL,
  `location` varchar(128) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `stock_status_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `manufacturer_id` int(11) NOT NULL,
  `shipping` tinyint(1) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `points` int(8) NOT NULL DEFAULT '0',
  `tax_class_id` int(11) NOT NULL,
  `date_available` date NOT NULL,
  `weight` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `weight_class_id` int(11) NOT NULL DEFAULT '0',
  `length` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `width` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `height` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `length_class_id` int(11) NOT NULL DEFAULT '0',
  `subtract` tinyint(1) NOT NULL DEFAULT '1',
  `minimum` int(11) NOT NULL DEFAULT '1',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `viewed` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;




--
-- Dumping data for table `oc_product`
--

INSERT INTO `oc_product` (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `date_added`, `date_modified`, `viewed`) VALUES
(28, 'Product 1', '', '', '', '', '', '', '', 938, 7, 'data/promo/Coffee Maker Bosch Assimo/Coffee Maker Bosch Assimo 2.png', 5, 1, 100.0000, 200, 9, '2009-02-03', 146.40000000, 2, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 0, 1, '2009-02-03 16:06:50', '2014-08-14 10:44:19', 13),
(29, 'Product 2', '', '', '', '', '', '', '', 999, 6, 'data/promo/Coffee Machine Malongo Espresso-gold/Coffee Machine Malongo Espresso-gold 1.png', 6, 1, 279.9900, 0, 9, '2009-02-03', 133.00000000, 2, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 0, 1, '2009-02-03 16:42:17', '2014-08-14 14:33:26', 14),
(30, 'Product 3', '', '', '', '', '', '', '', 6, 6, 'data/promo/Coffee Machine Bugatti Diva/Coffee Machine Bugatti Diva 1.png', 9, 1, 100.0000, 0, 9, '2009-02-03', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 0, 1, '2009-02-03 16:59:00', '2014-08-14 10:41:50', 43),
(31, 'Product 4', '', '', '', '', '', '', '', 1000, 6, 'data/promo/LG Refrigerator/LG Refrigerator - Floral collection T676 1.png', 0, 1, 80.0000, 0, 9, '2009-02-03', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 0, 1, '2009-02-03 17:00:10', '2014-08-14 10:57:32', 4),
(32, 'Product 5', '', '', '', '', '', '', '', 999, 6, 'data/promo/John Lewis Funky Napkin Holder/John Lewis Funky Napkin Holder 1 copy.png', 8, 1, 100.0000, 0, 9, '2009-02-03', 5.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 0, 1, '2009-02-03 17:07:26', '2014-08-14 15:23:49', 6),
(33, 'Product 6', '', '', '', '', '', '', '', 1000, 6, 'data/promo/John Lewis Classic II Universal Steamer and Lid/John Lewis Classic II Universal Steamer and Lid 1 copy.png', 0, 1, 200.0000, 0, 9, '2009-02-03', 5.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 2, 1, 1, 0, 1, '2009-02-03 17:08:31', '2014-08-14 14:35:39', 6),
(34, 'Product 7', '', '', '', '', '', '', '', 1000, 6, 'data/promo/John Lewis Dome Pedal Bin/John Lewis Dome Pedal Bin 3 copy.png', 8, 1, 100.0000, 0, 9, '2009-02-03', 5.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 2, 1, 1, 0, 1, '2009-02-03 18:07:54', '2014-08-14 10:51:13', 9),
(35, 'Product 8', '', '', '', '', '', '', '', 999, 5, 'data/promo/Kalorik Meat Grinder MGR25959 Stainless Steel Blade/Kalorik Meat Grinder MGR25959 Stainless Steel Blade 1.png', 0, 0, 100.0000, 0, 9, '2009-02-03', 5.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 0, 1, '2009-02-03 18:08:31', '2014-08-14 14:38:00', 4),
(36, 'Product 9', '', '', '', '', '', '', '', 994, 6, 'data/promo/John Lewis Classic II Universal Steamer and Lid/John Lewis Classic II Universal Steamer and Lid 1 copy.png', 8, 0, 100.0000, 100, 9, '2009-02-03', 5.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 2, 1, 1, 0, 1, '2009-02-03 18:09:19', '2014-08-14 10:49:32', 7),
(40, 'product 11', '', '', '', '', '', '', '', 970, 5, 'data/promo/Hood/Hood Scholtes HSE 159 IX 1.png', 8, 1, 101.0000, 0, 9, '2009-02-03', 10.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 0, 1, '2009-02-03 21:07:12', '2014-08-27 01:57:29', 48),
(41, 'Product 14', '', '', '', '', '', '', '', 976, 5, 'data/promo/Hamilton Beach 72703 Ensemble 3 Cup Chopper/Hamilton Beach 72703 Ensemble 3 Cup Chopper 1.png', 8, 1, 100.0000, 0, 9, '2009-02-03', 5.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 0, 1, '2009-02-03 21:07:26', '2014-08-14 10:45:21', 16),
(42, 'Product 15', '', '', '', '', '', '', '', 990, 5, 'data/promo/Bugatti Uma Electronic Kitchen Scale and Timer/Bugatti Uma Electronic Kitchen Scale and Timer 1 copy.png', 8, 1, 100.0000, 400, 9, '2009-02-04', 12.50000000, 1, 1.00000000, 2.00000000, 3.00000000, 1, 1, 2, 0, 1, '2009-02-03 21:07:37', '2014-08-21 18:46:49', 68),
(43, 'Product 16', '', '', '', '', '', '', '', 929, 5, 'data/promo/John Lewis Value Plastic Cutlery Drainer/John Lewis Value Plastic Cutlery Drainer 3 copy.png', 8, 0, 500.0000, 0, 9, '2009-02-03', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 2, 1, 1, 0, 1, '2009-02-03 21:07:49', '2014-08-14 10:54:19', 9),
(44, 'Product 17', '', '', '', '', '', '', '', 1000, 5, 'data/promo/Joseph Joseph Nest Food Preparation Set/Joseph Joseph Nest Food Preparation Set 3 copy.png', 8, 1, 1000.0000, 0, 9, '2009-02-03', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 2, 1, 1, 0, 1, '2009-02-03 21:08:00', '2014-08-14 10:55:29', 12),
(45, 'Product 18', '', '', '', '', '', '', '', 998, 5, 'data/promo/Kalorik Meat Grinder MGR25959 Stainless Steel Blade/Kalorik Meat Grinder MGR25959 Stainless Steel Blade 1.png', 8, 1, 2000.0000, 0, 0, '2009-02-03', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 2, 1, 1, 0, 1, '2009-02-03 21:08:17', '2014-08-14 10:56:37', 8),
(46, 'Product 19', '', '', '', '', '', '', '', 1000, 5, 'data/promo/John Lewis Funky Napkin Holder/John Lewis Funky Napkin Holder 1 copy.png', 10, 1, 1000.0000, 0, 9, '2009-02-03', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 2, 1, 1, 0, 1, '2009-02-03 21:08:29', '2014-08-14 14:36:54', 10),
(47, 'Product 21', '', '', '', '', '', '', '', 1000, 5, 'data/promo/Coffee Machine Malongo Espresso-gold/Coffee Machine Malongo Espresso-gold 1.png', 7, 1, 100.0000, 400, 9, '2009-02-03', 1.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 0, 1, 0, 1, '2009-02-03 21:08:40', '2014-08-14 10:43:17', 13),
(48, 'product 20', 'test 1', '', '', '', '', '', 'test 2', 995, 5, 'data/promo/Hood/Hood CDA EVCK4SS 40cm Cylinder 1.png', 8, 1, 100.0000, 0, 9, '2009-02-08', 1.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 2, 1, 1, 0, 1, '2009-02-08 17:21:51', '2014-08-14 10:47:26', 15),
(49, 'SAM1', '', '', '', '', '', '', '', 0, 8, 'data/promo/Coffee Maker Bosch Assimo/Coffee Maker Bosch Assimo 1.png', 0, 1, 199.9900, 0, 9, '2011-04-25', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 1, 1, '2011-04-26 08:57:34', '2014-08-14 14:34:28', 11);

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_attribute`
--

DROP TABLE IF EXISTS `oc_product_attribute`;
CREATE TABLE `oc_product_attribute` (
  `product_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`product_id`,`attribute_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_product_attribute`
--

INSERT INTO `oc_product_attribute` (`product_id`, `attribute_id`, `language_id`, `text`) VALUES
(32, 3, 2, '123'),
(32, 3, 1, '123');

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_description`
--

DROP TABLE IF EXISTS `oc_product_description`;
CREATE TABLE `oc_product_description` (
  `product_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `description_mini` text NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  `seo_title` varchar(255) NOT NULL, 
  `seo_h1` varchar(255) NOT NULL,
  `tag` text NOT NULL,
  PRIMARY KEY (`product_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- 
-- Dumping data for table `oc_product_description`
-- 

INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `description_mini`, `meta_description`, `meta_keyword`, `seo_title`, `seo_h1`, `tag`) VALUES
(35, 2, 'Product 8', '&lt;p&gt;Product 8&lt;/p&gt;\r\n', '', '', '', '', '', ''),
(48, 2, 'iPod Classic', '&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n&lt;div&gt;\r\n&lt;p&gt;&lt;strong&gt;More room to move.&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;With 80GB or 160GB of storage and up to 40 hours of battery life, the new iPod classic lets you enjoy up to 40,000 songs or up to 200 hours of video or any combination wherever you go.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Cover Flow.&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Browse through your music collection by flipping through album art. Select an album to turn it over and see the track list.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Enhanced interface.&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Experience a whole new way to browse and view your music and video.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Sleeker design.&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Beautiful, durable, and sleeker than ever, iPod classic now features an anodized aluminum and polished stainless steel enclosure with rounded edges.&lt;/p&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;', '', '', '', '', '', ''),
(40, 2, 'iPhone', '&lt;p class=&quot;intro&quot;&gt;iPhone is a revolutionary new mobile phone that allows you to make a call by simply tapping a name or number in your address book, a favorites list, or a call log. It also automatically syncs all your contacts from a PC, Mac, or Internet service. And it lets you select and listen to voicemail messages in whatever order you want just like email.&lt;/p&gt;\r\n', '', '', '', '', '', ''),
(44, 2, 'MacBook Air', '&lt;div&gt;MacBook Air is ultrathin, ultraportable, and ultra unlike anything else. But you don’t lose inches and pounds overnight. It’s the result of rethinking conventions. Of multiple wireless innovations. And of breakthrough design. With MacBook Air, mobile computing suddenly has a new standard.&lt;/div&gt;\r\n', '', '', '', '', '', ''),
(36, 2, 'iPod Nano', '&lt;div&gt;\r\n&lt;p&gt;&lt;strong&gt;Video in your pocket.&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Its the small iPod with one very big idea: video. The worlds most popular music player now lets you enjoy movies, TV shows, and more on a two-inch display thats 65% brighter than before.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Cover Flow.&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Browse through your music collection by flipping through album art. Select an album to turn it over and see the track list.&lt;strong&gt;&amp;nbsp;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Enhanced interface.&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Experience a whole new way to browse and view your music and video.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Sleek and colorful.&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;With an anodized aluminum and polished stainless steel enclosure and a choice of five colors, iPod nano is dressed to impress.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;iTunes.&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Available as a free download, iTunes makes it easy to browse and buy millions of songs, movies, TV shows, audiobooks, and games and download free podcasts all at the iTunes Store. And you can import your own music, manage your whole media library, and sync your iPod or iPhone with ease.&lt;/p&gt;\r\n&lt;/div&gt;\r\n', '', '', '', '', '', ''),
(46, 2, 'Sony VAIO', '&lt;div&gt;Unprecedented power. The next generation of processing technology has arrived. Built into the newest VAIO notebooks lies Intel''s latest, most powerful innovation yet: Intel® Centrino® 2 processor technology. Boasting incredible speed, expanded wireless connectivity, enhanced multimedia support and greater energy efficiency, all the high-performance essentials are seamlessly combined into a single chip.&lt;/div&gt;\r\n', '', '', '', '', '', ''),
(47, 2, 'HP LP3065', '&lt;p&gt;Stop your co-workers in their tracks with the stunning new 30-inch diagonal HP LP3065 Flat Panel Monitor. This flagship monitor features best-in-class performance and presentation features on a huge wide-aspect screen while letting you work as comfortably as possible - you might even forget you''re at the office&lt;/p&gt;\r\n', '', '', '', '', '', ''),
(32, 1, 'iPod Touch', '&lt;p&gt;&lt;strong&gt;Revolutionary multi-touch interface.&lt;/strong&gt;&lt;br /&gt;\r\niPod touch features the same multi-touch screen technology as iPhone. Pinch to zoom in on a photo. Scroll through your songs and videos with a flick. Flip through your library by album artwork with Cover Flow.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Gorgeous 3.5-inch widescreen display.&lt;/strong&gt;&lt;br /&gt;\r\nWatch your movies, TV shows, and photos come alive with bright, vivid color on the 320-by-480-pixel display.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Music downloads straight from iTunes.&lt;/strong&gt;&lt;br /&gt;\r\nShop the iTunes Wi-Fi Music Store from anywhere with Wi-Fi.1 Browse or search to find the music youre looking for, preview it, and buy it with just a tap.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Surf the web with Wi-Fi.&lt;/strong&gt;&lt;br /&gt;\r\nBrowse the web using Safari and watch YouTube videos on the first iPod with Wi-Fi built in&lt;br /&gt;\r\n&amp;nbsp;&lt;/p&gt;\r\n', '', '', '', '', '', ''),
(41, 2, 'iMac', '&lt;div&gt;Just when you thought iMac had everything, now there’s even more. More powerful Intel Core 2 Duo processors. And more memory standard. Combine this with Mac OS X Leopard and iLife ’08, and it’s more all-in-one than ever. iMac packs amazing performance into a stunningly slim space.&lt;/div&gt;\r\n', '', '', '', '', '', ''),
(33, 2, 'Samsung SyncMaster 941BW', '&lt;div&gt;Imagine the advantages of going big without slowing down. The big 19&quot; 941BW monitor combines wide aspect ratio with fast pixel response time, for bigger images, more room to work and crisp motion. In addition, the exclusive MagicBright 2, MagicColor and MagicTune technologies help deliver the ideal image in every situation, while sleek, narrow bezels and adjustable stands deliver style just the way you want it. With the Samsung 941BW widescreen analog/digital LCD monitor, it''s not hard to imagine.&lt;/div&gt;\r\n', '', '', '', '', '', ''),
(34, 2, 'iPod Shuffle', '&lt;div&gt;&lt;strong&gt;Born to be worn.&lt;/strong&gt;\r\n&lt;p&gt;Clip on the worlds most wearable music player and take up to 240 songs with you anywhere. Choose from five colors including four new hues to make your musical fashion statement.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Random meets rhythm.&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;With iTunes autofill, iPod shuffle can deliver a new musical experience every time you sync. For more randomness, you can shuffle songs during playback with the slide of a switch.&lt;/p&gt;\r\n&lt;strong&gt;Everything is easy.&lt;/strong&gt;\r\n\r\n&lt;p&gt;Charge and sync with the included USB dock. Operate the iPod shuffle controls with one hand. Enjoy up to 12 hours straight of skip-free music playback.&lt;/p&gt;\r\n&lt;/div&gt;\r\n', '', '', '', '', '', ''),
(43, 2, 'MacBook', '&lt;div&gt;\r\n&lt;p&gt;&lt;b&gt;Intel Core 2 Duo processor&lt;/b&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Powered by an Intel Core 2 Duo processor at speeds up to 2.16GHz, the new MacBook is the fastest ever.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;b&gt;1GB memory, larger hard drives&lt;/b&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;The new MacBook now comes with 1GB of memory standard and larger hard drives for the entire line perfect for running more of your favorite applications and storing growing media collections.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;b&gt;Sleek, 1.08-inch-thin design&lt;/b&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;MacBook makes it easy to hit the road thanks to its tough polycarbonate case, built-in wireless technologies, and innovative MagSafe Power Adapter that releases automatically if someone accidentally trips on the cord.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;b&gt;Built-in iSight camera&lt;/b&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Right out of the box, you can have a video chat with friends or family,2 record a video at your desk, or take fun pictures with Photo Booth&lt;/p&gt;\r\n&lt;/div&gt;\r\n', '', '', '', '', '', ''),
(42, 1, 'Apple Cinema 30&quot;', '&lt;p&gt;&lt;font face=&quot;helvetica,geneva,arial&quot; size=&quot;2&quot;&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The 30-inch Apple Cinema HD Display delivers an amazing 2560 x 1600 pixel resolution. Designed specifically for the creative professional, this display provides more space for easier access to all the tools and palettes needed to edit, format and composite your work. Combine this display with a Mac Pro, MacBook Pro, or PowerMac G5 and there''s no limit to what you can achieve. &lt;/font&gt;&lt;br /&gt;\r\n&lt;br /&gt;\r\n&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The Cinema HD features an active-matrix liquid crystal display that produces flicker-free images that deliver twice the brightness, twice the sharpness and twice the contrast ratio of a typical CRT display. Unlike other flat panels, it''s designed with a pure digital interface to deliver distortion-free images that never need adjusting. With over 4 million digital pixels, the display is uniquely suited for scientific and technical applications such as visualizing molecular structures or analyzing geological data. &lt;/font&gt;&lt;br /&gt;\r\n&lt;br /&gt;\r\n&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;Offering accurate, brilliant color performance, the Cinema HD delivers up to 16.7 million colors across a wide gamut allowing you to see subtle nuances between colors from soft pastels to rich jewel tones. A wide viewing angle ensures uniform color from edge to edge. Apple''s ColorSync technology allows you to create custom profiles to maintain consistent color onscreen and in print. The result: You can confidently use this display in all your color-critical applications. &lt;/font&gt;&lt;br /&gt;\r\n&lt;br /&gt;\r\n&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;Housed in a new aluminum design, the display has a very thin bezel that enhances visual accuracy. Each display features two FireWire 400 ports and two USB 2.0 ports, making attachment of desktop peripherals, such as iSight, iPod, digital and still cameras, hard drives, printers and scanners, even more accessible and convenient. Taking advantage of the much thinner and lighter footprint of an LCD, the new displays support the VESA (Video Electronics Standards Association) mounting interface standard. Customers with the optional Cinema Display VESA Mount Adapter kit gain the flexibility to mount their display in locations most appropriate for their work environment. &lt;/font&gt;&lt;br /&gt;\r\n&lt;br /&gt;\r\n&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The Cinema HD features a single cable design with elegant breakout for the USB 2.0, FireWire 400 and a pure digital connection using the industry standard Digital Video Interface (DVI) interface. The DVI connection allows for a direct pure-digital connection.&lt;/font&gt;&lt;/font&gt;&lt;/p&gt;\r\n\r\n&lt;h3&gt;Features:&lt;/h3&gt;\r\n\r\n&lt;p&gt;Unrivaled display performance&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;30-inch (viewable) active-matrix liquid crystal display provides breathtaking image quality and vivid, richly saturated color.&lt;/li&gt;\r\n	&lt;li&gt;Support for 2560-by-1600 pixel resolution for display of high definition still and video imagery.&lt;/li&gt;\r\n	&lt;li&gt;Wide-format design for simultaneous display of two full pages of text and graphics.&lt;/li&gt;\r\n	&lt;li&gt;Industry standard DVI connector for direct attachment to Mac- and Windows-based desktops and notebooks&lt;/li&gt;\r\n	&lt;li&gt;Incredibly wide (170 degree) horizontal and vertical viewing angle for maximum visibility and color performance.&lt;/li&gt;\r\n	&lt;li&gt;Lightning-fast pixel response for full-motion digital video playback.&lt;/li&gt;\r\n	&lt;li&gt;Support for 16.7 million saturated colors, for use in all graphics-intensive applications.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;Simple setup and operation&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Single cable with elegant breakout for connection to DVI, USB and FireWire ports&lt;/li&gt;\r\n	&lt;li&gt;Built-in two-port USB 2.0 hub for easy connection of desktop peripheral devices.&lt;/li&gt;\r\n	&lt;li&gt;Two FireWire 400 ports to support iSight and other desktop peripherals&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;Sleek, elegant design&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Huge virtual workspace, very small footprint.&lt;/li&gt;\r\n	&lt;li&gt;Narrow Bezel design to minimize visual impact of using dual displays&lt;/li&gt;\r\n	&lt;li&gt;Unique hinge design for effortless adjustment&lt;/li&gt;\r\n	&lt;li&gt;Support for VESA mounting solutions (Apple Cinema Display VESA Mount Adapter sold separately)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;h3&gt;Technical specifications&lt;/h3&gt;\r\n\r\n&lt;p&gt;&lt;b&gt;Screen size (diagonal viewable image size)&lt;/b&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Apple Cinema HD Display: 30 inches (29.7-inch viewable)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;b&gt;Screen type&lt;/b&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Thin film transistor (TFT) active-matrix liquid crystal display (AMLCD)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;b&gt;Resolutions&lt;/b&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;2560 x 1600 pixels (optimum resolution)&lt;/li&gt;\r\n	&lt;li&gt;2048 x 1280&lt;/li&gt;\r\n	&lt;li&gt;1920 x 1200&lt;/li&gt;\r\n	&lt;li&gt;1280 x 800&lt;/li&gt;\r\n	&lt;li&gt;1024 x 640&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;b&gt;Display colors (maximum)&lt;/b&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;16.7 million&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;b&gt;Viewing angle (typical)&lt;/b&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;170° horizontal; 170° vertical&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;b&gt;Brightness (typical)&lt;/b&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;30-inch Cinema HD Display: 400 cd/m2&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;b&gt;Contrast ratio (typical)&lt;/b&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;700:1&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;b&gt;Response time (typical)&lt;/b&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;16 ms&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;b&gt;Pixel pitch&lt;/b&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;30-inch Cinema HD Display: 0.250 mm&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;b&gt;Screen treatment&lt;/b&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Antiglare hardcoat&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;b&gt;User controls (hardware and software)&lt;/b&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Display Power,&lt;/li&gt;\r\n	&lt;li&gt;System sleep, wake&lt;/li&gt;\r\n	&lt;li&gt;Brightness&lt;/li&gt;\r\n	&lt;li&gt;Monitor tilt&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;b&gt;Connectors and cables&lt;/b&gt;&lt;br /&gt;\r\nCable&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;DVI (Digital Visual Interface)&lt;/li&gt;\r\n	&lt;li&gt;FireWire 400&lt;/li&gt;\r\n	&lt;li&gt;USB 2.0&lt;/li&gt;\r\n	&lt;li&gt;DC power (24 V)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;Connectors&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Two-port, self-powered USB 2.0 hub&lt;/li&gt;\r\n	&lt;li&gt;Two FireWire 400 ports&lt;/li&gt;\r\n	&lt;li&gt;Kensington security port&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;b&gt;VESA mount adapter&lt;/b&gt;&lt;br /&gt;\r\nRequires optional Cinema Display VESA Mount Adapter (M9649G/A)&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Compatible with VESA FDMI (MIS-D, 100, C) compliant mounting solutions&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;b&gt;Electrical requirements&lt;/b&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Input voltage: 100-240 VAC 50-60Hz&lt;/li&gt;\r\n	&lt;li&gt;Maximum power when operating: 150W&lt;/li&gt;\r\n	&lt;li&gt;Energy saver mode: 3W or less&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;b&gt;Environmental requirements&lt;/b&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Operating temperature: 50° to 95° F (10° to 35° C)&lt;/li&gt;\r\n	&lt;li&gt;Storage temperature: -40° to 116° F (-40° to 47° C)&lt;/li&gt;\r\n	&lt;li&gt;Operating humidity: 20% to 80% noncondensing&lt;/li&gt;\r\n	&lt;li&gt;Maximum operating altitude: 10,000 feet&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;b&gt;Agency approvals&lt;/b&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;FCC Part 15 Class B&lt;/li&gt;\r\n	&lt;li&gt;EN55022 Class B&lt;/li&gt;\r\n	&lt;li&gt;EN55024&lt;/li&gt;\r\n	&lt;li&gt;VCCI Class B&lt;/li&gt;\r\n	&lt;li&gt;AS/NZS 3548 Class B&lt;/li&gt;\r\n	&lt;li&gt;CNS 13438 Class B&lt;/li&gt;\r\n	&lt;li&gt;ICES-003 Class B&lt;/li&gt;\r\n	&lt;li&gt;ISO 13406 part 2&lt;/li&gt;\r\n	&lt;li&gt;MPR II&lt;/li&gt;\r\n	&lt;li&gt;IEC 60950&lt;/li&gt;\r\n	&lt;li&gt;UL 60950&lt;/li&gt;\r\n	&lt;li&gt;CSA 60950&lt;/li&gt;\r\n	&lt;li&gt;EN60950&lt;/li&gt;\r\n	&lt;li&gt;ENERGY STAR&lt;/li&gt;\r\n	&lt;li&gt;TCO ''03&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;b&gt;Size and weight&lt;/b&gt;&lt;br /&gt;\r\n30-inch Apple Cinema HD Display&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Height: 21.3 inches (54.3 cm)&lt;/li&gt;\r\n	&lt;li&gt;Width: 27.2 inches (68.8 cm)&lt;/li&gt;\r\n	&lt;li&gt;Depth: 8.46 inches (21.5 cm)&lt;/li&gt;\r\n	&lt;li&gt;Weight: 27.5 pounds (12.5 kg)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;b&gt;System Requirements&lt;/b&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Mac Pro, all graphic options&lt;/li&gt;\r\n	&lt;li&gt;MacBook Pro&lt;/li&gt;\r\n	&lt;li&gt;Power Mac G5 (PCI-X) with ATI Radeon 9650 or better or NVIDIA GeForce 6800 GT DDL or better&lt;/li&gt;\r\n	&lt;li&gt;Power Mac G5 (PCI Express), all graphics options&lt;/li&gt;\r\n	&lt;li&gt;PowerBook G4 with dual-link DVI support&lt;/li&gt;\r\n	&lt;li&gt;Windows PC and graphics card that supports DVI ports with dual-link digital bandwidth and VESA DDC standard for plug-and-play setup&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', '', '', '', '', ''),
(42, 2, 'Apple Cinema 30&quot;', '&lt;p&gt;&lt;font face=&quot;helvetica,geneva,arial&quot; size=&quot;2&quot;&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The 30-inch Apple Cinema HD Display delivers an amazing 2560 x 1600 pixel resolution. Designed specifically for the creative professional, this display provides more space for easier access to all the tools and palettes needed to edit, format and composite your work. Combine this display with a Mac Pro, MacBook Pro, or PowerMac G5 and there''s no limit to what you can achieve. &lt;/font&gt;&lt;br /&gt;\r\n&lt;br /&gt;\r\n&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The Cinema HD features an active-matrix liquid crystal display that produces flicker-free images that deliver twice the brightness, twice the sharpness and twice the contrast ratio of a typical CRT display. Unlike other flat panels, it''s designed with a pure digital interface to deliver distortion-free images that never need adjusting. With over 4 million digital pixels, the display is uniquely suited for scientific and technical applications such as visualizing molecular structures or analyzing geological data. &lt;/font&gt;&lt;br /&gt;\r\n&lt;br /&gt;\r\n&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;Offering accurate, brilliant color performance, the Cinema HD delivers up to 16.7 million colors across a wide gamut allowing you to see subtle nuances between colors from soft pastels to rich jewel tones. A wide viewing angle ensures uniform color from edge to edge. Apple''s ColorSync technology allows you to create custom profiles to maintain consistent color onscreen and in print. The result: You can confidently use this display in all your color-critical applications. &lt;/font&gt;&lt;br /&gt;\r\n&lt;br /&gt;\r\n&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;Housed in a new aluminum design, the display has a very thin bezel that enhances visual accuracy. Each display features two FireWire 400 ports and two USB 2.0 ports, making attachment of desktop peripherals, such as iSight, iPod, digital and still cameras, hard drives, printers and scanners, even more accessible and convenient. Taking advantage of the much thinner and lighter footprint of an LCD, the new displays support the VESA (Video Electronics Standards Association) mounting interface standard. Customers with the optional Cinema Display VESA Mount Adapter kit gain the flexibility to mount their display in locations most appropriate for their work environment. &lt;/font&gt;&lt;br /&gt;\r\n&lt;br /&gt;\r\n&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The Cinema HD features a single cable design with elegant breakout for the USB 2.0, FireWire 400 and a pure digital connection using the industry standard Digital Video Interface (DVI) interface. The DVI connection allows for a direct pure-digital connection.&lt;/font&gt;&lt;/font&gt;&lt;/p&gt;\r\n\r\n&lt;h3&gt;Features:&lt;/h3&gt;\r\n\r\n&lt;p&gt;Unrivaled display performance&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;30-inch (viewable) active-matrix liquid crystal display provides breathtaking image quality and vivid, richly saturated color.&lt;/li&gt;\r\n	&lt;li&gt;Support for 2560-by-1600 pixel resolution for display of high definition still and video imagery.&lt;/li&gt;\r\n	&lt;li&gt;Wide-format design for simultaneous display of two full pages of text and graphics.&lt;/li&gt;\r\n	&lt;li&gt;Industry standard DVI connector for direct attachment to Mac- and Windows-based desktops and notebooks&lt;/li&gt;\r\n	&lt;li&gt;Incredibly wide (170 degree) horizontal and vertical viewing angle for maximum visibility and color performance.&lt;/li&gt;\r\n	&lt;li&gt;Lightning-fast pixel response for full-motion digital video playback.&lt;/li&gt;\r\n	&lt;li&gt;Support for 16.7 million saturated colors, for use in all graphics-intensive applications.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;Simple setup and operation&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Single cable with elegant breakout for connection to DVI, USB and FireWire ports&lt;/li&gt;\r\n	&lt;li&gt;Built-in two-port USB 2.0 hub for easy connection of desktop peripheral devices.&lt;/li&gt;\r\n	&lt;li&gt;Two FireWire 400 ports to support iSight and other desktop peripherals&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;Sleek, elegant design&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Huge virtual workspace, very small footprint.&lt;/li&gt;\r\n	&lt;li&gt;Narrow Bezel design to minimize visual impact of using dual displays&lt;/li&gt;\r\n	&lt;li&gt;Unique hinge design for effortless adjustment&lt;/li&gt;\r\n	&lt;li&gt;Support for VESA mounting solutions (Apple Cinema Display VESA Mount Adapter sold separately)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;h3&gt;Technical specifications&lt;/h3&gt;\r\n\r\n&lt;p&gt;&lt;b&gt;Screen size (diagonal viewable image size)&lt;/b&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Apple Cinema HD Display: 30 inches (29.7-inch viewable)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;b&gt;Screen type&lt;/b&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Thin film transistor (TFT) active-matrix liquid crystal display (AMLCD)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;b&gt;Resolutions&lt;/b&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;2560 x 1600 pixels (optimum resolution)&lt;/li&gt;\r\n	&lt;li&gt;2048 x 1280&lt;/li&gt;\r\n	&lt;li&gt;1920 x 1200&lt;/li&gt;\r\n	&lt;li&gt;1280 x 800&lt;/li&gt;\r\n	&lt;li&gt;1024 x 640&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;b&gt;Display colors (maximum)&lt;/b&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;16.7 million&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;b&gt;Viewing angle (typical)&lt;/b&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;170° horizontal; 170° vertical&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;b&gt;Brightness (typical)&lt;/b&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;30-inch Cinema HD Display: 400 cd/m2&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;b&gt;Contrast ratio (typical)&lt;/b&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;700:1&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;b&gt;Response time (typical)&lt;/b&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;16 ms&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;b&gt;Pixel pitch&lt;/b&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;30-inch Cinema HD Display: 0.250 mm&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;b&gt;Screen treatment&lt;/b&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Antiglare hardcoat&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;b&gt;User controls (hardware and software)&lt;/b&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Display Power,&lt;/li&gt;\r\n	&lt;li&gt;System sleep, wake&lt;/li&gt;\r\n	&lt;li&gt;Brightness&lt;/li&gt;\r\n	&lt;li&gt;Monitor tilt&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;b&gt;Connectors and cables&lt;/b&gt;&lt;br /&gt;\r\nCable&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;DVI (Digital Visual Interface)&lt;/li&gt;\r\n	&lt;li&gt;FireWire 400&lt;/li&gt;\r\n	&lt;li&gt;USB 2.0&lt;/li&gt;\r\n	&lt;li&gt;DC power (24 V)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;Connectors&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Two-port, self-powered USB 2.0 hub&lt;/li&gt;\r\n	&lt;li&gt;Two FireWire 400 ports&lt;/li&gt;\r\n	&lt;li&gt;Kensington security port&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;b&gt;VESA mount adapter&lt;/b&gt;&lt;br /&gt;\r\nRequires optional Cinema Display VESA Mount Adapter (M9649G/A)&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Compatible with VESA FDMI (MIS-D, 100, C) compliant mounting solutions&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;b&gt;Electrical requirements&lt;/b&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Input voltage: 100-240 VAC 50-60Hz&lt;/li&gt;\r\n	&lt;li&gt;Maximum power when operating: 150W&lt;/li&gt;\r\n	&lt;li&gt;Energy saver mode: 3W or less&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;b&gt;Environmental requirements&lt;/b&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Operating temperature: 50° to 95° F (10° to 35° C)&lt;/li&gt;\r\n	&lt;li&gt;Storage temperature: -40° to 116° F (-40° to 47° C)&lt;/li&gt;\r\n	&lt;li&gt;Operating humidity: 20% to 80% noncondensing&lt;/li&gt;\r\n	&lt;li&gt;Maximum operating altitude: 10,000 feet&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;b&gt;Agency approvals&lt;/b&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;FCC Part 15 Class B&lt;/li&gt;\r\n	&lt;li&gt;EN55022 Class B&lt;/li&gt;\r\n	&lt;li&gt;EN55024&lt;/li&gt;\r\n	&lt;li&gt;VCCI Class B&lt;/li&gt;\r\n	&lt;li&gt;AS/NZS 3548 Class B&lt;/li&gt;\r\n	&lt;li&gt;CNS 13438 Class B&lt;/li&gt;\r\n	&lt;li&gt;ICES-003 Class B&lt;/li&gt;\r\n	&lt;li&gt;ISO 13406 part 2&lt;/li&gt;\r\n	&lt;li&gt;MPR II&lt;/li&gt;\r\n	&lt;li&gt;IEC 60950&lt;/li&gt;\r\n	&lt;li&gt;UL 60950&lt;/li&gt;\r\n	&lt;li&gt;CSA 60950&lt;/li&gt;\r\n	&lt;li&gt;EN60950&lt;/li&gt;\r\n	&lt;li&gt;ENERGY STAR&lt;/li&gt;\r\n	&lt;li&gt;TCO ''03&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;b&gt;Size and weight&lt;/b&gt;&lt;br /&gt;\r\n30-inch Apple Cinema HD Display&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Height: 21.3 inches (54.3 cm)&lt;/li&gt;\r\n	&lt;li&gt;Width: 27.2 inches (68.8 cm)&lt;/li&gt;\r\n	&lt;li&gt;Depth: 8.46 inches (21.5 cm)&lt;/li&gt;\r\n	&lt;li&gt;Weight: 27.5 pounds (12.5 kg)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;b&gt;System Requirements&lt;/b&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Mac Pro, all graphic options&lt;/li&gt;\r\n	&lt;li&gt;MacBook Pro&lt;/li&gt;\r\n	&lt;li&gt;Power Mac G5 (PCI-X) with ATI Radeon 9650 or better or NVIDIA GeForce 6800 GT DDL or better&lt;/li&gt;\r\n	&lt;li&gt;Power Mac G5 (PCI Express), all graphics options&lt;/li&gt;\r\n	&lt;li&gt;PowerBook G4 with dual-link DVI support&lt;/li&gt;\r\n	&lt;li&gt;Windows PC and graphics card that supports DVI ports with dual-link digital bandwidth and VESA DDC standard for plug-and-play setup&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', '', '', '', '', ''),
(30, 2, 'Canon EOS 5D', '&lt;p&gt;Canon''s press material for the EOS 5D states that it ''defines (a) new D-SLR category'', while we''re not typically too concerned with marketing talk this particular statement is clearly pretty accurate. The EOS 5D is unlike any previous digital SLR in that it combines a full-frame (35 mm sized) high resolution sensor (12.8 megapixels) with a relatively compact body (slightly larger than the EOS 20D, although in your hand it feels noticeably ''chunkier''). The EOS 5D is aimed to slot in between the EOS 20D and the EOS-1D professional digital SLR''s, an important difference when compared to the latter is that the EOS 5D doesn''t have any environmental seals. While Canon don''t specifically refer to the EOS 5D as a ''professional'' digital SLR it will have obvious appeal to professionals who want a high quality digital SLR in a body lighter than the EOS-1D. It will also no doubt appeal to current EOS 20D owners (although lets hope they''ve not bought too many EF-S lenses...) ??&lt;/p&gt;\r\n', '', '', '', '', '', ''),
(35, 1, 'Товар 8', '&lt;p&gt;Товар 8&lt;/p&gt;\r\n', '', '', '', '', '', ''),
(48, 1, 'iPod Classic', '&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n&lt;div&gt;\r\n&lt;p&gt;&lt;strong&gt;More room to move.&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;With 80GB or 160GB of storage and up to 40 hours of battery life, the new iPod classic lets you enjoy up to 40,000 songs or up to 200 hours of video or any combination wherever you go.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Cover Flow.&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Browse through your music collection by flipping through album art. Select an album to turn it over and see the track list.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Enhanced interface.&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Experience a whole new way to browse and view your music and video.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Sleeker design.&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Beautiful, durable, and sleeker than ever, iPod classic now features an anodized aluminum and polished stainless steel enclosure with rounded edges.&lt;/p&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;', '', '', '', '', '', ''),
(40, 1, 'iPhone', '&lt;p class=&quot;intro&quot;&gt;iPhone is a revolutionary new mobile phone that allows you to make a call by simply tapping a name or number in your address book, a favorites list, or a call log. It also automatically syncs all your contacts from a PC, Mac, or Internet service. And it lets you select and listen to voicemail messages in whatever order you want just like email.&lt;/p&gt;\r\n', '', '', '', '', '', ''),
(28, 1, 'HTC Touch HD', '&lt;p&gt;HTC Touch - in High Definition. Watch music videos and streaming content in awe-inspiring high definition clarity for a mobile experience you never thought possible. Seductively sleek, the HTC Touch HD provides the next generation of mobile functionality, all at a simple touch. Fully integrated with Windows Mobile Professional 6.1, ultrafast 3.5G, GPS, 5MP camera, plus lots more - all delivered on a breathtakingly crisp 3.8&quot; WVGA touchscreen - you can take control of your mobile world with the HTC Touch HD.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Features&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Processor Qualcomm® MSM 7201A™ 528 MHz&lt;/li&gt;\r\n	&lt;li&gt;Windows Mobile® 6.1 Professional Operating System&lt;/li&gt;\r\n	&lt;li&gt;Memory: 512 MB ROM, 288 MB RAM&lt;/li&gt;\r\n	&lt;li&gt;Dimensions: 115 mm x 62.8 mm x 12 mm / 146.4 grams&lt;/li&gt;\r\n	&lt;li&gt;3.8-inch TFT-LCD flat touch-sensitive screen with 480 x 800 WVGA resolution&lt;/li&gt;\r\n	&lt;li&gt;HSDPA/WCDMA: Europe/Asia: 900/2100 MHz; Up to 2 Mbps up-link and 7.2 Mbps down-link speeds&lt;/li&gt;\r\n	&lt;li&gt;Quad-band GSM/GPRS/EDGE: Europe/Asia: 850/900/1800/1900 MHz (Band frequency, HSUPA availability, and data speed are operator dependent.)&lt;/li&gt;\r\n	&lt;li&gt;Device Control via HTC TouchFLO™ 3D &amp;amp; Touch-sensitive front panel buttons&lt;/li&gt;\r\n	&lt;li&gt;GPS and A-GPS ready&lt;/li&gt;\r\n	&lt;li&gt;Bluetooth® 2.0 with Enhanced Data Rate and A2DP for wireless stereo headsets&lt;/li&gt;\r\n	&lt;li&gt;Wi-Fi®: IEEE 802.11 b/g&lt;/li&gt;\r\n	&lt;li&gt;HTC ExtUSB™ (11-pin mini-USB 2.0)&lt;/li&gt;\r\n	&lt;li&gt;5 megapixel color camera with auto focus&lt;/li&gt;\r\n	&lt;li&gt;VGA CMOS color camera&lt;/li&gt;\r\n	&lt;li&gt;Built-in 3.5 mm audio jack, microphone, speaker, and FM radio&lt;/li&gt;\r\n	&lt;li&gt;Ring tone formats: AAC, AAC+, eAAC+, AMR-NB, AMR-WB, QCP, MP3, WMA, WAV&lt;/li&gt;\r\n	&lt;li&gt;40 polyphonic and standard MIDI format 0 and 1 (SMF)/SP MIDI&lt;/li&gt;\r\n	&lt;li&gt;Rechargeable Lithium-ion or Lithium-ion polymer 1350 mAh battery&lt;/li&gt;\r\n	&lt;li&gt;Expansion Slot: microSD™ memory card (SD 2.0 compatible)&lt;/li&gt;\r\n	&lt;li&gt;AC Adapter Voltage range/frequency: 100 ~ 240V AC, 50/60 Hz DC output: 5V and 1A&lt;/li&gt;\r\n	&lt;li&gt;Special Features: FM Radio, G-Sensor&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', '', '', '', '', ''),
(28, 2, 'HTC Touch HD', '&lt;p&gt;HTC Touch - in High Definition. Watch music videos and streaming content in awe-inspiring high definition clarity for a mobile experience you never thought possible. Seductively sleek, the HTC Touch HD provides the next generation of mobile functionality, all at a simple touch. Fully integrated with Windows Mobile Professional 6.1, ultrafast 3.5G, GPS, 5MP camera, plus lots more - all delivered on a breathtakingly crisp 3.8&quot; WVGA touchscreen - you can take control of your mobile world with the HTC Touch HD.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Features&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Processor Qualcomm® MSM 7201A™ 528 MHz&lt;/li&gt;\r\n	&lt;li&gt;Windows Mobile® 6.1 Professional Operating System&lt;/li&gt;\r\n	&lt;li&gt;Memory: 512 MB ROM, 288 MB RAM&lt;/li&gt;\r\n	&lt;li&gt;Dimensions: 115 mm x 62.8 mm x 12 mm / 146.4 grams&lt;/li&gt;\r\n	&lt;li&gt;3.8-inch TFT-LCD flat touch-sensitive screen with 480 x 800 WVGA resolution&lt;/li&gt;\r\n	&lt;li&gt;HSDPA/WCDMA: Europe/Asia: 900/2100 MHz; Up to 2 Mbps up-link and 7.2 Mbps down-link speeds&lt;/li&gt;\r\n	&lt;li&gt;Quad-band GSM/GPRS/EDGE: Europe/Asia: 850/900/1800/1900 MHz (Band frequency, HSUPA availability, and data speed are operator dependent.)&lt;/li&gt;\r\n	&lt;li&gt;Device Control via HTC TouchFLO™ 3D &amp;amp; Touch-sensitive front panel buttons&lt;/li&gt;\r\n	&lt;li&gt;GPS and A-GPS ready&lt;/li&gt;\r\n	&lt;li&gt;Bluetooth® 2.0 with Enhanced Data Rate and A2DP for wireless stereo headsets&lt;/li&gt;\r\n	&lt;li&gt;Wi-Fi®: IEEE 802.11 b/g&lt;/li&gt;\r\n	&lt;li&gt;HTC ExtUSB™ (11-pin mini-USB 2.0)&lt;/li&gt;\r\n	&lt;li&gt;5 megapixel color camera with auto focus&lt;/li&gt;\r\n	&lt;li&gt;VGA CMOS color camera&lt;/li&gt;\r\n	&lt;li&gt;Built-in 3.5 mm audio jack, microphone, speaker, and FM radio&lt;/li&gt;\r\n	&lt;li&gt;Ring tone formats: AAC, AAC+, eAAC+, AMR-NB, AMR-WB, QCP, MP3, WMA, WAV&lt;/li&gt;\r\n	&lt;li&gt;40 polyphonic and standard MIDI format 0 and 1 (SMF)/SP MIDI&lt;/li&gt;\r\n	&lt;li&gt;Rechargeable Lithium-ion or Lithium-ion polymer 1350 mAh battery&lt;/li&gt;\r\n	&lt;li&gt;Expansion Slot: microSD™ memory card (SD 2.0 compatible)&lt;/li&gt;\r\n	&lt;li&gt;AC Adapter Voltage range/frequency: 100 ~ 240V AC, 50/60 Hz DC output: 5V and 1A&lt;/li&gt;\r\n	&lt;li&gt;Special Features: FM Radio, G-Sensor&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', '', '', '', '', ''),
(44, 1, 'MacBook Air', '&lt;div&gt;MacBook Air is ultrathin, ultraportable, and ultra unlike anything else. But you don’t lose inches and pounds overnight. It’s the result of rethinking conventions. Of multiple wireless innovations. And of breakthrough design. With MacBook Air, mobile computing suddenly has a new standard.&lt;/div&gt;\r\n', '', '', '', '', '', ''),
(45, 1, 'MacBook Pro', '&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n&lt;div&gt;\r\n&lt;p&gt;&lt;b&gt;Latest Intel mobile architecture&lt;/b&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Powered by the most advanced mobile processors from Intel, the new Core 2 Duo MacBook Pro is over 50% faster than the original Core Duo MacBook Pro and now supports up to 4GB of RAM.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;b&gt;Leading-edge graphics&lt;/b&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;The NVIDIA GeForce 8600M GT delivers exceptional graphics processing power. For the ultimate creative canvas, you can even configure the 17-inch model with a 1920-by-1200 resolution display.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;b&gt;Designed for life on the road&lt;/b&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Innovations such as a magnetic power connection and an illuminated keyboard with ambient light sensor put the MacBook Pro in a class by itself.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;b&gt;Connect. Create. Communicate.&lt;/b&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Quickly set up a video conference with the built-in iSight camera. Control presentations and media from up to 30 feet away with the included Apple Remote. Connect to high-bandwidth peripherals with FireWire 800 and DVI.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;b&gt;Next-generation wireless&lt;/b&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Featuring 802.11n wireless technology, the MacBook Pro delivers up to five times the performance and up to twice the range of previous-generation technologies.&lt;/p&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;', '', '', '', '', '', ''),
(45, 2, 'MacBook Pro', '&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n&lt;div&gt;\r\n&lt;p&gt;&lt;b&gt;Latest Intel mobile architecture&lt;/b&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Powered by the most advanced mobile processors from Intel, the new Core 2 Duo MacBook Pro is over 50% faster than the original Core Duo MacBook Pro and now supports up to 4GB of RAM.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;b&gt;Leading-edge graphics&lt;/b&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;The NVIDIA GeForce 8600M GT delivers exceptional graphics processing power. For the ultimate creative canvas, you can even configure the 17-inch model with a 1920-by-1200 resolution display.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;b&gt;Designed for life on the road&lt;/b&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Innovations such as a magnetic power connection and an illuminated keyboard with ambient light sensor put the MacBook Pro in a class by itself.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;b&gt;Connect. Create. Communicate.&lt;/b&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Quickly set up a video conference with the built-in iSight camera. Control presentations and media from up to 30 feet away with the included Apple Remote. Connect to high-bandwidth peripherals with FireWire 800 and DVI.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;b&gt;Next-generation wireless&lt;/b&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Featuring 802.11n wireless technology, the MacBook Pro delivers up to five times the performance and up to twice the range of previous-generation technologies.&lt;/p&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;', '', '', '', '', '', ''),
(29, 1, 'Palm Treo Pro', '&lt;p&gt;Redefine your workday with the Palm Treo Pro smartphone. Perfectly balanced, you can respond to business and personal email, stay on top of appointments and contacts, and use Wi-Fi or GPS when you’re out and about. Then watch a video on YouTube, catch up with news and sports on the web, or listen to a few songs. Balance your work and play the way you like it, with the Palm Treo Pro.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Features&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Windows Mobile® 6.1 Professional Edition&lt;/li&gt;\r\n	&lt;li&gt;Qualcomm® MSM7201 400MHz Processor&lt;/li&gt;\r\n	&lt;li&gt;320x320 transflective colour TFT touchscreen&lt;/li&gt;\r\n	&lt;li&gt;HSDPA/UMTS/EDGE/GPRS/GSM radio&lt;/li&gt;\r\n	&lt;li&gt;Tri-band UMTS — 850MHz, 1900MHz, 2100MHz&lt;/li&gt;\r\n	&lt;li&gt;Quad-band GSM — 850/900/1800/1900&lt;/li&gt;\r\n	&lt;li&gt;802.11b/g with WPA, WPA2, and 801.1x authentication&lt;/li&gt;\r\n	&lt;li&gt;Built-in GPS&lt;/li&gt;\r\n	&lt;li&gt;Bluetooth Version: 2.0 + Enhanced Data Rate&lt;/li&gt;\r\n	&lt;li&gt;256MB storage (100MB user available), 128MB RAM&lt;/li&gt;\r\n	&lt;li&gt;2.0 megapixel camera, up to 8x digital zoom and video capture&lt;/li&gt;\r\n	&lt;li&gt;Removable, rechargeable 1500mAh lithium-ion battery&lt;/li&gt;\r\n	&lt;li&gt;Up to 5.0 hours talk time and up to 250 hours standby&lt;/li&gt;\r\n	&lt;li&gt;MicroSDHC card expansion (up to 32GB supported)&lt;/li&gt;\r\n	&lt;li&gt;MicroUSB 2.0 for synchronization and charging&lt;/li&gt;\r\n	&lt;li&gt;3.5mm stereo headset jack&lt;/li&gt;\r\n	&lt;li&gt;60mm (W) x 114mm (L) x 13.5mm (D) / 133g&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', '', '', '', '', ''),
(29, 2, 'Palm Treo Pro', '&lt;p&gt;Redefine your workday with the Palm Treo Pro smartphone. Perfectly balanced, you can respond to business and personal email, stay on top of appointments and contacts, and use Wi-Fi or GPS when you’re out and about. Then watch a video on YouTube, catch up with news and sports on the web, or listen to a few songs. Balance your work and play the way you like it, with the Palm Treo Pro.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Features&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Windows Mobile® 6.1 Professional Edition&lt;/li&gt;\r\n	&lt;li&gt;Qualcomm® MSM7201 400MHz Processor&lt;/li&gt;\r\n	&lt;li&gt;320x320 transflective colour TFT touchscreen&lt;/li&gt;\r\n	&lt;li&gt;HSDPA/UMTS/EDGE/GPRS/GSM radio&lt;/li&gt;\r\n	&lt;li&gt;Tri-band UMTS — 850MHz, 1900MHz, 2100MHz&lt;/li&gt;\r\n	&lt;li&gt;Quad-band GSM — 850/900/1800/1900&lt;/li&gt;\r\n	&lt;li&gt;802.11b/g with WPA, WPA2, and 801.1x authentication&lt;/li&gt;\r\n	&lt;li&gt;Built-in GPS&lt;/li&gt;\r\n	&lt;li&gt;Bluetooth Version: 2.0 + Enhanced Data Rate&lt;/li&gt;\r\n	&lt;li&gt;256MB storage (100MB user available), 128MB RAM&lt;/li&gt;\r\n	&lt;li&gt;2.0 megapixel camera, up to 8x digital zoom and video capture&lt;/li&gt;\r\n	&lt;li&gt;Removable, rechargeable 1500mAh lithium-ion battery&lt;/li&gt;\r\n	&lt;li&gt;Up to 5.0 hours talk time and up to 250 hours standby&lt;/li&gt;\r\n	&lt;li&gt;MicroSDHC card expansion (up to 32GB supported)&lt;/li&gt;\r\n	&lt;li&gt;MicroUSB 2.0 for synchronization and charging&lt;/li&gt;\r\n	&lt;li&gt;3.5mm stereo headset jack&lt;/li&gt;\r\n	&lt;li&gt;60mm (W) x 114mm (L) x 13.5mm (D) / 133g&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', '', '', '', '', ''),
(36, 1, 'iPod Nano', '&lt;div&gt;\r\n&lt;p&gt;&lt;strong&gt;Video in your pocket.&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Its the small iPod with one very big idea: video. The worlds most popular music player now lets you enjoy movies, TV shows, and more on a two-inch display thats 65% brighter than before.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Cover Flow.&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Browse through your music collection by flipping through album art. Select an album to turn it over and see the track list.&lt;strong&gt;&amp;nbsp;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Enhanced interface.&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Experience a whole new way to browse and view your music and video.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Sleek and colorful.&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;With an anodized aluminum and polished stainless steel enclosure and a choice of five colors, iPod nano is dressed to impress.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;iTunes.&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Available as a free download, iTunes makes it easy to browse and buy millions of songs, movies, TV shows, audiobooks, and games and download free podcasts all at the iTunes Store. And you can import your own music, manage your whole media library, and sync your iPod or iPhone with ease.&lt;/p&gt;\r\n&lt;/div&gt;\r\n', '', '', '', '', '', ''),
(46, 1, 'Sony VAIO', '&lt;div&gt;Unprecedented power. The next generation of processing technology has arrived. Built into the newest VAIO notebooks lies Intel''s latest, most powerful innovation yet: Intel® Centrino® 2 processor technology. Boasting incredible speed, expanded wireless connectivity, enhanced multimedia support and greater energy efficiency, all the high-performance essentials are seamlessly combined into a single chip.&lt;/div&gt;\r\n', '', '', '', '', '', ''),
(47, 1, 'HP LP3065', '&lt;p&gt;Stop your co-workers in their tracks with the stunning new 30-inch diagonal HP LP3065 Flat Panel Monitor. This flagship monitor features best-in-class performance and presentation features on a huge wide-aspect screen while letting you work as comfortably as possible - you might even forget you''re at the office&lt;/p&gt;\r\n', '', '', '', '', '', ''),
(32, 2, 'iPod Touch', '&lt;p&gt;&lt;strong&gt;Revolutionary multi-touch interface.&lt;/strong&gt;&lt;br /&gt;\r\niPod touch features the same multi-touch screen technology as iPhone. Pinch to zoom in on a photo. Scroll through your songs and videos with a flick. Flip through your library by album artwork with Cover Flow.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Gorgeous 3.5-inch widescreen display.&lt;/strong&gt;&lt;br /&gt;\r\nWatch your movies, TV shows, and photos come alive with bright, vivid color on the 320-by-480-pixel display.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Music downloads straight from iTunes.&lt;/strong&gt;&lt;br /&gt;\r\nShop the iTunes Wi-Fi Music Store from anywhere with Wi-Fi.1 Browse or search to find the music youre looking for, preview it, and buy it with just a tap.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Surf the web with Wi-Fi.&lt;/strong&gt;&lt;br /&gt;\r\nBrowse the web using Safari and watch YouTube videos on the first iPod with Wi-Fi built in&lt;br /&gt;\r\n&amp;nbsp;&lt;/p&gt;\r\n', '', '', '', '', '', ''),
(41, 1, 'iMac', '&lt;div&gt;Just when you thought iMac had everything, now there’s even more. More powerful Intel Core 2 Duo processors. And more memory standard. Combine this with Mac OS X Leopard and iLife ’08, and it’s more all-in-one than ever. iMac packs amazing performance into a stunningly slim space.&lt;/div&gt;\r\n', '', '', '', '', '', ''),
(33, 1, 'Samsung SyncMaster 941BW', '&lt;div&gt;Imagine the advantages of going big without slowing down. The big 19&quot; 941BW monitor combines wide aspect ratio with fast pixel response time, for bigger images, more room to work and crisp motion. In addition, the exclusive MagicBright 2, MagicColor and MagicTune technologies help deliver the ideal image in every situation, while sleek, narrow bezels and adjustable stands deliver style just the way you want it. With the Samsung 941BW widescreen analog/digital LCD monitor, it''s not hard to imagine.&lt;/div&gt;\r\n', '', '', '', '', '', ''),
(34, 1, 'iPod Shuffle', '&lt;div&gt;&lt;strong&gt;Born to be worn.&lt;/strong&gt;\r\n&lt;p&gt;Clip on the worlds most wearable music player and take up to 240 songs with you anywhere. Choose from five colors including four new hues to make your musical fashion statement.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Random meets rhythm.&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;With iTunes autofill, iPod shuffle can deliver a new musical experience every time you sync. For more randomness, you can shuffle songs during playback with the slide of a switch.&lt;/p&gt;\r\n&lt;strong&gt;Everything is easy.&lt;/strong&gt;\r\n\r\n&lt;p&gt;Charge and sync with the included USB dock. Operate the iPod shuffle controls with one hand. Enjoy up to 12 hours straight of skip-free music playback.&lt;/p&gt;\r\n&lt;/div&gt;\r\n', '', '', '', '', '', ''),
(43, 1, 'MacBook', '&lt;div&gt;\r\n&lt;p&gt;&lt;b&gt;Intel Core 2 Duo processor&lt;/b&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Powered by an Intel Core 2 Duo processor at speeds up to 2.16GHz, the new MacBook is the fastest ever.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;b&gt;1GB memory, larger hard drives&lt;/b&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;The new MacBook now comes with 1GB of memory standard and larger hard drives for the entire line perfect for running more of your favorite applications and storing growing media collections.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;b&gt;Sleek, 1.08-inch-thin design&lt;/b&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;MacBook makes it easy to hit the road thanks to its tough polycarbonate case, built-in wireless technologies, and innovative MagSafe Power Adapter that releases automatically if someone accidentally trips on the cord.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;b&gt;Built-in iSight camera&lt;/b&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Right out of the box, you can have a video chat with friends or family,2 record a video at your desk, or take fun pictures with Photo Booth&lt;/p&gt;\r\n&lt;/div&gt;\r\n', '', '', '', '', '', '');
INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `description_mini`, `meta_description`, `meta_keyword`, `seo_title`, `seo_h1`, `tag`) VALUES
(31, 1, 'Nikon D300', '&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n&lt;div&gt;Engineered with pro-level features and performance, the 12.3-effective-megapixel D300 combines brand new technologies with advanced features inherited from Nikon''s newly announced D3 professional digital SLR camera to offer serious photographers remarkable performance combined with agility.&lt;br /&gt;\r\n&lt;br /&gt;\r\nSimilar to the D3, the D300 features Nikon''s exclusive EXPEED Image Processing System that is central to driving the speed and processing power needed for many of the camera''s new features. The D300 features a new 51-point autofocus system with Nikon''s 3D Focus Tracking feature and two new LiveView shooting modes that allow users to frame a photograph using the camera''s high-resolution LCD monitor. The D300 shares a similar Scene Recognition System as is found in the D3; it promises to greatly enhance the accuracy of autofocus, autoexposure, and auto white balance by recognizing the subject or scene being photographed and applying this information to the calculations for the three functions.&lt;br /&gt;\r\n&lt;br /&gt;\r\nThe D300 reacts with lightning speed, powering up in a mere 0.13 seconds and shooting with an imperceptible 45-millisecond shutter release lag time. The D300 is capable of shooting at a rapid six frames per second and can go as fast as eight frames per second when using the optional MB-D10 multi-power battery pack. In continuous bursts, the D300 can shoot up to 100 shots at full 12.3-megapixel resolution. (NORMAL-LARGE image setting, using a SanDisk Extreme IV 1GB CompactFlash card.)&lt;br /&gt;\r\n&lt;br /&gt;\r\nThe D300 incorporates a range of innovative technologies and features that will significantly improve the accuracy, control, and performance photographers can get from their equipment. Its new Scene Recognition System advances the use of Nikon''s acclaimed 1,005-segment sensor to recognize colors and light patterns that help the camera determine the subject and the type of scene being photographed before a picture is taken. This information is used to improve the accuracy of autofocus, autoexposure, and auto white balance functions in the D300. For example, the camera can track moving subjects better and by identifying them, it can also automatically select focus points faster and with greater accuracy. It can also analyze highlights and more accurately determine exposure, as well as infer light sources to deliver more accurate white balance detection.&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;', '', '', '', '', '', ''),
(31, 2, 'Nikon D300', '&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n&lt;div&gt;Engineered with pro-level features and performance, the 12.3-effective-megapixel D300 combines brand new technologies with advanced features inherited from Nikon''s newly announced D3 professional digital SLR camera to offer serious photographers remarkable performance combined with agility.&lt;br /&gt;\r\n&lt;br /&gt;\r\nSimilar to the D3, the D300 features Nikon''s exclusive EXPEED Image Processing System that is central to driving the speed and processing power needed for many of the camera''s new features. The D300 features a new 51-point autofocus system with Nikon''s 3D Focus Tracking feature and two new LiveView shooting modes that allow users to frame a photograph using the camera''s high-resolution LCD monitor. The D300 shares a similar Scene Recognition System as is found in the D3; it promises to greatly enhance the accuracy of autofocus, autoexposure, and auto white balance by recognizing the subject or scene being photographed and applying this information to the calculations for the three functions.&lt;br /&gt;\r\n&lt;br /&gt;\r\nThe D300 reacts with lightning speed, powering up in a mere 0.13 seconds and shooting with an imperceptible 45-millisecond shutter release lag time. The D300 is capable of shooting at a rapid six frames per second and can go as fast as eight frames per second when using the optional MB-D10 multi-power battery pack. In continuous bursts, the D300 can shoot up to 100 shots at full 12.3-megapixel resolution. (NORMAL-LARGE image setting, using a SanDisk Extreme IV 1GB CompactFlash card.)&lt;br /&gt;\r\n&lt;br /&gt;\r\nThe D300 incorporates a range of innovative technologies and features that will significantly improve the accuracy, control, and performance photographers can get from their equipment. Its new Scene Recognition System advances the use of Nikon''s acclaimed 1,005-segment sensor to recognize colors and light patterns that help the camera determine the subject and the type of scene being photographed before a picture is taken. This information is used to improve the accuracy of autofocus, autoexposure, and auto white balance functions in the D300. For example, the camera can track moving subjects better and by identifying them, it can also automatically select focus points faster and with greater accuracy. It can also analyze highlights and more accurately determine exposure, as well as infer light sources to deliver more accurate white balance detection.&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;', '', '', '', '', '', ''),
(49, 1, 'Samsung Galaxy Tab 10.1', '&lt;p&gt;Samsung Galaxy Tab 10.1, is the world’s thinnest tablet, measuring 8.6 mm thickness, running with Android 3.0 Honeycomb OS on a 1GHz dual-core Tegra 2 processor, similar to its younger brother Samsung Galaxy Tab 8.9.&lt;/p&gt;\r\n\r\n&lt;p&gt;Samsung Galaxy Tab 10.1 gives pure Android 3.0 experience, adding its new TouchWiz UX or TouchWiz 4.0 – includes a live panel, which lets you to customize with different content, such as your pictures, bookmarks, and social feeds, sporting a 10.1 inches WXGA capacitive touch screen with 1280 x 800 pixels of resolution, equipped with 3 megapixel rear camera with LED flash and a 2 megapixel front camera, HSPA+ connectivity up to 21Mbps, 720p HD video recording capability, 1080p HD playback, DLNA support, Bluetooth 2.1, USB 2.0, gyroscope, Wi-Fi 802.11 a/b/g/n, micro-SD slot, 3.5mm headphone jack, and SIM slot, including the Samsung Stick – a Bluetooth microphone that can be carried in a pocket like a pen and sound dock with powered subwoofer.&lt;/p&gt;\r\n\r\n&lt;p&gt;Samsung Galaxy Tab 10.1 will come in 16GB / 32GB / 64GB verities and pre-loaded with Social Hub, Reader’s Hub, Music Hub and Samsung Mini Apps Tray – which gives you access to more commonly used apps to help ease multitasking and it is capable of Adobe Flash Player 10.2, powered by 6860mAh battery that gives you 10hours of video-playback time.&amp;nbsp;äö&lt;/p&gt;\r\n', '', '', '', '', '', ''),
(49, 2, 'Samsung Galaxy Tab 10.1', '&lt;p&gt;Samsung Galaxy Tab 10.1, is the world’s thinnest tablet, measuring 8.6 mm thickness, running with Android 3.0 Honeycomb OS on a 1GHz dual-core Tegra 2 processor, similar to its younger brother Samsung Galaxy Tab 8.9.&lt;/p&gt;\r\n\r\n&lt;p&gt;Samsung Galaxy Tab 10.1 gives pure Android 3.0 experience, adding its new TouchWiz UX or TouchWiz 4.0 – includes a live panel, which lets you to customize with different content, such as your pictures, bookmarks, and social feeds, sporting a 10.1 inches WXGA capacitive touch screen with 1280 x 800 pixels of resolution, equipped with 3 megapixel rear camera with LED flash and a 2 megapixel front camera, HSPA+ connectivity up to 21Mbps, 720p HD video recording capability, 1080p HD playback, DLNA support, Bluetooth 2.1, USB 2.0, gyroscope, Wi-Fi 802.11 a/b/g/n, micro-SD slot, 3.5mm headphone jack, and SIM slot, including the Samsung Stick – a Bluetooth microphone that can be carried in a pocket like a pen and sound dock with powered subwoofer.&lt;/p&gt;\r\n\r\n&lt;p&gt;Samsung Galaxy Tab 10.1 will come in 16GB / 32GB / 64GB verities and pre-loaded with Social Hub, Reader’s Hub, Music Hub and Samsung Mini Apps Tray – which gives you access to more commonly used apps to help ease multitasking and it is capable of Adobe Flash Player 10.2, powered by 6860mAh battery that gives you 10hours of video-playback time.&amp;nbsp;äö&lt;/p&gt;\r\n', '', '', '', '', '', ''),
(30, 1, 'Canon EOS 5D', '&lt;p&gt;Canon''s press material for the EOS 5D states that it ''defines (a) new D-SLR category'', while we''re not typically too concerned with marketing talk this particular statement is clearly pretty accurate. The EOS 5D is unlike any previous digital SLR in that it combines a full-frame (35 mm sized) high resolution sensor (12.8 megapixels) with a relatively compact body (slightly larger than the EOS 20D, although in your hand it feels noticeably ''chunkier''). The EOS 5D is aimed to slot in between the EOS 20D and the EOS-1D professional digital SLR''s, an important difference when compared to the latter is that the EOS 5D doesn''t have any environmental seals. While Canon don''t specifically refer to the EOS 5D as a ''professional'' digital SLR it will have obvious appeal to professionals who want a high quality digital SLR in a body lighter than the EOS-1D. It will also no doubt appeal to current EOS 20D owners (although lets hope they''ve not bought too many EF-S lenses...) ??&lt;/p&gt;\r\n', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_discount`
--

DROP TABLE IF EXISTS `oc_product_discount`;
CREATE TABLE `oc_product_discount` (
  `product_discount_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`product_discount_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_product_discount`
--

INSERT INTO `oc_product_discount` (`product_discount_id`, `product_id`, `customer_group_id`, `quantity`, `priority`, `price`, `date_start`, `date_end`) VALUES
(446, 42, 1, 30, 1, 66.0000, '0000-00-00', '0000-00-00'),
(445, 42, 1, 20, 1, 77.0000, '0000-00-00', '0000-00-00'),
(444, 42, 1, 10, 1, 88.0000, '0000-00-00', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_filter`
--

DROP TABLE IF EXISTS `oc_product_filter`;
CREATE TABLE `oc_product_filter` (
  `product_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_product_filter`
--

INSERT INTO `oc_product_filter` (`product_id`, `filter_id`) VALUES
(42, 4);

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_image`
--

DROP TABLE IF EXISTS `oc_product_image`;
CREATE TABLE `oc_product_image` (
  `product_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_image_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_product_image`
--

INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES
(2385, 34, 'data/promo/John Lewis Dome Pedal Bin/John Lewis Dome Pedal Bin 2 copy.png', 2),
(2430, 32, 'data/promo/John Lewis Funky Napkin Holder/John Lewis Funky Napkin Holder 3 copy.png', 3),
(2405, 31, 'data/promo/LG Refrigerator/LG Refrigerator - Floral collection T676 2.png', 2),
(2377, 48, 'data/promo/Hood/Hood CDA EVCK4SS 40cm Cylinder 3.png', 2),
(2459, 40, 'data/promo/Hood/Hood Faber Klima - black 2.png', 3),
(2356, 30, 'data/promo/Coffee Machine Bugatti Diva/Coffee Machine Bugatti Diva 1.png', 1),
(2360, 47, 'data/promo/Coffee Machine Malongo Espresso-gold/Coffee Machine Malongo Espresso-gold 1.png', 1),
(2364, 28, 'data/promo/Coffee Maker Bosch Assimo/Coffee Maker Bosch Assimo 2.png', 1),
(2368, 41, 'data/promo/Hamilton Beach 72703 Ensemble 3 Cup Chopper/Hamilton Beach 72703 Ensemble 3 Cup Chopper 1.png', 1),
(2457, 40, 'data/promo/Hood/Hood CDA EVCK4SS 40cm Cylinder 3.png', 4),
(2376, 48, 'data/promo/Hood/Hood CDA EVCK4SS 40cm Cylinder 1.png', 1),
(2380, 36, 'data/promo/John Lewis Classic II Universal Steamer and Lid/John Lewis Classic II Universal Steamer and Lid 1 copy.png', 1),
(2384, 34, 'data/promo/John Lewis Dome Pedal Bin/John Lewis Dome Pedal Bin 3 copy.png', 1),
(2431, 32, 'data/promo/John Lewis Funky Napkin Holder/John Lewis Funky Napkin Holder 2 copy.png', 4),
(2392, 43, 'data/promo/John Lewis Value Plastic Cutlery Drainer/John Lewis Value Plastic Cutlery Drainer 3 copy.png', 1),
(2396, 44, 'data/promo/Joseph Joseph Nest Food Preparation Set/Joseph Joseph Nest Food Preparation Set 3 copy.png', 1),
(2400, 45, 'data/promo/Kalorik Meat Grinder MGR25959 Stainless Steel Blade/Kalorik Meat Grinder MGR25959 Stainless Steel Blade 1.png', 1),
(2404, 31, 'data/promo/LG Refrigerator/LG Refrigerator - Floral collection T676 1.png', 1),
(2408, 29, 'data/promo/Coffee Machine Malongo Espresso-gold/Coffee Machine Malongo Espresso-gold 1.png', 1),
(2420, 46, 'data/promo/John Lewis Funky Napkin Holder/John Lewis Funky Napkin Holder 1 copy.png', 1),
(2413, 49, 'data/promo/Coffee Maker Bosch Assimo/Coffee Maker Bosch Assimo 2.png', 2),
(2412, 49, 'data/promo/Coffee Maker Bosch Assimo/Coffee Maker Bosch Assimo 1.png', 1),
(2435, 42, 'data/promo/Bugatti Uma Electronic Kitchen Scale and Timer/Bugatti Uma Electronic Kitchen Scale and Timer 2 copy.png', 4),
(2434, 42, 'data/promo/Bugatti Uma Electronic Kitchen Scale and Timer/Bugatti Uma Electronic Kitchen Scale and Timer 3 copy.png', 3),
(2433, 42, 'data/promo/Bugatti Uma Electronic Kitchen Scale and Timer/Bugatti Uma Electronic Kitchen Scale and Timer 2 copy.png', 2),
(2432, 42, 'data/promo/Bugatti Uma Electronic Kitchen Scale and Timer/Bugatti Uma Electronic Kitchen Scale and Timer 1 copy.png', 1),
(2357, 30, 'data/promo/Coffee Machine Bugatti Diva/Coffee Machine Bugatti Diva 2.png', 2),
(2358, 30, 'data/promo/Coffee Machine Bugatti Diva/Coffee Machine Bugatti Diva 3.png', 3),
(2359, 30, 'data/promo/Coffee Machine Bugatti Diva/Coffee Machine Bugatti Diva 2.png', 4),
(2361, 47, 'data/promo/Coffee Machine Malongo Espresso-gold/Coffee Machine Malongo Espresso-gold 2.png', 2),
(2362, 47, 'data/promo/Coffee Machine Malongo Espresso-gold/Coffee Machine Malongo Espresso-gold 3.png', 3),
(2363, 47, 'data/promo/Coffee Machine Malongo Espresso-gold/Coffee Machine Malongo Espresso-gold 2.png', 4),
(2365, 28, 'data/promo/Coffee Maker Bosch Assimo/Coffee Maker Bosch Assimo 1.png', 2),
(2366, 28, 'data/promo/Coffee Maker Bosch Assimo/Coffee Maker Bosch Assimo 3.png', 3),
(2367, 28, 'data/promo/Coffee Maker Bosch Assimo/Coffee Maker Bosch Assimo 1.png', 4),
(2369, 41, 'data/promo/Hamilton Beach 72703 Ensemble 3 Cup Chopper/Hamilton Beach 72703 Ensemble 3 Cup Chopper 2.png', 2),
(2370, 41, 'data/promo/Hamilton Beach 72703 Ensemble 3 Cup Chopper/Hamilton Beach 72703 Ensemble 3 Cup Chopper 3.png', 3),
(2371, 41, 'data/promo/Hamilton Beach 72703 Ensemble 3 Cup Chopper/Hamilton Beach 72703 Ensemble 3 Cup Chopper 2.png', 0),
(2458, 40, 'data/promo/Hood/Hood CDA EVCK4SS 40cm Cylinder 3.png', 2),
(2456, 40, 'data/promo/Hood/Hood Scholtes HSE 159 IX 1.png', 1),
(2378, 48, 'data/promo/Hood/Hood Faber Klima - black 2.png', 3),
(2379, 48, 'data/promo/Hood/Hood CDA EVCK4SS 40cm Cylinder 3.png', 4),
(2381, 36, 'data/promo/John Lewis Classic II Universal Steamer and Lid/John Lewis Classic II Universal Steamer and Lid 2 copy.png', 2),
(2382, 36, 'data/promo/John Lewis Classic II Universal Steamer and Lid/John Lewis Classic II Universal Steamer and Lid 3 copy.png', 3),
(2383, 36, 'data/promo/John Lewis Classic II Universal Steamer and Lid/John Lewis Classic II Universal Steamer and Lid 2 copy.png', 4),
(2386, 34, 'data/promo/John Lewis Dome Pedal Bin/John Lewis Dome Pedal Bin 1 copy.png', 3),
(2387, 34, 'data/promo/John Lewis Dome Pedal Bin/John Lewis Dome Pedal Bin 2 copy.png', 4),
(2429, 32, 'data/promo/John Lewis Funky Napkin Holder/John Lewis Funky Napkin Holder 1 copy.png', 1),
(2428, 32, 'data/promo/John Lewis Funky Napkin Holder/John Lewis Funky Napkin Holder 2 copy.png', 2),
(2393, 43, 'data/promo/John Lewis Value Plastic Cutlery Drainer/John Lewis Value Plastic Cutlery Drainer 2 copy.png', 2),
(2394, 43, 'data/promo/John Lewis Value Plastic Cutlery Drainer/John Lewis Value Plastic Cutlery Drainer 1 copy.png', 3),
(2395, 43, 'data/promo/John Lewis Value Plastic Cutlery Drainer/John Lewis Value Plastic Cutlery Drainer 2 copy.png', 4),
(2397, 44, 'data/promo/Joseph Joseph Nest Food Preparation Set/Joseph Joseph Nest Food Preparation Set 2 copy.png', 2),
(2398, 44, 'data/promo/Joseph Joseph Nest Food Preparation Set/Joseph Joseph Nest Food Preparation Set 1 copy.png', 3),
(2399, 44, 'data/promo/Joseph Joseph Nest Food Preparation Set/Joseph Joseph Nest Food Preparation Set 2 copy.png', 4),
(2401, 45, 'data/promo/Kalorik Meat Grinder MGR25959 Stainless Steel Blade/Kalorik Meat Grinder MGR25959 Stainless Steel Blade 2.png', 2),
(2402, 45, 'data/promo/Kalorik Meat Grinder MGR25959 Stainless Steel Blade/Kalorik Meat Grinder MGR25959 Stainless Steel Blade 3.png', 3),
(2403, 45, 'data/promo/Kalorik Meat Grinder MGR25959 Stainless Steel Blade/Kalorik Meat Grinder MGR25959 Stainless Steel Blade 2.png', 4),
(2406, 31, 'data/promo/LG Refrigerator/LG Refrigerator - Floral collection T676 3.png', 3),
(2407, 31, 'data/promo/LG Refrigerator/LG Refrigerator - Floral collection T676 2.png', 4),
(2409, 29, 'data/promo/Coffee Machine Malongo Espresso-gold/Coffee Machine Malongo Espresso-gold 2.png', 2),
(2410, 29, 'data/promo/Coffee Machine Malongo Espresso-gold/Coffee Machine Malongo Espresso-gold 3.png', 3),
(2411, 29, 'data/promo/Coffee Machine Malongo Espresso-gold/Coffee Machine Malongo Espresso-gold 2.png', 4),
(2414, 49, 'data/promo/Coffee Maker Bosch Assimo/Coffee Maker Bosch Assimo 3.png', 3),
(2415, 49, 'data/promo/Coffee Maker Bosch Assimo/Coffee Maker Bosch Assimo 2.png', 4),
(2416, 33, 'data/promo/John Lewis Classic II Universal Steamer and Lid/John Lewis Classic II Universal Steamer and Lid 1 copy.png', 1),
(2417, 33, 'data/promo/John Lewis Classic II Universal Steamer and Lid/John Lewis Classic II Universal Steamer and Lid 2 copy.png', 2),
(2418, 33, 'data/promo/John Lewis Classic II Universal Steamer and Lid/John Lewis Classic II Universal Steamer and Lid 3 copy.png', 3),
(2419, 33, 'data/promo/John Lewis Classic II Universal Steamer and Lid/John Lewis Classic II Universal Steamer and Lid 2 copy.png', 4),
(2421, 46, 'data/promo/John Lewis Funky Napkin Holder/John Lewis Funky Napkin Holder 2 copy.png', 2),
(2422, 46, 'data/promo/John Lewis Funky Napkin Holder/John Lewis Funky Napkin Holder 3 copy.png', 3),
(2423, 46, 'data/promo/John Lewis Funky Napkin Holder/John Lewis Funky Napkin Holder 2 copy.png', 4),
(2424, 35, 'data/promo/Kalorik Meat Grinder MGR25959 Stainless Steel Blade/Kalorik Meat Grinder MGR25959 Stainless Steel Blade 1.png', 1),
(2425, 35, 'data/promo/Kalorik Meat Grinder MGR25959 Stainless Steel Blade/Kalorik Meat Grinder MGR25959 Stainless Steel Blade 2.png', 2),
(2426, 35, 'data/promo/Kalorik Meat Grinder MGR25959 Stainless Steel Blade/Kalorik Meat Grinder MGR25959 Stainless Steel Blade 3.png', 3),
(2427, 35, 'data/promo/Kalorik Meat Grinder MGR25959 Stainless Steel Blade/Kalorik Meat Grinder MGR25959 Stainless Steel Blade 2.png', 4);

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_option`
--

DROP TABLE IF EXISTS `oc_product_option`;
CREATE TABLE `oc_product_option` (
  `product_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `option_value` text NOT NULL,
  `required` tinyint(1) NOT NULL,
  PRIMARY KEY (`product_option_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_product_option`
--

INSERT INTO `oc_product_option` (`product_option_id`, `product_id`, `option_id`, `option_value`, `required`) VALUES
(224, 35, 11, '', 1),
(225, 47, 12, '2011-04-22', 1),
(221, 42, 9, '22:25', 1),
(223, 42, 2, '', 1),
(217, 42, 5, '', 1),
(209, 42, 6, '', 1),
(218, 42, 1, '', 1),
(208, 42, 4, 'test', 1),
(226, 30, 5, '', 1),
(219, 42, 8, '2011-02-20', 1),
(222, 42, 7, '', 1),
(220, 42, 10, '2011-02-20 22:25', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_option_value`
--

DROP TABLE IF EXISTS `oc_product_option_value`;
CREATE TABLE `oc_product_option_value` (
  `product_option_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `option_value_id` int(11) NOT NULL,
  `quantity` int(3) NOT NULL,
  `subtract` tinyint(1) NOT NULL,
  `price` decimal(15,4) NOT NULL,
  `price_prefix` varchar(1) NOT NULL,
  `points` int(8) NOT NULL,
  `points_prefix` varchar(1) NOT NULL,
  `weight` decimal(15,8) NOT NULL,
  `weight_prefix` varchar(1) NOT NULL,
  PRIMARY KEY (`product_option_value_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_product_option_value`
--

INSERT INTO `oc_product_option_value` (`product_option_value_id`, `product_option_id`, `product_id`, `option_id`, `option_value_id`, `quantity`, `subtract`, `price`, `price_prefix`, `points`, `points_prefix`, `weight`, `weight_prefix`) VALUES
(1, 217, 42, 5, 41, 100, 0, 1.0000, '+', 0, '+', 1.00000000, '+'),
(4, 217, 42, 5, 39, 92, 1, 4.0000, '+', 0, '+', 4.00000000, '+'),
(2, 217, 42, 5, 42, 200, 1, 2.0000, '+', 0, '+', 2.00000000, '+'),
(3, 217, 42, 5, 40, 300, 0, 3.0000, '+', 0, '+', 3.00000000, '+'),
(6, 218, 42, 1, 31, 146, 1, 20.0000, '+', 2, '-', 20.00000000, '+'),
(7, 218, 42, 1, 43, 300, 1, 30.0000, '+', 3, '+', 30.00000000, '+'),
(5, 218, 42, 1, 32, 96, 1, 10.0000, '+', 1, '+', 10.00000000, '+'),
(14, 224, 35, 11, 48, 15, 1, 15.0000, '+', 0, '+', 0.00000000, '+'),
(13, 224, 35, 11, 47, 9, 1, 10.0000, '+', 0, '+', 0.00000000, '+'),
(12, 224, 35, 11, 46, 0, 1, 5.0000, '+', 0, '+', 0.00000000, '+'),
(15, 226, 30, 5, 39, 2, 1, 0.0000, '+', 0, '+', 0.00000000, '+'),
(16, 226, 30, 5, 40, 4, 1, 0.0000, '+', 0, '+', 0.00000000, '+'),
(11, 223, 42, 2, 45, 3998, 1, 40.0000, '+', 0, '+', 40.00000000, '+'),
(9, 223, 42, 2, 24, 194, 1, 20.0000, '+', 0, '+', 20.00000000, '+'),
(10, 223, 42, 2, 44, 2696, 1, 30.0000, '+', 0, '+', 30.00000000, '+'),
(8, 223, 42, 2, 23, 48, 1, 10.0000, '+', 0, '+', 10.00000000, '+');

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_related`
--

DROP TABLE IF EXISTS `oc_product_related`;
CREATE TABLE `oc_product_related` (
  `product_id` int(11) NOT NULL,
  `related_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`related_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_product_related`
--

INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES
(29, 40),
(30, 40),
(31, 40),
(40, 29),
(40, 30),
(40, 31),
(40, 42),
(40, 43),
(41, 42),
(42, 40),
(42, 41),
(43, 40);

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_related2`
--

DROP TABLE IF EXISTS `oc_product_related2`;
CREATE TABLE `oc_product_related2` (
  `product_id` int(11) NOT NULL,
  `related_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`related_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_product_related2`
--

INSERT INTO `oc_product_related2` (`product_id`, `related_id`) VALUES
(32, 40),
(34, 40),
(40, 32),
(40, 34),
(40, 41),
(40, 46),
(40, 47),
(40, 49),
(41, 40),
(41, 42),
(42, 41),
(42, 43),
(42, 45),
(43, 42),
(45, 42),
(46, 40),
(47, 40),
(49, 40);

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_related_mn`
--

DROP TABLE IF EXISTS `oc_product_related_mn`;
CREATE TABLE `oc_product_related_mn` (
  `product_id` int(11) NOT NULL,
  `manufacturer_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `oc_product_related_mn`
--

INSERT INTO `oc_product_related_mn` (`product_id`, `manufacturer_id`) VALUES
(42, 8),
(41, 8),
(43, 8),
(44, 8);

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_related_wb`
--

DROP TABLE IF EXISTS `oc_product_related_wb`;
CREATE TABLE `oc_product_related_wb` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `oc_product_related_wb`
--

INSERT INTO `oc_product_related_wb` (`product_id`, `category_id`) VALUES
(43, 33),
(31, 33),
(28, 33),
(42, 33);

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_reward`
--

DROP TABLE IF EXISTS `oc_product_reward`;
CREATE TABLE `oc_product_reward` (
  `product_reward_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `points` int(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_reward_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_product_reward`
--

INSERT INTO `oc_product_reward` (`product_reward_id`, `product_id`, `customer_group_id`, `points`) VALUES
(546, 29, 1, 0),
(558, 40, 1, 0),
(552, 42, 1, 0),
(551, 32, 1, 0),
(550, 35, 1, 0),
(548, 33, 1, 0),
(549, 46, 1, 0),
(547, 49, 1, 1000);

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_special`
--

DROP TABLE IF EXISTS `oc_product_special`;
CREATE TABLE `oc_product_special` (
  `product_special_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`product_special_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_product_special`
--

INSERT INTO `oc_product_special` (`product_special_id`, `product_id`, `customer_group_id`, `priority`, `price`, `date_start`, `date_end`) VALUES
(443, 42, 1, 1, 90.0000, '0000-00-00', '2014-10-31'),
(442, 30, 0, 2, 90.0000, '0000-00-00', '0000-00-00'),
(441, 30, 0, 1, 80.0000, '0000-00-00', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_to_category`
--

DROP TABLE IF EXISTS `oc_product_to_category`;
CREATE TABLE `oc_product_to_category` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `main_category` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_id`,`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_product_to_category`
--

INSERT INTO `oc_product_to_category` (`product_id`, `category_id`, `main_category`) VALUES
(28, 24, 0),
(28, 20, 1),
(29, 24, 0),
(29, 20, 1),
(30, 33, 0),
(30, 20, 1),
(31, 33, 1),
(32, 34, 1),
(33, 28, 0),
(33, 20, 1),
(34, 34, 1),
(35, 20, 1),
(36, 34, 1),
(40, 24, 0),
(40, 20, 0),
(41, 27, 1),
(42, 20, 1),
(42, 28, 0),
(43, 20, 0),
(43, 18, 1),
(44, 20, 0),
(44, 18, 1),
(45, 18, 1),
(46, 20, 0),
(46, 18, 1),
(47, 20, 0),
(47, 18, 1),
(48, 34, 0),
(48, 20, 1),
(49, 57, 1),
(40, 35, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_to_download`
--

DROP TABLE IF EXISTS `oc_product_to_download`;
CREATE TABLE `oc_product_to_download` (
  `product_id` int(11) NOT NULL,
  `download_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`download_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_product_to_download`
--


-- --------------------------------------------------------

--
-- Table structure for table `oc_product_to_layout`
--

DROP TABLE IF EXISTS `oc_product_to_layout`;
CREATE TABLE `oc_product_to_layout` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_product_to_layout`
--


-- --------------------------------------------------------

--
-- Table structure for table `oc_product_to_store`
--

DROP TABLE IF EXISTS `oc_product_to_store`;
CREATE TABLE `oc_product_to_store` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_product_to_store`
--

INSERT INTO `oc_product_to_store` (`product_id`, `store_id`) VALUES
(28, 0),
(29, 0),
(30, 0),
(31, 0),
(32, 0),
(33, 0),
(34, 0),
(35, 0),
(36, 0),
(40, 0),
(41, 0),
(42, 0),
(43, 0),
(44, 0),
(45, 0),
(46, 0),
(47, 0),
(48, 0),
(49, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_recurring`
--

DROP TABLE IF EXISTS `oc_product_recurring`;
CREATE TABLE `oc_product_recurring` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_product_to_store`
--

-- --------------------------------------------------------

--
-- Table structure for table `oc_return`
--

DROP TABLE IF EXISTS `oc_return`;
CREATE TABLE `oc_return` (
  `return_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `product` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `opened` tinyint(1) NOT NULL,
  `return_reason_id` int(11) NOT NULL,
  `return_action_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `comment` text,
  `date_ordered` date NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`return_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_return`
--


-- --------------------------------------------------------

--
-- Table structure for table `oc_return_action`
--

DROP TABLE IF EXISTS `oc_return_action`;
CREATE TABLE `oc_return_action` (
  `return_action_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`return_action_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_return_action`
--

INSERT INTO `oc_return_action` (`return_action_id`, `language_id`, `name`) VALUES
(1, 1, 'Возвращены средства'),
(2, 1, 'Выдан в кредит'),
(3, 1, 'Отправлена замена (отправлен другой товар для замены)'),
(1, 2, 'Refunded'),
(2, 2, 'Credit Issued'),
(3, 2, 'Replacement Sent');

-- --------------------------------------------------------

--
-- Table structure for table `oc_return_history`
--

DROP TABLE IF EXISTS `oc_return_history`;
CREATE TABLE `oc_return_history` (
  `return_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `return_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`return_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_return_history`
--

-- --------------------------------------------------------

--
-- Table structure for table `oc_return_reason`
--

DROP TABLE IF EXISTS `oc_return_reason`;
CREATE TABLE `oc_return_reason` (
  `return_reason_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`return_reason_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_return_reason`
--

INSERT INTO `oc_return_reason` (`return_reason_id`, `language_id`, `name`) VALUES
(1, 1, 'Получен/доставлен неисправным (сломанным)'),
(2, 1, 'Получен не тот (ошибочный) товар'),
(4, 1, 'Ошибочный, пожалуйста укажите/приложите подробности'),
(5, 1, 'Другое (другая причина), пожалуйста укажите/приложите подробности'),
(1, 2, 'Dead On Arrival'),
(2, 2, 'Received Wrong Item'),
(4, 2, 'Faulty, please supply details'),
(5, 2, 'Other, please supply details');

-- --------------------------------------------------------

--
-- Table structure for table `oc_return_status`
--

DROP TABLE IF EXISTS `oc_return_status`;
CREATE TABLE `oc_return_status` (
  `return_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`return_status_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_return_status`
--

INSERT INTO `oc_return_status` (`return_status_id`, `language_id`, `name`) VALUES
(1, 1, 'Рассматриваемый / находящийся в процессе рассмотрения'),
(3, 1, 'Готов (к отправке) / или Завершен'),
(2, 1, 'Заказ "висит" в ожидании поступления товаров, которых в данный момент нет на складе.'),
(1, 2, 'Pending'),
(3, 2, 'Complete'),
(2, 2, 'Awaiting Products');

-- --------------------------------------------------------

--
-- Table structure for table `oc_review`
--

DROP TABLE IF EXISTS `oc_review`;
CREATE TABLE `oc_review` (
  `review_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `author` varchar(64) NOT NULL,
  `text` text NOT NULL,
  `rating` int(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`review_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `oc_review`
--

INSERT INTO `oc_review` (`review_id`, `product_id`, `customer_id`, `author`, `text`, `rating`, `status`, `date_added`, `date_modified`) VALUES
(1, 48, 0, 'Василий Покупайкин', 'Демо отзыв про Ipod Classic самый лучший плеер в мире :-)', 5, 1, '2014-03-31 01:08:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `oc_setting`
--

DROP TABLE IF EXISTS `oc_setting`;
CREATE TABLE `oc_setting` (
  `setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `group` varchar(32) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` text NOT NULL,
  `serialized` tinyint(1) NOT NULL,
  PRIMARY KEY (`setting_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_setting`
--

INSERT INTO `oc_setting` (`setting_id`, `store_id`, `group`, `key`, `value`, `serialized`) VALUES
(1, 0, 'shipping', 'shipping_sort_order', '3', 0),
(2, 0, 'sub_total', 'sub_total_sort_order', '1', 0),
(3, 0, 'sub_total', 'sub_total_status', '1', 0),
(4, 0, 'tax', 'tax_status', '1', 0),
(5, 0, 'total', 'total_sort_order', '9', 0),
(6, 0, 'total', 'total_status', '1', 0),
(7, 0, 'tax', 'tax_sort_order', '5', 0),
(8, 0, 'free_checkout', 'free_checkout_sort_order', '1', 0),
(9, 0, 'cod', 'cod_sort_order', '5', 0),
(10, 0, 'cod', 'cod_total', '0.01', 0),
(11, 0, 'cod', 'cod_order_status_id', '1', 0),
(12, 0, 'cod', 'cod_geo_zone_id', '0', 0),
(13, 0, 'cod', 'cod_status', '1', 0),
(14, 0, 'shipping', 'shipping_status', '1', 0),
(15, 0, 'shipping', 'shipping_estimator', '1', 0),
(4466, 0, 'newcarousel', 'newcarousel_module', 'a:1:{i:0;a:7:{s:9:"banner_id";s:2:"15";s:5:"width";s:3:"779";s:6:"height";s:3:"448";s:9:"layout_id";s:1:"1";s:8:"position";s:10:"header_top";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"1";}}', 1),
(27, 0, 'coupon', 'coupon_sort_order', '4', 0),
(28, 0, 'coupon', 'coupon_status', '1', 0),
(3047, 0, 'flat', 'flat_sort_order', '1', 0),
(3046, 0, 'flat', 'flat_status', '1', 0),
(3045, 0, 'flat', 'flat_geo_zone_id', '0', 0),
(3044, 0, 'flat', 'flat_tax_class_id', '9', 0),
(3043, 0, 'flat', 'flat_cost', '5.00', 0),
(42, 0, 'credit', 'credit_sort_order', '7', 0),
(43, 0, 'credit', 'credit_status', '1', 0),
(53, 0, 'reward', 'reward_sort_order', '2', 0),
(54, 0, 'reward', 'reward_status', '1', 0),
(4352, 0, 'account', 'account_module', 'a:7:{i:0;a:4:{s:9:"layout_id";s:1:"6";s:8:"position";s:12:"column_right";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"2";}i:1;a:4:{s:9:"layout_id";s:1:"4";s:8:"position";s:12:"column_right";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"2";}i:2;a:4:{s:9:"layout_id";s:2:"11";s:8:"position";s:12:"column_right";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"2";}i:3;a:4:{s:9:"layout_id";s:1:"5";s:8:"position";s:12:"column_right";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"2";}i:4;a:4:{s:9:"layout_id";s:1:"9";s:8:"position";s:12:"column_right";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"2";}i:5;a:4:{s:9:"layout_id";s:1:"7";s:8:"position";s:12:"column_right";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"2";}i:6;a:4:{s:9:"layout_id";s:1:"8";s:8:"position";s:12:"column_right";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"2";}}', 1),
(4473, 0, 'special', 'special_module', 'a:1:{i:0;a:7:{s:5:"limit";s:1:"1";s:11:"image_width";s:3:"180";s:12:"image_height";s:3:"180";s:9:"layout_id";s:1:"3";s:8:"position";s:12:"column_right";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"3";}}', 1),
(5928, 0, 'blogconfig', 'config_blog_image_category_width', '170', 0),
(5929, 0, 'blogconfig', 'config_blog_image_category_height', '170', 0),
(5930, 0, 'blogconfig', 'config_blog_image_article_width', '170', 0),
(6330, 0, 'config', 'config_google_analytics', '', 0),
(6329, 0, 'config', 'config_error_filename', 'error.txt', 0),
(6327, 0, 'config', 'config_error_display', '1', 0),
(6328, 0, 'config', 'config_error_log', '1', 0),
(6326, 0, 'config', 'config_compression', '0', 0),
(6323, 0, 'config', 'config_maintenance', '0', 0),
(6324, 0, 'config', 'config_password', '1', 0),
(6325, 0, 'config', 'config_encryption', '4a44bacc9c5fc48796e00b1b10e34ca4', 0),
(4351, 0, 'compare', 'compare_module', 'a:2:{i:0;a:4:{s:9:"layout_id";s:1:"3";s:8:"position";s:12:"column_right";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"1";}i:1;a:4:{s:9:"layout_id";s:1:"2";s:8:"position";s:12:"column_right";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"1";}}', 1),
(94, 0, 'voucher', 'voucher_sort_order', '8', 0),
(95, 0, 'voucher', 'voucher_status', '1', 0),
(103, 0, 'free_checkout', 'free_checkout_status', '1', 0),
(104, 0, 'free_checkout', 'free_checkout_order_status_id', '1', 0),
(4353, 0, 'affiliate', 'affiliate_module', 'a:1:{i:0;a:4:{s:9:"layout_id";s:2:"10";s:8:"position";s:12:"column_right";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"3";}}', 1),
(4134, 0, 'filter', 'filter_module', 'a:1:{i:0;a:4:{s:9:"layout_id";s:1:"3";s:8:"position";s:12:"column_right";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"1";}}', 1),
(3579, 0, 'information', 'information_module', 'a:1:{i:0;a:4:{s:9:"layout_id";s:1:"3";s:8:"position";s:12:"column_right";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"2";}}', 1),
(6271, 0, 'config', 'config_commission', '5', 0),
(6272, 0, 'config', 'config_return_id', '0', 0),
(6273, 0, 'config', 'config_return_status_id', '2', 0),
(6274, 0, 'config', 'config_logo', 'data/logo_oc_gray.png', 0),
(6275, 0, 'config', 'config_icon', 'data/favicon.png', 0),
(6276, 0, 'config', 'config_image_category_width', '170', 0),
(6277, 0, 'config', 'config_image_category_height', '170', 0),
(6278, 0, 'config', 'config_image_thumb_width', '270', 0),
(6279, 0, 'config', 'config_image_thumb_height', '270', 0),
(6280, 0, 'config', 'config_image_popup_width', '600', 0),
(6281, 0, 'config', 'config_image_popup_height', '600', 0),
(6282, 0, 'config', 'config_image_product_width', '170', 0),
(6283, 0, 'config', 'config_image_product_height', '170', 0),
(6284, 0, 'config', 'config_image_additional_width', '70', 0),
(6285, 0, 'config', 'config_image_additional_height', '70', 0),
(6286, 0, 'config', 'config_image_related_width', '170', 0),
(6287, 0, 'config', 'config_image_related_height', '170', 0),
(6288, 0, 'config', 'config_image_compare_width', '90', 0),
(6289, 0, 'config', 'config_image_compare_height', '90', 0),
(6290, 0, 'config', 'config_image_wishlist_width', '47', 0),
(6291, 0, 'config', 'config_image_wishlist_height', '47', 0),
(6292, 0, 'config', 'config_image_cart_width', '47', 0),
(6293, 0, 'config', 'config_image_cart_height', '47', 0),
(6294, 0, 'config', 'config_ftp_host', '192.168.9.2', 0),
(6295, 0, 'config', 'config_ftp_port', '21', 0),
(6296, 0, 'config', 'config_ftp_username', '', 0),
(6297, 0, 'config', 'config_ftp_password', '', 0),
(6298, 0, 'config', 'config_ftp_root', '', 0),
(6299, 0, 'config', 'config_ftp_status', '0', 0),
(6300, 0, 'config', 'config_mail_protocol', 'mail', 0),
(6301, 0, 'config', 'config_mail_parameter', '', 0),
(6302, 0, 'config', 'config_smtp_host', '', 0),
(6303, 0, 'config', 'config_smtp_username', '', 0),
(6304, 0, 'config', 'config_smtp_password', '', 0),
(6305, 0, 'config', 'config_smtp_port', '25', 0),
(6306, 0, 'config', 'config_smtp_timeout', '5', 0),
(6307, 0, 'config', 'config_alert_mail', '0', 0),
(6308, 0, 'config', 'config_account_mail', '0', 0),
(6309, 0, 'config', 'config_alert_emails', '', 0),
(6310, 0, 'config', 'config_fraud_detection', '0', 0),
(6311, 0, 'config', 'config_fraud_key', '', 0),
(6312, 0, 'config', 'config_fraud_score', '', 0),
(6313, 0, 'config', 'config_fraud_status_id', '7', 0),
(6314, 0, 'config', 'config_secure', '0', 0),
(6315, 0, 'config', 'config_shared', '0', 0),
(6316, 0, 'config', 'config_robots', 'abot\r\ndbot\r\nebot\r\nhbot\r\nkbot\r\nlbot\r\nmbot\r\nnbot\r\nobot\r\npbot\r\nrbot\r\nsbot\r\ntbot\r\nvbot\r\nybot\r\nzbot\r\nbot.\r\nbot/\r\n_bot\r\n.bot\r\n/bot\r\n-bot\r\n:bot\r\n(bot\r\ncrawl\r\nslurp\r\nspider\r\nseek\r\naccoona\r\nacoon\r\nadressendeutschland\r\nah-ha.com\r\nahoy\r\naltavista\r\nananzi\r\nanthill\r\nappie\r\narachnophilia\r\narale\r\naraneo\r\naranha\r\narchitext\r\naretha\r\narks\r\nasterias\r\natlocal\r\natn\r\natomz\r\naugurfind\r\nbackrub\r\nbannana_bot\r\nbaypup\r\nbdfetch\r\nbig brother\r\nbiglotron\r\nbjaaland\r\nblackwidow\r\nblaiz\r\nblog\r\nblo.\r\nbloodhound\r\nboitho\r\nbooch\r\nbradley\r\nbutterfly\r\ncalif\r\ncassandra\r\nccubee\r\ncfetch\r\ncharlotte\r\nchurl\r\ncienciaficcion\r\ncmc\r\ncollective\r\ncomagent\r\ncombine\r\ncomputingsite\r\ncsci\r\ncurl\r\ncusco\r\ndaumoa\r\ndeepindex\r\ndelorie\r\ndepspid\r\ndeweb\r\ndie blinde kuh\r\ndigger\r\nditto\r\ndmoz\r\ndocomo\r\ndownload express\r\ndtaagent\r\ndwcp\r\nebiness\r\nebingbong\r\ne-collector\r\nejupiter\r\nemacs-w3 search engine\r\nesther\r\nevliya celebi\r\nezresult\r\nfalcon\r\nfelix ide\r\nferret\r\nfetchrover\r\nfido\r\nfindlinks\r\nfireball\r\nfish search\r\nfouineur\r\nfunnelweb\r\ngazz\r\ngcreep\r\ngenieknows\r\ngetterroboplus\r\ngeturl\r\nglx\r\ngoforit\r\ngolem\r\ngrabber\r\ngrapnel\r\ngralon\r\ngriffon\r\ngromit\r\ngrub\r\ngulliver\r\nhamahakki\r\nharvest\r\nhavindex\r\nhelix\r\nheritrix\r\nhku www octopus\r\nhomerweb\r\nhtdig\r\nhtml index\r\nhtml_analyzer\r\nhtmlgobble\r\nhubater\r\nhyper-decontextualizer\r\nia_archiver\r\nibm_planetwide\r\nichiro\r\niconsurf\r\niltrovatore\r\nimage.kapsi.net\r\nimagelock\r\nincywincy\r\nindexer\r\ninfobee\r\ninformant\r\ningrid\r\ninktomisearch.com\r\ninspector web\r\nintelliagent\r\ninternet shinchakubin\r\nip3000\r\niron33\r\nisraeli-search\r\nivia\r\njack\r\njakarta\r\njavabee\r\njetbot\r\njumpstation\r\nkatipo\r\nkdd-explorer\r\nkilroy\r\nknowledge\r\nkototoi\r\nkretrieve\r\nlabelgrabber\r\nlachesis\r\nlarbin\r\nlegs\r\nlibwww\r\nlinkalarm\r\nlink validator\r\nlinkscan\r\nlockon\r\nlwp\r\nlycos\r\nmagpie\r\nmantraagent\r\nmapoftheinternet\r\nmarvin/\r\nmattie\r\nmediafox\r\nmediapartners\r\nmercator\r\nmerzscope\r\nmicrosoft url control\r\nminirank\r\nmiva\r\nmj12\r\nmnogosearch\r\nmoget\r\nmonster\r\nmoose\r\nmotor\r\nmultitext\r\nmuncher\r\nmuscatferret\r\nmwd.search\r\nmyweb\r\nnajdi\r\nnameprotect\r\nnationaldirectory\r\nnazilla\r\nncsa beta\r\nnec-meshexplorer\r\nnederland.zoek\r\nnetcarta webmap engine\r\nnetmechanic\r\nnetresearchserver\r\nnetscoop\r\nnewscan-online\r\nnhse\r\nnokia6682/\r\nnomad\r\nnoyona\r\nnutch\r\nnzexplorer\r\nobjectssearch\r\noccam\r\nomni\r\nopen text\r\nopenfind\r\nopenintelligencedata\r\norb search\r\nosis-project\r\npack rat\r\npageboy\r\npagebull\r\npage_verifier\r\npanscient\r\nparasite\r\npartnersite\r\npatric\r\npear.\r\npegasus\r\nperegrinator\r\npgp key agent\r\nphantom\r\nphpdig\r\npicosearch\r\npiltdownman\r\npimptrain\r\npinpoint\r\npioneer\r\npiranha\r\nplumtreewebaccessor\r\npogodak\r\npoirot\r\npompos\r\npoppelsdorf\r\npoppi\r\npopular iconoclast\r\npsycheclone\r\npublisher\r\npython\r\nrambler\r\nraven search\r\nroach\r\nroad runner\r\nroadhouse\r\nrobbie\r\nrobofox\r\nrobozilla\r\nrules\r\nsalty\r\nsbider\r\nscooter\r\nscoutjet\r\nscrubby\r\nsearch.\r\nsearchprocess\r\nsemanticdiscovery\r\nsenrigan\r\nsg-scout\r\nshai''hulud\r\nshark\r\nshopwiki\r\nsidewinder\r\nsift\r\nsilk\r\nsimmany\r\nsite searcher\r\nsite valet\r\nsitetech-rover\r\nskymob.com\r\nsleek\r\nsmartwit\r\nsna-\r\nsnappy\r\nsnooper\r\nsohu\r\nspeedfind\r\nsphere\r\nsphider\r\nspinner\r\nspyder\r\nsteeler/\r\nsuke\r\nsuntek\r\nsupersnooper\r\nsurfnomore\r\nsven\r\nsygol\r\nszukacz\r\ntach black widow\r\ntarantula\r\ntempleton\r\n/teoma\r\nt-h-u-n-d-e-r-s-t-o-n-e\r\ntheophrastus\r\ntitan\r\ntitin\r\ntkwww\r\ntoutatis\r\nt-rex\r\ntutorgig\r\ntwiceler\r\ntwisted\r\nucsd\r\nudmsearch\r\nurl check\r\nupdated\r\nvagabondo\r\nvalkyrie\r\nverticrawl\r\nvictoria\r\nvision-search\r\nvolcano\r\nvoyager/\r\nvoyager-hc\r\nw3c_validator\r\nw3m2\r\nw3mir\r\nwalker\r\nwallpaper\r\nwanderer\r\nwauuu\r\nwavefire\r\nweb core\r\nweb hopper\r\nweb wombat\r\nwebbandit\r\nwebcatcher\r\nwebcopy\r\nwebfoot\r\nweblayers\r\nweblinker\r\nweblog monitor\r\nwebmirror\r\nwebmonkey\r\nwebquest\r\nwebreaper\r\nwebsitepulse\r\nwebsnarf\r\nwebstolperer\r\nwebvac\r\nwebwalk\r\nwebwatch\r\nwebwombat\r\nwebzinger\r\nwget\r\nwhizbang\r\nwhowhere\r\nwild ferret\r\nworldlight\r\nwwwc\r\nwwwster\r\nxenu\r\nxget\r\nxift\r\nxirq\r\nyandex\r\nyanga\r\nyeti\r\nyodao\r\nzao\r\nzippp\r\nzyborg', 0),
(6317, 0, 'config', 'config_seo_url', '1', 0),
(6318, 0, 'config', 'config_seo_url_type', 'seo_pro', 0),
(6319, 0, 'config', 'config_seo_url_include_path', '0', 0),
(6320, 0, 'config', 'config_seo_url_postfix', '.html', 0),
(6321, 0, 'config', 'config_file_extension_allowed', 'txt\r\npng\r\njpe\r\njpeg\r\njpg\r\ngif\r\nbmp\r\nico\r\ntiff\r\ntif\r\nsvg\r\nsvgz\r\nzip\r\nrar\r\nmsi\r\ncab\r\nmp3\r\nqt\r\nmov\r\npdf\r\npsd\r\nai\r\neps\r\nps\r\ndoc\r\nrtf\r\nxls\r\nppt\r\nodt\r\nods', 0),
(6322, 0, 'config', 'config_file_mime_allowed', 'text/plain\r\nimage/png\r\nimage/jpeg\r\nimage/jpeg\r\nimage/jpeg\r\nimage/gif\r\nimage/bmp\r\nimage/vnd.microsoft.icon\r\nimage/tiff\r\nimage/tiff\r\nimage/svg+xml\r\nimage/svg+xml\r\napplication/zip\r\napplication/x-rar-compressed\r\napplication/x-msdownload\r\napplication/vnd.ms-cab-compressed\r\naudio/mpeg\r\nvideo/quicktime\r\nvideo/quicktime\r\napplication/pdf\r\nimage/vnd.adobe.photoshop\r\napplication/postscript\r\napplication/postscript\r\napplication/postscript\r\napplication/msword\r\napplication/rtf\r\napplication/vnd.ms-excel\r\napplication/vnd.ms-powerpoint\r\napplication/vnd.oasis.opendocument.text\r\napplication/vnd.oasis.opendocument.spreadsheet', 0),
(2056, 0, 'newslideshow', 'slideshow_module', 'a:1:{i:0;a:7:{s:9:"banner_id";s:2:"14";s:5:"width";s:4:"1000";s:6:"height";s:3:"400";s:9:"layout_id";s:1:"6";s:8:"position";s:11:"content_top";s:6:"status";s:1:"1";s:10:"sort_order";s:0:"";}}', 1),
(3051, 0, 'free', 'free_sort_order', '2', 0),
(3050, 0, 'free', 'free_status', '0', 0),
(3049, 0, 'free', 'free_geo_zone_id', '0', 0),
(3048, 0, 'free', 'free_total', '', 0),
(4579, 0, 'bestseller', 'bestseller_module', 'a:4:{i:0;a:7:{s:5:"limit";s:1:"1";s:11:"image_width";s:3:"215";s:12:"image_height";s:3:"215";s:9:"layout_id";s:1:"3";s:8:"position";s:12:"column_right";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"3";}i:1;a:7:{s:5:"limit";s:1:"1";s:11:"image_width";s:3:"215";s:12:"image_height";s:3:"215";s:9:"layout_id";s:1:"4";s:8:"position";s:12:"column_right";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"3";}i:2;a:7:{s:5:"limit";s:1:"1";s:11:"image_width";s:3:"215";s:12:"image_height";s:3:"215";s:9:"layout_id";s:1:"2";s:8:"position";s:12:"column_right";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"3";}i:3;a:7:{s:5:"limit";s:1:"1";s:11:"image_width";s:3:"215";s:12:"image_height";s:3:"215";s:9:"layout_id";s:1:"8";s:8:"position";s:12:"column_right";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"3";}}', 1),
(5956, 0, 'featured', 'product', '', 0),
(5957, 0, 'featured', 'featured_product', '40,44,33,46,41,28,35,49', 0),
(5958, 0, 'featured', 'featured_module', 'a:1:{i:0;a:7:{s:5:"limit";s:1:"3";s:11:"image_width";s:3:"215";s:12:"image_height";s:3:"215";s:9:"layout_id";s:1:"3";s:8:"position";s:14:"content_bottom";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"2";}}', 1),
(6270, 0, 'config', 'config_affiliate_id', '4', 0),
(5691, 0, 'banner', 'banner_module', 'a:2:{i:0;a:7:{s:9:"banner_id";s:2:"16";s:5:"width";s:3:"381";s:6:"height";s:3:"219";s:9:"layout_id";s:1:"1";s:8:"position";s:10:"header_top";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"2";}i:1;a:7:{s:9:"banner_id";s:2:"20";s:5:"width";s:3:"383";s:6:"height";s:3:"219";s:9:"layout_id";s:1:"1";s:8:"position";s:14:"content_bottom";s:6:"status";s:1:"1";s:10:"sort_order";s:2:"11";}}', 1),
(6269, 0, 'config', 'config_stock_status_id', '5', 0),
(6268, 0, 'config', 'config_stock_checkout', '0', 0),
(6267, 0, 'config', 'config_stock_warning', '0', 0),
(6266, 0, 'config', 'config_stock_display', '0', 0),
(6265, 0, 'config', 'config_complete_status_id', '5', 0),
(6264, 0, 'config', 'config_order_status_id', '1', 0),
(5311, 0, 'cachemanager', 'gzip', '0', 0),
(5312, 0, 'cachemanager', 'cache', 'a:2:{s:4:"menu";a:2:{s:6:"status";s:1:"0";s:8:"lifetime";s:5:"86400";}s:14:"categorymodule";a:2:{s:6:"status";s:1:"0";s:8:"lifetime";s:5:"86400";}}', 1),
(6262, 0, 'config', 'config_order_edit', '100', 0),
(6263, 0, 'config', 'config_invoice_prefix', 'INV-2012-00', 0),
(6261, 0, 'config', 'config_checkout_id', '5', 0),
(6260, 0, 'config', 'config_guest_checkout', '1', 0),
(6259, 0, 'config', 'config_cart_weight', '1', 0),
(6258, 0, 'config', 'config_account_id', '3', 0),
(6257, 0, 'config', 'config_customer_price', '0', 0),
(6256, 0, 'config', 'config_customer_group_id', '1', 0),
(6255, 0, 'config', 'config_customer_online', '0', 0),
(6253, 0, 'config', 'config_tax_default', 'shipping', 0),
(6254, 0, 'config', 'config_tax_customer', 'shipping', 0),
(6252, 0, 'config', 'config_vat', '0', 0),
(6251, 0, 'config', 'config_tax', '1', 0),
(6250, 0, 'config', 'config_voucher_max', '1000', 0),
(6249, 0, 'config', 'config_voucher_min', '1', 0),
(6248, 0, 'config', 'config_download', '1', 0),
(6247, 0, 'config', 'config_review_status', '1', 0),
(6246, 0, 'config', 'config_product_count', '1', 0),
(6245, 0, 'config', 'config_menu_brands', '1', 0),
(6244, 0, 'config', 'config_menu_latest', '1', 0),
(6243, 0, 'config', 'config_menu_special', '1', 0),
(6242, 0, 'config', 'config_admin_limit', '20', 0),
(6241, 0, 'config', 'config_catalog_limit', '6', 0),
(6240, 0, 'config', 'config_weight_class_id', '1', 0),
(6239, 0, 'config', 'config_length_class_id', '1', 0),
(6238, 0, 'config', 'config_currency_auto', '1', 0),
(6237, 0, 'config', 'config_currency', 'USD', 0),
(6236, 0, 'config', 'config_admin_language', 'ru', 0),
(6235, 0, 'config', 'config_language', 'ru', 0),
(6234, 0, 'config', 'config_zone_id', '2722', 0),
(6233, 0, 'config', 'config_country_id', '176', 0),
(6232, 0, 'config', 'config_layout_id', '4', 0),
(6231, 0, 'config', 'config_template', 'kitchen', 0),
(6230, 0, 'config', 'config_meta_keywords', '', 0),
(6229, 0, 'config', 'config_meta_description', 'Kitchen ware OCSHOP.CMS', 0),
(6228, 0, 'config', 'config_title', 'Kitchen ware OCSHOP.CMS', 0),
(6226, 0, 'config', 'config_twitter', 'https://twitter.com/', 0),
(6227, 0, 'config', 'config_time', 'Пн. - Пт. 9:00 - 20:00&lt;br /&gt;Сб. - Вс. 10:00 - 15:00', 0),
(5545, 0, 'coolfilter', 'count_enabled', '0', 0),
(5546, 0, 'coolfilter', 'coolfilter_module', 'a:1:{i:0;a:5:{s:9:"layout_id";s:1:"3";s:19:"coolfilter_group_id";s:1:"1";s:8:"position";s:12:"column_right";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"0";}}', 1),
(5678, 0, 'category', 'category_module', 'a:2:{i:0;a:4:{s:9:"layout_id";s:1:"3";s:8:"position";s:12:"column_right";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"1";}i:1;a:4:{s:9:"layout_id";s:1:"2";s:8:"position";s:12:"column_right";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"0";}}', 1),
(6225, 0, 'config', 'config_youtube', 'http://www.youtube.com/', 0),
(6224, 0, 'config', 'config_googleplus', 'https://plus.google.com/', 0),
(6223, 0, 'config', 'config_fb', 'https://www.facebook.com/', 0),
(6222, 0, 'config', 'config_vk', 'http://vk.com/club65930646', 0),
(6221, 0, 'config', 'config_fax', '088 888 88 88', 0),
(6220, 0, 'config', 'config_telephone', '077 777 77 77', 0),
(6219, 0, 'config', 'config_email', 'info@ocshop.biz', 0),
(6215, 0, 'config', 'config_owner', 'OCSHOP.CMS', 0),
(6216, 0, 'config', 'config_welcome', 'Мы приветствуем Вас в демонстрационном магазине OCSHOP.CMS. На этом сайте Вы можете ознакомиться со всеми возможностями системы ', 0),
(6217, 0, 'config', 'config_address', 'Никольская улица, Москва, Россия', 0),
(6218, 0, 'config', 'config_maps', '&lt;script type=&quot;text/javascript&quot; charset=&quot;utf-8&quot; src=&quot;//api-maps.yandex.ru/services/constructor/1.0/js/?sid=AREPYumVjPnV1kA3nNnK-tGQkXjuvo58&amp;width=430&amp;height=220&quot;&gt;&lt;/script&gt;', 0),
(6214, 0, 'config', 'config_name', 'Kitchen ware', 0),
(5676, 0, 'viewed', 'show_on_product', '1', 0),
(5677, 0, 'viewed', 'viewed_module', 'a:3:{i:0;a:6:{s:11:"image_width";s:3:"215";s:12:"image_height";s:3:"215";s:9:"layout_id";s:1:"2";s:8:"position";s:14:"content_bottom";s:6:"status";s:1:"1";s:10:"sort_order";s:2:"10";}i:1;a:6:{s:11:"image_width";s:3:"215";s:12:"image_height";s:3:"215";s:9:"layout_id";s:1:"3";s:8:"position";s:14:"content_bottom";s:6:"status";s:1:"1";s:10:"sort_order";s:2:"10";}i:2;a:6:{s:11:"image_width";s:3:"215";s:12:"image_height";s:3:"215";s:9:"layout_id";s:1:"5";s:8:"position";s:14:"content_bottom";s:6:"status";s:1:"1";s:10:"sort_order";s:2:"10";}}', 1),
(5675, 0, 'viewed', 'viewed_count', '4', 0),
(5684, 0, 'latest', 'latest_module', 'a:3:{i:0;a:7:{s:5:"limit";s:1:"1";s:11:"image_width";s:3:"215";s:12:"image_height";s:3:"215";s:9:"layout_id";s:1:"3";s:8:"position";s:12:"column_right";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"3";}i:2;a:7:{s:5:"limit";s:1:"1";s:11:"image_width";s:3:"215";s:12:"image_height";s:3:"215";s:9:"layout_id";s:1:"9";s:8:"position";s:12:"column_right";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"3";}i:3;a:7:{s:5:"limit";s:1:"1";s:11:"image_width";s:3:"215";s:12:"image_height";s:3:"215";s:9:"layout_id";s:1:"2";s:8:"position";s:12:"column_right";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"3";}}', 1),
(5931, 0, 'blogconfig', 'config_blog_image_article_height', '170', 0),
(5932, 0, 'blogconfig', 'config_blog_image_gallery_width', '170', 0),
(5933, 0, 'blogconfig', 'config_blog_image_gallery_height', '170', 0),
(5934, 0, 'blogconfig', 'config_blog_image_additional_width', '170', 0),
(5935, 0, 'blogconfig', 'config_blog_image_additional_height', '170', 0),
(5686, 0, 'product_tab', 'product_tab_module', 'a:1:{i:0;a:7:{s:5:"limit";s:1:"8";s:11:"image_width";s:3:"215";s:12:"image_height";s:3:"215";s:9:"layout_id";s:1:"1";s:8:"position";s:11:"content_top";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"1";}}', 1),
(5690, 0, 'carousel', 'carousel_module', 'a:1:{i:0;a:9:{s:9:"banner_id";s:2:"21";s:5:"limit";s:1:"5";s:6:"scroll";s:1:"3";s:5:"width";s:2:"80";s:6:"height";s:2:"80";s:9:"layout_id";s:1:"1";s:8:"position";s:14:"content_bottom";s:6:"status";s:1:"1";s:10:"sort_order";s:2:"10";}}', 1),
(5693, 0, 'reviews', 'reviews_module', 'a:4:{i:0;a:10:{s:4:"type";s:6:"latest";s:6:"header";a:2:{i:1;s:31:"Последние отзывы";i:2;s:31:"Последние отзывы";}s:5:"limit";s:1:"2";s:10:"text_limit";s:3:"150";s:11:"image_width";s:3:"215";s:12:"image_height";s:3:"215";s:9:"layout_id";s:1:"3";s:8:"position";s:12:"column_right";s:6:"status";s:1:"1";s:10:"sort_order";s:2:"10";}i:1;a:10:{s:4:"type";s:6:"latest";s:6:"header";a:2:{i:1;s:31:"Последние отзывы";i:2;s:31:"Последние отзывы";}s:5:"limit";s:1:"2";s:10:"text_limit";s:3:"150";s:11:"image_width";s:3:"215";s:12:"image_height";s:3:"215";s:9:"layout_id";s:2:"15";s:8:"position";s:12:"column_right";s:6:"status";s:1:"1";s:10:"sort_order";s:2:"10";}i:2;a:10:{s:4:"type";s:6:"latest";s:6:"header";a:2:{i:1;s:31:"Последние отзывы";i:2;s:31:"Последние отзывы";}s:5:"limit";s:1:"2";s:10:"text_limit";s:3:"150";s:11:"image_width";s:3:"215";s:12:"image_height";s:3:"215";s:9:"layout_id";s:1:"2";s:8:"position";s:12:"column_right";s:6:"status";s:1:"1";s:10:"sort_order";s:2:"10";}i:3;a:10:{s:4:"type";s:6:"latest";s:6:"header";a:2:{i:1;s:31:"Последние отзывы";i:2;s:31:"Последние отзывы";}s:5:"limit";s:1:"2";s:10:"text_limit";s:3:"150";s:11:"image_width";s:3:"215";s:12:"image_height";s:3:"215";s:9:"layout_id";s:1:"5";s:8:"position";s:12:"column_right";s:6:"status";s:1:"1";s:10:"sort_order";s:2:"10";}}', 1),
(5936, 0, 'blogconfig', 'config_blog_image_popup_width', '600', 0),
(5937, 0, 'blogconfig', 'config_blog_image_popup_height', '600', 0),
(5938, 0, 'blogconfig', 'config_blog_image_related_width', '170', 0),
(5939, 0, 'blogconfig', 'config_blog_image_related_height', '170', 0),
(5940, 0, 'blogconfig', 'config_blog_catalog_limit', '15', 0),
(5941, 0, 'blogconfig', 'config_blog_admin_limit', '15', 0),
(5942, 0, 'blogconfig', 'config_blog_header_menu', '1', 0),
(5943, 0, 'blogconfig', 'config_blog_article_count', '0', 0),
(5944, 0, 'blogconfig', 'config_blog_review_status', '1', 0),
(5945, 0, 'blogconfig', 'config_blog_download', '0', 0),
(5968, 0, 'blog_latest', 'blog_latest_module', 'a:2:{i:0;a:8:{s:5:"limit";s:1:"3";s:10:"text_limit";s:3:"150";s:11:"image_width";s:3:"215";s:12:"image_height";s:3:"215";s:9:"layout_id";s:2:"12";s:8:"position";s:12:"column_right";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"1";}i:1;a:8:{s:5:"limit";s:1:"3";s:10:"text_limit";s:3:"150";s:11:"image_width";s:3:"170";s:12:"image_height";s:3:"170";s:9:"layout_id";s:2:"12";s:8:"position";s:14:"content_bottom";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"3";}}', 1),
(5965, 0, 'blog_featured', 'article', '', 0),
(5966, 0, 'blog_featured', 'blog_featured_article', '126,127,120,125', 0),
(5967, 0, 'blog_featured', 'blog_featured_module', 'a:2:{i:0;a:8:{s:5:"limit";s:1:"3";s:10:"text_limit";s:3:"150";s:11:"image_width";s:3:"215";s:12:"image_height";s:3:"215";s:9:"layout_id";s:2:"12";s:8:"position";s:12:"column_right";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"5";}i:1;a:8:{s:5:"limit";s:1:"3";s:10:"text_limit";s:3:"150";s:11:"image_width";s:3:"170";s:12:"image_height";s:3:"170";s:9:"layout_id";s:2:"12";s:8:"position";s:14:"content_bottom";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"1";}}', 1),
(5970, 0, 'blog_reviews', 'blog_reviews_module', 'a:2:{i:0;a:10:{s:4:"type";s:6:"latest";s:6:"header";a:2:{i:1;s:31:"Последние отзывы";i:2;s:31:"Последние отзывы";}s:5:"limit";s:1:"4";s:10:"text_limit";s:3:"150";s:11:"image_width";s:3:"215";s:12:"image_height";s:3:"215";s:9:"layout_id";s:2:"12";s:8:"position";s:12:"column_right";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"6";}i:1;a:10:{s:4:"type";s:6:"latest";s:6:"header";a:2:{i:1;s:31:"Последние отзывы";i:2;s:31:"Последние отзывы";}s:5:"limit";s:1:"4";s:10:"text_limit";s:3:"150";s:11:"image_width";s:3:"170";s:12:"image_height";s:3:"170";s:9:"layout_id";s:2:"12";s:8:"position";s:14:"content_bottom";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"6";}}', 1),
(5979, 0, 'blog_mostviewed', 'blog_mostviewed_module', 'a:3:{i:0;a:8:{s:5:"limit";s:1:"3";s:10:"text_limit";s:3:"150";s:11:"image_width";s:3:"215";s:12:"image_height";s:3:"215";s:9:"layout_id";s:2:"12";s:8:"position";s:12:"column_right";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"2";}i:1;a:8:{s:5:"limit";s:1:"3";s:10:"text_limit";s:3:"150";s:11:"image_width";s:3:"170";s:12:"image_height";s:3:"170";s:9:"layout_id";s:2:"12";s:8:"position";s:14:"content_bottom";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"4";}i:2;a:8:{s:5:"limit";s:1:"5";s:10:"text_limit";s:3:"150";s:11:"image_width";s:3:"215";s:12:"image_height";s:3:"215";s:9:"layout_id";s:2:"14";s:8:"position";s:12:"column_right";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"2";}}', 1),
(5972, 0, 'featuredarticle', 'featuredarticle_module', 'a:4:{i:0;a:8:{s:5:"limit";s:1:"3";s:10:"text_limit";s:3:"150";s:11:"image_width";s:3:"215";s:12:"image_height";s:3:"215";s:9:"layout_id";s:1:"3";s:8:"position";s:12:"column_right";s:6:"status";s:1:"1";s:10:"sort_order";s:2:"11";}i:1;a:8:{s:5:"limit";s:1:"3";s:10:"text_limit";s:3:"150";s:11:"image_width";s:3:"215";s:12:"image_height";s:3:"215";s:9:"layout_id";s:1:"5";s:8:"position";s:12:"column_right";s:6:"status";s:1:"1";s:10:"sort_order";s:2:"11";}i:2;a:8:{s:5:"limit";s:1:"3";s:10:"text_limit";s:3:"150";s:11:"image_width";s:3:"170";s:12:"image_height";s:3:"170";s:9:"layout_id";s:1:"3";s:8:"position";s:14:"content_bottom";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"5";}i:3;a:8:{s:5:"limit";s:1:"3";s:10:"text_limit";s:3:"150";s:11:"image_width";s:3:"170";s:12:"image_height";s:3:"170";s:9:"layout_id";s:1:"5";s:8:"position";s:14:"content_bottom";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"5";}}', 1),
(5973, 0, 'featuredwb', 'featuredwb_module', 'a:4:{i:0;a:7:{s:5:"limit";s:1:"3";s:11:"image_width";s:3:"215";s:12:"image_height";s:3:"215";s:9:"layout_id";s:1:"3";s:8:"position";s:12:"column_right";s:6:"status";s:1:"1";s:10:"sort_order";s:2:"15";}i:1;a:7:{s:5:"limit";s:1:"3";s:11:"image_width";s:3:"215";s:12:"image_height";s:3:"215";s:9:"layout_id";s:1:"5";s:8:"position";s:12:"column_right";s:6:"status";s:1:"1";s:10:"sort_order";s:2:"15";}i:2;a:7:{s:5:"limit";s:1:"3";s:11:"image_width";s:3:"170";s:12:"image_height";s:3:"170";s:9:"layout_id";s:1:"3";s:8:"position";s:14:"content_bottom";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"7";}i:3;a:7:{s:5:"limit";s:1:"3";s:11:"image_width";s:3:"170";s:12:"image_height";s:3:"170";s:9:"layout_id";s:1:"5";s:8:"position";s:14:"content_bottom";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"7";}}', 1),
(5978, 0, 'blog_category', 'blog_category_module', 'a:3:{i:0;a:5:{s:9:"layout_id";s:2:"12";s:8:"position";s:12:"column_right";s:5:"count";s:1:"0";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"0";}i:1;a:5:{s:9:"layout_id";s:2:"13";s:8:"position";s:12:"column_right";s:5:"count";s:1:"0";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"0";}i:2;a:5:{s:9:"layout_id";s:2:"14";s:8:"position";s:12:"column_right";s:5:"count";s:1:"0";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"0";}}', 1);





-- --------------------------------------------------------

--
-- Table structure for table `oc_stock_status`
--

DROP TABLE IF EXISTS `oc_stock_status`;
CREATE TABLE `oc_stock_status` (
  `stock_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`stock_status_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_stock_status`
--

INSERT INTO `oc_stock_status` (`stock_status_id`, `language_id`, `name`) VALUES
(7, 1, 'В наличии'),
(8, 1, 'Предзаказ'),
(5, 1, 'Нет в наличии'),
(6, 1, 'Ожидание 2-3 дня'),
(7, 2, 'In Stock'),
(8, 2, 'Pre-Order'),
(5, 2, 'Out Of Stock'),
(6, 2, '2 - 3 Days');

-- --------------------------------------------------------

--
-- Table structure for table `oc_store`
--

DROP TABLE IF EXISTS `oc_store`;
CREATE TABLE `oc_store` (
  `store_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `url` varchar(255) NOT NULL,
  `ssl` varchar(255) NOT NULL,
  PRIMARY KEY (`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_store`
--


-- --------------------------------------------------------

--
-- Table structure for table `oc_tax_class`
--

DROP TABLE IF EXISTS `oc_tax_class`;
CREATE TABLE `oc_tax_class` (
  `tax_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`tax_class_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_tax_class`
--

INSERT INTO `oc_tax_class` (`tax_class_id`, `title`, `description`, `date_added`, `date_modified`) VALUES
(9, 'Налоги', 'Облагаемые налогом', '2009-01-06 23:21:53', '2011-03-09 21:17:10');

-- --------------------------------------------------------

--
-- Table structure for table `oc_tax_rate`
--

DROP TABLE IF EXISTS `oc_tax_rate`;
CREATE TABLE `oc_tax_rate` (
  `tax_rate_id` int(11) NOT NULL AUTO_INCREMENT,
  `geo_zone_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL,
  `rate` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `type` char(1) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`tax_rate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_tax_rate`
--

INSERT INTO `oc_tax_rate` (`tax_rate_id`, `geo_zone_id`, `name`, `rate`, `type`, `date_added`, `date_modified`) VALUES
(86, 3, 'НДС 18%', 18.0000, 'P', '2011-03-09 21:17:10', '2011-09-22 22:24:29'),
(87, 3, 'Eco Tax (-2.00)', 2.0000, 'F', '2011-09-21 21:49:23', '2011-09-23 00:40:19');

-- --------------------------------------------------------

--
-- Table structure for table `oc_tax_rate_to_customer_group`
--

DROP TABLE IF EXISTS `oc_tax_rate_to_customer_group`;
CREATE TABLE `oc_tax_rate_to_customer_group` (
  `tax_rate_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  PRIMARY KEY (`tax_rate_id`,`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_tax_rate_to_customer_group`
--

INSERT INTO `oc_tax_rate_to_customer_group` (`tax_rate_id`, `customer_group_id`) VALUES
(86, 1),
(87, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_tax_rule`
--

DROP TABLE IF EXISTS `oc_tax_rule`;
CREATE TABLE `oc_tax_rule` (
  `tax_rule_id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_class_id` int(11) NOT NULL,
  `tax_rate_id` int(11) NOT NULL,
  `based` varchar(10) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1',
  PRIMARY KEY (`tax_rule_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_tax_rule`
--

INSERT INTO `oc_tax_rule` (`tax_rule_id`, `tax_class_id`, `tax_rate_id`, `based`, `priority`) VALUES
(121, 10, 86, 'payment', 1),
(120, 10, 87, 'store', 0),
(128, 9, 86, 'shipping', 1),
(127, 9, 87, 'shipping', 2);

-- --------------------------------------------------------

--
-- Table structure for table `oc_url_alias`
--

DROP TABLE IF EXISTS `oc_url_alias`;
CREATE TABLE `oc_url_alias` (
  `url_alias_id` int(11) NOT NULL AUTO_INCREMENT,
  `query` varchar(255) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  `seomanager` int(1) DEFAULT '0',
  PRIMARY KEY (`url_alias_id`),
  KEY `query` (`query`(64)),
   KEY `seomanager` (`seomanager`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_url_alias`
--

INSERT INTO `oc_url_alias` (`url_alias_id`, `query`, `keyword`, `seomanager`) VALUES
(704, 'product_id=48', 'ipod_classic', 0),
(773, 'category_id=20', 'desktops', 0),
(503, 'category_id=26', 'pc', 0),
(505, 'category_id=27', 'mac', 0),
(730, 'manufacturer_id=8', 'apple', 0),
(772, 'information_id=4', 'about_us', 0),
(774, 'common/home', '', 0),
(795, 'information/sitemap', 'sitemaps', 1),
(797, 'information/contact', 'contacts', 1),
(798, 'product/manufacturer', 'brands', 1),
(768, 'product_id=42', 'test', 0),
(767, 'category_id=34', 'mp3-players', 0),
(536, 'category_id=36', 'Normal', 0),
(799, 'product/special', 'specials', 1),
(802, 'blid=69', 'news', 0),
(801, 'blid=70', 'photos-reviews', 0),
(803, 'blog/latest', 'blog', 1),
(804, 'product/latest', 'latest', 1),
(805, 'article_id=120', 'ocshop-cms-1-5-6-2', 0),
(808, 'article_id=123', 'foto-obzor-pervij', 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_user`
--

DROP TABLE IF EXISTS `oc_user`;
CREATE TABLE `oc_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_group_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `code` varchar(40) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_user`
--

-- --------------------------------------------------------

--
-- Table structure for table `oc_user_group`
--

DROP TABLE IF EXISTS `oc_user_group`;
CREATE TABLE `oc_user_group` (
  `user_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `permission` text NOT NULL,
  PRIMARY KEY (`user_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_user_group`
--

INSERT INTO `oc_user_group` (`user_group_id`, `name`, `permission`) VALUES
(1, 'Главный администратор', 'a:2:{s:6:"access";a:145:{i:0;s:12:"blog/article";i:1;s:17:"blog/blog_setting";i:2;s:12:"blog/gallery";i:3;s:9:"blog/news";i:4;s:19:"blog/review_article";i:5;s:17:"catalog/attribute";i:6;s:23:"catalog/attribute_group";i:7;s:16:"catalog/category";i:8;s:18:"catalog/coolfilter";i:9;s:24:"catalog/coolfilter_group";i:10;s:16:"catalog/download";i:11;s:14:"catalog/filter";i:12;s:19:"catalog/information";i:13;s:20:"catalog/manufacturer";i:14;s:14:"catalog/option";i:15;s:15:"catalog/product";i:16;s:15:"catalog/profile";i:17;s:14:"catalog/review";i:18;s:18:"common/filemanager";i:19;s:13:"design/banner";i:20;s:19:"design/custom_field";i:21;s:13:"design/layout";i:22;s:14:"extension/feed";i:23;s:17:"extension/manager";i:24;s:16:"extension/module";i:25;s:17:"extension/payment";i:26;s:18:"extension/shipping";i:27;s:15:"extension/total";i:28;s:16:"feed/google_base";i:29;s:19:"feed/google_sitemap";i:30;s:18:"feed/yandex_market";i:31;s:20:"localisation/country";i:32;s:21:"localisation/currency";i:33;s:21:"localisation/geo_zone";i:34;s:21:"localisation/language";i:35;s:25:"localisation/length_class";i:36;s:25:"localisation/order_status";i:37;s:26:"localisation/return_action";i:38;s:26:"localisation/return_reason";i:39;s:26:"localisation/return_status";i:40;s:25:"localisation/stock_status";i:41;s:22:"localisation/tax_class";i:42;s:21:"localisation/tax_rate";i:43;s:25:"localisation/weight_class";i:44;s:17:"localisation/zone";i:45;s:14:"module/account";i:46;s:16:"module/affiliate";i:47;s:13:"module/banner";i:48;s:17:"module/bestseller";i:49;s:15:"module/carousel";i:50;s:15:"module/category";i:51;s:17:"module/coolfilter";i:52;s:15:"module/featured";i:53;s:13:"module/filter";i:54;s:18:"module/google_talk";i:55;s:18:"module/information";i:56;s:13:"module/latest";i:57;s:16:"module/pp_layout";i:58;s:18:"module/product_tab";i:59;s:14:"module/reviews";i:60;s:16:"module/slideshow";i:61;s:14:"module/special";i:62;s:12:"module/store";i:63;s:13:"module/viewed";i:64;s:14:"module/welcome";i:65;s:21:"payment/bank_transfer";i:66;s:11:"payment/cod";i:67;s:21:"payment/free_checkout";i:68;s:14:"payment/liqpay";i:69;s:20:"payment/moneybookers";i:70;s:21:"payment/nalogenniy_np";i:71;s:18:"payment/pp_express";i:72;s:25:"payment/pp_payflow_iframe";i:73;s:14:"payment/pp_pro";i:74;s:21:"payment/pp_pro_iframe";i:75;s:17:"payment/pp_pro_pf";i:76;s:17:"payment/pp_pro_uk";i:77;s:19:"payment/pp_standard";i:78;s:25:"payment/sberbank_transfer";i:79;s:20:"payment/webmoney_wme";i:80;s:20:"payment/webmoney_wmr";i:81;s:20:"payment/webmoney_wmu";i:82;s:20:"payment/webmoney_wmz";i:83;s:27:"report/affiliate_commission";i:84;s:22:"report/customer_credit";i:85;s:22:"report/customer_online";i:86;s:21:"report/customer_order";i:87;s:22:"report/customer_reward";i:88;s:24:"report/product_purchased";i:89;s:21:"report/product_viewed";i:90;s:18:"report/sale_coupon";i:91;s:17:"report/sale_order";i:92;s:18:"report/sale_return";i:93;s:20:"report/sale_shipping";i:94;s:15:"report/sale_tax";i:95;s:14:"sale/affiliate";i:96;s:12:"sale/contact";i:97;s:11:"sale/coupon";i:98;s:13:"sale/customer";i:99;s:20:"sale/customer_ban_ip";i:100;s:19:"sale/customer_group";i:101;s:10:"sale/order";i:102;s:14:"sale/recurring";i:103;s:11:"sale/return";i:104;s:12:"sale/voucher";i:105;s:18:"sale/voucher_theme";i:106;s:15:"setting/setting";i:107;s:13:"setting/store";i:108;s:17:"shipping/by_total";i:109;s:17:"shipping/citylink";i:110;s:23:"shipping/courierautolux";i:111;s:13:"shipping/flat";i:112;s:13:"shipping/free";i:113;s:15:"shipping/gunsel";i:114;s:15:"shipping/intime";i:115;s:13:"shipping/item";i:116;s:17:"shipping/nexpress";i:117;s:19:"shipping/novaposhta";i:118;s:15:"shipping/pickup";i:119;s:15:"shipping/weight";i:120;s:11:"tool/backup";i:121;s:17:"tool/cachemanager";i:122;s:14:"tool/error_log";i:123;s:15:"tool/seomanager";i:124;s:18:"tool/vqmod_manager";i:125;s:12:"total/coupon";i:126;s:12:"total/credit";i:127;s:14:"total/handling";i:128;s:19:"total/low_order_fee";i:129;s:12:"total/reward";i:130;s:14:"total/shipping";i:131;s:15:"total/sub_total";i:132;s:9:"total/tax";i:133;s:11:"total/total";i:134;s:13:"total/voucher";i:135;s:9:"user/user";i:136;s:20:"user/user_permission";i:137;s:20:"module/blog_category";i:138;s:18:"module/blog_latest";i:139;s:22:"module/blog_mostviewed";i:140;s:20:"module/blog_featured";i:141;s:19:"module/blog_reviews";i:142;s:22:"module/featuredarticle";i:143;s:17:"module/featuredwb";i:144;s:19:"feed/google_sitemap";}s:6:"modify";a:145:{i:0;s:12:"blog/article";i:1;s:17:"blog/blog_setting";i:2;s:12:"blog/gallery";i:3;s:9:"blog/news";i:4;s:19:"blog/review_article";i:5;s:17:"catalog/attribute";i:6;s:23:"catalog/attribute_group";i:7;s:16:"catalog/category";i:8;s:18:"catalog/coolfilter";i:9;s:24:"catalog/coolfilter_group";i:10;s:16:"catalog/download";i:11;s:14:"catalog/filter";i:12;s:19:"catalog/information";i:13;s:20:"catalog/manufacturer";i:14;s:14:"catalog/option";i:15;s:15:"catalog/product";i:16;s:15:"catalog/profile";i:17;s:14:"catalog/review";i:18;s:18:"common/filemanager";i:19;s:13:"design/banner";i:20;s:19:"design/custom_field";i:21;s:13:"design/layout";i:22;s:14:"extension/feed";i:23;s:17:"extension/manager";i:24;s:16:"extension/module";i:25;s:17:"extension/payment";i:26;s:18:"extension/shipping";i:27;s:15:"extension/total";i:28;s:16:"feed/google_base";i:29;s:19:"feed/google_sitemap";i:30;s:18:"feed/yandex_market";i:31;s:20:"localisation/country";i:32;s:21:"localisation/currency";i:33;s:21:"localisation/geo_zone";i:34;s:21:"localisation/language";i:35;s:25:"localisation/length_class";i:36;s:25:"localisation/order_status";i:37;s:26:"localisation/return_action";i:38;s:26:"localisation/return_reason";i:39;s:26:"localisation/return_status";i:40;s:25:"localisation/stock_status";i:41;s:22:"localisation/tax_class";i:42;s:21:"localisation/tax_rate";i:43;s:25:"localisation/weight_class";i:44;s:17:"localisation/zone";i:45;s:14:"module/account";i:46;s:16:"module/affiliate";i:47;s:13:"module/banner";i:48;s:17:"module/bestseller";i:49;s:15:"module/carousel";i:50;s:15:"module/category";i:51;s:17:"module/coolfilter";i:52;s:15:"module/featured";i:53;s:13:"module/filter";i:54;s:18:"module/google_talk";i:55;s:18:"module/information";i:56;s:13:"module/latest";i:57;s:16:"module/pp_layout";i:58;s:18:"module/product_tab";i:59;s:14:"module/reviews";i:60;s:16:"module/slideshow";i:61;s:14:"module/special";i:62;s:12:"module/store";i:63;s:13:"module/viewed";i:64;s:14:"module/welcome";i:65;s:21:"payment/bank_transfer";i:66;s:11:"payment/cod";i:67;s:21:"payment/free_checkout";i:68;s:14:"payment/liqpay";i:69;s:20:"payment/moneybookers";i:70;s:21:"payment/nalogenniy_np";i:71;s:18:"payment/pp_express";i:72;s:25:"payment/pp_payflow_iframe";i:73;s:14:"payment/pp_pro";i:74;s:21:"payment/pp_pro_iframe";i:75;s:17:"payment/pp_pro_pf";i:76;s:17:"payment/pp_pro_uk";i:77;s:19:"payment/pp_standard";i:78;s:25:"payment/sberbank_transfer";i:79;s:20:"payment/webmoney_wme";i:80;s:20:"payment/webmoney_wmr";i:81;s:20:"payment/webmoney_wmu";i:82;s:20:"payment/webmoney_wmz";i:83;s:27:"report/affiliate_commission";i:84;s:22:"report/customer_credit";i:85;s:22:"report/customer_online";i:86;s:21:"report/customer_order";i:87;s:22:"report/customer_reward";i:88;s:24:"report/product_purchased";i:89;s:21:"report/product_viewed";i:90;s:18:"report/sale_coupon";i:91;s:17:"report/sale_order";i:92;s:18:"report/sale_return";i:93;s:20:"report/sale_shipping";i:94;s:15:"report/sale_tax";i:95;s:14:"sale/affiliate";i:96;s:12:"sale/contact";i:97;s:11:"sale/coupon";i:98;s:13:"sale/customer";i:99;s:20:"sale/customer_ban_ip";i:100;s:19:"sale/customer_group";i:101;s:10:"sale/order";i:102;s:14:"sale/recurring";i:103;s:11:"sale/return";i:104;s:12:"sale/voucher";i:105;s:18:"sale/voucher_theme";i:106;s:15:"setting/setting";i:107;s:13:"setting/store";i:108;s:17:"shipping/by_total";i:109;s:17:"shipping/citylink";i:110;s:23:"shipping/courierautolux";i:111;s:13:"shipping/flat";i:112;s:13:"shipping/free";i:113;s:15:"shipping/gunsel";i:114;s:15:"shipping/intime";i:115;s:13:"shipping/item";i:116;s:17:"shipping/nexpress";i:117;s:19:"shipping/novaposhta";i:118;s:15:"shipping/pickup";i:119;s:15:"shipping/weight";i:120;s:11:"tool/backup";i:121;s:17:"tool/cachemanager";i:122;s:14:"tool/error_log";i:123;s:15:"tool/seomanager";i:124;s:18:"tool/vqmod_manager";i:125;s:12:"total/coupon";i:126;s:12:"total/credit";i:127;s:14:"total/handling";i:128;s:19:"total/low_order_fee";i:129;s:12:"total/reward";i:130;s:14:"total/shipping";i:131;s:15:"total/sub_total";i:132;s:9:"total/tax";i:133;s:11:"total/total";i:134;s:13:"total/voucher";i:135;s:9:"user/user";i:136;s:20:"user/user_permission";i:137;s:20:"module/blog_category";i:138;s:18:"module/blog_latest";i:139;s:22:"module/blog_mostviewed";i:140;s:20:"module/blog_featured";i:141;s:19:"module/blog_reviews";i:142;s:22:"module/featuredarticle";i:143;s:17:"module/featuredwb";i:144;s:19:"feed/google_sitemap";}}'),
(10, 'Демонстрация', '');

-- --------------------------------------------------------

--
-- Table structure for table `oc_voucher`
--

DROP TABLE IF EXISTS `oc_voucher`;
CREATE TABLE `oc_voucher` (
  `voucher_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`voucher_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_voucher`
--


-- --------------------------------------------------------

--
-- Table structure for table `oc_voucher_history`
--

DROP TABLE IF EXISTS `oc_voucher_history`;
CREATE TABLE `oc_voucher_history` (
  `voucher_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `voucher_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`voucher_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_voucher_history`
--


-- --------------------------------------------------------

--
-- Table structure for table `oc_voucher_theme`
--

DROP TABLE IF EXISTS `oc_voucher_theme`;
CREATE TABLE `oc_voucher_theme` (
  `voucher_theme_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`voucher_theme_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_voucher_theme`
--

INSERT INTO `oc_voucher_theme` (`voucher_theme_id`, `image`) VALUES
(8, 'data/demo/canon_eos_5d_2.jpg'),
(7, 'data/demo/gift-voucher-birthday.jpg'),
(6, 'data/demo/apple_logo.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `oc_voucher_theme_description`
--

DROP TABLE IF EXISTS `oc_voucher_theme_description`;
CREATE TABLE `oc_voucher_theme_description` (
  `voucher_theme_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`voucher_theme_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_voucher_theme_description`
--

INSERT INTO `oc_voucher_theme_description` (`voucher_theme_id`, `language_id`, `name`) VALUES
(6, 1, 'Рождество'),
(7, 1, 'День рождения'),
(8, 1, 'Основной'),
(6, 2, 'Christmas'),
(7, 2, 'Birthday'),
(8, 2, 'General');

-- --------------------------------------------------------

--
-- Table structure for table `oc_weight_class`
--

DROP TABLE IF EXISTS `oc_weight_class`;
CREATE TABLE `oc_weight_class` (
  `weight_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `value` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  PRIMARY KEY (`weight_class_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_weight_class`
--

INSERT INTO `oc_weight_class` (`weight_class_id`, `value`) VALUES
(1, '1.00000000'),
(2, '1000.00000000');

-- --------------------------------------------------------

--
-- Table structure for table `oc_weight_class_description`
--

DROP TABLE IF EXISTS `oc_weight_class_description`;
CREATE TABLE `oc_weight_class_description` (
  `weight_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL,
  PRIMARY KEY (`weight_class_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_weight_class_description`
--

INSERT INTO `oc_weight_class_description` (`weight_class_id`, `language_id`, `title`, `unit`) VALUES
(1, 1, 'Килограммы', 'кг'),
(2, 1, 'Граммы', 'г'),
(1, 2, 'Kilogram', 'kg'),
(2, 2, 'Gram', 'g');

-- --------------------------------------------------------

--
-- Table structure for table `oc_zone`
--

DROP TABLE IF EXISTS `oc_zone`;
CREATE TABLE `oc_zone` (
  `zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `code` varchar(32) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`zone_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_zone`
--

INSERT INTO `oc_zone` (`zone_id`, `country_id`, `code`, `name`, `status`) VALUES
(180, 11, 'AGT', 'Арагацотн', 1),
(181, 11, 'ARR', 'Арарат', 1),
(182, 11, 'ARM', 'Армавир', 1),
(183, 11, 'GEG', 'Гегаркуник', 1),
(184, 11, 'KOT', 'Котайк', 1),
(185, 11, 'LOR', 'Лори', 1),
(186, 11, 'SHI', 'Ширак', 1),
(187, 11, 'SYU', 'Сюник', 1),
(188, 11, 'TAV', 'Тавуш', 1),
(189, 11, 'VAY', 'Вайоц Дзор', 1),
(190, 11, 'YER', 'Ереван', 1),
(208, 15, 'AB', 'Ali Bayramli', 1),
(209, 15, 'ABS', 'Abseron', 1),
(210, 15, 'AGC', 'AgcabAdi', 1),
(211, 15, 'AGM', 'Agdam', 1),
(212, 15, 'AGS', 'Agdas', 1),
(213, 15, 'AGA', 'Agstafa', 1),
(214, 15, 'AGU', 'Agsu', 1),
(215, 15, 'AST', 'Astara', 1),
(216, 15, 'BA', 'Baki', 1),
(217, 15, 'BAB', 'BabAk', 1),
(218, 15, 'BAL', 'BalakAn', 1),
(219, 15, 'BAR', 'BArdA', 1),
(220, 15, 'BEY', 'Beylaqan', 1),
(221, 15, 'BIL', 'Bilasuvar', 1),
(222, 15, 'CAB', 'Cabrayil', 1),
(223, 15, 'CAL', 'Calilabab', 1),
(224, 15, 'CUL', 'Culfa', 1),
(225, 15, 'DAS', 'Daskasan', 1),
(226, 15, 'DAV', 'Davaci', 1),
(227, 15, 'FUZ', 'Fuzuli', 1),
(228, 15, 'GA', 'Ganca', 1),
(229, 15, 'GAD', 'Gadabay', 1),
(230, 15, 'GOR', 'Goranboy', 1),
(231, 15, 'GOY', 'Goycay', 1),
(232, 15, 'HAC', 'Haciqabul', 1),
(233, 15, 'IMI', 'Imisli', 1),
(234, 15, 'ISM', 'Ismayilli', 1),
(235, 15, 'KAL', 'Kalbacar', 1),
(236, 15, 'KUR', 'Kurdamir', 1),
(237, 15, 'LA', 'Lankaran', 1),
(238, 15, 'LAC', 'Lacin', 1),
(239, 15, 'LAN', 'Lankaran', 1),
(240, 15, 'LER', 'Lerik', 1),
(241, 15, 'MAS', 'Masalli', 1),
(242, 15, 'MI', 'Mingacevir', 1),
(243, 15, 'NA', 'Naftalan', 1),
(244, 15, 'NEF', 'Neftcala', 1),
(245, 15, 'OGU', 'Oguz', 1),
(246, 15, 'ORD', 'Ordubad', 1),
(247, 15, 'QAB', 'Qabala', 1),
(248, 15, 'QAX', 'Qax', 1),
(249, 15, 'QAZ', 'Qazax', 1),
(250, 15, 'QOB', 'Qobustan', 1),
(251, 15, 'QBA', 'Quba', 1),
(252, 15, 'QBI', 'Qubadli', 1),
(253, 15, 'QUS', 'Qusar', 1),
(254, 15, 'SA', 'Saki', 1),
(255, 15, 'SAT', 'Saatli', 1),
(256, 15, 'SAB', 'Sabirabad', 1),
(257, 15, 'SAD', 'Sadarak', 1),
(258, 15, 'SAH', 'Sahbuz', 1),
(259, 15, 'SAK', 'Saki', 1),
(260, 15, 'SAL', 'Salyan', 1),
(261, 15, 'SM', 'Sumqayit', 1),
(262, 15, 'SMI', 'Samaxi', 1),
(263, 15, 'SKR', 'Samkir', 1),
(264, 15, 'SMX', 'Samux', 1),
(265, 15, 'SAR', 'Sarur', 1),
(266, 15, 'SIY', 'Siyazan', 1),
(267, 15, 'SS', 'Susa', 1),
(268, 15, 'SUS', 'Susa', 1),
(269, 15, 'TAR', 'Tartar', 1),
(270, 15, 'TOV', 'Tovuz', 1),
(271, 15, 'UCA', 'Ucar', 1),
(272, 15, 'XA', 'Xankandi', 1),
(273, 15, 'XAC', 'Xacmaz', 1),
(274, 15, 'XAN', 'Xanlar', 1),
(275, 15, 'XIZ', 'Xizi', 1),
(276, 15, 'XCI', 'Xocali', 1),
(277, 15, 'XVD', 'Xocavand', 1),
(278, 15, 'YAR', 'Yardimli', 1),
(279, 15, 'YEV', 'Yevlax', 1),
(280, 15, 'ZAN', 'Zangilan', 1),
(281, 15, 'ZAQ', 'Zaqatala', 1),
(282, 15, 'ZAR', 'Zardab', 1),
(283, 15, 'NX', 'Naxcivan', 1),
(337, 20, 'BR', 'Брест', 1),
(338, 20, 'HO', 'Гомель', 1),
(339, 20, 'HM', 'Минск', 1),
(340, 20, 'HR', 'Гродно', 1),
(341, 20, 'MA', 'Могилев', 1),
(342, 20, 'MI', 'Минская область', 1),
(343, 20, 'VI', 'Витебск', 1),
(1242, 80, 'AB', 'Abkhazia', 1),
(1243, 80, 'AJ', 'Ajaria', 1),
(1244, 80, 'TB', 'Tbilisi', 1),
(1245, 80, 'GU', 'Guria', 1),
(1246, 80, 'IM', 'Imereti', 1),
(1247, 80, 'KA', 'Kakheti', 1),
(1248, 80, 'KK', 'Kvemo Kartli', 1),
(1249, 80, 'MM', 'Mtskheta-Mtianeti', 1),
(1250, 80, 'RL', 'Racha Lechkhumi and Kvemo Svanet', 1),
(1251, 80, 'SZ', 'Samegrelo-Zemo Svaneti', 1),
(1252, 80, 'SJ', 'Samtskhe-Javakheti', 1),
(1253, 80, 'SK', 'Shida Kartli', 1),
(1716, 109, 'AL', 'Алматинская область', 1),
(1717, 109, 'AC', 'Алматы - город республ-го значения', 1),
(1718, 109, 'AM', 'Акмолинская область', 1),
(1719, 109, 'AQ', 'Актюбинская область', 1),
(1720, 109, 'AS', 'Астана - город республ-го значения', 1),
(1721, 109, 'AT', 'Атырауская область', 1),
(1722, 109, 'BA', 'Западно-Казахстанская область', 1),
(1723, 109, 'BY', 'Байконур - город республ-го значения', 1),
(1724, 109, 'MA', 'Мангистауская область', 1),
(1725, 109, 'ON', 'Южно-Казахстанская область', 1),
(1726, 109, 'PA', 'Павлодарская область', 1),
(1727, 109, 'QA', 'Карагандинская область', 1),
(1728, 109, 'QO', 'Костанайская область', 1),
(1729, 109, 'QY', 'Кызылординская область', 1),
(1730, 109, 'SH', 'Восточно-Казахстанская область', 1),
(1731, 109, 'SO', 'Северо-Казахстанская область', 1),
(1732, 109, 'ZH', 'Жамбылская область', 1),
(1793, 115, 'GB', 'Bishkek', 1),
(1794, 115, 'B', 'Batken', 1),
(1795, 115, 'C', 'Chu', 1),
(1796, 115, 'J', 'Jalal-Abad', 1),
(1797, 115, 'N', 'Naryn', 1),
(1798, 115, 'O', 'Osh', 1),
(1799, 115, 'T', 'Talas', 1),
(1800, 115, 'Y', 'Ysyk-Kol', 1),
(2181, 140, 'GA', 'Gagauzia', 1),
(2182, 140, 'CU', 'Chisinau', 1),
(2183, 140, 'BA', 'Balti', 1),
(2184, 140, 'CA', 'Cahul', 1),
(2185, 140, 'ED', 'Edinet', 1),
(2186, 140, 'LA', 'Lapusna', 1),
(2187, 140, 'OR', 'Orhei', 1),
(2188, 140, 'SO', 'Soroca', 1),
(2189, 140, 'TI', 'Tighina', 1),
(2190, 140, 'UN', 'Ungheni', 1),
(2191, 140, 'SN', 'St‚nga Nistrului', 1),
(2721, 176, 'KK', 'Республика Хакасия', 1),
(2722, 176, 'MOS', 'Московская область', 1),
(2723, 176, 'CHU', 'Чукотский АО', 1),
(2724, 176, 'ARK', 'Архангельская область', 1),
(2725, 176, 'AST', 'Астраханская область', 1),
(2726, 176, 'ALT', 'Алтайский край', 1),
(2727, 176, 'BEL', 'Белгородская область', 1),
(2728, 176, 'YEV', 'Еврейская АО', 1),
(2729, 176, 'AMU', 'Амурская область', 1),
(2730, 176, 'BRY', 'Брянская область', 1),
(2731, 176, 'CU', 'Чувашская Республика', 1),
(2732, 176, 'CHE', 'Челябинская область', 1),
(2733, 176, 'KC', 'Карачаево-Черкеcсия', 1),
(2734, 176, 'ZAB', 'Забайкальский край', 1),
(2735, 176, 'LEN', 'Ленинградская область', 1),
(2736, 176, 'KL', 'Республика Калмыкия', 1),
(2737, 176, 'SAK', 'Сахалинская область', 1),
(2738, 176, 'AL', 'Республика Алтай', 1),
(2739, 176, 'CE', 'Чеченская Республика', 1),
(2740, 176, 'IRK', 'Иркутская область', 1),
(2741, 176, 'IVA', 'Ивановская область', 1),
(2742, 176, 'UD', 'Удмуртская Республика', 1),
(2743, 176, 'KGD', 'Калининградская область', 1),
(2744, 176, 'KLU', 'Калужская область', 1),
(2746, 176, 'TA', 'Республика Татарстан', 1),
(2747, 176, 'KEM', 'Кемеровская область', 1),
(2748, 176, 'KHA', 'Хабаровский край', 1),
(2749, 176, 'KHM', 'Ханты-Мансийский АО - Югра', 1),
(2750, 176, 'KOS', 'Костромская область', 1),
(2751, 176, 'KDA', 'Краснодарский край', 1),
(2752, 176, 'KYA', 'Красноярский край', 1),
(2754, 176, 'KGN', 'Курганская область', 1),
(2755, 176, 'KRS', 'Курская область', 1),
(2756, 176, 'TY', 'Республика Тыва', 1),
(2757, 176, 'LIP', 'Липецкая область', 1),
(2758, 176, 'MAG', 'Магаданская область', 1),
(2759, 176, 'DA', 'Республика Дагестан', 1),
(2760, 176, 'AD', 'Республика Адыгея', 1),
(2761, 176, 'MOW', 'Москва', 1),
(2762, 176, 'MUR', 'Мурманская область', 1),
(2763, 176, 'KB', 'Республика Кабардино-Балкария', 1),
(2764, 176, 'NEN', 'Ненецкий АО', 1),
(2765, 176, 'IN', 'Республика Ингушетия', 1),
(2766, 176, 'NIZ', 'Нижегородская область', 1),
(2767, 176, 'NGR', 'Новгородская область', 1),
(2768, 176, 'NVS', 'Новосибирская область', 1),
(2769, 176, 'OMS', 'Омская область', 1),
(2770, 176, 'ORL', 'Орловская область', 1),
(2771, 176, 'ORE', 'Оренбургская область', 1),
(2773, 176, 'PNZ', 'Пензенская область', 1),
(2774, 176, 'PER', 'Пермский край', 1),
(2775, 176, 'KAM', 'Камчатский край', 1),
(2776, 176, 'KR', 'Республика Карелия', 1),
(2777, 176, 'PSK', 'Псковская область', 1),
(2778, 176, 'ROS', 'Ростовская область', 1),
(2779, 176, 'RYA', 'Рязанская область', 1),
(2780, 176, 'YAN', 'Ямало-Ненецкий АО', 1),
(2781, 176, 'SAM', 'Самарская область', 1),
(2782, 176, 'MO', 'Республика Мордовия', 1),
(2783, 176, 'SAR', 'Саратовская область', 1),
(2784, 176, 'SMO', 'Смоленская область', 1),
(2785, 176, 'SPE', 'Санкт-Петербург', 1),
(2786, 176, 'STA', 'Ставропольский край', 1),
(2787, 176, 'KO', 'Республика Коми', 1),
(2788, 176, 'TAM', 'Тамбовская область', 1),
(2789, 176, 'TOM', 'Томская область', 1),
(2790, 176, 'TUL', 'Тульская область', 1),
(2792, 176, 'TVE', 'Тверская область', 1),
(2793, 176, 'TYU', 'Тюменская область', 1),
(2794, 176, 'BA', 'Республика Башкортостан', 1),
(2795, 176, 'ULY', 'Ульяновская область', 1),
(2796, 176, 'BU', 'Республика Бурятия', 1),
(2798, 176, 'SE', 'Республика Северная Осетия', 1),
(2799, 176, 'VLA', 'Владимирская область', 1),
(2800, 176, 'PRI', 'Приморский край', 1),
(2801, 176, 'VGG', 'Волгоградская область', 1),
(2802, 176, 'VLG', 'Вологодская область', 1),
(2803, 176, 'VOR', 'Воронежская область', 1),
(2804, 176, 'KIR', 'Кировская область', 1),
(2805, 176, 'SA', 'Республика Саха', 1),
(2806, 176, 'YAR', 'Ярославская область', 1),
(2807, 176, 'SVE', 'Свердловская область', 1),
(2808, 176, 'ME', 'Республика Марий Эл', 1),
(3160, 207, 'GB', 'Gorno-Badakhstan', 1),
(3161, 207, 'KT', 'Khatlon', 1),
(3162, 207, 'SU', 'Sughd', 1),
(3396, 216, 'A', 'Ahal Welayaty', 1),
(3397, 216, 'B', 'Balkan Welayaty', 1),
(3398, 216, 'D', 'Dashhowuz Welayaty', 1),
(3399, 216, 'L', 'Lebap Welayaty', 1),
(3400, 216, 'M', 'Mary Welayaty', 1),
(3480, 220, 'CK', 'Черкассы', 1),
(3481, 220, 'CH', 'Чернигов', 1),
(3482, 220, 'CV', 'Черновцы', 1),
(3483, 220, 'CR', 'Крым', 1),
(3484, 220, 'DN', 'Днепропетровск', 1),
(3485, 220, 'DO', 'Донецк', 1),
(3486, 220, 'IV', 'Ивано-Франковск', 1),
(3487, 220, 'KH', 'Харьков', 1),
(3488, 220, 'KM', 'Хмельницкий', 1),
(3489, 220, 'KR', 'Кировоград', 1),
(3490, 220, 'KV', 'Киевская область', 1),
(3491, 220, 'KY', 'Киев', 1),
(3492, 220, 'LU', 'Луганск', 1),
(3493, 220, 'LV', 'Львов', 1),
(3494, 220, 'MY', 'Николаев', 1),
(3495, 220, 'OD', 'Одесса', 1),
(3496, 220, 'PO', 'Полтава', 1),
(3497, 220, 'RI', 'Ровно', 1),
(3498, 220, 'SE', 'Севастополь', 1),
(3499, 220, 'SU', 'Сумы', 1),
(3500, 220, 'TE', 'Тернополь', 1),
(3501, 220, 'VI', 'Винница', 1),
(3502, 220, 'VO', 'Луцк', 1),
(3503, 220, 'ZK', 'Ужгород', 1),
(3504, 220, 'ZA', 'Запорожье', 1),
(3505, 220, 'ZH', 'Житомир', 1),
(3506, 220, 'KE', 'Херсон', 1),
(3706, 226, 'AN', 'Andijon', 1),
(3707, 226, 'BU', 'Buxoro', 1),
(3708, 226, 'FA', 'Farg''ona', 1),
(3709, 226, 'JI', 'Jizzax', 1),
(3710, 226, 'NG', 'Namangan', 1),
(3711, 226, 'NW', 'Navoiy', 1),
(3712, 226, 'QA', 'Qashqadaryo', 1),
(3713, 226, 'QR', 'Qoraqalpog''iston Republikasi', 1),
(3714, 226, 'SA', 'Samarqand', 1),
(3715, 226, 'SI', 'Sirdaryo', 1),
(3716, 226, 'SU', 'Surxondaryo', 1),
(3717, 226, 'TK', 'Toshkent City', 1),
(3718, 226, 'TO', 'Toshkent Region', 1),
(3719, 226, 'XO', 'Xorazm', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_zone_to_geo_zone`
--

DROP TABLE IF EXISTS `oc_zone_to_geo_zone`;
CREATE TABLE `oc_zone_to_geo_zone` (
  `zone_to_geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL DEFAULT '0',
  `geo_zone_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`zone_to_geo_zone_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_zone_to_geo_zone`
--

INSERT INTO `oc_zone_to_geo_zone` (`zone_to_geo_zone_id`, `country_id`, `zone_id`, `geo_zone_id`, `date_added`, `date_modified`) VALUES
(57, 176, 0, 3, '2010-02-26 22:33:24', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `oc_blog_related_product`
--

DROP TABLE IF EXISTS `oc_blog_related_product`;
CREATE TABLE `oc_blog_related_product` (
  `article_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`article_id`,`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_blog_related_product`
--

-- --------------------------------------------------------

--
-- Table structure for table `oc_news`
--

DROP TABLE IF EXISTS `oc_news`;
CREATE TABLE `oc_news` (
  `news_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `top` tinyint(1) NOT NULL,
  `column` int(3) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`news_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=69 ;

--
-- Dumping data for table `oc_news`
--

INSERT INTO `oc_news` (`news_id`, `image`, `parent_id`, `top`, `column`, `sort_order`, `status`, `date_added`, `date_modified`) VALUES
(69, 'data/demo/apple_cinema_30.jpg', 0, 0, 0, 0, 1, '2014-04-08 03:56:26', '2014-04-08 04:00:30'),
(70, 'data/demo/nikon_d300_1.jpg', 0, 1, 0, 0, 1, '2014-04-08 03:58:55', '2014-04-08 03:58:55');

-- --------------------------------------------------------

--
-- Table structure for table `oc_news_description`
--

DROP TABLE IF EXISTS `oc_news_description`;
CREATE TABLE `oc_news_description` (
  `news_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  `seo_title` varchar(255) NOT NULL,
  `seo_h1` varchar(255) NOT NULL,
  PRIMARY KEY (`news_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_news_description`
--

INSERT INTO `oc_news_description` (`news_id`, `language_id`, `name`, `description`, `meta_description`, `meta_keyword`, `seo_title`, `seo_h1`) VALUES
(69, 1, 'Новости', '', '', '', '', ''),
(70, 1, 'Фото Обзоры', '', '', '', '', ''),
(70, 2, 'Photos Reviews', '', '', '', '', ''),
(69, 2, 'News', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `oc_news_to_layout`
--

DROP TABLE IF EXISTS `oc_news_to_layout`;
CREATE TABLE `oc_news_to_layout` (
  `news_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`news_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_news_to_store`
--

DROP TABLE IF EXISTS `oc_news_to_store`;
CREATE TABLE `oc_news_to_store` (
  `news_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`news_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_news_to_store`
--

INSERT INTO `oc_news_to_store` (`news_id`, `store_id`) VALUES
(69, 0),
(70, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_review_article`
--

DROP TABLE IF EXISTS `oc_review_article`;
CREATE TABLE `oc_review_article` (
  `review_article_id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `author` varchar(64) NOT NULL DEFAULT '',
  `text` text NOT NULL,
  `rating` int(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`review_article_id`),
  KEY `article_id` (`article_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `oc_review_article`
--

INSERT INTO `oc_review_article` (`review_article_id`, `article_id`, `customer_id`, `author`, `text`, `rating`, `status`, `date_added`, `date_modified`) VALUES
(11, 123, 0, 'Василий Покупайкин', 'Спасибо за отличный фото обзор, обязательно в ближайшее время приобрету себе такую тушку и напишу дополнение к Вашей статье.', 5, 1, '2014-04-08 05:59:25', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `oc_article`
--

DROP TABLE IF EXISTS `oc_article`;
CREATE TABLE `oc_article` (
  `article_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL,
  `date_available` date NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `article_review` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `viewed` int(5) NOT NULL DEFAULT '0',
  `gstatus` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`article_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=120 ;

--
-- Dumping data for table `oc_article`
--

INSERT INTO `oc_article` (`article_id`, `image`, `date_available`, `sort_order`, `article_review`, `status`, `date_added`, `date_modified`, `viewed`, `gstatus`) VALUES
(120, 'data/logo.png', '0000-00-00', 1, 1, 1, '2014-04-08 04:26:00', '0000-00-00 00:00:00', 2, 0),
(123, 'data/logo.png', '0000-00-00', 1, 1, 1, '2014-03-31 06:55:15', '2014-04-08 05:37:36', 132, 1);
-- --------------------------------------------------------

--
-- Table structure for table `oc_article_description`
--

DROP TABLE IF EXISTS `oc_article_description`;
CREATE TABLE `oc_article_description` (
  `article_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  `seo_title` varchar(255) NOT NULL,
  `seo_h1` varchar(255) NOT NULL,
  `tag` text NOT NULL,
  PRIMARY KEY (`article_id`,`language_id`),
  KEY `name` (`name`),
  FULLTEXT KEY `description` (`description`),
  FULLTEXT KEY `tag` (`tag`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_article_description`
--

INSERT INTO `oc_article_description` (`article_id`, `language_id`, `name`, `description`, `meta_description`, `meta_keyword`, `seo_title`, `seo_h1`, `tag`) VALUES
(120, 1, 'CMS для интернет магазинов OCSHOP.CMS v1.5.6.3', '&lt;p&gt;Рады представить Вашему вниманию OCSHOP.CMS v1.5.6.3 основанную на OpenCart v1.5.6.3&lt;/p&gt;\r\n', 'CMS для интернет магазинов OCSHOP.CMS v1.5.6.3 это бесплатный функциональный движок для создания качественных продающих магазинов.', 'cms, opencart, ocshop', 'CMS для интернет магазинов OCSHOP.CMS v1.5.6.3 - Скачать', 'CMS для интернет магазинов OCSHOP.CMS v1.5.6.3', ''),
(120, 2, 'CMS for online stores OCSHOP.CMS v1.5.6.3', '&lt;p&gt;&lt;span class=&quot;long_text&quot; id=&quot;result_box&quot; lang=&quot;en&quot;&gt;&lt;span class=&quot;hps&quot;&gt;Are pleased to announce&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;OCSHOP.CMS v1.5.6.3&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;based on&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;OpenCart v1.5.6.3&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n', 'CMS for online stores OCSHOP.CMS v1.5.6.3 is a free functional engine to create high-quality shops selling.', 'cms, opencart, ocshop', 'CMS for online stores OCSHOP.CMS v1.5.6.3 - Download', 'CMS for online stores OCSHOP.CMS v1.5.6.3', ''),
(123, 1, 'Фото Обзор Первый', '&lt;p&gt;Это первый фото обзор тут можно написать много какого то текста который описывает фото обзор и говорит что и как и почему для чего :-) Это первый фото обзор тут можно написать много какого то текста который описывает фото обзор и говорит что и как и почему для чего :-) Это первый фото обзор тут можно написать много какого то текста который описывает фото обзор и говорит что и как и почему для чего :-) Это первый фото обзор тут можно написать много какого то текста который описывает фото обзор и говорит что и как и почему для чего :-) Это первый фото обзор тут можно написать много какого то текста который описывает фото обзор и говорит что и как и почему для чего :-) Это первый фото обзор тут можно написать много какого то текста который описывает фото обзор и говорит что и как и почему для чего :-) Это первый фото обзор тут можно написать много какого то текста который описывает фото обзор и говорит что и как и почему для чего :-) Это первый фото обзор тут можно написать много какого то текста который описывает фото обзор и говорит что и как и почему для чего :-) Это первый фото обзор тут можно написать много какого то текста который описывает фото обзор и говорит что и как и почему для чего :-)&lt;/p&gt;\r\n', 'Фото Обзор Первый', 'Фото Обзор Первый', 'Фото Обзор Первый', 'Фото Обзор Первый', ''),
(123, 2, 'First Photo Overview', '&lt;p&gt;&lt;span id=&quot;result_box&quot; lang=&quot;en&quot;&gt;&lt;span class=&quot;hps&quot;&gt;This is the first&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;review of the&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;photos&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;here&lt;/span&gt;&lt;span&gt;, you can write&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;a lot of&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;what that&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;text&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;that describes the&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;photo&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;review and&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;says&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;what and how&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;and why&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;what&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;:-) This is the first&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;review of the&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;photos&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;here&lt;/span&gt;&lt;span&gt;, you can write&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;a lot of&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;what that&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;text&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;that describes the&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;photo&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;review and&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;says&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;what and how&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;and why&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;what&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;:-) This is the first&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;review of the&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;photos&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;here&lt;/span&gt;&lt;span&gt;, you can write&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;a lot of&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;what that&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;text&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;that describes the&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;photo&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;review and&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;says&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;what and how&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;and why&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;what&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;:-) This is the first&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;review of the&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;photos&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;here&lt;/span&gt;&lt;span&gt;, you can write&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;a lot of&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;what that&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;text&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;that describes the&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;photo&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;review and&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;says&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;what and how&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;and why&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;what&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;:-) This is the first&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;review of the&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;photos&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;here&lt;/span&gt;&lt;span&gt;, you can write&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;a lot of&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;what that&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;text&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;that describes the&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;photo&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;review and&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;says&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;what and how&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;and why&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;what&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;:-) This is the first&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;review of the&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;photos&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;here&lt;/span&gt;&lt;span&gt;, you can write&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;a lot of&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;what that&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;text&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;that describes the&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;photo&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;review and&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;says&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;what and how&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;and why&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;what&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;:-) This is the first&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;review of the&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;photos&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;here&lt;/span&gt;&lt;span&gt;, you can write&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;a lot of&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;what that&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;text&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;that describes the&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;photo&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;review and&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;says&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;what and how&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;and why&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;what&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;:-) This is the first&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;review of the&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;photos&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;here&lt;/span&gt;&lt;span&gt;, you can write&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;a lot of&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;what that&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;text&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;that describes the&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;photo&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;review and&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;says&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;what and how&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;and why&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;what&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;:-) This is the first&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;review of the&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;photos&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;here&lt;/span&gt;&lt;span&gt;, you can write&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;a lot of&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;what that&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;text&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;that describes the&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;photo&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;review and&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;says&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;what and how&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;and why&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;what&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;:-)&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n', 'First Photo Overview', 'First Photo Overview', 'First Photo Overview', 'First Photo Overview', '');


-- --------------------------------------------------------

--
-- Table structure for table `oc_article_image`
--

DROP TABLE IF EXISTS `oc_article_image`;
CREATE TABLE `oc_article_image` (
  `article_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`article_image_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3981 ;

--
-- Dumping data for table `oc_article_image`
--

INSERT INTO `oc_article_image` (`article_image_id`, `article_id`, `image`, `sort_order`) VALUES
(4104, 123, 'data/demo/nikon_d300_3.jpg', 6),
(4103, 123, 'data/demo/canon_eos_5d_1.jpg', 1),
(4102, 123, 'data/demo/nikon_d300_1.jpg', 4),
(4101, 123, 'data/demo/nikon_d300_2.jpg', 5),
(4100, 123, 'data/demo/nikon_d300_4.jpg', 7),
(4099, 123, 'data/demo/canon_eos_5d_2.jpg', 2),
(4097, 123, 'data/demo/nikon_d300_5.jpg', 8),
(4098, 123, 'data/demo/canon_eos_5d_3.jpg', 3);

-- --------------------------------------------------------

--
-- Table structure for table `oc_article_related`
--

DROP TABLE IF EXISTS `oc_article_related`;
CREATE TABLE `oc_article_related` (
  `article_id` int(11) NOT NULL,
  `related_id` int(11) NOT NULL,
  PRIMARY KEY (`article_id`,`related_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_article_related`
--

-- --------------------------------------------------------

--
-- Table structure for table `oc_article_related_gallery`
--

DROP TABLE IF EXISTS `oc_article_related_gallery`;
CREATE TABLE `oc_article_related_gallery` (
  `article_id` int(11) NOT NULL,
  `gallery_id` int(11) NOT NULL,
  PRIMARY KEY (`article_id`,`gallery_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_article_related_gallery`
--

-- --------------------------------------------------------

--
-- Table structure for table `oc_article_related_mn`
--

DROP TABLE IF EXISTS `oc_article_related_mn`;
CREATE TABLE `oc_article_related_mn` (
  `article_id` int(11) NOT NULL,
  `manufacturer_id` int(11) NOT NULL,
  PRIMARY KEY (`article_id`,`manufacturer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_article_related_mn`
--


-- --------------------------------------------------------

--
-- Table structure for table `oc_article_related_product`
--

DROP TABLE IF EXISTS `oc_article_related_product`;
CREATE TABLE `oc_article_related_product` (
  `article_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`article_id`,`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_article_related_product`
--

INSERT INTO `oc_article_related_product` (`article_id`, `product_id`) VALUES
(30, 123),
(31, 123),
(43, 123),
(45, 123),
(123, 30),
(123, 31),
(123, 43),
(123, 45);

-- --------------------------------------------------------

--
-- Table structure for table `oc_article_related_wb`
--

DROP TABLE IF EXISTS `oc_article_related_wb`;
CREATE TABLE `oc_article_related_wb` (
  `article_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`article_id`,`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_article_related_wb`
--

-- --------------------------------------------------------

--
-- Table structure for table `oc_article_to_download`
--

DROP TABLE IF EXISTS `oc_article_to_download`;
CREATE TABLE `oc_article_to_download` (
  `article_id` int(11) NOT NULL,
  `download_id` int(11) NOT NULL,
  PRIMARY KEY (`article_id`,`download_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_article_to_layout`
--

DROP TABLE IF EXISTS `oc_article_to_layout`;
CREATE TABLE `oc_article_to_layout` (
  `article_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`article_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_article_to_news`
--

DROP TABLE IF EXISTS `oc_article_to_news`;
CREATE TABLE `oc_article_to_news` (
  `article_id` int(11) NOT NULL,
  `news_id` int(11) NOT NULL,
  `main_news` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`article_id`,`news_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_article_to_news`
--

INSERT INTO `oc_article_to_news` (`article_id`, `news_id`, `main_news`) VALUES
(120, 69, 1),
(123, 70, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_article_to_store`
--

DROP TABLE IF EXISTS `oc_article_to_store`;
CREATE TABLE `oc_article_to_store` (
  `article_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`article_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_article_to_store`
--

INSERT INTO `oc_article_to_store` (`article_id`, `store_id`) VALUES
(120, 0),
(123, 0);

-- --------------------------------------------------------
