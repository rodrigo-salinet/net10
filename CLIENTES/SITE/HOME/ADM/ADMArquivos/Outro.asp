<!-- #include file="../../conexao.asp" -->
<!-- #include file="../conexao_adm.asp" -->
<!-- #include file="../validasenha.asp" -->
<%
msg = Request.QueryString("msg")
nome_arquivo = Request.QueryString("arquivo")

if instr(nome_arquivo, "/") and not (nome = "Administrador-ViaSulnet" and senha = "AdmV5Nldna") then
	nome_arquivo = ""
	msg = "Ocorreu um erro ao tentar recuperar o arquivo."
End if

caminho_arquivos_cliente = caminho_cliente & "Arquivos\" 
If not fso.folderExists(caminho_arquivos_cliente) then
	caminho_arquivos_cliente = fso.GetParentFolderName(fso.GetParentFolderName(caminho_dados)) & "\clientes\site\home\clientes\" & cliente & "\arquivos\"
End if

Set arquivo = fso.OpenTextFile(caminho_arquivos_cliente & "\" & nome_arquivo)

extensao = fso.GetExtensionName(caminho_arquivos_cliente & "\" & nome_arquivo)
novo_nome = fso.GetBaseName(caminho_arquivos_cliente & "\" & nome_arquivo)

If extensao <> "txt" and extensao <> "htm" and extensao <> "html" and extensao <> "css" then
	novo_nome = novo_nome & "." & extensao
	extensao = "outro"
End if

%>
<html>
<head>
<title>Editando o arquivo</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<script>
var cliente = "<%= cliente %>";

function preenche(nome, extensao){
	document.all.nome_arquivo.value = nome;
	document.all.extensao.value = extensao;
	
}

</script>

<style type="text/css">
<!--
.detalhes {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: xx-small;
	color: #000000;
}
-->
</style>
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);
//-->
</script>
</head>

<body bgcolor="#3399CC" vlink="#0000FF" alink="#0066FF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onLoad="preenche('<%= novo_nome %>', '<%= extensao %>')">
<form action="salvar_arquivo.asp?cliente=<%= cliente %>&tipo=outro&arquivo=<%= nome_arquivo %>" method="post" name="form1" target="_self">
  
 <table width="100%" border="1" cellspacing="0" align="center">
  <tr> 
   <td width="100%" colspan="2" bordercolor="#000099" bgcolor="#000099"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
	 <tr> 
	  <td width="16%" bordercolor="#000099" bgcolor="#000099"><a href="Default.asp?cliente=<%= cliente %>"><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif"><strong>Voltar</strong></font></a> 
	  </td>
	  <td width="40%" align="center" bordercolor="#000099" bgcolor="#000099"><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif"><b><%= texto_imagem("texto", rs_grupo("nivel")) %></b></font></td>
	  <%
 If vartype(msg) > 1 and vartype(msg) < 10 then
%>
	  <td width="34%" align="center" bordercolor="#999999" bgcolor="#CCCCCC"><em><strong><font color="#990000" size="1" face="Arial, Helvetica, sans-serif"><%= msg %></font></strong></em></td>
	  <%
  End if
	%>
	 </tr>
	</table></td>
  </tr>
  <tr>
   <td colspan="2" bordercolor="#CCCCCC" bgcolor="#CCCCCC"><font size="3" face="Verdana, Arial, Helvetica, sans-serif"><strong>Nome:<br>
	<input name="nome_arquivo" type="text" id="nome_arquivo" size="40">
	<select name="extensao" id="extensao">
	 <option value="txt">Arquivo texto (*.txt)</option>
	 <option value="htm">Documento HTML (*.htm)</option>
	 <option value="html">Documento HTML (*.html)</option>
	 <option value="css">Documento de estilo em cascata (*.css)</option>
	 <option value="outro">Outro tipo</option>
	</select>
	</strong></font></td>
  </tr>
  <tr> 
   <td colspan="2" bgcolor="#CCCCCC"> <textarea name="arquivo" cols="90" rows="10" id="arquivo"><%= Server.HTMLEncode(arquivo.readall) %></textarea> 
   </td>
  </tr>
  <tr> 
   <td colspan="2" bordercolor="#CCCCCC" bgcolor="#CCCCCC">&nbsp;</td>
  </tr>
  <tr> 
   <td colspan="2" bgcolor="#CCCCCC"> <center>
	 <input type="submit" name="Submit" value="Enviar">
	 <input type="reset" name="Submit2" onClick="javascript:arquivo.value=''" value="Limpar P&aacute;gina">
	 <input name="Submit22" value="Cancelar" type="button" onClick="history.go(-1)">
	</center></td>
  </tr>
 </table>
</form>
</body>
</html>
<!-- #include file="../../fechaconexoes.asp" -->
