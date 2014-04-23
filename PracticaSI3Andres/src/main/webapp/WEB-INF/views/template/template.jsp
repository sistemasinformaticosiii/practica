<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><tiles:insertAttribute name="title" ignore="true" /></title>
<style type="text/css">
    body {
        margin:0px;
        padding:0px;
        height:100%;
        overflow:hidden;
    }
 
    .page {
        min-height:100%;
        position:relative;
    }
     
    .header {
        padding:10px;
        width:100%;
        text-align:center;
    }
     
    .content {
            padding:10px;
            padding-bottom:20px; /* Height of the footer element */
            overflow:hidden;
    }
     
    .menu {
        padding:50px 10px 0px 10px;
        width:150px;
        float:left;
    }
 
    .body {
        margin:50px 10px 0px 0px;
    }
     
    .footer {
        clear:both;
        position:absolute;
        bottom:0;
        left:0;
        text-align:center;
        width:100%;
        height:20px;
    }
     
    </style>
</head>
<body>
<table border="1" cellpadding="2" cellspacing="2" align="center">
    <tr>
        <td height="30" colspan="2"><tiles:insertAttribute name="header" />
        </td>
    </tr>
    <tr>
        <td height="250"><tiles:insertAttribute name="menu" /></td>
        <td width="350"><tiles:insertAttribute name="body" /></td>
    </tr>
    <tr>
        <td height="30" colspan="2"><tiles:insertAttribute name="footer" />
        </td>
    </tr>
</table>
</body>
</html>