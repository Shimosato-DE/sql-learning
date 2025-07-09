
--1
SELECT 口座番号, 名義, 種別, 残高, 更新日
FROM 口座

--2

SELECT 口座番号
FROM 口座

--3

SELECT 口座番号, 残高
FROM 口座

--4

SELECT *
FROM 口座

--5

UPDATE 口座 SET 口座名義 = 'XXXXXXX'

--6

UPDATE 口座
SET 残高 = 9999999, 更新日 = '2024-03-01'

--7

INSERT INTO 口座
(口座番号, 名義, 種別, 残高, 更新日)
VALUES('0642191', 'アオキ　ハルカ', '1', 3640551, '2024-03-13')

INSERT INTO 口座
(口座番号, 名義, 種別, 残高, 更新日)
VALUES('1039410', 'キノシタ　リュウジ', '1', 259017, '2023-11-30')

INSERT INTO 口座
(口座番号, 名義, 種別, 残高, 更新日)
VALUES('1239855', 'タカシナ　ミツル', '2', 6509773, NULL)

--8

DELETE FROM 口座

--9

SELECT *
FROM 口座
WHERE 口座番号 = '0037651'

--10


SELECT *
FROM 口座
WHERE 残高 > 0

--11

SELECT *
FROM 口座
WHERE 口座番号 < '1000000'

--12

SELECT *
FROM 口座
WHERE 更新日 < '2024-01-01'

--13

SELECT *
FROM 口座
WHERE 残高 >= 1000000

--14

SELECT *
FROM 口座
WHERE 種別 != 1

--15

SELECT *
FROM 口座
WHERE 更新日 IS NULL

--16

SELECT *
FROM 口座
WHERE 名義 LIKE '%ハシ%'

--17
SELECT *
FROM 口座
WHERE 更新日 BETWEEN '2024-01-01' AND '2024-01-31' 

--18

SELECT *
FROM 口座
WHERE 種別 IN(2, 3)

--19

SELECT *
FROM 口座
WHERE 名義 IN('サカタ　リョウヘイ', 'マツモト　ミワコ', 'ハマダ　サトシ')

--20
SELECT *
FROM 口座
WHERE 更新日 BETWEEN '2023-12-30' AND '2024-01-04'

--21

SELECT *
FROM 口座
WHERE 残高 < 10000
AND 更新日 IS NOT NULL

--22

SELECT *
FROM 口座
WHERE 口座番号 LIKE '2%'

--23


--24
SELECT *
FROM 口座
ORDER BY 口座番号

--25
SELECT DISTINCT 名義
FROM 口座
ORDER BY 名義

--26
SELECT *
FROM 口座
ORDER BY 残高 DESC, 口座番号 ASC

--27
SELECT *
FROM 口座
WHERE 更新日 IS NOT NULL
ORDER BY 更新日 ASC
LIMIT 10

--28
SELECT 更新日, 残高
FROM 口座
WHERE 残高 > 0
AND 更新日 IS NOT NULL
ORDER BY 残高 ASC, 更新日 DESC
LIMIT 10, 10

--29

SELECT 口座番号
FROM 口座
UNION
SELECT 口座番号
FROM 

--30

SELECT DISTINCT 名義
FROM 口座
EXCEPT
SELECT 名義
FROM 廃止口座
ORDER BY 名義 DESC

--31

SELECT 名義
FROM 口座
INTERSECT
SELECT 名義
FROM 廃止口座
ORDER BY 名義 

--32

SELECT 口座番号, 残高
FROM 口座
WHERE 残高 = 0
UNION
SELECT 口座番号, 解約時残高
FROM 廃止口座
WHERE 解約時残高 > 0
ORDER BY 口座番号

--33
SELECT 口座番号, 名義, '〇' AS 口座区分
FROM 口座
UNION
SELECT 口座番号, 名義, '×' AS 口座区分
FROM 廃止口座

--34
SELECT 口座番号, TRUNCATE(残高 / 1000, 0) AS 千円単位の残高
FROM 口座
WHERE 残高 >= 1000000

--35
INSERT INTO 口座
(口座番号, 名義, 種別, 残高, 更新日)
VALUES('0652281', 'タカギ　ノブオ', '1', 100000 + 3000, '2024-04-01')

INSERT INTO 口座
(口座番号, 名義, 種別, 残高, 更新日)
VALUES('1026413', 'マツモト　サワコ', '1', 300000 + 3000, '2024-04-02')

INSERT INTO 口座
(口座番号, 名義, 種別, 残高, 更新日)
VALUES('2239710', 'ササキ　シゲノリ', '1', 1000000 + 3000, '2024-04-03')

--36
UPDATE 口座
SET 残高 = (残高 - 3000) * 1.003
WHERE 口座番号 IN('0652281','1026413','2239710')

