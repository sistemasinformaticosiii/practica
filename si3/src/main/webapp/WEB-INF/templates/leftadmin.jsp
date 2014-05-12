<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

   <div class="left_content">
    <div class="title_box">Gesti�n de Usuarios</div>
    
        <ul class="left_menu">
	        <li class="odd"><a href="<c:url value="/getUserList?roles=Cliente&roles=Administrador&roles=Entradas&roles=Restaurantes&roles=Actividades"/>">Ver lista de usuarios</a></li>
	        <li class="even"><a href="<c:url value="/register?type=user"/>">A�adir usuario</a></li>
        </ul> 
        
	<div class="title_box">Gesti�n de Proveedores</div>   
        <ul class="left_menu">
	        <li class="odd"><a href="<c:url value="/getUserList?roles=Entradas&roles=Restaurantes&roles=Actividades"/>">Ver lista de proveedores</a></li>
	        <li class="even"><a href="<c:url value="/register?type=proveedor"/>">A�adir proveedor</a></li>
        </ul>
        
	<div class="title_box">Gesti�n de Ofertas</div>   
        <ul class="left_menu">
	        <li class="odd"><a href="<c:url value="/getListOfferInicio"/>">Ver lista de ofertas</a></li>
	        <li class="even"><a href="<c:url value="/registerOferta?type=Administrador"/>">A�adir oferta</a></li>
        </ul> 
	<div class="title_box">Gesti�n de Reservas</div>   
        <ul class="left_menu">
	        <li class="odd"><a href="<c:url value="/reservasListAdmin"/>">Ver listado de reservas</a></li>
        </ul>                         
	<div class="title_box">Gesti�n de Suscripciones</div>   
        <ul class="left_menu">
	        <li class="odd"><a href="<c:url value="/getListSubscriptionAdmin"/>">Ver listado de suscripciones</a></li>
	        <li class="even"><a href="<c:url value="/registerSubscriptionAdmin"/>">A�adir suscripci�n e-mail</a></li>
        </ul>
     
     <div class="banner_adds">
          <a href="#"><img src="<c:url value="/resources/images/bann2.jpg"/>" alt="" title="" border="0" /></a>
     </div>    
        
    
   </div><!-- end of left content -->