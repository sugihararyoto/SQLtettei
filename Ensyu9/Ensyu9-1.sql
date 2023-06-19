SELECT
	CASE
		WHEN COUNT(*) = (
			SELECT
				COUNT(*)
			FROM
				tbl_A
		)
	AND COUNT(*) = (
			SELECT
				COUNT(*)
			FROM
				tbl_B
		) THEN '等しい'
		ELSE '異なる'
	END AS result
FROM
	(
		SELECT
			*
		FROM
			tbl_A
		UNION
		SELECT
			*
		FROM
			tbl_B
	) AS row_union
;

-- 使用したテーブル
CREATE TABLE Tbl_A
 (keycol  CHAR(1) PRIMARY KEY,
  col_1   INTEGER , 
  col_2   INTEGER, 
  col_3   INTEGER);

CREATE TABLE Tbl_B
 (keycol  CHAR(1) PRIMARY KEY,
  col_1   INTEGER, 
  col_2   INTEGER, 
  col_3   INTEGER);

DELETE FROM Tbl_A;
INSERT INTO Tbl_A VALUES('A', 2, 3, 4);
INSERT INTO Tbl_A VALUES('B', 0, 7, 9);
INSERT INTO Tbl_A VALUES('C', 5, 1, 6);

DELETE FROM Tbl_B;
INSERT INTO Tbl_B VALUES('A', 2, 3, 4);
INSERT INTO Tbl_B VALUES('B', 0, 7, 9);
INSERT INTO Tbl_B VALUES('C', 5, 1, 6);