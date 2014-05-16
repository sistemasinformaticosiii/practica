<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib  uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<tiles:insertDefinition name="defaultTemplategeneral">
	<tiles:putAttribute name="body">

	<div class="center_content">
	<div class="center_title_bar">Editar Reserva</div>
	
		<div>
			<form:form method="post" action='/updateReserva' modelAttribute="reservation">
				<table>
					<tr>
						<td>Fecha Reserva :</td>
						<td><form:input path="fechaReserva" value="${map.reservation.fechaReserva}" />
						</td>
					</tr>
					<tr>
						<td>Plazas Reservadas :</td>
						<td><form:input path="plazasReservadas" value="${map.reservation.plazasReservadas}" />
						</td>
					</tr>															
					<tr>
						<td>&nbsp;</td>
						<td><input type="submit" value="Guardar">&nbsp;&nbsp;<input type="button" onclick="history.back()" name="return" value="Volver">
						</td>
					</tr>
				</table>
				<form:hidden path="reservationId" value="${map.reservation.reservationId}"/>
				<form:hidden path="userId" value="${map.reservation.userId}" />
				<form:hidden path="offerId" value="${map.reservation.offerId}" />
			</form:form>
		</div>
	</div>
    </tiles:putAttribute>
</tiles:insertDefinition>