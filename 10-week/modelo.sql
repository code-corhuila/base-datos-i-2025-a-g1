drop database if exists seguridad;
create database seguridad;
use seguridad;

-- Tabla persona
CREATE TABLE persona (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    correo VARCHAR(100) UNIQUE NOT NULL,
    telefono VARCHAR(20),
    fecha_nacimiento DATE
);

-- Tabla usuario
CREATE TABLE usuario (
    id INT PRIMARY KEY AUTO_INCREMENT,
    persona_id INT NOT NULL,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    estado BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (persona_id) REFERENCES persona(id)
);

-- Tabla rol
CREATE TABLE rol (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) UNIQUE NOT NULL,
    descripcion TEXT
);

-- Tabla rol_usuario (relación muchos a muchos)
CREATE TABLE rol_usuario (
    id INT PRIMARY KEY AUTO_INCREMENT,
    rol_id INT NOT NULL,
    usuario_id INT NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES usuario(id),
    FOREIGN KEY (rol_id) REFERENCES rol(id)
);

-- Tabla modulo
CREATE TABLE modulo (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT
);

-- Tabla rol_modulo (relación muchos a muchos)
CREATE TABLE rol_modulo (
	id INT PRIMARY KEY AUTO_INCREMENT,
    rol_id INT NOT NULL,
    modulo_id INT NOT NULL,
    FOREIGN KEY (rol_id) REFERENCES rol(id),
    FOREIGN KEY (modulo_id) REFERENCES modulo(id)
);

-- Tabla vista
CREATE TABLE vista (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    url VARCHAR(200) NOT NULL
);

-- Tabla modulo_vista (relación muchos a muchos)
CREATE TABLE modulo_vista (
	id INT PRIMARY KEY AUTO_INCREMENT,
    modulo_id INT NOT NULL,
    vista_id INT NOT NULL,
    FOREIGN KEY (modulo_id) REFERENCES modulo(id),
    FOREIGN KEY (vista_id) REFERENCES vista(id)
);


INSERT INTO persona (nombre, apellido, correo, telefono, fecha_nacimiento) VALUES
('Juan', 'Pérez', 'juan.perez@example.com', '3001234567', '1990-05-12'),
('María', 'Gómez', 'maria.gomez@example.com', '3019876543', '1988-09-23'),
('Carlos', 'Ramírez', 'carlos.ramirez@example.com', '3103456789', '1992-01-15'),
('Ana', 'López', 'ana.lopez@example.com', '3114567890', '1995-06-30'),
('Luis', 'Martínez', 'luis.martinez@example.com', '3125678901', '1985-12-10'),
('Laura', 'Hernández', 'laura.hernandez@example.com', '3136789012', '1993-04-25'),
('Pedro', 'Torres', 'pedro.torres@example.com', '3147890123', '1991-03-19'),
('Sofía', 'Castro', 'sofia.castro@example.com', '3158901234', '1989-08-05'),
('Andrés', 'Vargas', 'andres.vargas@example.com', '3169012345', '1994-07-07'),
('Valentina', 'Ríos', 'valentina.rios@example.com', '3170123456', '1996-11-11'),
('Camilo', 'Mendoza', 'camilo.mendoza@example.com', '3181234567', '1990-10-21'),
('Daniela', 'Moreno', 'daniela.moreno@example.com', '3192345678', '1992-02-28'),
('Jorge', 'Suárez', 'jorge.suarez@example.com', '3203456789', '1987-01-01'),
('Manuela', 'García', 'manuela.garcia@example.com', '3214567890', '1995-09-09'),
('Esteban', 'Rojas', 'esteban.rojas@example.com', '3225678901', '1993-03-03'),
('Isabela', 'Navarro', 'isabela.navarro@example.com', '3236789012', '1997-12-12'),
('Tomás', 'Salazar', 'tomas.salazar@example.com', '3247890123', '1986-06-06'),
('Gabriela', 'Mejía', 'gabriela.mejia@example.com', '3258901234', '1988-08-08'),
('Santiago', 'León', 'santiago.leon@example.com', '3269012345', '1991-07-17'),
('Paula', 'Ortiz', 'paula.ortiz@example.com', '3270123456', '1994-05-05');

INSERT INTO usuario (persona_id, username, password, estado) VALUES
(1, 'juanp', '123456', TRUE),
(2, 'mariag', '123456', TRUE),
(3, 'carlitosr', '123456', TRUE),
(4, 'analopez', '123456', TRUE),
(5, 'luism', '123456', TRUE),
(6, 'laurah', '123456', TRUE),
(7, 'pedrot', '123456', TRUE),
(8, 'sofiac', '123456', TRUE),
(9, 'andresv', '123456', TRUE),
(10, 'valenr', '123456', TRUE),
(11, 'camilom', '123456', TRUE),
(12, 'danim', '123456', TRUE),
(13, 'jorges', '123456', TRUE),
(14, 'manugar', '123456', TRUE),
(15, 'estebanr', '123456', TRUE),
(16, 'isabelan', '123456', TRUE),
(17, 'tomass', '123456', TRUE),
(18, 'gabym', '123456', TRUE),
(19, 'santileon', '123456', TRUE),
(20, 'paulao', '123456', TRUE);

