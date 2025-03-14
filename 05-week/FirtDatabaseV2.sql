-- Comandos DDL
-- DDL (Data Definition Language) es un subconjunto del lenguaje SQL que se utiliza para definir y gestionar estructuras de datos, como bases de datos, tablas, índices, y vistas. Los comandos DDL más comunes incluyen:
-- CREATE: para crear bases de datos y objetos como tablas, vistas, e índices.
-- ALTER: para modificar la estructura de una base de datos o de sus objetos.
-- DROP: para eliminar bases de datos y objetos.
-- TRUNCATE: para eliminar todos los registros de una tabla, pero manteniendo su estructura.
-- COMMENT: para agregar comentarios a los objetos de la base de datos.
-- RENAME: para renombrar objetos de la base de datos.Comandos DDL
/****************************************
 *** Documentación tipos de datos ********
 *****************************************/
-- Tipos de datos en MySQL y su uso recomendado
-- | Tipo de Dato | Descripción |
-- |--------------|-------------|
-- | INT | Entero. Se utiliza para almacenar números enteros. |
-- | VARCHAR(n) | Cadena de texto variable. Se utiliza para almacenar texto de longitud variable, donde 'n' es el máximo número de caracteres. |
-- | TEXT | Cadena de texto larga. Se utiliza para almacenar grandes cantidades de texto. |
-- | BOOLEAN | Valor booleano. Se utiliza para almacenar valores de verdadero (true) o falso (false). |
-- | DATE | Fecha. Se utiliza para almacenar fechas en el formato 'YYYY-MM-DD'. |
-- | DATETIME | Fecha y hora. Se utiliza para almacenar fechas y horas en el formato 'YYYY-MM-DD HH:MM:SS'. |
-- | DECIMAL(m, d) | Número decimal. Se utiliza para almacenar números con decimales, donde 'm' es el total de dígitos y 'd' es el número de dígitos después del punto decimal. |
-- | FLOAT | Número de punto flotante. Se utiliza para almacenar números con decimales de precisión simple. |
-- | DOUBLE | Número de punto flotante de doble precisión. Se utiliza para almacenar números con decimales de precisión doble. |
-- | CHAR(n) | Cadena de texto de longitud fija. Se utiliza para almacenar texto de longitud fija, donde 'n' es el número de caracteres. |
-- | BLOB | Binary Large Object. Se utiliza para almacenar grandes cantidades de datos binarios, como imágenes o archivos. |
-- | ENUM | Enumeración. Se utiliza para almacenar un conjunto de valores predefinidos. |
-- | SET | Conjunto. Se utiliza para almacenar uno o más valores de un conjunto predefinido. |
/**********************************************
 *** Final Documentación tipos de datos ********
 ***********************************************/
-- Crate database by ubication
-- Elinar la base de datos si existe
DROP DATABASE IF EXISTS ubication;

-- Crear base de datos
CREATE DATABASE ubication;

-- Usar base de datos
USE ubication;

-- Entity Continent
CREATE TABLE continent(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    description TEXT NULL,
    status BOOLEAN DEFAULT true
);

-- Entity Country
CREATE TABLE country(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    description TEXT NULL,
    status BOOLEAN DEFAULT true,
    continent_id INT NOT NULL
);

-- Entity State
CREATE TABLE state(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    description TEXT NULL,
    status BOOLEAN DEFAULT true,
    country_id INT NOT NULL
);

-- Entity City
CREATE TABLE city(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    description TEXT NULL,
    status BOOLEAN DEFAULT true,
    state_id INT NOT NULL
);

-- Comandos DML
-- DML (Data Manipulation Language) es un subconjunto del lenguaje SQL que se utiliza para manipular datos en las bases de datos. Los comandos DML más comunes incluyen:
-- SELECT: para consultar datos de una o más tablas.
-- INSERT: para agregar nuevos registros a una tabla.
-- UPDATE: para modificar registros existentes en una tabla.
-- DELETE: para eliminar registros de una tabla.

-- Insert data

-- Insert data into continent
INSERT INTO continent(name, description)VALUES('America', 'Continent of America');
INSERT INTO continent(name)VALUES('Europe');
INSERT INTO continent(name, description, status)VALUES('Asia', 'Continent of Asia', false);
INSERT INTO continent(id, name, description, status)VALUES(200, 'Africa', 'Continent of Africa', true);

-- Insert data into country
INSERT INTO country(name, description, continent_id)VALUES('Colombia', 'Country of Colombia',200);
INSERT INTO country(name, continent_id)VALUES('Peru', 3);
INSERT INTO country(name, description, status, continent_id)VALUES('Brazil', 'Country of Brazil', false,3);
INSERT INTO country(id, name, description, status, continent_id)VALUES(200, 'Argentina', 'Country of Argentina', true, 200);

-- Consult data
SELECT * FROM continent;
SELECT * FROM country;


-- Query
SELECT 
	 c.name as Continent,
     c2.name as Country
FROM 
	continent c
    INNER JOIN country c2 ON c.id = c2.continent_id;