--37
SELECT 口座番号, 更新日, 更新日 + INTERVAL 180 DAY AS 通帳期限日 
FROM 口座
WHERE 更新日 < '2023-01-01'

--38
SELECT 口座番号, CONCAT('カ)', 名義)
FROM 口座
WHERE 種別 = '3'

--39
SELECT DISTINCT 種別,
CASE 種別
    WHEN 1 THEN '普通' 
    WHEN 2 THEN '当座'
    WHEN 3 THEN '別段'
END AS 種別名
FROM 口座

--40

SELECT 口座番号, 名義, 
CASE 
    WHEN 残高 < 100000 THEN 'C' 
    WHEN 残高 < 1000000 THEN 'B'
    ELSE 'A' 
END AS 残高ランク
FROM 口座

--41

SELECT 
    LENGTH(口座番号) AS 口座番号の文字数, 
    CHARACTER_LENGTH(REPLACE(名義, "　", "")) AS 名義の文字数,
    LENGTH(残高) AS 残高の文字数
FROM 口座

--42

SELECT *
FROM 口座
WHERE SUBSTRING(名義, 1, 5) LIKE '%カワ%'

--43

SELECT *
FROM 口座
WHERE LENGTH(残高) >= 4
AND 残高 LIKE '%000'

--44

SELECT 口座番号, 残高, TRUNCATE(残高 * 0.0002, 0) AS 利息
FROM 口座
ORDER BY 残高 DESC

--45

SELECT 口座番号, 残高, 
CASE 
    WHEN 残高 < 500000 THEN TRUNCATE(残高 * 0.0001, 0)
    WHEN 残高 < 2000000 THEN TRUNCATE(残高 * 0.0002, 0) 
    WHEN 残高 >= 2000000 THEN TRUNCATE(残高 * 0.0003, 0) 
END AS 残高別利息
FROM 口座
ORDER BY 口座番号

--46
INSERT INTO 口座
(口座番号, 名義, 種別, 残高, 更新日)
VALUES('0351262', 'イトカワ　ダイ', '2', 635110, CURRENT_DATE)

INSERT INTO 口座
(口座番号, 名義, 種別, 残高, 更新日)
VALUES('1015513', 'アキツ　ジュンジ', '1', 88463, CURRENT_DATE)

INSERT INTO 口座
(口座番号, 名義, 種別, 残高, 更新日)
VALUES('1739298', 'ホシノ　サトミ', '1', 704610, CURRENT_DATE)

--47
SELECT 口座番号, 名義, 種別, 残高, DATE_FORMAT(更新日, '%Y年%m月%d日')
FROM 口座
WHERE 更新日 >= '2024-01-01'


--48
SELECT COALESCE(更新日, '設定なし')
FROM 口座


--49
SELECT SUM(残高), MAX(残高), MIN(残高), AVG(残高), COUNT(*)
FROM 口座

--50
SELECT COUNT(*)
FROM 口座
WHERE 種別 != '1'
AND 残高 >= 1000000
AND 更新日 < '2024-01-01'

--51
SELECT COUNT(*)
FROM 口座
WHERE 更新日 IS NULL

--52
SELECT MAX(名義), MIN(名義)
FROM 口座

--53
SELECT MAX(更新日), MIN(更新日)
FROM 口座

--54
SELECT 種別, SUM(残高), MAX(残高), MIN(残高), AVG(残高), COUNT(*)
FROM 口座
GROUP BY 種別

--55
SELECT SUBSTRING(口座番号, 7, 1), COUNT(*)
FROM 口座
GROUP BY SUBSTRING(口座番号, 7, 1)
ORDER BY 1 ASC

--56
SELECT COALESCE(更新日, 'XXXX年'), SUM(残高), MAX(残高), MIN(残高), AVG(残高), COUNT(*)
FROM 口座
GROUP BY 更新日

--57
SELECT SUM(残高), COUNT(*)
FROM 口座
GROUP BY 種別
HAVING SUM(残高) >= 3000000

--58
SELECT SUBSTRING(名義, 1, 1), COUNT(名義), AVG(CHARACTER_LENGTH(REPLACE(名義, "　", "")))
FROM 口座
GROUP BY SUBSTRING(名義, 1, 1)
HAVING COUNT(名義) >= 10
OR AVG(CHARACTER_LENGTH(REPLACE(名義, "　", ""))) > 5

--59
UPDATE 口座 SET 残高 = 残高 + (
    SELECT COALESCE(SUM(入金額), 0) - COALESCE(SUM(出金額), 0)
    FROM 取引
    WHERE 口座番号 = '0351333'
    AND 日付 = '2024-01-11' 
)
WHERE 口座番号 = '0351333'

