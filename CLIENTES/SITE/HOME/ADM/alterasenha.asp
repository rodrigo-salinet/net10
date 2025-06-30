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
// -->
</script>


</head>

<body bgcolor="#3399CC" vlink="#0000FF" alink="#0066FF">
<form name="form1" method="post" action="alterasenha2.asp?cliente=<%= cliente %>">
 <table border="1" cellspacing="0" align="center">
  <tr> 
   <td bgcolor="#000099" bordercolor="#000099" colspan="2"> <center>
	 <font face="Verdana, Arial, Helvetica, sans-serif"><b><font color="#FFFFFF" size="2">ALTERAR 
	 SENHA </font></b></font> </center></td>
  </tr>
  <%
erro = REquest.Form("erro")
If erro <> empty then
Select case erro
	case 1
		msg = "Por favor preencha um nome de usuário com pelo menos 3 caracteres."
	case 2
		msg = "Por favor preencha uma senha com pelo menos 3 caracteres."
	case 3
		msg = "A senha e a confirmação devem ser iguais."
	case 4
		msg = "Ocorreu um erro!"
End select
%>
  <%
End if
%>
  <tr> 
   <td bgcolor="#CCCCCC" colspan="2"> <center>
	 <b><font face="Verdana, Arial, Helvetica, sans-serif" color="#000000"><%= msg %></font></b> </center></td>
  </tr>
  <tr> 
   <td bgcolor="#CCCCCC" bordercolor="#CCCCCC" colspan="2"><font face="Verdana, Arial, Helvetica, sans-serif" color="#000099"><b><font size="2">Usu&aacute;rio</font><font size="2">:&nbsp;</font></b></font></td>
  </tr>
  <tr> 
   <td bgcolor="#CCCCCC" bordercolor="#999999" colspan="2"> <input type="text" name="usuario" value="<%= Session("usuario") %>"> 
   </td>
  </tr>
  <tr> 
   <td bgcolor="#CCCCCC" bordercolor="#999999" colspan="2"><b><font color="#000099" size="2" face="Verdana, Arial, Helvetica, sans-serif">Senha:</font></b></td>
  </tr>
  <tr> 
   <td bgcolor="#CCCCCC" bordercolor="#999999" colspan="2"> <input type="password" name="senha" value="<%= Session("senha") %>"> 
   </td>
  </tr>
  <tr> 
   <td bgcolor="#CCCCCC" bordercolor="#999999" colspan="2"><b><font color="#000099" size="2" face="Verdana, Arial, Helvetica, sans-serif">Confirma&ccedil;&atilde;o:</font></b></td>
  </tr>
  <tr> 
   <td bgcolor="#CCCCCC" bordercolor="#999999" colspan="2"><input type="password" name="confirmacao" value="<%= rs("senha") %>"> 
   </td>
  </tr>
  <tr> 
   <td bgcolor="#CCCCCC" bordercolor="#999999" colspan="2"><div align="center"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">
	 <input name="geral" type="checkbox" id="geral" value="geral">
	 Adminisitrador geral</font></div></td>
  </tr>
  <tr> 
   <td bgcolor="#CCCCCC" colspan="2"> <center>
	 <input type="submit" name="Submit" value="Alterar">
	 <input type="button" name="Submit2" value="Cancelar e Voltar" onClick="window.open('administrador.asp', '_self')">
	</center></td>
  </tr>
  <tr> 
   <td bgcolor="#CCCCCC" bordercolor="#CCCCCC" colspan="2">&nbsp;</td>
  </tr>
  <tr> 
   <td bgcolor="#CCCCCC" bordercolor="#999999" colspan="2"><font face="Arial, Helvetica, sans-serif" size="2"><a href="javascript:history.go(-1)" class="links"><b>Voltar</b></a></font></td>
  </tr>
 </table>
</form>
</body>
</html>
<!-- #include file="../fechaconexoes.asp" -->
