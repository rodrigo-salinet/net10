<!-- #include file="../conexao.asp" -->
<!-- #include file="conexao_adm.asp" -->
<!-- #include file="../conexao_configuracoes.asp" -->
<!-- #include file="validasenha.asp" -->
<%
on error goto 0
If verifica("geral") then
%>
<%
Session.LCID = 1033
altera = Request.QueryString("altera")
id_menu = Request.QueryString("id_menu")

If altera then
	For a = 1 to  Request.Form.count
		If lcase(Request.Form.key(a)) <> "submit" then
			nome_item = Request.Form.key(a)
			nome_item = replace(nome_item, "'", """")
			valor_item = Request.Form.item(a)
			nstr = "Update tags set " & nome_item & "='" & valor_item & "' where id_menu=" & id_menu
'			REsponse.Write(Server.HTMLEncode((nstr)) & "<hr>")
'			Conexao_conf.Execute(nstr)
			str = str & Request.Form.key(a) & "='" & replace(Request.Form.item(a), "'" ,"""") & "'" & ","
		End if
	Next
End if
str = left(str, len(str)-1)
str =  "Update tags set " & str & " where id_menu=" & id_menu' tag_abre='" & replace(Request.Form("tag_abre"), "'", """") & "', tag_fecha='" & replace(Request.Form("tag_fecha"), "'", """") & "', aplica_a='" & replace(Request.Form("aplica_a"), "'", """") & "', posicao_v='" & replace(Request.Form("posicao_v"), "'", """")& "', texto='" & replace(Request.Form("texto"), "'", """") & "', mostrar=" & Request.Form("mostrar") & " where id_menu=" & id_menu
REsponse.Write(str)
Conexao_Conf.Execute(str)
Response.Write(Server.HTMLEncode(str))
%>
<html>
<head>
<title>TAGS</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body bgcolor="#CCCCCC">
<%
Set campos = CreateObject("Scripting.Dictionary")
Set rs = Conexao_conf.Execute("Select * from tags")
Do while not rs.EOF
	%><form action="admtags.asp?altera=true&id_menu=<%= rs("id_menu") %>&cliente=<%= cliente %>" target="_self" method="post">
 <table border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" bgcolor="#F0F0F0">
  <%
	For i = 1 to rs.fields.count-1
		nome = rs.fields(i).name
		valor = rs.fields(i).value
		valor = replace(valor, """", "'")
	'valor = replace("")
'		campos.add rs.fields(i).item, rs.fields(i).value
		%>
  <tr> 
   <td><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>&nbsp;<%= nome %>:&nbsp;</strong></font></td>
   <td><input name="<%= nome %>" type="text" id="<%= nome %>" value="<%= valor %>" size="80">
	&nbsp;</td>
  </tr>
  <%
	Next
		%>
  <tr align="center"> 
   <td colspan="2"> 
	<input type="submit" name="Submit" value="Enviar"> <input type="reset" name="Submit2" value="Redefinir">
   </td>
  </tr>
 </table>
 <br>
 <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
   <td><%= ucase(rs("aplica_a")) %>&nbsp;
	</td>
  </tr>
  <tr> 
   <td>In&iacute;cio do item:</td>
  </tr>
  <tr> 
   <td>&nbsp;</td>
  </tr>
  <tr> 
   <td>Fim do item:</td>
  </tr>
  <tr> 
   <td>&nbsp;</td>
  </tr>
  <tr> 
   <td>Posi&ccedil;&atilde;o vertical: </td>
  </tr>
  <tr>
   <td>&nbsp;</td>
  </tr>
  <tr> 
   <td>&nbsp; </td>
  </tr>
 </table>
 <br>
		</form>
	<%
	rs.movenext
Loop
%>
</body>
</html>
<%
End if
%><!-- #include file="../fechaconexoes.asp" -->
