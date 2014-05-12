<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<tiles:insertDefinition name="defaultTemplategeneral">
	<tiles:putAttribute name="body">

<body>
	<center>
		<br /> <br /> <br /> <b>Lista Proveedores | Practica </b><br /> <br />
			
		

		<table border="1">
			<tr>
				<td class="heading">Proveedor Id</td>
				<td class="heading">Nombre</td>
				<td class="heading">Apellidos</td>
				<td class="heading">Localidad</td>
				<td class="heading">telefono</td>
				<td class="heading">email</td>
				<td class="heading">perfil</td>
				<td class="heading">pass</td>
				<td class="heading">Editar</td>
				<td class="heading">Borrar</td>
			</tr>
			<c:forEach var="user" items="${userList}">
				<tr>
					<td>${user.userId}</td>
					<td>${user.nombre}</td>
					<td>${user.apellidos}</td>
					<td>${user.localidad}</td>
					<td>${user.telefono}</td>
					<td>${user.email}</td>
					<td>${user.perfil}</td>
					<td>${user.pass}</td>
					<td><a href="edit?id=${user.userId}">Editar</a></td>
					<td><a href="/si3/delete?id=${user.userId}">Borrar</a></td>
				</tr>
			</c:forEach>
			<tr><td colspan="8"><a href="register">Añadir Proveedor</a></td></tr>
		</table>

	</center>
</body>
    </tiles:putAttribute>
</tiles:insertDefinition>
