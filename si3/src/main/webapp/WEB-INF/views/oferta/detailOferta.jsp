<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<tiles:insertDefinition name="defaultTemplategeneral">
	<tiles:putAttribute name="body">

<body>
<div class="center_content">
   	<div class="center_title_bar">${oferta.titulo}</div>
    
    	<div class="prod_box_big">
        	<div class="top_prod_box_big"></div>
            <div class="center_prod_box_big">            
                 
                 <div class="product_img_big">
                 
                 <%-- Código temporal, para gestionar imágenes genéricas para los tipos: Restaurantes, Actividades y Entradas --%>
					<c:choose>
					    <c:when test="${oferta.tipo == 'Restaurantes'}">
				        		
		                 <a href="javascript:popImage('images/big_pic.jpg','Some Title')" title="header=[Zoom] body=[&nbsp;] fade=[on]">
		                 <img src="<c:url value="/resources/images/0genericas/restaurantes.jpg"/>" alt="" title="" border="0" /></a>				        		
					    </c:when>
					    <c:when test="${oferta.tipo == 'Actividades'}">
				        		
		                 <a href="javascript:popImage('images/big_pic.jpg','Some Title')" title="header=[Zoom] body=[&nbsp;] fade=[on]">
		                 <img src="<c:url value="/resources/images/0genericas/actividades.jpg"/>" alt="" title="" border="0" /></a>				        		
					    </c:when>
					    <c:when test="${oferta.tipo == 'Entradas'}">
				        		
		                 <a href="javascript:popImage('images/big_pic.jpg','Some Title')" title="header=[Zoom] body=[&nbsp;] fade=[on]">
		                 <img src="<c:url value="/resources/images/0genericas/entradas.jpg"/>" alt="" title="" border="0" /></a>				        		
					    </c:when>
					</c:choose>
	<%--  Fin selección imágenes de ofertas --%>
		               
                 
    
<!--                  <div class="thumbs"> -->
<%--                  <a href="#" title="header=[Imagen1] body=[&nbsp;] fade=[on]"><img src="<c:url value="/resources/images/thumb1.gif"/>" alt="" title="" border="0" /></a> --%>
<%--                  <a href="#" title="header=[Imagen2] body=[&nbsp;] fade=[on]"><img src="<c:url value="/resources/images/thumb1.gif"/>" alt="" title="" border="0" /></a> --%>
<%--                  <a href="#" title="header=[Imagen3] body=[&nbsp;] fade=[on]"><img src="<c:url value="/resources/images/thumb1.gif"/>" alt="" title="" border="0" /></a> --%>
<!--                  </div> -->
                 </div>
                     <div class="details_big_box">
                         <div class="product_title_big">${oferta.descripcion}</div>
                         <div class="specifications">
                         </div>
                         <div class="prod_price_big">Precio original:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="reduce">${oferta.precio}&euro;</span><br/> 
                         Precio especial PortalOcio:&nbsp;&nbsp;&nbsp;&nbsp;<span class="price"><b>${oferta.precio-(oferta.precio*(oferta.descuento/100))}&euro;</b></span></div>
                          <b>Descuento: <span class="blue">${oferta.descuento}</span><br /></b> 
                          <b>Tipo de oferta: <span class="blue">${oferta.tipo}</span></b><br/>
                          <b>Descripción detallada: <span class="blue">${oferta.descripcion }</span><br /></b>
                          <br/>
                          Fecha Inicio Oferta: <span class="blue">${oferta.fechaInicio}</span><br/>
                          Fecha Fin Oferta: <span class="blue">${oferta.fechaFin}</span><br/>
                          Localidad: <span class="blue">${oferta.localidad}</span><br />
                          Dirección <span class="blue">${oferta.direccion}</span><br />
                         
                          Plazas totales: <span class="blue">${oferta.plazasTotal}</span><br />
                          Plazas disponibles: <span class="blue">${oferta.plazasDisponibles}</span><br />
						 <a href="<c:url value="/cliente/reservaOferta?id=${oferta.codOferta}"/>" class="addtocart">Reservar</a>
                         <a href="javascript:history.back()" class="return">Volver</a>
         
                     </div>                        
            </div>
            <div class="bottom_prod_box_big"></div>                                
        </div>
</div>
</body>
    </tiles:putAttribute>
</tiles:insertDefinition>