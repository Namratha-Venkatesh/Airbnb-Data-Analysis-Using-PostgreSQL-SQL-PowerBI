CREATE TABLE listings (
	id DECIMAL Primary Key, 
	listing_url VARCHAR, 
	scrape_id DECIMAL, 
	last_scraped DATE, 
	name VARCHAR, 
	summary VARCHAR, 
	space VARCHAR, 
	description VARCHAR, 
	experiences_offered VARCHAR, 
	neighborhood_overview VARCHAR, 
	notes VARCHAR, 
	transit VARCHAR, 
	access VARCHAR, 
	interaction VARCHAR, 
	house_rules VARCHAR, 
	thumbnail_url VARCHAR, 
	medium_url VARCHAR, 
	picture_url VARCHAR, 
	xl_picture_url VARCHAR, 
	host_id DECIMAL, 
	host_url VARCHAR, 
	host_name VARCHAR, 
	host_since DATE, 
	host_location VARCHAR, 
	host_about VARCHAR, 
	host_response_time VARCHAR, 
	host_response_rate DECIMAL, 
	host_acceptance_rate DECIMAL, 
	host_is_superhost BOOLEAN, 
	host_thumbnail_url VARCHAR, 
	host_picture_url VARCHAR, 
	host_neighbourhood VARCHAR, 
	host_listings_count DECIMAL, 
	host_total_listings_count DECIMAL, 
	host_verifications VARCHAR, 
	host_has_profile_pic BOOLEAN, 
	host_identity_verified BOOLEAN, 
	street VARCHAR, 
	neighbourhood VARCHAR, 
	neighbourhood_cleansed VARCHAR, 
	neighbourhood_group_cleansed VARCHAR, 
	city VARCHAR, 
	state VARCHAR, 
	zipcode VARCHAR, 
	market VARCHAR, 
	smart_location VARCHAR, 
	country_code VARCHAR, 
	country VARCHAR, 
	latitude DECIMAL, 
	longitude DECIMAL, 
	is_location_exact BOOLEAN, 
	property_type VARCHAR, 
	room_type VARCHAR, 
	accommodates DECIMAL, 
	bathrooms DECIMAL, 
	bedrooms DECIMAL, 
	beds DECIMAL, 
	bed_type VARCHAR, 
	amenities VARCHAR, 
	square_feet DECIMAL, 
	price DECIMAL, 
	weekly_price DECIMAL, 
	monthly_price DECIMAL, 
	security_deposit DECIMAL, 
	cleaning_fee DECIMAL, 
	guests_included DECIMAL, 
	extra_people DECIMAL, 
	minimum_nights DECIMAL, 
	maximum_nights DECIMAL, 
	minimum_minimum_nights DECIMAL, 
	maximum_minimum_nights DECIMAL, 
	minimum_maximum_nights DECIMAL, 
	maximum_maximum_nights DECIMAL, 
	minimum_nights_avg_ntm DECIMAL, 
	maximum_nights_avg_ntm DECIMAL, 
	calendar_updated VARCHAR, 
	has_availability BOOLEAN, 
	availability_30 DECIMAL, 
	availability_60 DECIMAL, 
	availability_90 DECIMAL, 
	availability_365 DECIMAL, 
	calendar_last_scraped DATE, 
	number_of_reviews DECIMAL, 
	number_of_reviews_ltm DECIMAL, 
	first_review DATE, 
	last_review DATE, 
	review_scores_rating DECIMAL, 
	review_scores_accuracy DECIMAL, 
	review_scores_cleanliness DECIMAL, 
	review_scores_checkin DECIMAL, 
	review_scores_communication DECIMAL, 
	review_scores_location DECIMAL, 
	review_scores_value DECIMAL, 
	requires_license BOOLEAN, 
	license VARCHAR, 
	jurisdiction_names VARCHAR, 
	instant_bookable BOOLEAN, 
	is_business_travel_ready BOOLEAN, 
	cancellation_policy VARCHAR, 
	require_guest_profile_picture BOOLEAN, 
	require_guest_phone_verification BOOLEAN, 
	calculated_host_listings_count DECIMAL, 
	calculated_host_listings_count_entire_homes DECIMAL, 
	calculated_host_listings_count_private_rooms DECIMAL, 
	calculated_host_listings_count_shared_rooms DECIMAL, 
	reviews_per_month DECIMAL
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

CREATE TABLE reviews (
	listing_id DECIMAL NOT NULL REFERENCES listings(id), 
	id DECIMAL primary key, 
	date DATE NOT NULL, 
	reviewer_id DECIMAL NOT NULL, 
	reviewer_name VARCHAR, 
	comments VARCHAR
);

CREATE TABLE calendar (
	listing_id DECIMAL NOT NULL REFERENCES listings(id), 
	date DATE NOT NULL, 
	available BOOLEAN NOT NULL, 
	price DECIMAL NOT NULL, 
	adjusted_price DECIMAL NOT NULL, 
	minimum_nights DECIMAL, 
	maximum_nights DECIMAL,
    Primary Key(listing_id, date)
);

CREATE INDEX reviews_listing_id ON reviews using HASH(listing_id);

CREATE INDEX calendar_listing_id ON calendar using HASH(listing_id);

CREATE INDEX reviews_date ON reviews using BTREE(date);

CREATE INDEX calendar_date ON calendar using BTREE(date);


