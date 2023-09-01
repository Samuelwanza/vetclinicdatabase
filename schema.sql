/* Database schema to keep the structure of entire database. */

CREATE TABLE animals(
    id INT NOT NULL PRIMARY KEY,
    name VARCHAR(255),
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL
);

ALTER TABLE animals ADD COLUMN species VARCHAR(255);
ALTER TABLE animals ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY;
