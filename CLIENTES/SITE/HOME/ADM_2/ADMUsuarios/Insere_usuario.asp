<!-- #include file="../../conexao.asp" -->
<!-- #include file="../conexao_adm.asp" -->


<!-- #include file="../conexao_adm.asp" -->
<!-- #include file="../validasenha.asp" -->
<%
id = Request.QuerysTring("id")
If verifica("geral") then
%>
<html>
<head>
<title>Administrador <%= ucase(cliente) %></title>
<meta http-equiv="Content-Type" content="text/html; chRset=iso-8859-1">
<script language="JavaScript">
<!--


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
<style type="text/css">
<!--
.pequeno {
	font-size: 9px;
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-weight: normal;
}
-->
</style>
</head>

<body bgcolor="#3399CC"  vlink="#0000FF" alink="#0066FF">
<table border="1" align="center" cellspacing="0">
 <tr> 
  <td bordercolor="#000099" bgcolor="#000099"> <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><b>&nbsp;ADMINISTRADOR 
	DE USU&Aacute;RIOS&nbsp;</b><br>
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
  <td align="center" bordercolor="#999999" bgcolor="#CCCCCC"><form name="form1" method="post" action="Insere_usuario2.asp?id=<%= id %>&cliente=<%= cliente%>">
	    <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td align="right"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"> 
              <input name="Geral" type="checkbox" id="Geral" value="true">
              Administrador Geral&nbsp;</font></td>
          </tr>
          <tr> 
            <td>&nbsp;</td>
          </tr>
          <tr> 
            <td><font size="2" face="Verdana, Arial, Helvetica, sans-serif">Nome:</font></td>
          </tr>
          <tr> 
            <td><font size="2" face="Verdana, Arial, Helvetica, sans-serif">&nbsp; 
              <input name="novo_nome" type="text">
              &nbsp; </font></td>
          </tr>
          <tr> 
            <td><font size="2" face="Verdana, Arial, Helvetica, sans-serif">Senha:</font></td>
          </tr>
          <tr> 
            <td><font size="2" face="Verdana, Arial, Helvetica, sans-serif">&nbsp; 
              <input name="novo_senha" type="password" id="senha">
              &nbsp; </font></td>
          </tr>
          <tr> 
            <td><font size="2" face="Verdana, Arial, Helvetica, sans-serif">Confirma&ccedil;&atilde;o:</font></td>
          </tr>
          <tr> 
            <td><font size="2" face="Verdana, Arial, Helvetica, sans-serif">&nbsp; 
              <input name="novo_confirmacao" type="password" id="senha">
              &nbsp; </font></td>
          </tr>
          <tr> 
            <td><p><font size="2" face="Verdana, Arial, Helvetica, sans-serif">Expira 
                em:</font></p></td>
          </tr>
          <tr> 
            <td><font size="2" face="Verdana, Arial, Helvetica, sans-serif">&nbsp; 
              <input name="expira_em" type="text" id="expira_em">
              &nbsp; </font></td>
          </tr>
          <tr> 
            <td><font size="2" face="Verdana, Arial, Helvetica, sans-serif">&nbsp; 
              </font></td>
          </tr>
          <tr> 
            <td align="center"> <input type="submit" name="Submit" value="Enviar"> 
              <input type="reset" name="Submit2" value="Redefinir"> </td>
          </tr>
        </table>
   </form></tr>
 <tr> 
  <td bgcolor="#CCCCCC"><font face="Arial, Helvetica, sans-serif"><b><a href="Default.asp?cliente=<%= cliente%>" class="links"><font size="2">Voltar</font></a></b></font></td>
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
