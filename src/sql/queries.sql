SELECT * FROM regions;
SELECT * FROM species;
SELECT * FROM climate;
SELECT * FROM observations;

-- First 10 observations;
SELECT * FROM observations LIMIT 10;
--Unique region id;
SELECT DISTINCT region_id FROM observations;
--How many distinct species;
SELECT COUNT(DISTINCT species_id) FROM observations;
--Observations in region id 2;
SELECT COUNT(*) FROM observations WHERE region_id == 2;
--How many observations in 1198;
SELECT COUNT(*) FROM observations WHERE observation_date == '1998-08-08';


--Region id with most observations;
SELECT region_id, COUNT(*) AS num FROM observations GROUP BY region_id ORDER BY num DESC LIMIT 1;
--Most 5 frequent species id;
SELECT species_id, COUNT(*) AS count FROM observations GROUP BY species_id ORDER BY count DESC LIMIT 5;
--Species id with less 5 records;
SELECT species_id, COUNT(*) AS few FROM observations GROUP BY species_id HAVING few < 5 ORDER BY few ASC;
--Observer with most records;
SELECT observer, COUNT(*) AS obs FROM observations GROUP BY observer ORDER BY obs DESC LIMIT 1;


--Regions name for each observation;
SELECT name FROM regions JOIN observations ON observations.region_id == regions.id;
--Scientific name of each recorded specie;
SELECT scientific_name FROM species JOIN observations ON species.id == observations.species_id;
--Most observed species in each region;
SELECT regions.name AS region, species.scientific_name, COUNT(*) AS specie 
FROM observations JOIN species ON observations.species_id == species.id 
JOIN regions ON observations.region_id = regions.id 
GROUP BY region, species.scientific_name 
HAVING COUNT(*) = (
    SELECT MAX(cnt)
    FROM(
        SELECT COUNT(*) AS cnt
        FROM observations
        WHERE observations.region_id = regions.id
        GROUP BY observations.species_id
    )
)
ORDER BY region;



--Insert new fictious observation;
INSERT INTO observations VALUES(501, 888, 6, 'obsr231421412', '2025-09-27', -21.1323, 130.2345, 1 );

--SELECT scientific_name FROM species WHERE scientific_name ;
--No se como buscar en la base de datos que nombre cientifico esta mal escrito;

--Delete the test observation;
DELETE FROM observations WHERE id == 501;
