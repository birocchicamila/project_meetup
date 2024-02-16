WITH RSVPS AS (
    SELECT DISTINCT
    RESPONSE,
    USER_ID,
    RSVP_WHEN,
    GUESTS,
    GROUP_ID,
    VENUE_ID
    FROM
        {{ ref('src_events') }}
)

SELECT * FROM RSVPS
{% if is_incremental() %}
WHERE
 RSVP_WHEN> (select max(RSVP_WHEN) from {{ this }})
{% endif %}