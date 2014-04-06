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
		<br /> <br /> <br /> <b>Lista Usuarios | Practica </b><br /> <br />
			
		

		<table border="1">
			<tr>
				<td class="heading">User Id</td>
				<td class="heading">Nombre</td>
				<td class="heading">Apellidos</td>
				<td class="heading">Localidad</td>
				<td class="heading">telefono</td>
				<td class="heading">email</td>
				<td class="heading">perfil</td>
				<td class="heading">pass</td>
				<td class="heading">Editar</td>
				<td class="heading">Borrar</td>
			</tr>
			<c:forEach var="user" items="${userList}">
				<tr>
					<td>${user.userId}</td>
					<td>${user.nombre}</td>
					<td>${user.apellidos}</td>
					<td>${user.localidad}</td>
					<td>${user.telefono}</td>
					<td>${user.email}</td>
					<td>${user.perfil}</td>
					<td>${user.pass}</td>
					<td><a href="edit?id=${user.userId}">Editar</a></td>
					<td><a href="/si3/delete?id=${user.userId}">Borrar</a></td>
				</tr>
			</c:forEach>
			<tr><td colspan="8"><a href="register">Añadir Usuario</a></td></tr>
		</table>

	</center>
</body>
</html>