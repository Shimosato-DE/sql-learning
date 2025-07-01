--基本文法と4大命令
--1

SELECT account_id, name, type, balance, update_date
FROM accounts;

--2

SELECT account_id
FROM accounts;

--3

SELECT account_id, balance
FROM accounts;

--4

SELECT *
FROM accounts

--5

UPDATE accounts
SET `name` = 'XXXXX';

--6

UPDATE accounts
SET `balance` = 99999999, `update_date` = '2024-03-01';

--7

INSERT INTO accounts
(`account_id`, `name`, `type`, `balance`, `update_date`)
VALUES
('0642191', 'アオキ　ハルカ', 1, 3640551, '2024-03-13'),
('1039410', 'キノシタ　リュウジ', 1, 259017, '2023-11-30'),
('1239855', 'タカシナ　ミツル', 2, 6509773, null);

--8

DELETE
FROM accounts;

--操作する行の絞り込み
--9

SELECT *
FROM accounts
WHERE account_id = 0037651;

--10

SELECT *
FROM accounts
WHERE balance > 0;

--11

SELECT *
FROM accounts
WHERE account_id < 1000000;

--12

SELECT *
FROM accounts
WHERE update_date < '2023-01-01';

--13

SELECT *
FROM accounts
WHERE balance > 1000000;

--14

SELECT *
FROM accounts
WHERE `type` != 1;

--15

SELECT *
FROM accounts
WHERE update_date IS NULL;

--16

SELECT *
FROM accounts
WHERE name LIKE "%ハシ%";

--17

SELECT *
FROM accounts
WHERE update_date LIKE "2024-01%";

--18

SELECT *
FROM accounts
WHERE

--19

SELECT *
FROM accounts
WHERE name IN('サカタ　リョウヘイ', 'マツモト　ミワコ', 'ハマダ　サトシ');


-- 20

SELECT *
FROM accounts
WHERE update_date BETWEEN '2023-12-30' AND '2024-01-04';

-- 21

SELECT *
FROM accounts
WHERE balance < 10000
AND update_date IS NOT NULL;

-- 22

SELECT *
FROM accounts
WHERE account_id LIKE '2%'
OR
(name LIKE 'エ___　%'
AND name LIKE '%コ')

-- 23

--A.取引テーブル

--検索結果の加工
-- 24

SELECT *
FROM accounts
ORDER BY account_id ASC;

-- 25

SELECT DISTINCT name
FROM accounts
ORDER BY name ASC;

-- 26

SELECT *
FROM accounts
ORDER BY 4 DESC, 1 ASC;

-- 27

SELECT *
FROM accounts
WHERE update_date IS NOT NULL
ORDER BY update_date ASC
LIMIT 10;

-- 28

SELECT update_date, balance
FROM accounts
WHERE balance IS NOT NULL
AND update_date IS NOT NULL
ORDER BY balance ASC, update_date ASC
LIMIT 11, 10;


-- 29

SELECT account_id
FROM accounts
UNION
SELECT account_id
FROM abolished_accounts;

-- 30

SELECT name
FROM accounts
EXCEPT
SELECT name
FROM abolished_accounts

-- 31

SELECT name
FROM accounts
UNION
SELECT name
FROM abolished_accounts
ORDER BY name ASC;

-- 32

SELECT account_id, balance
FROM accounts
WHERE balance = 0
UNION
SELECT account_id, blance_at_cancellation
FROM abolished_accounts
WHERE blance_at_cancellation != 0
ORDER BY account_id ASC;

--式と関数
-- 33

SELECT name
FROM accounts
UNION
SELECT name
FROM abolished_accounts

-- 34

SELECT ROUND(balance / 1000) AS 千円単位の残高
FROM accounts
WHERE balance >= 1000000;

-- 35

INSERT INTO accounts
(`account_id`, `name`, `type`, `balance` + 3000 , `update_date`)
VALUE('0652281', 'タカギ　ノブオ' , 1, 100000, '2024-04-01');

INSERT INTO accounts
(`account_id`, `name`, `type`, `balance` + 3000 , `update_date`)
VALUE('1026413', 'マツモト　サワコ' , 1, 300000, '2024-04-02');

INSERT INTO accounts
(`account_id`, `name`, `type`, `balance` + 3000 , `update_date`)
VALUE('2239710', 'ササキ　シゲノリ' , 1, 100000, '2024-04-03');

-- 36

UPDATE accounts
SET 

-- 37

SELECT account_id, update_date, update_date + INTERVAL 180 DAY AS 通帳期限日
FROM accounts
WHERE update_date < '2023-01-01;'


-- 38

SELECT account_id, CONCAT('カ)', name)
FROM accounts
WHERE `type` = 3

-- 39

SELECT DISTINCT `type` AS 種別コード, 
    CASE `type`
    WHEN 1 THEN '普通'
    WHEN 2 THEN '当座'
    WHEN 3 THEN '別段'
