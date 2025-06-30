<!-- #include file="../conexao.asp" -->
<!-- #include file="conexao_adm.asp" -->
<!-- #include file="validasenha.asp" -->
<html>
<head>
<title>Administrador <%= ucase(cliente) %></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<script language="JavaScript">
<!--


function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(pRseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);

function retorna(valor)
{
	window.returnValue = valor;
	window.close();
}
// -->
</script>

<link href="../../css/pag.css" rel="stylesheet" type="text/css">
</head>

<body bgcolor="#3399CC"  vlink="#0000FF" alink="#0066FF" leftmargin="00" topmargin="0" marginwidth="0" marginheight="0">
<table width="100%" height="100%" border="1" align="center" cellspacing="0">
 <tr valign="top"> 
  <td height="366" bordercolor="#999999" bgcolor="#CCCCCC"><blockquote> 
	<p><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Estilos 
	 dispon&iacute;veis:</strong></font></p>
	<p><font size="2" face="Verdana, Arial, Helvetica, sans-serif"> 
	 <%
  cam_estilos = Server.Mappath("../clientes/" & cliente & "/estilos")
  Set pasta = fso.GetFolder(cam_estilos)
  For each arq in pasta.Files
	  %>
	 <a href="#" onClick="retorna('<%= arq.name %>')"><%= replace(ucase(arq.name), ".CSS", "") %></a><br>
	 <%
  Next
  %>
	 </font></p>
   </blockquote></td>
 </tr>
 <tr bordercolor="#CCCCCC"> 
  <td height="2" bgcolor="#CCCCCC"><font face="Arial, Helvetica, sans-serif"><b><a href="#" onClick="javascript:retorna('cancelar')" class="links"><font size="2">Cancelar</font></a> 
   </b></font> <div align="right"></div></td>
 </tr>
</table>

</body>
</html>
<!-- #include file="../fechaconexoes.asp" -->
