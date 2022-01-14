/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-12';
SELECT name FROM animals WHERE neutered = true and escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN;
UPDATE animals SET species='digimon' WHERE name LIKE '%mon';
UPDATE animals SET species='pokemon' WHERE species IS NULL;
COMMIT;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT SP1;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO SP1;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;

SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;

SELECT neutered, SUM(escape_attempts) as most_escape_attempts 
FROM animals
GROUP BY neutered;

SELECT species, MIN(weight_kg), MAX(weight_kg)
FROM animals
GROUP BY species;

SELECT species, AVG(escape_attempts)
FROM animals
WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-12'
GROUP BY species;

SELECT name FROM animals JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Melody Pond';

SELECT A.name FROM animals A
INNER JOIN species S
ON A.species_id = S.id WHERE S.name = 'Pokemon';

SELECT full_name as owners, name as animals FROM owners
LEFT JOIN animals ON owners.id = animals.owner_id;

SELECT S.name as specie, COUNT(*) FROM animals JOIN species S ON animals.species_id = S.id GROUP BY S.name;

SELECT A.name as Digimon from animals A
JOIN owners O ON A.owner_id = O.id
WHERE O.full_name = 'Jennifer Orwell' AND A.species_id = (SELECT id FROM species WHERE name = 'Digimon');

SELECT name as animal_not_attempted_escape, full_name as owner FROM animals
JOIN owners ON animals.owner_id = owners.id
WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0;

SELECT O.full_name as owner, COUNT(A) as animals_count 
FROM owners O 
LEFT JOIN animals A ON O.id = A.owner_id 
GROUP BY O.full_name;

SELECT A.name FROM visits V 
JOIN animals A ON A.id = V.animal_id 
WHERE vet_id = (SELECT id FROM vets WHERE name = 'William Tatcher') 
ORDER BY date DESC LIMIT 1;

SELECT COUNT(*) FROM visits 
WHERE vet_id = (SELECT id FROM vets WHERE name = 'Stephanie Mendez');

SELECT V.name as vet, species.name as specialty FROM vets V
LEFT JOIN specializations S ON V.id = S.vet_id 
LEFT JOIN species ON S.species_id = species.id;

SELECT name FROM animals 
JOIN visits ON visits.animal_id = animals.id 
WHERE visits.date BETWEEN '2020-01-01' AND '2020-08-30' 
AND visits.vet_id = (SELECT id FROM vets WHERE name ='Stephanie Mendez');

