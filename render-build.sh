#!/usr/bin/env bash
set -o errexit

export $(grep -v '^#' .env | xargs)

echo "Generating config/database.yml..."

cat <<EOT >config/database.yml
production:
  adapter: mysql2
  encoding: utf8mb4
  reconnect: true
  database: ${DATABASE_NAME}
  pool: 5
  username: ${DATABASE_USERNAME}
  password: ${DATABASE_PASSWORD}
  host: ${DATABASE_HOST}
  port: ${DATABASE_PORT}
EOT

bundle install
