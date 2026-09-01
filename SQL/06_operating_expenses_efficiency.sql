SELECT
    quarter,
    tko_total_revenue_m,
    tko_operating_expenses_m,
    ROUND(
        tko_operating_expenses_m / tko_total_revenue_m * 100,
        2
    ) AS operating_expenses_pct_of_revenue
FROM tko_performance
ORDER BY quarter;

