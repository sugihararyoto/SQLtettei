SELECT
	`key`
FROM
	Greatests
ORDER BY
	CASE
		WHEN `key` = 'B' THEN 1
		WHEN `key` = 'A' THEN 2
		WHEN `key` = 'D' THEN 3
		WHEN `key` = 'C' THEN 4
	ELSE NULL END
;