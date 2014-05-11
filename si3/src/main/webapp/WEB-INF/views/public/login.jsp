<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<tiles:insertDefinition name="loginTemplate">
	<tiles:putAttribute name="body">
<div align="center">
<form name='f' action='j_spring_security_check' method='POST'>
   <fieldset>
   	<legend> Inicio de sesi�n</legend>
<!--   	<c:if test="${param.error != null}">
	    <div class="alert alert-error">
	                    Usuario o contrase�a incorrectos
	    </div>
    </c:if>
    <c:if test="${param.logout != null}">
	    <div class="alert alert-success">
	    		You have been logged out.
		</div>
    </c:if>   	
-->   	  

   	  <label for="j_username">Usuario:</label>
      <input type="text" id="j_username" name="j_username" value="" placeholder='usuario o e-mail'>
      <label for="password">Contrase�a</label>
      <input type='password' id='j_password' name="j_password" placeholder='contrase�a'/>
      <button type="submit">Iniciar sesi�n</button>

      
   </fieldset>
</form>
</div>


</tiles:putAttribute>
</tiles:insertDefinition>