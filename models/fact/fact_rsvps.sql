WITH rsvps AS (
    SELECT DISTINCT
        response AS rsvp_response,
        user_id,
        rsvp_when,
        guests AS rsvp_guest,
        group_id,
        venue_id
    FROM
        {{ ref('src_events') }}
)

SELECT * FROM rsvps
{% if is_incremental() %}
WHERE
rsvp_when > (SELECT MAX(rsvp_when) FROM {{ this }})
{% endif %}
