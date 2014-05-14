<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<tiles:insertDefinition name="defaultTemplategeneral">
	<tiles:putAttribute name="body">

<body>
  <div class="center_content">
   	<div class="center_title_bar"><spring:message code="admin.ofertas.titulo"/></div>
    
    	<div class="prod_box_big">
    		<div class="top_prod_box_big"></div>
            <div class="center_prod_box_big">   

		<table border="1">
			<tr>
				<td class="heading"><spring:message code="admin.ofertas.tabla.campo.codoferta"/></td>
				<td class="heading"><spring:message code="admin.ofertas.tabla.campo.codusuario"/></td>
				<td class="heading"><spring:message code="admin.ofertas.tabla.campo.tipo"/></td>
				<td class="heading"><spring:message code="admin.ofertas.tabla.campo.categoria"/></td>
				<td class="heading"><spring:message code="admin.ofertas.tabla.campo.titulo"/></td>
				<td class="heading"><spring:message code="admin.ofertas.tabla.campo.fechainicio"/></td>
				<td class="heading"><spring:message code="admin.ofertas.tabla.campo.fechafin"/></td>
				<td class="heading"><spring:message code="admin.ofertas.tabla.campo.localidad"/></td>
				<td class="heading"><spring:message code="admin.ofertas.tabla.campo.direccion"/></td>
				<td class="heading"><spring:message code="admin.ofertas.tabla.campo.descripcion"/></td>
				<td class="heading"><spring:message code="admin.ofertas.tabla.campo.plazastotales"/></td>
				<td class="heading"><spring:message code="admin.ofertas.tabla.campo.plazasdisponibles"/></td>
				<td class="heading"><spring:message code="admin.ofertas.tabla.campo.precio"/></td>
				<td class="heading"><spring:message code="admin.ofertas.tabla.campo.descuento"/></td>
				<td class="heading"><spring:message code="admin.ofertas.tabla.campo.editar"/></td>
				<td class="heading"><spring:message code="admin.ofertas.tabla.campo.borrar"/></td>
			</tr>
			
			<c:forEach var="oferta" items="${listaOfertas}">
				<tr>
					<td>${oferta.codOferta}</td>
					<td>${oferta.codUsuario}</td>
					<td>${oferta.tipo}</td>
					<td>${oferta.categoria}</td>
					<td>${oferta.titulo}</td>
					<td>${oferta.fechaInicio}</td>
					<td>${oferta.fechaFin}</td>
					<td>${oferta.localidad}</td>
					<td>${oferta.direccion}</td>
					<td>${oferta.descripcion}</td>
					<td>${oferta.plazasTotal}</td>
					<td>${oferta.plazasDisponibles}</td>
					<td>${oferta.precio}</td>
					<td>${oferta.descuento}</td>
					<td><a href="<c:url value="/admin/editOferta?id=${oferta.codOferta}"/>"><spring:message code="admin.ofertas.tabla.campo.enlace.editar"/></a></td>
					<td><a href="<c:url value="/admin/deleteOferta?id=${oferta.codOferta}"/>"><spring:message code="admin.ofertas.tabla.campo.enlace.borrar"/></a></td>
				</tr>
			</c:forEach>
		</table>
</div>
</div>
</div> 


    </tiles:putAttribute>
</tiles:insertDefinition>

