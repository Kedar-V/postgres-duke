# Devcontainer configuration files
mkdir .devcontainer
touch .devcontainer/devcontainer.json
touch .devcontainer/docker-compose.yml
touch .devcontainer/.env

# SQL initialization file ( in project root)
touch init.sql

# Python requirements ( in project root)
touch requirements.txt

mkdir scripts
# Python script inside scripts/
touch scripts/query.py