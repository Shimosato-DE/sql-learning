
--口座テーブル
CREATE TABLE IF NOT EXISTS `口座` (
    `口座番号` CHAR(7) PRIMARY KEY,
    `名義` VARCHAR(40) NOT NULL,
    `種別` CHAR(1) NOT NULL,
    `残高` INTEGER NOT NULL CHECK(`残高` >= 0),
    `更新日` DATE
);

--廃止口座テーブル
CREATE TABLE IF NOT EXISTS `廃止口座` (
    `口座番号` CHAR(7) PRIMARY KEY,
    `名義` VARCHAR(40) NOT NULL,
    `種別` CHAR(1) NOT NULL,
    `解約時残高` INTEGER NOT NULL CHECK(`解約時残高` >= 0),
    `解約日` DATE
);

--取引テーブル
CREATE TABLE IF NOT EXISTS `取引` (
    `取引番号` INTEGER PRIMARY KEY,
    `取引事由ID` INTEGER REFERENCES `取引事由` (`取引事由ID`),
    `日付` DATE NOT NULL,
    `口座番号` CHAR(7) NOT NULL,
    `入金額` INTEGER,
    `出金額` INTEGER
);

--取引事由テーブル
CREATE TABLE IF NOT EXISTS `取引事由` (
    `取引事由ID` INTEGER PRIMARY KEY,
    `取引事由名` VARCHAR(20) NOT NULL
);