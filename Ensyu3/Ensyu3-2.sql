-- 連番を振ったテーブルを作成
CREATE TABLE
	Products2
SELECT
	name,
	price,
	ROW_NUMBER()
OVER 
	(PARTITION BY name, price ORDER BY name ASC) AS row_num
FROM
	Products
;

-- 重複行を削除
DELETE FROM
	Products2
WHERE
	row_num > 1
;

-- Productsテーブルの内容を全て削除
DELETE FROM
	Products;

-- 重複行を削除したテーブルの内容をProductsテーブルに挿入する
INSERT INTO
	Products
SELECT name,price FROM Products2
;