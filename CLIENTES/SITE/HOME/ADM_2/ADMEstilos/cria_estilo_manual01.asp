<!-- #include file="../../conexao.asp" -->
<!-- #include file="../conexao_adm.asp" -->
<!-- #include file="../validasenha.asp" -->
<%
arquivo = Request.QueryString("arquivo")
if arquivo = empty then
	arquivo = request.Form("arquivo")
End if
nome_do_css = Server.MapPath("../../clientes/" & cliente & "/estilos/" & arquivo & ".css")
If fso.FileExists(nome_do_css) then
Set css = fso.OpenTextFile(nome_do_css)
	estilo = css.readall
Else
	estilo = "table{ " & vbcrlf & vbcrlf & "}" & vbcrlf & "td{ " & vbcrlf & vbcrlf & "}"
End if
%>
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style type="text/css">
<!--
.detalhes {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: xx-small;
	color: #000000;
}
-->
</style>
<style type="text/css">
<!--
td {
	white-space: nowrap;
}
-->
</style>
<link href="../../../css/estilo.css" rel="stylesheet" type="text/css">
</head>

<body bgcolor="#3399CC" text="#000000" link="#0000CC"  vlink="#0000FF" alink="#0066FF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<form action="cria_estilo_manual02.asp?cliente=<%= cliente %>" method="post" name="form1" target="_self">
 <table border="1" align="center" cellspacing="0">
  <tr> 
   <td bordercolor="#000099" bgcolor="#000099"><a href="Default.asp?cliente=<%= cliente %>"><font color="#FFFFFF" size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Voltar</strong></font></a></td>
  </tr>
  <tr> 
   <td bordercolor="#000099" bgcolor="#000099"> <center>
	 <font face="Verdana, Arial, Helvetica, sans-serif"><b><font color="#FFFFFF" size="1"> 
	 ADMINISTRADOR</font></b></font> </center></td>
  </tr>
  <%
  If Request.QueryString("msg") <> empty then
  %>
  <tr> 
   <td align="center" bordercolor="#999999" bgcolor="#CCCCCC"><em><strong><font color="#333333" size="2" face="Arial, Helvetica, sans-serif"><%= Request.QuerySTring("msg") %></font></strong></em></td>
  </tr>
  <%
  End if
  %>
  <tr valign="top"> 
   <td nowrap bgcolor="#CCCCCC"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Criar 
	estilo com o nome: <br>
	<input name="arquivo" type="text" id="arquivo" size="20" maxlength="20" value="<%= arquivo %>">
	</strong></font></td>
  </tr>
  <tr valign="top"> 
   <td width="534" nowrap bordercolor="#CCCCCC" bgcolor="#CCCCCC"> <p><strong><font size="2" face="Verdana, Arial, Helvetica, sans-serif">Estilo:<br>
	 <textarea name="estilo" cols="80" rows="10" wrap="OFF" id="estilo"><%= estilo %></textarea>
	 </font></strong> </p>
	</td>
  </tr>
  <tr> 
   <td align="center" bordercolor="#CCCCCC" bgcolor="#CCCCCC"> <input type="submit" name="Submit" value="Enviar"> 
	<input type="reset" name="Submit2" value="Redefinir">
	<input type="button" name="Submit3" value="Limpar" onClick="form1.estilo.value=''"> </td>
  </tr>
 </table>
</form><OBJECT id=dlgHelper CLASSID="clsid:3050f819-98b5-11cf-bb82-00aa00bdce0b" width="0px" height="0px">
 </OBJECT>

</body>
</html>
<!-- #include file="../../fechaconexoes.asp" -->
