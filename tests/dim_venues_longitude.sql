SELECT
    venue_name,
    venue_longitude
FROM
     {{ ref('dim_venues') }}
WHERE
    venue_longitude > 180 OR venue_longitude < -180