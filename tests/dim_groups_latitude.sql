SELECT
    group_name,
    group_latitude
FROM
     {{ ref('dim_groups') }}
WHERE
    group_latitude > 90 OR group_latitude < -90