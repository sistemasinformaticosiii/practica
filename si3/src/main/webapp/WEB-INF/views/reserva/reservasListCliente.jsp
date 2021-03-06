<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<tiles:insertDefinition name="defaultTemplategeneral">
	<tiles:putAttribute name="body">

		<div class="center_content">
			<div class="center_title_bar">
				<spring:message code="listareservas.titulo"/>: <b> ${numeroReservas}</b>
			</div>

			<div class="prod_box_big">
				<div class="top_prod_box_big"></div>
				<div class="center_prod_box_big">

					<div align="center">
						<table border="2">
							<c:choose>
								<c:when test="${not empty listaResultados}">
									<tr>
										<td class="heading"><spring:message code="listareservas.fechareserva"/></td>
										<td class="heading"><spring:message code="listareservas.plazasreservadas"/></td>
										<td class="heading"><spring:message code="listareservas.oferta"/></td>
									</tr>
									<c:forEach var="reserva" items="${listaResultados}">
										<tr>
											<td>${reserva.key.fechaReserva}</td>
											<td align="center">${reserva.key.plazasReservadas}</td>
											<td>${reserva.value.titulo}</td>
											<td><a
												href="<c:url value="deletereserva?id=${reserva.key.reservationId}"/>"><spring:message code="listareservas.borrar"/></a></td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<b><spring:message code="listareservas.mensajesinreservas"/></b>
								</c:otherwise>
							</c:choose>
						</table>
					</div>
					<div class="top_prod_box_big"></div>
					<div class="bottom_prod_box_big"></div>
				</div>
			</div>
		</div>

	</tiles:putAttribute>
</tiles:insertDefinition>
