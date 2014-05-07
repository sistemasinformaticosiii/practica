<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<tiles:insertDefinition name="defaultTemplategeneral">
	<tiles:putAttribute name="center">

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
		  dateFormat: 'yy-mm-dd', firstDay: 0, 
		  initStatus: 'Selecciona la fecha', isRTL: false};
		 $.datepicker.setDefaults($.datepicker.regional['es']);

		 //miDate: fecha de comienzo D=d�as | M=mes | Y=a�o
		 //maxDate: fecha tope D=d�as | M=mes | Y=a�o
		    $( "#fechaInicio" ).datepicker({ minDate: "-0D", maxDate: "+20M +10D" });
		    $( "#fechaFin" ).datepicker({ minDate: "-0D", maxDate: "+20M +10D" });
		  });
  </script> 
 
  <script>
  $(function() {
    var localidades = [
                   	"Albacete",	"Alicante",	"Almer�a", "�lava",	"Asturias", "�vila", "Badajoz",	"Islas Baleares",
                	"Barcelona", "Bizkaia", "Burgos", "C�ceres", "C�diz", "Cantabria", "Castell�n", "Ceuta", "Ciudad Real",
                	"C�rdoba", "Coru�a A", "Cuenca", "Gipuzkoa", "Girona", "Granada", "Guadalajara", "Huelva", "Huesca",
                	"Ja�n",	"Le�n", "Lugo", "Lleida", "Madrid",	"M�laga", "Melilla", "Murcia", "Navarra", "Ourense",
                	"Palencia",	"Palmas Las", "Pontevedra", "Rioja La", "Salamanca", "Santa Cruz de Tenerife", "Segovia",
                	"Sevilla", "Soria",	"Tarragona", "Teruel", "Toledo", "Valencia", "Valladolid", "Zamora", "Zaragoza"
    ];
    
    $( "#localidad" ).autocomplete({
      source: localidades
    });   
  });
  </script>

  <script type="text/javascript">
    $(document).ready(function(){
      $('#ofertaaltaform').validate({
        rules: {
          'titulo': 'required',
          'direccion': 'required',
          'fechaInicio': 'required',
          'fechaFin': 'required',
          'localidad': 'required',
          'descripcion': 'required',
          'plazasTotal': {required: 'required', min: 1},
          'precio': { required: 'requerido', number: true}
        },
        messages: {
          'titulo': 'requerido',
          'direccion': 'requerido',
          'fechaInicio': 'requerido',
          'fechaFin': 'requerido',
          'localidad': 'requerido',
          'descripcion' : 'requerido',
          'plazasTotal': 'requerido valor mayor que 0',
          'precio': 'valor numerico requerido' 
        },
	  });
      $("#plazasTotal").keyup(function () {
          var value = $(this).val();
          $("#plazasDisponibles").val(value);
      });
      return true;
    });    
  </script>
  
</head>
<body>  
	<center>
		<br /> <br /> <br /> <b>Oferta - Alta </b> <br />
		<br />
		<div>
			<form:form method="post" id="ofertaaltaform" action="/si3/insertOferta" modelAttribute="oferta">
				<table>
					<tr>
						<%-- Campo oculto <td>Cod Usuario :</td>--%>
						<td><form:input path="codUsuario" style="display:none" /></td>
					</tr>
					<tr>
      					<td>Tipo :</td>
      					<td><form:select path="tipo" items="${map.tipoList}" /></td>
     				</tr>
					<tr>
						<td>Categoria :</td>
						<td><form:input path="categoria" /></td>
					</tr>
					<tr>
						<td>Titulo :</td>
						<td><form:input path="titulo" /></td>
					</tr>
					<tr>
						<td>Fecha Inicio :</td>
						<td><form:input path="fechaInicio" /></td>
					</tr>
					<tr>
						<td>Fecha Fin :</td>
						<td><form:input path="fechaFin" /></td>
					</tr>
					<tr>
						<td>Localidad :</td>
						<td><form:input path="localidad" /></td>
					</tr>
					<tr>
						<td>direccion :</td>
						<td><form:input path="direccion" /></td>
					</tr>
     				<tr>
      					<td>Descripcion :</td>
      					<td><form:input path="descripcion" /></td>
     				</tr>
					<tr>
						<td>Plazas Totales :</td>
						<td><form:input path="plazasTotal" /></td>
					</tr>
					<tr>
						<%-- Campo Oculto <td>Plazas Disponibles :</td>--%>
						<td><form:input path="plazasDisponibles" style="display:none" /></td>
					</tr>
					<tr>
						<td>Precio :</td>
						<td><form:input path="precio" /></td>
					</tr>
					<tr>
						<td>Descuento :</td>
						<td><form:input path="descuento" /></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td><input type="submit" value="Guardar" /></td>
					</tr>
					<tr>
						
						<td colspan="2"><a href="getList">Ver lista de usuarios</a></td>
					</tr>
					<tr>	
						<td colspan="2"><a href="getListOffer">Ver lista de ofertas</a></td>
					</tr>
				</table>
			</form:form>
		</div>
	</center>
	</body>
    </tiles:putAttribute>
</tiles:insertDefinition>

	