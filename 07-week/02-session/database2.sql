-- DDL Definition Data Language

-- DELETE database id exists
DROP DATABASE IF EXISTS ubication_db;

-- Crate database
CREATE DATABASE IF NOT EXISTS ubication_db;

-- USER DATABASE
use ubication_db;

CREATE TABLE IF NOT EXISTS continent(
    id INT AUTO_INCREMENT PRIMARY KEY,
    code VARCHAR(5) NOT NULL,
    name VARCHAR(50) NOT NULL,
    description TEXT DEFAULT NULL,
    status BOOLEAN NOT NULL DEFAULT 1,
    created_at DATETIME NOT NULL DEFAULT NOW(),
    updated_at DATETIME NOT NULL DEFAULT NOW(),
    deleted_at DATETIME DEFAULT NULL
);

CREATE TABLE IF NOT EXISTS country(
    id INT AUTO_INCREMENT PRIMARY KEY,
    code VARCHAR(5) NOT NULL,
    name VARCHAR(50) NOT NULL,
    description TEXT,
    continent_id INT NOT NULL,
    status BOOLEAN NOT NULL DEFAULT 1,
    created_at DATETIME NOT NULL DEFAULT NOW(),
    updated_at DATETIME NOT NULL DEFAULT NOW(),
    deleted_at DATETIME DEFAULT NULL,
    constraint fk_country_continent_id_continent_id foreign key (continent_id) references continent(id)
);

-- DML Data Manipulation Language
-- Insert data

INSERT INTO continent(code, name, description) VALUES('AF', 'Africa', 'The second largest continent in the world, after Asia, covering approximately 30,370,000 square kilometers.');
INSERT INTO continent(code, name, description) VALUES('AS', 'Asia', 'The largest continent in the world, covering approximately 44,579,000 square kilometers.');
INSERT INTO continent(code, name, description) VALUES('EU', 'Europe', 'The second smallest continent in the world, covering approximately 10,180,000 square kilometers.');
INSERT INTO continent(id, code, name, description) VALUES(5,'NA', 'North America', 'The third largest continent in the world, covering approximately 24,709,000 square kilometers.');

INSERT INTO country(code, name, description, continent_id) VALUES('DZ', 'Algeria', 'Algeria is the largest country in Africa and the 10th largest in the world.', 1);
INSERT INTO country(code, name, description, continent_id) VALUES('AO', 'Angola', 'Angola is the seventh largest country in Africa.', 1);
INSERT INTO country(code, name, description, continent_id) VALUES('BJ', 'Benin', 'Benin is a country in West Africa.', 1);
INSERT INTO country(code, name, description, continent_id) VALUES('BW', 'Botswana', 'Botswana is a landlocked country in Southern Africa.', 1);
INSERT INTO country(code, name, description, continent_id) VALUES('BF', 'Burkina Faso', 'Burkina Faso is a landlocked country in West Africa.', 5);
INSERT INTO country(code, name, description, continent_id) VALUES('BI', 'Burundi', 'Burundi is a landlocked country in the African Great Lakes region of East Africa.', 3);
INSERT INTO country(code, name, description, continent_id) VALUES('CM', 'Cameroon', 'Cameroon is a country in Central Africa.', 2);
INSERT INTO country(code, name, description, continent_id) VALUES('CV', 'Cape Verde', 'Cape Verde is an island country spanning an archipelago of 10 volcanic islands in the central Atlantic Ocean.', 3);
INSERT INTO country(code, name, description, continent_id) VALUES('CF', 'Central African Republic', 'The Central African Republic is a landlocked country in Central Africa.', 2);