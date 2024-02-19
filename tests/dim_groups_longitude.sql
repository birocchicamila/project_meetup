SELECT
    group_name,
    group_longitude
FROM
     {{ ref('dim_groups') }}
WHERE
    group_longitude > 180 OR group_longitude < -180