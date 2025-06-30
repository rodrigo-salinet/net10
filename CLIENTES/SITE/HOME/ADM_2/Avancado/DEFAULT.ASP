<%
usuario = Request.QueryString("usuario")
senha = Request.Form("senha")
If usuario = "viasulnet" then
	If senha <> empty then'and senha = "v145u7" then
		Funcao = Request.Form("funcao")
		Acao = Request.Form("acao")
		str = Request.Form("str")
		para_todos = Request.Form("para_todos")
		cliente = Request.QueryString("cliente")
		If request.QueryString("conexao") = "banco" then
			Conexao_banco.Execute(str)
		End if
	Else
		msg = "Senha não confere."
	End if
	%>
	<!-- #include file="../../conexao.asp" -->
	<html>
	<head>
	<title>Executa Fun&ccedil;&atilde;o</title>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
	</head>
	
	<body><%= msg %>
	<form name="form1" method="post" action="default.asp?cliente=<%= cliente %>&usuario=<%= usuario %>">
	 
 <textarea name="str" cols="80" id="str"></textarea>
 <br>
 <select name="conexao" id="conexao">
  <option value="banco" selected>Banco</option>
 </select>
 <input name="para_todos" type="checkbox" id="para_todos" value="true">
 Para Todos os Clientes<br>
	 <input type="submit" name="Submit" value="Enviar">
 Senha: 
 <input name="senha" type="password" id="senha">
</form>
	</body>
	</html>
	<% 
End if %>