<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<iframe src="Janela_imagens.asp?cliente=<%= Request.QueryString("cliente")%>" height="100%" width="100%" onClose="javascript:if(this.value==null){this.value='';};window.returnValue=this.value;"></iframe>
</body>
</html>
