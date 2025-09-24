-- Fact Table: fact_names
-- Contains measurable attributes (birth counts) with foreign keys to dimension tables

CREATE OR REPLACE TABLE `j4amidtermproject.class_dw.fact_names` AS
SELECT
  INITCAP(LOWER(name)) AS name_standardized,
  gender,
  UPPER(state) AS state_code,
  year,
  number AS births_count,
  DATE(CONCAT(CAST(FLOOR(year/10)*10 AS STRING), '-01-01')) AS decade_start
FROM `bigquery-public-data.usa_names.usa_1910_2013`
WHERE name IS NOT NULL AND number > 0;