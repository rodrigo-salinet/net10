<!-- #include file="../conexao.asp" -->
<!-- #include file="conexao_adm.asp" -->
<!-- #include file="validasenha.asp" -->
<%
id_grupo = Request.QueryString("id_grupo")
%>

<html>
<head>
<title>Criar Link</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<script>
function termina(id)
{
pagina = "<%= endereco_virtual %>default.asp?cliente=<%= cliente %>&id=<%= id_grupo %>#"+id;
//alert(pagina);
window.returnValue = pagina;
window.close();
}
</script>
<link href="../../css/pag.css" rel="stylesheet" type="text/css">
</head>

<body bgcolor="#C0C0C0">

<table width="100%" height="100%" border="1" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="50" bordercolor="#CCCCCC"><p><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Criar 
        link para um outro link na mesma p&aacute;gina*</strong></font></p>
      <p><strong><font size="2" face="Verdana, Arial, Helvetica, sans-serif">*N&uacute;meros 
        n&atilde;o s&atilde;o permitidos</font></strong></p>
      </td>
  </tr>
  <tr> 
    <td valign="top" bordercolor="#CCCCCC"> <font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#000000"> 
      <%
	For each l in  Request.QueryString("link")
		If l <> "undefined" and l <> "length" and  not isnumeric(l) then
			%>
      <a href="#" onClick="termina('<%= l %>')"><%= l %></a><br>
       <%
		End if
	Next
	%>
      </font> </td>
  </tr>
  <tr>
    <td height="50" align="center" bordercolor="#CCCCCC"> 
      <input type="reset" name="Submit2" value="Cancelar" onClick="window.close();"></td>
  </tr>
</table>
</body>
</html>
<!-- #include file="../fechaconexoes.asp" -->
