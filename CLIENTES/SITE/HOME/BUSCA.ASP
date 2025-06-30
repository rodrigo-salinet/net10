<!-- #include file="home/conexao.asp" -->
<%
clicavel = Request.QueryString("clicavel") 
Cliente = Request.QueryString("cliente")
If cliente = empty then Cliente = cliente
%>
<html>
<head>
<title>Busca</title>
<script>
function muda_fundo()
{
//	document.body.bgColor = parent.document.body.bgColor;
}
</script>
<link href="home/clientes/<%= cliente %>/estilos/busca.css" rel="stylesheet" type="text/css">
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" bgcolor="<%= Request.QueryString("fundo") %>" onLoad="muda_fundo()">
<form name="form1" target="_parent" method="get" action="default.asp?cliente=<%= cliente %>&">
  
 <table width="100%" height="100%" border="1" cellpadding="0" cellspacing="0">
  <tr valign="top"> 
   <td height="21" colspan="2">Busca:</td>
  </tr>
  <tr valign="top"> 
   <td align="right"> <input name="busca" type="text" class="busca" id="busca" size="15%"></td>
   <td> <input type="<% If clicavel then %>submit<% Else %>button<% End if %>" name="Submit" value="Buscar"> 
	<input type="hidden" name="cliente" value="<%= cliente %>"> 
   </td>
  </tr>
  <tr valign="top"> 
   <td colspan="2" align="right">
   <select name="idfam" id="idfam">
   <option value="0" selected>Buscar em todos</option>
   <%
   Set rs = Conexao_banco.Execute("Select * From nivel order by subfam, ordem")
   Do while not rs.EOF
   %>
	 <option value="<%= rs("id") %>"><%= rs("nivel") %></option>
	 <%
	 rs.movenext
	 Loop
	 %>
	</select></td>
  </tr>
 </table>
</form>
</body>
</html>