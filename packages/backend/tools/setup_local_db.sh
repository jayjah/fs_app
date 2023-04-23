#!/bin/zsh
# Set up database in a docker container
docker run --log-driver local --log-opt max-size=10m --log-opt max-file=3 --rm --name postgres_container --rm  -e POSTGRES_DB=$DB_NAME -e POSTGRES_PASSWORD=$DB_PASSWORD -e POSTGRES_USER=$DB_USER -p $DB_PORT:5432  -d postgres:14.7
# wait till database is up and running
sleep 1
# Run migration && seeds
./tools/migration_seed.sh