-- Common Table Expression (CTE) named 'venues'
WITH venues AS (
    -- Selecting attributes from the source 'meetup' venues
    SELECT
        VENUE_ID,
        NAME AS VENUE_NAME,
        CITY,
        UPPER(COUNTRY) AS COUNTRY,
        CAST(LAT AS FLOAT) AS LATITUDE,
        CAST(LON AS FLOAT) AS LONGITUDE
    FROM
        {{ source('meetup', 'venues') }}
)

-- Final SELECT statement to retrieve all columns from the 'venues' CTE
SELECT * FROM venues