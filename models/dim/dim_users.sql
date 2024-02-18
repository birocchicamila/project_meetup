-- Common Table Expression (CTE) named 'users'
WITH users AS (
    -- Selecting distinct user attributes from the source 'src_users'
    SELECT DISTINCT
        user_id,
        city AS user_city,
        country AS user_country,
        hometown AS user_hometown
    FROM
        {{ ref('src_users') }}
)

-- Final SELECT statement to retrieve all columns from the 'users' CTE
SELECT * FROM users
