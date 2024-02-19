-- Common Table Expression (CTE) named 'groups'
WITH groups AS (
    -- Selecting attributes from the source 'meetup' groups and flattening topics
    SELECT
        CITY,
        TO_TIMESTAMP_NTZ(CREATED / 1000)::TIMESTAMP_NTZ(3) AS CREATED,
        DESCRIPTION,
        NAME AS GROUP_NAME,
        CAST(LAT AS FLOAT) AS LATITUDE,
        CAST(LON AS FLOAT) AS LONGITUDE,
        LINK,
        GROUP_ID,
        TOPIC.VALUE::VARCHAR AS TOPIC
    FROM
        {{ source('meetup', 'groups') }},
        LATERAL FLATTEN(INPUT => TOPICS) AS TOPIC
)

-- Final SELECT statement to retrieve all columns from the 'groups' CTE
SELECT * FROM groups