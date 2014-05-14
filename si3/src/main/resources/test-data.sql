

INSERT INTO subscription values('0', '4', 'Restaurantes');
INSERT INTO subscription values('1', '4', 'Entradas');


/*Password de usuario están codificadas: para los usuarios pre-cargados se ha establecido una password con valor "1234"*/
INSERT INTO user(username, enabled, coduser,nombre, apellidos, localidad, telefono, email, perfil, pass) VALUES ('juan','TRUE',0,'Juan','Garcia','Vigo','6000000','pepe@hotmail.com', 'Cliente', '$2a$10$HiKWXVdIMbr5/sfl41DFpOLa3NRbhWsN0YpsCZEhOZuvmt85nk946');
INSERT INTO user(username, enabled, coduser,nombre, apellidos, localidad, telefono, email, perfil, pass) VALUES ('maria','TRUE',1,'Juan','Garcia','Vigo','6000000','pepe@hotmail.com', 'Restaurantes', '$2a$10$HiKWXVdIMbr5/sfl41DFpOLa3NRbhWsN0YpsCZEhOZuvmt85nk946');
INSERT INTO user(username, enabled, coduser,nombre, apellidos, localidad, telefono, email, perfil, pass) VALUES ('pepe','TRUE',2,'Juan','Garcia','Vigo','6000000','pepe@hotmail.com', 'Administrador', '$2a$10$HiKWXVdIMbr5/sfl41DFpOLa3NRbhWsN0YpsCZEhOZuvmt85nk946');
INSERT INTO user(username, enabled, coduser,nombre, apellidos, localidad, telefono, email, perfil, pass) VALUES ('luis','TRUE',3,'Juan','Garcia','Vigo','6000000','pepe@hotmail.com', 'Entradas', '$2a$10$HiKWXVdIMbr5/sfl41DFpOLa3NRbhWsN0YpsCZEhOZuvmt85nk946');
INSERT INTO user(username, enabled, coduser,nombre, apellidos, localidad, telefono, email, perfil, pass) VALUES ('andres','TRUE',4,'Andres','Gil','Vigo','6000000','andresgil@gmail.com', 'Cliente', '$2a$10$HiKWXVdIMbr5/sfl41DFpOLa3NRbhWsN0YpsCZEhOZuvmt85nk946');
INSERT INTO user(username, enabled, coduser,nombre, apellidos, localidad, telefono, email, perfil, pass) VALUES ('Maria.Gil.Gil@gmail.com','TRUE',8,'Maria', 'Gil Gil', 'Pamplona', '689889665', 'Maria.Gil.Gil@gmail.com', 'Cliente', '$2a$10$HiKWXVdIMbr5/sfl41DFpOLa3NRbhWsN0YpsCZEhOZuvmt85nk946');
INSERT INTO user(username, enabled, coduser,nombre, apellidos, localidad, telefono, email, perfil, pass) VALUES ('Pablo.Perez.Jimenez@hotmail.com','TRUE',11,'Pablo', 'Perez Jimenez', 'Cadiz', '677466395', 'Pablo.Perez.Jimenez@hotmail.com', 'Cliente', '$2a$10$HiKWXVdIMbr5/sfl41DFpOLa3NRbhWsN0YpsCZEhOZuvmt85nk946');
INSERT INTO user(username, enabled, coduser,nombre, apellidos, localidad, telefono, email, perfil, pass) VALUES ('Jorge.Garcia.Garcia@yahoo.es','TRUE',12,'Jorge', 'Garcia Garcia', 'Sevilla', '677974856', 'Jorge.Garcia.Garcia@yahoo.es', 'Cliente', '$2a$10$HiKWXVdIMbr5/sfl41DFpOLa3NRbhWsN0YpsCZEhOZuvmt85nk946');
INSERT INTO user(username, enabled, coduser,nombre, apellidos, localidad, telefono, email, perfil, pass) VALUES ('Nerea.Ruiz.Rodriguez@yahoo.es','TRUE',13,'Nerea', 'Ruiz Rodriguez', 'Bilbao', '677481938', 'Nerea.Ruiz.Rodriguez@yahoo.es', 'Cliente', '$2a$10$HiKWXVdIMbr5/sfl41DFpOLa3NRbhWsN0YpsCZEhOZuvmt85nk946');
INSERT INTO user(username, enabled, coduser,nombre, apellidos, localidad, telefono, email, perfil, pass) VALUES ('Alba.Gonzalez.Moreno@yahoo.e','TRUE',22,'Alba', 'Gonzalez Moreno', 'Bilbao', '676200525', 'Alba.Gonzalez.Moreno@yahoo.es', 'Cliente', '$2a$10$HiKWXVdIMbr5/sfl41DFpOLa3NRbhWsN0YpsCZEhOZuvmt85nk946');
INSERT INTO user(username, enabled, coduser,nombre, apellidos, localidad, telefono, email, perfil, pass) VALUES ('Lucia.Perez.Jimenez@hotmail.com','TRUE',23,'Lucia', 'Perez Jimenez', 'Cadiz', '676822635', 'Lucia.Perez.Jimenez@hotmail.com', 'Cliente', '$2a$10$HiKWXVdIMbr5/sfl41DFpOLa3NRbhWsN0YpsCZEhOZuvmt85nk946');
INSERT INTO user(username, enabled, coduser,nombre, apellidos, localidad, telefono, email, perfil, pass) VALUES ('Alba.Garcia.Alonso@hotmail.com','TRUE',17,'Alba', 'Garcia Alonso', 'Cuenca', '677509271', 'Alba.Garcia.Alonso@hotmail.com', 'Cliente', '$2a$10$HiKWXVdIMbr5/sfl41DFpOLa3NRbhWsN0YpsCZEhOZuvmt85nk946');

