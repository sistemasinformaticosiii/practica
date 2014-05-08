create schema si3;


CREATE TABLE user (
  username varchar(50) not null primary key,
  enabled boolean not null,
  coduser INTEGER NOT NULL IDENTITY,
  nombre varchar(20) DEFAULT NULL,
  apellidos varchar(30) DEFAULT NULL,
  localidad varchar(30) DEFAULT NULL,
  telefono varchar(20) DEFAULT NULL,
  email varchar(40) DEFAULT NULL,
  perfil varchar(20) DEFAULT NULL,
  pass varchar(200) DEFAULT NULL)
  
  
CREATE TABLE oferta (
   codoferta INTEGER NOT NULL IDENTITY,
   codusuario  integer DEFAULT NULL,
   tipo varchar(20) DEFAULT NULL,
   categoria varchar(20) DEFAULT NULL,
   titulo varchar(40) DEFAULT NULL,
   fechainicio DATE DEFAULT CURRENT_DATE,
   fechafin DATE DEFAULT CURRENT_DATE,
   localidad varchar(30) DEFAULT NULL,
   direccion varchar(50) DEFAULT NULL,
   descripcion varchar(300) DEFAULT NULL,
   plazasTotal integer DEFAULT NULL,
   plazasDisponibles integer DEFAULT NULL,
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
	
	
