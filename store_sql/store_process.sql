-- 1

SELECT 商品コード, 商品名, 単価, 商品区分, 関連商品コード
FROM 商品

-- 2

SELECT 商品名
FROM 商品

-- 3

SELECT *
FROM 注文

-- 4

SELECT 注文番号, 注文枝番, 商品コード
FROM 注文

-- 5

INSERT INTO 商品
VALUES('W0461', '冬のあったかコート', 12800, '1', NULL);

INSERT INTO 商品
VALUES('S0331', '春のさわやかコート', 6800, '1', NULL);

INSERT INTO 商品
VALUES('A0582', '秋のシックなコート', 9800, '1', NULL);

-- 6

SELECT *
FROM 商品
WHERE 商品コード = 'W1252';

-- 7

UPDATE 商品
SET 単価 = 500
WHERE 商品コード = 'S0023'

-- 8

SELECT *
FROM 商品
WHERE 単価 <= 1000;

-- 9

SELECT *
FROM 商品
WHERE 単価 >= 50000;

-- 10

SELECT *
FROM 注文
WHERE 注文日 > '2023-12-31';

-- 11

SELECT *
FROM 注文
WHERE 注文日 < "2023-11-01"

-- 12

SELECT *
FROM 商品
WHERE 商品区分 <> 1;

-- 13

SELECT *
FROM 注文
WHERE クーポン割引料 IS NULL;

-- 14

SELECT *
FROM 商品
WHERE 商品コード LIKE 'N%';

-- 15

SELECT 商品コード, 商品名, 単価
FROM 商品
WHERE 商品名 LIKE '%コート%'

-- 16

SELECT 商品コード, 商品区分
FROM 商品
WHERE 商品区分 IN(2, 3, 9)

-- 17

SELECT *
FROM 商品
WHERE 商品コード BETWEEN 'A0100' AND 'A0500';

-- 18

SELECT *
FROM 注文
WHERE 商品コード IN('N0501', 'N1021', 'N0223')

-- 19

SELECT *
FROM 商品
WHERE 商品区分 = 3
AND 商品名 LIKE '%水玉%';

-- 20

SELECT *
FROM 商品
WHERE 商品名 LIKE '%軽い%'
OR 商品名 LIKE '%ゆるふわ%';


-- 21

SELECT *
FROM 商品
WHERE
商品区分 = 1 AND 単価 < 3000
OR
商品区分 = 3 AND 単価 >= 10000;

-- 22

SELECT *
FROM 注文
WHERE 注文日 >= '2024-03-01'
AND 注文日 <= '2024-03-31'
AND 数量 >= 3

-- 23

SELECT *
FROM 注文
WHERE 数量 >= 10
OR クーポン割引料 IS NOT NULL;

-- 24

-- 25

SELECT 商品コード, 商品名
FROM 商品
WHERE 商品区分 = '1'
ORDER BY 商品コード DESC;

-- 26

SELECT 注文日, 注文番号, 注文枝番, 商品コード, 数量
FROM 注文
WHERE 注文日 >= '2024-03-01'
ORDER BY 注文日 ASC, 注文番号 ASC, 注文枝番 ASC

-- 27

SELECT DISTINCT 商品コード
FROM 注文
ORDER BY 商品コード ASC;

-- 28

SELECT *
FROM 注文
ORDER BY 注文日 DESC
LIMIT 10;

-- 29

SELECT *
FROM 商品
ORDER BY 単価 ASC, 商品区分 ASC, 商品コード ASC
LIMIT 6, 14


-- 30

SELECT *
FROM 廃盤商品
WHERE 廃盤日 >= '2022-12-01' AND 廃盤日 <= '2022-12-31'
UNION
SELECT *
FROM 廃盤商品
WHERE 売上個数 > 100
ORDER BY 売上個数 DESC;

-- 31

SELECT 商品コード
FROM 商品
EXCEPT
SELECT 商品コード
FROM 注文
ORDER BY 商品コード ASC;

-- 32

SELECT 商品コード
FROM 商品
INTERSECT
SELECT 商品コード
FROM 商品
ORDER BY 商品コード DESC;

-- 33

