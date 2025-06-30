<!-- #include file="home/conexao.asp" -->
<%
categorias = Request.QueryString("categorias")
clicavel = Request.QueryString("clicavel") 
Cliente = Request.QueryString("cliente")
If cliente = empty then Cliente = Session("Cliente")
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
<form name="form1" target="_parent" method="get" action="default.asp?cliente=<%= Session("cliente") %>&">
  
  <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top"> 
      <td height="21" colspan="2">
        <input name="busca" type="text" class="busca" id="busca" size="15%" value="Busca">
        <input type="hidden" name="cliente" value="<%= cliente %>">
        <select name="idfam" id="idfam">
          <option value="0" selected>Buscar em todos</option>
          <%
   Set rs = Conexao_banco.Execute("Select * From nivel where subfam=0 OR subfam=null order by subfam, ordem")
   Do while not rs.EOF
   %>
          <option value="<%= rs("id") %>"><%= rs("nivel") %></option>
          <%
	 rs.movenext
	 Loop
	 %>
        </select>
        <input type="<% If clicavel then %>submit<% Else %>button<% End if %>" name="Submit" value="Buscar">
      </td>
    </tr>
    <%
  If categorias then
  %>
    <%
  End if
  %>
  </table>
</form>
</body>
</html>