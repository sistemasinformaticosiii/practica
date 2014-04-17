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
   tipo varchar(20) DEFAULT NULL,
   categoria varchar(20) DEFAULT NULL,
   titulo varchar(20) DEFAULT NULL,
   fechainicio DATE DEFAULT NULL,
   fechafin DATE DEFAULT NULL,
   localidad varchar(20) DEFAULT NULL,
   direccion varchar(50) DEFAULT NULL,
   descripcion varchar(100) DEFAULT NULL,
   plazastotal integer DEFAULT NULL,
   plazasdisponibles integer DEFAULT NULL,
   precio double DEFAULT NULL,
   descuento double DEFAULT NULL)
   
   
CREATE TABLE subscription (
	codsubscription INTEGER NOT NULL IDENTITY,
	coduser INTEGER NOT NULL,
	tiposubscription varchar(20) DEFAULT NULL)
	
CREATE TABLE reservation (
	codreservation INTEGER NOT NULL IDENTITY,
	coduser INTEGER NOT NULL,
	codoferta INTEGER NOT NULL,
	fechareserva varchar(10) DEFAULT NULL,
	plazasreservadas INTEGER DEFAULT NULL)
	