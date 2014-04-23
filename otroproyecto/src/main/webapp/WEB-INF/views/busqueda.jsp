<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<form method="POST" action="<c:url value="/busqueda"/>">
    
        
        <table>
            <tr>
                <td><label for="title">Nombre</label></td>
                <td><input id="title" name="title" /></td>
            </tr>
        
        	<tr>
                <td><label for="municipio">Municipio</label></td>
                <td><input id="municipio" name="municipio" /></td>
            </tr>
            <tr>
                <td><label for="fecha">Fecha</label></td>
                <td><input id="fecha" name="fecha" /></td>
            </tr>
            <tr>
                <td><label for="precio">Precio</label></td>
                <td><input id="precio" name="precio" /></td>
            </tr>
            <tr>
                <td><label for="personas">Personas</label></td>
                <td><input id="personas" name="personas" /></td>
            </tr>
        </table>
    
    <button id="buscar">Buscar</button>
</form>

