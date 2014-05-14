<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<tiles:insertDefinition name="defaultTemplategeneral">
	<tiles:putAttribute name="body">

<body>
  <div class="center_content">
   	<div class="center_title_bar"><spring:message code="admin.usuarios.titulo"/></div>
    
    	<div class="prod_box_big">
    		<div class="top_prod_box_big"></div>
            <div class="center_prod_box_big">   

	
<!-- 		<br /> <br /> <br /> <b>Lista de Usuarios de PortalOcio</b><br /> <br /> -->
			
		<table border="1">
			<tr>
				<td class="heading"><spring:message code="admin.usuarios.tabla.campo.username"/></td>
				<td class="heading"><spring:message code="admin.usuarios.tabla.campo.enabled"/></td>
 				<td class="heading"><spring:message code="admin.usuarios.tabla.campo.userid"/></td> 
				<td class="heading"><spring:message code="admin.usuarios.tabla.campo.nombre"/></td>
				<td class="heading"><spring:message code="admin.usuarios.tabla.campo.apellidos"/></td>
				<td class="heading"><spring:message code="admin.usuarios.tabla.campo.localidad"/></td>
				<td class="heading"><spring:message code="admin.usuarios.tabla.campo.telefono"/></td>
				<td class="heading"><spring:message code="admin.usuarios.tabla.campo.email"/></td>
				<td class="heading"><spring:message code="admin.usuarios.tabla.campo.perfil"/></td>
<!-- 				<td class="heading">pass</td> -->
				<td class="heading"><spring:message code="admin.usuarios.tabla.campo.editar"/></td>
				<td class="heading"><spring:message code="admin.usuarios.tabla.campo.borrar"/></td>
			</tr>
			<c:forEach var="user" items="${userList}">
				<tr>
					<td>${user.username}</td>
					<td>${user.enabled}</td>										
					<td>${user.userId}</td>
					<td>${user.nombre}</td>
					<td>${user.apellidos}</td>
					<td>${user.localidad}</td>
					<td>${user.telefono}</td>
					<td>${user.email}</td>
					<td>${user.perfil}</td>
<%-- 					<td>${user.pass}</td> --%>
					<td><a href="<c:url value="/admin/editUser?id=${user.userId}"/>"><spring:message code="admin.usuarios.tabla.enlace.editar"/></a></td>
					<td><a href="<c:url value="/admin/delete?id=${user.userId}"/>"><spring:message code="admin.usuarios.tabla.enlace.borrar"/></a></td>
				</tr>
			</c:forEach>
		</table>

</div>
</div>
</div>

    </tiles:putAttribute>
</tiles:insertDefinition>

