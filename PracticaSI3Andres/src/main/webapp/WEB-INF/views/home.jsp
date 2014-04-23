<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ page session="false" %>

<tiles:insertDefinition name="defaultTemplate">
    <tiles:putAttribute name="body">

 <div class="body">
            <h1>Home page !</h1>
<h1>
	Práctica SI3.Listado de productos 
</h1>

<p> <a href="login.html">Inicio de sesión</a>
<p> <a href="register.html">Registro de usuario</a>

<P>  The time on the server is ${serverTime}. </P>
</div>
   </tiles:putAttribute>
</tiles:insertDefinition>