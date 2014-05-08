<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<tiles:insertDefinition name="adminGestionSuscripciones">
	<tiles:putAttribute name="body">

	<center>
		<div>
			<form:form method="post" action="/si3/insertSubscription" modelAttribute="subscription">
			<fieldset>
				<legend>Suscripción a boletín de noticias</legend>
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
				</fieldset>
			</form:form>
		</div>
	</center>

</tiles:putAttribute>
</tiles:insertDefinition>