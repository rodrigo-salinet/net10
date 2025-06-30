<!-- #include file="../conexao.asp" -->
<!-- #include file="conexao_adm.asp" -->
<!-- #include file="validasenha.asp" -->
<%
If len(Request.Form("usuario")) < 3 then
	Response.Redirect("alterasenha.asp?cliente=" & cliente & "&erro=1")
Else
	If len(Request.Form("senha")) < 3 then
		Response.Redirect("alterasenha.asp?cliente=" & cliente & "&erro=2")
	Else
		If Request.Form("senha") <> Request.Form("Confirmacao") then
			Response.Redirect("alterasenha.asp?cliente=" & cliente & "&erro=3")
		Else
			Session("nome") = Request.Form("usuario")
			Session("senha") = Request.Form("senha")
			Session("usr") = "Alteração de usuários!"
			Conexao_banco.Execute("Update usuario set nome='" & Request.Form("usuario") & "', Senha='" & Request.Form("senha") & "'")
			Response.Redirect("Administrador.asp?cliente=" & cliente)
		End if
	End if
End if
Response.Redirect("alterasenha.asp?cliente=" & cliente & "&erro=4")
%><!-- #include file="../fechaconexoes.asp" -->
