create schema si3;


CREATE TABLE user (
  coduser INTEGER NOT NULL IDENTITY,
  nombre varchar(20) DEFAULT NULL,
  apellidos varchar(20) DEFAULT NULL,
  localidad varchar(20) DEFAULT NULL,
  telefono varchar(20) DEFAULT NULL,
  email varchar(20) DEFAULT NULL,
  perfil varchar(20) DEFAULT NULL,
  pass varchar(20) DEFAULT NULL)
  
  
CREATE TABLE oferta (
   codoferta INTEGER NOT NULL IDENTITY,
   codusuario  integer DEFAULT NULL,
   titulo varchar(20) DEFAULT NULL,
   tipo varchar(20) DEFAULT NULL,
   categoria varchar(20) DEFAULT NULL,
   fechainicio date DEFAULT NULL,
   fechafin date DEFAULT NULL,
   localidad varchar(20) DEFAULT NULL,
   direccion varchar(50) DEFAULT NULL,
   descripcion varchar(100) DEFAULT NULL,
   plazastotal integer DEFAULT NULL,
   plazasdisponibles integer DEFAULT NULL,
   precio double DEFAULT NULL,
   descuento double DEFAULT NULL)