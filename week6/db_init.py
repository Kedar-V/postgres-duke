import pandas as pd
import sqlite3
from pathlib import Path

csv_path = "ecommerce_data.csv" 
db_path = Path(csv_path).with_suffix(".db")

df = pd.read_csv(csv_path)
conn = sqlite3.connect(db_path)
df.to_sql("sales_data", conn, if_exists="replace", index=False)
conn.close()