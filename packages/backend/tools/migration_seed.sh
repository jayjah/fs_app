#!/bin/zsh
# Run migration && seeds
dart run stormberry migrate --db=$DB_NAME --host=$DB_HOST --port=$DB_PORT --username=$DB_USER --password=$DB_PASSWORD --no-ssl --apply-changes
dart run bin/seeds.dart