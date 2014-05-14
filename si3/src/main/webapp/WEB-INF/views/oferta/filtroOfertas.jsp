<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<tiles:insertDefinition name="defaultTemplategeneral">
	<tiles:putAttribute name="body">
		<link rel="stylesheet"
			href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
		<script src="//code.jquery.com/jquery-1.10.2.js"></script>
		<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
		<link rel="stylesheet" href="/resources/demos/style.css">


		<script>
			$(function() {

				//Array para dar formato en español
				$.datepicker.regional['es'] = {
					closeText : 'Cerrar',
					prevText : 'Previo',
					nextText : 'Próximo',

					monthNames : [ 'Enero', 'Febrero', 'Marzo', 'Abril',
							'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre',
							'Octubre', 'Noviembre', 'Diciembre' ],
					monthNamesShort : [ 'Ene', 'Feb', 'Mar', 'Abr', 'May',
							'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic' ],
					monthStatus : 'Ver otro mes',
					yearStatus : 'Ver otro año',
					dayNames : [ 'Domingo', 'Lunes', 'Martes', 'Miércoles',
							'Jueves', 'Viernes', 'Sábado' ],
					dayNamesShort : [ 'Dom', 'Lun', 'Mar', 'Mie', 'Jue', 'Vie',
							'Sáb' ],
					dayNamesMin : [ 'Do', 'Lu', 'Ma', 'Mi', 'Ju', 'Vi', 'Sa' ],
					dateFormat : 'dd/mm/yy',
					firstDay : 0,
					initStatus : 'Selecciona la fecha',
					isRTL : false
				};
				$.datepicker.setDefaults($.datepicker.regional['es']);
		<%--		 //Establecemos fecha por defecto Hoy en datepicker.
		 var currentDate = new Date();  
		 $("#fecha").datepicker("setDate",currentDate);--%>
			//miDate: fecha de comienzo D=días | M=mes | Y=año
				//maxDate: fecha tope D=días | M=mes | Y=año
				$("#fecha").datepicker({
					minDate : "-0D",
					maxDate : "+20M +10D"
				});

			});
		</script>

		<script>
			$(function() {
				$("#slider-range-min").slider({
					range : "min",
					value : 0,
					min : 0,
					max : 700,
					slide : function(event, ui) {
						$("#precio").val(ui.value);
					}
				});
				$("#precio").val($("#slider-range-min").slider("value"));
			});
		</script>


		<div class="center_content">
			<div class="center_title_bar"><spring:message code="busqueda.titlebar"/></div>

			<div class="prod_box_big">
				<div class="top_prod_box_big"></div>
				<div class="center_prod_box_big">

					<div align="center">



						<form:form method="post" action="/public/filtroOfertas"
							modelAttribute="criterioBusqueda">
							<table>
								<tr>
									<td><spring:message code="busqueda.tipo"/>:</td>
									<td><form:select path="tipo" items="${map.tipoList}" /></td>
									<td><form:errors path="tipo" cssClass="error" /></td>
									<td><label for="title"><spring:message code="busqueda.localidad"/>:</label></td>
									<td><form:input path="localidad" align="left" /></td>
									<td><form:errors path="localidad" cssClass="error" /></td>
								</tr>
								<tr>
									<td><label for="fecha"><spring:message code="busqueda.fecha"/>:</label></td>
									<td><form:input path="fecha" size="10" align="left" /></td>
									<td><form:errors path="fecha" cssClass="error" /></td>
								</tr>
								<tr>
									<td><label for="precio"><spring:message code="busqueda.preciomaximo"/></label></td>
									<td><form:input path="precio" size="10" /></td>
									<td><form:errors path="precio" cssClass="error" /></td>
									<td><div id="slider-range-min"></div></td>
								</tr>
								<tr>
									<td><label for="plazas"><spring:message code="busqueda.plazasminimas"/>:</label></td>
									<td><form:input path="plazas" /></td>
									<td><form:errors path="plazas" cssClass="error" /></td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td><input type="submit" value="<spring:message code="busqueda.botonbuscarofertas"/>" /></td>
								</tr>
							</table>
						</form:form>
					</div>



					<c:if test="${not empty listaOfertas}">
						<table>
							<tr>
								<td class="heading">Tipo</td>
								<td class="heading">Categoria</td>
								<td class="heading">Titulo</td>
								<td class="heading">Fecha Fin</td>
								<td class="heading">Localidad</td>
								<td class="heading">Direccion</td>
								<td class="heading">Descripcion</td>
								<td class="heading">Plazas disponibles</td>
								<td class="heading">Precio</td>
								<td class="heading">Editar</td>
								<td class="heading">Reservar</td>
							</tr>
							<c:forEach items="${listaOfertas}" var="oferta">
								<tr>
									<td>${oferta.tipo}</td>
									<td>${oferta.categoria}</td>
									<td>${oferta.titulo}</td>
									<td>${oferta.fechaFin}</td>
									<td>${oferta.localidad}</td>
									<td>${oferta.direccion}</td>
									<td>${oferta.descripcion}</td>
									<td>${oferta.plazasDisponibles}</td>
									<td>${oferta.precio}</td>
									<td><a href="editOferta?id=${oferta.codOferta}">Detalle</a></td>
									<td><a href="reservaOferta?id=${oferta.codOferta}">Reservar</a></td>
								</tr>
							</c:forEach>
						</table>
					</c:if>
				</div>
			</div>
		</div>
	</tiles:putAttribute>
</tiles:insertDefinition>