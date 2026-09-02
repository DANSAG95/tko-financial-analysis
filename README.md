# TKO Financial Performance Analysis

## Overview

This project analyzes the financial and operational performance of TKO Group Holdings across its main business segments, with a particular focus on UFC, WWE, IMG, and Other.

The analysis covers quarterly data from **Q1 2024 to Q1 2026** and combines financial performance, revenue composition, profitability, operating expenses, event activity, attendance, and revenue efficiency.

The project was developed using **SQL for data analysis and Power BI for interactive reporting and visualization**.

---

## Business Objectives

The analysis aims to answer the following business questions:

1. How has TKO's total revenue evolved quarter over quarter and year over year?
2. Which TKO business segments generate the most revenue, and what percentage of total revenue does each represent?
3. Which TKO business segments have experienced the strongest revenue growth?
4. Which reported revenue streams contribute most to TKO's revenue, and how has their contribution changed over time?
5. Which quarters show the strongest and weakest net profitability, and how does net profit margin evolve?
6. How significant are operating expenses relative to TKO's revenue?
7. Which quarters combine strong revenue performance with strong profitability?
8. Which UFC and WWE segments show the strongest quarter-over-quarter revenue growth and what share of TKO revenue do they represent?
9. How much revenue do UFC and WWE generate per ticketed event?
10. How efficiently do UFC and WWE convert event activity and audience/ticket distribution into revenue?

---

## Dataset

The project uses three quarterly datasets:

* `TKOPerformance.csv` — consolidated TKO financial performance and segment revenue.
* `UFCPerformance.csv` — UFC financial, attendance, and event data.
* `WWEPerformance.csv` — WWE financial, estimated ticket distribution, and event data.

### Time Period

**Q1 2024 – Q1 2026**

### Granularity

One row per fiscal quarter in each dataset.

### Main Areas

* Total revenue
* Revenue by business segment
* Revenue streams
* Operating expenses
* Operating income
* Net income
* Net profit margin
* Media rights
* Live events
* Sponsorship
* Consumer products
* Ticketed events
* Attendance
* Estimated ticket distribution

> **Data limitation:** WWE ticket distribution figures are estimated rather than audited attendance figures. UFC uses announced attendance, so UFC and WWE audience-efficiency metrics should be interpreted as directional comparisons rather than perfectly equivalent measures. IMG and Other revenue are only reported from Q1 2025 onward.

---

## Tools & Technologies

* **SQL** — data analysis, aggregations, growth calculations, window functions, ranking and efficiency metrics.
* **Power BI** — data modeling, DAX measures, interactive dashboards and visualization.
* **Power Query** — data preparation and transformation.
* **GitHub** — project documentation and version control.

---

## Data Model

The Power BI model combines the three performance datasets with a dedicated Date table.

The model supports analysis across:

* TKO consolidated performance
* UFC performance
* WWE performance
* Quarterly time periods

---

## SQL Analysis

The SQL analysis is organized around the project's ten business questions.

Key techniques used include:

* `LAG()` for quarter-over-quarter and year-over-year comparisons
* Aggregations with `SUM()`
* Window functions
* Revenue contribution calculations
* Profit margin calculations
* Ranking with `RANK()`
* Conditional calculations
* Multi-table joins
* Revenue-per-event and revenue-per-attendee calculations

SQL queries are available in the `/sql` directory.

---

## Power BI Dashboard

The Power BI report is divided into three analytical pages.

### 1. Financial Overview

Focuses on TKO's overall financial performance.

Key areas:

* Quarterly revenue evolution
* Net income and net profit margin
* Operating expenses
* Overall financial performance
* Revenue and profitability comparison

### 2. Segment & Revenue Stream Performance

Analyzes how TKO's revenue is distributed across its businesses and revenue streams.

Key areas:

* UFC, WWE, IMG and Other revenue
* Segment revenue evolution
* Revenue mix
* Media rights
* Live events
* Sponsorship
* Consumer products

### 3. Operational Efficiency — UFC vs WWE

Compares the operational and revenue efficiency of UFC and WWE.

Key areas:

* Revenue per event
* Revenue per attendee/ticket
* Event activity
* Revenue evolution
* Event volume versus revenue generation

---

## Key Insights

### Financial Performance

