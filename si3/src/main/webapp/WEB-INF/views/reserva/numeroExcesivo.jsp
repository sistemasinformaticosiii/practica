<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<tiles:insertDefinition name="defaultTemplategeneral">
	<tiles:putAttribute name="body">
		<div class="center_content">
			<div class="prod_box_big">
				<div class="top_prod_box_big"></div>
				<div class="center_prod_box_big">
					<div align="center">
						<b><spring:message code="reserva.numeroexcesivo"/></b> <br />
 						<br /> <a href="<c:url value="/public/getListOfferInicio"/>" class="return_center"><spring:message code="reserva.return"/></a> 
<!--  						<br /> <a href="javascript:history.back()" class="return_center">Volver</a>  -->
						<div class="top_prod_box_big"></div>
						<div class="bottom_prod_box_big"></div>
					</div>
				</div>
			</div>
		</div>

	</tiles:putAttribute>
</tiles:insertDefinition>