INSERT INTO user(username, enabled, coduser,nombre, apellidos, localidad, telefono, email, perfil, pass) VALUES ('Maria.Garcia.Garcia@gmail.com','TRUE',7,'Maria', 'Garcia Garcia', 'Barcelona', '677711484', 'Maria.Garcia.Garcia@gmail.com', 'Actividades', '$2a$10$HiKWXVdIMbr5/sfl41DFpOLa3NRbhWsN0YpsCZEhOZuvmt85nk946');
INSERT INTO user(username, enabled, coduser,nombre, apellidos, localidad, telefono, email, perfil, pass) VALUES ('Javier.Hernandez.Munoz@hotmail.com','TRUE',9,'Javier', 'Hernandez Munoz', 'Granada', '676788299', 'Javier.Hernandez.Munoz@hotmail.com', 'Entradas', '$2a$10$HiKWXVdIMbr5/sfl41DFpOLa3NRbhWsN0YpsCZEhOZuvmt85nk946');
INSERT INTO user(username, enabled, coduser,nombre, apellidos, localidad, telefono, email, perfil, pass) VALUES ('Marta.Perez.Fernandez@yahoo.es','TRUE',10,'Marta', 'Perez Fernandez', 'Madrid', '677422735', 'Marta.Perez.Fernandez@yahoo.es', 'Entradas', '$2a$10$HiKWXVdIMbr5/sfl41DFpOLa3NRbhWsN0YpsCZEhOZuvmt85nk946');
INSERT INTO user(username, enabled, coduser,nombre, apellidos, localidad, telefono, email, perfil, pass) VALUES ('Ana.Perez.Lopez@yahoo.es','TRUE',14,'Ana', 'Perez Lopez', 'Valladolid', '676239418', 'Ana.Perez.Lopez@yahoo.es', 'Entradas', '$2a$10$HiKWXVdIMbr5/sfl41DFpOLa3NRbhWsN0YpsCZEhOZuvmt85nk946');
INSERT INTO user(username, enabled, coduser,nombre, apellidos, localidad, telefono, email, perfil, pass) VALUES ('Sara.Diaz.Ruiz@gmail.com','TRUE',15,'Sara', 'Diaz Ruiz', 'Granada', '677209566', 'Sara.Diaz.Ruiz@gmail.com', 'Entradas', '$2a$10$HiKWXVdIMbr5/sfl41DFpOLa3NRbhWsN0YpsCZEhOZuvmt85nk946');
INSERT INTO user(username, enabled, coduser,nombre, apellidos, localidad, telefono, email, perfil, pass) VALUES ('Andrea.Hernandez.Munoz@yahoo.es','TRUE',16,'Andrea', 'Hernandez Munoz', 'Granada', '676810067', 'Andrea.Hernandez.Munoz@yahoo.es', 'Entradas', '$2a$10$HiKWXVdIMbr5/sfl41DFpOLa3NRbhWsN0YpsCZEhOZuvmt85nk946');

