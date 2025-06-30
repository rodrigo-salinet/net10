<!-- #include file="home/conexao.asp" -->
<%
categorias = Request.QueryString("categorias")
clicavel = Request.QueryString("clicavel") 
Cliente = Request.QueryString("cliente")
%>
<html>
<head>
<title>Busca</title>
<link href="home/clientes/<%= cliente %>/estilos/busca.css" rel="stylesheet" type="text/css">
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" bgcolor="<%= Request.QueryString("fundo") %>">
<form name="form1" target="_parent" method="get" action="default.asp">
 <table width="100%" height="100%" border="1" cellpadding="0" cellspacing="0">
  <tr valign="top"> 
   <td height="21" colspan="2">Busca:</td>
  </tr>
  <tr valign="top"> 
   <td align="right"> <input name="busca" type="text" class="busca" id="busca" size="15%"></td>
   <td> <input type="<% If clicavel then %>submit<% Else %>button<% End if %>" name="Submit" value="Buscar"> 
	<input type="hidden" name="cliente" value="<%= cliente %>"> 
   </td>
  </tr><%
  If categorias then
  %>
  <tr valign="top"> 
   <td colspan="2" align="right">
   <select name="id" id="id">
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
  </tr><%
  End if
  %>
 </table>
</form>
</body>
</html>