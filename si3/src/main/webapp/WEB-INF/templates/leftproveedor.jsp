<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

   <div class="left_content">
	<div class="title_box"><spring:message code="left.gestionofertas"/></div>   
        <ul class="left_menu">
	        <li class="odd"><a href="<c:url value="/proveedor/getListOffer"/>"><spring:message code="left.verlistaofertas"/></a></li>
	        <li class="even"><a href="<c:url value="/proveedor/registerOferta?type=Proveedor"/>"><spring:message code="left.publicaroferta"/></a></li>
        </ul> 
            
     <div class="banner_adds">
          <a href="#"><img src="<c:url value="/resources/images/bann2.jpg"/>" alt="" title="" border="0" /></a>
     </div>    
        
    
   </div><!-- end of left content -->