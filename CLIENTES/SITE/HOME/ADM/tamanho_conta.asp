<!-- #include file="../conexao.asp" -->
<!-- #include file="conexao_adm.asp" -->
<html>
<head>
<title>Tamanho</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<%

Set pasta1 = fso.GetFolder(fso.GetParentFoldername(whichFN))

%><%= pasta1.size/1024 %>
</body>
</html>
<!-- #include file="../fechaconexoes.asp" -->
