#!/bin/bash

function createdb {
    /usr/bin/psql -U postgres -c "CREATE DATABASE ezp WITH ENCODING 'UTF8'"
    /usr/bin/psql -U postgres -c "CREATE USER ezp WITH PASSWORD 'ezp'"
    /usr/bin/psql -U postgres -c "GRANT ALL PRIVILEGES ON DATABASE ezp to ezp;"
    /usr/bin/psql -U postgres --dbname=ezp -c "\i '/usr/share/pgsql/contrib/pgcrypto.sql'"
}

createdb