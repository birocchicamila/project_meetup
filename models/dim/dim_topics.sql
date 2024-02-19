-- Common Table Expression (CTE) named 'topics'
WITH topics AS (
    -- Selecting distinct group_id and topic from the source 'src_groups'
    SELECT DISTINCT
        group_id,
        topic
    FROM
        {{ ref('src_groups') }}
)

-- Final SELECT statement to generate a unique topic_id based on group_id and topic
SELECT 
    ROW_NUMBER() OVER (ORDER BY CONCAT(group_id, topic)) AS topic_id,
    group_id,
    topic
FROM topics
