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
		<br /> <br /> <br /> <b>Lista Subscripciones | Practica </b><br /> <br />
			
		

		<table border="1">
			<tr>
				<td class="heading">Cod Subscripcion</td>
				<td class="heading">Cod usuario</td>
				<td class="heading">Tipo</td>
				<td class="heading">Editar</td>
				<td class="heading">Borrar</td>
			</tr>
			<c:forEach var="subscription" items="${subscriptionList}">
				<tr>
					<td>${subscription.subscriptionId}</td>
					<td>${subscription.userId}</td>
					<td>${subscription.tipoSubscription}</td>
					<td><a href="editSubscription?id=${subscription.subscriptionId}">Editar</a></td>
					<td><a href="/si3/deleteSubscription?id=${subscription.subscriptionId}">Borrar</a></td>
				</tr>
			</c:forEach>
			<tr><td colspan="8"><a href="registerSubscription">Añadir Suscripcion</a></td></tr>
		</table>

	</center>
</body>
</html>