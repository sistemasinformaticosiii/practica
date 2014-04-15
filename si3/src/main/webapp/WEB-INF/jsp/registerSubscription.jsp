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
			<form:form method="post" action="/si3/insertSubscription" modelAttribute="subscription">
				<table>
					<tr>
						<td>Cod Usuario :</td>
						<td><form:input path="userId" /></td>
					</tr>
					<tr>
      					<td>Tipo :</td>
      					<td><form:select path="tipoSubscription" items="${map.tipoList}" /></td>
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
					<tr>	
						<td colspan="2"><a href="getListSubscription">Ver lista de Subscripciones</a></td>
					</tr>					
				</table>
			</form:form>
		</div>
	</center>
</body>
</html>