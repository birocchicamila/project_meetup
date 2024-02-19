SELECT
    venue_name,
    venue_latitude
FROM
     {{ ref('dim_venues') }}
WHERE
    venue_latitude > 90 OR venue_latitude < -90