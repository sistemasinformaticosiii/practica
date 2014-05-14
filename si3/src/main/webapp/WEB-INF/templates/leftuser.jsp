<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<script>
	function enviar_formulario_entradas() {
		document.formEntradas.submit();
	}
	function enviar_formulario_restaurantes() {
		document.formRestaurantes.submit();
	}
	function enviar_formulario_actividades() {
		document.formActividades.submit();
	}
</script>
<div class="left_content">
	<div class="title_box"><spring:message code="left.tiposdeofertas"/></div>

	<ul class="left_menu">


		<form:form method="post" action="/public/filtroOfertas" name="formEntradas"
			modelAttribute="criterioBusqueda">
			<input type="hidden" name="tipo" value="Entradas">
		</form:form>
		<li class="odd"><a
			href="<c:url value="javascript:enviar_formulario_entradas()"/>"><spring:message code="left.tipoofertas.entradas"/></a></li>


		<form:form method="post" action="/public/filtroOfertas"
			name="formRestaurantes" modelAttribute="criterioBusqueda">
			<input type="hidden" name="tipo" value="Restaurantes">
		</form:form>
		<li class="even"><a
			href="<c:url value="javascript:enviar_formulario_restaurantes()"/>"><spring:message code="left.tipoofertas.restaurantes"/></a></li>


		<form:form method="post" action="/public/filtroOfertas"
			name="formActividades" modelAttribute="criterioBusqueda">
			<input type="hidden" name="tipo" value="Actividades">
		</form:form>
		<li class="odd"><a
			href="<c:url value="javascript:enviar_formulario_actividades()"/>"><spring:message code="left.tipoofertas.actividades"/></a></li>
	</ul>

	<div class="title_box"><spring:message code="left.misreservas"/></div>
	<ul class="left_menu">
		<li class="odd"><a href="<c:url value="/cliente/reservasListCliente"/>"><spring:message code="left.vermisreservas"/></a></li>
	</ul>

	<div class="title_box"><spring:message code="left.missuscripciones"/></div>
	<ul class="left_menu">
		<li class="odd"><a href="<c:url value="/cliente/getListSubscription"/>"><spring:message code="left.vermissuscripciones"/></a></li>
	</ul>



	<div class="banner_adds">

		<a href="#"><img
			src="<c:url value="/resources/images/bann2.jpg"/>" alt="" title=""
			border="0" /></a>
	</div>


</div>
<!-- end of left content -->