-- 相関サブクエリ版 Ensyu7-1
SELECT
	prc_date,
	prc_amt,
	(SELECT AVG(prc_amt)
	FROM Accounts AS A2
	WHERE A1.prc_date >= A2.prc_date
	AND (
		SELECT COUNT(*)
		FROM Accounts AS A3
		WHERE A3.prc_date BETWEEN A2.prc_date AND A1.prc_date
		) < 4) AS TMP
FROM
	Accounts AS A1
ORDER BY
	prc_date
;

-- ウィンドウ関数版
SELECT
	prc_date, prc_amt,
	AVG(prc_amt)
	OVER(ORDER BY prc_date
		ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS tmp
	FROM Accounts;
	
-- 使用したテーブル
CREATE TABLE Accounts
(prc_date DATE NOT NULL , 
 prc_amt  INTEGER NOT NULL , 
 PRIMARY KEY (prc_date)) ;

DELETE FROM Accounts;
INSERT INTO Accounts VALUES ('2018-10-26',  12000 );
INSERT INTO Accounts VALUES ('2018-10-28',   2500 );
INSERT INTO Accounts VALUES ('2018-10-31', -15000 );
INSERT INTO Accounts VALUES ('2018-11-03',  34000 );
INSERT INTO Accounts VALUES ('2018-11-04',  -5000 );
INSERT INTO Accounts VALUES ('2018-11-06',   7200 );
INSERT INTO Accounts VALUES ('2018-11-11',  11000 );
