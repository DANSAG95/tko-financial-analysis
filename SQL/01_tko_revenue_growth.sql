-- For QoQ:

WITH revenue AS (SELECT quarter, tko_total_revenue_m,
       LAG(tko_total_revenue_m) OVER(ORDER BY quarter ASC) AS tko_revenue_last_quarter
FROM tko_performance)
SELECT quarter,
       tko_total_revenue_m,
       COALESCE(tko_revenue_last_quarter,0)tko_revenue_last_quarter,
	   COALESCE(ROUND((tko_total_revenue_m - tko_revenue_last_quarter) / tko_revenue_last_quarter * 100,2),0) AS qoq_pct_increase
FROM revenue

-- For YoY:

WITH revenue AS (
             SELECT year, 
       SUM(tko_total_revenue_m) AS tko_total_revenue_m,
	   LAG(SUM(tko_total_revenue_m)) OVER(ORDER BY year ASC) AS tko_revenue_last_year
FROM (SELECT *, CASE WHEN quarter LIKE '2024%' THEN 2024
					 WHEN quarter LIKE '2025%' THEN 2025
				ELSE 2026 END AS year FROM tko_performance) AS c
WHERE year <> 2026
GROUP BY year
ORDER BY year ASC)

SELECT year,
       tko_total_revenue_m,
	   tko_revenue_last_year,
	   ROUND((tko_total_revenue_m - tko_revenue_last_year) / tko_revenue_last_year * 100,2) AS yoy_pct_increase
FROM revenue
ORDER BY year;