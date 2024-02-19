-- Configuration
WITH RECURSIVE date_range AS (
    SELECT
        '2007-01-01'::DATE AS date
    UNION ALL
    SELECT
        date + 1
    FROM
        date_range
    WHERE
        date < CURRENT_DATE()::DATE
)

-- Date Dimension Table
, date_dim AS (
    SELECT
        date,
        YEAR(date) AS year,
        QUARTER(date) AS quarter,
        MONTH(date) AS month,
        MONTHNAME(TO_DATE(date)) AS month_name,
        DAYOFMONTH(date) AS day,
        DAYOFWEEK(date) AS day_of_week,
        DAYNAME(date) AS day_name_of_week,
        WEEKOFYEAR(date) AS week_of_year,
        TO_CHAR(date, 'YYYY-MM-DD') AS formatted_date,
        TO_VARIANT(CONCAT(TO_VARIANT(MONTHNAME(date)), ' ', TO_VARIANT(YEAR(date)))) AS month_and_year
    FROM
        date_range
)

-- Final Model
SELECT * FROM date_dim
