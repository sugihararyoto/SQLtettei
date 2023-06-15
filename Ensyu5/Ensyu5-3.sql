SELECT
	*
FROM
	Numbers AS N1
WHERE
	num <> 1
AND
	NOT EXISTS
	(
		SELECT
			*
		FROM
			Numbers N2
		WHERE
			N2.num <= SQRT(N1.num)
		AND
			N2.num <> 1
		AND
			N1.num % N2.num = 0
	)
;
-- 使用したテーブル
CREATE TABLE Digits
 (digit INTEGER PRIMARY KEY); 

INSERT INTO Digits VALUES (0);
INSERT INTO Digits VALUES (1);
INSERT INTO Digits VALUES (2);
INSERT INTO Digits VALUES (3);
INSERT INTO Digits VALUES (4);
INSERT INTO Digits VALUES (5);
INSERT INTO Digits VALUES (6);
INSERT INTO Digits VALUES (7);
INSERT INTO Digits VALUES (8);
INSERT INTO Digits VALUES (9);

DROP TABLE Numbers;
CREATE TABLE Numbers
AS
SELECT D1.digit + (D2.digit * 10) AS num
  FROM Digits D1 CROSS JOIN Digits D2
 WHERE D1.digit + (D2.digit * 10) BETWEEN 1 AND 100;

INSERT INTO Numbers VALUES (100);