import pandas as pd
import numpy as np

# Set seed for reproducibility (wichtig für wissenschaftliche Arbeit)
np.random.seed(42)

# 1. Messpunkte definieren (1000 Zeilen)
n_points = 1000
time = np.arange(n_points)

# 2. Basis-Temperatur mit Rauschen (Normalverteilung)
# Wir simulieren eine Turbine, die im Normalbetrieb ca. 50 Grad hat
temperature = 50 + np.random.normal(0, 1, n_points)

# 3. Den "Anomalie-Trend" einfügen (Verschleiß-Simulation)
# Ab Punkt 800 steigt die Temperatur stetig an, was auf einen Defekt hindeutet
for i in range(800, n_points):
    temperature[i] = temperature[i-1] + 0.15 + np.random.normal(0, 0.1)

# 4. In DataFrame umwandeln
df = pd.DataFrame({
    'timestamp_id': time,
    'sensor_temp': temperature
})

# 5. DEIN SCHRITT: Daten glätten, um Fehlalarme zu vermeiden
df['temp_rolling_avg'] = df['sensor_temp'].rolling(window=10).mean()

# 6. Labeling (Das ist der ML-Teil!): 
# Wir markieren alles über 85 Grad als "High Risk" (Vorbereitung für Power BI)
df['maintenance_required'] = np.where(df['temp_rolling_avg'] > 85, 1, 0)

# Speichern als CSV für die nächste Phase
df.to_csv('turbine_sensor_data.csv', index=False)
print("Synthetische Sensordaten erfolgreich generiert!")
