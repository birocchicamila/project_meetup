WITH VENUES AS (
    SELECT
        VENUE_ID,
        NAME AS VENUE_NAME,
        CITY,
        UPPER(COUNTRY) AS COUNTRY,
        LAT AS LATITUDE,
        LON AS LONGITUDE
    FROM
        MEETUP.RAW.RAW_VENUES
)

SELECT * FROM VENUES