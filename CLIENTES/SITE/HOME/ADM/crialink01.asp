<!-- #include file="../conexao.asp" -->
<!-- #include file="conexao_adm.asp" -->
<!-- #include file="validasenha.asp" -->
<%
id_grupo = Request.QueryString("id_grupo")
if id_grupo = empty then
	id_grupo = "0"
End if
%>

<html>
<head>
<title>Criar Link</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<script>
function termina(id)
{
pagina = "<%= endereco_virtual %>default.asp?cliente=<%= cliente %>&id="+id;
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
        link para um outro item</strong></font></p>
      </td>
  </tr>
  <tr> 
    <td valign="top" bordercolor="#CCCCCC"> <font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#000000">
	<%
		Function arvore(nivel)
			Set arv = Conexao_Banco.Execute("Select * From nivel where subfam=" & nivel & " order by ordem")
			%><ul>  <%
			Do while not arv.EOF
				%>
				<li lang='af' type="square" class='tabela'><a href="#" onClick="termina('<%= arv("id") %>')"><%= texto_imagem("texto", arv("nivel")) %></a></li>
				  <%
				call arvore(arv("id"))
				arv.movenext
			Loop
			%></ul><%
		End Function
	%> <%
	Set rs = Conexao_banco.Execute("Select * From Nivel where subfam=" & id_grupo)
	Do while not rs.EOF
		%><blockquote><a href="#" onClick="termina('<%= rs("id") %>')"><%= texto_imagem("texto", rs("nivel")) %></a><%
		call arvore(rs("id"))
		%></blockquote><%
	rs.movenext
	loop
	%></font>
	</td>
  </tr>
  <tr>
    <td height="50" align="center" bordercolor="#CCCCCC"> 
      <input type="reset" name="Submit2" value="Cancelar" onClick="window.close();"></td>
  </tr>
</table>
</body>
</html>
<!-- #include file="../fechaconexoes.asp" -->
