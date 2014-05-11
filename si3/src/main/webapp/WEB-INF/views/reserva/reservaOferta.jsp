<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<tiles:insertDefinition name="defaultTemplategeneral">
	<tiles:putAttribute name="body">

	
	<center>
		<br /> <br /> <br /> <b>Reserva de Oferta</b> <br />
		<br /> <br />${mensaje}<br /> <br />
		<security:authorize access="isAuthenticated()">
		<security:authentication property="principal.username" /> está a punto de realizar la reserva para ${titulo}:
		
		</security:authorize>
		<br />
		<div>
			<form:form method="post" action="/si3/reserva/reservaOferta" modelAttribute="reservation">
				<table>
					
					<tr>
						<td>Plazas :</td>
						<td><form:input path="plazasReservadas" /></td>
						<td><form:errors path="plazasReservadas" cssClass="error" /></td>
					</tr>
					<tr>
						<td>Fecha :</td>
						<td><form:input path="fechaReserva" /></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td><input type="submit" value="Confirmar" /></td>
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
</tiles:putAttribute>
</tiles:insertDefinition>