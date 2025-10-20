#!/bin/bash
set -e 

SQL_FILE="init.sql"

echo "Running $SQL_FILE on $PGDATABASE..."
psql -f "$SQL_FILE"

echo "✅ Database initialized successfully!"
