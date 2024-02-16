WITH events AS (
    SELECT DISTINCT
        group_id,
        name AS event_name,
        description AS event_description,
        created AS date_event_created,
        time AS event_start_date,
        duration AS event_durantion_seconds,
        rsvp_limit,
        venue_id,
        status
    FROM
        {{ ref('src_events') }}
)

SELECT * FROM events
{% if is_incremental() %}
WHERE
created > (SELECT MAX(created) FROM {{ this }})
{% endif %}

