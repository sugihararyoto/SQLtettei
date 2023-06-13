-- xとyの最大値
SELECT
	`key`,
	CASE WHEN x > y THEN x ELSE y END AS greatest
FROM
	Greatests
GROUP BY
	`key`
;

-- x,y,zの最大値
SELECT
	`key`,
	CASE
		WHEN x >= y AND x >= z THEN x
		WHEN y >= x AND y >= z THEN y
	 	ELSE z END AS greatest
FROM
	Greatests
GROUP BY
	`key`
;