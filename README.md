# AI-Driven Predictive Maintenance Dashboard

This project demonstrates a full-stack data architecture: from simulating industrial IoT sensor streams to real-time anomaly detection and AI-based failure forecasting.

## 🏗 Architecture Overview
1. **Backend (Python)**: Generates synthetic turbine sensor data. It simulates a stable baseline and injects a thermal runaway anomaly after 800 cycles to represent mechanical fatigue.
2. **Data Engineering (Power Query)**: Implemented robust data typing and rolling average calculations to stabilize the signal for the AI model.
3. **Analytics (Power BI & AI)**: 
   * **Real-time Monitoring**: DAX-based KPI tracking to count critical threshold violations.
   * **Predictive Forecasting**: Uses an exponential smoothing model (95% confidence interval) to predict the exact point of failure based on the thermal trend.

## 📊 Dashboard Preview
![Turbine Health Monitor](dashboard_preview.png)

## 🛠 Tech Stack
* **Python**: Used `pandas` and `numpy` for high-fidelity data simulation.
* **Power BI**: Advanced data modeling, DAX measures, and AI Time-Series Forecasting.

## 📂 Project Files
* `Turbine_Predictive_Maintenance_Analytics.pbix`: The full Power BI report.
* `data_generator.py`: Python script for sensor simulation.
