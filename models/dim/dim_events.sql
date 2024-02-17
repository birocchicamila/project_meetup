WITH events AS (
    SELECT DISTINCT
        name AS event_name,
        description AS event_description,
        regexp_replace(description, '<[^>]+>', '') AS event_description_without_tags
    FROM
        {{ ref('src_events') }}
)

SELECT ROW_NUMBER() OVER (ORDER BY CONCAT(event_name, event_description)) AS event_id, * 
FROM events
