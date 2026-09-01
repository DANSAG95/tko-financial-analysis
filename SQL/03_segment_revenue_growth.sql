WITH annual_revenue AS (
    SELECT
        EXTRACT(YEAR FROM quarter_start_date) AS year,
        SUM(wwe_total_revenue_m) AS wwe_revenue,
        SUM(ufc_total_revenue_m) AS ufc_revenue,
        SUM(img_total_revenue_m) AS img_revenue,
        SUM(other_total_revenue_m) AS other_revenue
    FROM tko_performance
    WHERE EXTRACT(YEAR FROM quarter_start_date) IN (2024, 2025)
    GROUP BY EXTRACT(YEAR FROM quarter_start_date)
),

growth AS (
    SELECT
        ((MAX(wwe_revenue) FILTER (WHERE year = 2025) -
          MAX(wwe_revenue) FILTER (WHERE year = 2024))
          / MAX(wwe_revenue) FILTER (WHERE year = 2024)) * 100 AS wwe_growth,

        ((MAX(ufc_revenue) FILTER (WHERE year = 2025) -
          MAX(ufc_revenue) FILTER (WHERE year = 2024))
          / MAX(ufc_revenue) FILTER (WHERE year = 2024)) * 100 AS ufc_growth,

        ((MAX(img_revenue) FILTER (WHERE year = 2025) -
          MAX(img_revenue) FILTER (WHERE year = 2024))
          / NULLIF(MAX(img_revenue) FILTER (WHERE year = 2024), 0)) * 100 AS img_growth,

        ((MAX(other_revenue) FILTER (WHERE year = 2025) -
          MAX(other_revenue) FILTER (WHERE year = 2024))
          / NULLIF(MAX(other_revenue) FILTER (WHERE year = 2024), 0)) * 100 AS other_growth
    FROM annual_revenue
)

SELECT *
FROM growth;
