WITH USERS AS (
    SELECT
        USER_id,
        CITY,
        UPPER(COUNTRY) AS COUNTRY,
        HOMETOWN,
        TO_TIMESTAMP_NTZ(MEMBERSHIP.VALUE:joined::VARCHAR/ 1000)::TIMESTAMP_NTZ(3)  AS JOINED_TIMESTAMP,
        MEMBERSHIP.VALUE:group_id AS GROUP_ID
    FROM
        {{ ref('raw_users') }},
        LATERAL FLATTEN(INPUT => MEMBERSHIPS) AS MEMBERSHIP
)

SELECT * FROM USERS