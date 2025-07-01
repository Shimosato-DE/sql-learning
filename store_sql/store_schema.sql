-- Active: 1751339280099@@127.0.0.1@3306@store

--商品テーブル
CREATE TABLE IF NOT EXISTS `商品` (
    `商品コード` CHAR(5) PRIMARY KEY,
    `商品名` VARCHAR(50) NOT NULL,
    `単価` INTEGER NOT NULL,
    `商品区分` CHAR(1) NOT NULL,
    `関連商品コード` CHAR (5)
);

--廃盤商品
CREATE TABLE IF NOT EXISTS `廃盤商品` (
    `商品コード` CHAR(5) PRIMARY KEY,
    `商品名` VARCHAR(50) NOT NULL,
    `単価` INTEGER NOT NULL,
    `商品区分` CHAR(1) NOT NULL,
    `廃盤日` DATE NOT NULL,
    `売上個数` INTEGER NOT NULL
);

--注文テーブル
CREATE TABLE IF NOT EXISTS `注文` (
    `注文日` DATE NOT NULL,
    `注文番号` CHAR(12) NOT NULL,
    `注文枝番` INTEGER NOT NULL,
    `商品コード` CHAR(5) NOT NULL,
    `数量` INTEGER NOT NULL,
    `クーポン割引料` INTEGER,
    PRIMARY KEY (`注文日`, `注文番号`, `注文枝番`)
);