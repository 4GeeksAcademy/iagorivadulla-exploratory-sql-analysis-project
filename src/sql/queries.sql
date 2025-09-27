-- PLEASE READ THIS BEFORE RUNNING THE EXERCISE

-- ⚠️ IMPORTANT: This SQL file may crash due to two common issues: comments and missing semicolons.

-- ✅ Suggestions:
-- 1) Always end each SQL query with a semicolon `;`
-- 2) Ensure comments are well-formed:
--    - Use `--` for single-line comments only
--    - Avoid inline comments after queries
--    - Do not use `/* */` multi-line comments, as they may break execution

-- -----------------------------------------------
-- queries.sql
-- Complete each mission by writing your SQL query
-- directly below the corresponding instruction
-- -----------------------------------------------

SELECT * FROM regions;
SELECT * FROM species;
SELECT * FROM climate;
SELECT * FROM observations;

SELECT * FROM observations LIMIT 10;
SELECT DISTINCT region_id FROM observations;
SELECT COUNT(DISTINCT species_id) FROM observations;
SELECT COUNT(*) FROM observations WHERE region_id == 2;
SELECT COUNT(*) FROM observations WHERE observation_date == '1998-08-08';

SELECT region_id, COUNT(*) AS num FROM observations GROUP BY region_id ORDER BY num DESC LIMIT 1;
SELECT species_id, COUNT(*) AS count FROM observations GROUP BY species_id ORDER BY count DESC LIMIT 5;
SELECT species_id, COUNT(*) AS few FROM observations GROUP BY species_id HAVING few < 5 ORDER BY few ASC;
SELECT observer, COUNT(*) AS obs FROM observations GROUP BY observer ORDER BY obs DESC LIMIT 1;

SELECT regions.name FROM observations JOIN regions ON observations.region_id == regions.id;
SELECT species.scientific_name FROM species JOIN observations ON species.id == observations.species_id;

SELECT regions.name AS region, species.scientific_name, COUNT(*) AS specie 
FROM observations JOIN species ON observations.species_id == species.id 
JOIN regions ON observations.region_id = regions.id 
GROUP BY region, species.scientific_name ORDER BY specie DESC;

INSERT INTO observations VALUES(501, 888, 6, 'obsr231421412', '2025-09-27', -21.1323, 130.2345, 1 );

--SELECT scientific_name FROM species WHERE scientific_name ;
--No se como buscar en la base de datos que nombre cientifico esta mal escrito

DELETE FROM observations WHERE id == 501;
