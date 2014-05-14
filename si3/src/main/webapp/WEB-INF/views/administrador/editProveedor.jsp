<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<tiles:insertDefinition name="defaultTemplategeneral">
	<tiles:putAttribute name="body">

		<div class="center_content">
			<div class="center_title_bar">Editar datos de usuario</div>
			<div class="prod_box_big">
				<div class="top_prod_box_big"></div>
				<div class="center_prod_box_big">
					<div align="center">
						<form:form method="post" action="/admin/update"
							modelAttribute="user">
							<table>
								<tr>
									<td>Nombre :</td>
									<td><form:input path="nombre" value="${map.user.nombre}" />
									</td>
								</tr>
								<tr>
									<td>Apellidos :</td>
									<td><form:input path="apellidos"
											value="${map.user.apellidos}" /></td>
								</tr>
								<tr>
									<td>Localidad :</td>
									<td><form:input path="localidad"
											value="${map.user.localidad}" /></td>
								</tr>
								<tr>
									<td>Teléfono :</td>
									<td><form:input path="telefono"
											value="${map.user.telefono}" /></td>
								</tr>
								<tr>
									<td>E-mail :</td>
									<td><form:input path="email" value="${map.user.email}" /></td>
								</tr>
								<tr>
									<td>Perfil :</td>
									<td><form:input path="perfil" value="${map.user.perfil}" />
									</td>
								</tr>
								<tr>
									<td>Password :</td>
									<td><form:input path="pass" value="${map.user.pass}" /></td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td><input type="submit" value="Guardar" /></td>
								</tr>
							</table>
							<form:hidden path="userId" value="${map.user.userId}" />

						</form:form>
					</div>
					<div class="top_prod_box_big"></div>
					<div class="bottom_prod_box_big"></div>
				</div>
			</div>
		</div>

	</tiles:putAttribute>
</tiles:insertDefinition>