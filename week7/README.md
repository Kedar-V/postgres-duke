[Open the notebook: `sql_guide.ipynb`](./sql_guide.ipynb)

## SQL Guidebook — Summary

This folder contains a hands-on, personalized SQL reference guide designed to help you practice advanced SQL queries and document your work for interviews and future data tasks.

Primary resource:

- `sql_guide.ipynb` — a Jupyter Notebook with runnable examples that cover:
  - Basics (SELECT, FROM, WHERE, ORDER BY, GROUP BY, LIMIT, HAVING)
  - Aggregations (COUNT, AVG, MAX, ROUND)
  - JOINs (INNER, LEFT, RIGHT)
  - CASE WHEN and data transformation
  - Window functions (RANK, ROW_NUMBER, OVER, PARTITION BY, LEAD, LAG)
  - Common Table Expressions (WITH / CTE)
  - Date/time and NULL-handling examples (DATE_TRUNC, COALESCE)

Why use the notebook

- The notebook contains short explanations, SQL code snippets, and Python helpers to run queries and display results. It is a single place to run, iterate, and capture outputs for documentation.

Quick start — recommended setups

1) Use PostgreSQL (recommended)

   - If you have Docker available, you can start a Postgres container using the project's `docker-compose.yml` (in this folder):

```bash
# from project root
cd week7
docker compose up -d
```

   - Or run Postgres locally and ensure the connection details match the notebook. The notebook uses this SQLAlchemy engine by default:

```python
create_engine("postgresql+psycopg2://postgres:postgres@localhost:5432/postgres")
```

2) Use SQLite (alternative)

   - If you prefer not to run Postgres, modify `sql_guide.ipynb` connection code to use SQLite and adapt CREATE/INSERT statements accordingly.

Opening and running the notebook

- From command line (Jupyter must be installed):

```bash
# start Jupyter and open the notebook
jupyter notebook week7/sql_guide.ipynb
# or
jupyter lab week7/sql_guide.ipynb
```

- Or open the notebook directly in VS Code (recommended for step-by-step edits and saving outputs as screenshots).

What to prepare before running

- Ensure your database has multiple tables (customers, orders, payments, products, etc.) so JOIN examples run as-is. You can either load the provided datasets (if included) or create small sample tables using CREATE TABLE + INSERT statements.
- Confirm credentials: username, password, host, port, and DB name in the notebook's connection string.

Deliverables checklist (what to document / submit)

- SQL files:
  - Any `CREATE TABLE`, `INSERT`, `UPDATE`, or other SQL scripts you wrote (e.g., `init.sql`, `db_init.py`).
- Notebook:
  - `week7/sql_guide.ipynb` with runnable queries and outputs.
- Outputs / Evidence:
  - Screenshots or exported outputs (CSV / images) demonstrating query results.
- Short write-up (this README suffices):
  - Title for each query, short description, the SQL code, and sample output.
- Optional extras:
  - A short slide deck (PowerPoint) summarising key queries and insights.

Suggested set of practice questions

1. Top customers by total spending (window functions + CTE)
2. Monthly sales trend using DATE_TRUNC and COALESCE
3. Identify customers without orders (LEFT JOIN)
4. High-value orders classification using CASE WHEN
5. Compare previous vs current order date per customer (LAG)
6. Combine different-status orders using UNION / UNION ALL
7. Any two features you explored independently (string functions, advanced date math, full-text search, etc.)

Notes & tips

- Keep queries modular: use CTEs to make complex steps readable.
- Capture outputs immediately after running each query in the notebook so you have reproducible evidence.
- If a provided query errors due to different schema, either adapt column/table names or create small mock tables to match the examples.

Where to go next

- Open `week7/sql_guide.ipynb` and run the top cell to set up the `run_query` helper. Then run each section one-by-one and save outputs.
- If you'd like, I can:
  - Add a sample `init.sql` that creates small demo tables and inserts example rows.
  - Convert notebook examples to a single `example_queries.sql` file.

Happy querying — use this as your living SQL reference for interviews and projects.
