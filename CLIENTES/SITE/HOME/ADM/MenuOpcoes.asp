<%
objeto = Request.QueryString("objeto")
existe = Request.QueryString("tag")
%>
<html>
<head>
<script>
function retorna(valor)
{
	window.returnValue = valor;
	window.close();
}	
</script>
<title>Alterar <%= objeto %></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style type="text/css">
<!--
a {
	text-decoration: none;
}
-->
</style>
</head>

<body bgcolor="#C0C0C0" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<%
if lcase(objeto) = "table" then
%>
<table width="100%" height="100%" border="1" cellpadding="0" cellspacing="2" bordercolor="#000000" bgcolor="lightgrey" class="FontePequena">
 <tr> 
  <td align="left" bordercolor="lightgrey"><a href="#" onClick="retorna('setFocus();janelatabela();')"><font color="#000000" size="2" face="Verdana, Arial, Helvetica, sans-serif">Inserir 
   tabela...</font> </a></td>
 </tr>
 <%
 If existe = "[object]" then
 %>
 <tr> 
  <td align="left" bordercolor="lightgrey"><a href="#" onClick="retorna('Propriedades(\'TABLE\')')"><font color="#000000" size="2" face="Verdana, Arial, Helvetica, sans-serif">Modificar 
   propriedades da tabela...</font> </a></td>
 </tr>
 <tr> 
  <td height="1" align="left" bordercolor="lightgrey" bgcolor="#666666"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><img src="../Imagens/transparent.gif" width="1" height="1"></font></td>
 </tr>
 <tr> 
  <td align="left" bordercolor="lightgrey"><a href="#" onClick="retorna('InsereColunaTb(\'\')')"><font color="#000000" size="2" face="Verdana, Arial, Helvetica, sans-serif">Inserir 
   coluna</font></a></td>
 </tr>
 <tr> 
  <td align="left" bordercolor="lightgrey"><a href="#" onClick="retorna('InsereLinhaTb(\'\')')"><font color="#000000" size="2" face="Verdana, Arial, Helvetica, sans-serif">Inserir 
   linha</font></a></td>
 </tr>
 <tr>
  <td align="left" bordercolor="lightgrey"><a href="#" onClick="retorna('ExcluiColunaTb(\'\')')"><font color="#000000" size="2" face="Verdana, Arial, Helvetica, sans-serif">Excluir 
   coluna</font></a></td>
 </tr>
 <tr> 
  <td align="left" bordercolor="lightgrey"><a href="#" onClick="retorna('ExcluiLinhaTb(\'\')')"><font color="#000000" size="2" face="Verdana, Arial, Helvetica, sans-serif">Excluir 
   linha</font></a></td>
 </tr>
 <tr> 
  <td height="1" align="left" bordercolor="lightgrey" bgcolor="#666666"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><img src="../Imagens/transparent.gif" width="1" height="1"></font></td>
 </tr>
 <tr> 
  <td align="left" bordercolor="lightgrey"><a href="#" onClick="retorna('Propriedades(\'TD\')')"><font color="#000000" size="2" face="Verdana, Arial, Helvetica, sans-serif">Propriedades 
   da c&eacute;lula</font></a></td>
 </tr>
 <%
 End if
 %>
</table>
<%
End if
%>
</body>
</html>
