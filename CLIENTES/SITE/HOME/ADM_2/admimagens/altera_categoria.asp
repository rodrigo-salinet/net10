<!-- #include file="../../conexao.asp" -->
<!-- #include file="../conexao_adm.asp" -->

<%
altera = Request.QueryString("altera")
nome_pasta = Request.QueryString("categoria")

caminho_fisico = Server.MapPath(Session("caminho_virtual"))
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
		window.open('exclui_imagem.asp?arquivo=' + id + '&pasta=' +  pasta, '_self')
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
<link href="estilo.css" rel="stylesheet" type="text/css">
</head>

<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
 <tr> 
  <td><p><font size="5">./<%= replace(nome_pasta, "\", "/") %></font><br>
	<br>
   </p>
   </td>
 </tr>
 <tr> 
  <td><form action="altera_categoria2.asp?cliente=<%= cliente %>&categoria=<%= nome_pasta %>" method="post" name="form1">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	 <tr> 
	  <td>Novo nome:</td>
	 </tr>
	 <tr> 
	  <td><input name="nome" type="text" id="nome" value="<%= nome_pasta %>" size="50"></td>
	 </tr>
	 <tr> 
	  <td>
	    <input type="submit" name="Submit" value="Enviar">
		<input type="reset" name="Submit2" value="Cancelar" onClick="javascript:window.open('janela_imagens.asp?categoria=<%= nome_pasta %>','_self')">
	  </td>
	 </tr>
	</table>
   </form> </td>
 </tr>
</table>
</body></html><!-- #include file="../../fechaconexoes.asp" -->
