--口座テーブル
CREATE TABLE IF NOT EXISTS `accounts` (
    `account_id` CHAR(7) PRIMARY KEY,
    `name` VARCHAR(40) NOT NULL,
    `type` CHAR(1) NOT NULL,
    `balance` INTEGER NOT NULL CHECK(`balance` >= 0),
    `update_date` DATE
);

--廃止口座テーブル
CREATE TABLE IF NOT EXISTS `abolished_accounts` (
    `account_id` CHAR(7) PRIMARY KEY,
    `name` VARCHAR(40) NOT NULL,
    `type` CHAR(1) NOT NULL,
    `blance_at_cancellation` INTEGER NOT NULL CHECK(`blance_at_cancellation` >= 0),
    `cancellation_date` DATE
);

--索引テーブル
CREATE TABLE IF NOT EXISTS `index` (
    `transaction_id` INTEGER PRIMARY KEY,
    `transaction_reason_id` INTEGER REFERENCES `transaction_reasons`(`transaction_reason_id`),
    `transaction_date` DATE NOT NULL,
    `account_id` CHAR(7) NOT NULL,
    `deposit_amount` INTEGER,
    `withdrawal_amount` INTEGER
);

--取引事由テーブル
CREATE TABLE IF NOT EXISTS `transaction_reasons` (
    `transaction_reason_id` INTEGER PRIMARY KEY,
    `transaction_reason_name` VARCHAR(20) NOT NULL
);