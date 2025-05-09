DROP DATABASE IF EXISTS test;
CREATE DATABASE test;
USE test;

CREATE TABLE person (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    address VARCHAR(50)
);

CREATE TABLE rol (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL UNIQUE,
    estatus bool
);

CREATE TABLE user_rol (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL UNIQUE,
    rol_id INT,
    FOREIGN KEY (user_id) REFERENCES person(id),
    FOREIGN KEY (rol_id) REFERENCES rol(id)
);

-- DML 
INSERT INTO person (name, address) VALUES
('Juan', 'Calle 1'),
('Pedro', 'Calle 2'),
('Maria', 'Calle 3'),
('Jose', 'Calle 4'),
('Ana', 'Calle 5'),
('Luis', 'Calle 6'),
('Carlos', 'Calle 7'),
('Laura', 'Calle 8'),
('Javier', 'Calle 9'),
('Sofia', 'Calle 10');

INSERT INTO rol (name) VALUES
('Admin'),
('User'),
('Guest'),
('Super Admin'),
('Super User'),
('Super Guest'),
('Super Admin 2'),
('Super User 2'),
('Super Guest 2'),
('Super Admin 3');

INSERT INTO user_rol (user_id, rol_id) VALUES
(1, 3),
(2, 1),
(3, 1),
(6, 7),
(9, 4);


SELECT * FROM person;
SELECT * FROM rol; 
SELECT * FROM user_rol;


-- Nombre de la persona y el rol que tiene
SELECT 
    p.name person,
    r.name rol 
FROM 
    person p
    INNER JOIN user_rol ur ON p.id = ur.user_id
    INNER JOIN rol r ON ur.rol_id = r.id;

SELECT 
    p.name person,
    r.name rol 
FROM 
    rol r
    INNER JOIN user_rol ur ON r.id = ur.rol_id
    INNER JOIN person p ON ur.user_id = p.id;


-- Mostrar todas las personas e indicar si tiene rol o no
SELECT 
    p.name person,
    r.name rol 
FROM
    person p
    LEFT JOIN user_rol ur ON p.id = ur.user_id
    LEFT JOIN rol r ON ur.rol_id = r.id;


SELECT 
    p.name person,
    r.name rol 
FROM
    rol r
    RIGHT JOIN user_rol ur ON r.id = ur.rol_id
    RIGHT JOIN person p ON ur.user_id = p.id;

-- Mostrar los roles que no se usan
SELECT 
    r.name rol
FROM
    person p
    RIGHT JOIN user_rol ur ON p.id = ur.user_id
    RIGHT JOIN rol r ON ur.rol_id = r.id
WHERE ur.rol_id IS NULL;

SELECT 
    r.name rol
FROM
    rol r
    LEFT JOIN user_rol ur ON r.id = ur.rol_id
    LEFT JOIN person p ON ur.user_id = p.id
WHERE ur.rol_id IS NULL;

-- Mostrar los personas que no se les ha asignado un rol
SELECT 
    p.name person
FROM
    person p
    LEFT JOIN user_rol ur ON p.id = ur.user_id
    LEFT JOIN rol r ON ur.rol_id = r.id
WHERE ur.user_id IS NULL;


SELECT 
    p.name person
FROM
    rol r
    RIGHT JOIN user_rol ur ON r.id = ur.rol_id
    RIGHT JOIN person p ON ur.user_id = p.id
WHERE ur.user_id IS NULL;


-- update sincrono
-- Inhabilitar todos los roles que no se usen
UPDATE rol rr
SET rr.estatus = 0
WHERE rr.id IN(
	SELECT 
		r.id
	FROM
		person p
		RIGHT JOIN user_rol ur ON p.id = ur.user_id
		RIGHT JOIN rol r ON ur.rol_id = r.id
	WHERE ur.rol_id IS NULL
);


-- update sincrono
-- habilitar todos los roles que estan en uso
UPDATE rol rr
SET rr.estatus = 1
WHERE rr.id IN(
	SELECT 
		r.id
	FROM
		person p
		RIGHT JOIN user_rol ur ON p.id = ur.user_id
		RIGHT JOIN rol r ON ur.rol_id = r.id
	WHERE ur.rol_id IS NOT NULL
);