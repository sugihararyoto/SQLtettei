SELECT
	MASTER.age_class AS age_class,
	MASTER.sex_cd AS sex_cd,
	SUM(CASE WHEN pref_name IN('Aomori', 'Akita') THEN population ELSE NULL END) AS pop_tohoku,
	SUM(CASE WHEN pref_name IN('Tokyo', 'Chiba') THEN population ELSE NULL END) AS pop_kanto
FROM
	(
		SELECT
			age_class,
			sex_cd
		FROM
			TblAge
			CROSS JOIN
				TblSex
	) MASTER
		LEFT OUTER JOIN
			TblPop AS DATA
		ON	MASTER.age_class = DATA.age_class
		AND	MASTER.sex_cd = DATA.sex_cd
GROUP BY
	MASTER.age_class,
	MASTER.sex_cd
;

-- 使用したテーブル
CREATE TABLE TblSex
(sex_cd   char(1), 
 sex varchar(5), 
 PRIMARY KEY(sex_cd));

CREATE TABLE TblAge 
(age_class char(1), 
 age_range varchar(30), 
 PRIMARY KEY(age_class));

CREATE TABLE TblPop 
(pref_name  varchar(30), 
 age_class  char(1), 
 sex_cd     char(1), 
 population integer, 
 PRIMARY KEY(pref_name, age_class,sex_cd));

INSERT INTO TblSex (sex_cd, sex ) VALUES('m',	'man');
INSERT INTO TblSex (sex_cd, sex ) VALUES('f',	'woman');

INSERT INTO TblAge (age_class, age_range ) VALUES('1',	'21~30');
INSERT INTO TblAge (age_class, age_range ) VALUES('2',	'31~40');
INSERT INTO TblAge (age_class, age_range ) VALUES('3',	'41~50');

INSERT INTO TblPop VALUES('Akita', '1', 'm', 400 );
INSERT INTO TblPop VALUES('Akita', '3', 'm', 1000 );
INSERT INTO TblPop VALUES('Akita', '1', 'f', 800 );
INSERT INTO TblPop VALUES('Akita', '3', 'f', 1000 );
INSERT INTO TblPop VALUES('Aomori', '1', 'm', 700 );
INSERT INTO TblPop VALUES('Aomori', '1', 'f', 500 );
INSERT INTO TblPop VALUES('Aomori', '3', 'f', 800 );
INSERT INTO TblPop VALUES('Tokyo', '1', 'm', 900 );
INSERT INTO TblPop VALUES('Tokyo', '1', 'f', 1500 );
INSERT INTO TblPop VALUES('Tokyo', '3', 'f', 1200 );
INSERT INTO TblPop VALUES('Chiba', '1', 'm', 900 );
INSERT INTO TblPop VALUES('Chiba', '1', 'f', 1000 );
INSERT INTO TblPop VALUES('Chiba', '3', 'f', 900 );