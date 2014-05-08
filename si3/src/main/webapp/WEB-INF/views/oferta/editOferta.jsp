<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<tiles:insertDefinition name="defaultTemplategeneral">
	<tiles:putAttribute name="body">
	<center>
		<br /> <br /> <br /> <b>Editar Oferta </b><br /> <br />
		<div>
			<form:form method="post" action="/si3/updateOferta" modelAttribute="oferta">
				<table>
					<tr>
						<td>Cod Usuario :</td>
						<td><form:input path="codUsuario" value="${map.oferta.codUsuario}" /></td>
					</tr>
					<tr>
						<td>Tipo :</td>
						<td><form:input path="tipo" value="${map.oferta.tipo}" /></td>
					</tr>
					<tr>
						<td>Categoria :</td>
						<td><form:input path="categoria" value="${map.oferta.categoria}" /></td>
					</tr>
					<tr>
						<td>Titulo :</td>
						<td><form:input path="titulo" value="${map.oferta.titulo}" /></td>
					</tr>
					<tr>
						<td>Fecha Inicio :</td>
						<td><form:input path="fechaInicio" value="${map.oferta.fechaInicio}" /></td>
					</tr>
					<tr>
						<td>Fecha Fin :</td>
						<td><form:input path="fechaFin" value="${map.oferta.fechaFin}" /></td>
					</tr>
					<tr>
						<td>Localidad :</td>
						<td><form:input path="localidad" value="${map.oferta.localidad}" /></td>
					</tr>
					<tr>
						<td>direccion :</td>
						<td><form:input path="direccion" value="${map.oferta.direccion}" /></td>
					</tr>
     				<tr>
      					<td>Descripcion :</td>
      					<td><form:input path="descripcion" value="${map.oferta.descripcion}" /></td>
     				</tr>
					<tr>
						<td>Plazas Totales :</td>
						<td><form:input path="plazasTotal" value="${map.oferta.plazasTotal}" /></td>
					</tr>
					<tr>
						<td>Plazas Disponibles :</td>
						<td><form:input path="plazasDisponibles" value="${map.oferta.plazasDisponibles}" /></td>
					</tr>
					<tr>
						<td>Precio :</td>
						<td><form:input path="precio" value="${map.oferta.precio}" /></td>
					</tr>
					<tr>
						<td>Descuento :</td>
						<td><form:input path="descuento" value="${map.oferta.descuento}" /></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td><input type="submit" value="Guardar" />
						</td>
					</tr>
				</table>
				<form:hidden path="codOferta" value="${map.oferta.codOferta}" />

			</form:form>
		</div>
	</center>
    </tiles:putAttribute>
</tiles:insertDefinition>