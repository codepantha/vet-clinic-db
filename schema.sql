/* Database schema to keep the structure of entire database. */

create database vet_clinic;
CREATE TABLE animals(
	id INT GENERATED ALWAYS AS IDENTITY,
	name VARCHAR(50),
  	date_of_birth DATE,
  	escape_attempts INT,
  	neutered BOOLEAN,
  	weight_kg FLOAT
);

ALTER TABLE animals
ADD COLUMN species VARCHAR(100);

CREATE TABLE owners(
    id INT GENERATED ALWAYS AS IDENTITY,
    full_name VARCHAR(100), 
    age INT,
    PRIMARY KEY(id)
);

CREATE TABLE species(
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100),
    PRIMARY KEY(id)
);

ALTER TABLE animals 
DROP COLUMN species;

ALTER TABLE animals 
ADD COLUMN species_id INT;

ALTER TABLE animals
ADD FOREIGN KEY(species_id)
REFERENCES species(id);

ALTER TABLE animals
ADD COLUMN owner_id INT;

ALTER TABLE animals
ADD FOREIGN KEY(owner_id)
REFERENCES owners(id);

INSERT INTO owners (full_name, age) 
VALUES('Sam Smith', 34),
    ('Jennifer Orwell', 19),
    ('Bob', 45),
    ('Melody Pond', 77),
    ('Dean Winchester', 14),
    ('Jodie Whittaker', 38);

INSERT INTO species (name) 
VALUES('Pokemon'), ('Digimon');
