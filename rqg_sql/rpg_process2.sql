
-- 1

SELECT id, 名称, 職業コード, `HP`, `MP`, 状態コード
FROM パーティ

-- 2

SELECT 名称 AS なまえ, HP AS 現在のHP, MP AS 現在のMP
FROM パーティ

-- 3

SELECT *
FROM イベント

-- 4

SELECT イベント番号 AS 番号, イベント名称 AS 場面
FROM イベント

-- 5

INSERT INTO パーティ
VALUES('A01', 'スガワラ', '21', 131, 232, '03')

INSERT INTO パーティ
VALUES('A02', 'オーエ', '10', 156, 84, '00')

INSERT INTO パーティ
VALUES('A03', 'イズミ', '20', 84, 190, '00')

--6

SELECT *
FROM パーティ
WHERE id = 'C02'

--7

UPDATE パーティ
SET HP = 120
WHERE id = 'A01'

--8

SELECT id, 名称, `HP`
FROM パーティ
WHERE HP < 100

--9

SELECT id , 名称 , `MP`
FROM パーティ
WHERE MP >= 100


--10

SELECT * 
FROM イベント
WHERE タイプ <> '3'

--11

SELECT イベント番号, イベント名称
FROM イベント
WHERE イベント番号 <= 5

--12

SELECT イベント番号, イベント名称
FROM イベント
WHERE イベント番号 > 20

--13

SELECT イベント番号, イベント名称
FROM イベント
WHERE 前提イベント番号 IS NULL

--14

SELECT イベント番号, イベント名称
FROM イベント
WHERE 後続イベント番号 IS NOT NULL

--15

UPDATE パーティ
SET 状態コード = '01'
WHERE 名称 LIKE 'ミ%'

--16

SELECT id, 名称, `HP`
FROM パーティ
WHERE `HP` BETWEEN 120 AND 160

--17

SELECT * 
FROM パーティ
WHERE 職業コード IN('01', '10', '11')

--18

SELECT *
FROM パーティ
WHERE 状態コード NOT IN('00', '09')

--19

SELECT *
FROM パーティ
WHERE HP > 100
AND MP > 100

--20

SELECT *
FROM パーティ
WHERE id LIKE 'A%'
AND 職業コード LIKE '2%'

--21

SELECT *
FROM イベント
WHERE タイプ = '1'
AND 前提イベント番号 IS NOT NULL
AND 後続イベント番号 IS NOT NULL

--23

SELECT DISTINCT 状態コード
FROM パーティ

--24

SELECT id 名称
FROM パーティ
ORDER BY id

--25

SELECT 名称, 職業コード
FROM パーティ
ORDER BY 1 DESC

--26

SELECT 名称, HP, 状態コード
FROM パーティ
ORDER BY 3 ASC, 2 DESC

--27

SELECT タイプ, イベント番号, イベント名称, 前提イベント番号, 後続イベント番号
FROM イベント
ORDER BY 1 

--28

SELECT *
FROM パーティ
ORDER BY HP DESC
LIMIT 3;


--29

SELECT *
FROM パーティ
ORDER BY MP DESC
LIMIT 2, 1

--30

SELECT イベント番号
FROM イベント
EXCEPT
SELECT イベント番号
FROM 経験イベント
ORDER BY イベント番号

--31

SELECT イベント番号
FROM イベント
WHERE タイプ = '2'
INTERSECT
SELECT イベント番号
FROM 経験イベント
WHERE クリア区分 = '1'
ORDER BY イベント番号

--32

SELECT 
CASE 
    WHEN 職業コード LIKE '1%' THEN 'S'
    WHEN 職業コード LIKE '2%' THEN 'M'  
    ELSE 'A'
END AS 職業区分, 職業コード, id, 名称
FROM パーティ
ORDER BY 2

--33

SELECT 名称 AS なまえ, HP AS 現在のHP, (HP + 50) AS 装備後のHP
FROM パーティ
WHERE 職業コード IN('11', '21')

--34
UPDATE パーティ
SET MP = MP + 20
WHERE id IN('A01', 'A03')


--35
SELECT 名称 AS なまえ, HP AS 現在のHP, HP * 2 AS 予想されるダメージ
FROM パーティ
WHERE 職業コード = '11'

