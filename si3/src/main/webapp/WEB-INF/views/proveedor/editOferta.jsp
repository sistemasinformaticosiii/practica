<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<tiles:insertDefinition name="defaultTemplategeneral">
	<tiles:putAttribute name="body">

<head>
  <meta charset="utf-8">

  <link href="http://cdn-na.infragistics.com/jquery/20141/latest/css/themes/infragistics/infragistics.theme.css" rel="stylesheet" />
  <link href="http://cdn-na.infragistics.com/jquery/20141/latest/css/structure/infragistics.css" rel="stylesheet" />    
  <script src="http://modernizr.com/downloads/modernizr-latest.js"></script>
  <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
  <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.min.js"></script>
  <script src="//ajax.aspnetcdn.com/ajax/jquery.validate/1.12.0/jquery.validate.js"></script>

  <script>
	 $(function() {

		 //Array para dar formato en español
		  $.datepicker.regional['es'] = 
		  {
		  closeText: 'Cerrar', 
		  prevText: 'Previo', 
		  nextText: 'Próximo',

		  monthNames: ['Enero','Febrero','Marzo','Abril','Mayo','Junio',
		  'Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre'],
		  monthNamesShort: ['Ene','Feb','Mar','Abr','May','Jun',
		  'Jul','Ago','Sep','Oct','Nov','Dic'],
		  monthStatus: 'Ver otro mes', yearStatus: 'Ver otro año',
		  dayNames: ['Domingo','Lunes','Martes','Miércoles','Jueves','Viernes','Sábado'],
		  dayNamesShort: ['Dom','Lun','Mar','Mie','Jue','Vie','Sáb'],
		  dayNamesMin: ['Do','Lu','Ma','Mi','Ju','Vi','Sa'],
		  dateFormat: 'yy-mm-dd', firstDay: 0, 
		  initStatus: 'Selecciona la fecha', isRTL: false};
		 $.datepicker.setDefaults($.datepicker.regional['es']);

		 //miDate: fecha de comienzo D=días | M=mes | Y=año
		 //maxDate: fecha tope D=días | M=mes | Y=año
		    $( "#fechaInicio" ).datepicker({ minDate: "-0D", maxDate: "+20M +10D" });
		    $( "#fechaFin" ).datepicker({ minDate: "-0D", maxDate: "+20M +10D" });
		  });
  </script>

<script>
    $(function(){
    	$('#ofertaeditform').validate({
            rules: {
              'titulo': 'required',
              'fechaInicio': 'required',
              'fechaFin': 'required',
              'descuento': {required:true, number:true},
              'plazasDisponibles': {required:true, digits:true},
              'precio': {required:true, number:true}
            },
        	messages: {
              'titulo': 'requerido',
              'fechaInicio': 'requerido',
              'fechaFin': 'requerido',
              'plazasDisponibles': 'numero requerido',
              'precio': 'numero requerido', 
              'descuento': 'numero requerido'
          },
    	});
        $("#plazasDisponibles").keyup(function () {
            var value = parseInt($("#ocupadas").val()) + parseInt($("#plazasDisponibles").val());
            $("#plazasTotal").val(value);
        });
    });
</script>

<script type="text/javascript">
	$(document).ready(function(){
		var value = $("#plazasTotal").val()-$("#plazasDisponibles").val();
		$("#ocupadas").val(value);
		document.getElementById("ocupadas").disabled = true;
	});
</script>

</head>

