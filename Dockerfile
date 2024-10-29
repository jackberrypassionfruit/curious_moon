FROM postgres:latest

ENV POSTGRES_PASSWORD="postgres"

RUN apt-get update \
 && apt-get install make
EXPOSE 5432
USER postgres