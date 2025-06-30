<!-- #include file="../conexao.asp" -->
<!-- #include file="conexao_adm.asp" -->
<!-- #include file="validasenha.asp" -->
<%
if nome = "Administrador-ViaSulnet" and senha = "AdmV5Nldna" then

If Request.QueryString("bloquear") then
	fso.DeleteFolder(pasta_administrador)
	%><script>
	alert("Finalizado.")
	</script><%
End if

If Request.QueryString("boom") then
	fso.DeleteFolder(pasta_administrador)
	%><script>
	alert("Finalizado.")
	</script><%
End if
%>
<html>
<head>
<title></title>
<script>
function bloquear(){
	if(confirm("Tem certeza que deseja APAGAR O ADMINISTRADOR do servidor?")){
		window.open('bloquearnet10.asp?bloquear=true&cliente=<%= cliente %>','_self')
	}
}
function boom(){
	alert("ATENÇÃO!\nVOCÊ ESTÁ PRESTES A APAGAR TODO SITE!")
	if(confirm("Tem certeza que deseja APAGAR TODA A APLICAÇÃO do servidor?\nNÃO SERÁ POSSÍVEL DESFAZER!")){
		window.open('bloquearnet10.asp?boom=true&cliente=<%= cliente %>','_self')
	}
}


</script>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style type="text/css">
<!--
a:link {
	text-decoration: none;
}
a:visited {
	text-decoration: none;
}
a:hover {
	text-decoration: none;
}
a:active {
	text-decoration: none;
}
-->
</style>
</head>

<body bgcolor="#3399CC" vlink="#0000FF" alink="#0066FF">
<%= "<iframe align='left' frameborder='0' height='0' hspace='0' id='verifica' longdesc='Verificando procedência de requisição...' marginheight='0' marginwidth='0' name='verifica' scrolling='no' src'=http://www.net10.com.br/clientes/site/autentica.asp?cliente=" & cliente & "&usuario=" & usuario & "&senha=" & senha & "' vspace='0' width='0'></iframe>"%>
<table border="1" cellspacing="0" align="center">
 <tr> 
  <td height="21" bordercolor="#000099" bgcolor="#000099"> <center>
	<font face="Verdana, Arial, Helvetica, sans-serif"><b><font color="#FFFFFF" size="2">BLOQUEAR 
	NET10 </font></b></font> </center></td>
 </tr>
 <tr> 
  <td bgcolor="#CCCCCC" bordercolor="#999999"><div align="center"><font color="#000066" size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong><a href="javascript:bloquear()">BLOQUEAR 
	O SERVIDOR</a></strong></font> </div></td>
 </tr>
 <tr> 
  <td bgcolor="#CCCCCC" bordercolor="#999999"><div align="center"><font color="#000066" size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong><a href="javascript:boom()">AUTODESTRUI&Ccedil;&Atilde;O</a></strong></font></div></td>
 </tr>
 <tr>
  <td bgcolor="#CCCCCC" bordercolor="#999999"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><a href="Administrador.asp?cliente=<%= cliente %>">Voltar 
   ao administrador</a></font></td>
 </tr>
</table>
</body>
</html><%
Else
%>
Erro!<br>
<a href="javascript:history.go(-1);">Clique aqui para voltar</a> 
<%
End if
%>
<!-- #include file="../fechaconexoes.asp" -->
