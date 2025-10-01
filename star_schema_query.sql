-- Star Schema Query: Top 5 Male Names per State (2000-2009)
-- This query joins the fact table with all dimension tables to answer the business question

CREATE OR REPLACE VIEW `j4amidtermproject.class_dw.top5_male_names_2000s` AS
SELECT
  fs.state_code,
  fs.year,
  fs.name_standardized,
  SUM(fs.births_count) AS total_births,
  RANK() OVER (PARTITION BY fs.state_code, fs.year ORDER BY SUM(fs.births_count) DESC) AS name_rank
FROM `j4amidtermproject.class_dw.fact_names` fs
JOIN `j4amidtermproject.class_dw.dim_gender` dg
  ON fs.gender = dg.gender
JOIN `j4amidtermproject.class_dw.dim_state` ds
  ON fs.state_code = ds.state_code
JOIN `j4amidtermproject.class_dw.dim_time` dt
  ON fs.year = dt.year
WHERE dg.gender_label = 'Male'
  AND fs.year BETWEEN 2000 AND 2009
GROUP BY fs.state_code, fs.year, fs.name_standardized
QUALIFY name_rank <= 5
ORDER BY fs.state_code, fs.year, name_rank;