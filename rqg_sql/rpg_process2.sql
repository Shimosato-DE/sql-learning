
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
