<!-- #include file="../conexao.asp" -->
<!-- #include file="conexao_adm.asp" -->
<!-- #include file="validasenha.asp" -->
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<script language="JavaScript">
<!--
function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);

function abre(img)
{
janela = window.open("", "_blank", "scrollbars=yes, left=10, top=10, width=500, height=400");
janela.document.writeln("<img src='../fotos/" + img + "'>");
janela.document.writeln("<div align='center'><a href='javascript:window.close()'><font size='1' face='Verdana, Arial, Helvetica, sans-serif'>[ fechar ]</font></a></div>");
}
// -->
</script>
</head>

<body bgcolor="#3399CC"  vlink="#0000FF" alink="#0066FF">
<table width="47%" border="1" cellspacing="0" align="center">
  <tr> 
    <td bgcolor="#000099" bordercolor="#000099" colspan="2"> <center>
	<font color="#FFFFFF" size="2" face="Verdana, Arial, Helvetica, sans-serif"><b>ADMINISTRADOR 
	- ARQUIVOS</b></font> <font color="#FFFFFF"><br>
        <font size="1" face="Verdana, Arial, Helvetica, sans-serif">Clique para 
        fazer um download</font></font> 
      </center></td>
  </tr>
  <%
  If Request.QueryString("msg") <> empty then
  %>
  <tr> 
    <td bgcolor="#CCCCCC" bordercolor="#999999" align="center" colspan="2"><font color="#333333" size="2" face="Arial, Helvetica, sans-serif"><em><strong><%= Request.QueryString("msg")%></strong></em></font></td>
  </tr>
  <%
  End if
  %>
  <tr> 
    <td bgcolor="#CCCCCC" bordercolor="#999999" align="center" colspan="2"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b><a href="insereimagem.asp" class="links">Inserir 
      outro</a></b></font></td>
  </tr>
  <%
  caminho = Server.Mappath("../clientes/" & cliente & "/arquivos")
  Set pasta = fso.GetFolder(caminho)
  For each img in Pasta.Files
  %>
  <tr> 
    
  <td align="center" bordercolor="#999999" bgcolor="#CCCCCC"><pa href="#" class="links" onClick="abre('<%= img.name %>')"><font color="#000099" size="2" face="Verdana, Arial, Helvetica, sans-serif"><%= img.name %>&nbsp;</font></a></td>
    
  <td width="19%" align="center" valign="top" bordercolor="#999999" background="../../Backgrounds/bg04.gif" bgcolor="#CCCCCC"><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><b><a href="#" class="links" onClick="javascript:if(confirm('Deseja mesmo excluir este arquivo?')){window.open('excluir_arquivo2.asp?arq=<%= img.name %>', '_self')}"><img src="imagens/exclui.gif" width="16" height="12" border="0"></a></b></font></td>
  </tr>
  <%
  Next
  %>
  <tr> 
    <td bgcolor="#CCCCCC" bordercolor="#CCCCCC" colspan="2">&nbsp;</td>
  </tr>
  <tr> 
    <td colspan="2" bgcolor="#CCCCCC"><font face="Arial, Helvetica, sans-serif"><b><a href="Administrador.asp?cliente=<%= cliente %>" class="links"><font size="2">Voltar</font></a><a href="javascript:history.go(-1)" class="links"></a></b></font></td>
  </tr>
</table>
</body>
</html>
<!-- #include file="../fechaconexoes.asp" -->
