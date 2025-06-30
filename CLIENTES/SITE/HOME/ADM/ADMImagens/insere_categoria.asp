<!-- #include file="../../conexao.asp" -->
<!-- #include file="../conexao_adm.asp" -->

<%
altera = Request.QueryString("altera")
nome_pasta = Request.QueryString("categoria")
nome_pasta = replace(Request.QueryString("categoria"), "//", "/")
If nome_pasta <> empty then
	If left(nome_pasta, 1) = "/" then
		nome_pasta = mid(nome_pasta, 2, len(nome_pasta))
	End if
End if

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
function troca(img, caminho)
{
	document.all[img].src=caminho;
}
function trocaalt(img, valor)
{
	document.all[img].alt=valor;
}
function excluir(id, pasta)
{
	if(confirm('Deseja realmente excluir esta imagem?\nNão será possível desfazer.'))
	{
		window.open('exclui_imagem.asp?cliente=<%= cliente %>&arquivo=' + id + '&pasta=' +  pasta, '_self')
	}
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
body {
	background-attachment: fixed;
	background-image: url(Imagens/borda.gif);
	background-repeat: repeat-y;
	background-position: left;
}
-->
</style>
<style type="text/css">
<!--
td {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: x-small;
}
-->
</style>
</head>

<body>
<%
If tc < 100 then
%>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
 <tr> 
  <td><p><font size="5">./<%= replace(nome_pasta, "\", "/") %></font><br>
	<br>
   </p>
   </td>
 </tr>
 <tr> 
  <td><form action="insere_categoria2.asp?cliente=<%= cliente %>&categoria=<%= nome_pasta %>" method="post" name="form1">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	 <tr> 
	  <td>Novo nome:</td>
	 </tr>
	 <tr> 
	  <td><input name="nome" type="text" id="nome" size="50"></td>
	 </tr>
	 <tr> 
	  <td><input type="submit" name="Submit" value="Enviar"> <input type="reset" name="Submit2" value="Cancelar" onClick="javascript:history.go(-1)"></td>
	 </tr>
	</table>
   </form> </td>
 </tr>
</table>
<%
  else
  %>
<font face="Verdana, Arial, Helvetica, sans-serif"><strong><%= msg_cheia %><br>
<a href="javascript:history.go(-1)"><font size="2">Clique aqui para voltar.</font></a></strong></font> 
<%
  End if
  %>
</body></html><!-- #include file="../../fechaconexoes.asp" -->
