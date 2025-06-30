<!-- #include file="../../conexao.asp" -->
<!-- #include file="../conexao_adm.asp" -->
<!-- #include file="../../CONEXAO_ULTIMAS.asp" -->
<!-- #include file="../validasenha.asp" -->

<html>
<head>
<title>Administrador <%= ucase(cliente) %></title>
<meta http-equiv="Content-Type" content="text/html; chRset=iso-8859-1">
<script language="JavaScript">
<!--
function muda(pos, id)
{
window.open("muda_posicao.asp?cliente=<%= cliente%>&posicao=" + pos + "&id="+id+"&id=<%= id %>", "_self")
}



function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(pRseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);



// -->
</script>
<link href="../../../css/pag.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.posicao {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: xx-small;
	font-weight: bold;
	color: #000066;
	background-color: #f0f0f0;
}
-->
</style>
<style type="text/css">
<!--
a:link {
	color: #0000CC;
	text-decoration: none;
}
a:visited {
	color: #0000CC;
	text-decoration: none;
}
a:hover {
	color: #990000;
	text-decoration: none;
}
a:active {
	color: #0066CC;
	text-decoration: none;
}
-->
</style>
</head>

<body bgcolor="#3399CC"  vlink="#0000FF" alink="#0066FF">
<table border="1" align="center" cellspacing="0">
 <tr> 
  <td bordercolor="#000099" bgcolor="#000099"> <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><b>ADMINISTRADOR 
	<br>
	NOT&Iacute;CIAS ROTATIVAS</b><br>
	<font color="#FFFF66" size="1"> <strong> </strong></font><br>
	</font> </div></td>
 </tr>
 <%
  If Request.QueryString("msg") <> empty then
  %>
 <tr> 
  <td bgcolor="#CCCCCC" bordercolor="#999999" align="center"><font color="#333333" size="2" face="Arial, Helvetica, sans-serif"><em><strong><%= Request.QueryString("msg")%></strong></em></font></td>
 </tr>
 <%
  End if
  %>
 <tr> 
  <td align="center" bordercolor="#999999" bgcolor="#CCCCCC"><a href="Insere.asp?cliente=<%= cliente %>"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Adicionar</strong></font></a></tr>
 <tr> 
  <td align="center" bordercolor="#999999" bgcolor="#CCCCCC"> 
   <table width="100%" border="0" cellspacing="2" cellpadding="0">
	<tr> 
	 <td align="left" valign="top"> <IFRAME allowTransparency  id=lateral align=center marginWidth=0 marginHeight=0 src="<%= endereco_virtual %>ultimas.asp?cliente=<%= cliente %>" frameBorder=0 width=160 height=100% scrolling="no"></IFRAME> 
	 </td>
	 <td align="right" valign="top"> <%
  Set rs = Conexao_ultimas.Execute("Select * from ultimas order by id_ultimas desc")
  Do while not rs.EOF
  conta = conta + 1
  %> 
	  <table width="100%" border="1" cellpadding="0" cellspacing="2" bordercolor="#CCCCCC">
	   <tr> 
		<td align="right" bordercolor="#999999"><a href="update.asp?cliente=<%= cliente %>&id=<%= rs("id_ultimas") %>"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong><%= conta %>. <%= rs("desc") %></strong></font></a>&nbsp; &nbsp;&nbsp;<font size="1" face="Verdana, Arial, Helvetica, sans-serif"><strong><a name="<%= conta %>" href="#<%= conta %>" onClick="if(confirm('Deseja excluir esta notícia?\nNão será possível desfazer.')){window.open('exclui.asp?cliente=<%= cliente %>&id=<%= rs("id_ultimas") %>','_self')}">X</a></strong></font></td>
	   </tr>
	  </table>
	  <%
	   Rs.Movenext
   Loop
   %> </td>
	</tr>
   </table></tr>
 <tr> 
  <td height="31" align="center" bordercolor="#CCCCCC" bgcolor="#CCCCCC"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong><a href="Configuracoes.asp?cliente=<%= cliente %>">Configura&ccedil;&otilde;es 
   Gerais</a></strong></font> </td>
 </tr>
 <tr> 
  <td bgcolor="#CCCCCC"><font face="Arial, Helvetica, sans-serif"><b><a href="../Administrador.asp?cliente=<%= cliente %>" class="links"><font size="2">Voltar</font></a></b></font></td>
 </tr>
</table>

</body>
</html><!-- #include file="../../fechaconexoes.asp" -->