--36
SELECT 名称 AS なまえ, CONCAT(HP, '/', MP) AS HPとMP, 
CASE 状態コード
    WHEN 00 THEN '異常なし'
    WHEN 01 THEN '眠り'
    WHEN 02 THEN '毒'
    WHEN 03 THEN '沈黙'
    WHEN 04 THEN '混乱'
    WHEN 09 THEN '気絶'
    ELSE ""
END AS ステータス
FROM パーティ

--37

SELECT イベント番号, イベント名称,
CASE タイプ
    WHEN 1 THEN "強制"
    WHEN 2 THEN "フリー"
    WHEN 3 THEN "特殊"
END AS タイプ,
CASE 
    WHEN イベント番号 BETWEEN 1 AND 10 THEN '序盤'  
    WHEN イベント番号 BETWEEN 11 AND 17 THEN '中盤'
    ELSE "終盤"  
END AS 発生時期
FROM イベント

--38
SELECT 名称 AS なまえ, HP AS 現在のHP , CHARACTER_LENGTH(名称) * 10 AS 予想ダメージ
FROM パーティ

--39
UPDATE パーティ
SET 状態コード = '04'
WHERE HP % 4 = 0
OR MP % 4 = 0

--40

SELECT TRUNCATE(777 * 0.7, 0)AS 支払った金額

--41



--42
SELECT 名称 AS なまえ, HP, POWER(HP , 0) AS 攻撃1回目, POWER(HP, 1) AS 攻撃2回目, POWER(HP, 2) AS 攻撃3回目
FROM パーティ
WHERE 職業コード = '10'

--43
SELECT 名称 AS なまえ, HP, 状態コード,
CASE 
    WHEN HP <= 50 THEN '3'
    WHEN HP <= 100 THEN '2'
    WHEN HP <= 150 THEN '1'  
    ELSE 0
END AS リスク値
FROM パーティ
ORDER BY 4 ASC

--44
SELECT COALESCE(前提イベント番号, '前提無し'), イベント番号, COALESCE(後続イベント番号, '後続無し')
FROM イベント

--45
SELECT SUM(HP), MAX(HP), MIN(HP), SUM(MP), MAX(MP), MIN(MP)
FROM パーティ

--46
SELECT タイプ, COUNT(*)
FROM イベント
GROUP BY タイプ
ORDER BY タイプ

--47
SELECT クリア結果, COUNT(*)
FROM 経験イベント
GROUP BY クリア結果
ORDER BY クリア結果

--48
SELECT 
CASE 
    WHEN SUM(MP) < 500 THEN '敵は見とれている！'
    WHEN SUM(MP) < 1000 THEN '敵は茫然としている！'
    WHEN SUM(MP) >= 1000 THEN '敵はひれ伏している！'
END AS 敵の状態
FROM 

--49
SELECT クリア区分, COUNT(*) as イベント数
FROM 経験イベント
GROUP BY クリア区分

--50

SELECT SUBSTRING(職業コード, 1, 1), MAX(HP), MIN(HP), AVG(HP), MAX(MP), MIN(MP), AVG(MP)
FROM パーティ
GROUP BY SUBSTRING(職業コード, 1, 1)
ORDER BY SUBSTRING(職業コード, 1, 1)


--51
SELECT SUBSTRING(id, 1 , 1), AVG(HP), AVG(MP)
FROM パーティ
GROUP BY SUBSTRING(id, 1 , 1)
HAVING AVG(HP) > 100

--52
SELECT 
CASE 
    WHEN SUM(HP) < 100 THEN "1枚"
    WHEN SUM(HP) < 150 THEN "2枚"
    WHEN SUM(HP) < 200 THEN "3枚"
    WHEN SUM(HP) >= 200 THEN "5枚"
END AS 力の扉
FROM パーティ

--53
SELECT 名称, HP, 
ROUND(HP / (SELECT SUM(`HP`) FROM パーティ)* 100, 1) AS パーティでの割合
FROM パーティ
WHERE 職業コード = '01'

--54
UPDATE パーティ
SET `MP` = MP + (
    SELECT ROUND(SUM(MP) * 0.1)
    FROM パーティ
    WHERE 職業コード <> '20'
)
WHERE 職業コード = '20'

--55
SELECT イベント番号, クリア結果
FROM 経験イベント
WHERE クリア区分 = '1'
AND イベント番号 IN(
    SELECT イベント番号
    FROM イベント
    WHERE タイプ IN('1', '3'))

