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
function inicia()
{
	window.parent.leftFrame.history.go(0);
}

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
		window.open('exclui_imagem.asp?cliente=<%= cliente %>&arquivo=' + id + '&categoria=' +  pasta, '_self')
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

<body onLoad="inicia()"><font size="5">./<%= replace(nome_pasta, "\", "/") %></font><br>
<%
msg = Request.QueryString("msg")
If msg <> empty then
	Response.Write(msg)
End if
%><br>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
 <tr> 
  <td><a href="insere_imagem.asp?cliente=<%= cliente %>&categoria=<%= nome_pasta %>"><strong>Inserir 
   nova imagem</strong></a></td>
 </tr>
 <tr>
  <td>&nbsp;</td>
 </tr>
</table>
<%
Set pasta = fso.GetFolder(caminho_fisico)
For each arquivo in pasta.files
	conta = conta+1

	if fso.getextensionname(arquivo) = "gif" or  fso.getextensionname(arquivo) = "jpg" or fso.getextensionname(arquivo) = "png" or  fso.getextensionname(arquivo) = "svg" then
	aimagem = Session("caminho_virtual") & "/" & arquivo.name
	conta = conta + 1
	%>
<form name="form<%= conta %>" method="post" action="altera_imagem.asp?cliente=<%= cliente %>&arquivo=<%= nome_pasta & "/" & arquivo.name %>">
<a name="<%= aimagem %>"></a> 
 <table border="1" cellpadding="0" cellspacing="0">
  <tr> 
   <td bordercolor="#FFFFFF"><img src="<%= aimagem %>" alt="" name="<%= arquivo.name %>" border="0" id="<%= arquivo.name %>" onload="javascript:this.alt=this.name + ' - '+ this.width + 'x' + this.height;"><br>
	<font size="1"><%= arquivo.size %> bytes</font> </td>
  </tr>
  <tr> 
   <td height="20" nowrap bordercolor="#eeeeee"><font size="1"><%= arquivo.name %> 
	</font></td>
  </tr>
  <tr> 
   <td height="20" nowrap bordercolor="#eeeeee"><font size="1"><a href="#<%= aimagem %>" onClick="excluir('<%= replace(aimagem, "\", "/") %>', '<%= replace(nome_pasta, "\", "\/") %>')">Excluir</a> 
	</font></td>
  </tr>
 </table>
</form>
<br>

<%

	End if
Next
%>
</body></html><!-- #include file="../../fechaconexoes.asp" -->
