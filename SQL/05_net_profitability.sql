WITH profitability AS (
    SELECT
        quarter,
        tko_net_income_m,
        tko_total_revenue_m,
        ROUND(
            tko_net_income_m / tko_total_revenue_m * 100,
            2
        ) AS net_profit_margin
    FROM tko_performance
)

SELECT
    quarter,
    tko_net_income_m,
    tko_total_revenue_m,
    net_profit_margin,
    CASE
        WHEN tko_net_income_m = MAX(tko_net_income_m) OVER()
            THEN 'Strongest Net Income'
        WHEN tko_net_income_m = MIN(tko_net_income_m) OVER()
            THEN 'Weakest Net Income'
    END AS profitability_extreme
FROM profitability
ORDER BY quarter;

