<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
                         <li><a class="nav2" href="<c:url value="/public/filtroOfertas"/>" >Buscar Ofertas</a></li>
                         <li class="divider"></li>
                         <li><a class="nav4" href="<c:url value="/public/register?type=user"/>">Registro</a></li>
                         <li class="divider"></li>
                         <li><a class="nav5" href="<c:url value="/login"/>">Login </a></li>
                         <li class="divider"></li>
                         <li><a class="nav6" href="<c:url value="/public/contact"/>">Contacto</a></li>
                         <li class="divider"></li>
                         <li><a class="nav7" href="<c:url value="/resources/pdf/memoria.pdf"/>" target="_blank">Memoria</a>
                         <li class="divider"></li>
                    </ul>

             <div class="right_menu_corner"></div>
            </div><!-- end of menu tab -->
            
