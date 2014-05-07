<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<tiles:insertDefinition name="usuariosRegistradosTemplate">
	<tiles:putAttribute name="body">
	
<div align="center">
<security:authorize access="isAuthenticated()">
Sesión iniciada. Soy el usuario:  <security:authentication property="principal.username" />
Y mi perfil es: <security:authentication property="principal.authorities"/>
</security:authorize>


</div>
</tiles:putAttribute>
</tiles:insertDefinition>