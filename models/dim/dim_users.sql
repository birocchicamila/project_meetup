WITH users AS (
    SELECT DISTINCT
        user_id,
        city AS user_city,
        country AS user_country,
        hometown AS user_hometown
    FROM
        {{ ref('src_users') }}
)

SELECT * FROM users
