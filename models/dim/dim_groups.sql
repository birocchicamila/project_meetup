WITH groups AS (
    SELECT DISTINCT
        group_id,
        city,
        created AS group_date_created,
        description,
        regexp_replace(description, '<[^>]+>', '') AS description_without_tags,
        group_name,
        latitude AS group_latitude,
        longitude AS group_longitude,
        link
    FROM
        {{ ref('src_groups') }}
)

SELECT * FROM groups
