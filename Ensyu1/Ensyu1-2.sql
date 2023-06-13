SELECT
	sex AS 性別,
	SUM(population) AS 全国,
	SUM(CASE WHEN pref_name = 'Tokushima' THEN population ELSE 0 END) AS 徳島,
	SUM(CASE WHEN pref_name = 'Kagawa' THEN population ELSE 0 END) AS 香川,
	SUM(CASE WHEN pref_name = 'Ehime' THEN population ELSE 0 END) AS 愛媛,
	SUM(CASE WHEN pref_name = 'Kouchi' THEN population ELSE 0 END) AS 高知,
	SUM(CASE WHEN pref_name IN ('Tokushima','Kagawa','Ehime','Kouchi') THEN population ELSE 0 END) AS '四国(再掲)'
FROM
	PopTbl2
GROUP BY
	sex
;