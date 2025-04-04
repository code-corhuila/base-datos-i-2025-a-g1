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

CREATE table persona_rol(
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

-- Insert 10 personas
INSERT INTO persona (nombre, edad, correo, telefono) VALUES
('Juan Perez', '35', 'juan.perez@example.com', '1234567890'),
('Maria Lopez', '28', 'maria.lopez@example.com', '0987654321'),
('Carlos Gomez', '40', 'carlos.gomez@example.com', '1122334455'),
('Ana Torres', '30', 'ana.torres@example.com', '2233445566'),
('Luis Martinez', '45', 'luis.martinez@example.com', '3344556677'),
('Sofia Ramirez', '25', 'sofia.ramirez@example.com', '4455667788'),
('Miguel Sanchez', '50', 'miguel.sanchez@example.com', '5566778899'),
('Laura Diaz', '32', 'laura.diaz@example.com', '6677889900'),
('Jorge Herrera', '38', 'jorge.herrera@example.com', '7788990011'),
('Elena Cruz', '29', 'elena.cruz@example.com', '8899001122');

-- Insert roles
INSERT INTO rol (nombre, descripcion) VALUES
('Director', 'Encargado de supervisar y dirigir la producción'),
('Guionista', 'Responsable de escribir el guion de la producción'),
('Camarógrafo', 'Encargado de operar la cámara durante la filmación'),
('Editor', 'Responsable de editar el material grabado'),
('Técnico de sonido', 'Encargado de grabar y mezclar el sonido de la producción');

insert into persona_rol(
    persona_id,
    rol_id
)VALUES
(1, 1),
(1, 3),
(1, 4),
(2, 3),
(3, 1),
(4, 4),
(6, 1),
(6, 3),
(6, 2),
(6, 4),
(6, 5);


select * from persona;
select * from rol; 
select * from persona_rol;

select 
	p.nombre persona,
    r.nombre rol
from 
	persona p
    inner join persona_rol pr on p.id = pr.persona_id
    inner join rol r on pr.rol_id = r.id
where p.id = 6;