END AS 種別名
FROM accounts
ORDER BY `type` ASC;

-- 40

SELECT account_id, name, 
    CASE
        WHEN balance < 100000 THEN 'C' 
        WHEN balance < 1000000 THEN 'B'
        ELSE  'A'
    END AS 残高ランク
FROM accounts

-- 41

SELECT account_id, REPLACE(name, '　', ''), balance
FROM accounts

-- 42

SELECT *
FROM accounts
WHERE name LIKE 'カワ%' COLLATE utf8mb4_bin
OR name LIKE '_カワ%' COLLATE utf8mb4_bin
OR name LIKE '__カワ%' COLLATE utf8mb4_bin;

-- 43

SELECT 
FROM accounts


-- 44

SELECT account_id, balance, TRUNCATE(balance * 0.0002, -1) AS 利息
FROM accounts

-- 45

SELECT account_id, balance, 
    CASE 
        WHEN balance < 500000 THEN TRUNCATE(balance * 0.0001, -1)
        WHEN balance < 2000000 THEN TRUNCATE(balance * 0.0002, -1)
        WHEN balance >= 2000000 THEN TRUNCATE(balance * 0.0003, -1)
    END AS 残高別利息
FROM accounts
ORDER BY 残高別利息 DESC, account_id ASC;

-- 46

INSERT INTO accounts
(`account_id`, `name`, `type`, `balance` , `update_date`)
VALUE('0351262', 'イトカワ　ダイ' , 2, 635110, CURRENT_TIMESTAMP);

INSERT INTO accounts
(`account_id`, `name`, `type`, `balance`, `update_date`)
VALUE('1015513', 'アキツ　ジュンジ' , 1, 88463, CURRENT_TIMESTAMP);

INSERT INTO accounts
(`account_id`, `name`, `type`, `balance`, `update_date`)
VALUE('1739298', 'ホシノ　サトミ' , 1, 704610, CURRENT_TIMESTAMP);

-- 47

SELECT DATE_FORMAT(update_date, '%Y年%m月%d日')
FROM accounts
WHERE update_date >= '2024-01-01';

-- 48

SELECT COALESCE(update_date, '設定なし')
FROM accounts


-- 49

SELECT SUM(balance), MAX(balance), MIN(balance), AVG(balance), COUNT(*)
FROM accounts

-- 50

SELECT COUNT(*)
FROM accounts
WHERE `type` != 1
AND balance >= 1000000
AND update_date <= '2023-12-31'

-- 51

SELECT COUNT(*)
FROM accounts
WHERE update_date IS NULL

-- 52

SELECT MAX(name), MIN(name)
FROM accounts

-- 53

SELECT MAX(update_date), MIN(update_date)
FROM accounts

-- 54

SELECT `type`, SUM(balance), MAX(balance), MIN(balance), AVG(balance), COUNT(balance)
FROM accounts
GROUP BY `type`
ORDER BY `type`


-- 55

SELECT
    RIGHT(account_id, 1) AS last_digit,COUNT(*),SUM(balance),MAX(balance),MIN(balance)
FROM accounts
GROUP BY last_digit
ORDER BY last_digit;   


-- 56

SELECT YEAR(update_date) AS Years, COUNT(update_date) AS NnmberOfDate
FROM accounts
WHERE update_date IS NOT NULL
GROUP BY Years
ORDER BY NnmberOfDate

-- 57

SELECT `type`, SUM(balance)
FROM accounts
WHERE balance >= 3000000
GROUP BY `type`

-- 58

SELECT LEFT(name, 1)AS first_chara, COUNT(*), AVG(LENGTH(name))
FROM accounts 
GROUP BY first_chara;


-- 59

UPDATE accounts
SET balance = (
    balance +
    (SELECT deposit_amount
    FROM `index`
    WHERE account_id = '0351333'
    AND transaction_date = '2024-01-11'
    LIMIT 1) -
    (SELECT withdrawal_amount
    FROM `index`
    WHERE account_id = '0351333'
    AND transaction_date = '2024-01-11'
    LIMIT 1)
)
WHERE
    account_id = '0351333';
 

-- 60



-- 61
-- 62
-- 63
-- 64
-- 65

SELECT i.account_id, i.transaction_date, tr.transaction_reason_name, i.deposit_amount, i.withdrawal_amount
FROM `index` AS i
JOIN transaction_reasons AS tr
ON tr.transaction_reason_id = i.transaction_reason_id
WHERE i.account_id IN('0311240', '1234161', '2750902')
GROUP BY i.account_id
ORDER BY i.transaction_date


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
-- 76
-- 77
-- 78
-- 79
-- 80
-- 81
-- 82
-- 83
-- 84
-- 85
-- 86
-- 87
-- 88
-- 89
-- 90
-- 91
-- 92
-- 93
-- 94
-- 95
-- 96
-- 97
-- 98
-- 99
-- 100