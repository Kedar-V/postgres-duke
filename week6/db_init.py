import pandas as pd
import sqlite3
from pathlib import Path

csv_path = "QSRanking.csv" 
db_path = Path(csv_path).with_suffix(".db")

df = pd.read_csv(csv_path, encoding="latin1")
conn = sqlite3.connect(db_path)
df.to_sql("university_rankings", conn, if_exists="replace", index=False)
conn.close()