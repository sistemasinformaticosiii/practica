<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

   <div class="left_content">
    <div class="title_box"><spring:message code="left.gestionusuarios"/></div>
    
        <ul class="left_menu">
	        <li class="odd"><a href="<c:url value="/admin/getUserList?roles=Cliente&roles=Administrador&roles=Entradas&roles=Restaurantes&roles=Actividades"/>"><spring:message code="left.verlistausuarios"/></a></li>
	        <li class="even"><a href="<c:url value="/public/register?type=user"/>"><spring:message code="left.nuevousuario"/></a></li>
        </ul> 
        
	<div class="title_box"><spring:message code="left.gestionproveedores"/></div>   
        <ul class="left_menu">
	        <li class="odd"><a href="<c:url value="/admin/getUserList?roles=Entradas&roles=Restaurantes&roles=Actividades"/>"><spring:message code="left.verlistaproveedores"/></a></li>
	        <li class="even"><a href="<c:url value="/public/register?type=proveedor"/>"><spring:message code="left.nuevoproveedor"/></a></li>
        </ul>
        
	<div class="title_box"><spring:message code="left.gestionofertas"/></div>   
        <ul class="left_menu">
	        <li class="odd"><a href="<c:url value="/admin/getListOfferAdmin"/>"><spring:message code="left.verlistaofertas"/></a></li>
	        <li class="even"><a href="<c:url value="/admin/registerOfertaAdmin?roles=Entradas&roles=Restaurantes&roles=Actividades"/>"><spring:message code="left.publicaroferta"/></a></li>
        </ul> 
	<div class="title_box"><spring:message code="left.gestionreservas"/></div>   
        <ul class="left_menu">
	        <li class="odd"><a href="<c:url value="/admin/reservasListAdmin"/>"><spring:message code="left.verlistadoreservas"/></a></li>
        </ul>                         
	<div class="title_box"><spring:message code="left.gestionsuscripciones"/></div>   
        <ul class="left_menu">
	        <li class="odd"><a href="<c:url value="/admin/getListSubscriptionAdmin"/>"><spring:message code="left.verlistsuscripciones"/></a></li>
			<li class="even"><a href="<c:url value="/admin/registerSubscriptionAdmin?roles=Cliente"/>"><spring:message code="left.nuevasuscripcion"/></a></li>
        </ul>
     
     <div class="banner_adds">
          <a href="#"><img src="<c:url value="/resources/images/bann2.jpg"/>" alt="" title="" border="0" /></a>
     </div>    
        
    
   </div><!-- end of left content -->