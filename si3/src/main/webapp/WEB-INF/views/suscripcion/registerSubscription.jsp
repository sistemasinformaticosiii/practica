<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<tiles:insertDefinition name="defaultTemplategeneral">
	<tiles:putAttribute name="center">

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
</tiles:putAttribute>
</tiles:insertDefinition>