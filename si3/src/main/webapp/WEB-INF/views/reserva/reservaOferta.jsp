<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<tiles:insertDefinition name="defaultTemplategeneral">
	<tiles:putAttribute name="body">

		<div class="center_content">
			<div class="center_title_bar">
				Reserva de Oferta: <b> ${titulo}</b>
			</div>

			<div class="prod_box_big">
				<div class="top_prod_box_big"></div>
				<div class="center_prod_box_big">
					<div align="center">
						<security:authorize access="isAuthenticated()">
							Usuario: <security:authentication property="principal.username" />, indique las plazas y la fecha que desea para la reserva de la oferta: <b><u>${titulo}</b>
							</u>
						</security:authorize>
						<br />
						<br />${mensaje}<br /> <br />

						<form:form method="post" action="/reserva/reservaOferta"
							modelAttribute="reservation">
							<table>

								<tr>
									<td>Reservar plazas:</td>
									<td><form:input path="plazasReservadas" /></td>
									<td><form:errors path="plazasReservadas" cssClass="error" /></td>
								</tr>
								<tr>
									<td>Fecha Reserva:</td>
									<td><form:input path="fechaReserva" /></td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td><input type="submit" value="Confirmar" />&nbsp;&nbsp;<input
										type="button" onclick="history.back()" name="return"
										value="Volver"></td>
								</tr>
							</table>
						</form:form>
					</div>
					<div class="top_prod_box_big"></div>
					<div class="bottom_prod_box_big"></div>
				</div>
			</div>
		</div>
	</tiles:putAttribute>
</tiles:insertDefinition>