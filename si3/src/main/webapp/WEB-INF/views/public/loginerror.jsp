<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


<tiles:insertDefinition name="loginTemplate">
	<tiles:putAttribute name="body">
		<div class="center_content">
			<div class="center_title_bar"><spring:message code="login.errorlogincenter"/></div>

			<div class="prod_box_big">
				<div class="top_prod_box_big"></div>
				<div class="center_prod_box_big">
					<div align="center">
						<spring:message code="login.errorlogincenter"/>
						<c:if test="${not empty error}">
							<font color="red"> <spring:message code="login.errorloginingresar"/>. <br /> <spring:message code="login.errorloginmotivo"/>:${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}
							</font>
						</c:if>
					</div>
					<div class="top_prod_box_big"></div>
					<div class="bottom_prod_box_big"></div>
				</div>
			</div>
		</div>
	</tiles:putAttribute>
</tiles:insertDefinition>