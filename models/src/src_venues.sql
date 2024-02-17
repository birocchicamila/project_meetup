WITH VENUES AS (
    SELECT
        VENUE_ID,
        NAME AS VENUE_NAME,
        CITY,
        UPPER(COUNTRY) AS COUNTRY,
        CAST(LAT AS FLOAT) AS LATITUDE,
        CAST(LON AS FLOAT) AS LONGITUDE
    FROM
        MEETUP.RAW.RAW_VENUES
)

SELECT * FROM VENUES