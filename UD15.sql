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

DROP TABLE IF EXISTS cientificos;
CREATE TABLE cientificos (
  DNI varchar(8),
  NomApels nvarchar(255),
  PRIMARY KEY (DNI)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS proyecto;
CREATE TABLE proyecto (
  ID char(4),
  Nombre nvarchar(255),
  Horas int,
  PRIMARY KEY (ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS asignado_a;
CREATE TABLE asignado_a (
  Cientifico varchar(8),
  Proyecto char(4),
  PRIMARY KEY (Cientifico,Proyecto),
  FOREIGN KEY (Cientifico) REFERENCES cientificos(DNI),
  FOREIGN KEY (Proyecto) REFERENCES proyecto(ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

