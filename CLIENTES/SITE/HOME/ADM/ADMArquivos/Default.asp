<!-- #include file="../../conexao.asp" -->
<!-- #include file="../conexao_adm.asp" -->
<!-- #include file="../validasenha.asp" -->
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<script>
var cliente = "<%= cliente %>";
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
<style type="text/css">
<!--
.arquivos {
	border: thin dotted #999999;
}
-->
</style>
</head>

<body bgcolor="#3399CC" vlink="#0000FF" alink="#0066FF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
 
<table width="100%" border="1" align="center" cellspacing="2" bgcolor="#bbbbbb">
 <tr> 
  <td colspan="4" bordercolor="#000099" bgcolor="#000099"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr> 
	 <td width="6%" bordercolor="#000099" bgcolor="#000099"><a href="../Administrador.asp?cliente=<%= cliente %>&id=<%= rs_grupo("subfam") %>"><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif"><strong>Voltar</strong></font></a> 
	 </td>
	 <td width="94%" align="center" bordercolor="#000099" bgcolor="#000099"><strong><font color="#FFFFFF" size="2" face="Arial, Helvetica, sans-serif">Arquivos 
	  dispon&iacute;veis</font></strong></td>
	</tr>
   </table></td>
 </tr>
 <tr bordercolor="#CCCCCC" bgcolor="#CCCCCC"> 
  <td colspan="4" align="center"><strong><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><a href="outro.asp?cliente=<%= cliente %>&nome_arquivo=Novo.htm">Criar 
   novo arquivo</a></font></strong></td>
 </tr>
 <tr bordercolor="#CCCCCC" bgcolor="#CCCCCC"> 
  <td colspan="4">&nbsp;</td>
 </tr>
 <tr bgcolor="#CCCCCC"> 
  <td colspan="2" bordercolor="#CCCCCC"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Nome 
   do arquivo</strong></font></td>
  <td width="45%" bordercolor="#CCCCCC"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Tipo</strong></font></td>
  <td width="9%" align="center" bordercolor="#CCCCCC"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Tamanho</strong></font></td>
 </tr>
 <%
'  on error goto 0
  caminho_arquivos_cliente = caminho_cliente & "Arquivos" 
  
  If not fso.folderExists(caminho_arquivos_cliente) then
	  caminho_arquivos_cliente = fso.GetParentFolderName(fso.GetParentFolderName(caminho_dados)) & "\clientes\site\home\clientes\" & cliente & "\arquivos\"
  End if
  
  Set pasta = fso.GetFolder(caminho_arquivos_cliente)
  For each arquivo in pasta.files
  	extensao = fso.GetExtensionName(arquivo.path)
  	If extensao = "html" or extensao = "htm" then
		tipo = "HTML"
		tipo = "Outro"
	Else
		tipo = "Outro"
	End if
  
  %>
 <tr bordercolor="#CCCCCC" bgcolor="#CCCCCC"> 
  <td width="36%" height="22" bordercolor="#CCCCCC"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong> 
   </strong> <strong><a href="<%= tipo %>.asp?cliente=<%=cliente %>&arquivo=<%= arquivo.name %>" ><%= arquivo.name %></a></strong> </font> </td>
  <td width="10%" align="center" bordercolor="#CCCCCC"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><a href="<%= endereco_cliente %><%= cliente %>/arquivos/<%= arquivo.name %>" target="_blank"><img src="../ADMImagens/Imagens/eye.gif" width="18" height="10" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp; 
   <a href="javascript:if(confirm('Tem certeza que deseja apagar este arquivo?\nNão há como desfazer')){window.open('deletar_arquivo.asp?cliente=<%= cliente %>&arquivo=<%= arquivo.name %>','_self')}"><img src="../imagens/exclui.gif" width="12" height="11" border="0"></a> 
   </font></td>
  <td><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><font size="1"><%= arquivo.type %></font></font></td>
  <td align="center"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><font size="1"><%= round(arquivo.size/1024,2) %> Kb</font></font></td>
 </tr>
 <%
	Next
	%>
</table>
</body>
</html>
<!-- #include file="../../fechaconexoes.asp" -->
