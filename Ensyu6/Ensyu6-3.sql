SELECT
	SI.shop,
	COUNT(SI.item) AS my_item_cnt,
	(SELECT COUNT(item) FROM Items) - COUNT(I.item) AS diff_cnt
FROM
	ShopItems AS SI INNER JOIN Items AS I
ON
	SI.item = I.item
GROUP BY
	SI.shop
;
-- 使用したテーブル
CREATE TABLE Items
(item VARCHAR(16) PRIMARY KEY);
 
CREATE TABLE ShopItems
(shop VARCHAR(16),
 item VARCHAR(16),
    PRIMARY KEY(shop, item));

INSERT INTO Items VALUES('bi-ru');
INSERT INTO Items VALUES('kamiomutu');
INSERT INTO Items VALUES('jitensha');

INSERT INTO ShopItems VALUES('Sendai',  'bi-ru');
INSERT INTO ShopItems VALUES('Sendai',  'kamiomutu');
INSERT INTO ShopItems VALUES('Sendai',  'jitensha');
INSERT INTO ShopItems VALUES('Sendai',  'ka-ten');
INSERT INTO ShopItems VALUES('Tokyo',  'bi-ru');
INSERT INTO ShopItems VALUES('Tokyo',  'kamiomutu');
INSERT INTO ShopItems VALUES('Tokyo',  'jitensha');
INSERT INTO ShopItems VALUES('Osaka',  'TV');
INSERT INTO ShopItems VALUES('Osaka',  'kamiomutu');
INSERT INTO ShopItems VALUES('Osaka',  'jitensha');