-- 折り返しがないケース
SET @head_cnt = 3;

SELECT
	S1.seat AS start_seat,
	'~' ,
	S2.seat AS end_seat
FROM
	Seats S1,
	Seats S2,
	Seats S3
WHERE
	S2.seat = S1.seat + (@head_cnt - 1)
AND
	S3.seat BETWEEN S1.seat AND S2.seat
GROUP BY
	S1.seat, S2.seat
HAVING
	COUNT(*) = SUM(CASE WHEN S3.status = 'A' THEN 1 ELSE 0 END)
;
-- 使用したテーブル
CREATE TABLE Seats
(seat   INTEGER NOT NULL  PRIMARY KEY,
 status CHAR(2) NOT NULL
 CHECK (status IN ('A', 'B')) ); 

INSERT INTO Seats VALUES (1,  'B');
INSERT INTO Seats VALUES (2,  'B');
INSERT INTO Seats VALUES (3,  'A');
INSERT INTO Seats VALUES (4,  'A');
INSERT INTO Seats VALUES (5,  'A');
INSERT INTO Seats VALUES (6,  'B');
INSERT INTO Seats VALUES (7,  'A');
INSERT INTO Seats VALUES (8,  'A');
INSERT INTO Seats VALUES (9,  'A');
INSERT INTO Seats VALUES (10, 'A');
INSERT INTO Seats VALUES (11, 'A');
INSERT INTO Seats VALUES (12, 'B');
INSERT INTO Seats VALUES (13, 'B');
INSERT INTO Seats VALUES (14, 'A');
INSERT INTO Seats VALUES (15, 'A');