<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<tiles:insertDefinition name="defaultTemplategeneral">
	<tiles:putAttribute name="body">

		<div class="center_content">
			<div class="center_title_bar">
				<spring:message code="reserva.titulo"/>: <b> ${titulo}</b>
			</div>

			<div class="prod_box_big">
				<div class="top_prod_box_big"></div>
				<div class="center_prod_box_big">
					<div align="center">
						<security:authorize access="isAuthenticated()">
							<spring:message code="reserva.usuario"/>: <security:authentication property="principal.username" />, <spring:message code="reserva.mensaje"/>: <b><u>${titulo}</b>
							</u>
						</security:authorize>
						<br />
						<br />${mensaje}<br /> <br />

						<form:form method="post" action="/cliente/reserva/reservaOferta"
							modelAttribute="reservation">
							<table>

								<tr>
									<td><spring:message code="reserva.labelreservarplazas"/>:</td>
									<td><form:input path="plazasReservadas" /></td>
									<td><form:errors path="plazasReservadas" cssClass="error" /></td>
								</tr>
								<tr>
									<td><spring:message code="reserva.labelfechareserva"/>:</td>
									<td><form:input path="fechaReserva" /></td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td><input type="submit" value="<spring:message code="reserva.botonconfirmar"/>" />&nbsp;&nbsp;
									<input type="button" onclick="javascript:history.back()" name="return" value="<spring:message code="reserva.botonvolver"/>"></td>
 									
 									
 									
									
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