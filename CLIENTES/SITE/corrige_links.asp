<!-- #include file="home/conexao.asp" -->
<%
Modo = Request.Form("modo")
errado = Request.Form("errado")
certo = Request.Form("certo")
%>
<html>
<head>
<title>Corrigir links errados...</title>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"></head>


<body<% IF pagina("fundo_fixo") then %> bgproperties="fixed"<% End if %>>
<form name="form1" method="post" action="corrige_links.asp?cliente=<%= cliente %>">
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td>Link errado:</td>
      <td><input name="errado" type="text" id="errado" value="<%= errado %>" size="60"></td>
    </tr>
    <tr> 
      <td>Link certo: </td>
      <td><input name="certo" type="text" id="certo" value="<%= certo %>" size="60"></td>
    </tr>
    <tr> 
      <td colspan="2"><input name="modo" type="radio" value="verificar" checked>
        Verificar 
        <input type="radio" name="modo" value="corrigir">
        Corrigir</td>
    </tr>
    <tr>
      <td colspan="2"><input type="submit" name="Submit" value="Iniciar &gt;&gt;"></td>
    </tr>
  </table><br>
<br>
<fieldset>
  <legend><font size="1" face="Arial, Helvetica, sans-serif"><strong>Resultados: 
  </strong></font></legend>
<%
Set rs = Conexao_banco.Execute("Select * From nivel where pagina_inicial like '%" & errado & "%'")
Response.Write("<ol>")
Do while not rs.EOF
	Response.Write("<li>" & rs("id") & ": " & rs("nivel") & "</li>") 
	sql_corrige = "Update nivel set pagina_inicial='" & replace(rs("pagina_inicial"), errado, certo) & "' where id=" & rs("id")
	If modo = "corrigir" then
		REsponse.Write("<p>" & Server.HTMLEncode(sql_corrige) & "</p>")
		Conexao_banco.Execute(sql_corrige)
	End if
	rs.movenext
Loop

Response.Write("</ol>")
%></fieldset>
  </form>
</body>
</html>