TKO generated approximately **$9.14B in total revenue** during the analyzed period, with **$802.4M in net income** and an overall **8.78% net profit margin**.

Revenue followed a highly volatile but generally upward trajectory. Quarterly revenue increased from approximately **$630M in Q1 2024 to $1.60B in Q1 2026**, with significant fluctuations between individual quarters.

The weakest quarter was **Q1 2024**, when TKO recorded negative operating and net income. Net profit margin reached approximately **-39.6%**.

The strongest profitability occurred in **Q2 2025**, with a net profit margin of approximately **20.9%**.

---

### Revenue Composition

**WWE was the largest segment over the analyzed period, generating approximately $3.58B in revenue.**

However, the revenue mix changed considerably over time.

During 2024, reported revenue was primarily concentrated in WWE and UFC. From 2025 onward, the introduction of reported IMG and Other revenue significantly diversified the business mix.

By **Q1 2026, IMG had become a major contributor**, accounting for approximately 41% of the combined reported segment revenue, compared with approximately 56% for UFC and WWE combined.

Among the reported revenue streams, **Media Rights consistently represented the largest source of revenue**, while Consumer Products remained the smallest contributor.

---

### UFC vs WWE Operational Efficiency

The analysis highlights a significant difference between UFC and WWE business models.

UFC generated approximately **$60M of revenue per ticketed event**, compared with approximately **$10M for WWE**.

However, WWE generated substantially more total revenue because it operates at a much higher event volume. For example, in Q1 2024, UFC recorded **5 ticketed events**, while WWE recorded **49**.

This demonstrates that:

> **UFC generates substantially more revenue per event, while WWE generates higher total revenue through a much larger volume of events.**

Revenue-per-attendee/ticket metrics also showed UFC generating higher revenue relative to its reported audience figures. These comparisons should be interpreted directionally because UFC attendance and WWE ticket distribution are measured differently.

---

### Operating Efficiency

Operating expenses totaled approximately **$7.68B**, representing roughly **84% of total revenue** across the analyzed period.

The operating expense burden was particularly high in **Q1 2024**, when operating expenses exceeded total revenue and contributed to the quarter's negative operating income.

After Q1 2024, operating expenses remained below revenue but continued to represent a substantial proportion of TKO's quarterly revenue.

---

## Key Takeaways

* TKO generated **$9.14B in revenue** across the analyzed period.
* Revenue increased substantially over the period despite significant quarterly volatility.
* **WWE was the largest cumulative revenue contributor**, generating approximately $3.58B.
* **Media Rights was consistently the dominant revenue stream.**
* Revenue became more diversified following the inclusion of IMG and Other from 2025 onward.
* **Q1 2024 was the weakest financial quarter**, while **Q2 2025 delivered the strongest net profitability**.
* UFC generated significantly more revenue per event than WWE.
* WWE generated higher total revenue through a substantially larger number of events.
* Operating expenses represented approximately **84% of total revenue**, highlighting a significant operating cost burden.

---

## Project Structure

```text
tko-financial-performance/
│
├── data/
│   ├── TKOPerformance.csv
│   ├── UFCPerformance.csv
│   └── WWEPerformance.csv
│
├── sql/
│   ├── 01_tko_revenue_growth.sql
│   ├── 02_segment_revenue_contribution.sql
│   ├── 03_segment_revenue_growth.sql
│   ├── 04_revenue_stream_mix.sql
│   ├── 05_net_profitability.sql
│   ├── 06_operating_expense_ratio.sql
│   ├── 07_revenue_profitability_ranking.sql
│   ├── 08_segment_qoq_growth.sql
│   ├── 09_revenue_per_event.sql
│   └── 10_event_audience_revenue_efficiency.sql
│
├── powerbi/
│   └── TKO_Financial_Performance.pbix
│
└── README.md
```

---

## Conclusion

This project demonstrates an end-to-end business analysis workflow, from structured financial data and SQL analysis to data modeling and interactive Power BI reporting.

The analysis combines **financial performance, revenue composition, profitability and operational efficiency** to provide a broader view of how TKO's different business segments contribute to overall performance.

The project also highlights an important analytical distinction between **scale and efficiency**: WWE generates greater total revenue through significantly higher event volume, while UFC generates substantially more revenue per individual event.
