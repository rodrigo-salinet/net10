<%
On error resume next

'Response.End 

%><!-- #include file="../conexao.asp" -->
<!-- #include file="conexao_adm.asp" -->
<%

nome = Request.Cookies("login")("nome")
senha = Request.Cookies("login")("senha")
strs = "Select * From Usuario where nome='" & nome & "' and senha='" & senha & "'"
Set verifica = Conexao_adm.Execute(strs)
If not verifica.EOF then
	Response.Redirect("Administrador.asp?cliente=" & cliente)
End if

%>
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
// -->
</script>
</head>

<body bgcolor="#3399CC" >
<form name="form1" method="post" action="administrador.asp?cliente=<%= cliente %>&login=true">
 <table width="27%" border="1" cellspacing="0" align="center">
  <tr> 
   <td colspan="2" bordercolor="#000099" bgcolor="#000099"> <center>
	 <font face="Verdana, Arial, Helvetica, sans-serif"><b><font color="#FFFFFF" size="2">ADMINISTRADOR</font></b> 
	 </font> </center></td>
  </tr>
  <%
If Request.QueryString("erro") = 1 then
%>
  <tr> 
   <td colspan="2" bgcolor="#CCCCCC"> <center>
	 <font color="#FF0000"><i><b><font face="Arial, Helvetica, sans-serif" size="2" color="#990000">Usuário 
	 e/ou senha incorretos.</font></b></i></font> </center></td>
  </tr>
  <%
End if
%>
  <tr> 
   <td colspan="2" bordercolor="#999999" bgcolor="#CCCCCC"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b><font color="#000000">Usu&aacute;rio</font></b></font></td>
  </tr>
  <tr> 
   <td colspan="2" bordercolor="#999999" bgcolor="#CCCCCC"><font face="Arial, Helvetica, sans-serif" size="2"><b> 
	<input type="text" name="nome">
	</b></font></td>
  </tr>
  <tr> 
   <td colspan="2" bordercolor="#999999" bgcolor="#CCCCCC"><font size="2" face="Arial, Helvetica, sans-serif"><b><font face="Verdana, Arial, Helvetica, sans-serif" color="#000000">Senha</font></b></font></td>
  </tr>
  <tr> 
   <td colspan="2" bordercolor="#999999" bgcolor="#CCCCCC"><font face="Arial, Helvetica, sans-serif"> 
	<input type="password" name="senha">
	</font></td>
  </tr>
  <tr> 
   <td colspan="2" bordercolor="#CCCCCC" bgcolor="#CCCCCC"> <div align="right"> 
	 <font face="Verdana, Arial, Helvetica, sans-serif"> <strong> 
	 <input name="lembrar" type="checkbox" id="lembrar" value="true">
	 <font color="#990000" size="2">Lembrar senha</font></strong></font><strong><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><br>
	 (N&atilde;o recomend&aacute;vel se voc&ecirc; utiliza um computador p&uacute;blico 
	 ou compartilhado)<br>
	 </font></strong> </div></td>
  </tr>
  <tr> 
   <td bordercolor="#CCCCCC" bgcolor="#CCCCCC"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong><a href="javascript:window.close();">Sair 
	</a></strong></font></td>
   <td align="right" bordercolor="#CCCCCC" bgcolor="#CCCCCC"><input type="submit" name="Submit" value="Verificar"></td>
  </tr>
 </table>
</form>
</body>
</html>
