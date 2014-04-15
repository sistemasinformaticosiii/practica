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
			<form:form method="post" action="/si3/insertOferta" modelAttribute="oferta">
				<table>
					<tr>
						<td>Cod Usuario :</td>
						<td><form:input path="codUsuario" /></td>
					</tr>
					<tr>
      					<td>Tipo :</td>
      					<td><form:select path="tipo" items="${map.tipoList}" /></td>
     				</tr>
					<tr>
						<td>Categoria :</td>
						<td><form:input path="categoria" /></td>
					</tr>
					<tr>
						<td>Titulo :</td>
						<td><form:input path="titulo" /></td>
					</tr>
					<tr>
						<td>Fecha Inicio :</td>
						<td><form:input path="fechaInicio" /></td>
					</tr>
					<tr>
						<td>Fecha Fin :</td>
						<td><form:input path="fechaFin" /></td>
					</tr>
					<tr>
						<td>Localidad :</td>
						<td><form:input path="localidad" /></td>
					</tr>
					<tr>
						<td>direccion :</td>
						<td><form:input path="direccion" /></td>
					</tr>
     				<tr>
      					<td>Descripcion :</td>
      					<td><form:input path="descripcion" /></td>
     				</tr>
					<tr>
						<td>Plazas Totales :</td>
						<td><form:input path="plazasTotal" /></td>
					</tr>
					<tr>
						<td>Plazas Disponibles :</td>
						<td><form:input path="plazasDisponibles" /></td>
					</tr>
					<tr>
						<td>Precio :</td>
						<td><form:input path="precio" /></td>
					</tr>
					<tr>
						<td>Descuento :</td>
						<td><form:input path="descuento" /></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td><input type="submit" value="Guardar" /></td>
					</tr>
					<tr>
						
						<td colspan="2"><a href="getList">Ver lista de usuarios</a></td>
					</tr>
					<tr>	
						<td colspan="2"><a href="getListOffer">Ver lista de ofertas</a></td>
					</tr>
				</table>
			</form:form>
		</div>
	</center>
</body>
</html>