-- Active: 1751248523299@@127.0.0.1@3306@learning
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
WHERE `type` IN(1, 2)

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
WHERE account_id LIKE '2______'
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
SET balance = balance + (
    SELECT COALESCE(SUM(deposit_amount), 0) - 
    COALESCE(SUM(withdrawal_amount), 0)
    FROM `index`
    WHERE account_id = '0351333'
    AND transaction_date = '2024-01-11'), 

    update_date = '2024-01-11'

    WHERE account_id = '0351333';

 

-- 60
SELECT balance, (
    SELECT SUM(deposit_amount)
    FROM `index`
    WHERE account_id = '1115600'
    AND transaction_date = '2023-12-28') AS 入金額合計,
    (SELECT SUM(withdrawal_amount)
    FROM `index`
    WHERE account_id = '1115600'
    AND transaction_date = '2023-12-28') AS 出金額合計

FROM accounts
WHERE account_id = '1115600'

-- 61

SELECT account_id, name, balance
FROM accounts
WHERE account_id IN(
    SELECT account_id
    FROM `index`
    WHERE deposit_amount > 1000000
    );

-- 62

SELECT *
FROM accounts
WHERE update_date > 
ALL(SELECT transaction_date FROM `index`)

-- 63



-- 64

INSERT INTO abolished_accounts
SELECT *
FROM accounts
WHERE account_id = '2761055';
DELETE FROM accounts
WHERE account_id = '2761055';

-- 65

SELECT i.account_id, i.transaction_date, tr.transaction_reason_name, i.deposit_amount, i.withdrawal_amount
FROM `index` AS i
JOIN transaction_reasons AS tr
ON tr.transaction_reason_id = i.transaction_reason_id
WHERE i.account_id IN('0311240', '1234161', '2750902')
GROUP BY i.account_id
ORDER BY i.transaction_date


-- 66

SELECT a.account_id, a.name, a.balance, i.transaction_date, i.deposit_amount, i.withdrawal_amount
FROM accounts AS a
JOIN `index` AS i
ON a.account_id = i.account_id
WHERE a.account_id = '0887132'
ORDER BY i.transaction_id;

-- 67

SELECT i.account_id, a.name, a.balance
FROM `index` AS i
JOIN accounts AS a
ON i.account_id = a.account_id
WHERE i.transaction_date = '2022-03-01';


-- 68
--67では、すでに
SELECT i.account_id, COALESCE(a.name, '解約済み')AS 名義, COALESCE(a.balance, '0')
FROM `index` AS i
LEFT JOIN accounts AS a
ON i.account_id = a.account_id
WHERE i.transaction_date = '2022-03-01';


-- 69

SELECT i.transaction_id, CONCAT(CAST(tr.transaction_reason_id AS CHAR), ':', tr.transaction_reason_name) AS 取引事由, i.transaction_date, i.account_id, i.deposit_amount, i.withdrawal_amount
FROM `index` AS i
RIGHT JOIN transaction_reasons AS tr
ON tr.transaction_reason_id = i.transaction_reason_id


-- 70

SELECT DISTINCT i.transaction_reason_id, tr.transaction_reason_name
FROM `index` AS i
LEFT JOIN transaction_reasons AS tr
ON tr.transaction_reason_id = i.transaction_reason_id
UNION
SELECT DISTINCT i.transaction_reason_id, tr.transaction_reason_name
FROM `index` AS i
RIGHT JOIN transaction_reasons
ON tr.transaction_reason_id = i.transaction_reason_id

SELECT DISTINCT COALESCE(i.transaction_reason_id, tr.transaction_reason_id), tr.transaction_reason_name
FROM `index` AS i 
FULL JOIN transaction_reasons AS tr
ON tr.transaction_reason_id = i.transaction_reason_id;


-- 71

SELECT a.account_id, a.name, a.balance, i.transaction_date, tr.transaction_reason_id, i.deposit_amount, i.withdrawal_amount
FROM accounts AS a
JOIN `index` AS i
ON a.account_id = i.account_id
JOIN transaction_reasons AS tr
ON tr.transaction_reason_id = i.transaction_reason_id
WHERE a.account_id = '0887132'
ORDER BY i.transaction_id;


-- 72

SELECT a.account_id, a.name, a.balance, i.transaction_date, i.transaction_reason_id, i.deposit_amount, i.withdrawal_amount
FROM accounts AS a
JOIN `index` AS i
ON i.account_id = a.account_id
WHERE a.balance >= 5000000
AND(i.deposit_amount >= 1000000 OR i.withdrawal_amount >= 1000000)
AND i.transaction_date > 2023-12-31;

-- 73

SELECT a.account_id, a.name, a.balance, i.transaction_date, i.transaction_reason_id, i.deposit_amount, i.withdrawal_amount
FROM accounts AS a
JOIN `index` AS i
ON i.account_id = a.account_id
WHERE a.balance >= 5000000
AND(i.deposit_amount >= 1000000 OR i.withdrawal_amount >= 1000000)
AND i.transaction_date > 2023-12-31;

-- 74

SELECT a.account_id, i.回数, a.account_name
FROM accounts AS a
JOIN (SELECT account_id, COUNT(*) AS 回数
        FROM `index` AS
        GROUP BY account_id, transaction_date
        HAVING COUNT(*) >= 3)AS i
ON a.account_id = i.accouunt_id;



-- 75

SELECT DISTINCT a1.name, a1.account_id, a1.`type`, a1.update_date
FROM accounts AS a1
JOIN accounts AS a2
ON a1.name = a2.name
WHERE a1.account_id <> a2.account_id
ORDER BY a1.name, a1.account_id