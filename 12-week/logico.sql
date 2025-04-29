
DROP DATABASE IF EXISTS UniversidadSimulada;
CREATE DATABASE UniversidadSimulada;
USE UniversidadSimulada;

CREATE TABLE persona (
    id INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    edad INT,
    direccion TEXT,
    fecha_eliminacion timestamp
);

-- Tabla usuario
CREATE TABLE usuario (
    id INT PRIMARY KEY AUTO_INCREMENT,
    persona_id INT NOT NULL UNIQUE,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    estado BOOLEAN DEFAULT TRUE,
    fecha_eliminacion timestamp,
    FOREIGN KEY (persona_id) REFERENCES persona(id)
);

INSERT INTO persona (id, nombre, apellido, edad, direccion) VALUES
(1, 'María Manuela', 'Perera', 35, 'Ronda de Mamen Carro 7 Piso 0 , Las Palmas, 84861'),
(2, 'Manuelita', 'Pazos', 63, 'Glorieta Martín Álamo 2, Tarragona, 36995'),
(3, 'León', 'Castro', 34, 'Rambla de Belen Aznar 95 Apt. 99 , Huesca, 07515'),
(4, 'Adora', 'Seguí', 45, 'Cañada Anabel Sola 24 Piso 1 , Zaragoza, 51349'),
(5, 'Salomón', 'Peralta', 48, 'Plaza Virgilio Torrents 99, León, 23900'),
(6, 'Ceferino', 'Redondo', 58, 'Urbanización Mayte Morante 96 Piso 6 , Sevilla, 56658'),
(7, 'Ruben', 'Vega', 35, 'Glorieta Yago Lerma 77 Piso 7 , La Coruña, 24317'),
(8, 'Félix', 'Pedraza', 46, 'Alameda de Jose Manuel Ros 85 Apt. 78 , Cáceres, 70727'),
(9, 'Albina', 'Cid', 19, 'Glorieta de Encarnación Alberola 9 Apt. 21 , La Coruña, 04223'),
(10, 'Ovidio', 'Cerdá', 51, 'Ronda Demetrio Fernández 418 Apt. 66 , Tarragona, 78509'),
(11, 'Florinda', 'Prado', 29, 'Rambla de Delia Ramos 84, Huelva, 74750'),
(12, 'Susana', 'Figueras', 40, 'Ronda de Pacífica Arellano 56 Puerta 5 , Asturias, 54943'),
(13, 'Emigdio', 'Garzón', 29, 'Rambla de Hilda Marqués 4, Castellón, 43506'),
(14, 'Alejo', 'Pont', 41, 'Ronda de Américo Colom 70, Melilla, 96141'),
(15, 'Salomón', 'Bartolomé', 51, 'Via de Amparo Ledesma 4 Puerta 2 , Lleida, 29914'),
(16, 'Alfonso', 'Céspedes', 25, 'Acceso Yaiza Cortés 279, Segovia, 70885'),
(17, 'José Mari', 'Aguilera', 26, 'Callejón Marianela Sainz 22 Piso 7 , Palencia, 78625'),
(18, 'Rita', 'Nebot', 38, 'Ronda Mamen Arco 256, Almería, 73311'),
(19, 'María Dolores', 'Ruano', 50, 'Vial de Olivia Avilés 9, Asturias, 22924'),
(20, 'Pascuala', 'Romero', 51, 'Avenida José Antonio Amador 1, Alicante, 24647'),
(21, 'Cruz', 'Solana', 19, 'Acceso de Conrado Blanes 772, Albacete, 90322'),
(22, 'Casemiro', 'Noguera', 41, 'Cuesta Luciano Fábregas 22, Zaragoza, 74566'),
(23, 'Benigno', 'Arce', 30, 'Callejón de Juan Pablo Tomé 15 Apt. 12 , Murcia, 07408'),
(24, 'Prudencio', 'Verdú', 21, 'Cañada Benigna Ayala 1, Zaragoza, 07004'),
(25, 'Isaac', 'Rico', 37, 'Glorieta Ariel Carmona 34, Las Palmas, 59671'),
(26, 'Agustín', 'Codina', 56, 'Alameda de Hortensia Galiano 7, Cádiz, 99966'),
(27, 'Francisco Jose', 'Pujol', 30, 'Vial Eusebio Tello 729 Apt. 12 , Córdoba, 04233'),
(28, 'María', 'Mosquera', 25, 'Vial de Jennifer Alba 4, La Rioja, 17600'),
(29, 'Mateo', 'Sales', 46, 'Ronda Visitación Lucena 49, Lugo, 27978'),
(30, 'Salomé', 'Nogués', 40, 'Pasadizo de Gil Pedro 4, Ciudad, 71931'),
(31, 'María Del Carmen', 'Montesinos', 41, 'C. Nuria Falcón 68, Huelva, 64623'),
(32, 'Aristides', 'Morcillo', 55, 'Paseo de Maristela Gil 2 Piso 4 , Lleida, 03303'),
(33, 'Ramona', 'Capdevila', 43, 'Via de Yésica Madrid 85 Piso 5 , Lugo, 10136'),
(34, 'María Ángeles', 'Nicolás', 62, 'Camino de Armida Donoso 91 Puerta 4 , Málaga, 35243'),
(35, 'Samanta', 'Lerma', 32, 'Urbanización Aurelia Cortés 75 Piso 9 , Santa Cruz de Tenerife, 85462'),
(36, 'Florentina', 'Sales', 50, 'Alameda Nicanor Barón 10 Puerta 3 , Madrid, 10366'),
(37, 'Nilda', 'Jordán', 61, 'Glorieta Encarnacion Gil 43 Apt. 45 , Navarra, 23092'),
(38, 'Jose Angel', 'Mir', 22, 'Vial de Pascuala Morata 80 Puerta 6 , La Rioja, 61498'),
(39, 'Filomena', 'Ríos', 29, 'C. Asunción Arcos 7, Segovia, 23479'),
(40, 'Aníbal', 'Llanos', 64, 'Cañada Cesar Hidalgo 79, Soria, 64135');


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

SELECT * FROM persona where id = 15;
SELECT * FROM usuario where id = 12;

UPDATE persona
	SET 
		fecha_eliminacion = now()
WHERE id = 25;

UPDATE usuario
	SET 
		fecha_eliminacion = now()
WHERE persona_id = (SELECT id FROM persona WHERE id = 16);
-- SELECT * FROM persona WHERE id = 16
SELECT * FROM usuario WHERE persona_id = (SELECT id FROM persona WHERE id = 16);

UPDATE usuario
	SET 
		fecha_eliminacion = now()
WHERE persona_id = (SELECT id FROM persona WHERE id = 16);
update usuario set fecha_eliminacion = now() WHERE id in(2,4,6,7,8,10,12,13,14,21);
SELECT * FROM usuario where fecha_eliminacion >0;

-- Mostrar nombre completo de la persona, usuario y estado del usuario
SELECT 
	concat(p.nombre,' ', p.apellido) nombre,
    u.username,
    u.estado
FROM 
	persona p
    INNER JOIN usuario u ON p.id = u.persona_id
WHERE 
	p.id = 4
	and p.fecha_eliminacion is null
    and u.fecha_eliminacion is null;