INSERT INTO user(username, enabled, coduser,nombre, apellidos, localidad, telefono, email, perfil, pass) VALUES ('Paula.Martinez.Ruiz@yahoo.es','TRUE',19,'Paula', 'Martinez Ruiz', 'Madrid', '677617759', 'Paula.Martinez.Ruiz@yahoo.es', 'Entradas', '$2a$10$HiKWXVdIMbr5/sfl41DFpOLa3NRbhWsN0YpsCZEhOZuvmt85nk946');
INSERT INTO user(username, enabled, coduser,nombre, apellidos, localidad, telefono, email, perfil, pass) VALUES ('Jorge.Garcia.Diaz@gmail.com','TRUE',20,'Jorge', 'Garcia Diaz', 'Bilbao', '676223976', 'Jorge.Garcia.Diaz@gmail.com', 'Restaurantes', '$2a$10$HiKWXVdIMbr5/sfl41DFpOLa3NRbhWsN0YpsCZEhOZuvmt85nk946');
INSERT INTO user(username, enabled, coduser,nombre, apellidos, localidad, telefono, email, perfil, pass) VALUES ('Laura.Moreno.Martin@yahoo.es','TRUE',21,'Laura', 'Moreno Martin', 'Bilbao', '677781726', 'Laura.Moreno.Martin@yahoo.es', 'Restaurantes', '$2a$10$HiKWXVdIMbr5/sfl41DFpOLa3NRbhWsN0YpsCZEhOZuvmt85nk946');
INSERT INTO user(username, enabled, coduser,nombre, apellidos, localidad, telefono, email, perfil, pass) VALUES ('Maria.Rodriguez.Lopez@hotmail.com','TRUE',24,'Maria', 'Rodriguez Lopez', 'Valladolid', '676285525', 'Maria.Rodriguez.Lopez@hotmail.com', 'Restaurantes', '$2a$10$HiKWXVdIMbr5/sfl41DFpOLa3NRbhWsN0YpsCZEhOZuvmt85nk946');
INSERT INTO user(username, enabled, coduser,nombre, apellidos, localidad, telefono, email, perfil, pass) VALUES ('David.Rodriguez.Rodriguez@gmail.com','TRUE',25,'David', 'Rodriguez Rodriguez', 'Sevilla', '677313211', 'David.Rodriguez.Rodriguez@gmail.com', 'Entradas', '$2a$10$HiKWXVdIMbr5/sfl41DFpOLa3NRbhWsN0YpsCZEhOZuvmt85nk946');
INSERT INTO user(username, enabled, coduser,nombre, apellidos, localidad, telefono, email, perfil, pass) VALUES ('Mario.Fernandez.Moreno@yahoo.es','TRUE',18,'Mario', 'Fernandez Moreno', 'Cuenca', '677501104', 'Mario.Fernandez.Moreno@yahoo.es', 'Entradas', '$2a$10$HiKWXVdIMbr5/sfl41DFpOLa3NRbhWsN0YpsCZEhOZuvmt85nk946');

