-- Common Table Expression (CTE) named 'venues'
WITH venues AS (
    -- Selecting venue attributes from the source 'src_venues'
    SELECT
        venue_id,
        venue_name,
        city AS venue_city,
        country AS venue_country,
        latitude AS venue_latitude,
        longitude AS venue_longitude
    FROM
        {{ ref('src_venues') }}
)

-- Final SELECT statement to retrieve all columns from the 'venues' CTE
SELECT
    *
FROM
    venues
