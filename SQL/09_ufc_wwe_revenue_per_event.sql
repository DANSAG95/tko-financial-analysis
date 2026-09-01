SELECT u.quarter,
       u.ufc_total_revenue_m,
       u.ufc_ticketed_events_total,
	   ROUND(u.ufc_total_revenue_m / u.ufc_ticketed_events_total,2) AS ufc_revenue_per_event,
	   w.wwe_total_revenue_m,
	   w.wwe_ticketed_events_total,
	   ROUND(w.wwe_total_revenue_m / w.wwe_ticketed_events_total,2) AS wwe_revenue_per_event
FROM ufc_performance AS u
LEFT JOIN wwe_performance AS w
ON u.quarter = w.quarter;

