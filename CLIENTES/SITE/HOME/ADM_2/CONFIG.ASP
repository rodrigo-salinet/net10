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
	<font color="#FFFFFF" size="2" face="Verdana, Arial, Helvetica, sans-serif"><b>ADMINISTRADOR</b> 
	</font> </center></td>
 </tr>
 <tr> 
  <td bgcolor="#CCCCCC" bordercolor="#999999" align="center"><font color="#000099" size="2" face="Verdana, Arial, Helvetica, sans-serif" title="Clique aqui para alterar as propriedades do menu lateral"><b><a href="admestilos/cria_estilo01.asp?cliente=<%= cliente %>&arquivo=menu_lateral">Alterar 
   menu </a></b></font></td>
 </tr>
 <tr> 
  <td bgcolor="#CCCCCC" bordercolor="#999999" align="center"><font color="#000099" size="2" face="Verdana, Arial, Helvetica, sans-serif" title="Clique aqui para alterar as propriedades do campo de busca"><b><a href="admestilos/cria_estilo01.asp?cliente=<%= cliente %>&arquivo=busca">Alterar 
   busca </a></b></font></td>
 </tr>
 <tr>
  <td bgcolor="#CCCCCC" bordercolor="#999999" align="center"><font color="#000099" size="2" face="Verdana, Arial, Helvetica, sans-serif" title="Clique aqui para alterar os resumos de itens"><b><a href="admestilos/cria_estilo01.asp?cliente=<%= cliente %>&arquivo=tabela">Alterar 
   resumo de item</a></b></font></td>
 </tr>
 <tr> 
  <td bgcolor="#CCCCCC" bordercolor="#999999" align="center"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong><a href="ADMEstilos/Default.asp?cliente=<%= cliente %>">Configurar 
   estilos</a></strong></font></td>
 </tr>
 <tr> 
  <td bgcolor="#CCCCCC" bordercolor="#CCCCCC"><font size="2">&nbsp;</font></td>
 </tr>
 <tr> 
  <td bgcolor="#CCCCCC"><font size="2" face="Arial, Helvetica, sans-serif"><b><a href="Administrador.asp?cliente=<%= cliente %>" class="links">Voltar</a></b></font> 
  </td>
 </tr>
</table>
</body>
</html>
<!-- #include file="../fechaconexoes.asp" -->