INSERT INTO rol (nombre, descripcion) VALUES
('Administrador', 'Acceso total al sistema, gestión de usuarios y configuración.'),
('Supervisor', 'Puede consultar y supervisar módulos específicos del sistema.'),
('Editor', 'Permite editar contenidos, pero no gestionar usuarios.'),
('Consultor', 'Acceso solo de lectura a los módulos permitidos.'),
('Invitado', 'Acceso limitado solo a vistas públicas o básicas.');


drop database if exists seguridad;
create database seguridad;
use seguridad;

-- Tabla persona
CREATE TABLE persona (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    correo VARCHAR(100) UNIQUE NOT NULL,
    telefono VARCHAR(20),
    fecha_nacimiento DATE
);

-- Tabla usuario
CREATE TABLE usuario (
    id INT PRIMARY KEY AUTO_INCREMENT,
    persona_id INT NOT NULL,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    estado BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (persona_id) REFERENCES persona(id)
);

-- Tabla rol
CREATE TABLE rol (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) UNIQUE NOT NULL,
    descripcion TEXT
);

-- Tabla rol_usuario (relación muchos a muchos)
CREATE TABLE rol_usuario (
    id INT PRIMARY KEY AUTO_INCREMENT,
    rol_id INT NOT NULL,
    usuario_id INT NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES usuario(id),
    FOREIGN KEY (rol_id) REFERENCES rol(id)
);

-- Tabla modulo
CREATE TABLE modulo (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT
);

-- Tabla rol_modulo (relación muchos a muchos)
CREATE TABLE rol_modulo (
	id INT PRIMARY KEY AUTO_INCREMENT,
    rol_id INT NOT NULL,
    modulo_id INT NOT NULL,
    FOREIGN KEY (rol_id) REFERENCES rol(id),
    FOREIGN KEY (modulo_id) REFERENCES modulo(id)
);

-- Tabla vista
CREATE TABLE vista (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    url VARCHAR(200) NOT NULL
);

-- Tabla modulo_vista (relación muchos a muchos)
CREATE TABLE modulo_vista (
	id INT PRIMARY KEY AUTO_INCREMENT,
    modulo_id INT NOT NULL,
    vista_id INT NOT NULL,
    FOREIGN KEY (modulo_id) REFERENCES modulo(id),
    FOREIGN KEY (vista_id) REFERENCES vista(id)
);


INSERT INTO persona (nombre, apellido, correo, telefono, fecha_nacimiento) VALUES
('Juan', 'Pérez', 'juan.perez@example.com', '3001234567', '1990-05-12'),
('María', 'Gómez', 'maria.gomez@example.com', '3019876543', '1988-09-23'),
('Carlos', 'Ramírez', 'carlos.ramirez@example.com', '3103456789', '1992-01-15'),
('Ana', 'López', 'ana.lopez@example.com', '3114567890', '1995-06-30'),
('Luis', 'Martínez', 'luis.martinez@example.com', '3125678901', '1985-12-10'),
('Laura', 'Hernández', 'laura.hernandez@example.com', '3136789012', '1993-04-25'),
('Pedro', 'Torres', 'pedro.torres@example.com', '3147890123', '1991-03-19'),
('Sofía', 'Castro', 'sofia.castro@example.com', '3158901234', '1989-08-05'),
('Andrés', 'Vargas', 'andres.vargas@example.com', '3169012345', '1994-07-07'),
('Valentina', 'Ríos', 'valentina.rios@example.com', '3170123456', '1996-11-11'),
('Camilo', 'Mendoza', 'camilo.mendoza@example.com', '3181234567', '1990-10-21'),
('Daniela', 'Moreno', 'daniela.moreno@example.com', '3192345678', '1992-02-28'),
('Jorge', 'Suárez', 'jorge.suarez@example.com', '3203456789', '1987-01-01'),
('Manuela', 'García', 'manuela.garcia@example.com', '3214567890', '1995-09-09'),
('Esteban', 'Rojas', 'esteban.rojas@example.com', '3225678901', '1993-03-03'),
('Isabela', 'Navarro', 'isabela.navarro@example.com', '3236789012', '1997-12-12'),
('Tomás', 'Salazar', 'tomas.salazar@example.com', '3247890123', '1986-06-06'),
('Gabriela', 'Mejía', 'gabriela.mejia@example.com', '3258901234', '1988-08-08'),
('Santiago', 'León', 'santiago.leon@example.com', '3269012345', '1991-07-17'),
('Paula', 'Ortiz', 'paula.ortiz@example.com', '3270123456', '1994-05-05');

