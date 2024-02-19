-- Common Table Expression (CTE) named 'rsvps'
WITH rsvps AS (
    -- Selecting distinct RSVP attributes from the source 'src_events'
    SELECT DISTINCT
        response AS rsvp_response,
        user_id,
        rsvp_when,
        rsvp_when::DATE as date_rsvp_when,
        guests AS rsvp_guest,
        group_id,
        venue_id,
        md5(ifnull(name,'') || ifnull(description,'') ) as event_id
    FROM
        {{ ref('src_events') }}
)

-- Final SELECT statement to retrieve RSVP data and add a row number for the latest RSVP
SELECT *,
    ROW_NUMBER() OVER (PARTITION BY user_id, venue_id, group_id, event_id ORDER BY rsvp_when DESC) = 1 AS is_latest_rsvp_when
FROM rsvps
-- Filter by incremental updates based on rsvp_when timestamp
{% if is_incremental() %}
WHERE
    rsvp_when > (SELECT MAX(rsvp_when) FROM {{ this }})
{% endif %}
