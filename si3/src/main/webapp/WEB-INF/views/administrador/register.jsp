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
      $('#altasform').validate({
        rules: {
          'nombre': 'required',
          'apellidos': 'required',
          'telefono': { number: true, minlength: 9},
          'email': { required: true, email: true },
          'localidad': 'required',
          'perfil': 'required',
          'pass': 'required'
        },
        messages: {
          'nombre': 'requerido',
          'apellidos': 'requerido',
          'telefono': { number: 'al menos 9 numeros', minlength: 'al menos 9 numeros' },
          'email': { required: 'requerido' },
          'localidad': 'requerido',
          'perfil' : 'requerido',
          'pass': 'requerido'
        },
	  });
      return true;
    });    
  </script>
  
</head>

<body>
<center>

<div>
   
<form:form method="post" id="altasform" action="/insert" modelAttribute="user">
<table>
<tr>
<td>Nombre :</td>
<td><form:input path="nombre" /></td>
</tr>
<tr>
<td>Apellidos :</td>
<td><form:input path="apellidos" /></td>
</tr>
<tr>
<td>Localidad :</td>
<td><form:input path="localidad" id="localidad" name="localidad" class="input_text" /></td>
</tr>
<tr>
<td>Telefono :</td>
<td><form:input path="telefono" /></td>
</tr>
<tr>
<td>email :</td>
<td><form:input path="email" /></td>
</tr>
      <tr>
           <td>Perfil:</td>
           <td>
           <select id="perfil" name="perfil">
               <option value="Administrador">Administrador</option>
               <option value="Cliente">Cliente</option>
               <option value="Entradas">P_Entradas</option>
               <option value="Restaurantes">P_Restaurantes</option>
               <option value="Actividades">P_Actividades</option>
           </select>
       	</td>
      </tr>
<tr>
<td>password :</td>
<td><form:input path="pass" /></td>
</tr>
<tr>
<td>&nbsp;</td>
<td><input type="submit" value="Guardar" /> <input type="reset" value="Borrar" /></td>
</tr>
<tr>

<td colspan="2"><a href="<c:url value="/getList"/>">Ver lista de usuarios</a></td>
</tr>
<tr>	
<td colspan="2"><a href="<c:url value="/getListOffer"/>">Ver lista de ofertas</a></td>
</tr>
<tr>	
<td colspan="2"><a href="<c:url value="/getListSubscription"/>">Ver lista de Subscripciones</a></td>
</tr>	
<tr>	
<td colspan="2"><a href="<c:url value="/filtroOfertas"/>">Filtro Ofertas</a></td>
</tr>
<tr>	
<td colspan="2"><a href="<c:url value="/sendMail"/>">Enviar mail</a></td>
</tr>	
</table>
</form:form>
</div>
</center>
</body>

    </tiles:putAttribute>
</tiles:insertDefinition>

