
WITH topics AS (
    SELECT DISTINCT
        group_id,
        topic
    FROM
        {{ ref('src_groups') }}
)

SELECT 
    ROW_NUMBER() OVER (ORDER BY CONCAT(group_id, topic)) AS topic_id,
    group_id,
    topic
FROM topics
