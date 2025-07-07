
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
WHERE 商品区分 = '1'
ORDER BY 商品コード DESC

--26
SELECT 注文日, 注文番号, 注文枝番, 商品コード, 数量
FROM 注文
WHERE 注文日 >= '2024-03-01'
ORDER BY 商品コード ASC

--27
SELECT DISTINCT 商品コード
FROM 注文
ORDER BY 1 ASC

--28
SELECT *
FROM 注文
ORDER BY 注文日 DESC
LIMIT 10

--29

SELECT *
FROM 商品
ORDER BY 単価 ASC, 商品区分 ASC, 商品コード ASC
LIMIT 5, 15

--30
SELECT *
FROM 廃盤商品
WHERE (廃盤日 >= '2022-12-01' AND 廃盤日 < '2023-01-01')
OR 売上個数 > 100
ORDER BY 売上個数 DESC

--31
SELECT 商品コード
FROM 商品
EXCEPT
SELECT 商品コード
FROM 注文
ORDER BY 1 ASC

--32
SELECT 商品コード
FROM 商品
INTERSECT
SELECT 商品コード
FROM 注文
ORDER BY 1 DESC

--33
SELECT 商品コード, 商品名, 単価
FROM 商品
WHERE 商品区分 = '9'
AND (単価 <= 1000 OR 単価 > 10000)
ORDER BY 3 ASC, 1 ASC

--34
SELECT 商品コード, 単価, TRUNCATE(単価 - 単価 * 0.05, 0) AS キャンペーン価格
FROM 商品
ORDER BY 商品コード ASC

--35
UPDATE 注文
SET クーポン割引料 = クーポン割引料 + 300
WHERE 注文日 BETWEEN '2024-03-12' AND '2024-03-14'
AND 数量 >= 2
AND クーポン割引料 IS NOT NULL

--36
UPDATE 注文
SET 数量 = 数量 - 1
WHERE 注文番号 = '202402250'

--37
SELECT CONCAT(注文番号, ':' , 注文枝番)
FROM 注文
WHERE 注文番号 BETWEEN '202310010001' AND '202310319999'

--38
SELECT DISTINCT 商品区分, 
CASE 商品区分
    WHEN 1 THEN '衣類'
    WHEN 2 THEN '靴'
    WHEN 3 THEN '雑貨'
    WHEN 9 THEN '未分類' 
END AS 区分名
FROM 商品

--39
SELECT 商品コード, 商品名, 単価, 
CASE 
    WHEN 単価 < 3000 THEN 'S'
    WHEN 単価 < 10000 THEN 'M'
    WHEN 単価 >= 10000 THEN 'L' 
END AS 販売価格ランク, 商品区分 ||':'||
CASE 商品区分
    WHEN 1 THEN '衣類'
    WHEN 2 THEN '靴'
    WHEN 3 THEN '雑貨'
    WHEN 9 THEN '未分類' 
END AS 商品区分
FROM 商品
ORDER BY 単価 ASC, 商品コード ASC

--40
SELECT 商品名 , CHARACTER_LENGTH(商品名) AS 文字数
FROM 商品
WHERE CHARACTER_LENGTH(商品名) > 10
ORDER BY CHARACTER_LENGTH(商品名)

--41
SELECT 注文日, SUBSTRING(注文番号, 9, 4)
FROM 注文

--42
UPDATE 商品
SET 商品コード = CONCAT('E', SUBSTRING(商品コード, 2, 4))
WHERE 商品コード LIKE 'M%'

---43

SELECT SUBSTRING(注文番号, 9, 4)
FROM 注文
WHERE SUBSTRING(注文番号, 9, 4) BETWEEN 1000 AND 2000
ORDER BY SUBSTRING(注文番号, 9, 4) ASC

--44

UPDATE 廃盤商品
SET 廃盤日 = CURRENT_DATE
WHERE 商品コード = 'S1990'

--45

SELECT 商品コード, 商品区分, 単価, TRUNCATE(単価 - 単価 * 0.3, 0) AS 値下げ後の単価
FROM 商品
WHERE 単価 >= 10000


--46

SELECT SUM(数量)
FROM 注文

--47
SELECT 注文日, SUM(数量)
FROM 注文
GROUP BY 注文日
ORDER BY 注文日

--48

SELECT 商品区分, MAX(単価), MIN(単価)
FROM 商品
GROUP BY 商品区分
ORDER BY 商品区分

--49
SELECT SUM(数量)
FROM 注文
GROUP BY 商品コード

--50
SELECT 商品コード, SUM(数量)
FROM 注文
GROUP BY 商品コード
ORDER BY SUM(数量) DESC, 商品コード ASC
LIMIT 10

