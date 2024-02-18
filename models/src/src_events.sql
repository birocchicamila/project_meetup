-- Common Table Expression (CTE) named 'events'
WITH events AS (
    -- Selecting attributes from the source 'meetup' events and flattening RSVPs
    SELECT
        GROUP_ID,
        NAME,
        DESCRIPTION,
        TO_TIMESTAMP_NTZ(CREATED / 1000)::TIMESTAMP_NTZ(3) AS CREATED,
        TO_TIMESTAMP_NTZ(TIME / 1000)::TIMESTAMP_NTZ(3) AS TIME,
        DURATION,
        RSVP_LIMIT,
        VENUE_ID,
        STATUS,
        RSVP.VALUE:response::VARCHAR AS RESPONSE,
        RSVP.VALUE:user_id::NUMBER AS USER_ID,
        TO_TIMESTAMP_NTZ(RSVP.VALUE:when::VARCHAR / 1000)::TIMESTAMP_NTZ(3) AS RSVP_WHEN,
        RSVP.VALUE:guests::NUMBER AS GUESTS
    FROM
        {{ source('meetup', 'events') }},
        LATERAL FLATTEN(INPUT => RSVPS) AS RSVP
)

-- Final SELECT statement to retrieve all columns from the 'events' CTE
SELECT * FROM events