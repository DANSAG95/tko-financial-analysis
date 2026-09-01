SELECT u.quarter,
	   ROUND(u.ufc_total_revenue_m / u.ufc_ticketed_events_total,2) AS ufc_revenue_per_event,
	   ROUND(u.ufc_total_revenue_m / u.ufc_announced_attendance_total * 1000000, 2) AS  ufc_revenue_per_attendee,
	   ROUND(w.wwe_total_revenue_m / w.wwe_ticketed_events_total,2) AS wwe_revenue_per_event,
	   ROUND(w.wwe_total_revenue_m / w.wwe_estimated_tickets_distributed_total * 1000000,2) AS wwe_revenue_per_ticket
FROM ufc_performance AS u
LEFT JOIN wwe_performance AS w
ON u.quarter = w.quarter

