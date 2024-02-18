WITH events AS (
    SELECT DISTINCT
        name AS event_name,
        description AS event_description,
        regexp_replace(description, '<[^>]+>', '') AS event_description_without_tags,
        created AS timestamp_event_created,
        created::DATE AS date_event_created,
        time AS event_start_timestamp,
        time::DATE AS event_start_date,
        duration/100000 AS event_duration_seconds,
        duration/100000/60 AS event_duration_minutes,
        duration/100000/3600 AS event_duration_hours,
        rsvp_limit,
        status,
        md5(ifnull(name,'') || ifnull(description,'') ) as event_id

    FROM
        {{ ref('src_events') }}
),



latest_status AS (

SELECT DISTINCT * , 
ROW_NUMBER() OVER (PARTITION BY event_id ORDER BY date_event_created,event_start_date DESC)=1 AS is_latest_status

FROM events
)

SELECT * FROM latest_status
where is_latest_status=TRUE