FROM postgres:12.2
ENV POSTGRES_USER root
ENV POSTGRES_PASSWORD xxx
ENV POSTGRES_DB root
COPY ./schema.sql /docker-entrypoint-initdb.d/1-schema.sql
COPY ./import.sh /docker-entrypoint-initdb.d/2-import.sh
COPY ./queries.sh /docker-entrypoint-initdb.d/3-queries.sh
RUN mkdir /out
RUN chmod a+rwx -R /out
ADD . /host
WORKDIR /host
RUN gunzip data/listings.csv.gz
RUN gunzip data/calendar.csv.gz
RUN gunzip data/reviews.csv.gz
RUN apt-get update
RUN apt-get --assume-yes install python3
RUN apt-get --assume-yes install python3-matplotlib
RUN apt-get --assume-yes install python3-tk
RUN python3 prepare-data.py data/listings.csv
RUN python3 prepare-data.py data/calendar.csv
RUN python3 prepare-data.py data/reviews.csv
