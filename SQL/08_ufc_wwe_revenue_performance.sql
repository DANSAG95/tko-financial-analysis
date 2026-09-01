WITH segemnt_revenue AS (SELECT quarter,
       tko_total_revenue_m,
       wwe_total_revenue_m,
	   LAG(wwe_total_revenue_m) OVER(ORDER BY quarter ASC) AS wwe_revenue_last_quarter,
	   ROUND(wwe_total_revenue_m / tko_total_revenue_m * 100, 2) AS wwe_total_revenue_pct,
       ufc_total_revenue_m,
	   LAG(ufc_total_revenue_m) OVER(ORDER BY quarter ASC) AS ufc_revenue_last_quarter,
	   ROUND(ufc_total_revenue_m / tko_total_revenue_m * 100, 2) AS ufc_total_revenue_pct
FROM tko_performance
ORDER BY quarter)
SELECT quarter,
       tko_total_revenue_m,
       wwe_total_revenue_m,
	   ROUND((wwe_total_revenue_m - wwe_revenue_last_quarter) / wwe_revenue_last_quarter * 100,2) AS wwe_qoq_pct_increase,
	   wwe_total_revenue_pct,
	   ufc_total_revenue_m,
	   ROUND((ufc_total_revenue_m - ufc_revenue_last_quarter) / ufc_revenue_last_quarter * 100, 2) AS ufc_qoq_pct_increase,
	   ufc_total_revenue_pct
FROM segemnt_revenue;


