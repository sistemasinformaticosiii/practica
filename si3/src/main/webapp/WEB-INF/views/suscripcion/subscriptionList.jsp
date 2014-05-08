<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<tiles:insertDefinition name="adminGestionSuscripciones">
	<tiles:putAttribute name="body">
	
	<center>
		<br /> <br /> <br /> <b>Lista de Subscripciones </b><br /> <br />
			
		

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
</tiles:putAttribute>
</tiles:insertDefinition>