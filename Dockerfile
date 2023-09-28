FROM postgis/postgis:15-3.4

RUN apt update
RUN apt install -y postgis

EXPOSE 5432
COPY data /data
COPY init.sql /docker-entrypoint-initdb.d

RUN shp2pgsql /data/railroads/railroads ukraine.railroads >> /docker-entrypoint-initdb.d/init.sql
