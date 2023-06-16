SELECT
	*
FROM
	Projects AS P1
WHERE
	1 = ALL
	(
		SELECT
			CASE
				WHEN step_nbr <= 1 AND status = 'kanryo' THEN 1
				WHEN step_nbr > 1 AND status = 'taiki' THEN 1
				ELSE 0 END
		FROM
			Projects AS P2 
		WHERE
			P1.project_id = P2.project_id
	)
;
-- ↓利用したテーブル
CREATE TABLE Projects
(project_id VARCHAR(32),
 step_nbr   INTEGER ,
 status     VARCHAR(32),
  PRIMARY KEY(project_id, step_nbr));

INSERT INTO Projects VALUES('AA100', 0, 'kanryo');
INSERT INTO Projects VALUES('AA100', 1, 'taiki');
INSERT INTO Projects VALUES('AA100', 2, 'taiki');
INSERT INTO Projects VALUES('B200',  0, 'taiki');
INSERT INTO Projects VALUES('B200',  1, 'taiki');
INSERT INTO Projects VALUES('CS300', 0, 'kanryo');
INSERT INTO Projects VALUES('CS300', 1, 'kanryo');
INSERT INTO Projects VALUES('CS300', 2, 'taiki');
INSERT INTO Projects VALUES('CS300', 3, 'taiki');
INSERT INTO Projects VALUES('DY400', 0, 'kanryo');
INSERT INTO Projects VALUES('DY400', 1, 'kanryo');
INSERT INTO Projects VALUES('DY400', 2, 'kanryo');