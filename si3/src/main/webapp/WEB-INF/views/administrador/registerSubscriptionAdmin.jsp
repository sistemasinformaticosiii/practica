<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<tiles:insertDefinition name="defaultTemplategeneral">
	<tiles:putAttribute name="body">

		<body>
			<div class="center_content">
				<div class="center_title_bar">Alta en suscripciones</div>

				<div class="prod_box_big">
					<div class="top_prod_box_big"></div>
					<div class="center_prod_box_big">

						<div align="center">
							<br />
							<div>
								<form:form method="post" action="/si3/insertSubscriptionAdmin"
									modelAttribute="subscription">
									<table>
										<tr>
											<!--  Campo oculto<td>Cod Usuario :</td>
											<td><form:input path="userId" style="display:none"/></td>-->
										</tr>
										<tr>
											<form:select path="userId" id="userId">
												<form:options items="${userList}" itemValue="userId" itemLabel="email" />
											</form:select>
										</tr>
										<tr>
											<td>Tipo de suscripcion:</td>
											<td><select id="tipoSubscription"
												name="tipoSubscription">
													<option value="Entradas">Entradas</option>
													<option value="Restaurantes">Restaurantes</option>
													<option value="Actividades">Actividades</option>
											</select></td>
										</tr>
										<tr>
											<td>&nbsp;</td>
											<td><input type="submit" value="Aceptar" /> <input
												type="button" value="Cancelar"
												onclick="self.location.href = 'getListSubscriptionAdmin'" /></td>
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