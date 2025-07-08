--1


--会員
CREATE TABLE `member` (
    `member_no` CHAR(4) NOT NULL PRIMARY KEY,
    `member_name` VARCHAR(20) NOT NULL,
    `tell` CHAR(11),
    `mail` VARCHAR(40),
    `join_date` DATE NOT NULL DEFAULT (CURDATE())
);

--ランク　
CREATE TABLE `rank` (
    `rank_cd` CHAR(1) NOT NULL PRIMARY KEY,
    `title` VARCHAR(40) NOT NULL
);

--スタイリスト
CREATE TABLE `stylist` (
    `stylist_no` CHAR(2) NOT NULL PRIMARY KEY,
    `stylist_name` VARCHAR(20) NOT NULL,
    `hire_date` DATE NOT NULL,
    `rank_cd` CHAR(1) REFERENCES `rank` (rank_cd)
);

--メニュー
CREATE TABLE `menu` (
    `menu_cd` CHAR(1) NOT NULL PRIMARY KEY,
    `menu_name` VARCHAR(40) NOT NULL,
    `duration` INTEGER NOT NULL
);

--料金
CREATE TABLE `price` (
    `menu_cd` CHAR(1) NOT NULL REFERENCES `menu` (menu_cd),
    `rank_cd` CHAR(1) NOT NULL REFERENCES `rank` (rank_cd),
    `menu_price` INTEGER NOT NULL,
    PRIMARY KEY (`menu_cd`, `rank_cd`)
);

--予約
CREATE TABLE `reservation` (
    `reserve_no` INTEGER NOT NULL PRIMARY KEY,
    `regist_date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `member_no` CHAR(4) NOT NULL REFERENCES `member` (member_no),
    `first` BOOLEAN NOT NULL DEFAULT '0',
    `reserve_date` DATE NOT NULL,
    `start_time` TIME NOT NULL,
    `service_time` INTEGER NOT NULL,
    `stylist_no` CHAR(2) NOT NULL REFERENCES `stylist` (stylist_no),
    `amount` INTEGER NOT NULL DEFAULT 0,
    `remarks` VARCHAR(50)
);

--予約明細
CREATE TABLE `reserve_detail` (
    `reserve_no` INTEGER NOT NULL REFERENCES `reservation` (reserve_no),
    `menu_cd` CHAR(1) NOT NULL REFERENCES `menu` (menu_cd),
    PRIMARY KEY(reserve_no, menu_cd)
);
