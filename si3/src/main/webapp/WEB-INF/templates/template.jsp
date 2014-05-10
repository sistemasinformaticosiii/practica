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
	<style>
.error {
	color: #ff0000;
}
 
.errorblock {
	color: #000;
	background-color: #ffEEEE;
	border: 3px solid #ff0000;
	padding: 8px;
	margin: 16px;
}
body {
	font-size: 20px;
	color: teal;
	font-family: Calibri;
}

td {
	font-size: 15px;
	color: black;
	width: 100px;
	height: 22px;
	text-align: left;
}

.heading {
	font-size: 18px;
	color: white;
	font: bold;
	background-color: orange;
	border: thick;
}

 
</style>

</head>
<body>

   <div id="main_container">
	   <tiles:insertAttribute name="header" />
    
   <div id="main_content"> 
  
    	<div class="crumb_navigation">
    		Navegaci&oacute;n: <span class="current">Inicio</span>
       	</div>        
      	
<%--       	<tilesx:useAttribute name="current"/> --%>
<%--       	${current} --%>
      	
      	     	
      	<security:authorize access="isAnonymous()">
      		<tiles:insertAttribute name="menu" />
      	</security:authorize>
      	<security:authorize access="hasRole('Cliente')">
        	<tiles:insertAttribute name="menu_user" />
    	</security:authorize>
		<security:authorize access="hasRole('Administrador')">
        	<tiles:insertAttribute name="menu_admin" />
    	</security:authorize>
    	<security:authorize access="hasAnyRole('Entradas', 'Restaurantes', 'Actividades')">
        	<tiles:insertAttribute name="menu_proveedor" />
    	</security:authorize>
    	
    	<security:authorize access="isAnonymous()">
      		<tiles:insertAttribute name="left" />
      	</security:authorize>
      	<security:authorize access="hasRole('Cliente')">
        	<tiles:insertAttribute name="left_user" />
    	</security:authorize>
		<security:authorize access="hasRole('Administrador')">
        	<tiles:insertAttribute name="left_admin" />
    	</security:authorize>
    	<security:authorize access="hasAnyRole('Entradas', 'Restaurantes', 'Actividades')">
        	<tiles:insertAttribute name="left_proveedor" />
    	</security:authorize>
    	
   
	  	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

 <div class="center_content">
 
 
 			<tiles:insertAttribute name="body" />
    
   
 </div><!-- end of center content -->	  	
 
 	
 	</div><!-- end of main content -->


    <tiles:insertAttribute name="footer" />
    </div> <!-- end of main_container -->
</body>
</html>