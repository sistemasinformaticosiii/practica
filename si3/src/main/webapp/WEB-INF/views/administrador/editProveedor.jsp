<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
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
	background-color: orange;
	border: thick;
}
</style>
</head>
<body>
	<center>
		<br /> <br /> <br /> <b>Editar Proveedor </b><br /> <br />
		<div>
			<form:form method="post" action="/si3/update" modelAttribute="user">
				<table>
					<tr>
						<td>Nombre :</td>
						<td><form:input path="nombre" value="${map.user.nombre}" />
						</td>
					</tr>
					<tr>
						<td>Apellidos :</td>
						<td><form:input path="apellidos" value="${map.user.apellidos}" />
						</td>
					</tr>
					<tr>
						<td>Localidad :</td>
						<td><form:input path="localidad" value="${map.user.localidad}" />
						</td>
					</tr>
					<tr>
						<td>Telefono :</td>
						<td><form:input path="telefono" value="${map.user.telefono}" />
						</td>
					</tr>
					<tr>
						<td>email :</td>
						<td><form:input path="email" value="${map.user.email}" />
						</td>
					</tr>
					<tr>
						<td>perfil :</td>
						<td><form:input path="perfil" value="${map.user.perfil}" />
						</td>
					</tr>
					<tr>
						<td>password :</td>
						<td><form:input path="pass" value="${map.user.pass}" />
						</td>
					</tr>					
					<tr>
						<td>&nbsp;</td>
						<td><input type="submit" value="Guardar" />
						</td>
					</tr>
				</table>
				<form:hidden path="userId" value="${map.user.userId}" />

			</form:form>
		</div>
	</center>
</body>
</html>