INSERT INTO oferta (codusuario,tipo,categoria,titulo,fechainicio,fechafin, localidad,direccion,descripcion,plazastotal,plazasdisponibles,precio,descuento) VALUES (7, 'Actividades', 'Spa', 'Descrip', '2014-05-21', '2014-08-22', 'Granada', 'Calle 16', 'blablabla',34,26,31,0);
INSERT INTO oferta (codusuario,tipo,categoria,titulo,fechainicio,fechafin, localidad,direccion,descripcion,plazastotal,plazasdisponibles,precio,descuento) VALUES (7, 'Actividades', 'Ruta Guiada', 'Descrip', '2014-12-24', '2015-01-06', 'Barcelona', 'Calle 61', 'blablabla',78,10,65,0);
INSERT INTO oferta (codusuario,tipo,categoria,titulo,fechainicio,fechafin, localidad,direccion,descripcion,plazastotal,plazasdisponibles,precio,descuento) VALUES (7, 'Actividades', 'Paseo a Caballo', 'Descrip', '2014-05-05', '2014-07-06', 'Valladolid', 'Calle 0', 'blablabla',99,76,39,0);
INSERT INTO oferta (codusuario,tipo,categoria,titulo,fechainicio,fechafin, localidad,direccion,descripcion,plazastotal,plazasdisponibles,precio,descuento) VALUES (7, 'Actividades', 'Paseo a Caballo', 'Descrip', '2014-11-21', '2014-12-21', 'Barcelona', 'Calle 78', 'blablabla',46,12,23,0);
INSERT INTO oferta (codusuario,tipo,categoria,titulo,fechainicio,fechafin, localidad,direccion,descripcion,plazastotal,plazasdisponibles,precio,descuento) VALUES (7, 'Actividades', 'Masaje', 'Descrip', '2014-11-30', '2015-03-20', 'Granada', 'Calle 35', 'blablabla',32,4,56,0);
INSERT INTO oferta (codusuario,tipo,categoria,titulo,fechainicio,fechafin, localidad,direccion,descripcion,plazastotal,plazasdisponibles,precio,descuento) VALUES (7, 'Actividades', 'Deportivas', 'Descrip', '2015-04-21', '2015-06-13', 'Bilbao', 'Calle 83', 'blablabla',42,7,14,0);
INSERT INTO oferta (codusuario,tipo,categoria,titulo,fechainicio,fechafin, localidad,direccion,descripcion,plazastotal,plazasdisponibles,precio,descuento) VALUES (7, 'Actividades', 'Spa', 'Descrip', '2014-09-29', '2014-11-14', 'Madrid', 'Calle 61', 'blablabla',86,73,89,0);
INSERT INTO oferta (codusuario,tipo,categoria,titulo,fechainicio,fechafin, localidad,direccion,descripcion,plazastotal,plazasdisponibles,precio,descuento) VALUES (7, 'Actividades', 'Balneario', 'Descrip', '2015-01-18', '2015-02-27', 'Bilbao', 'Calle 2', 'blablabla',71,21,65,0);
INSERT INTO oferta (codusuario,tipo,categoria,titulo,fechainicio,fechafin, localidad,direccion,descripcion,plazastotal,plazasdisponibles,precio,descuento) VALUES (7, 'Actividades', 'Paseo a Caballo', 'Descrip', '2014-07-06', '2014-08-19', 'Sevilla', 'Calle 76', 'blablabla',89,26,56,0);
INSERT INTO oferta (codusuario,tipo,categoria,titulo,fechainicio,fechafin, localidad,direccion,descripcion,plazastotal,plazasdisponibles,precio,descuento) VALUES (7, 'Actividades', 'Spa', 'Descrip', '2014-07-15', '2014-10-19', 'Valladolid', 'Calle 39', 'blablabla',54,9,81,0);
INSERT INTO oferta (codusuario,tipo,categoria,titulo,fechainicio,fechafin, localidad,direccion,descripcion,plazastotal,plazasdisponibles,precio,descuento) VALUES (7, 'Actividades', 'Ruta Guiada', 'Descrip', '2014-05-02', '2014-08-23', 'Madrid', 'Calle 62', 'blablabla',56,16,17,0);
INSERT INTO oferta (codusuario,tipo,categoria,titulo,fechainicio,fechafin, localidad,direccion,descripcion,plazastotal,plazasdisponibles,precio,descuento) VALUES (7, 'Actividades', 'Deportivas', 'Descrip', '2014-12-04', '2015-02-04', 'Cuenca', 'Calle 53', 'blablabla',66,62,30,0);
INSERT INTO oferta (codusuario,tipo,categoria,titulo,fechainicio,fechafin, localidad,direccion,descripcion,plazastotal,plazasdisponibles,precio,descuento) VALUES (7, 'Actividades', 'Ruta Guiada', 'Descrip', '2014-09-18', '2014-11-01', 'Valladolid', 'Calle 75', 'blablabla',43,15,54,0);
INSERT INTO oferta (codusuario,tipo,categoria,titulo,fechainicio,fechafin, localidad,direccion,descripcion,plazastotal,plazasdisponibles,precio,descuento) VALUES (7, 'Actividades', 'Spa', 'Descrip', '2014-07-24', '2014-09-09', 'Murcia', 'Calle 63', 'blablabla',39,21,77,0);
INSERT INTO oferta (codusuario,tipo,categoria,titulo,fechainicio,fechafin, localidad,direccion,descripcion,plazastotal,plazasdisponibles,precio,descuento) VALUES (7, 'Actividades', 'Ruta Guiada', 'Descrip', '2015-04-10', '2015-04-21', 'Valladolid', 'Calle 91', 'blablabla',81,2,74,0);
INSERT INTO oferta (codusuario,tipo,categoria,titulo,fechainicio,fechafin, localidad,direccion,descripcion,plazastotal,plazasdisponibles,precio,descuento) VALUES (7, 'Actividades', 'Masaje', 'Descrip', '2015-01-10', '2015-02-22', 'Sevilla', 'Calle 7', 'blablabla',38,26,16,0);
INSERT INTO oferta (codusuario,tipo,categoria,titulo,fechainicio,fechafin, localidad,direccion,descripcion,plazastotal,plazasdisponibles,precio,descuento) VALUES (7, 'Actividades', 'Ruta Guiada', 'Descrip', '2015-03-04', '2015-04-01', 'Cuenca', 'Calle 95', 'blablabla',84,12,46,0);
INSERT INTO oferta (codusuario,tipo,categoria,titulo,fechainicio,fechafin, localidad,direccion,descripcion,plazastotal,plazasdisponibles,precio,descuento) VALUES (7, 'Actividades', 'Masaje', 'Descrip', '2014-06-01', '2014-09-19', 'Cadiz', 'Calle 42', 'blablabla',29,2,74,0);
INSERT INTO oferta (codusuario,tipo,categoria,titulo,fechainicio,fechafin, localidad,direccion,descripcion,plazastotal,plazasdisponibles,precio,descuento) VALUES (7, 'Actividades', 'Spa', 'Descrip', '2015-04-06', '2015-07-22', 'Murcia', 'Calle 65', 'blablabla',40,20,99,0);
INSERT INTO oferta (codusuario,tipo,categoria,titulo,fechainicio,fechafin, localidad,direccion,descripcion,plazastotal,plazasdisponibles,precio,descuento) VALUES (7, 'Actividades', 'Masaje', 'Descrip', '2014-11-04', '2014-11-06', 'Bilbao', 'Calle 14', 'blablabla',81,29,69,0);
INSERT INTO oferta (codusuario,tipo,categoria,titulo,fechainicio,fechafin, localidad,direccion,descripcion,plazastotal,plazasdisponibles,precio,descuento) VALUES (7, 'Actividades', 'Paseo a Caballo', 'Descrip', '2014-11-20', '2014-12-28', 'Cadiz', 'Calle 70', 'blablabla',29,11,6,0);
INSERT INTO oferta (codusuario,tipo,categoria,titulo,fechainicio,fechafin, localidad,direccion,descripcion,plazastotal,plazasdisponibles,precio,descuento) VALUES (7, 'Actividades', 'Paseo a Caballo', 'Descrip', '2014-05-08', '2014-05-31', 'Valladolid', 'Calle 77', 'blablabla',77,13,78,0);
INSERT INTO oferta (codusuario,tipo,categoria,titulo,fechainicio,fechafin, localidad,direccion,descripcion,plazastotal,plazasdisponibles,precio,descuento) VALUES (7, 'Actividades', 'Masaje', 'Descrip', '2014-12-24', '2015-02-26', 'Madrid', 'Calle 36', 'blablabla',68,45,97,0);
INSERT INTO oferta (codusuario,tipo,categoria,titulo,fechainicio,fechafin, localidad,direccion,descripcion,plazastotal,plazasdisponibles,precio,descuento) VALUES (7, 'Actividades', 'Masaje', 'Descrip', '2014-07-07', '2014-10-29', 'Cadiz', 'Calle 43', 'blablabla',75,51,81,0);
INSERT INTO oferta (codusuario,tipo,categoria,titulo,fechainicio,fechafin, localidad,direccion,descripcion,plazastotal,plazasdisponibles,precio,descuento) VALUES (7, 'Actividades', 'Spa', 'Descrip', '2015-03-14', '2015-04-24', 'Murcia', 'Calle 77', 'blablabla',79,30,41,0);
INSERT INTO oferta (codusuario,tipo,categoria,titulo,fechainicio,fechafin, localidad,direccion,descripcion,plazastotal,plazasdisponibles,precio,descuento) VALUES (7, 'Actividades', 'Spa', 'Descrip', '2014-07-24', '2014-11-09', 'Barcelona', 'Calle 87', 'blablabla',50,43,35,0);


