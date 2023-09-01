/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name like '%mon';
SELECT name from animals WHERE EXTRACT (YEAR FROM date_of_birth) BETWEEN 2016 AND 2019;
SELECT name from animals WHERE neutered=TRUE AND escape_attempts<3;
SELECT date_of_birth from animals WHERE name='Agumon' OR name='Pikachu';
SELECT name,escape_attempts FROM animals WHERE weight_kg>10.5;
SELECT * from animals WHERE neutered=TRUE;
SELECT * FROM animals WHERE name NOT IN ('Gabumon');
SELECT * FROM animals WHERE weight_kg>= 10.4 AND weight_kg<=17.3;

BEGIN;
UPDATE animals SET species='unspecified';
SELECT * from animals;
ROLLBACK;
SELECT * from animals;


BEGIN;
UPDATE animals SET species='digimon' WHERE name LIKE '%mon';
UPDATE animals SET species='pokemon' WHERE species IS NULL;
SELECT * FROM animals;
COMMIT;
SELECT * FROM animals

BEGIN;
DELETE FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals WHERE date_of_birth>'2022-01-01';
SAVEPOINT SP1;
UPDATE animals set weight_kg=weight_kg*-1;
ROLLBACK TO SP1;
UPDATE animals SET weight_kg=weight_kg*-1 WHERE weight_kg<0;
COMMIT;

SELECT COUNT(*) from animals;
SELECT COUNT(*) from animals where escape_attempts=0;
SELECT AVG(weight_kg) from animals;
SELECT neutered,SUM(escape_attempts) AS total_escape_attempts from animals GROUP BY neutered ORDER BY total_escape_attempts DESC LIMIT 1;
SELECT MIN(weight_kg),MAX(weight_kg) from animals;
SELECT AVG(escape_attempts) from animals WHERE EXTRACT(YEAR FROM date_of_birth) BETWEEN 1990 AND 2000;



