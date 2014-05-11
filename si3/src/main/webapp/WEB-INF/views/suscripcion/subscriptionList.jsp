<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>


<tiles:insertDefinition name="defaultTemplategeneral">
	<tiles:putAttribute name="body">

<body>	
<div class="center_content">
   	<div class="center_title_bar">Listado de suscripciones activas</div>
    
    	<div class="prod_box_big">
    		<div class="top_prod_box_big"></div>
            <div class="center_prod_box_big">        
                 
		<div align="center">
		<table border="2">
		<c:choose>
			<c:when test="${not empty subscriptionList}">
				<tr>
					<security:authorize access="hasRole('Administrador')">
		      			<td class="heading">C&oacute;digo usuario suscripci&oacute;n</td>
	      			</security:authorize>
				
					<td class="heading">Tipo de suscripci&oacute;n</td>
					
					<td class="heading">Acci&oacute;n disponible</td>
				</tr>
				<c:forEach var="subscription" items="${subscriptionList}">
					<tr>
						<security:authorize access="hasRole('Administrador')">				
							<td>${subscription.userId}</td>
	      			</security:authorize>						
						<td>${subscription.tipoSubscription}</td>
						<td align="center"><a href="<c:url value="/deleteSubscription?id=${subscription.subscriptionId}"/>">Baja</a></td>
					</tr>
				</c:forEach>					  
			</c:when>
			<c:otherwise>
				<b>No está suscrito a ningún boletin de Ofertas en este momento</b>
			</c:otherwise>
		</c:choose>		
				
		

		</table></div>
		<div class="top_prod_box_big"></div>
		<div class="bottom_prod_box_big"></div> 
		
		
		    
                                             
            </div>                               
       </div> 
</div> 
				<security:authorize access="hasRole('Cliente')">
					<a href="<c:url value="/registerSubscription"/>"class="prod_details">Añadir suscripcion</a>
      			</security:authorize>
      			<security:authorize access="hasRole('Administrador')">
					<a href="<c:url value="/registerSubscriptionAdmin"/>"class="prod_details">Añadir suscripcion</a>
				</security:authorize>									
		

	</body>
</tiles:putAttribute>
</tiles:insertDefinition>