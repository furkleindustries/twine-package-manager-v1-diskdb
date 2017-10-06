# Use the official PostgreSQL 10.0 image as a base.
# https://github.com/docker-library/postgres/blob/f34b7cb79c4209a67b573f3bc4bc7827d69800e1/10/Dockerfile
FROM postgres:10.0

# Recursively create the directory for the on-disk database container.
RUN mkdir -p /etc/twinepm-server-heroku/diskdb/

# Set the working directory.
WORKDIR /etc/twine-package-manager/diskdb/

ENV POSTGRES_DB=twinepm

ENV POSTGRES_USER=root

# Copy the schema to the autovacuum directory, creating the twinepm database.
COPY 00_twinepm_schema.sql /docker-entrypoint-initdb.d/

COPY . .