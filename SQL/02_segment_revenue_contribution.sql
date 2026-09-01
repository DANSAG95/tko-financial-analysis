SELECT SUM(tko_total_revenue_m) AS tko_total_revenue,
       SUM(wwe_total_revenue_m) AS wwe_total_revenue,
	   ROUND(SUM(wwe_total_revenue_m)/ SUM(tko_total_revenue_m) * 100,2) AS wwe_percentage_of_total,
       SUM(ufc_total_revenue_m) AS ufc_total_revenue, 
	   ROUND(SUM(ufc_total_revenue_m)/ SUM(tko_total_revenue_m) * 100,2) AS ufc_percentage_of_total,
	   SUM(img_total_revenue_m) AS img_total_revenue,
	   ROUND(SUM(img_total_revenue_m)/ SUM(tko_total_revenue_m) * 100,2) AS img_percentage_of_total,
	   SUM(other_total_revenue_m) AS other_total_revenue,
	   ROUND(SUM(other_total_revenue_m)/ SUM(tko_total_revenue_m) * 100,2) AS other_percentage_of_total
FROM tko_performance; 