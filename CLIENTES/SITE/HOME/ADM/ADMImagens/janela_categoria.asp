<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<iframe src="categorias.asp?<%= Request.ServerVariables("QUERY_STRING") %>" height="100%" width="100%" onClose="javascript:window.returnValue=this.value;"></iframe>
</body>
</html>
