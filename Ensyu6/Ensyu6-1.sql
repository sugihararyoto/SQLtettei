SELECT
	CASE WHEN COUNT(*) <> MAX(seq) THEN '歯抜けあり'
	ELSE '歯抜けなし'END AS gap 
FROM
	SeqTbl
;
/* 歯抜けありテーブル */
DROP TABLE SeqTbl;
CREATE TABLE SeqTbl
(seq  INTEGER PRIMARY KEY,
 name VARCHAR(16) NOT NULL);

INSERT INTO SeqTbl VALUES(1,	'Dick');
INSERT INTO SeqTbl VALUES(2,	'Ann');
INSERT INTO SeqTbl VALUES(3,	'Lyle');
INSERT INTO SeqTbl VALUES(5,	'Karr');
INSERT INTO SeqTbl VALUES(6,	'Marie');
INSERT INTO SeqTbl VALUES(8,	'Ben');

/* 歯抜けなしテーブル */
DROP TABLE SeqTbl;
CREATE TABLE SeqTbl
(seq  INTEGER PRIMARY KEY,
 name VARCHAR(16) NOT NULL);

INSERT INTO SeqTbl VALUES(1,	'Dick');
INSERT INTO SeqTbl VALUES(2,	'Ann');
INSERT INTO SeqTbl VALUES(3,	'Lyle');