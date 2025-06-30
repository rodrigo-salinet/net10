<!-- #include file="../../conexao.asp" -->
<!-- #include file="../conexao_adm.asp" -->

<%
altera = Request.QueryString("altera")
nome_pasta = Request.QueryString("categoria")
If nome_pasta <> empty then
	If left(nome_pasta, 1) = "/" then
		nome_pasta = mid(nome_pasta, 2, len(nome_pasta))
	End if
End if

Do while instr(nome_pasta, "//") > 0 
	nome_pasta = replace(nome_pasta, "//", "/")
Loop

%><%
'Response.End()

caminho_fisico = caminho_cliente & "imagens/" & nome_pasta
%><html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style type="text/css">
<!--
atd {
	border: 1px dotted;
}
-->
</style>
<script>
function retorna(valor)
{
	window.returnValue = valor;
	window.close();
	
}	
</script>
<style type="text/css">
<!--
input {
	font-family: Arial, Helvetica, sans-serif;
}
-->
</style>
<style type="text/css">
<!--
-->
</style>
<style type="text/css">
<!--
td {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: x-small;
}
.fontepequena {
	font-size: xx-small;
	font-weight: bold;
}
-->
</style>
<link href="../../../css/links.css" rel="stylesheet" type="text/css">
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);

function mostra()
{
	document.all.tabela_img.style.display = "yes";
}

//-->
</script>
<link href="estilo.css" rel="stylesheet" type="text/css">
</head>

<body bgcolor="#0099FF">
<div id="Layer1" style="position:absolute; left:4px; top:4px; width:100%; height:90%; z-index:1; overflow: auto; background-color: #FFFFFF; layer-background-color: #FFFFFF;"><font size="4">Início/<%= replace(nome_pasta, "\", "/") %></font> <font size="1"><strong><font face="Verdana, Arial, Helvetica, sans-serif">
<a href="#" onClick="retorna('<%= replace(nome_pasta, "\", "/") %>')"><font color="#990000">Mudar 
 para esta categoria</font></a></font></strong></font><br>
 <strong><font size="1" face="Verdana, Arial, Helvetica, sans-serif">
 <%
 If nome_pasta <> "" then
 %>
 <a href="altera_categoria.asp?categoria=<%= nome_pasta %>" target="_self">Alterar</a>&nbsp;&nbsp;&nbsp;&nbsp; 
 <a href="#" onClick="javascript:if(confirm('Você tem certeza que deseja excluir esta categoria e tudo contido nela?\nNão será possível desfazer.')){window.location='excluir_categoria.asp?cliente=<%= cliente %>&categoria=<%= nome_pasta %>';}">Excluir</a> 
 <%
 End if
 %>
 </font></strong><br>
 <%
msg = Request.QueryString("msg")
If msg <> empty then
	Response.Write(msg & "<br>")
End if
If nome_pasta <> empty then
	local_barra = instrrev(nome_pasta, "/")
	pasta_acima = left(nome_pasta, local_barra)
	if pasta_acima = nome_pasta then pasta_acima = ""
End if
%>
 <table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr valign="top"> 
   <td align="center">&nbsp;</td>
  </tr>
  <tr valign="top"> 
   <td><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><strong><a href="categorias.asp?cliente=<%= cliente %>&categoria=<%= pasta_acima %>">[ 
	uma categoria acima ]</a> </strong></font></td>
  </tr>
  <tr valign="top"> 
   <td><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><strong><br>
	<%
Set pasta = fso.GetFolder(caminho_fisico)
For each spasta in pasta.subfolders
	%>
	<table width="100%" class="fontepequena">
	 <tr class="fontepequena"> 
	  <td><font size="1"><%Response.Write(nome_pasta) %>/<a href="categorias.asp?cliente=<%= cliente %>&categoria=<% If nome_pasta <> empty then Response.Write(nome_pasta & "/") %><%= spasta.name %>"><%= spasta.name %></a></font><font size="1">&nbsp;&nbsp; -<strong><font face="Verdana, Arial, Helvetica, sans-serif">&nbsp; 
	   <a href="#" onClick="retorna('<% If nome_pasta <> empty then Response.Write(nome_pasta & "/") %><%= spasta.name %>')"><font color="#990000">Mudar 
	   para esta categoria</font></a></font></strong></font></td>
	 </tr>
	</table>
	<%
Next
%>
	</strong></font> </td>
  </tr>
  <tr> 
   <td align="center"><a href="insere_categoria.asp?cliente=<%= cliente %>&categoria=<%= nome_pasta %>" target="_self"><strong><font size="1">Inserir 
	nova categoria</font></strong></a>&nbsp;</td>
  </tr>
 </table>
</div>
<div id="Layer3" style="position:absolute; top:90%; width:104%; z-index:3; left: 0;"> 
 <hr>
 <font size="1" face="Verdana, Arial, Helvetica, sans-serif"><strong><a href="#" onClick="window.close()"><font color="#FFFFFF" size="2">CANCELAR</font></a></strong></font></div>
<br>
<strong><font size="1" face="Verdana, Arial, Helvetica, sans-serif"></font></strong> 
</body></html><!-- #include file="../../fechaconexoes.asp" -->
