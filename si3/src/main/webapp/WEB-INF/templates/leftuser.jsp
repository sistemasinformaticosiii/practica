<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
	<div class="title_box">Tipos de Ofertas</div>

	<ul class="left_menu">


		<form:form method="post" action="/filtroOfertas" name="formEntradas"
			modelAttribute="criterioBusqueda">
			<input type="hidden" name="tipo" value="Entradas">
		</form:form>
		<li class="odd"><a
			href="<c:url value="javascript:enviar_formulario_entradas()"/>">Entradas
				de espect&aacute;culos</a></li>


		<form:form method="post" action="/filtroOfertas"
			name="formRestaurantes" modelAttribute="criterioBusqueda">
			<input type="hidden" name="tipo" value="Restaurantes">
		</form:form>
		<li class="even"><a
			href="<c:url value="javascript:enviar_formulario_restaurantes()"/>">Restaurantes</a></li>


		<form:form method="post" action="/filtroOfertas"
			name="formActividades" modelAttribute="criterioBusqueda">
			<input type="hidden" name="tipo" value="Actividades">
		</form:form>
		<li class="odd"><a
			href="<c:url value="javascript:enviar_formulario_actividades()"/>">Actividades</a></li>
	</ul>

	<div class="title_box">Mis Reservas</div>
	<ul class="left_menu">
		<li class="odd"><a href="<c:url value="/reservasListCliente"/>">Ver mis reservas</a></li>
	</ul>

	<div class="title_box">Mis Suscripciones</div>
	<ul class="left_menu">
		<li class="odd"><a href="<c:url value="/getListSubscription"/>">Ver mis suscripciones</a></li>
	</ul>



	<div class="banner_adds">

		<a href="#"><img
			src="<c:url value="/resources/images/bann2.jpg"/>" alt="" title=""
			border="0" /></a>
	</div>


</div>
<!-- end of left content -->