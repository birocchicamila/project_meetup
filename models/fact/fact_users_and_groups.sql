
WITH USERS_AND_GROUPS AS (
    SELECT
        REPLACE(GROUP_ID, '"', '') AS GROUP_ID,
        USER_ID,
        JOINED_TIMESTAMP
    FROM
            {{ ref('src_users') }}
)
SELECT * FROM USERS_AND_GROUPS
{% if is_incremental() %}
WHERE
 JOINED_TIMESTAMP> (select max(JOINED_TIMESTAMP) from {{ this }})
{% endif %}