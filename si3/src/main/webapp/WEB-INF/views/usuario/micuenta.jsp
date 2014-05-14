<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<tiles:insertDefinition name="usuariosRegistradosTemplate">
	<tiles:putAttribute name="body">
	
<div align="center">
<security:authorize access="isAuthenticated()">
<spring:message code="login.micuenta.usuario"/>:  <security:authentication property="principal.username" />
, <spring:message code="login.micuenta.perfil"/>: <security:authentication property="principal.authorities"/>.
<br/> 
<b><spring:message code="login.micuenta.loginok"/></b> 

</security:authorize>



</div>
</tiles:putAttribute>
</tiles:insertDefinition>