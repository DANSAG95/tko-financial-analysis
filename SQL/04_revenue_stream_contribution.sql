SELECT year,
       SUM(tko_total_revenue_m) AS tko_total_revenue,
       SUM(tko_media_rights_revenue_m) AS media_rights_revenue,
	   ROUND(SUM(tko_media_rights_revenue_m)/ SUM(tko_total_revenue_m) * 100,2) AS media_rights_pct_of_total,
       SUM(tko_sponsorship_revenue_m) AS sponsorship_revenue, 
	   ROUND(SUM(tko_sponsorship_revenue_m)/ SUM(tko_total_revenue_m) * 100,2) AS sponsorship_pct_of_total,
	   SUM(tko_live_event_revenue_m) AS live_event_revenue,
	   ROUND(SUM(tko_live_event_revenue_m)/ SUM(tko_total_revenue_m) * 100,2) AS live_event_pct_of_total,
	   SUM(tko_consumer_products_revenue_m) AS consumer_products_revenue,
	   ROUND(SUM(tko_consumer_products_revenue_m)/ SUM(tko_total_revenue_m) * 100,2) AS consumer_products_pct_of_total
FROM (SELECT *, 
        CASE WHEN quarter LIKE '2024%' THEN 2024
             WHEN quarter LIKE '2025%' THEN 2025
             ELSE 2026 END AS year
        FROM tko_performance
    ) AS y
GROUP BY year
ORDER BY year; 

-- only pct

SELECT year,
       SUM(tko_total_revenue_m) AS tko_total_revenue,
	   ROUND(SUM(tko_media_rights_revenue_m)/ SUM(tko_total_revenue_m) * 100,2) AS media_rights_pct_of_total,
	   ROUND(SUM(tko_sponsorship_revenue_m)/ SUM(tko_total_revenue_m) * 100,2) AS sponsorship_pct_of_total,
	   ROUND(SUM(tko_live_event_revenue_m)/ SUM(tko_total_revenue_m) * 100,2) AS live_event_pct_of_total,
	   ROUND(SUM(tko_consumer_products_revenue_m)/ SUM(tko_total_revenue_m) * 100,2) AS consumer_products_pct_of_total
FROM (SELECT *, 
        CASE WHEN quarter LIKE '2024%' THEN 2024
             WHEN quarter LIKE '2025%' THEN 2025
             ELSE 2026 END AS year
        FROM tko_performance
    ) AS y
GROUP BY year
ORDER BY year; 


