
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<tiles:insertDefinition name="defaultTemplategeneral">
	<tiles:putAttribute name="center">  
<link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">


	<script>
	 $(function() {
		    
		 //Array para dar formato en espa�ol
		  $.datepicker.regional['es'] = 
		  {
		  closeText: 'Cerrar', 
		  prevText: 'Previo', 
		  nextText: 'Pr�ximo',
		  
		  monthNames: ['Enero','Febrero','Marzo','Abril','Mayo','Junio',
		  'Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre'],
		  monthNamesShort: ['Ene','Feb','Mar','Abr','May','Jun',
		  'Jul','Ago','Sep','Oct','Nov','Dic'],
		  monthStatus: 'Ver otro mes', yearStatus: 'Ver otro a�o',
		  dayNames: ['Domingo','Lunes','Martes','Mi�rcoles','Jueves','Viernes','S�bado'],
		  dayNamesShort: ['Dom','Lun','Mar','Mie','Jue','Vie','S�b'],
		  dayNamesMin: ['Do','Lu','Ma','Mi','Ju','Vi','Sa'],
		  dateFormat: 'dd/mm/yy', firstDay: 0, 
		  initStatus: 'Selecciona la fecha', isRTL: false};
		 $.datepicker.setDefaults($.datepicker.regional['es']);
		 
<%--		 //Establecemos fecha por defecto Hoy en datepicker.
		 var currentDate = new Date();  
		 $("#fecha").datepicker("setDate",currentDate);--%>		 
		 
		 //miDate: fecha de comienzo D=d�as | M=mes | Y=a�o
		 //maxDate: fecha tope D=d�as | M=mes | Y=a�o
		    $( "#fecha" ).datepicker({ minDate: "-0D", maxDate: "+20M +10D" });
		 
	
		  });
</script>
		
<script>
		$(function() {
		$( "#slider-range-min" ).slider({
		range: "min",
		value: 0,
		min: 0,
		max: 700,
		slide: function( event, ui ) {
		$( "#precio" ).val(ui.value );
		}
		});
		$( "#precio" ).val($( "#slider-range-min" ).slider( "value" ) );
		});
</script>
		
<body>
	<center>
		<div>
			<form:form method="post" action="/filtroOfertas" modelAttribute="criterioBusqueda">
				<table>
					<tr>
      					<td>Tipo :</td>
      					<td><form:select path="tipo" items="${map.tipoList}" /></td>
      					<td><form:errors path="tipo" cssClass="error" /></td>
     				
                		<td><label for="title">Localidad</label></td>
                		<td><form:input path="localidad" align="left" /></td>
                		<td><form:errors path="localidad" cssClass="error" /></td>
            		</tr>
            		
            		<tr>
					
						<td><label for="fecha">Fecha :</label></td>
						
	    				<td><form:input path="fecha" size="10" align="left"/></td>
	    				
	    				<td><form:errors path="fecha" cssClass="error"/></td>
	    				
	    			</tr>
	    			<td><label for="precio">Precio m�ximo</label></td>
               		
                		<td><form:input path="precio"  size="10" /></td>
                		<td><form:errors path="precio" cssClass="error" /></td>
                		<td><div id="slider-range-min"></div></td>
	    				
	    			<tr>
                		
            		</tr>
            		<tr>
                		<td><label for="plazas">Plazas m�nimas disponibles:</label></td>
                		<td><form:input path="plazas" /></td>
                		<td><form:errors path="plazas" cssClass="error" /></td>
            		</tr>
					<tr>
						<td>&nbsp;</td>
						<td><input type="submit" value="Buscar ofertas" /></td>
					</tr>
					
									
				</table>
			</form:form>
			
		</div>
	</center>
<div class="center_title_bar">Ofertas</div>
	
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
	
</body>
</tiles:putAttribute>
</tiles:insertDefinition>