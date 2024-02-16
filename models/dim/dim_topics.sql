
WITH TOPICS AS (
    SELECT DISTINCT
        GROUP_ID,
        TOPIC
    FROM
        {{ ref('src_groups') }}
)

SELECT 
    ROW_NUMBER() OVER (ORDER BY CONCAT(GROUP_ID,TOPIC)) AS TOPIC_ID,
    GROUP_ID,
    TOPIC 
        
FROM TOPICS