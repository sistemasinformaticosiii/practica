<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<tiles:insertDefinition name="defaultTemplategeneral">
	<tiles:putAttribute name="body">

		<b>Lista de reservas | Practica si3</b><br /> <br />
		<table border="1">
			<tr>
				<td>Fecha Reserva</td>
				<td>Plazas Reservadas</td>
				
			</tr>
			
			
			<c:forEach var="reserva" items="${listaResultados}">
				<tr>
					<td>${reserva.key.fechaReserva}</td>
					<td>${reserva.key.plazasReservadas}</td>
					<td>${reserva.value.titulo}</td>
					
					
					<td><a href="editreserva?id=${reserva.key.reservationId}">Editar</a></td>
					<td><a href="/si3/deletereserva?id=${reserva.key.reservationId}">Borrar</a></td>
					
				</tr>
			</c:forEach>
			<tr><td colspan="8"><a href="registerreserva">Añadir reserva</a></td></tr>
		</table>
	
		               

		
		
 


    </tiles:putAttribute>
</tiles:insertDefinition>

