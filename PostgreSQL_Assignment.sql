


CREATE TABLE rangers (
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    region VARCHAR(100)
);

CREATE TABLE species(
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(50),
    scientific_name VARCHAR(100),
    discovery_date DATE,
    conservation_status VARCHAR(50)
);

CREATE TABLE sightings (
    sighting_id SERIAL PRIMARY KEY,
    ranger_id INTEGER REFERENCES rangers(ranger_id),
    species_id INTEGER REFERENCES species(species_id),
    sighting_time TIMESTAMP,
    location VARCHAR(50),
    notes TEXT
);

-- Insert data into rangers and species first
INSERT INTO rangers(name, region) VALUES
('John Doe', 'Northern Region'),
('Jane Smith', 'Southern Region'),
('Alice Johnson', 'Eastern Region'),
('Bob Brown', 'Western Region'),
('Charlie White', 'Central Region');

INSERT INTO species(common_name, scientific_name, discovery_date, conservation_status) VALUES
('African Elephant', 'Loxodonta africana', '2000-01-01', 'Vulnerable'),
('Bengal Tiger', 'Panthera tigris tigris', '1998-05-15', 'Endangered'),
('Giant Panda', 'Ailuropoda melanoleuca', '1995-03-20', 'Vulnerable'),
('Snow Leopard', 'Panthera uncia', '2002-07-10', 'Endangered'),
('Green Sea Turtle', 'Chelonia mydas', '1690-11-30', 'Endangered'),
('Golden Langur', 'Trachypithecus geei', '1753-01-01', 'Endangered');

-- Now insert into sightings
INSERT INTO sightings(ranger_id, species_id, sighting_time, location, notes) VALUES
(1, 1, '2023-10-01 08:30:00', 'Serengeti National Park', 'Observed a herd of elephants grazing.'),
(2, 2, '2023-10-02 09:15:00', 'Sundarbans', 'Spotted a tiger resting near the river.'),
(3, 3, '2023-10-03 10:00:00', 'Wolong National Nature Reserve', 'Saw a panda climbing a tree.'),
(4, 4, '2023-10-04 11:45:00', 'Himalayan Mountains', 'Encountered a snow leopard in the wild.'),
(5, 5, '2023-10-05 12:30:00', 'Great Barrier pass', NULL);



-- problem 1:

INSERT INTO rangers(name, region) VALUES
('Derek Fox', 'Coastal Plains')

-- problem 2:

SELECT COUNT(DISTINCT species_id) AS unique_species_count
FROM sightings;


--problem 3:

SELECT * FROM sightings
WHERE location LIKE '%pass%';

-- problem 4:

SELECT name, COUNT(sighting_id) AS total_sightings
FROM rangers
LEFT JOIN sightings ON rangers.ranger_id = sightings.ranger_id
GROUP BY name;

--problem 5 :

SELECT common_name FROM species
LEFT JOIN sightings ON species.species_id = sightings.species_id
WHERE sightings.sighting_id IS NULL;


-- problem 6 :

SELECT  common_name, sighting_time, name FROM sightings
LEFT JOIN species ON sightings.species_id = species.species_id
LEFT JOIN rangers ON sightings.ranger_id = rangers.ranger_id
ORDER BY sightings.sighting_time DESC
LIMIT 2;



--problem 7 :

UPDATE species
SET conservation_status = 'Historic'
WHERE discovery_date < '1800-01-01';

--problem 8 :

SELECT 
  sighting_id,
  CASE
    WHEN EXTRACT(HOUR FROM sighting_time) < 12 THEN 'Morning'
    WHEN EXTRACT(HOUR FROM sighting_time) BETWEEN 12 AND 16 THEN 'Afternoon'
    ELSE 'Evening'
  END AS time_of_day
FROM sightings;


--problem 9 :

DELETE FROM ranger
WHERE ranger_id NOT IN (
  SELECT DISTINCT ranger_id FROM sightings
);

