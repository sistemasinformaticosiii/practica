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
    </tiles:putAttribute>
</tiles:insertDefinition>

