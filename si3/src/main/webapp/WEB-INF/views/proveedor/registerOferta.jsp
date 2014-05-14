<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<tiles:insertDefinition name="defaultTemplategeneral">
	<tiles:putAttribute name="body">

		<link
			href="http://cdn-na.infragistics.com/jquery/20141/latest/css/themes/infragistics/infragistics.theme.css"
			rel="stylesheet" />
		<link
			href="http://cdn-na.infragistics.com/jquery/20141/latest/css/structure/infragistics.css"
			rel="stylesheet" />
		<script src="http://modernizr.com/downloads/modernizr-latest.js"></script>
		<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
		<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.min.js"></script>
		<script
			src="//ajax.aspnetcdn.com/ajax/jquery.validate/1.12.0/jquery.validate.js"></script>

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
					dateFormat : 'yy-mm-dd',
					firstDay : 0,
					initStatus : 'Selecciona la fecha',
					isRTL : false
				};
				$.datepicker.setDefaults($.datepicker.regional['es']);

				//miDate: fecha de comienzo D=días | M=mes | Y=año
				//maxDate: fecha tope D=días | M=mes | Y=año
				$("#fechaInicio").datepicker({
					minDate : "-0D",
					maxDate : "+20M +10D"
				});
				$("#fechaFin").datepicker({
					minDate : "-0D",
					maxDate : "+20M +10D"
				});
			});
		</script>

		<script>
			$(function() {
				var localidades = [ "Albacete", "Alicante", "Almería", "Álava",
						"Asturias", "Ávila", "Badajoz", "Islas Baleares",
						"Barcelona", "Bizkaia", "Burgos", "Cáceres", "Cádiz",
						"Cantabria", "Castellón", "Ceuta", "Ciudad Real",
						"Córdoba", "Coruña A", "Cuenca", "Gipuzkoa", "Girona",
						"Granada", "Guadalajara", "Huelva", "Huesca", "Jaén",
						"León", "Lugo", "Lleida", "Madrid", "Málaga",
						"Melilla", "Murcia", "Navarra", "Ourense", "Palencia",
						"Palmas Las", "Pontevedra", "Rioja La", "Salamanca",
						"Santa Cruz de Tenerife", "Segovia", "Sevilla",
						"Soria", "Tarragona", "Teruel", "Toledo", "Valencia",
						"Valladolid", "Zamora", "Zaragoza" ];

				$("#localidad").autocomplete({
					source : localidades
				});
			});
		</script>

		<script type="text/javascript">
			$(document).ready(function() {
				$('#ofertaaltaform').validate({
					rules : {
						'titulo' : 'required',
						'direccion' : 'required',
						'fechaInicio' : 'required',
						'fechaFin' : 'required',
						'localidad' : 'required',
						'descripcion' : 'required',
						'descuento' : {
							required : true,
							number : true
						},
						'plazasTotal' : {
							required : 'required',
							min : 1
						},
						'precio' : {
							required : true,
							number : true
						}
					},
					messages : {
						'titulo' : 'requerido',
						'direccion' : 'requerido',
						'fechaInicio' : 'requerido',
						'fechaFin' : 'requerido',
						'localidad' : 'requerido',
						'descripcion' : 'requerido',
						'plazasTotal' : 'requerido valor mayor que 0',
						'precio' : 'valor numerico requerido',
						'descuento' : 'valor numerico requerido'
					},
				});
				$("#plazasTotal").keyup(function() {
					var value = $(this).val();
					$("#plazasDisponibles").val(value);
				});
				return true;
			});
		</script>

		<div class="center_content">
			<div class="center_title_bar"><spring:message code="proveedor.registro.titulo"/></div>

			<div class="prod_box_big">
				<div class="top_prod_box_big"></div>
				<div class="center_prod_box_big">
					<div align="center">
						<form:form method="post" id="ofertaaltaform"
							action="/proveedor/insertOferta" modelAttribute="oferta">
							<table>
								<c:choose>
									<c:when test="${tiporegistrador=='Proveedor'}">
										<tr>
											<%-- Campo oculto <td>Cod Usuario :</td>--%>
											<td><form:input path="codUsuario" style="display:none" /></td>
										</tr>
										<tr>
											<%-- Campo oculto <td>Tipo: --%>
											<td><form:select path="tipo" style="display:none"
													items="${map.tipoList}" /></td>
										</tr>
									</c:when>
									<c:otherwise>
										<tr>
											<td><spring:message code="proveedor.registro.codusuario"/>:</td>
											<td><form:input path="codUsuario" /></td>
										</tr>
										<tr>
											<td><spring:message code="proveedor.registro.tipo"/>:</td>
											<td><form:select path="tipo">
													<form:option value="Entradas"><spring:message code="proveedor.registro.tipoentradas"/></form:option>
													<form:option value="Restaurantes"><spring:message code="proveedor.registro.tiporestaurantes"/></form:option>
													<form:option value="Actividades"><spring:message code="proveedor.registro.tipoactividades"/></form:option>

												</form:select></td>
										</tr>
									</c:otherwise>
								</c:choose>

								<tr>
									<td><spring:message code="proveedor.registro.categoria"/>:</td>
									<td><form:input path="categoria" /></td>
								</tr>
								<tr>
									<td><spring:message code="proveedor.registro.titulooferta"/>:</td>
									<td><form:input path="titulo" /></td>
								</tr>
								<tr>
									<td><spring:message code="proveedor.registro.fechainicio"/>:</td>
									<td><form:input path="fechaInicio" /></td>
								</tr>
								<tr>
									<td><spring:message code="proveedor.registro.fechafin"/>:</td>
									<td><form:input path="fechaFin" /></td>
								</tr>
								<tr>
									<td><spring:message code="proveedor.registro.localidad"/>:</td>
									<td><form:input path="localidad" /></td>
								</tr>
								<tr>
									<td><spring:message code="proveedor.registro.direccion"/>:</td>
									<td><form:input path="direccion" /></td>
								</tr>
								<tr>
									<td><spring:message code="proveedor.registro.descripcion"/>:</td>
									<td><form:input path="descripcion" /></td>
								</tr>
								<tr>
									<td><spring:message code="proveedor.registro.plazastotales"/>:</td>
									<td><form:input path="plazasTotal" /></td>
								</tr>
								<tr>
									<%-- Campo Oculto <td>Plazas Disponibles :</td>--%>
									<td><form:input path="plazasDisponibles"
											style="display:none" /></td>
								</tr>
								<tr>
									<td><spring:message code="proveedor.registro.precio"/>:</td>
									<td><form:input path="precio" /></td>
								</tr>
								<tr>
									<td><spring:message code="proveedor.registro.descuento"/>:</td>
									<td><form:input path="descuento" /></td>
								</tr>				
								<tr>
									<td>&nbsp;</td>
									<td><input type="submit" value="<spring:message code="proveedor.registro.botonguardar"/>" /></td>
								</tr>
							</table>
						</form:form>
					</div>
					<div class="top_prod_box_big"></div>
					<div class="bottom_prod_box_big"></div>
				</div>
			</div>
		</div>

	</tiles:putAttribute>
</tiles:insertDefinition>

