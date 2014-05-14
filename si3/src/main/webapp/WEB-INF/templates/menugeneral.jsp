<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<script>
        	function enviar_formulario_ofertas_menu(){
        		document.formOfertasVigentesinicio.submit();
        	}
</script>

           <div id="menu_tab">
            <div class="left_menu_corner"></div>
                    <ul class="menu">
						<form:form method="post" action="/public/filtroOfertas" name="formOfertasVigentesinicio" modelAttribute="criterioBusqueda">
								<input type="hidden" name="tipo" value="Todas">
						</form:form>    	        
        	                    
                    
                         <li><a class="nav1" href="<c:url value="javascript:enviar_formulario_ofertas_menu()"/>" ><spring:message code="menu.inicio"/></a></li>
                         <li class="divider"></li>
                         <li><a class="nav2" href="<c:url value="/public/filtroOfertas"/>" ><spring:message code="menu.buscarofertas"/></a></li>
                         <li class="divider"></li>
                         <li><a class="nav4" href="<c:url value="/public/register?type=user"/>"><spring:message code="menu.registro"/></a></li>
                         <li class="divider"></li>
                         <li><a class="nav5" href="<c:url value="/login"/>"><spring:message code="menu.login"/></a></li>
                         <li class="divider"></li>
                         <li><a class="nav6" href="<c:url value="/public/contact"/>"><spring:message code="menu.contacto"/></a></li>
                         <li class="divider"></li>
                         <li><a class="nav7" href="<c:url value="/resources/pdf/memoria.pdf"/>" target="_blank"><spring:message code="menu.memoria"/></a>
                         <li class="divider"></li>
                    </ul>

             <div class="right_menu_corner"></div>
            </div><!-- end of menu tab -->
            
