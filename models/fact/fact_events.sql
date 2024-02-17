WITH events AS (
    SELECT DISTINCT
        group_id,
        dim.event_id,
        created AS date_event_created,
        time AS event_start_date,
        duration AS event_duration_seconds,
        rsvp_limit,
        venue_id,
        status
    FROM
        {{ ref('src_events') }} 
    LEFT JOIN  {{ ref('dim_events') }} dim ON name=event_name AND event_description=description

   
)

SELECT *,
        ROW_NUMBER() OVER (PARTITION BY group_id,event_id,venue_id ORDER BY date_event_created,event_start_date DESC)=1 AS is_latest_status
        
     FROM events
{% if is_incremental() %}
WHERE
date_event_created > (SELECT MAX(date_event_created) FROM {{ this }})
{% endif %}

