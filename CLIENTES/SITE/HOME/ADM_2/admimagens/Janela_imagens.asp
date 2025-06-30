<!-- #include file="../../conexao.asp" -->
<!-- #include file="../conexao_adm.asp" -->

<%
altera = Request.QueryString("altera")
nome_pasta = Request.QueryString("categoria")
nome_pasta = replace(nome_pasta, "\", "/")
Do while instr(nome_pasta, "//") > 0 
	nome_pasta = replace(nome_pasta, "//", "/")
Loop
caminho_imagens = caminho_cliente & "imagens/" & nome_pasta

%>
<html>
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
		window.open('exclui_imagem.asp?cliente=<%= cliente %>&arquivo=' + id + '&categoria=' +  pasta, '_self')
	}
}

function categorias()
{
	return window.showModalDialog("janela_categoria.asp?cliente=<%= cliente %>");
}

function muda(arquivo)
{
	pasta = categorias()
	if(pasta!="undefined"){
		window.open('mudacategoria.asp?cliente=<%= cliente %>&imagem=' + arquivo + '&ncategoria=' +  pasta, '_self')
	}
}

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
function abre_imagem(aimagem, x, y)
{
	x = Number(x) + 31
	y = Number(y) + 31
	//alert(x + "/" + y)
	janela = window.showModalDialog('ver_imagem.asp?cliente=<%= cliente %>', aimagem, 'resizable:yes; scrollbars:no; dialogWidth:' + x + '; dialogHeight:' + y + ';');
}
//-->
</script>
<link href="estilo.css" rel="stylesheet" type="text/css">
</head>

<body bgcolor="#0099FF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<div id="Layer1" style="position:absolute; left:4px; top:4px; width:40%; height:90%; z-index:1; overflow: auto; background-color: #FFFFFF; layer-background-color: #FFFFFF;"><font size="4">Início/<%= replace(nome_pasta, "\", "/") %></font> <br>
 <%
 If nome_pasta <> "" then
 %>
 <strong><font size="1" face="Verdana, Arial, Helvetica, sans-serif">
 <a href="altera_categoria.asp?cliente=<%= cliente %>&categoria=<%= nome_pasta %>" target="_self">Alterar</a>&nbsp;&nbsp;&nbsp;&nbsp; 
 <a href="#" onClick="javascript:if(confirm('Você tem certeza que deseja excluir esta categoria e tudo contido nela?\nNão será possível desfazer.')){window.location='excluir_categoria.asp?cliente=<%= cliente %>&categoria=<%= nome_pasta %>';}">Excluir</a> 
 </font></strong><br>
 <%
 End if
 %>
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
   <td><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><strong><a href="janela_imagens.asp?cliente=<%= cliente %>&categoria=<%= pasta_acima %>">[ 
	uma categoria acima ]</a> </strong></font></td>
  </tr>
  <tr valign="top"> 
   <td><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><strong><br>
	<%
Set pasta = fso.GetFolder(caminho_imagens)
For each spasta in pasta.subfolders
	%>
	<table width="100%" class="fontepequena">
	 <tr class="fontepequena"> 
	  <td><font size="1"><a href="janela_imagens.asp?categoria=<% If nome_pasta <> empty then Response.Write(nome_pasta & "/") %><%= spasta.name %>&cliente=<%= cliente %>"><%= spasta.name %></a></font><font size="1">&nbsp;</font></td>
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
<div id="Layer2" style="position:absolute; left:42%; top:4px; width:58%; height:90%; z-index:2; overflow: auto; background-color: #FFFFFF; layer-background-color: #FFFFFF; border: 1px none #000000;"> 
 <table width="100%" border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bgcolor="#FFFFFF" id="tabela_img">
  <tr valign="top"> 
   <td>&nbsp;&nbsp;&nbsp;<a href="insere_imagem.asp?cliente=<%= cliente %>&categoria=<%= nome_pasta %>"><strong><font size="1">Inserir 
	imagem</font></strong></a></td>
  </tr>
  <tr valign="top"> 
   <td align="center">&nbsp;</td>
  </tr>
  <tr valign="top"> 
   <td> 	<%

For each arquivo in pasta.files
	conta = conta+1
	if lcase(fso.getextensionname(arquivo)) = "gif" or  lcase(fso.getextensionname(arquivo)) = "jpg" or lcase(fso.getextensionname(arquivo)) = "png" or  lcase(fso.getextensionname(arquivo)) = "svg" then
	aimagem = endereco_cliente & cliente & "/imagens/" & nome_pasta & "/" & arquivo.name
	conta = conta + 1
	%> <form name="form<%= conta %>" method="post" action="altera_imagem.asp?cliente=<%= cliente %>&arquivo=<%= nome_pasta & "/" & arquivo.name %>">
	 <a name="<%= aimagem %>"></a> 
	      <table width="100%" border="1" align="center" cellpadding="0" cellspacing="0">
            <tr> 
	   <td bordercolor="#FFFFFF"><a href="#<%= aimagem %>" onClick="abre_imagem('<%= aimagem %>', '<%= tx %>', '<%= ty %>')"><img border="0" align="right" src="Imagens/eye.gif" width="18" height="10"></a><strong onDblClick="retorna('<%= aimagem %>')"><%= arquivo.name %></strong> <a onClick="retorna('<%= aimagem %>')"><font color="#FF0000" size="1"><strong><br>
		Inserir >></strong></font></a></td>
	  </tr>
	  <tr> 
	   <td height="20" nowrap bordercolor="#eeeeee"><font size="1"><%= round(arquivo.size/1024, 2) %> 
		Kbytes</font> </td>
	  </tr>
	  <tr> 
	   <td height="20" nowrap bordercolor="#eeeeee"><font size="1"><a href="#<%= aimagem %>" onClick="excluir('<%= arquivo.name %>', '<%= nome_pasta %>')">Excluir</a>&nbsp; 
		|&nbsp; <a href="#" onClick="muda('<%= replace(arquivo.path, "\", "/") %>')">Mudar 
		categoria</a></font></td>
	  </tr>
	 </table>
	</form>
	<%

	End if
Next
%> </td>
  </tr>
 </table>
</div>
<div id="Layer3" style="position:absolute; top:91%; width:100%; z-index:3; left: 0;"> 
  <hr>
 <font size="1" face="Verdana, Arial, Helvetica, sans-serif"><strong><a href="#" onClick="window.close()"><font color="#000000" size="2">CANCELAR</font></a></strong></font></div>
<br>
<strong><font size="1" face="Verdana, Arial, Helvetica, sans-serif"></font></strong> 
</body></html><!-- #include file="../../fechaconexoes.asp" -->
