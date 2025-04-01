DROP DATABASE IF EXISTS pelicula;

CREATE DATABASE IF NOT EXISTS pelicula;

use pelicula;

CREATE TABLE produccion(
    id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(50) NOT NULL,
    tipo_produccion VARCHAR(50) NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_estreno_estimada DATE NOT NULL,
    genero BOOLEAN NOT NULL,
    presupuesto DECIMAL(10, 2) NOT NULL,
    estado VARCHAR(50) NOT NULL
);

CREATE TABLE persona(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    edad VARCHAR(5) NOT NULL,
    correo VARCHAR(50) NOT NULL,
    telefono VARCHAR(15) NOT NULL
);

CREATE TABLE rol(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    descripcion TEXT NOT NULL
);

CREATE table perona_rol(
    id INT PRIMARY KEY AUTO_INCREMENT,
    persona_id INT NOT NULL,
    rol_id INT NOT NULL,
    FOREIGN KEY (persona_id) REFERENCES persona(id),
    FOREIGN KEY (rol_id) REFERENCES rol(id)
);

CREATE TABLE localizacion(
    id INT PRIMARY KEY AUTO_INCREMENT,
    fecha DATE NOT NULL,
    descripcion TEXT NOT NULL,
    permiso VARCHAR(50) NOT NULL,
    coste DECIMAL(10, 2) NOT NULL
);

create table filmar(
    id INT PRIMARY KEY AUTO_INCREMENT,
    codigo_escena INT NOT NULL,
    numero_escena INT NOT NULL,
    duracion_fecha DATE NOT NULL,
    produccion_id INT NOT NULL,
    localizacion_id INT NOT NULL,
    FOREIGN KEY (produccion_id) REFERENCES produccion(id),
    FOREIGN KEY (localizacion_id) REFERENCES localizacion(id)
);

create table detalle_actor(
    id INT PRIMARY KEY AUTO_INCREMENT,
    persona_id INT NOT NULL,
    -- desde back se debe filtrar solo rol actor
    FOREIGN KEY (persona_id) REFERENCES persona(id),
    filmar_id INT NOT NULL,
    FOREIGN KEY (filmar_id) REFERENCES filmar(id)
);

create table evento(
    id INT PRIMARY KEY AUTO_INCREMENT,
    descripcion TEXT NOT NULL,
    fecha DATE NOT NULL,
    persona_id INT NOT NULL,
    produccion_id INT NOT NULL,
    FOREIGN KEY (persona_id) REFERENCES persona(id),
    FOREIGN KEY (produccion_id) REFERENCES produccion(id)
);


-- DML

insert into persona(
    nombre,
    edad,
    correo,
    telefono
)VALUES
("Juan Perez","25","juan@gmail.com","123456789"),
("Maria Lopez","30","maria@gmail.com","987654321"),
("Carlos Gomez","28","carlos@gmail.com","456123789"),
("Ana Torres","35","ana@gmail.com","321654987"),
("Luis Martinez","40","luis@gmail.com","654987321"),
("Sofia Ramirez","22","sofia@gmail.com","789123456"),
("Miguel Sanchez","33","miguel@gmail.com","123789456"),
("Laura Diaz","27","laura@gmail.com","987321654"),
("Jorge Herrera","29","jorge@gmail.com","654123987"),
("Elena Cruz","31","elena@gmail.com","456987123");

insert into rol(
    nombre,
    descripcion
)VALUES
;