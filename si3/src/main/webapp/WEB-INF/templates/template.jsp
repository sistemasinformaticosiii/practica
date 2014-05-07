<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="tilesx" uri="http://tiles.apache.org/tags-tiles-extras" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Portal de ofertas de ocio</title>
		<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/style.css" />">
		<!--[if IE 6]>
		<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/iecss.css" />">
		<![endif]-->
		<script type="text/javascript" src="<c:url value="/resources/js/boxOver.js"/>"></script>

</head>
<body>

   <div id="main_container">
	   <tiles:insertAttribute name="header" />
    
   <div id="main_content"> 
  
    	<div class="crumb_navigation">
    		Navegaci&oacute;n: <span class="current">Inicio</span>
       	</div>        
      	
      	<tilesx:useAttribute name="current"/>
      	${current}
      	
      	     	
      	<security:authorize access="isAnonymous()">
      		<tiles:insertAttribute name="menu" />
      	</security:authorize>
      	<security:authorize access="hasRole('ROLE_USER')">
        	<tiles:insertAttribute name="menu_user" />
    	</security:authorize>
		<security:authorize access="hasRole('ROLE_ADMIN')">
        	<tiles:insertAttribute name="menu_admin" />
    	</security:authorize>
    	<security:authorize access="hasRole('ROLE_PROVEEDOR')">
        	<tiles:insertAttribute name="menu_proveedor" />
    	</security:authorize>
    	
	  	<tiles:insertAttribute name="left" />   
	  	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

 <div class="center_content">
 
 
 			<tiles:insertAttribute name="body" />
    
   
 </div><!-- end of center content -->	  	
 
 	
 	</div><!-- end of main content -->


    <tiles:insertAttribute name="footer" />
    </div> <!-- end of main_container -->
</body>
</html>