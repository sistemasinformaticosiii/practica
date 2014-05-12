<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<tiles:insertDefinition name="defaultTemplategeneral">
	<tiles:putAttribute name="body">

			<div class="center_content">
				<div class="center_title_bar">Listado de suscripciones activas - Administrador</div>

				<div class="prod_box_big">
					<div class="top_prod_box_big"></div>
					<div class="center_prod_box_big">

						<div align="center">
							<table border="2">
								<c:choose>
								  <c:when test="${not empty subscriptionList}">
									<tr>
										<td class="heading">Usuario suscripción</td>
										<td class="heading">Tipo de suscripcion</td>
										<td class="heading">Accion disponible</td>
									</tr>
									<c:forEach var="subscription" items="${subscriptionList}">
										<tr>
											<td>${subscription.userId}</td>
											<td>${subscription.tipoSubscription}</td>
											<td align="center"><a href="<c:url value="/deleteSubscriptionAdmin?id=${subscription.subscriptionId}"/>">Baja</a></td>
										</tr>
									</c:forEach>			  
								  </c:when>
								  <c:otherwise>
								  	<b>No existen suscripciones al bolet&iacute;n de Ofertas en este momento</b>
								  </c:otherwise>
								</c:choose>							
							</table>
						</div>
						<div class="top_prod_box_big"></div>
						<div class="bottom_prod_box_big"></div>




					</div>
				</div>
			</div>
			<a href="<c:url value="/registerSubscriptionAdmin?roles=Cliente"/>" class="prod_detailssubscription">Añadir suscripcion</a>

	</tiles:putAttribute>
</tiles:insertDefinition>