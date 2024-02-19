-- Common Table Expression (CTE) named 'users'
WITH users AS (
    -- Selecting attributes from the source 'meetup' users and flattening memberships
    SELECT
        USER_id,
        CITY,
        UPPER(COUNTRY) AS COUNTRY,
        HOMETOWN,
        TO_TIMESTAMP_NTZ(MEMBERSHIP.VALUE:joined::VARCHAR / 1000)::TIMESTAMP_NTZ(3) AS JOINED_TIMESTAMP,
        MEMBERSHIP.VALUE:group_id AS GROUP_ID
    FROM
        {{ source('meetup', 'users') }},
        LATERAL FLATTEN(INPUT => MEMBERSHIPS) AS MEMBERSHIP
)

-- Final SELECT statement to retrieve all columns from the 'users' CTE
SELECT * FROM users