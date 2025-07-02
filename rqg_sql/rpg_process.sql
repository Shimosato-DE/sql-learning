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

-- 6

SELECT *
FROM パーティ
WHERE id = 'C02';

-- 7

UPDATE パーティ
SET HP = 120
WHERE id = 'A01'

-- 8

SELECT id, 名称, `HP`
FROM パーティ
WHERE HP < 100

-- 9

SELECT id, 名称, `MP`
FROM パーティ
WHERE MP >= 100

-- 10
SELECT *
FROM イベント
WHERE タイプ <> '3'

-- 11

SELECT イベント番号, イベント名称
FROM イベント
WHERE イベント番号 <= 5

-- 12

SELECT イベント番号, イベント名称
FROM イベント
WHERE イベント番号 > 20 

-- 13

SELECT イベント番号, イベント名称
FROM イベント
WHERE 前提イベント番号 IS NULL;


-- 14

SELECT イベント番号, イベント名称, 後続イベント番号
FROM イベント
WHERE 後続イベント番号 IS NOT NULL;

-- 15

UPDATE パーティ
SET 状態コード = '01'
WHERE 名称 LIKE '%ミ%';


-- 16

SELECT id, 名称, `HP`
FROM パーティ
WHERE HP BETWEEN 120 AND 160;

-- 17

SELECT 名称, 職業コード
FROM パーティ
WHERE 職業コード IN('01','10','11');

-- 18

SELECT *
FROM パーティ
WHERE 状態コード NOT IN('00', '09')

-- 19

SELECT *
FROM パーティ
WHERE HP > 100
AND MP > 100

-- 20

SELECT *
FROM パーティ
WHERE id LIKE 'A%'
AND 職業コード LIKE '2%'

-- 21
SELECT *
FROM イベント
WHERE タイプ = '1'
AND 前提イベント番号 IS NOT NULL
AND 後続イベント番号 IS NOT NULL;

-- 22



-- 23

SELECT DISTINCT 状態コード
FROM パーティ

-- 24

SELECT id, 名称
FROM パーティ
ORDER BY id ASC;

-- 25

SELECT 名称, 職業コード
FROM パーティ
ORDER BY 名称 DESC;

-- 26

SELECT 名称, HP, 状態コード
FROM パーティ
ORDER BY 状態コード ASC, HP DESC


-- 27

SELECT タイプ, イベント番号, イベント名称, 前提イベント番号, 後続イベント番号
FROM イベント
ORDER BY 1 ASC, 2 ASC

-- 28

SELECT *
FROM パーティ
ORDER BY HP DESC
LIMIT 3;

-- 29

SELECT *
FROM パーティ
ORDER BY `MP` DESC
LIMIT 2, 1

-- 30

SELECT イベント番号
FROM イベント
EXCEPT
SELECT イベント番号
FROM 経験イベント
ORDER BY 1

-- 31

SELECT イベント番号
FROM イベント
INTERSECT
SELECT イベント番号
FROM イベント
WHERE タイプ = '2';

-- 32

SELECT 
    CASE 
        WHEN 職業コード LIKE '1%' THEN 'S'
        WHEN 職業コード LIKE '2%' THEN 'M'
        ELSE 'A'
    END AS 職業区分, 職業コード, id, 名称
FROM パーティ
ORDER BY 2;

-- 33

SELECT 名称 AS なまえ, HP AS 現在のHP, HP + 50 AS 装備後のHP
FROM パーティ
WHERE 職業コード IN('11', '21');

-- 34

UPDATE パーティ
SET MP = MP + 20
WHERE id IN('A01', 'A03')

-- 35

SELECT 名称 AS なまえ, HP AS 現在のHP, HP * 2 AS 予想されるダメージ
FROM パーティ
WHERE 職業コード = '11';

-- 36

SELECT 名称 AS なまえ, CONCAT(HP, '/', `MP`) AS HPとMP, 
CASE 状態コード
    WHEN '00'  THEN ''  
    WHEN '01'  THEN '眠り'
    WHEN '02'  THEN '毒'
    WHEN '03'  THEN '沈黙'
    WHEN '04'  THEN '混乱'
    WHEN '05'  THEN '気絶'
    END AS ステータス
FROM パーティ

-- 37

SELECT イベント番号, イベント名称,
CASE タイプ
    WHEN '1'  THEN  '強制'
    WHEN '2'  THEN  'フリー'
    WHEN '3'  THEN  '特殊'
END AS タイプ,
CASE 
    WHEN イベント番号 >=1 AND イベント番号 <= 10 THEN '序盤' 
    WHEN イベント番号 >= 11 AND イベント番号 <= 17 THEN '中盤'  
    ELSE  '終盤'