--51
SELECT 商品コード, SUM(数量)
FROM 注文
GROUP BY 商品コード
HAVING SUM(数量) < 5 

--52

SELECT COUNT(クーポン割引料) AS 割引件数, SUM(クーポン割引料) AS 割引額合計
FROM 注文

--53
SELECT SUBSTRING(注文番号, 1, 6) AS 年月, COUNT(*) AS 注文件数
FROM 注文
GROUP BY SUBSTRING(注文番号, 1, 6)
ORDER BY SUBSTRING(注文番号, 1, 6)

--54
SELECT 商品コード, SUM(数量)
FROM 注文
WHERE 商品コード LIKE 'Z%'
GROUP BY 商品コード
HAVING SUM(数量) >= 100

--55

SELECT 商品コード, 商品名, 単価, (
    SELECT SUM(数量)
    FROM 注文
    WHERE 商品コード = 'S0604'
)AS 販売した数量
FROM 商品
WHERE 商品コード = 'S0604' 


--56

UPDATE 

--57

SELECT 注文日, 商品コード
FROM 注文
WHERE 商品コード IN(
    SELECT 商品コード
    FROM 商品
    WHERE 商品名 LIKE '%あったか%'
)
ORDER BY 注文日

--58

SELECT 商品コード, SUM(数量)
FROM 注文
GROUP BY 商品コード
HAVING SUM(数量) > ALL(
    SELECT AVG(数量)
    FROM 注文
    GROUP BY 商品コード
)


--59

SELECT A.数量合計 AS 割引による販売数, TRUNC(A.割引金額)


--60

INSERT INTO 

--61

SELECT t.注文番号, t.注文枝番, t.商品コード, s.商品名, t.数量
FROM 注文 AS t
JOIN 商品 AS s
ON t.商品コード = s.商品コード
WHERE 注文番号 = '202401130115'

--62

SELECT t.注文日, t.注文番号, t.注文枝番, t.数量, h.単価 * t.数量 AS 注文金額
FROM 注文 AS t
JOIN 廃盤商品 AS h
ON t.商品コード = h.商品コード
WHERE h.商品コード = 'A0009'
AND t.注文日 > h.廃盤日

--63

SELECT s.商品コード, s.商品名, s.単価, t.注文日, t.注文番号, t.数量, s.単価 * t.数量 AS 売上金額
FROM 商品 AS s
JOIN 注文 AS t
ON s.商品コード = t.商品コード
ORDER BY 4 ASC

--64

SELECT t.商品コード , s.商品名
FROM 注文 AS t
JOIN 商品 AS s
ON t.商品コード = s.商品コード
WHERE t.注文日 >= '2022-08-01' AND 注文日 < '2022-09-01' 

--65

SELECT t.商品コード , COALESCE(s.商品名, '廃盤済み')
FROM 注文 AS t
LEFT JOIN 商品 AS s
ON t.商品コード = s.商品コード
WHERE t.注文日 >= '2022-08-01' AND 注文日 < '2022-09-01'

--66

SELECT t.注文日, CONCAT(s.商品コード, ':' , s.商品名) AS 商品, COALESCE(t.数量, 0)
FROM 注文 AS t
RIGHT JOIN 商品 AS s
ON t.商品コード = s.商品コード
WHERE 商品区分 = '3'

--67

SELECT t.注文日, CONCAT(s.商品コード, ':' , s.商品名) AS 商品, COALESCE(t.数量, 0)
FROM 注文 AS t
RIGHT JOIN (商品 AS s
ON t.商品コード = s.商品コード
WHERE 商品区分 = '3'
UNION
SELECT 商品コード, '廃盤済み', AS 商品名, 商品区分
FROM 廃盤商品


--68

SELECT t.注文日, t.注文番号, t.注文枝番, t.商品コード, 
COALESCE(s.商品名, h.商品名), COALESCE(s.単価, h.単価), t.数量, COALESCE(s.単価, h.単価) * t.数量 - t.クーポン割引料 AS 注文金額 
FROM 注文 AS t
JOIN 商品 AS s
ON t.商品コード = s.商品コード
LEFT JOIN 廃盤商品 AS h
ON s.商品コード = h.商品コード
WHERE t.注文番号 = '202304030010'

--69

SELECT s.商品コード, s.商品名, s.単価, COALESCE(t.数量, 0) AS 売上個数, s.単価 * COALESCE(t.数量 , 0) AS 総売上
FROM 商品 AS s
LEFT JOIN(
    SELECT 商品コード, SUM(数量) AS 数量
    FROM 注文
    WHERE 商品コード LIKE 'B%'
    GROUP BY 商品コード
)  AS t
ON s.商品コード = t.商品コード
WHERE 商品コード LIKE 'B%'
ORDER BY s.商品コード


--70



SELECT S1.商品コード
