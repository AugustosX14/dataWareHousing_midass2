# Baby Names Data Warehouse Project

This project implements a star schema data warehouse for analyzing baby name trends using Google BigQuery and the USA Names public dataset.

## Project Structure

- `fact_names.sql` - Creates the fact table containing measurable birth count data
- `dimension_tables.sql` - Creates dimension tables for time, state, and gender attributes
- `star_schema_query.sql` - Implements the business query to find top 5 male names per state in the 2000s
- `reflection.md` - Analysis and reflection on the data warehousing concepts learned

## Dataset

- **Source**: `bigquery-public-data.usa_names.usa_1910_2013`
- **Project**: j4amidtermproject
- **Dataset**: class_dw

## Business Question

Find the top 5 most popular male names per state during the years 2000-2009, ranked by total births.

## Implementation

1. **Fact Table**: Stores birth counts with standardized names and normalized attributes
2. **Dimension Tables**: 
   - `dim_time`: Year, decade, and period classifications
   - `dim_state`: State codes with categorization
   - `dim_gender`: Gender with descriptive labels
3. **Star Schema Query**: Joins all tables to answer the business question efficiently

## Usage

Run the SQL files in BigQuery Console in the following order:
1. Create the dataset `class_dw` in your project
2. Execute `fact_names.sql`
3. Execute `dimension_tables.sql`
4. Execute `star_schema_query.sql`