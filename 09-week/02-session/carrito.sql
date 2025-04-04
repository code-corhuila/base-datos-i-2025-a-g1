-- Eliminar base de datos
DROP DATABASE IF EXISTS carrito_db;

-- Crear base de datos
CREATE DATABASE carrito_db;

-- Usar base de datos
use carrito_db;

-- Crear entidad
CREATE TABLE categoria(
    id int primary key auto_increment,
    nombre varchar(50) not null,
    descripcion text not null    
);

CREATE TABLE poducto(
    id int primary key auto_increment,
    nombre varchar(50) not null,
    descripcion text not null,
    categoria_id int not null,
    foreign key (categoria_id) references categoria(id)  
);