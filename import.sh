psql --d root -U root --command "COPY listings FROM '/host/data/listings.csv' DELIMITER ',' CSV HEADER;"
psql --d root -U root --command "COPY calendar FROM '/host/data/calendar.csv' DELIMITER ',' CSV HEADER;"
psql --d root -U root --command "COPY reviews FROM '/host/data/reviews.csv' DELIMITER ',' CSV HEADER;"
