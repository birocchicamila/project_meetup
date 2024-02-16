WITH EVENTS as (

SELECT DISTINCT
    GROUP_ID,
    NAME,
    DESCRIPTION,
    CREATED,
    TIME,
    DURATION,
    RSVP_LIMIT,
    VENUE_ID,
    STATUS
FROM
     {{ ref('src_events') }})

SELECT * FROM EVENTS
{% if is_incremental() %}
WHERE
CREATED > (select max(CREATED) from {{ this }})
{% endif %}

