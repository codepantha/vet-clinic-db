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