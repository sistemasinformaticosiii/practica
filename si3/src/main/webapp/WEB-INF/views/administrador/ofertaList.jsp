<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<tiles:insertDefinition name="defaultTemplategeneral">
	<tiles:putAttribute name="body">

<body>
  <div class="center_content">
   	<div class="center_title_bar">Listado de Ofertas - Administrador -</div>
    
    	<div class="prod_box_big">
    		<div class="top_prod_box_big"></div>
            <div class="center_prod_box_big">   

	<center>
		<table border="1">
			<tr>
				<td class="heading">Cod Oferta</td>
				<td class="heading">Cod Usuario</td>
				<td class="heading">Tipo</td>
				<td class="heading">Categoria</td>
				<td class="heading">Titulo</td>
				<td class="heading">Fecha Inicio</td>
				<td class="heading">Fecha Fin</td>
				<td class="heading">Localidad</td>
				<td class="heading">Direccion</td>
				<td class="heading">Descripcion</td>
				<td class="heading">Plazas totales</td>
				<td class="heading">Plazas disponibles</td>
				<td class="heading">Precio</td>
				<td class="heading">Descuento</td>
				<td class="heading">Editar</td>
				<td class="heading">Borrar</td>
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
					<td><a href="<c:url value="/admin/editOferta?id=${oferta.codOferta}"/>">Editar</a></td>
					<td><a href="<c:url value="/admin/deleteOferta?id=${oferta.codOferta}"/>">Borrar</a></td>
				</tr>
			</c:forEach>
		</table>
 


    </tiles:putAttribute>
</tiles:insertDefinition>

