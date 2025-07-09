-- Active: 1751946101721@@127.0.0.1@3306@store

--1

SELECT * FROM 商品

--2

SELECT 商品名 FROM 商品

--3
SELECT * FROM 商品

--4
SELECT 注文番号, 注文枝番, 商品コード
FROM 注文

--5
INSERT INTO 商品
VALUES('W0461', '冬のあったかコート', 12800, '1', NULL);

INSERT INTO 商品
VALUES('S0331', '春のさわやかコート', 6800, '1', NULL);

INSERT INTO 商品
VALUES('A0582', '秋のシックなコート', 9800, '1', NULL);

--6

SELECT *
FROM 商品
WHERE 商品コード = 'W1252'

--7

UPDATE 商品
SET 単価 = 500
WHERE 商品コード = 'S0023'

--8
SELECT *
FROM 商品
WHERE 単価 <= 1000

--9

SELECT *
FROM 商品
WHERE 単価 >= 50000

--10

SELECT *
FROM 注文
WHERE 注文日 >= '2024-01-01'

--11

SELECT *
FROM 注文
WHERE 注文日 < "2023-12-01"

--12

SELECT *
FROM 商品
WHERE 商品区分 <> '1'

--13
SELECT *
FROM 注文
WHERE クーポン割引料 IS NULL

--14

SELECT *
FROM 商品
WHERE 商品コード LIKE 'N%'

--15

SELECT 商品コード, 商品名, 単価
FROM 商品
WHERE 商品名 LIKE '%コート%'

--16

SELECT 商品コード, 商品区分
FROM 商品
WHERE 商品区分 IN(2,3,9)

--17

SELECT *
FROM 商品
WHERE 商品コード BETWEEN 'A0100' AND 'A0500'

--18

SELECT *
FROM 注文
WHERE 商品コード IN('N0501', 'N1021', 'N0223')

--19

SELECT *
FROM 商品
WHERE 商品区分 = '3'
AND 商品名 LIKE '%水玉%'

--20
SELECT *
FROM 商品
WHERE 商品名 LIKE '%軽い%'
OR 商品名 LIKE '%ゆるふわ%'

--21
SELECT *
FROM 商品
WHERE 
(商品区分 = '1'
AND 単価 <= 3000)
OR
(商品区分 = '3'
AND 単価 >= 10000)

--22
SELECT 商品コード
FROM 注文
WHERE 注文日 >= '2024-03-01'
AND 注文日 <'2024-04-01'
AND 数量 >= 3

--23
SELECT *
FROM 注文
WHERE 数量 >= 10
OR クーポン割引料 IS NOT NULL

--24

--25

SELECT 商品コード, 商品名
FROM 商品
WHERE 商品区分 = "1"
ORDER BY 商品コード

--26
SELECT 注文日, 注文番号, 注文枝番, 商品コード, 数量
FROM 注文
ORDER BY 注文番号

--27

SELECT DISTINCT 商品コード
FROM 注文
ORDER BY 

--28

SELECT *
FROM 注文
ORDER BY 注文日
LIMIT 10

--29

SELECT *
FROM 商品
ORDER BY 単価 ASC, 商品区分 ASC, 商品コード ASC
LIMIT 5, 15

--30

SELECT *
FROM 廃盤商品
WHERE 廃盤日 >= '2022-12-01' AND 廃盤日 < '2023-01-01'
OR 売上個数 > 100
ORDER BY 売上個数 DESC

--31

SELECT 商品コード
FROM 商品
EXCEPT
SELECT 商品コード
FROM 注文
ORDER BY 商品コード ASC

--32

SELECT 商品コード
FROM 商品
INTERSECT
SELECT 商品コード
FROM 注文
ORDER BY 商品コード DESC

--33

SELECT 
FROM 商品
WHERE 商品区分 = '9'
