WITH venues AS (
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

SELECT
    *
FROM
    venues
