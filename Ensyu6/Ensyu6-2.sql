SELECT
	dpt 
FROM
	Students
GROUP BY
	dpt
HAVING
	COUNT(*) = SUM(CASE WHEN sbmt_date BETWEEN '2018-09-01'AND '2018-09-30'
	THEN 1 ELSE 0 END)
;
-- 使用したテーブル
CREATE TABLE Students
(student_id   INTEGER PRIMARY KEY,
 dpt          VARCHAR(16) NOT NULL,
 sbmt_date    DATE);

INSERT INTO Students VALUES(100,  'rigakubu',   '2018-10-10');
INSERT INTO Students VALUES(101,  'rigakubu',   '2018-09-22');
INSERT INTO Students VALUES(102,  'bungakubu',   NULL);
INSERT INTO Students VALUES(103,  'bungakubu',   '2018-09-10');
INSERT INTO Students VALUES(200,  'bungakubu',   '2018-09-22');
INSERT INTO Students VALUES(201,  'kougakubu',   NULL);
INSERT INTO Students VALUES(202,  'keizaigakubu', '2018-09-25');