<!-- #include file="../../conexao.asp" -->
<!-- #include file="../conexao_adm.asp" -->

<html>
<head>
<title>Administrador de Imagens - <%= ucase(cliente) %></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<frameset rows="*" cols="233,*" framespacing="0" frameborder="NO" border="5">
 <frame src="esquerda.asp?<%= Request.ServerVariables("QUERY_STRING")%>" name="leftFrame">
 <frame src="principal.asp?<%= Request.ServerVariables("QUERY_STRING")%>" name="mainFrame">
</frameset>
<noframes><body>

</body></noframes>
</html>
<!-- #include file="../../fechaconexoes.asp" -->
