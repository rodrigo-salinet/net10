<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<html>
<head>
<title>Documento sem t&iacute;tulo</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<%
Set Upload = Server.CreateObject("Persits.Upload")
Upload.ProgressID = Request.QueryString("PID")
Upload.Save Server.MAppath("../clientes")
%>
</body>
</html>
