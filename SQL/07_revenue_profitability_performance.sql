WITH performance AS (
    SELECT
        quarter,
        tko_total_revenue_m,
        tko_net_income_m,
        ROUND(
            tko_net_income_m / tko_total_revenue_m * 100,
            2
        ) AS net_profit_margin
    FROM tko_performance
),

ranked AS (
    SELECT
        *,
        RANK() OVER (
            ORDER BY tko_total_revenue_m DESC
        ) AS revenue_rank,

        RANK() OVER (
            ORDER BY net_profit_margin DESC
        ) AS profitability_rank
    FROM performance
)

SELECT
    quarter,
    tko_total_revenue_m,
    tko_net_income_m,
    net_profit_margin,
    revenue_rank,
    profitability_rank,
    revenue_rank + profitability_rank AS combined_rank
FROM ranked
ORDER BY combined_rank;



