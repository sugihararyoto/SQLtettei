-- 使用するテーブル
CREATE TABLE ensyu_table
(test CHAR(1) PRIMARY KEY,
 moji   CHAR(5),
 moji_two   CHAR(5));

INSERT INTO ensyu_table VALUES('A','ka','ka');
INSERT INTO ensyu_table VALUES('B',NULL,NULL);
INSERT INTO ensyu_table VALUES('C',NULL,'sa');
INSERT INTO ensyu_table VALUES('D','ta','sa');

-- COALESCEのテスト
SELECT
	test,
	moji,
	moji_two,
	COALESCE (moji,'')
FROM
	ensyu_table
;

-- COALESCEのテスト（カラム複数）
SELECT
	test,
	moji,
	moji_two,
	COALESCE (moji,moji_two,'')
FROM
	ensyu_table
;

-- NULLIFのテスト
SELECT
	test,
	moji,
	moji_two,
	NULLIF (moji,moji_two)
FROM
	ensyu_table
;
