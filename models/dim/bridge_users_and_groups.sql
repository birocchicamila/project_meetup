WITH users_and_groups AS (
    SELECT DISTINCT
        REPLACE(group_id, '"', '') AS group_id,
        user_id
    FROM
        {{ ref('src_users') }}
 
)
SELECT * FROM users_and_groups