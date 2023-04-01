CREATE TABLE schools
(school_name VARCHAR(100) PRIMARY KEY,
borough VARCHAR(100),
building_code VARCHAR(10),
average_math INT,
average_reading INT,
average_writing INT,
percent_tested FLOAT);

-- Import data through the table data import wizard


-- Ensure data was imported correctly
SELECT * 
FROM schools; 


-- Count rows with percent_tested missing and total number of schools

SELECT COUNT(*) - COUNT(percent_tested) as num_tested_missing, COUNT(*) as num_schools
FROM schools;



-- Count the number of unique building_code values

SELECT COUNT(Distinct(building_code)) AS num_school_buildings 
FROM schools 


-- Average math test score

SELECT school_name, average_math
FROM schools 
WHERE average_math >= 640 
ORDER BY average_math desc;



-- Find lowest average_reading

SELECT MIN(average_reading) AS lowest_reading
FROM schools;


-- Sort by average_sat

SELECT school_name, SUM(average_math + average_reading + average_writing) AS average_sat
FROM schools 
GROUP BY school_name 
ORDER BY average_sat desc;


-- Organize results by borough

SELECT borough, Count(*) AS num_schools, SUM(average_math + average_reading + average_writing)/Count(*) AS average_borough_sat
FROM schools 
GROUP BY borough
ORDER BY average_borough_sat DESC;


-- Display results from highest average_math

SELECT school_name, average_math 
FROM schools 
WHERE borough = 'Brooklyn'
GROUP BY school_name 
ORDER BY average_math DESC
Limit 5;
