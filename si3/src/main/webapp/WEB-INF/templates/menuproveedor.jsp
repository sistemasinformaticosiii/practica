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
						<form:form method="post" action="/public/filtroOfertas" name="formOfertasVigentesinicio" modelAttribute="criterioBusqueda">
								<input type="hidden" name="tipo" value="Todas">
						</form:form>    	        
        	                    
                    
                         <li><a class="nav1" href="<c:url value="javascript:enviar_formulario_ofertas_menu()"/>" >Inicio </a></li>
                         <li class="divider"></li>
                         <li><a class="nav2" href="<c:url value="/proveedor/registerOferta?type=Proveedor"/>">Gestionar Ofertas</a></li>
                         <li class="divider"></li>
						<li><a class="nav3" href="<c:url value="/registered/cuenta"/>" >Mi cuenta</a></li>
                         <li class="divider"></li>
                         <li><a class="nav5" href="<c:url value="/public/logout"/>">Logout </a></li>
                         <li class="divider"></li>
                         <li><a class="nav6" href="<c:url value="/public/contact"/>">Contacto</a></li>
                         <li class="divider"></li>
                         <li><a class="nav7" href="<c:url value="/resources/pdf/memoria.pdf"/>" target="_blank">Memoria</a>
                         <li class="divider"></li>
                          <security:authorize access="isAuthenticated()">
                         <li><a class="nav8" href="<c:url value="/registered/cuenta"/>">Usuario:
							<security:authentication property="principal.username" />[
							<security:authentication property="principal.authorities"/>]
							</a></li>
						</security:authorize>
                    </ul>

             <div class="right_menu_corner"></div>
            </div><!-- end of menu tab -->