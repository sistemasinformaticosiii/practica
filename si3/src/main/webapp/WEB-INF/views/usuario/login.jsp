<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Portal de Ocio - Login </title>
</head>
<body>

<form name='f' action='j_spring_security_check' method='POST'>
   <table>
      <tr><td>Usuario:</td><td><input type='text' name='j_username' value=''></td></tr>
      <tr><td>Contrase�a:</td><td><input type='password' name='j_password'/></td></tr>
      <tr><td colspan='2'><input name="submit" type="submit"/></td></tr>
      <tr><td colspan='2'><input name="reset" type="reset"/></td></tr>
   </table>
</form>
</body>
</html>