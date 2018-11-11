CREATE TABLE `tbl_category` (
  `category_ID` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(200) NOT NULL DEFAULT '',
  `category_slug` varchar(200) NOT NULL DEFAULT '',
  `category_description` text NOT NULL,
  `category_parent` bigint(20) NOT NULL,
  `category_type` varchar(15) NOT NULL,
  `category_sort` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_comment` (
  `comment_ID` bigint(20) UNSIGNED NOT NULL,
  `comment_post_ID` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `comment_author` bigint(20) NOT NULL,
  `comment_author_name` varchar(100) NOT NULL,
  `comment_author_email` varchar(100) NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text NOT NULL,
  `comment_approved` varchar(20) NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) NOT NULL DEFAULT '',
  `comment_parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_post` (
  `post_ID` bigint(20) UNSIGNED NOT NULL,
  `post_author` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext NOT NULL,
  `post_title` text NOT NULL,
  `post_name` varchar(200) NOT NULL DEFAULT '',
  `post_status` varchar(20) NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) NOT NULL DEFAULT 'open',
  `post_parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `guid` mediumtext NOT NULL,
  `menu_sort` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) NOT NULL,
  `post_image` text,
  `post_code` varchar(255) NOT NULL,
  `post_price` float(22,0) NOT NULL,
  `post_discount` float(22,0) NOT NULL,
  `post_stock` int(5) NOT NULL,
  `post_attribute` text NOT NULL,
  `post_category` text NOT NULL,
  `post_counter` mediumint(9) NOT NULL,
  `post_mime_type` varchar(100) NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


CREATE TABLE `tbl_options` (
  `option_id` bigint(20) UNSIGNED NOT NULL,
  `option_name` varchar(64) NOT NULL,
  `option_value` longtext NOT NULL,
  `autoload` varchar(20) NOT NULL DEFAULT 'yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_template` (
  `template_id` int(255) NOT NULL,
  `template_name` varchar(500) NOT NULL,
  `template_directory` varchar(500) NOT NULL,
  `template_author` varchar(255) NOT NULL,
  `template_version` varchar(255) NOT NULL,
  `template_description` text NOT NULL,
  `template_attribute` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_user` (
  `ID` mediumint(8) UNSIGNED NOT NULL,
  `username` varchar(75) NOT NULL,
  `group` varchar(50) NOT NULL,
  `password` varchar(75) NOT NULL,
  `email` varchar(254) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `last_login` datetime NOT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_user_detail` (
  `user_detail_ID` mediumint(8) UNSIGNED NOT NULL,
  `user_id` mediumint(8) UNSIGNED DEFAULT NULL,
  `nama_depan` varchar(50) DEFAULT NULL,
  `nama_belakang` varchar(50) DEFAULT NULL,
  `jenis_kelamin` varchar(50) NOT NULL,
  `tempat_lahir` varchar(75) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `handphone` varchar(75) NOT NULL,
  `alamat` text NOT NULL,
  `kota` varchar(255) NOT NULL,
  `kecamatan` varchar(255) NOT NULL,
  `provinsi` varchar(255) NOT NULL,
  `profil_picture` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_visitor_logs` (
  `visitor_ID` bigint(100) UNSIGNED NOT NULL,
  `visitor_IP` varchar(15) NOT NULL DEFAULT '',
  `visitor_referer` varchar(255) NOT NULL DEFAULT '',
  `visitor_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `visitor_agent` varchar(255) DEFAULT NULL,
  `visitor_session` varchar(255) NOT NULL,
  `visitor_city` varchar(90) DEFAULT NULL,
  `visitor_region` varchar(90) DEFAULT NULL,
  `visitor_country` varchar(90) DEFAULT NULL,
  `visitor_os` varchar(255) DEFAULT NULL,
  `visitor_browser` varchar(255) DEFAULT NULL,
  `visitor_isp` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Indexes
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`category_ID`);

ALTER TABLE `tbl_comment`
  ADD PRIMARY KEY (`comment_ID`),
  ADD KEY `comment_post_ID` (`comment_post_ID`,`comment_author`);

ALTER TABLE `tbl_options`
  ADD PRIMARY KEY (`option_id`);

ALTER TABLE `tbl_post`
  ADD PRIMARY KEY (`post_ID`),
  ADD KEY `post_author` (`post_author`);

ALTER TABLE `tbl_sessions`
  ADD KEY `ci_sessions_timestamp` (`timestamp`);


ALTER TABLE `tbl_template`
  ADD PRIMARY KEY (`template_id`);

ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`ID`);

ALTER TABLE `tbl_user_detail`
  ADD PRIMARY KEY (`user_detail_ID`),
  ADD KEY `user_id` (`user_id`);

ALTER TABLE `tbl_visitor_logs`
  ADD PRIMARY KEY (`visitor_ID`);


-- AUTO_INCREMENT

ALTER TABLE `tbl_category`
  MODIFY `category_ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

ALTER TABLE `tbl_comment`
  MODIFY `comment_ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

ALTER TABLE `tbl_options`
  MODIFY `option_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

ALTER TABLE `tbl_post`
  MODIFY `post_ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

ALTER TABLE `tbl_template`
  MODIFY `template_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

ALTER TABLE `tbl_user`
  MODIFY `ID` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `tbl_user_detail`
  MODIFY `user_detail_ID` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `tbl_visitor_logs`
  MODIFY `visitor_ID` bigint(100) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;
COMMIT;

