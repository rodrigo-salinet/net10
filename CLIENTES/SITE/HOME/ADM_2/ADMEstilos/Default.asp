<!-- #include file="../../conexao.asp" -->
<!-- #include file="../conexao_adm.asp" -->


<!-- #include file="../validasenha.asp" -->
<html>
<head>
<title>Administrador <%= ucase(cliente) %></title>
<meta http-equiv="Content-Type" content="text/html; chRset=iso-8859-1">
<script language="JavaScript">
<!--
<!--
function muda(pos, id)
{
window.open("muda_posicao.asp?cliente=<%= cliente%>&posicao=" + pos + "&id="+id+"&id=<%= id %>", "_self")
}

function exclui(arquivo)
{
	if(confirm("Deseja excluir o estilo " + arquivo + "?")){
		window.open("excluir_estilo.asp?cliente=<%= cliente %>&arquivo=" + arquivo, "_self")
	}
}


function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(pRseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);



// -->

function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
//-->
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
	DE ESTILOS</b><br>
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
  <td align="center" bordercolor="#999999" bgcolor="#CCCCCC"><table width="100%" border="0">
	<tr> 
	 <td align="center" bordercolor="#999999" bgcolor="#CCCCCC"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><strong><a href="cria_estilo_manual01.asp?arquivo=NOVO&cliente=<%= cliente %>"><font color=#0000FF>INSERIR 
	  </font></a> (M) &nbsp;<br>
	  </strong></font></td>
	 <td align="center" bordercolor="#999999" bgcolor="#CCCCCC"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><strong><a href="javascript:window.open('cria_estilo01.asp?cliente=<%= cliente %>&arquivo='+prompt('Novo estilo:', 'NOVO'), '_self')"><font color=#0000FF> 
	  &nbsp;INSERIR </font></a> (A)</strong></font></td>
	</tr>
	<tr> 
	 <td colspan="2" bordercolor="#999999" bgcolor="#CCCCCC"> <form name="form1">
	   <font size="1" face="Verdana, Arial, Helvetica, sans-serif"> <strong> <br>
	   <%
	   nome_do_css = Server.MapPath("../../clientes/" & cliente & "/estilos/")
	   Set pasta = fso.GetFolder(nome_do_css)
	   For each arquivo in pasta.Files
	   	nome = UCASE(replace(arquivo.name, ".css", ""))
		   %>
	   <font<% If nome = "MENU_LATERAL" or nome = "TABELA" or nome = "BUSCA" or nome = "PAGINA_INICIAL" then Response.Write(" color=red")
		   %>><%= nome %><a href="cria_estilo01.asp?arquivo=<%= nome %>&cliente=<%= cliente %>"> 
	   A</a> - <a href="cria_estilo_manual01.asp?arquivo=<%= nome %>&cliente=<%= cliente %>"> 
	   M</a></font> &nbsp;&nbsp;<a href="#" onClick="exclui('<%= nome %>')" title="Excluir">x</a><br>
	   <%
		Next
		%>
	   </strong></font> </form></td>
	</tr>
   </table></tr>
 <tr> 
  <td height="31" align="center" bordercolor="#CCCCCC" bgcolor="#CCCCCC"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>A 
   = Autom&aacute;tico<br>
   M = Manual</strong></font></td>
 </tr>
 <tr> 
  <td bgcolor="#CCCCCC"><font face="Arial, Helvetica, sans-serif"><b><a href="../Administrador.asp?cliente=<%= cliente %>" class="links"><font size="2">Voltar</font></a></b></font></td>
 </tr>
</table>

</body>
</html><!-- #include file="../../fechaconexoes.asp" -->
