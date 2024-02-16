WITH VENUES AS (
    SELECT
        VENUE_ID,
        VENUE_NAME,
        CITY,
        COUNTRY,
        LATITUDE,
        LONGITUDE
    FROM
        {{ ref('src_venues') }}
)

-- Select and transform data from the CTE
SELECT
    *
FROM
    VENUES