--60
SELECT 残高, (
    SELECT SUM(入金額)
    FROM 取引
    WHERE 口座番号 = '1115600'
    AND 日付 = '2023-12-28'
) AS 入金額合計,(
    SELECT SUM(出金額)
    FROM 取引
    WHERE 口座番号 = '1115600'
    AND 日付 = '2023-12-28'
) AS 出金額合計

FROM 口座
WHERE 口座番号 = '1115600'

--61
SELECT 口座番号, 名義, 残高
FROM 口座
WHERE 口座番号 IN(
    SELECT 口座番号
    FROM 取引
    WHERE 入金額 >= 1000000
)

--62
SELECT *
FROM 口座
WHERE 更新日 > ALL(
    SELECT 日付
    FROM 取引
    )

--63
SELECT 

--64

INSERT INTO 廃止口座
SELECT *
FROM 口座
WHERE 口座番号 = '2761055'

DELETE FROM 口座
WHERE 口座番号 = '2761055'

--65
SELECT t.口座番号, t.日付, r.取引事由名, COALESCE(t.入金額, t.出金額) AS 取引金額
FROM 取引 AS t
JOIN 取引事由 AS r
ON t.`取引事由ID` = r.`取引事由ID`
WHERE 口座番号 IN('0311240', '1234161', '2750902')

--66
SELECT k.口座番号, k.名義, k.残高, t.日付, t.入金額, t.出金額
FROM 口座 AS k
JOIN 取引 AS t
ON k.口座番号 = t.口座番号
WHERE k.口座番号 = '0887132'
ORDER BY t.日付 ASC

--67

SELECT t.口座番号, k.名義, k.名義
FROM 取引 AS t 
JOIN 口座 AS k
ON t.口座番号 = k.口座番号
WHERE t.日付 = '2022-03-01'

--68

SELECT t.口座番号, COALESCE(k.名義, '解約済み'), COALESCE(k.残高, 0)
FROM 取引 AS t 
LEFT JOIN 口座 AS k
ON t.口座番号 = k.口座番号
WHERE t.日付 = '2022-03-01'


--69

SELECT t.取引番号, CONCAT(t.`取引事由ID`, ':', r.取引事由名), t.日付, t.口座番号, t.入金額, t.出金額
FROM 取引 AS t
JOIN 取引事由 AS r
ON t.`取引事由ID` = r.`取引事由ID`


--70

SELECT DISTINCT t.`取引事由ID`, r.取引事由名
FROM 取引 AS t
LEFT JOIN 取引事由 AS r
ON t.`取引事由ID` = r.`取引事由ID`
UNION
SELECT DISTINCT t.`取引事由ID`, r.取引事由名
FROM 取引 AS t
RIGHT JOIN 取引事由 AS r
ON t.`取引事由ID` = r.`取引事由ID`

--71

SELECT t.日付, r.取引事由名, t.入金額, t.出金額
FROM 口座 AS k
JOIN 取引 AS t
ON k.口座番号 = t.口座番号
JOIN 取引事由 AS r
ON t.`取引事由ID` = r.`取引事由ID`
WHERE k.口座番号 = '0887132'
ORDER BY t.日付 ASC

--72
SELECT k.口座番号, k.名義, k.残高, t.日付, t.取引事由ID, t.入金額, t.出金額 
FROM 口座 AS k
JOIN 取引 AS t
ON k.口座番号 = t.口座番号
WHERE k.残高 >= 5000000
AND t.日付 >= '2024-01-01'
AND t.入金額 > 1000000 OR t.出金額 > 1000000

--73

SELECT k.口座番号, k.名義, k.残高, t.日付, t.取引事由ID, t.入金額, t.出金額 
FROM 口座 AS k
JOIN (
    SELECT 口座番号, 日付, 取引事由ID, 入金額, 出金額 
    FROM 取引
    WHERE 日付 >= '2024-01-01'
    AND (入金額 > 1000000 OR 出金額 > 1000000)
) AS t
ON k.口座番号 = t.口座番号
WHERE k.残高 >= 5000000

--74
SELECT k.口座番号, t.日付, t.回数, k.名義
FROM 口座 AS k
JOIN (
    SELECT 口座番号, 日付, COUNT(*) AS 回数
    FROM 取引
    GROUP BY 口座番号,日付
    HAVING COUNT(*) >= 3 
    ) AS t
ON k.口座番号 = t.口座番号

--75

SELECT DISTINCT k1.名義, k1.口座番号, k1.種別, k1.残高, k1.更新日
FROM 口座 AS k1
JOIN 口座 AS k2
ON k1.名義 = k2.名義
WHERE k1.口座番号 <> k2.口座番号
ORDER BY k1.名義, k1.口座番号