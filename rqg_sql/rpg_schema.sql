-- Active: 1751433954351@@127.0.0.1@3306@rpg
--パーティー
CREATE TABLE IF NOT EXISTS `パーティ` (
    id CHAR(3) NOT NULL PRIMARY KEY,
    `名称` VARCHAR(20) NOT NULL,
    `職業コード` CHAR(2) NOT NULL,
    `HP` INTEGER NOT NULL,
    `MP` INTEGER NOT NULL,
    `状態コード` CHAR(2) NOT NULL
);

--イベント
CREATE TABLE IF NOT EXISTS `イベント` (
    `イベント番号` INTEGER NOT NULL PRIMARY KEY,
    `イベント名称` VARCHAR(50) NOT NULL,
    `タイプ` CHAR(1) NOT NULL,
    `前提イベント番号` INTEGER,
    `後続イベント番号` INTEGER
);

--経験イベント
CREATE TABLE IF NOT EXISTS `経験イベント` (
    `イベント番号` INTEGER NOT NULL PRIMARY KEY,
    `クリア区分` CHAR(1) NOT NULL,
    `クリア結果` CHAR(1),
    `ルート番号` INTEGER
);

--コード
CREATE TABLE IF NOT EXISTS `コード` (
    `コード種別` INTEGER NOT NULL,
    `コード値` CHAR(2) NOT NULL,
    `コード名称` VARCHAR(100)

    PRIMARY KEY(`コード種別`, `コード値`)
) 