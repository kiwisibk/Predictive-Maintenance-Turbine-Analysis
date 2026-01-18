-- DATABASE SETUP FOR PREDICTIVE MAINTENANCE
-- Author: Your Portfolio
-- Description: Star Schema for industrial sensor data tracking

-- 1. Stammdaten der Turbinen (Dimension Table)
CREATE TABLE dim_turbines (
    turbine_id INT PRIMARY KEY,
    model_name VARCHAR(50),
    commissioning_date DATE,
    location VARCHAR(50)
);

-- 2. Sensordaten (Fact Table)
CREATE TABLE fact_sensor_readings (
    reading_id SERIAL PRIMARY KEY,
    timestamp TIMESTAMP NOT NULL,
    turbine_id INT,
    sensor_temp_c DECIMAL(6,2),
    sensor_vibration_hz DECIMAL(6,2),
    -- Die Verknüpfung (Relation)
    CONSTRAINT fk_turbine 
        FOREIGN KEY (turbine_id) 
        REFERENCES dim_turbines(turbine_id)
);