INSERT INTO usuario (persona_id, username, password, estado) VALUES
(1, 'juanp', '123456', TRUE),
(2, 'mariag', '123456', TRUE),
(3, 'carlitosr', '123456', TRUE),
(4, 'analopez', '123456', TRUE),
(5, 'luism', '123456', TRUE),
(6, 'laurah', '123456', TRUE),
(7, 'pedrot', '123456', TRUE),
(8, 'sofiac', '123456', TRUE),
(9, 'andresv', '123456', TRUE),
(10, 'valenr', '123456', TRUE),
(11, 'camilom', '123456', TRUE),
(12, 'danim', '123456', TRUE),
(13, 'jorges', '123456', TRUE),
(14, 'manugar', '123456', TRUE),
(15, 'estebanr', '123456', TRUE),
(16, 'isabelan', '123456', TRUE),
(17, 'tomass', '123456', TRUE),
(18, 'gabym', '123456', TRUE),
(19, 'santileon', '123456', TRUE),
(20, 'paulao', '123456', TRUE);

INSERT INTO rol (nombre, descripcion) VALUES
('Administrador', 'Acceso total al sistema, gestión de usuarios y configuración.'),
('Supervisor', 'Puede consultar y supervisar módulos específicos del sistema.'),
('Editor', 'Permite editar contenidos, pero no gestionar usuarios.'),
('Consultor', 'Acceso solo de lectura a los módulos permitidos.'),
('Invitado', 'Acceso limitado solo a vistas públicas o básicas.');


-- Usuario 1: 5 roles
INSERT INTO rol_usuario (usuario_id, rol_id) VALUES
(1, 1), (1, 2), (1, 3), (1, 4), (1, 5);

-- Usuario 2: 4 roles
INSERT INTO rol_usuario (usuario_id, rol_id) VALUES
(2, 1), (2, 2), (2, 3), (2, 4);

-- Usuario 3: 3 roles
INSERT INTO rol_usuario (usuario_id, rol_id) VALUES
(3, 2), (3, 3), (3, 5);

-- Usuario 4: 2 roles
INSERT INTO rol_usuario (usuario_id, rol_id) VALUES
(4, 3), (4, 4);

-- Usuario 5: 5 roles
INSERT INTO rol_usuario (usuario_id, rol_id) VALUES
(5, 1), (5, 2), (5, 3), (5, 4), (5, 5);

-- Usuario 6: 3 roles
INSERT INTO rol_usuario (usuario_id, rol_id) VALUES
(6, 2), (6, 4), (6, 5);

-- Usuario 7: 2 roles
INSERT INTO rol_usuario (usuario_id, rol_id) VALUES
(7, 1), (7, 5);

-- Usuario 8: 4 roles
INSERT INTO rol_usuario (usuario_id, rol_id) VALUES
(8, 2), (8, 3), (8, 4), (8, 5);

-- Usuario 9: 3 roles
INSERT INTO rol_usuario (usuario_id, rol_id) VALUES
(9, 1), (9, 3), (9, 4);

-- Usuario 10: 5 roles
INSERT INTO rol_usuario (usuario_id, rol_id) VALUES
(10, 1), (10, 2), (10, 3), (10, 4), (10, 5);

-- Usuario 11: 2 roles
INSERT INTO rol_usuario (usuario_id, rol_id) VALUES
(11, 2), (11, 5);

-- Usuario 12: 3 roles
INSERT INTO rol_usuario (usuario_id, rol_id) VALUES
(12, 1), (12, 2), (12, 3);

-- Usuario 13: 4 roles
INSERT INTO rol_usuario (usuario_id, rol_id) VALUES
(13, 2), (13, 3), (13, 4), (13, 5);

-- Usuario 14: 3 roles
INSERT INTO rol_usuario (usuario_id, rol_id) VALUES
(14, 1), (14, 4), (14, 5);

-- Usuario 15: 2 roles
INSERT INTO rol_usuario (usuario_id, rol_id) VALUES
(15, 3), (15, 5);

-- Usuario 16: 4 roles
INSERT INTO rol_usuario (usuario_id, rol_id) VALUES
(16, 1), (16, 2), (16, 4), (16, 5);

-- Usuario 17: 5 roles
INSERT INTO rol_usuario (usuario_id, rol_id) VALUES
(17, 1), (17, 2), (17, 3), (17, 4), (17, 5);

-- Usuario 18: 2 roles
INSERT INTO rol_usuario (usuario_id, rol_id) VALUES
(18, 4), (18, 5);

-- Usuario 19: 3 roles
INSERT INTO rol_usuario (usuario_id, rol_id) VALUES
(19, 2), (19, 3), (19, 5);

-- Usuario 20: 4 roles
INSERT INTO rol_usuario (usuario_id, rol_id) VALUES
(20, 1), (20, 2), (20, 4), (20, 5);

-- Qué rol o roles tiene una persona, filtrando por correo
-- mostrar solo nombre de la persona, teléfono y el nombre del rol.

SELECT 
	*
FROM 
	persona
    INNER JOIN usuario ON usuario.id = usuario.persona_id
    INNER JOIN rol_usuario ON usuario.id = rol_usuario.usuario_id
    -- INNER JOIN rol ON rol_usuario.rol_id = rol.id
WHERE persona.correo = 'juan.perez@example.com';