<body>
<div class="center_content">
   	<div class="center_title_bar">${oferta.titulo}</div>
    
    	<div class="prod_box_big">
        	<div class="top_prod_box_big"></div>
            <div class="center_prod_box_big">            
                 
                 <div class="product_img_big">
                 
                 <%-- Código temporal, para gestionar imágenes genéricas para los tipos: Restaurantes, Actividades y Entradas --%>
					<c:choose>
					    <c:when test="${oferta.tipo == 'Restaurantes'}">
				        		
		                 <a href="javascript:popImage('images/big_pic.jpg','Some Title')" title="header=[Zoom] body=[&nbsp;] fade=[on]">
		                 <img src="<c:url value="/resources/images/0genericas/restaurantes.jpg"/>" alt="" title="" border="0" /></a>				        		
					    </c:when>
					    <c:when test="${oferta.tipo == 'Actividades'}">
				        		
		                 <a href="javascript:popImage('images/big_pic.jpg','Some Title')" title="header=[Zoom] body=[&nbsp;] fade=[on]">
		                 <img src="<c:url value="/resources/images/0genericas/actividades.jpg"/>" alt="" title="" border="0" /></a>				        		
					    </c:when>
					    <c:when test="${oferta.tipo == 'Entradas'}">
				        		
		                 <a href="javascript:popImage('images/big_pic.jpg','Some Title')" title="header=[Zoom] body=[&nbsp;] fade=[on]">
		                 <img src="<c:url value="/resources/images/0genericas/entradas.jpg"/>" alt="" title="" border="0" /></a>				        		
					    </c:when>
					</c:choose>
	<%--  Fin selección imágenes de ofertas --%>
		               
                       
                 </div>
 			<form:form method="post" id="ofertaeditform" action="/si3/updateOferta" modelAttribute="oferta">
				<table>
					<tr>
						<td><form:input path="codUsuario" style="display:none" value="${map.oferta.codUsuario}" /></td>
					</tr>
					<tr>
						<td><form:input path="tipo" style="display:none" value="${map.oferta.tipo}" /></td>
					</tr>
					<tr>
						<td><form:input path="categoria" style="display:none" value="${map.oferta.categoria}" /></td>
					</tr>
					<tr>
						<td>Titulo :</td>
						<td><form:input path="titulo" id="titulo" value="${map.oferta.titulo}" /></td>
					</tr>
					<tr>
						<td>Fecha Inicio :</td>
						<td><form:input path="fechaInicio" value="${map.oferta.fechaInicio}" /></td>
					</tr>
					<tr>
						<td>Fecha Fin :</td>
						<td><form:input path="fechaFin" value="${map.oferta.fechaFin}" /></td>
					</tr>
					<tr>
						<td><form:input path="localidad"  style="display:none" value="${map.oferta.localidad}" /></td>
					</tr>
					<tr>
						<td><form:input path="direccion" style="display:none" value="${map.oferta.direccion}" /></td>
					</tr>
     				<tr>
      					<td>Descripcion :</td>
      					<td><form:textarea rows="4" cols="16" path="descripcion" /></td>
     				</tr>
					<tr>
						<td>Precio :</td>
						<td><form:input path="precio" id="precio" value="${map.oferta.precio}" /></td>
					</tr>
					<tr>
						<td>Descuento :</td>
						<td><form:input path="descuento" value="${map.oferta.descuento}" /></td>
					</tr>
					<tr>
						<td>Plazas Disponibles :</td>
						<td><form:input path="plazasDisponibles" id="plazasDisponibles" value="${map.oferta.plazasDisponibles}" /></td>
					</tr>
					<tr>
						<td>Plazas Ocupadas :</td>
						<td><input type="text" id="ocupadas"  /></td>
					</tr>
					<tr>
						<td>Plazas Totales :</td>
						<td><form:input path="plazasTotal" OnFocus="this.blur()" value="${map.oferta.plazasTotal}" /></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td><input type="submit" value="Guardar" />
						</td>
					</tr>
				</table>
				<form:hidden path="codOferta" value="${map.oferta.codOferta}" />

			</form:form>
		</div>                    
            </div>
            <div class="bottom_prod_box_big"></div>                                
        </div>

</body>
    </tiles:putAttribute>
</tiles:insertDefinition>



<a href="javascript:popImage('images/big_pic.jpg','Oferta')" title="header=[Zoom] body=[&nbsp;] fade=[on]"><img src="<c:url value="images/laptop.gif"/>" alt="" title="" border="0" /></a>
<a href="javascript:popImage('images/big_pic.jpg','Oferta')" title="header=[Zoom] body=[&nbsp;] fade=[on]"><img src="<c:url value="images/laptop.gif"/>" alt="" title="" border="0" /></a>

value="/resources/images/ofertas/$