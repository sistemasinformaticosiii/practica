<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<tiles:insertDefinition name="defaultTemplategeneral">
	<tiles:putAttribute name="body">

<body>
	<center>
		<br /> <br /> <br /> <b>Lista Usuarios | Practica </b><br /> <br />
			
		

		<table border="1">
			<tr>
				<td class="heading">Username</td>
				<td class="heading">Enabled</td>
				<td class="heading">User Id</td>
				<td class="heading">Nombre</td>
				<td class="heading">Apellidos</td>
				<td class="heading">Localidad</td>
				<td class="heading">telefono</td>
				<td class="heading">email</td>
				<td class="heading">perfil</td>
<!-- 				<td class="heading">pass</td> -->
				<td class="heading">Editar</td>
				<td class="heading">Borrar</td>
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
					<td><a href="<c:url value="/edit?id=${user.userId}"/>">Editar</a></td>
					<td><a href="<c:url value="/delete?id=${user.userId}"/>">Borrar</a></td>
				</tr>
			</c:forEach>
			<tr><td colspan="8"><a href="<c:url value="/register"/>">Añadir Usuario</a></td></tr>
		</table>

	</center>
</body>
    </tiles:putAttribute>
</tiles:insertDefinition>

