<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

   <div class="left_content">
    <div class="title_box">Gestión de Usuarios</div>
    
        <ul class="left_menu">
	        <li class="odd"><a href="<c:url value="/getUserList?roles=Cliente&roles=Administrador&roles=Entradas&roles=Restaurantes&roles=Actividades"/>">Ver lista de usuarios</a></li>
	        <li class="even"><a href="<c:url value="/register?type=user"/>">Añadir usuario</a></li>
        </ul> 
        
	<div class="title_box">Gestión de Proveedores</div>   
        <ul class="left_menu">
	        <li class="odd"><a href="<c:url value="/getUserList?roles=Entradas&roles=Restaurantes&roles=Actividades"/>">Ver lista de proveedores</a></li>
	        <li class="even"><a href="<c:url value="/register?type=proveedor"/>">Añadir proveedor</a></li>
        </ul>
        
	<div class="title_box">Gestión de Ofertas</div>   
        <ul class="left_menu">
	        <li class="odd"><a href="<c:url value="/getListOfferAdmin"/>">Ver lista de ofertas</a></li>
	        <li class="even"><a href="<c:url value="/registerOfertaAdmin?roles=Entradas&roles=Restaurantes&roles=Actividades"/>">Añadir oferta</a></li>
        </ul> 
	<div class="title_box">Gestión de Reservas</div>   
        <ul class="left_menu">
	        <li class="odd"><a href="<c:url value="/reservasListAdmin"/>">Ver listado de reservas</a></li>
        </ul>                         
	<div class="title_box">Gestión de Suscripciones</div>   
        <ul class="left_menu">
	        <li class="odd"><a href="<c:url value="/getListSubscriptionAdmin"/>">Ver listado de suscripciones</a></li>
			<li class="even"><a href="<c:url value="/registerSubscriptionAdmin?roles=Cliente"/>">Añadir suscripción e-mail</a></li>
        </ul>
     
     <div class="banner_adds">
          <a href="#"><img src="<c:url value="/resources/images/bann2.jpg"/>" alt="" title="" border="0" /></a>
     </div>    
        
    
   </div><!-- end of left content -->