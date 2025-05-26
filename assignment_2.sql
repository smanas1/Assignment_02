-- Active: 1747565305980@@127.0.0.1@5432@conservation_db

-- Create a new database
CREATE DATABASE conservation_db;

-- Creating Rangers Table
CREATE TABLE rangers (
    ranger_id SERIAL PRIMARY KEY ,
    name VARCHAR(50) NOT NULL,
    region VARCHAR(100) NOT NULL
);
-- Inserting rangers data
INSERT INTO rangers (name, region) VALUES
('Alice Green', 'Northern Hills'),
('Bob White', 'River Delta'),
('Carol King', 'Mountain Range');


-- Creating Species Table
CREATE TABLE species(
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(100) NOT NULL UNIQUE,
    scientific_name VARCHAR(100) NOT NULL UNIQUE,
    discovery_date DATE NOT NULL,
    conservation_status VARCHAR(50) NOT NULL
);
-- Inserting Species data 
INSERT INTO species (common_name, scientific_name, discovery_date, conservation_status) VALUES
('Snow Leopard', 'Panthera uncia', '1775-01-01', 'Endangered'),
('Bengal Tiger', 'Panthera tigris tigris', '1758-01-01', 'Endangered'),
('Red Panda', 'Ailurus fulgens', '1825-01-01', 'Vulnerable'),
('Asiatic Elephant', 'Elephas maximus indicus', '1758-01-01', 'Endangered');


-- Creating Sightings Table
CREATE TABLE sightings (
    sighting_id SERIAL PRIMARY KEY,
    species_id INT REFERENCES species(species_id),
    ranger_id INT REFERENCES rangers(ranger_id),
    location VARCHAR(100) NOT NULL,
    sighting_time TIMESTAMP without TIME zone,
    notes TEXT
)
-- Inserting Sightings data

INSERT INTO sightings (species_id, ranger_id, location, sighting_time, notes) VALUES
(1, 1, 'Peak Ridge', '2024-05-10 07:45:00', 'Camera trap image captured'),
(2, 2, 'Bankwood Area', '2024-05-12 16:20:00', 'Juvenile seen'),
(3, 3, 'Bamboo Grove East', '2024-05-15 09:10:00', 'Feeding observed'),
(1, 2, 'Snowfall Pass', '2024-05-18 18:30:00', NULL);


-- Problem 1
INSERT INTO rangers(name,region) VALUES
('Derek Fox','Coastal Plains');

-- Problem 2
SELECT COUNT(DISTINCT species_id) as unique_species_count FROM sightings
    
-- Problem 3
SELECT * FROM sightings 
    WHERE location LIKE '%Pass%';

-- Problem 4
SELECT name, count(*) as total_sightings FROM rangers
   RIGHT JOIN sightings USING(ranger_id)
    GROUP BY name
    ORDER BY name

-- Problem 5
SELECT common_name FROM sightings
   RIGHT JOIN species USING(species_id)
    WHERE sighting_id is NULL;
  
-- Problem 6
SELECT common_name,sighting_time,name FROM sightings
    JOIN rangers USING(ranger_id)
    JOIN species USING(species_id)
    ORDER BY sighting_time DESC
    LIMIT 2;
    
-- Problem 7

UPDATE species
SET conservation_status = 'Historic'
WHERE EXTRACT(YEAR FROM discovery_date) < 1800;

-- Problem 8
SELECT sighting_id,
    CASE 
        WHEN EXTRACT(HOUR FROM sighting_time) < 12 THEN 'Morning'
        WHEN EXTRACT(HOUR FROM sighting_time) >= 12 AND EXTRACT(HOUR FROM sighting_time) < 17 THEN 'Afternoon'
        ELSE 'Evening'
    END as time_of_day
    FROM sightings;


-- Problem 9
DELETE FROM rangers
WHERE ranger_id NOT IN (SELECT DISTINCT ranger_id FROM sightings);