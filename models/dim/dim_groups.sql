
WITH GROUPS AS (
    SELECT DISTINCT
        GROUP_ID,
        CITY,
        CREATED,
        DESCRIPTION,
        REGEXP_REPLACE(DESCRIPTION, '<[^>]+>', '') AS DESCRIPTION_WIHOUT_TAGS,
        GROUP_NAME,
        LATITUDE,
        LONGITUDE,
        LINK
    FROM
        {{ ref('src_groups') }}
)

SELECT * FROM GROUPS