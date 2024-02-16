
WITH USERS AS (
    SELECT DISTINCT
        USER_ID,
        CITY,
        COUNTRY,
        HOMETOWN
    FROM
        {{ ref('src_users') }}
        )

SELECT * FROM USERS