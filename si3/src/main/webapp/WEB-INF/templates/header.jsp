<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script>
        	function enviar_formulario_ofertas_inicio(){
        		document.formOfertasVigentes.submit();
        	}
</script>

<div class="top_bar">
<!--     <div class="top_search"> -->
<!--         <div class="search_text"> -->
<%--         	<a href="<c:url value="/public/filtroOfertas/"/>" >B&uacute;squeda</a></div> --%>
<!--             <input type="text" class="search_input" name="search" /> -->
<%--             <input type="image" src="<c:url value="/resources/images/search.gif"/>"/> --%>
<!--         </div> -->
                
        <div class="languages">
        	<div class="lang_text">Idiomas:</div>
            <a href="#" class="lang"><img src="<c:url value="/resources/images/en.gif"/>" alt=""  title="" border="0" /></a>      
        </div>
    
    </div>

	<div id="header">
        
        <div id="logo">
				<form:form method="post" action="/public/filtroOfertas" name="formOfertasVigentes" modelAttribute="criterioBusqueda">
					<input type="hidden" name="tipo" value="Todas">
				</form:form>    	        
        	                    
            <a href="<c:url value="javascript:enviar_formulario_ofertas_inicio()"/>"><img src="<c:url value="/resources/images/logo.png"/>" alt="" title="" border="0" width="237" height="140" /></a>
	    </div>
        
    </div>

