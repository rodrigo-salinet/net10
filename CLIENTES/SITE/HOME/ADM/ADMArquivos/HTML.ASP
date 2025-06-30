<!-- #include file="../../conexao.asp" -->
<!-- #include file="../conexao_adm.asp" -->
<!-- #include file="../validasenha.asp" -->
<%
msg = Request.QueryString("msg")
nome_arquivo = Request.QueryString("arquivo")

caminho_arquivos_cliente = caminho_cliente & "Arquivos\" 
If not fso.folderExists(caminho_arquivos_cliente) then
	caminho_arquivos_cliente = fso.GetParentFolderName(fso.GetParentFolderName(caminho_dados)) & "\clientes\site\home\clientes\" & cliente & "\arquivos\"
End if

Set arquivo = fso.OpenTextFile(caminho_arquivos_cliente & "\" & nome_arquivo)
   %>
<html>
<head>
<title>Editando o arquivo</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<script>
var cliente = "<%= cliente %>";
</script>
<script language="JavaScript" src="../grupos.js">
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

<body bgcolor="#3399CC" vlink="#0000FF" alink="#0066FF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onLoad="ColocarTexto(document.form1.Mensagem.value);">
<form action="salvar_arquivo.asp?cliente=<%= cliente %>&arquivo=<%= nome_arquivo %>" method="post" name="form1" target="_self" onSubmit="PegarTexto(this);">
  
 <table width="100%" border="1" cellspacing="0" align="center">
  <tr> 
   <td colspan="2" bordercolor="#000099" bgcolor="#000099"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
	 <tr> 
	  <td width="16%" bordercolor="#000099" bgcolor="#000099"><a href="../Administrador.asp?cliente=<%= cliente %>&id=<%= rs_grupo("subfam") %>"><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif"><strong>Voltar</strong></font></a> 
	  </td>
	  <td width="40%" align="center" bordercolor="#000099" bgcolor="#000099"><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif"><b><%= nome_arquivo %></b></font></td>
	 </tr>
	</table></td>
  </tr>
  <tr> 
   <td colspan="2" bgcolor="#CCCCCC"><object id="myEditor" name="myEditor" data="editoru.asp?arquivo=<%= nome_arquivo %>&cliente=<%= cliente %>" type="text/x-scriptlet" width="100%" height="423">
	 <!-- Isto só é exibido em browsers que não suportão scriptlets -->
	 Seu browser não suporta Scriptlets, por favor atualize para uma versão mais 
	 recente (preferencialmente: IE6+) </object> <textarea name="Mensagem" cols="80" rows="10" style="display: none"><%= arquivo.readall %></textarea> 
   </td>
  </tr>
  <%
 ' If rs_grupo.fields(1) = "HEAD" then
  %>
  <%
 ' End if
  %>
  <tr> 
   <td width="60%" bordercolor="#CCCCCC" bgcolor="#CCCCCC"><font size="3" face="Verdana, Arial, Helvetica, sans-serif"><strong>Nome:<br>
	<input name="grupo" type="text" id="grupo" value="<%= nome_arquivo %>"  size="20">
	</strong> </font><font size="2" face="Verdana, Arial, Helvetica, sans-serif">&nbsp; 
	</font><font size="3" face="Verdana, Arial, Helvetica, sans-serif">&nbsp; 
	</font></td>
   <td width="40%" align="center" bordercolor="#CCCCCC" bgcolor="#CCCCCC">&nbsp;</td>
  </tr>
  <tr> 
   <td bordercolor="#CCCCCC" bgcolor="#CCCCCC">&nbsp;</td>
   <td align="center" bordercolor="#CCCCCC" bgcolor="#CCCCCC">&nbsp;</td>
  </tr>
  <tr> 
   <td colspan="2" align="center" bgcolor="#CCCCCC">&nbsp;</td>
  </tr>
  <tr> 
   <td colspan="2" bgcolor="#CCCCCC"> <center>
	 <input type="submit" name="Submit" value="Enviar">
	 <input type="reset" name="Submit2" onClick="Limpar()" value="Limpar P&aacute;gina">
	 <input name="Submit22" value="Cancelar" type="button" onClick="history.go(-1)">
	</center></td>
  </tr>
 </table>
</form>
</body>
</html>
<!-- #include file="../../fechaconexoes.asp" -->
