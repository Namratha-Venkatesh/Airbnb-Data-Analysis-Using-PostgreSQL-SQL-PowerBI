# Analyse Airbnb with Postgres
To import the data from Murray Cox (https://www.insideairbnb.com) into Postgres, use either the provided Dockerfile or run the provided code manually. 

# Run with Docker
At first, download the data from [http://insideairbnb.com/get-the-data.html](http://insideairbnb.com/get-the-data.html) and save them in the "data" folder. You need the following three files: listings.csv.gz, calendar.csv.gz and reviews.csv.gz *Do not unpack them!* 
Build the docker image and run it:
* docker build -t insideairbnb .
* docker run -it insideairbnb

The data is imported to the postgres database on the first start of the docker container. Use the docker cp command to copy the results of the analysis made by queries.sh and create-diagram.py:
* docker cp <containerId>:/out/active.csv ./active.csv
* docker cp <containerId>:/out/active.png./active.png

To run your own analysis, start psql in the docker container like 
* docker  exec -it \<container name> psql

or connect to the database running in the container on port 5432.

# Run manually
At first, download the data from [http://insideairbnb.com/get-the-data.html](http://insideairbnb.com/get-the-data.html) and unpack it. Use the provided python script (**prepare-data.py**) to remove nun-numeric characters from numeric fields. Create a new postgres database and import the schema from **schema.sql**.  To import the data, run the following commands: 
* psql command "COPY listings FROM './listings.csv' DELIMITER ',' CSV HEADER;"
* psql command "COPY listings FROM './calendar.csv' DELIMITER ',' CSV HEADER;"
* psql command "COPY listings FROM './reviews.csv' DELIMITER ',' CSV HEADER;"

Then execute the follwing queries to get the number of all apartments and the number of aparments that are active (= at least one review in the last year or at least one bookable day in the upcoming year).
* create view active_listings as select * from listings where exists (select * from calendar where available = 't' and listings.id = calendar.listing_id and date between last_scraped and last_scraped + interval '1 year') or exists (select * from reviews where listings.id = reviews.listing_id and date between last_scraped - interval '1 year' and last_scraped)
* "\COPY (select (select count(*) as all from listings), (select count(*) as active from active_listings)) TO './active.csv' DELIMITER ',' CSV HEADER;"

To create a pie chart out of the exported data, run python3 create-diagram.py active.csv