--56
SELECT 名称, MP
FROM パーティ
WHERE `MP` = (
    SELECT MAX(`MP`)
    FROM パーティ
)

--57
SELECT イベント番号, イベント名称
FROM イベント
WHERE イベント番号 NOT IN(
    SELECT イベント番号
    FROM 経験イベント
)
ORDER BY イベント番号

--58
SELECT COUNT(*)
FROM イベント
WHERE イベント番号 NOT IN(
    SELECT イベント番号
    FROM 経験イベント
)

SELECT COUNT(*)
FROM (
    SELECT イベント番号
    FROM イベント
    EXCEPT
    SELECT イベント番号
    FROM 経験イベント
)

--59
SELECT イベント番号, イベント名称
FROM イベント
WHERE イベント番号 < (
    
    SELECT イベント番号
    FROM 経験イベント
    WHERE ルート番号 = 5
)

--60
SELECT イベント番号, イベント名称, 前提イベント番号
FROM イベント
WHERE 前提イベント番号 = ANY(
    SELECT イベント番号
    FROM 経験イベント
    WHERE クリア区分 = '1'
)

--61
--62
SELECT k.ルート番号, k.イベント番号, e.イベント名称, k.クリア結果
FROM 経験イベント AS k
JOIN イベント AS e
ON k.イベント番号 = e.イベント番号
ORDER BY 1 ASC

--63
SELECT e.イベント番号, e.イベント名称, k.クリア区分
FROM イベント AS e
JOIN 経験イベント AS k
ON e.イベント番号 = k.イベント番号
WHERE e.タイプ = '1'
ORDER BY イベント番号

--64
SELECT e.イベント番号, e.イベント名称, COALESCE(k.クリア区分, '未クリア')
FROM イベント AS e
LEFT JOIN 経験イベント AS k
ON e.イベント番号 = k.イベント番号
WHERE e.タイプ = '1'
ORDER BY イベント番号

--65
SELECT id, 名称, S.コード名称 as 職業, J.コード名称 as 状態
FROM パーティ AS p
JOIN (SELECT コード値, コード名称 FROM コード WHERE コード種別 = '1') AS S
ON p.職業コード = S.コード値
JOIN (SELECT コード値, コード名称 FROM コード WHERE コード種別 = '2') AS J
ON p.状態コード = J.コード値
ORDER BY id

--66
SELECT p.id, COALESCE(p.名称, '仲間になっていない'), s.コード名称 AS 職業
FROM パーティ AS p
RIGHT JOIN (SELECT コード値, コード名称 FROM コード WHERE コード種別 = '1') AS s
ON p.職業コード = s.コード値

--67
SELECT CONCAT(コード値, ':', コード名称), イベント番号, クリア区分, クリア結果
FROM 経験イベント AS k
LEFT JOIN (SELECT コード値, コード名称 FROM コード WHERE コード種別 = '4') AS c
ON k.クリア結果 = c.コード値
UNION
SELECT CONCAT(コード値, ':', コード名称), イベント番号, クリア区分, クリア結果
FROM 経験イベント AS k
RIGHT JOIN (SELECT コード値, コード名称 FROM コード WHERE コード種別 = '4') AS c
ON k.クリア結果 = c.コード値

--68
SELECT e1.イベント番号, e1.イベント名称, e1.前提イベント番号, e2.イベント名称
FROM イベント AS e1
JOIN イベント AS e2
ON e1.イベント番号 = e2.イベント番号
WHERE e1.前提イベント番号 IS NOT NULL

--69
SELECT e1.イベント番号, e1.イベント名称, e1.前提イベント番号, e2.イベント名称, e1.後続イベント番号, e3.イベント名称
FROM イベント AS e1
LEFT JOIN イベント AS e2
ON e1.イベント番号 = e2.イベント番号
LEFT JOIN イベント AS e3
ON e1.イベント番号 = e3.イベント番号
WHERE e1.前提イベント番号 IS NOT NULL
OR e1.後続イベント番号 IS NOT NULL


--70
SELECT イベント番号, イベント名称, 前提イベント数
FROM イベント AS e
JOIN (SELECT 前提イベント番号, COUNT(前提イベント番号) AS 前提イベント数 FROM イベント WHERE 前提イベント番号 IS NOT NULL GROUP BY 前提イベント番号) AS z
ON e.イベント番号 = z.前提イベント番号 ORDER BY e.イベント番号