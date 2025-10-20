"""Import QSRanking.csv into a PostgreSQL database.

Usage:
  - Set environment variables: PGHOST, PGPORT, PGUSER, PGPASSWORD, PGDATABASE
  - Optional CLI flags:
      --drop : drop the `university_rankings` table before creating

This script reads `QSRanking.csv` from the current folder and writes into a table
`university_rankings` with columns matching the CSV headers.
"""
import os
import csv
import argparse
import psycopg2
from psycopg2 import sql

CSV_PATH = "QSRanking.csv"
TABLE_NAME = "university_rankings"

CREATE_TABLE_SQL = f"""
CREATE TABLE IF NOT EXISTS {TABLE_NAME} (
    RANK_2025 INTEGER,
    RANK_2024 INTEGER,
    Institution_Name TEXT,
    Location TEXT,
    Region TEXT,
    SIZE TEXT,
    FOCUS TEXT,
    "RES." TEXT,
    STATUS TEXT,
    Academic_Reputation_Score REAL,
    Academic_Reputation_Rank INTEGER,
    Employer_Reputation_Score REAL,
    Employer_Reputation_Rank INTEGER,
    Faculty_Student_Score REAL,
    Faculty_Student_Rank INTEGER,
    Citations_per_Faculty_Score REAL,
    Citations_per_Faculty_Rank INTEGER,
    International_Faculty_Score REAL,
    International_Faculty_Rank INTEGER,
    International_Students_Score REAL,
    International_Students_Rank INTEGER,
    International_Research_Network_Score REAL,
    International_Research_Network_Rank INTEGER,
    Employment_Outcomes_Score REAL,
    Employment_Outcomes_Rank INTEGER,
    Sustainability_Score REAL,
    Sustainability_Rank INTEGER,
    Overall_Score REAL
);
"""


def get_conn():
    params = {
        'host': os.getenv('PGHOST', 'localhost'),
        'port': int(os.getenv('PGPORT', 5432)),
        'user': os.getenv('PGUSER', 'postgres'),
        'password': os.getenv('PGPASSWORD', ''),
        'dbname': os.getenv('PGDATABASE', 'postgres'),
    }
    return psycopg2.connect(**params)


def main():
    parser = argparse.ArgumentParser(description='Load QSRanking.csv into Postgres')
    parser.add_argument('--drop', action='store_true', help='Drop table if exists before creating')
    args = parser.parse_args()

    if not os.path.exists(CSV_PATH):
        raise SystemExit(f"CSV file not found at {CSV_PATH}")

    conn = get_conn()
    try:
        with conn:
            with conn.cursor() as cur:
                if args.drop:
                    cur.execute(sql.SQL('DROP TABLE IF EXISTS {}').format(sql.Identifier(TABLE_NAME)))
                cur.execute(CREATE_TABLE_SQL)

                with open(CSV_PATH, newline='', encoding='latin1') as csvfile:
                    reader = csv.reader(csvfile)
                    headers = next(reader)

                    # Build insert statement dynamically
                    columns = [sql.Identifier(h) for h in headers]
                    insert = sql.SQL('INSERT INTO {} ({}) VALUES ({})').format(
                        sql.Identifier(TABLE_NAME),
                        sql.SQL(',').join(columns),
                        sql.SQL(',').join(sql.Placeholder() * len(columns))
                    )

                    batch = []
                    for row in reader:
                        # Normalize empty strings to None
                        row = [None if v == '' else v for v in row]
                        batch.append(row)
                        if len(batch) >= 500:
                            cur.executemany(insert.as_string(conn), batch)
                            batch = []
                    if batch:
                        cur.executemany(insert.as_string(conn), batch)
        print('Import complete.')
    finally:
        conn.close()


if __name__ == '__main__':
    main()
