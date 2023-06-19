-- NOT EXISTS版
SELECT
	seq
FROM
	Sequence
WHERE
	seq BETWEEN 1 AND 12
AND
	NOT EXISTS
	(
		SELECT
			*
		FROM
			SeqTbl
		WHERE
			SeqTbl.seq = Sequence.seq
	)
;
-- 外部結合版
SELECT
	Sequence.seq
FROM
	Sequence
LEFT OUTER JOIN
	SeqTbl
ON
	SeqTbl.seq = Sequence.seq
WHERE
	Sequence.seq BETWEEN 1 AND 12
AND
	SeqTbl.seq IS NULL
;
-- 使用したテーブル、ビュー
DROP TABLE SeqTbl;
CREATE TABLE SeqTbl
 (seq INTEGER PRIMARY KEY); 

INSERT INTO SeqTbl VALUES (1);
INSERT INTO SeqTbl VALUES (2);
INSERT INTO SeqTbl VALUES (4);
INSERT INTO SeqTbl VALUES (5);
INSERT INTO SeqTbl VALUES (6);
INSERT INTO SeqTbl VALUES (7);
INSERT INTO SeqTbl VALUES (8);
INSERT INTO SeqTbl VALUES (11);
INSERT INTO SeqTbl VALUES (12);

CREATE VIEW Sequence (seq) AS
SELECT D1.digit + (D2.digit * 10) + (D3.digit * 100)
  FROM Digits D1
         CROSS JOIN Digits D2
           CROSS JOIN Digits D3;