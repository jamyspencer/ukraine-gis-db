FROM postgis/postgis:15-3.4

ENV POSTGRES_DB gis
ENV POSTGRES_USER gis_admin
ENV POSTGRES_PASSWORD jumpin_j@ck_fl@5h

RUN apt update
RUN apt install -y postgis

EXPOSE 5432
COPY data /data
COPY init.sql /docker-entrypoint-initdb.d

RUN shp2pgsql /data/railroads/railroads.shp ukraine.railroads_shape >> /docker-entrypoint-initdb.d/init.sql
RUN shp2pgsql /data/railroads/railroads.dbf ukraine.railroads >> /docker-entrypoint-initdb.d/init.sql
