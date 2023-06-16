-- ウィンドウ関数版
SELECT
	prc_date, prc_amt,
	CASE
		WHEN COUNT(*)
		OVER(ORDER BY prc_date
		ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) < 3 THEN NULL 
		ELSE
		AVG(prc_amt)
		OVER(ORDER BY prc_date
		ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) END AS TMP
FROM
	Accounts
;
-- 相関サブクエリ版
SELECT
	prc_date,
	prc_amt,
	(SELECT AVG(prc_amt)
	FROM Accounts AS A2
	WHERE A1.prc_date >= A2.prc_date
	AND (
		SELECT COUNT(*)
		FROM Accounts AS A3
		WHERE A3.prc_date BETWEEN A2.prc_date AND A1.prc_date
		) < 4
	HAVING
		COUNT(*) = 3) AS TMP
FROM
	Accounts AS A1
ORDER BY
	prc_date
;
-- 使用したテーブルはEnsyu7-1のテーブルと同じ