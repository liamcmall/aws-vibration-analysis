UNLOAD ('
SELECT
    timestamp,
    AVG(V_in) OVER (PARTITION BY timestamp ORDER BY timestamp RANGE BETWEEN INTERVAL ''1 hour'' PRECEDING AND CURRENT ROW) AS avg_V_in_1hr,
    AVG(Measured_RPM) OVER (PARTITION BY timestamp ORDER BY timestamp RANGE BETWEEN INTERVAL ''1 hour'' PRECEDING AND CURRENT ROW) AS avg_RPM_1hr,
    AVG(Vibration_1) OVER (PARTITION BY timestamp ORDER BY timestamp RANGE BETWEEN INTERVAL ''1 hour'' PRECEDING AND CURRENT ROW) AS avg_Vibration_1_1hr,
    AVG(Vibration_2) OVER (PARTITION BY timestamp ORDER BY timestamp RANGE BETWEEN INTERVAL ''1 hour'' PRECEDING AND CURRENT ROW) AS avg_Vibration_2_1hr,
    AVG(Vibration_3) OVER (PARTITION BY timestamp ORDER BY timestamp RANGE BETWEEN INTERVAL ''1 hour'' PRECEDING AND CURRENT ROW) AS avg_Vibration_3_1hr,
    MAX(Vibration_1) OVER (PARTITION BY timestamp ORDER BY timestamp RANGE BETWEEN INTERVAL ''1 hour'' PRECEDING AND CURRENT ROW) AS max_Vibration_1_1hr,
    MAX(Vibration_2) OVER (PARTITION BY timestamp ORDER BY timestamp RANGE BETWEEN INTERVAL ''1 hour'' PRECEDING AND CURRENT ROW) AS max_Vibration_2_1hr,
    MAX(Vibration_3) OVER (PARTITION BY timestamp ORDER BY timestamp RANGE BETWEEN INTERVAL ''1 hour'' PRECEDING AND CURRENT ROW) AS max_Vibration_3_1hr,
    MIN(Vibration_1) OVER (PARTITION BY timestamp ORDER BY timestamp RANGE BETWEEN INTERVAL ''1 hour'' PRECEDING AND CURRENT ROW) AS min_Vibration_1_1hr,
    MIN(Vibration_2) OVER (PARTITION BY timestamp ORDER BY timestamp RANGE BETWEEN INTERVAL ''1 hour'' PRECEDING AND CURRENT ROW) AS min_Vibration_2_1hr,
    MIN(Vibration_3) OVER (PARTITION BY timestamp ORDER BY timestamp RANGE BETWEEN INTERVAL ''1 hour'' PRECEDING AND CURRENT ROW) AS min_Vibration_3_1hr
FROM
    sensor_data_table
')
TO 's3://liam-vibration-analysis/processed_data/features/'
/* need IAM ROLE */
FORMAT AS PARQUET;