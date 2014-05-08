<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib  uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<tiles:insertDefinition name="adminGestionSuscripciones">
	<tiles:putAttribute name="body">

	<center>
		<br /> <br /> <br /> <b>Editar Subscripcion </b><br /> <br />
		<div>
			<form:form method="post" action="<c:url value="updateSubscription"/>" modelAttribute="subscription">
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
						<td><input type="submit" value="Guardar">&nbsp;&nbsp;<input type="button" onclick="history.back()" name="return" value="Volver">
						</td>
					</tr>
				</table>
				<form:hidden path="subscriptionId" value="${map.subscription.subscriptionId}" />

			</form:form>
		</div>
	</center>
    </tiles:putAttribute>
</tiles:insertDefinition>