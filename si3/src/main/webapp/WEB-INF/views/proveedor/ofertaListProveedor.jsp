<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<tiles:insertDefinition name="defaultTemplategeneral">
	<tiles:putAttribute name="body">

		<div class="center_title_bar">Ofertas Vigentes: ${numeroOfertas}</div>
		
		<c:forEach items="${listaOfertas}" var="oferta">
		    	<div class="prod_box">
		        	<div class="top_prod_box"></div>
		            <div class="center_prod_box">         
		   
            
	
	<%-- Código temporal, para gestionar imágenes genéricas para los tipos: Restaurantes, Actividades y Entradas --%>
					<c:choose>
					    <c:when test="${oferta.tipo == 'Restaurantes'}">
					        <div class="product_title"><a href="<c:url value="/proveedor/detailOferta?id=${oferta.codOferta}"/>">${oferta.titulo}</a></div>
			        		<div class="product_img">
				        		<a href="<c:url value="/proveedor/detailOferta?id=${oferta.codOferta}"/>"><img src="<c:url value="/resources/images/0genericas/restaurantes.jpg"/>" alt="" title="" border="0" /></a>
					        </div>	
					    </c:when>
					    <c:when test="${oferta.tipo == 'Actividades'}">
					        <div class="product_title"><a href="<c:url value="/proveedor/detailOferta?id=${oferta.codOferta}"/>">${oferta.titulo}</a></div>
			        		<div class="product_img">
				        		<a href="<c:url value="/proveedor/detailOferta?id=${oferta.codOferta}"/>"><img src="<c:url value="/resources/images/0genericas/actividades.jpg"/>" alt="" title="" border="0" /></a>
					        </div>	
					    </c:when>
					    <c:when test="${oferta.tipo == 'Entradas'}">
					        <div class="product_title"><a href="<c:url value="/proveedor/detailOferta?id=${oferta.codOferta}"/>">${oferta.titulo}</a></div>
			        		<div class="product_img">
				        		<a href="<c:url value="/proveedor/detailOferta?id=${oferta.codOferta}"/>"><img src="<c:url value="/resources/images/0genericas/entradas.jpg"/>" alt="" title="" border="0" /></a>
					        </div>	
					    </c:when>
					</c:choose>

	<%--  Fin selección imágenes de ofertas --%>
		               

		
		
		            <div class="prod_price"><span class="reduce">${oferta.precio}&euro;</span> <span class="price">${oferta.precio}&euro;</span></div>                        
		            </div>
		            <div class="bottom_prod_box"></div>             
		            <div class="prod_details_tab">
		            <a href="<c:url value="/proveedor/detailOferta?id=${oferta.codOferta}"/>"class="prod_details"> detalle</a>            
		            </div>                     
		        </div>
		</c:forEach>


 <%--

		<br /> <br /> <br /><br /> <br /> <br /><br /> <br /> <br /><br /> <br /> <br /> 
		<br /> <br /> <br /><br /> <br /> <br /><br /> <br /> <br /><br /> <br /> <br />
		<b>Lista de Ofertas | Practica </b><br /> <br />
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
			<tr>
			<td>Número de ofertas encontradas: ${numeroOfertas}</td> 
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
					<td><a href="editOferta?id=${oferta.codOferta}">Editar</a></td>
					<td><a href="/deleteOferta?id=${oferta.codOferta}">Borrar</a></td>
					<td><a href="/reservaOferta?id=${oferta.codOferta}">Reservar</a></td>
				</tr>
			</c:forEach>
			<tr><td colspan="8"><a href="registerOferta">Añadir Oferta</a></td></tr>
		</table>
 
 --%>

    </tiles:putAttribute>
</tiles:insertDefinition>

