/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Agumon', '2020-02-03', 10.23, true, 0);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Gabumon', '2018-11-15', 8, true, 2);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Pikachu', '2021-01-07', 15.04, false, 1);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Devimon', '2017-05-12', 11, true, 5);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Charmander', '2020-02-08', -11, false, 0);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Plantmon', '2022-11-15', -5.7, true, 2);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Squirtle', '1993-04-02', -12.13, false, 3);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Angemon', '2005-06-12', -45, true, 1);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Boarmon', '2005-06-07', 20.4, true, 7);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Blossom', '1998-10-13', 17, true, 3);

INSERT INTO owners (full_name, age) 
VALUES('Sam Smith', 34),
    ('Jennifer Orwell', 19),
    ('Bob', 45),
    ('Melody Pond', 77),
    ('Dean Winchester', 14),
    ('Jodie Whittaker', 38);

INSERT INTO species (name) 
VALUES('Pokemon'), ('Digimon');

UPDATE animals
SET species_id = (SELECT id FROM species WHERE name = 'Digimon')
WHERE name LIKE '%mon';

UPDATE animals
SET species_id = (SELECT id FROM species WHERE name = 'Pokemon')
WHERE species_id IS NULL;

UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Sam Smith') 
WHERE name = 'Agumon'

UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell') 
WHERE name IN ('Gabumon', 'Pikachu');

UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Bob') 
WHERE name IN ('Devimon', 'Plantmon');

UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond') 
WHERE name IN ('Charmander', 'Squirtle', 'Blossom');

UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester')
WHERE name IN ('Angemon', 'Boarmon');

INSERT INTO vets (name, age, date_of_graduation)
  VALUES ('William Tatcher', 45, '2020-04-23'),
      ('Maisy Smith', 26, '2019-01-17'),
      ('Stephanie Mendez', 64, '1981-05-04'),
      ('Jack Harkness', 38, '2008-06-08');

INSERT INTO specializations (vet_id, species_id)
VALUES (1, 1),
    (3, 2),
    (3, 1),
    (4, 2);

INSERT INTO visits (vet_id, animal_id, date)
VALUES (1, 1, '2020-05-24'),
       (3, 1, '2020-07-22'),
       (4, 2, '2021-02-02'),
       (2, 3, '2020-01-05'),
       (2, 3, '2020-03-08'),
       (2, 3, '2020-05-14'),
       (3, 4, '2021-05-04'),
       (4, 5, '2021-02-24'),
       (2, 11, '2019-12-21'),
       (1, 11, '2020-08-10'),
       (2, 11, '2021-04-7'),
       (3, 7, '2019-09-29'),
       (4, 8, '2020-10-03'),
       (4, 8, '2020-11-04'),
       (2, 9, '2019-01-24'),
       (2, 9, '2019-05-15'),
       (2, 9, '2020-02-27'),
       (2, 9, '2020-08-03'),
       (3, 10, '2020-05-24'),
       (1, 10, '2021-01-11');