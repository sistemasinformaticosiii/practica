INSERT INTO user values('1','Juan','García','Vigo','6000000','pepe@hotmail.com', 'Administrador', 'juan');
INSERT INTO user values('2','Andres','Gil','Vigo','6000000','andresgil@gmail.com', 'Administrador', 'admin');
INSERT INTO user values('3','Miguel Angel','Fernandez','Toledo','6000000','mfsegura@gmail.com', 'Administrador', 'admin');
INSERT INTO user values('4','Miguel Angel','Fernandez','Toledo','6000000','josemanuelroma@gmail.com', 'Administrador', 'admin');


INSERT INTO oferta values(0,1,'Restaurantes','menu','Cena romántica', '2014-04-10' , '2014-04-30', 'Madrid', 'c/Gran Vía, 5', 'Cena romántica para dos, con espectáculo. Dos primeros y dos segundos, incluido postre', 10, 5, 37, 5);
INSERT INTO oferta values(1,1,'Actividades','comida','Ruta a Caballo', '2014-04-10' , '2014-04-30', 'Madrid', 'c/Gran Vía, 5', 'Ruta a caballo por la Sierra de Gredos. Duración: 1 hora. Todo el material está incluido en la oferta', 10, 5, 37, 5);
INSERT INTO oferta values(3,1,'Entradas','teatro','Circo del Sol', '2014-04-10' , '2014-04-30', 'Madrid', 'c/Gran Vía, 5', 'Entradas Circo del Sol', 10, 5, 37, 5);
INSERT INTO oferta values(4,1,'Entradas','cine','El Señor de los anillos', '2014-04-10' , '2014-04-30', 'Madrid', 'c/Gran Vía, 5', 'El Señor de los Anillos', 10, 5, 37, 5);

INSERT INTO subscription values('0', '4', 'Restaurantes');
INSERT INTO subscription values('1', '4', 'Entradas');
INSERT INTO subscription values('2', '3', 'Entradas');
