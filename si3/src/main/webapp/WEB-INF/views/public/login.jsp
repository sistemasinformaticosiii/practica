<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


<tiles:insertDefinition name="loginTemplate">
	<tiles:putAttribute name="body">
<div align="center">
<form name='f' action='j_spring_security_check' method='POST'>
   <fieldset>
   	<legend><spring:message code="login.iniciosesion"/></legend>
<!--   	<c:if test="${param.error != null}">
	    <div class="alert alert-error">
	                    Usuario o contraseña incorrectos
	    </div>
    </c:if>
    <c:if test="${param.logout != null}">
	    <div class="alert alert-success">
	    		You have been logged out.
		</div>
    </c:if>   	
-->   	  

   	  <label for="j_username"><spring:message code="login.label.usuario"/>:</label>
      <input type="text" id="j_username" name="j_username" value="" placeholder='<spring:message code="login.placeholder.usuario"/>'>
      <label for="password"><spring:message code="login.label.password"/>:</label>
      <input type='password' id='j_password' name="j_password" placeholder='<spring:message code="login.placeholder.password"/>'/>
      <button type="submit"><spring:message code="login.botoniniciarsesion"/></button>

      
   </fieldset>
</form>
</div>


</tiles:putAttribute>
</tiles:insertDefinition>
