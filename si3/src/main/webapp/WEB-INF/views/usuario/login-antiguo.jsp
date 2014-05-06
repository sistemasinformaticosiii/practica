<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<tiles:insertDefinition name="defaultTemplategeneral">
	<tiles:putAttribute name="center">
<div align="center">
<table align="center">
<form action="<c:url value="/login"/>" method="post" align="center">
    
        <table>
        <tr>
            <td>Nombre de usuario</td>
            <td><input type="text" id="username" name="username" placeholder="Nombre de usuario"/></td>
        </tr>
        <tr>
            <td>Contraseña</td>
            <td><input type="password" id="password" name="password" placeholder="Contraseña"/></td>
        </tr>
        <tr><td colspan="2" align="center"><button id="login">Iniciar sesi&oacute;n</button></td></tr>
        </table>
    
</form>
</table>
</div>
</tiles:putAttribute>
</tiles:insertDefinition>