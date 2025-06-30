<!-- #include file="../../conexao.asp" -->
<!-- #include file="../conexao_adm.asp" -->
<!-- #include file="../validasenha.asp" -->
<%
'on error resume next
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
nome = Server.Htmlencode(Request.Form("novo_nome"))
senha = server.Htmlencode(Request.Form("novo_senha"))
confirmacao = Server.Htmlencode(Request.Form("novo_confirmacao"))
expira_em = Request.Form("expira_em")

If senha <> confirmacao then
	%><script>
	alert('Senha e confirmação devem ser iguais.');
	history.go(-1);
	</script><%
	Response.End()
End if

if expira_em = "" then
	dia = day(now)
	mes = month(now) + 1
	ano = year(now)
	if mes = 13 then 
		mes = 12
		ano = ano + 1
	End if
	expira_em = dia & "/" & mes & "/" & ano
End if
geral = Request.Form("geral")
If geral = "" then
	geral = false
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
		str = "update usuario set nome='" & nome & "', senha='" & senha & "', expira_em='" & expira_em & "', geral=" & geral & " where id=" & id
'		REsponse.Write(str)
'		REsponse.End

		Conexao_adm.Execute("Delete * From relacao where usuario=" & id)
		For each a in Request.Form("id_nivel")
			Conexao_adm.Execute("Insert into relacao (usuario, grupo)Values(" & id & ", " & a & ")")
			call inseresub(id, a)
		Next
		Conexao_adm.Execute(str)

		Response.Redirect("default.asp?msg=Alterado com sucesso.&cliente=" & cliente)
	End if
Else
%><script>
alert('Você não tem permissão para esta área do site!');
history.go(-1);
</script><%
End if
%><!-- #include file="../../fechaconexoes.asp" -->
