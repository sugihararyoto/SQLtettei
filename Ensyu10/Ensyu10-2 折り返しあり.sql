-- 折り返しがあるケース
SET @head_cnt = 3;

SELECT
	S1.seat AS start_seat,
	'~' ,
	S2.seat AS end_seat
FROM
	Seats2 S1,
	Seats2 S2,
	Seats2 S3
WHERE
	S2.seat = S1.seat + (@head_cnt - 1)
AND
	S3.seat BETWEEN S1.seat AND S2.seat
GROUP BY
	S1.seat, S2.seat
HAVING COUNT(*) = SUM(
	CASE
		WHEN S3.status = 'A'
	AND S3.line_id = S1.line_id THEN 1
		ELSE 0
	END
)
;
-- 使用したテーブル
CREATE TABLE Seats2
 ( seat   INTEGER NOT NULL  PRIMARY KEY,
   line_id CHAR(1) NOT NULL,
   status CHAR(2) NOT NULL
     CHECK (status IN ('A', 'B')) ); 

INSERT INTO Seats2 VALUES (1, 'A', 'B');
INSERT INTO Seats2 VALUES (2, 'A', 'B');
INSERT INTO Seats2 VALUES (3, 'A', 'A');
INSERT INTO Seats2 VALUES (4, 'A', 'A');
INSERT INTO Seats2 VALUES (5, 'A', 'A');
INSERT INTO Seats2 VALUES (6, 'B', 'B');
INSERT INTO Seats2 VALUES (7, 'B', 'B');
INSERT INTO Seats2 VALUES (8, 'B', 'A');
INSERT INTO Seats2 VALUES (9, 'B', 'A');
INSERT INTO Seats2 VALUES (10,'B', 'A');
INSERT INTO Seats2 VALUES (11,'C', 'A');
INSERT INTO Seats2 VALUES (12,'C', 'A');
INSERT INTO Seats2 VALUES (13,'C', 'A');
INSERT INTO Seats2 VALUES (14,'C', 'B');
INSERT INTO Seats2 VALUES (15,'C', 'A');