SELECT 商品コード, 商品名, 単価
FROM 商品
WHERE 商品区分 = '9'
AND 単価 <= 1000
UNION
SELECT 商品コード, 商品名, 単価
FROM 商品
WHERE 商品区分 = '9'
AND 単価 > 10000
ORDER BY 単価 ASC, 商品コード DESC;

-- 34

SELECT 商品コード, 単価, TRUNCATE(単価 - (単価 * 0.05), 0) AS キャンペーン価格
FROM 商品
WHERE 商品区分 = '9'
ORDER BY 商品コード ASC;

-- 35

UPDATE 注文
SET クーポン割引料 = (クーポン割引料 + 300)
WHERE 注文日 >= '2024-03-12' AND 注文日 <= '2024-03-14'
AND 数量 >= 2
AND クーポン割引料 IS NOT NULL;

-- 36

UPDATE 注文
SET 数量 = (数量 - 1)
WHERE 注文番号 = '202402250126'
AND 商品コード = 'W0156';

-- 37

SELECT CONCAT(注文番号, '-', 注文枝番)
FROM 注文
WHERE 注文番号 >= '202310010001' 
AND 注文番号 <= '202310319999';

-- 38

SELECT DISTINCT 商品区分 AS 区分,
CASE 商品区分
    WHEN 1 THEN '衣類'
    WHEN 2 THEN '靴' 
    WHEN 3 THEN '雑貨'
    WHEN 9 THEN '未分類'
    ELSE  
END AS 区分名 
FROM 商品


-- 39
SELECT 商品コード, 商品名, 単価, CONCAT(商品区分, ':', 
CASE 商品区分
    WHEN 1 THEN '衣類'
    WHEN 2 THEN '靴' 
    WHEN 3 THEN '雑貨'
    WHEN 9 THEN '未分類'
END )AS 商品区分 ,
CASE
    WHEN 単価 < 3000 THEN 'S'
    WHEN 単価 < 10000 THEN 'M'
    WHEN 単価 >= 10000 THEN 'L'  
END AS 販売価格ランク
FROM 商品
ORDER BY 単価, 商品コード


-- 40

SELECT 商品名, LENGTH(商品名) AS 文字数
FROM 商品
WHERE LENGTH(商品名) > 10
ORDER BY LENGTH(商品名)

-- 41

SELECT 注文日 , SUBSTRING(注文番号, 9, 4) AS 注文番号
FROM 注文

-- 42

UPDATE 商品
SET 商品コード = CONCAT('E', SUBSTRING(商品コード, 2, 4))
WHERE 商品コード = 'M%';

-- 43

SELECT SUBSTRING(注文番号, 9, 4) AS 注文番号
FROM 注文
WHERE SUBSTRING(注文番号 ,9, 4) >= '1000'
AND SUBSTRING(注文番号, 9, 4) <= '2000' 
ORDER BY SUBSTRING(注文番号, 9, 4)

-- 44

UPDATE 廃盤商品
SET 廃盤日 = CURRENT_DATE
WHERE 商品コード = "S1990" 

-- 45

SELECT 商品コード, 商品名, 単価, TRUNCATE(単価 - (単価 * 0.30), 0) AS 値下げした単価
FROM 商品
WHERE 単価 >= 10000;

-- 46

SELECT SUM(数量)
FROM 注文

-- 47

SELECT 注文日, SUM(数量)
FROM 注文
GROUP BY 注文日
ORDER BY 注文日;

-- 48

SELECT 商品区分, MIN(単価) AS 最少額, MAX(単価) AS 最高額
FROM 商品
GROUP BY 商品区分
ORDER BY 商品区分;

-- 49

SELECT 商品コード , SUM(数量) AS 数量合計
FROM 注文
GROUP BY 商品コード
ORDER BY 商品コード;

-- 50

SELECT 商品コード , SUM(数量) AS 数量合計
FROM 注文
GROUP BY 商品コード
ORDER BY 数量合計 DESC,
商品コード OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY;

-- 51
-- 52
-- 53
-- 54
-- 55
-- 56
-- 57
-- 58
-- 59
-- 60
-- 61
-- 62
-- 63
-- 64
-- 65
-- 66
-- 67
-- 68
-- 69
-- 70
-- 71
-- 72
-- 73
-- 74
-- 75