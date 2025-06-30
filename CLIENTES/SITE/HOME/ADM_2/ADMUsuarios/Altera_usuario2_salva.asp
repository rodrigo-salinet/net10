<!-- #include file="../../conexao.asp" -->
<!-- #include file="../conexao_adm.asp" -->


<!-- #include file="../conexao_adm.asp" -->
<!-- #include file="../validasenha.asp" -->
<%
Sub Inseresub(iusuario, inivel)
	Set insere = Conexao_banco.Execute("Select * from nivel where subfam=" & inivel)
	If not insere.EOF then
		Do while not insere.EOF
			inivel = insere("id")
			Conexao_adm.Execute("Insert into relacao (usuario, grupo)Values(" & id & ", " & a & ")")
			call inseresub(iusuario, inivel)
			insere.movenext
		Loop
	End if
End Sub


id = Request.QuerysTring("id")
nome = Request.Form("nome")
senha = Request.Form("senha")
expira_em = Request.Form("expira_em")
geral = Request.Form("geral")
If geral = "" then
	geral = "false"
End if
If verifica("geral") then
	If verifica("id") = id and geral = false then
		%><script>
		alert("Você não pode se autodefinir como 'não-administrador'!");
		history.go(-1);
		</script>
		<%
		Response.End()
	Else
		Conexao_adm.Execute("update usuario set nome='" & nome & "', senha='" & senha & "', expira_em='" & expira_em & "', geral=" & geral & " where id=" & id)
		Conexao_adm.Execute("Delete * From relacao where usuario=" & id)
		If not geral then
			For each a in Request.Form("id_nivel")
				Conexao_adm.Execute("Insert into relacao (usuario, grupo)Values(" & id & ", " & a & ")")
				call inseresub(id, a)
			Next
		End if
		Response.Redirect("default.asp?msg=Alterado com sucesso.&cliente=" & Session("cliente"))
	End if
Else
%><script>
alert('Você não tem permissão para esta área do site!');
history.go(-1);
</script><%
End if
%><!-- #include file="../../fechaconexoes.asp" -->