INSERT INTO oferta (codusuario,tipo,categoria,titulo,fechainicio,fechafin, localidad,direccion,descripcion,plazastotal,plazasdisponibles,precio,descuento) VALUES (10, 'Entradas', 'Concierto', 'Descrip', '2014-03-10', '2015-02-11', 'Murcia', 'Calle 51', 'blablabla',55,23,35,0);
INSERT INTO oferta (codusuario,tipo,categoria,titulo,fechainicio,fechafin, localidad,direccion,descripcion,plazastotal,plazasdisponibles,precio,descuento) VALUES (10, 'Entradas', 'Cine', 'Descrip', '2014-03-10', '2015-06-15', 'Barcelona', 'Calle 5', 'blablabla',50,9,39,0);
INSERT INTO oferta (codusuario,tipo,categoria,titulo,fechainicio,fechafin, localidad,direccion,descripcion,plazastotal,plazasdisponibles,precio,descuento) VALUES (10, 'Entradas', 'Cine', 'Descrip', '2014-03-10', '2014-12-07', 'Cuenca', 'Calle 59', 'blablabla',97,8,78,0);
INSERT INTO oferta (codusuario,tipo,categoria,titulo,fechainicio,fechafin, localidad,direccion,descripcion,plazastotal,plazasdisponibles,precio,descuento) VALUES (10, 'Entradas', 'Concierto', 'Descrip', '2014-11-08', '2014-12-10', 'Bilbao', 'Calle 81', 'blablabla',93,6,23,0);
INSERT INTO oferta (codusuario,tipo,categoria,titulo,fechainicio,fechafin, localidad,direccion,descripcion,plazastotal,plazasdisponibles,precio,descuento) VALUES (10, 'Entradas', 'Concierto', 'Descrip', '2014-03-10', '2015-03-12', 'Sevilla', 'Calle 24', 'blablabla',78,8,13,0);
INSERT INTO oferta (codusuario,tipo,categoria,titulo,fechainicio,fechafin, localidad,direccion,descripcion,plazastotal,plazasdisponibles,precio,descuento) VALUES (10, 'Entradas', 'Concierto', 'Descrip', '2014-10-13', '2014-10-14', 'Cadiz', 'Calle 32', 'blablabla',99,50,62,0);
INSERT INTO oferta (codusuario,tipo,categoria,titulo,fechainicio,fechafin, localidad,direccion,descripcion,plazastotal,plazasdisponibles,precio,descuento) VALUES (10, 'Entradas', 'Cine', 'Descrip', '2014-07-02', '2014-09-24', 'Bilbao', 'Calle 96', 'blablabla',74,64,25,0);
INSERT INTO oferta (codusuario,tipo,categoria,titulo,fechainicio,fechafin, localidad,direccion,descripcion,plazastotal,plazasdisponibles,precio,descuento) VALUES (10, 'Entradas', 'Teatro', 'Descrip', '2014-10-12', '2014-11-16', 'Bilbao', 'Calle 86', 'blablabla',72,53,7,0);
INSERT INTO oferta (codusuario,tipo,categoria,titulo,fechainicio,fechafin, localidad,direccion,descripcion,plazastotal,plazasdisponibles,precio,descuento) VALUES (10, 'Entradas', 'Teatro', 'Descrip', '2014-03-10', '2015-01-26', 'Barcelona', 'Calle 4', 'blablabla',69,32,7,0);
INSERT INTO oferta (codusuario,tipo,categoria,titulo,fechainicio,fechafin, localidad,direccion,descripcion,plazastotal,plazasdisponibles,precio,descuento) VALUES (10, 'Entradas', 'Cine', 'Descrip', '2014-03-10', '2015-03-08', 'Bilbao', 'Calle 61', 'blablabla',34,2,51,0);
INSERT INTO oferta (codusuario,tipo,categoria,titulo,fechainicio,fechafin, localidad,direccion,descripcion,plazastotal,plazasdisponibles,precio,descuento) VALUES (14, 'Entradas', 'Cine', 'Descrip', '2014-05-26', '2014-09-13', 'Granada', 'Calle 53', 'blablabla',85,46,44,0);
INSERT INTO oferta (codusuario,tipo,categoria,titulo,fechainicio,fechafin, localidad,direccion,descripcion,plazastotal,plazasdisponibles,precio,descuento) VALUES (14, 'Entradas', 'Cine', 'Descrip', '2014-03-10', '2015-05-12', 'Cadiz', 'Calle 3', 'blablabla',73,64,79,0);
INSERT INTO oferta (codusuario,tipo,categoria,titulo,fechainicio,fechafin, localidad,direccion,descripcion,plazastotal,plazasdisponibles,precio,descuento) VALUES (14, 'Entradas', 'Cine', 'Descrip', '2014-08-14', '2014-12-11', 'Granada', 'Calle 42', 'blablabla',30,3,26,0);
INSERT INTO oferta (codusuario,tipo,categoria,titulo,fechainicio,fechafin, localidad,direccion,descripcion,plazastotal,plazasdisponibles,precio,descuento) VALUES (14, 'Entradas', 'Teatro', 'Descrip', '2014-03-10', '2015-04-01', 'Cuenca', 'Calle 90', 'blablabla',43,1,72,0);
INSERT INTO oferta (codusuario,tipo,categoria,titulo,fechainicio,fechafin, localidad,direccion,descripcion,plazastotal,plazasdisponibles,precio,descuento) VALUES (19, 'Entradas', 'Concierto', 'Descrip', '2014-06-16', '2014-08-02', 'Bilbao', 'Calle 85', 'blablabla',55,39,55,0);
INSERT INTO oferta (codusuario,tipo,categoria,titulo,fechainicio,fechafin, localidad,direccion,descripcion,plazastotal,plazasdisponibles,precio,descuento) VALUES (19, 'Entradas', 'Teatro', 'Descrip', '2014-03-10', '2015-02-10', 'Cadiz', 'Calle 88', 'blablabla',68,13,93,0);
INSERT INTO oferta (codusuario,tipo,categoria,titulo,fechainicio,fechafin, localidad,direccion,descripcion,plazastotal,plazasdisponibles,precio,descuento) VALUES (19, 'Entradas', 'Teatro', 'Descrip', '2014-10-12', '2014-11-06', 'Bilbao', 'Calle 9', 'blablabla',53,36,40,0);
INSERT INTO oferta (codusuario,tipo,categoria,titulo,fechainicio,fechafin, localidad,direccion,descripcion,plazastotal,plazasdisponibles,precio,descuento) VALUES (19, 'Entradas', 'Cine', 'Descrip', '2014-09-25', '2014-12-25', 'Valladolid', 'Calle 87', 'blablabla',89,62,24,0);


