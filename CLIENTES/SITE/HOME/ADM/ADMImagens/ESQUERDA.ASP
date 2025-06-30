<!-- #include file="../../conexao.asp" -->
<!-- #include file="../conexao_adm.asp" -->






<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<script>
function excluir_categoria(cat)
{
	if(confirm('Tem certeza que deseja excluir esta categoria e todas as imagens relacionadas?\nNão será possível desfazer.'))
	{
		window.open('excluir_categoria.asp?cliente=<%= cliente %>&categoria=' + unescape(cat), '_self')
	}
}
</script>
<style type="text/css">
<!--
li {
	list-style-type: none;
}
-->
</style>
<style type="text/css">
<!--
a:link {
	text-decoration: none;
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 10px;
	font-weight: bold;
	color: #000066;
}
a:hover {
	text-decoration: none;
	font-family: Verdana, Arial, Helvetica, sans-serif;
	color: #0000FF;
	font-size: 10px;
	font-weight: bold;
}
a:visited {
	text-decoration: none;
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 10px;
	font-weight: bold;
	color: #000099;
}
a:active {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 10px;
	font-weight: bold;
	color: #0099FF;
}
-->
</style>
</head>

<body bgcolor="#e0e0e0">
<font color="#000066" size="1" face="Verdana, Arial, Helvetica, sans-serif"><strong>CATEGORIAS:<br>
<a href="insere_categoria.asp?cliente=<%= cliente %>" target="mainFrame">Inserir nova</a><br>
</strong></font> <br>
<table>
 <tr>
  <td nowrap> 
   <%
Function mostrapasta(nome_pasta)
	%>
   <ul>
	<%
	Set npasta = fso.GetFolder(nome_pasta)
	caminho_pasta = replace(lcase(npasta.path), lcase(Server.MapPath("../../../home/clientes/" & cliente & "/imagens")& "\"), "")
	%>
	<a href="principal.asp?categoria=<%= caminho_pasta %>&cliente=<%= cliente %>"  target="mainFrame"><%= npasta.name %></a> 
	<a href="insere_categoria.asp?categoria=<%= caminho_pasta %>&cliente=<%= cliente %>" target="mainFrame"><img src="Imagens/adiciona.gif" alt="Inserir subcategoria" width="9" height="10" border="0"></a>&nbsp;&nbsp;<a href="altera_categoria.asp?cliente=<%= cliente %>&categoria=<%= caminho_pasta %>" target="mainFrame"><img src="Imagens/altera.gif" width="17" height="10" border="0"></a>&nbsp;&nbsp;&nbsp;<a href="#" onClick="excluir_categoria(escape('<%= replace(caminho_pasta, "\", "/") %>'))">&times;</a> 
	<%
	For each nsubpasta in npasta.SubFolders
		%>
	<li> 
	 <% call mostrapasta(nsubpasta) %>
	</li>
	<%
	Next
	%>
   </ul>
   <%
End Function
%>
<a href="principal.asp?cliente=<%= cliente %>"  target="mainFrame">Principal</a>
<%

Set pasta = fso.GetFolder(Server.MapPath("../../clientes/" & cliente & "/imagens"))
For each subpasta in pasta.subfolders
	mostrapasta(subpasta)
Next
%></td></tr></table>
</body>
</html>
<!-- #include file="../../fechaconexoes.asp" -->
