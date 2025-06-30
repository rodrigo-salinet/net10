<!-- #include file="../../conexao.asp" -->
<!-- #include file="../conexao_adm.asp" -->


<!-- #include file="../conexao_adm.asp" -->
<!-- #include file="../validasenha.asp" -->
<%
If verifica("geral") then
%>
<html>
<head>
<title>Administrador <%= ucase(cliente) %></title>
<meta http-equiv="Content-Type" content="text/html; chRset=iso-8859-1">
<script language="JavaScript">
<!--

function excluir(id)
{
	if(confirm('Tem certeza que deseja excluir este usuário?\nNão será possível desfazer.'))
	{
		window.open('exclui_usuario.asp?cliente=<%= cliente %>&id=' + id, '_self');
	}
}

function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(pRseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);



// -->
</script>
<link href="../../../css/pag.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.posicao {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: xx-small;
	font-weight: bold;
	color: #000066;
	background-color: #f0f0f0;
}
-->
</style>
<style type="text/css">
<!--
.unnamed1 {
	visibility: hidden;
}
.unnamed2 {
	visibility: visible;
}
-->
</style>
</head>

<body bgcolor="#3399CC"  vlink="#0000FF" alink="#0066FF">
<table border="1" align="center" cellspacing="0">
 <tr> 
  <td bordercolor="#000099" bgcolor="#000099"> <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><b>ADMINISTRADOR 
	DE <br>
	USU&Aacute;RIOS</b><br>
	</font> </div></td>
 </tr>
 <%
  If Request.QueryString("msg") <> empty then
  %>
 <tr> 
  <td bgcolor="#CCCCCC" bordercolor="#999999" align="center"><font color="#333333" size="2" face="Arial, Helvetica, sans-serif"><em><strong><%= Request.QueryString("msg")%></strong></em></font></td>
 </tr>
 <%
  End if
	  %>
 <tr> 
  <td height="21" align="center" bordercolor="#999999" bgcolor="#CCCCCC"><p><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b><a href="Insere_usuario.asp?cliente=<%= cliente%>" class="links">Inserir 
	outro</a><br>
	</b></font></p></td>
 </tr>
 <tr> 
  <td align="center" bordercolor="#999999" bgcolor="#CCCCCC"> <table width="100%" border="0" align="center" cellpadding="2" cellspacing="0">
	<%
   Set rs = Conexao_adm.Execute("Select * From usuario")
   Do while not rs.EOF
   %>
	<tr> 
	 <td width="85%" valign="middle" nowrap class="fonte">&nbsp;&nbsp;&nbsp;&nbsp; <a href="altera_usuario.asp?id=<%= rs("id") %>&cliente=<%= cliente %>"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong><%= rs("nome") %></strong></font></a></td>
	 <td width="15%" align="right" valign="middle" nowrap class="fonte">&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" onClick="excluir(<%= rs("id")%>)"><img src="../imagens/exclui.gif" width="12" height="11" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	</tr>
	<%
		rs.movenext
	Loop
		%>
	<tr> 
	 <td colspan="2" valign="middle" nowrap class="fonte">&nbsp;</td>
	</tr>
   </table></tr>
 <tr> 
  <td bgcolor="#CCCCCC"><font face="Arial, Helvetica, sans-serif"><b><a href="../Administrador.asp?cliente=<%= cliente%>" class="links"><font size="2">Voltar</font></a></b></font></td>
 </tr>
</table>

</body>
</html>
<%
Else
%><script>
alert('Você não tem permissão para esta área do site!');
history.go(-1);
</script><%
End if
%><!-- #include file="../../fechaconexoes.asp" -->
