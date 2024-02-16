WITH users_and_groups AS (
    SELECT
        REPLACE(group_id, '"', '') AS group_id,
        user_id,
        joined_timestamp
    FROM
        {{ ref('src_users') }}
)
SELECT * FROM users_and_groups
{% if is_incremental() %}
WHERE
joined_timestamp > (SELECT MAX(joined_timestamp) FROM {{ this }})
{% endif %}
