--1

SELECT s.stylist_name, COALESCE(r.title, 'アシスタント') 
FROM `stylist` AS s
LEFT JOIN `rank` AS r
ON r.rank_cd = s.rank_cd

--2

SELECT s.stylist_name, m.menu_name, p.menu_price
FROM stylist AS s
JOIN price AS p ON p.rank_cd = s.rank_cd
JOIN menu AS m ON m.menu_cd = p.menu_cd
ORDER BY s.rank_cd, s.stylist_no, m.menu_name

--3

SELECT rv.reserve_no, s.stylist_name, m.menu_name, m.duration, rv.amount
FROM reservation AS rv
JOIN reserve_detail AS rd ON rd.reserve_no = rv.reserve_no
JOIN stylist AS s ON s.stylist_no = rv.stylist_no
JOIN price AS p ON p.rank_cd = s.rank_cd
JOIN menu AS m ON m.menu_cd = p.menu_cd
WHERE rv.stylist_no = s.stylist_no
AND rd.menu_cd = p.menu_cd

--4

SELECT 予約番号, スタイリスト, 所要時間, SUM(金額) AS 合計金額
FROM(
SELECT rv.reserve_no AS 予約番号, s.stylist_name AS スタイリスト, m.menu_name, m.duration AS 所要時間, rv.amount AS 料金
FROM reservation AS rv
JOIN reserve_detail AS rd ON rd.reserve_no = rv.reserve_no
JOIN stylist AS s ON s.stylist_no = rv.stylist_no
JOIN price AS p ON p.rank_cd = s.rank_cd
JOIN menu AS m ON m.menu_cd = p.menu_cd
WHERE rv.stylist_no = s.stylist_no
AND rd.menu_cd = p.menu_cd
)
GROUP BY 予約番号, スタイリスト
ORDER BY 予約番号

--5
BEGIN;
INSERT INTO Reservation VALUES (4, '2024-10-01 10:03',
'0006', '0', '2024-10-01', '11:30', 90, '05', 13400, NULL);
INSERT INTO ReserveDetail VALUES (4, 'C');
INSERT INTO ReserveDetail VALUES (4, 'R');

--6
--所要時間
SELECT SUM(m.duration)
FROM reserve_detail AS d
JOIN menu AS m
ON d.menu_cd = m.menu_cd
WHERE d.reserve_no = '6'

--金額
SELECT SUM(p.menu_price)
FROM reservation AS r
JOIN reserve_detail AS d
ON d.reserve_no = r.reserve_no
JOIN stylist AS s
ON s.stylist_no = r.stylist_no
JOIN price AS p
ON p.menu_cd = p.menu_cd
AND s.rank_cd = p.rank_cd
WHERE d.reserve_no = 4
ROLLBACK;

BEGIN;
INSERT INTO Reservation VALUES (4, '2024-10-01 10:03',
'0006', '0', '2024-10-01', '11:30', 90, '05', 13400, NULL);
INSERT INTO ReserveDetail VALUES (4, 'C');
INSERT INTO ReserveDetail VALUES (4, 'R');
COMMIT;

--7
SELECT r.reserve_date, 
       s.stylist_no,
       s.stylist_name,
       r.start_time,
       r.start_time + CAST(CONCAT(service_time, 'minutes')AS INTERVAL) AS 終了時刻
FROM reservation AS r
RIGHT JOIN stylist AS s ON s.stylist_no = r.stylist_no
ORDER BY r.reserve_date, s.stylist_no

--8
SELECT r.reserve_date, 
       s.stylist_no,ORDER BY r.reserve_date, s.stylist_no
       s.stylist_name,
       EXTRACT(hour from start_time),
       r.start_time + CAST(CONCAT(service_time, 'minutes')AS INTERVAL) AS 終了時刻
FROM reservation AS r
RIGHT JOIN stylist AS s ON s.stylist_no = r.stylist_no
ORDER BY r.reserve_date, s.stylist_no


--9

SELECT 予約日,　スタイリスト名,
CASE WHEN 開始時刻 = 10 THEN 終了時刻 END AS "10時台",
CASE WHEN 開始時刻 = 11 THEN 終了時刻 END AS "11時台",
CASE WHEN 開始時刻 = 12 THEN 終了時刻 END AS "12時台",
CASE WHEN 開始時刻 = 13 THEN 終了時刻 END AS "13時台",
CASE WHEN 開始時刻 = 14 THEN 終了時刻 END AS "14時台",
CASE WHEN 開始時刻 = 15 THEN 終了時刻 END AS "15時台",
CASE WHEN 開始時刻 = 16 THEN 終了時刻 END AS "16時台",
CASE WHEN 開始時刻 = 17 THEN 終了時刻 END AS "17時台",
CASE WHEN 開始時刻 = 18 THEN 終了時刻 END AS "18時台"
FROM
(SELECT r.regist_date AS 予約日, 
        s.stylist_no AS スタイリスト番号,
        EXTRACT(hour from r.start_time)
        start_time + CAST(service_time || 'minutes' AS INTERVAL) AS 終了時刻
 FROM reservation r
 RIGHT JOIN stylist AS s ON r.stylist_no = s.stylist_no) AS t
 ORDER BY
 CASE WHEN 予約日 IS NULL THEN 1 ELSE 0 END, 予約日, 担当スタイリスト番号

--10

SELECT 予約日,　スタイリスト名,
MAX(CASE WHEN 開始時刻 = 10 THEN 終了時刻 END) AS "10時台",
MAX(CASE WHEN 開始時刻 = 11 THEN 終了時刻 END) AS "11時台",
MAX(CASE WHEN 開始時刻 = 12 THEN 終了時刻 END) AS "12時台",
MAX(CASE WHEN 開始時刻 = 13 THEN 終了時刻 END) AS "13時台",
MAX(CASE WHEN 開始時刻 = 14 THEN 終了時刻 END) AS "14時台",
MAX(CASE WHEN 開始時刻 = 15 THEN 終了時刻 END) AS "15時台",
MAX(CASE WHEN 開始時刻 = 16 THEN 終了時刻 END) AS "16時台",
MAX(CASE WHEN 開始時刻 = 17 THEN 終了時刻 END) AS "17時台",
MAX(CASE WHEN 開始時刻 = 18 THEN 終了時刻 END) AS "18時台"
FROM
    (SELECT
        r.reserve_date AS 予約日,
        s.stylist_name AS スタイリスト名,
        HOUR(r.start_time) AS 開始時刻, -- MySQLのHOUR関数を使用
        r.start_time + INTERVAL r.service_time MINUTE AS 終了時刻 -- MySQLのINTERVAL構文を使用
    FROM
 RIGHT JOIN stylist AS s ON r.stylist_no = s.stylist_no) AS t
 ORDER BY
 CASE WHEN 予約日 IS NULL THEN 1 ELSE 0 END, 予約日, 担当スタイリスト番号