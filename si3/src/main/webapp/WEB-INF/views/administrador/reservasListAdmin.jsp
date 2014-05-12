<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<tiles:insertDefinition name="defaultTemplategeneral">
	<tiles:putAttribute name="body">

		<div class="center_content">
			<div class="center_title_bar">
				Reserva de Oferta: <b> ${titulo}</b>
			</div>
  		
  		<div class="prod_box_big">
    		<div class="top_prod_box_big"></div>
            <div class="center_prod_box_big">      			
		
		<div align="center">
			<table border="2">
				<c:choose>
				  <c:when test="${not empty listaResultados}">
						<tr>
							<td class="heading">Fecha Reserva</td>
							<td class="heading">Plazas Reservadas</td>
							<td class="heading">Oferta</td>
						</tr>	
					<c:forEach var="reserva" items="${listaResultados}">
						<tr>
							<td>${reserva.key.fechaReserva}</td>
							<td align="center">${reserva.key.plazasReservadas}</td>
							<td>${reserva.value.titulo}</td>
							<td><a href="<c:url value="editreserva?id=${reserva.key.reservationId}"/>">Editar</a></td>
							<td><a href="<c:url value="deletereserva?id=${reserva.key.reservationId}"/>">Borrar</a></td>
						</tr>
					</c:forEach>				  
				  </c:when>
				  <c:otherwise>
				  	<b>No existen reservas en el sistema en este momento</b>
				  </c:otherwise>
				</c:choose>
			</table>

            </div>                               
       </div> 
</div>
</div> 	 			

	</tiles:putAttribute>
</tiles:insertDefinition>