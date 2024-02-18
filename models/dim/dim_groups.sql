WITH groups AS (
    -- Selecting distinct group attributes from the source 'src_groups'
    SELECT DISTINCT
        group_id,
        created AS group_date_created,
        description,
        regexp_replace(description, '<[^>]+>', '') AS description_without_tags,
        group_name,
        latitude AS group_latitude,
        longitude AS group_longitude,
        link,
        city AS group_city
    FROM
        {{ ref('src_groups') }}
)

-- Final SELECT statement to retrieve all columns from the 'groups' CTE
SELECT * FROM groups