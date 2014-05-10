<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<script>
        	function enviar_formulario_ofertas_menu(){
        		document.formOfertasVigentesinicio.submit();
        	}
</script>

           <div id="menu_tab">
            <div class="left_menu_corner"></div>
                    <ul class="menu">
						<form:form method="post" action="/filtroOfertas" name="formOfertasVigentesinicio" modelAttribute="criterioBusqueda">
								<input type="hidden" name="tipo" value="Todas">
						</form:form>    	        
                         <li><a class="nav5" href="<c:url value="/logout"/>">Logout </a></li>
                         <li class="divider"></li>
                         <li><a class="nav7" href="<c:url value="/resources/pdf/guiausuario.pdf"/>" target="_blank">Gu&iacute;a de usuario</a>
                         <li class="divider"></li>
                          <security:authorize access="isAuthenticated()">
                         <li><a class="nav8" href="<c:url value="/cuenta"/>">Usuario:
							<security:authentication property="principal.username" />[
							<security:authentication property="principal.authorities"/>]
							</a></li>
						</security:authorize>
                    </ul>

             <div class="right_menu_corner"></div>
            </div><!-- end of menu tab -->