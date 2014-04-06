<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Practica | Spring DI Hello World</title>
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
	text-align: left;
}

.heading {
	font-size: 18px;
	color: white;
	font: bold;
	background-color: orange;
	border: thick;
}
</style>
</head>
<body>
	<center>
		<br /> <br /> <br /> <b>Practica | SISTEMAS INFORMATICOS III </b> <br />
		<br />
		<div>
			<form:form method="post" action="/si3/insert" modelAttribute="user">
				<table>
					<tr>
						<td>Nombre :</td>
						<td><form:input path="nombre" /></td>
					</tr>
					<tr>
						<td>Apellidos :</td>
						<td><form:input path="apellidos" /></td>
					</tr>
					<tr>
						<td>Localidad :</td>
						<td><form:input path="localidad" /></td>
					</tr>
					<tr>
						<td>Telefono :</td>
						<td><form:input path="telefono" /></td>
					</tr>
					<tr>
						<td>email :</td>
						<td><form:input path="email" /></td>
					</tr>
					<tr>
						<td>perfil :</td>
						<td><form:input path="perfil" /></td>
					</tr>
					<tr>
						<td>password :</td>
						<td><form:input path="pass" /></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td><input type="submit" value="Guardar" /></td>
					</tr>
					<tr>
						
						<td colspan="2"><a href="getList">Ver lista de usuarios</a></td>
					</tr>
				</table>
			</form:form>
		</div>
	</center>
</body>
</html>