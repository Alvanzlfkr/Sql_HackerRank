WITH cte AS(
    SELECT
        MIN(LAT_N) AS min_lat_n,
        MIN(LONG_W) AS min_long_w,
        MAX(LAT_N) AS max_lat_n,
        MAX(LONG_W) AS max_long_w
    FROM station 
)

SELECT
CAST(
    ROUND(
    (max_lat_n - min_lat_n)+(max_long_w - min_long_w),4)
    AS DECIMAL(10,4)
)
FROM cte;
