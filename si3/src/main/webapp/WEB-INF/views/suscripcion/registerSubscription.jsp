<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<tiles:insertDefinition name="defaultTemplategeneral">
	<tiles:putAttribute name="body">

		<body>
			<div class="center_content">
				<div class="center_title_bar"><spring:message code="registrosuscripcion.altasuscripcion"/></div>

				<div class="prod_box_big">
					<div class="top_prod_box_big"></div>
					<div class="center_prod_box_big">

						<div align="center">
							<br />
							<div>
								<form:form method="post" action="/cliente/insertSubscription" modelAttribute="subscription">
									<table>
										<tr>
											<!-- Campo oculto<td>Cod Usuario :</td>-->
											<td><form:input path="userId" style="display:none" /></td>
										</tr>
										<tr>
											<td><spring:message code="registrosuscripcion.tiposuscripcion"/>:</td>
											<td><select id="tipoSubscription"
												name="tipoSubscription">
													<option value="Entradas"><spring:message code="registrosuscripcion.entradas"/></option>
													<option value="Restaurantes"><spring:message code="registrosuscripcion.restaurantes"/></option>
													<option value="Actividades"><spring:message code="registrosuscripcion.actividades"/></option>
											</select></td>
										</tr>
										<tr>
											<td>&nbsp;</td>
											<td><input type="submit" value="<spring:message code="registrosuscripcion.botonaceptar"/>" /> <input
												type="button" value="<spring:message code="registrosuscripcion.botoncancelar"/>"
												onclick="self.location.href = 'getListSubscription'" /></td>
										</tr>

									</table>
								</form:form>
							</div>
						</div>
						<div class="top_prod_box_big"></div>
						<div class="bottom_prod_box_big"></div>




					</div>
				</div>
			</div>
		</body>
	</tiles:putAttribute>
</tiles:insertDefinition>