--menber
INSERT INTO `member`
(`member_no`, `member_name`, `tell`, `mail`, `join_date`) 
VALUES
('0001', '吉田康子', '09001234567', 'yoshida@example.com', '2006-04-10'),
('0002', '荒木和子', '09001234567', 'araki@example.com', '2018-08-11'),
('0003', '下田正一', '09001234567', 'shimoda@example.com', '2019-04-12'),
('0004', '風間由美子', '09001234567', NULL, '2019-06-13'),
('0005', '秋山美奈', '09001234567', 'akiyama@example.com', '2021-01-14'),
('0006', '木下博之', '09001234567', 'kinoshita@example.com', '2021-04-15'),
('0007', '広瀬正隆', NULL, NULL, '2022-09-16'),
('0008', '斉藤美紀', '09001234567', 'saitou@example.com', '2024-04-17');

--rank
INSERT INTO `rank`
(`rank_cd`, `title`)
VALUES
('A', 'チーフスタイリスト'),
('B', 'トップスタイリスト'),
('C', 'スタイリスト');

--stylist
INSERT INTO `stylist`
(`stylist_no`, `stylist_name`, `hire_date`, `rank_cd`)
VALUES
('01', '秋葉ちか', '2004-04-01', 'A'),
('02', '佐藤茜', '2006-06-01', 'B'),
('03', '井上博之', '2009-01-08', 'B'),
('04', '小島正', '2016-05-02', 'C'),
('05', '山田雄介', '2021-04-01', 'C'),
('06', '市川紀子', '2024-06-10', NULL);

--menu
INSERT INTO `menu`
(`menu_cd`, `menu_name`, `duration`)
VALUES
('C', 'カット', 30),
('P', 'カラー', 60),
('R', 'パーマ', 60),
('T', 'トリートメント', 30);

--price
INSERT INTO `price`
(`menu_cd`, `rank_cd`, `menu_price`)
VALUES
('C', 'A', 12000),
('C', 'B', 10000),
('C', 'C', 8000),
('P', 'A', 18000),
('P', 'B', 15000),
('P', 'C', 12000),
('R', 'A', 9600),
('R', 'B', 8000),
('R', 'C', 6400),
('T', 'A', 14400),
('T', 'B', 12000),
('T', 'C', 9600);

--reservation
INSERT INTO `reservation`
(`reserve_no`, `regist_date`, `member_no`, `first`, `reserve_date`, `start_time`, `service_time`, `stylist_no`, `amount`, `remarks`)
VALUES
(1, '2024-09-06 16:28:00', '0002', 0, '2024-10-01', '17:00:00', 90, '01', 21600, NULL),
(2, '2024-09-26 12:42:00', '0004', 1, '2024-10-01', '10:00:00', 30, '03', 10000, NULL),
(3, '2024-09-30 10:30:00', '0008', 0, '2024-10-01', '15:00:00', 150, '05', 26400, NULL);

--reserve_detail
INSERT INTO `reserve_detail`
(`reserve_no`, `menu_cd`)
VALUES
(1, 'C'),
(1, 'R'),
(2, 'C'),
(3, 'C'),
(3, 'P'),
(3, 'R');