<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Practica | SISTEMAS INFORMATICOS III</title>
<style>
body {
	font-size: 20px;
	color: teal;
	font-family: Calibri;
}

td {
	font-size: 15px;
	color: black;
	width: 100px;
	height: 22px;
	text-align: center;
}
.heading {
	font-size: 18px;
	color: white;
	font: bold;
	background-color: blue;
	border: thick;
}
</style>
</head>
<body>
	<center>
		<br /> <br /> <br /> <b>Lista de Ofertas | Practica </b><br /> <br />
			
		

		<table border="1">
			<tr>
				<td class="heading">Cod Oferta</td>
				<td class="heading">Cod Usuario</td>
				<td class="heading">Tipo</td>
				<td class="heading">Categoria</td>
				<td class="heading">Titulo</td>
				<td class="heading">Fecha Inicio</td>
				<td class="heading">Fecha Fin</td>
				<td class="heading">Localidad</td>
				<td class="heading">Direccion</td>
				<td class="heading">Descripcion</td>
				<td class="heading">Plazas totales</td>
				<td class="heading">Plazas disponibles</td>
				<td class="heading">Precio</td>
				<td class="heading">Descuento</td>
				<td class="heading">Editar</td>
				<td class="heading">Borrar</td>
			</tr>
			<c:forEach var="oferta" items="${ofertaList}">
				<tr>
					<td>${oferta.codOferta}</td>
					<td>${oferta.codUsuario}</td>
					<td>${oferta.tipo}</td>
					<td>${oferta.categoria}</td>
					<td>${oferta.titulo}</td>
					<td>${oferta.fechaInicio}</td>
					<td>${oferta.fechaFin}</td>
					<td>${oferta.localidad}</td>
					<td>${oferta.direccion}</td>
					<td>${oferta.descripcion}</td>
					<td>${oferta.plazasTotal}</td>
					<td>${oferta.plazasDisponibles}</td>
					<td>${oferta.precio}</td>
					<td>${oferta.descuento}</td>
					<td><a href="editOferta?id=${oferta.codOferta}">Editar</a></td>
					<td><a href="/si3/deleteOferta?id=${oferta.codOferta}">Borrar</a></td>
					<td><a href="/si3/reservaOferta?id=${oferta.codOferta}">Reservar</a></td>
				</tr>
			</c:forEach>
			<tr><td colspan="8"><a href="registerOferta">Añadir Oferta</a></td></tr>
		</table>

	</center>
</body>
</html>