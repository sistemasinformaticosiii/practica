<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


<tiles:insertDefinition name="defaultTemplategeneral">
	<tiles:putAttribute name="body">

<body>	
<div class="center_content">
   	<div class="center_title_bar"><spring:message code="listasuscripcion.titulo"/></div>
    
    	<div class="prod_box_big">
    		<div class="top_prod_box_big"></div>
            <div class="center_prod_box_big">        
                 
		<div align="center">
		<table border="2">
		<c:choose>
			<c:when test="${not empty subscriptionList}">
				<tr>
					<security:authorize access="hasRole('Administrador')">
		      			<td class="heading"><spring:message code="listasuscripcion.tabla.cabeceracodigo"/></td>
	      			</security:authorize>
				
					<td class="heading"><spring:message code="listasuscripcion.tabla.cabeceratiposuscripcion"/></td>
					
					<td class="heading"><spring:message code="listasuscripcion.tabla.cabeceraaccion"/></td>
				</tr>
				<c:forEach var="subscription" items="${subscriptionList}">
					<tr>
						<security:authorize access="hasRole('Administrador')">				
							<td>${subscription.userId}</td>
	      			</security:authorize>						
						<td>${subscription.tipoSubscription}</td>
						<td align="center"><a href="<c:url value="/cliente/deleteSubscription?id=${subscription.subscriptionId}"/>"><spring:message code="listasuscripcion.acciones.baja"/></a></td>
					</tr>
				</c:forEach>					  
			</c:when>
			<c:otherwise>
				<b><spring:message code="listasuscripcion.sinsuscripciones"/></b>
			</c:otherwise>
		</c:choose>		
				
		

		</table></div>
		<div class="top_prod_box_big"></div>
		<div class="bottom_prod_box_big"></div> 
		
		
		    
                                             
            </div>                               
       </div> 
</div> 
				<security:authorize access="hasRole('Cliente')">
					<a href="<c:url value="/cliente/registerSubscription"/>"class="prod_detailssubscription"><spring:message code="listasuscripcion.nuevasuscripcion"/></a>
      			</security:authorize>
      			<security:authorize access="hasRole('Administrador')">
					<a href="<c:url value="/admin/registerSubscriptionAdmin"/>"class="prod_detailssubscription"><spring:message code="listasuscripcion.nuevasuscripcion"/></a>
				</security:authorize>									
		

	</body>
</tiles:putAttribute>
</tiles:insertDefinition>