INSERT INTO oferta (codusuario,tipo,categoria,titulo,fechainicio,fechafin, localidad,direccion,descripcion,plazastotal,plazasdisponibles,precio,descuento) VALUES (20, 'Restaurantes', '', 'Descrip', '2014-08-15', '2014-11-28', 'Granada', 'Calle 57', 'blablabla',32,31,93,13);
INSERT INTO oferta (codusuario,tipo,categoria,titulo,fechainicio,fechafin, localidad,direccion,descripcion,plazastotal,plazasdisponibles,precio,descuento) VALUES (20, 'Restaurantes', '', 'Descrip', '2014-03-10', '2015-01-20', 'Valladolid', 'Calle 85', 'blablabla',45,39,69,3);
INSERT INTO oferta (codusuario,tipo,categoria,titulo,fechainicio,fechafin, localidad,direccion,descripcion,plazastotal,plazasdisponibles,precio,descuento) VALUES (20, 'Restaurantes', '', 'Descrip', '2014-03-10', '2015-04-11', 'Sevilla', 'Calle 6', 'blablabla',81,64,68,10);
INSERT INTO oferta (codusuario,tipo,categoria,titulo,fechainicio,fechafin, localidad,direccion,descripcion,plazastotal,plazasdisponibles,precio,descuento) VALUES (20, 'Restaurantes', '', 'Descrip', '2014-03-10', '2015-07-15', 'Barcelona', 'Calle 20', 'blablabla',65,52,93,22);
INSERT INTO oferta (codusuario,tipo,categoria,titulo,fechainicio,fechafin, localidad,direccion,descripcion,plazastotal,plazasdisponibles,precio,descuento) VALUES (20, 'Restaurantes', '', 'Descrip', '2014-03-10', '2015-04-03', 'Granada', 'Calle 68', 'blablabla',61,25,21,23);
INSERT INTO oferta (codusuario,tipo,categoria,titulo,fechainicio,fechafin, localidad,direccion,descripcion,plazastotal,plazasdisponibles,precio,descuento) VALUES (20, 'Restaurantes', '', 'Descrip', '2014-03-10', '2015-05-17', 'Cadiz', 'Calle 93', 'blablabla',87,33,97,23);
INSERT INTO oferta (codusuario,tipo,categoria,titulo,fechainicio,fechafin, localidad,direccion,descripcion,plazastotal,plazasdisponibles,precio,descuento) VALUES (20, 'Restaurantes', '', 'Descrip', '2014-11-20', '2014-12-25', 'Cuenca', 'Calle 89', 'blablabla',90,21,36,10);
INSERT INTO oferta (codusuario,tipo,categoria,titulo,fechainicio,fechafin, localidad,direccion,descripcion,plazastotal,plazasdisponibles,precio,descuento) VALUES (20, 'Restaurantes', '', 'Descrip', '2014-07-14', '2014-07-16', 'Bilbao', 'Calle 61', 'blablabla',37,1,54,18);
INSERT INTO oferta (codusuario,tipo,categoria,titulo,fechainicio,fechafin, localidad,direccion,descripcion,plazastotal,plazasdisponibles,precio,descuento) VALUES (20, 'Restaurantes', '', 'Descrip', '2014-06-26', '2014-09-06', 'Cadiz', 'Calle 27', 'blablabla',77,64,66,13);
INSERT INTO oferta (codusuario,tipo,categoria,titulo,fechainicio,fechafin, localidad,direccion,descripcion,plazastotal,plazasdisponibles,precio,descuento) VALUES (20, 'Restaurantes', '', 'Descrip', '2014-03-10', '2015-04-25', 'Cadiz', 'Calle 95', 'blablabla',91,20,83,13);
INSERT INTO oferta (codusuario,tipo,categoria,titulo,fechainicio,fechafin, localidad,direccion,descripcion,plazastotal,plazasdisponibles,precio,descuento) VALUES (20, 'Restaurantes', '', 'Descrip', '2014-03-10', '2015-01-25', 'Cadiz', 'Calle 33', 'blablabla',30,18,82,15);
INSERT INTO oferta (codusuario,tipo,categoria,titulo,fechainicio,fechafin, localidad,direccion,descripcion,plazastotal,plazasdisponibles,precio,descuento) VALUES (20, 'Restaurantes', '', 'Descrip', '2014-03-10', '2015-02-25', 'Bilbao', 'Calle 15', 'blablabla',52,25,27,21);
INSERT INTO oferta (codusuario,tipo,categoria,titulo,fechainicio,fechafin, localidad,direccion,descripcion,plazastotal,plazasdisponibles,precio,descuento) VALUES (20, 'Restaurantes', '', 'Descrip', '2014-05-19', '2014-06-05', 'Granada', 'Calle 68', 'blablabla',84,25,84,13);
INSERT INTO oferta (codusuario,tipo,categoria,titulo,fechainicio,fechafin, localidad,direccion,descripcion,plazastotal,plazasdisponibles,precio,descuento) VALUES (20, 'Restaurantes', '', 'Descrip', '2014-06-12', '2014-09-04', 'Murcia', 'Calle 29', 'blablabla',27,19,72,20);
INSERT INTO oferta (codusuario,tipo,categoria,titulo,fechainicio,fechafin, localidad,direccion,descripcion,plazastotal,plazasdisponibles,precio,descuento) VALUES (21, 'Restaurantes', '', 'Descrip', '2014-08-20', '2014-08-25', 'Sevilla', 'Calle 73', 'blablabla',46,14,67,23);
INSERT INTO oferta (codusuario,tipo,categoria,titulo,fechainicio,fechafin, localidad,direccion,descripcion,plazastotal,plazasdisponibles,precio,descuento) VALUES (21, 'Restaurantes', '', 'Descrip', '2014-08-19', '2014-09-30', 'Madrid', 'Calle 31', 'blablabla',78,74,98,3);
INSERT INTO oferta (codusuario,tipo,categoria,titulo,fechainicio,fechafin, localidad,direccion,descripcion,plazastotal,plazasdisponibles,precio,descuento) VALUES (21, 'Restaurantes', '', 'Descrip', '2014-07-07', '2014-09-18', 'Cadiz', 'Calle 98', 'blablabla',29,28,29,5);
INSERT INTO oferta (codusuario,tipo,categoria,titulo,fechainicio,fechafin, localidad,direccion,descripcion,plazastotal,plazasdisponibles,precio,descuento) VALUES (21, 'Restaurantes', '', 'Descrip', '2014-03-10', '2015-06-04', 'Bilbao', 'Calle 94', 'blablabla',33,23,49,22);
INSERT INTO oferta (codusuario,tipo,categoria,titulo,fechainicio,fechafin, localidad,direccion,descripcion,plazastotal,plazasdisponibles,precio,descuento) VALUES (21, 'Restaurantes', '', 'Descrip', '2014-03-10', '2015-03-14', 'Cuenca', 'Calle 99', 'blablabla',60,26,44,24);
INSERT INTO oferta (codusuario,tipo,categoria,titulo,fechainicio,fechafin, localidad,direccion,descripcion,plazastotal,plazasdisponibles,precio,descuento) VALUES (21, 'Restaurantes', '', 'Descrip', '2014-03-10', '2015-05-19', 'Murcia', 'Calle 63', 'blablabla',27,4,11,19);
INSERT INTO oferta (codusuario,tipo,categoria,titulo,fechainicio,fechafin, localidad,direccion,descripcion,plazastotal,plazasdisponibles,precio,descuento) VALUES (21, 'Restaurantes', '', 'Descrip', '2014-07-23', '2014-09-18', 'Murcia', 'Calle 18', 'blablabla',55,1,28,9);
INSERT INTO oferta (codusuario,tipo,categoria,titulo,fechainicio,fechafin, localidad,direccion,descripcion,plazastotal,plazasdisponibles,precio,descuento) VALUES (24, 'Restaurantes', '', 'Descrip', '2014-08-04', '2014-10-16', 'Murcia', 'Calle 95', 'blablabla',80,45,85,8);
INSERT INTO oferta (codusuario,tipo,categoria,titulo,fechainicio,fechafin, localidad,direccion,descripcion,plazastotal,plazasdisponibles,precio,descuento) VALUES (24, 'Restaurantes', '', 'Descrip', '2014-07-25', '2014-09-07', 'Murcia', 'Calle 65', 'blablabla',57,14,41,3);
INSERT INTO oferta (codusuario,tipo,categoria,titulo,fechainicio,fechafin, localidad,direccion,descripcion,plazastotal,plazasdisponibles,precio,descuento) VALUES (24, 'Restaurantes', '', 'Descrip', '2014-03-10', '2015-04-06', 'Granada', 'Calle 26', 'blablabla',90,27,77,14);
INSERT INTO oferta (codusuario,tipo,categoria,titulo,fechainicio,fechafin, localidad,direccion,descripcion,plazastotal,plazasdisponibles,precio,descuento) VALUES (24, 'Restaurantes', '', 'Descrip', '2014-03-10', '2015-03-14', 'Cuenca', 'Calle 35', 'blablabla',68,4,45,4);
INSERT INTO oferta (codusuario,tipo,categoria,titulo,fechainicio,fechafin, localidad,direccion,descripcion,plazastotal,plazasdisponibles,precio,descuento) VALUES (24, 'Restaurantes', '', 'Descrip', '2014-09-09', '2014-12-24', 'Granada', 'Calle 97', 'blablabla',27,25,46,17);
INSERT INTO oferta (codusuario,tipo,categoria,titulo,fechainicio,fechafin, localidad,direccion,descripcion,plazastotal,plazasdisponibles,precio,descuento) VALUES (24, 'Restaurantes', '', 'Descrip', '2014-03-10', '2015-05-28', 'Cuenca', 'Calle 29', 'blablabla',74,8,75,11);


