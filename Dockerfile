FROM postgres:9.6

RUN mkdir /etc/twinepm-server-heroku/diskdb/

WORKDIR /etc/twinepm-server-heroku/diskdb/

ENV POSTGRES_DB=twinepm

ENV POSTGRES_USER=root

COPY 00_twinepm_schema.sql /docker-entrypoint-initdb.d/

COPY 10_twinepm_contents.sql /docker-entrypoint-initdb.d/

COPY . .