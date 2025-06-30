<!-- #include file="../conexao.asp" -->
<!-- #include file="conexao_adm.asp" -->
<!-- #include file="validasenha.asp" -->
<%
idfam=Request.QueryString("idfam")
id = Request.QueryString("id")

If id="todos" then
	Set rs = conexao_banco.Execute("Select * from nivel where idfam=" & idfam)
	visualiza = "todos"
	If visualiza = "todos" then
		visualiza = "true"
	Else
		visualiza = "todos"
	End if
Else
	Set rs = conexao_banco.Execute("Select * from nivel where id=" & id)
	visualiza = rs("visualizar")
	If visualiza = "true" or vartype(visualiza) = 1 then
		visualiza = "false"
	Else
		visualiza = "true"
	End if
End if
Conexao_banco.Execute("Update nivel set visualizar='" & visualiza & "' where id=" & id)
Response.Redirect("Administrador.asp?idfam=" & idfam)

%><!-- #include file="../fechaconexoes.asp" -->
