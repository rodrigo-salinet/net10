<% clicavel = Request.QueryString("clicavel") %>
<html>
<head>
<title>Busca</title>
<script>
function muda_fundo()
{
//	document.body.bgColor = parent.document.body.bgColor;
}
</script>
<link href="home/clientes/<%= Session("cliente") %>/estilos/<%= Request.QueryString("subcam") %>/busca.css" rel="stylesheet" type="text/css">
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" bgcolor="<%= Request.QueryString("fundo") %>" onLoad="muda_fundo()">
<form name="form1" target="_parent" method="get" action="buscar.asp?cliente=<%= Session("cliente") %>">
  
 <table width="100%" height="100%" border="1" cellpadding="0" cellspacing="0">
  <tr valign="top"> 
   <td height="21" colspan="2">Busca:</td>
    </tr>
    
  <tr valign="top"> 
   <td align="right"> 
	<input name="busca" type="text" class="busca" id="busca" size="15%"></td>
      
   <td> 
	<input type="<% If clicavel then %>submit<% Else %>button<% End if %>" name="Submit" value="Buscar"> </td>
    </tr>
  </table>
</form>
</body>
</html>