SELECT DISTINCT
	emp
FROM
	EmpSkills ES1
WHERE
	NOT EXISTS
	(
		SELECT
			skill
		FROM
			Skills
	EXCEPT
		SELECT
			skill
		FROM
			EmpSkills ES2
		WHERE
			ES1.emp = ES2.emp
	)
GROUP BY
	emp
HAVING
	COUNT(*) = (SELECT COUNT(*) FROM Skills)
;
-- 使用したテーブル
CREATE TABLE Skills 
(skill VARCHAR(32),
 PRIMARY KEY(skill));

CREATE TABLE EmpSkills 
(emp   VARCHAR(32), 
 skill VARCHAR(32),
 PRIMARY KEY(emp, skill));

INSERT INTO Skills VALUES('Oracle');
INSERT INTO Skills VALUES('UNIX');
INSERT INTO Skills VALUES('Java');

INSERT INTO EmpSkills VALUES('Aida', 'Oracle');
INSERT INTO EmpSkills VALUES('Aida', 'UNIX');
INSERT INTO EmpSkills VALUES('Aida', 'Java');
INSERT INTO EmpSkills VALUES('Aida', 'C#');
INSERT INTO EmpSkills VALUES('Kanzaki', 'Oracle');
INSERT INTO EmpSkills VALUES('Kanzaki', 'UNIX');
INSERT INTO EmpSkills VALUES('Kanzaki', 'Java');
INSERT INTO EmpSkills VALUES('Hirai', 'UNIX');
INSERT INTO EmpSkills VALUES('Hirai', 'Oracle');
INSERT INTO EmpSkills VALUES('Hirai', 'PHP');
INSERT INTO EmpSkills VALUES('Hirai', 'Perl');
INSERT INTO EmpSkills VALUES('Hirai', 'C++');
INSERT INTO EmpSkills VALUES('Wakatabe', 'Perl');
INSERT INTO EmpSkills VALUES('Torai', 'Oracle');