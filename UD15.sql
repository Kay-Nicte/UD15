CREATE DATABASE  IF NOT EXISTS `UD15`;
USE `UD15`;

/*----------------------------------------------------------------------------------------------------
EJERCICIO 1
------------------------------------------------------------------------------------------------------*/

DROP TABLE IF EXISTS despachos;
CREATE TABLE despachos (
  Numero int,
  Capacidad int,
  PRIMARY KEY (Numero)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO despachos VALUE(1, 50), (2, 10), (3,23), (4, 40), (5, 3), (6, 14), (7, 17), (8, 32), (9, 35), (10, 50);

DROP TABLE IF EXISTS directores;
CREATE TABLE directores (
  DNI varchar(8),
  NomApels nvarchar(255),
  DNIJefe varchar(8),
  Despacho int,
  PRIMARY KEY (DNI),
  FOREIGN KEY (DNIJefe) REFERENCES directores(DNI),
  FOREIGN KEY (Despacho) REFERENCES despachos(Numero)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO directores VALUES('22222222', 'Lorem ipsum', null, 10); 
INSERT INTO directores VALUES ('99999999', 'Lorem ipsum', '22222222', 1), ('88888888', 'Lorem ipsum', '22222222', 1), ('77777777', 'Lorem ipsum', '22222222', 5), ('66666666', 'Lorem ipsum', '22222222', 3), ('55555555', 'Lorem ipsum', '22222222', 9), ('44444444', 'Lorem ipsum', '22222222', 4), ('33333333', 'Lorem ipsum', '22222222', 8), ('11111111', 'Lorem ipsum', '22222222', 8), ('00000000', 'Lorem ipsum', '22222222', 9);

select * from despachos;
select * from directores;

/*----------------------------------------------------------------------------------------------------
EJERCICIO 2
------------------------------------------------------------------------------------------------------*/
DROP TABLE IF EXISTS piezas;
CREATE TABLE piezas (
  Codigo int,
  Nombre nvarchar(100),
  PRIMARY KEY (Codigo)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO piezas
VALUES(1, 'Tuerca'),
(2, 'Tornillo'),
(3, 'Bujía'),
(4, 'Engranaje'),
(5, 'Taco'),
(6, 'Bisagra'),
(7, 'Eje'),
(8, 'Moldura'),
(9, 'Pedal'),
(10, 'Manija');

DROP TABLE IF EXISTS proveedores;
CREATE TABLE proveedores (
  ID char(4),
  Nombre nvarchar(100),
  PRIMARY KEY (ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO proveedores
VALUES('PRO1', 'Proveedor 1'),
('PRO2', 'Proveedor 2'),
('PRO3', 'Proveedor 3'),
('PRO4', 'Proveedor 4'),
('PRO5', 'Proveedor 5'),
('PRO6', 'Proveedor 6'),
('PRO7', 'Proveedor 7'),
('PRO8', 'Proveedor 8'),
('PRO9', 'Proveedor 9'),
('PR10', 'Proveedor 10');

DROP TABLE IF EXISTS suministra;
CREATE TABLE suministra (
  CodigoPieza int,
  IDProveedor char(4),
  PRIMARY KEY (CodigoPieza, IDProveedor),
  FOREIGN KEY (CodigoPieza) REFERENCES piezas(Codigo),
  FOREIGN KEY (IDProveedor) REFERENCES proveedores(ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO suministra
VALUES(1, 'PRO1'),
(2, 'PRO2'),
(3, 'PRO3'),
(4, 'PRO4'),
(5, 'PRO5'),
(6, 'PRO6'),
(7, 'PRO7'),
(8, 'PRO8'),
(9, 'PRO9'),
(10, 'PR10');

select * from piezas;
select * from proveedores;
select * from suministra;

/*----------------------------------------------------------------------------------------------------
EJERCICIO 3
------------------------------------------------------------------------------------------------------*/

DROP TABLE IF EXISTS cientificos;
CREATE TABLE cientificos (
  DNI varchar(8),
  NomApels nvarchar(255),
  PRIMARY KEY (DNI)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO cientificos 
VALUES('11111111', 'Juan Gabriel García López'), 
('22222222', 'Jacinto Rey Grande'), 
('33333333', 'Elena Nito del Bosque'), 
('44444444', 'Marías Queroso'), 
('55555555', 'Armando Bronca Segura'), 
('66666666', 'Eva Fina Segura'), 
('77777777', 'Armando Líos'), 
('88888888', 'Rosa Blanco Rojo'), 
('99999999', 'Dolores Fuertes de Barriga'), 
('00000000','Zacarías Flores del Campo');

DROP TABLE IF EXISTS proyecto;
CREATE TABLE proyecto (
  ID char(4),
  Nombre nvarchar(255),
  Horas int,
  PRIMARY KEY (ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO proyecto
VALUES('DD01', 'Proyecto Uno', 5607), 
('DD02', 'Caribe 2000', 3750), 
('DD03', 'Método Silencio', 8900), 
('DX01', 'Temporal 500', 322), 
('DX02', 'CP09', 6710), 
('DX03', 'Leonardo', 3502), 
('MEL0', 'DataBase', 800), 
('MEL1', 'Query5', 350), 
('MEL2', 'Ajax4Ever', 32), 
('MEL3', 'Contouring', 56);

DROP TABLE IF EXISTS asignado_a;
CREATE TABLE asignado_a (
  Cientifico varchar(8),
  Proyecto char(4),
  PRIMARY KEY (Cientifico,Proyecto),
  FOREIGN KEY (Cientifico) REFERENCES cientificos(DNI),
  FOREIGN KEY (Proyecto) REFERENCES proyecto(ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO asignado_a
VALUES('11111111', 'DD01'),
('22222222', 'DD02'),
('33333333', 'DD03'),
('44444444', 'DX01'),
('55555555', 'DX02'),
('66666666', 'DX03'),
('77777777', 'MEL0'),
('88888888', 'MEL1'),
('99999999', 'MEL2'),
('00000000', 'MEL3');

select * from cientificos;
select * from proyecto;
select * from asignado_a;

/*----------------------------------------------------------------------------------------------------
EJERCICIO 4
------------------------------------------------------------------------------------------------------*/

DROP TABLE IF EXISTS productos;
CREATE TABLE productos (
  Codigo int,
  Nombre nvarchar(100),
  Precio int,
  PRIMARY KEY (Codigo)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO productos 
VALUES(1, 'Reloj Versace mujer', 455),
(2, 'Reloj Guess mujer', 50),
(3, 'Reloj Guess hombre', 50),
(4, 'Reloj Rolex oro', 389),
(5, 'Reloj rolex correa piel', 295),
(6, 'Pendientes plata corazón', 20),
(7, 'Pendientes plata trébol', 20),
(8, 'Brazalete plata', 30),
(9, 'Colgante plata corazón', 35),
(10, 'Colgante plata luna', 35);

DROP TABLE IF EXISTS cajeros;
CREATE TABLE cajeros (
  Codigo int,
  NomApels nvarchar(255),
  PRIMARY KEY (Codigo)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO cientificos 
VALUES(1, 'Juan Gabriel García López'), 
(2, 'Jacinto Rey Grande'), 
(3, 'Elena Nito del Bosque'), 
(4, 'Marías Queroso'), 
(5, 'Armando Bronca Segura'), 
(6, 'Eva Fina Segura'), 
(7, 'Armando Líos'), 
(8, 'Rosa Blanco Rojo'), 
(9, 'Dolores Fuertes de Barriga'), 
(10,'Zacarías Flores del Campo');

DROP TABLE IF EXISTS maquinas_registradoras;
CREATE TABLE maquinas_registradoras (
  Codigo int,
  Piso int,
  PRIMARY KEY (Codigo)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO maquinas_registradoras
VALUES(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

DROP TABLE IF EXISTS venta;
CREATE TABLE venta (
  Cajero int,
  Maquina int,
  Producto int,
  PRIMARY KEY (Cajero,Maquina,Producto),
  FOREIGN KEY (Cajero) REFERENCES cajeros(codigo),
  FOREIGN KEY (Maquina) REFERENCES maquinas_registradoras(codigo),
  FOREIGN KEY (Producto) REFERENCES productos(codigo)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO venta
VALUES(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 10);

/*----------------------------------------------------------------------------------------------------
EJERCICIO 5
------------------------------------------------------------------------------------------------------*/


