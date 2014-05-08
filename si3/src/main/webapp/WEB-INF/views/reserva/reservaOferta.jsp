<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<tiles:insertDefinition name="defaultTemplategeneral">
	<tiles:putAttribute name="body">

	<center>
		<br /> <br /> <br /> <b>Reserva de Oferta</b> <br />
		<br />
		<div>
			<form:form method="post" action="/si3/reserva" modelAttribute="reservation">
				<table>
					<tr>
						<td>Cod Usuario :</td>
						<td><form:input path="userId" /></td>
					</tr>
					<tr>
						<td>Plazas :</td>
						<td><form:input path="plazasReservadas" /></td>
					</tr>
					<tr>
						<td>Fecha :</td>
						<td><form:input path="fechaReserva" /></td>
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
</tiles:putAttribute>
</tiles:insertDefinition>