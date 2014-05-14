<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<tiles:insertDefinition name="defaultTemplategeneral">
	<tiles:putAttribute name="body">

			<div class="center_content">
				<div class="center_title_bar"><spring:message code="listasuscripcion.tituloadmin"/></div>

				<div class="prod_box_big">
					<div class="top_prod_box_big"></div>
					<div class="center_prod_box_big">

						<div align="center">
							<table border="2">
								<c:choose>
								  <c:when test="${not empty subscriptionList}">
									<tr>
										<td class="heading"><spring:message code="listasuscripcion.tabla.cabeceracodigo"/></td>
										<td class="heading"><spring:message code="listasuscripcion.tabla.cabeceratiposuscripcion"/></td>
										<td class="heading"><spring:message code="listasuscripcion.tabla.cabeceraaccion"/></td>
									</tr>
									<c:forEach var="subscription" items="${subscriptionList}">
										<tr>
											<td>${subscription.userId}</td>
											<td>${subscription.tipoSubscription}</td>
											<td align="center"><a href="<c:url value="/admin/deleteSubscriptionAdmin?id=${subscription.subscriptionId}"/>">Baja</a></td>
										</tr>
									</c:forEach>			  
								  </c:when>
								  <c:otherwise>
								  	<b><spring:message code="listasuscripcion.sinsuscripcionesadmin"/></b>
								  </c:otherwise>
								</c:choose>							
							</table>
						</div>
						<div class="top_prod_box_big"></div>
						<div class="bottom_prod_box_big"></div>




					</div>
				</div>
			</div>
			<a href="<c:url value="/admin/registerSubscriptionAdmin?roles=Cliente"/>" class="prod_detailssubscription"><spring:message code="listasuscripcion.nuevasuscripcion"/></a>

	</tiles:putAttribute>
</tiles:insertDefinition>