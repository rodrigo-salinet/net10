<!-- #include file="../conexao.asp" -->
<!-- #include file="conexao_adm.asp" -->
<!-- #include file="validasenha.asp" -->
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<script language="JavaScript">
<!--
function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);
// -->
</script>
</head>

<body bgcolor="#3399CC" vlink="#0000FF" alink="#0066FF">
<table width="43%" border="1" cellspacing="0" align="center">
 <tr> 
  <td bgcolor="#000099" bordercolor="#000099"> <center>
	<strong><font color="#FFFFFF" size="2" face="Verdana, Arial, Helvetica, sans-serif">EXCLUIR 
	ARQUIVO </font> </strong></center></td>
 </tr>
 <% If Request.Querystring("excluido") = "sim" then %>
 <tr> 
  <td bgcolor="#CCCCCC"> <center>
	<font size="2" color="#990000" face="Arial, Helvetica, sans-serif"><i> <b>Exclu&iacute;do 
	com sucesso.</b></i></font> 
   </center></td>
 </tr>
 <% End if %>
 <%
  cam = Server.Mappath("../../downloads")
  Set pasta = fso.GetFolder(cam)
  For each arq in pasta.Files
  nome = arq.name
  %>
 <tr> 
  <td bgcolor="#CCCCCC" bordercolor="#999999"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b><font color="#000099"><a href="#" class="links" onClick="if(confirm('Deseja mesmo apagar este arquivo? (Não é possível desfazer)')){window.open('excluirarquivo2.asp?img=<%= nome %>', '_self')}"><%= nome %></a></font></b></font></td>
 </tr>
 <%
  i = i + 1
  Next
  If i = empty then
  %>
 <tr> 
  <td bordercolor="#999999" bgcolor="#CCCCCC"> <center>
	<b><i><font color="#000000">Nenhum arquivo para excluir. </font></i></b> 
   </center></td>
 </tr>
 <%
  End if
  %>
 <tr> 
  <td bgcolor="#CCCCCC" bordercolor="#CCCCCC">&nbsp;</td>
 </tr>
 <tr> 
  <td bgcolor="#CCCCCC" bordercolor="#999999"><font face="Arial, Helvetica, sans-serif" size="2"><a href="Administrador.asp?cliente=<%= cliente %>" class="links"><b>Voltar</b></a></font></td>
 </tr>
</table>
</body>
</html>
<!-- #include file="../fechaconexoes.asp" -->
