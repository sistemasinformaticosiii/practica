<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<tiles:insertDefinition name="defaultTemplategeneral">
	<tiles:putAttribute name="center">
<div align="center">
Test- error en login

<c:if test="${not empty error}">
    <font color="red"> Error al ingresar. <br /> Motivo :
        ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}
    </font>
</c:if>

</div>
</tiles:putAttribute>
</tiles:insertDefinition>