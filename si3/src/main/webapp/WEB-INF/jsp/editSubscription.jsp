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
		<br /> <br /> <br /> <b>Editar Subscripcion </b><br /> <br />
		<div>
			<form:form method="post" action="/si3/updateSubscription" modelAttribute="subscription">
				<table>
					<tr>
						<td>Cod Usuario :</td>
						<td><form:input path="userId" value="${map.subscription.userId}" />
						</td>
					</tr>
					<tr>
						<td>Tipo :</td>
						<td><form:input path="tipoSubscription" value="${map.subscription.tipoSubscription}" />
						</td>
					</tr>					
					<tr>
						<td>&nbsp;</td>
						<td><input type="submit" value="Guardar" />
						</td>
					</tr>
				</table>
				<form:hidden path="subscriptionId" value="${map.subscription.subscriptionId}" />

			</form:form>
		</div>
	</center>
</body>
</html>