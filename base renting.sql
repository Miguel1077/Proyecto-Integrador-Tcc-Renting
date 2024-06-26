CREATE DATABASE RENTING_ALTO_CC;

USE RENTING_ALTO_CC;

-- Tabla de clientes
CREATE TABLE clientes (
    id_cliente VARCHAR(100) PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    telefono VARCHAR(50),
    correo VARCHAR(100),
);

select * from clientes

-- Tabla de motos
CREATE TABLE motos (
    id_moto VARCHAR(100) PRIMARY KEY,
    marca VARCHAR(100),
    modelo VARCHAR(100),
    tipo VARCHAR(20)
);

-- Tabla de asesores
CREATE TABLE asesores (
    id_asesor VARCHAR(100) PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    telefono VARCHAR(100),
    correo VARCHAR(100),
	id_cliente VARCHAR(100),
	FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
);

-- Tabla de clientes y motos
CREATE TABLE clientes_motos (
    id_cliente VARCHAR(100),
    id_moto VARCHAR(100),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_moto) REFERENCES motos(id_moto),
    PRIMARY KEY (id_cliente, id_moto)
);

-- Tabla de ventas_alquileres
CREATE TABLE ventas_alquileres (
    id_venta INT PRIMARY KEY,
    id_cliente VARCHAR(100),
    id_moto VARCHAR(100),
    fecha_venta DATE,
    costo DECIMAL(10, 2),
    duracion_alquiler INT,
    estado_pago VARCHAR(20),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_moto) REFERENCES motos(id_moto)
);


-- Verificar clave for�nea entre motos y ventas_alquileres
ALTER TABLE ventas_alquileres
ADD CONSTRAINT fk_moto
FOREIGN KEY (id_moto) REFERENCES motos(id_moto);

-- Verificar clave for�nea entre clientes y ventas_alquileres
ALTER TABLE ventas_alquileres
ADD CONSTRAINT fk_cliente
FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente);
