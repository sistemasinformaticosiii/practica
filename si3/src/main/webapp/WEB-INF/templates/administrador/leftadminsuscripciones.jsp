<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

   <div class="left_content">

	<div class="title_box">Gestión de Suscripciones</div>   
        <ul class="left_menu">
	        <li class="odd"><a href="<c:url value="/getListSubscription"/>">Ver listado de suscripciones</a></li>
	        <li class="even"><a href="<c:url value="/registerSubscription"/>">Añadir suscripción e-mail</a></li>
        </ul>         
            
     <div class="banner_adds">
          <a href="#"><img src="<c:url value="/resources/images/bann2.jpg"/>" alt="" title="" border="0" /></a>
     </div>    
        
    
   </div><!-- end of left content -->