#!/usr/bin/env bash
set -o errexit

echo "Generating config/database.yml..."

cat <<EOT >config/database2.yml
production:
  adapter: mysql2
  encoding: utf8mb4
  reconnect: true
  url: <%= ENV['DATABASE_URL'] %>
EOT
