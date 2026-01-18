-- PREDICTIVE MAINTENANCE ANALYSIS
-- Goal: Identify high-risk turbines for the dashboard

CREATE VIEW v_maintenance_alerts AS
SELECT 
    f.timestamp, 
    d.model_name,
    d.location,
    f.sensor_temp_c,
    -- Wir markieren alles über 85 Grad als kritisch
    CASE 
        WHEN f.sensor_temp_c > 85 THEN 'CRITICAL'
        WHEN f.sensor_temp_c > 75 THEN 'WARNING'
        ELSE 'NORMAL'
    END AS health_status
FROM fact_sensor_readings f
INNER JOIN dim_turbines d ON f.turbine_id = d.turbine_id;
