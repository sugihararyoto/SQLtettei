REPLACE INTO
	Class_A (id, name)
VALUES
	('1', 'Tanaka'),
	('2', 'Utsumi'),
	('4', 'Saionji')
;
-- 使用したテーブル
CREATE TABLE Class_A
(id char(1), 
 name varchar(30), 
 PRIMARY KEY(id));

INSERT INTO Class_A (id, name) VALUES('1', 'Tanaka');
INSERT INTO Class_A (id, name) VALUES('2', 'Suzuki');
INSERT INTO Class_A (id, name) VALUES('3', 'Ishuin');