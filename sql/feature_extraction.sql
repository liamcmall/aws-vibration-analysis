SELECT
    sensor_id,
    AVG(vibration_value) OVER (PARTITION BY sensor_id ORDER BY timestamp RANGE BETWEEN INTERVAL '1 hour' PRECEDING AND CURRENT ROW) AS avg_vibration_1hr,
    STDDEV(vibration_value) OVER (PARTITION BY sensor_id ORDER BY timestamp RANGE BETWEEN INTERVAL '1 hour' PRECEDING AND CURRENT ROW) AS stddev_vibration_1hr,
    COUNT(vibration_value) OVER (PARTITION BY sensor_id ORDER BY timestamp RANGE BETWEEN INTERVAL '1 hour' PRECEDING AND CURRENT ROW) AS count_vibration_1hr
FROM sensor_data;