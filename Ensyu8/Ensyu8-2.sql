CREATE VIEW Children(child)
AS
	SELECT child_1 FROM Personnel
	UNION
	SELECT child_2 FROM Personnel
	UNION
	SELECT child_3 FROM Personnel
;
SELECT
	EMP.employee,
	COUNT(child) AS child_cnt
FROM
	Personnel EMP
	LEFT OUTER JOIN
		Children
		ON Children.child IN (EMP.child_1,EMP.child_2,EMP.child_3)
GROUP BY
	EMP.employee
;
-- 使用したテーブル
CREATE TABLE Personnel
 (employee   varchar(32), 
  child_1    varchar(32), 
  child_2    varchar(32), 
  child_3    varchar(32), 
  PRIMARY KEY(employee));

INSERT INTO Personnel VALUES('Akai', 'ichiro', 'jiro', 'saburo');
INSERT INTO Personnel VALUES('Kudo', 'haruko', 'natsuko', NULL);
INSERT INTO Personnel VALUES('Suzuki', 'natsuko', NULL,   NULL);
INSERT INTO Personnel VALUES('Yoshida', NULL,   NULL,   NULL);