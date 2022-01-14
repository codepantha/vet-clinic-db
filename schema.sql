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

CREATE TABLE vets (
    ID INT UNIQUE GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(255),
    age INT,
    date_of_graduation DATE
);

CREATE TABLE specializations (
   vet_id INT REFERENCES vets(id),
   species_id INT REFERENCES species(id),
   PRIMARY KEY (vet_id, species_id)
);

-- make the id column in animals unique
ALTER TABLE animals ADD CONSTRAINT id UNIQUE(id);

CREATE TABLE visits (
    vet_id INT NOT NULL,
    animal_id INT NOT NULL,
    date DATE,
    FOREIGN KEY (vet_id) REFERENCES vets(id),
    FOREIGN KEY (animal_id) REFERENCES animals(id)
);
