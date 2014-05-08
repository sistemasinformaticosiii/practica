<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

   <div class="left_content">
    <div class="title_box">Gesti�n de Usuarios</div>
    
        <ul class="left_menu">
	        <li class="odd"><a href="<c:url value="/getList"/>">Ver lista de usuarios</a></li>
	        <li class="even"><a href="<c:url value="/register"/>">A�adir usuario</a></li>
	        <li class="odd"><a href="<c:url value="#"/>">Otra opci�n de usuarios</a></li>
        </ul> 
        
	<div class="title_box">Gesti�n de Proveedores</div>   
        <ul class="left_menu">
	        <li class="odd"><a href="<c:url value="/getList"/>">Ver lista de proveedores</a></li>
	        <li class="even"><a href="<c:url value="/register"/>">A�adir proveedor</a></li>
        </ul>
        
	<div class="title_box">Gesti�n de Ofertas</div>   
        <ul class="left_menu">
	        <li class="odd"><a href="<c:url value="/getListOffer"/>">Ver lista de ofertas</a></li>
	        <li class="even"><a href="<c:url value="/register"/>">A�adir oferta</a></li>
        </ul> 
        
	<div class="title_box">Gesti�n de Suscripciones</div>   
        <ul class="left_menu">
	        <li class="odd"><a href="<c:url value="/getListSubscription"/>">Ver listado de suscripciones</a></li>
	        <li class="even"><a href="<c:url value="/registerSubscription"/>">A�adir suscripci�n e-mail</a></li>
        </ul>         
        
    
     
     <div class="title_box">Bolet&iacute;n</div>  
     <div class="border_box">
		<input type="text" name="newsletter" class="newsletter_input" value="su correo electr&oacute;nico"/>
        <a href="#" class="join">Suscribirse</a>
     </div>  
     
     <div class="banner_adds">
          <a href="#"><img src="<c:url value="/resources/images/bann2.jpg"/>" alt="" title="" border="0" /></a>
     </div>    
        
    
   </div><!-- end of left content -->