END AS 発生時期
FROM イベント

-- 38

SELECT 名称 AS なまえ, `HP` AS 現在のHP, LENGTH(名称) * 10 AS 予想ダメージ
FROM パーティ

-- 39

UPDATE パーティ
SET 状態コード = '04'
WHERE HP % 4 =0
OR MP % 4 = 0;

-- 40

SELECT TRUNCATE(777 * 0.7, 0) AS 支払った金額

-- 41

UPDATE パーティ
SET `HP` = ROUND(`HP` * 1.3, 0), MP = ROUND(`MP` * 1.3, 0)

-- 42

SELECT 名称 AS なまえ, `HP`, POWER(HP, 0) AS 攻撃1回目, POWER(HP, 1) AS 攻撃2回目, POWER(`HP`, 2) AS 攻撃3回目
FROM パーティ
WHERE 職業コード = '10'

-- 43

SELECT 名称 AS なまえ, `HP`, 状態コード,  AS リスク値
FROM パーティ


-- 44
-- 45

SELECT MAX(HP), MIN(HP), AVG(HP), MAX(MP), MIN(MP), AVG(MP)
FROM パーティ

-- 46

SELECT タイプ , COUNT(*)
FROM イベント
GROUP BY タイプ

-- 47

SELECT COUNT(イベント番号)
FROM 経験イベント
WHERE クリア区分 = '1'
GROUP BY クリア結果 ORDER BY クリア結果

-- 48

SELECT
CASE 
    WHEN SUM(MP) < 500 THEN '敵は見とれている！'
    WHEN SUM(MP) >= 500 AND SUM(MP) < 1000 THEN '敵は茫然としている'
    WHEN SUM(MP) >= 1000 THEN '敵はひれ伏している' 
END AS 小さな奇跡
FROM パーティ


-- 49

SELECT 
CASE クリア区分
    WHEN '1' THEN 'クリアした'
    WHEN '0' THEN '参加したがクリアしていない'
END AS 区分, COUNT(イベント番号) AS イベント数
FROM 経験イベント
GROUP BY クリア区分

-- 50

SELECT 職業コード ,MAX(HP), MIN(HP),AVG(HP),MAX(MP), MIN(MP), AVG(MP)
FROM パーティ
GROUP BY 職業コード

-- 51

SELECT SUBSTRING(id, 1, 1), AVG(`HP`) ,AVG(MP)
FROM パーティ
GROUP BY SUBSTRING(id, 1, 1)
HAVING AVG(HP) > 100

-- 52

SELECT SUM(
CASE 
    WHEN HP < 100 THEN '1'
    WHEN HP >= 100 AND HP < 150 THEN '2'
    WHEN HP >= 150 AND HP < 200 THEN '3'
    WHEN HP >= 200 THEN '4'  
END) AS 扉の合計数
FROM パーティ

-- 53

SELECT 名称, HP, ROUND(SUM(`HP`) / (
    SELECT SUM(HP)
    FROM パーティ), 1)
FROM パーティ
WHERE 職業コード = '01'

-- 54

UPDATE パーティ SET MP = MP + (
    SELECT ROUND(SUM(MP * 0.1), 1)
    FROM パーティ
    WHERE 職業コード <> '20'
)
WHERE 職業コード = '20'

-- 55

SELECT イベント番号 クリア結果
FROM 経験イベント
WHERE クリア区分 = '1'
AND イベント番号 IN(
    SELECT イベント番号
    FROM イベント
    WHERE タイプ = IN('1', '3')
    )


-- 56

SELECT 名称, `MP`
FROM パーティ
WHERE MP = (
    SELECT MAX(MP)
    FROM パーティ
)

-- 57

SELECT イベント番号, イベント名称
FROM イベント
EXCEPT
SELECT イベント番号, イベント名称
FROM 経験イベント


-- 58

SELECT COUNT(*)
FROM (
    SELECT イベント番号
    FROM イベント
    EXCEPT
    SELECT イベント番号
    FROM 経験イベント
) AS SUB

-- 59

SELECT イベント番号, イベント名称
FROM イベント
WHERE イベント番号 < (
    SELECT イベント番号
    FROM 経験イベント
    WHERE ルート番号 = 5
)

-- 60

SELECT イベント番号, イベント名称, 前提イベント番号
FROM イベント
WHERE 前提イベント番号 = ANY(
    SELECT イベント番号
    FROM 経験イベント
    WHERE クリア区分 = "1"

)

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