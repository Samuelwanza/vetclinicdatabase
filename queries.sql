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

SELECT * FROM animals JOIN owners ON animals.owner_id=owners.id WHERE owners.full_name='Melody Pond';
SELECT * FROM animals JOIN species ON animals.species_id=species.id WHERE species.name='Pokemon';
SELECT * FROM owners LEFT JOIN animals ON owners.id = animals.owner_id;
SELECT species.name,COUNT(*) FROM animals JOIN species ON animals.species_id=species.id GROUP BY species.name;
SELECT * from animals JOIN species ON animals.species_id=species.id JOIN owners ON animals.owner_id=owners.id WHERE owners.full_name='Jennifer Orwell' AND species.name='Digimon';
SELECT * from animals JOIN owners ON animals.owner_id=owners.id WHERE owners.full_name='Dean Winchester' AND animals.escape_attempts=0;
SELECT owners.full_name, COUNT(*) AS total_animals FROM animals JOIN owners ON animals.owner_id=owners.id GROUP BY owners.full_name ORDER BY total_animals DESC LIMIT 1;

SELECT animals.name AS animal_name,vets.name AS vet_name,visits.date_of_visit FROM animals JOIN visits ON animals.id=visits.animals_id JOIN vets ON visits.vet_id=vets.id WHERE vets.name='William Tatcher' ORDER BY visits.date_of_visit DESC LIMIT 1;
SELECT animals.name AS animal_name,COUNT(animals.name) AS number_visits,vets.name AS vet_name from animals JOIN visits ON animals.id=visits.animals_id JOIN vets ON visits.vet_id=vets.id WHERE vets.name='Stephanie Mendez' GROUP BY animals.name,vets.name;
SELECT * FROM vets LEFT JOIN specializations ON vets.id=specializations.vet_id LEFT JOIN species ON specializations.species_id=species.id;
SELECT animals.name AS animal_name,vets.name AS vet_name, visits.date_of_visit from animals JOIN visits ON visits.animals_id=animals.id JOIN vets ON visits.vet_id=vets.id WHERE visits.date_of_visit BETWEEN '2020-04-01' AND '2020-08-30' AND vets.name='Stephanie Mendez';
SELECT animals.name AS animal_name,COUNT(animals.name) AS number_visits from animals JOIN visits ON animals.id=visits.animals_id GROUP BY animals.name;
SELECT animals.name AS animal_name,visits.date_of_visit FROM animals JOIN visits ON animals.id=visits.animals_id JOIN vets ON visits.vet_id=vets.id WHERE vets.name='Maisy Smith' ORDER BY visits.date_of_visit ASC LIMIT 1;
SELECT * FROM animals JOIN visits ON animals.id=visits.animals_id JOIN vets ON visits.vet_id=vets.id ORDER BY visits.date_of_visit DESC LIMIT 1;
SELECT COUNT(animals.name) As number_visits FROM animals FULL JOIN visits ON animals.id=visits.animals_id FULL JOIN vets ON visits.vet_id=vets.id FULL JOIN specializations ON vets.id=specializations.vet_id FULL JOIN species ON specializations.species_id=species.id WHERE specializations.species_id IS NULL;
SELECT species.name AS speciality_name,COUNT(animals.species_id) As number_visits FROM animals FULL JOIN species ON animals.species_id=species.id FULL JOIN visits ON animals.id=visits.animals_id FULL JOIN vets ON visits.vet_id=vets.id FULL JOIN specializations ON vets.id=specializations.vet_id  WHERE specializations.species_id IS NULL AND vets.name='Maisy Smith' GROUP BY speciality_name ORDER BY number_visits DESC LIMIT 1;

