<%'On error resume next%>
<!-- #include file="../../conexao.asp" -->
<!-- #include file="../conexao_adm.asp" -->
<!-- #include file="../validasenha.asp" -->
<%
Session.LCID = 1046
id = Request.QuerysTring("id")
nome = Request.Form("novo_nome")
senha = Request.Form("novo_senha")
expira_em = Request.Form("expira_em")
confirmacao = Request.Form("novo_confirmacao")
If senha <> confirmacao then
	%><script>
	alert('Senha e confirma��o devem ser iguais.');
	history.go(-1);
	</script><%
	Response.End()

End if

If expira_em = "" then expira_em = day(now) & "/" & month(now) & "/" & year(now) + 1
geral = Request.Form("geral")
If geral = "" then
	geral = "false"
End if
If verifica("geral") then
	Set rs = Conexao_ADM.Execute("Select * from usuario where nome='" & nome & "'")
	If rs.EOF then
		str = "Insert into usuario (nome, senha, expira_em, geral) values('" & nome & "', '" & senha & "', '" & expira_em & "', " & geral & ")"
'		Response.Write(str)
		Conexao_adm.Execute(str)
		Response.Redirect("default.asp?cliente=" & cliente & "&msg=Inserido com sucesso.<br>Para mudar as permiss�es deste usu�rio, clique sobre ele.")
	Else
		%><script>
		alert('J� existe um usu�rio com este nome!');
		history.go(-1);
		</script><%
	End if
Else
	%><script>
	alert('Voc� n�o tem permiss�o para esta �rea do site!');
	history.go(-1);
	</script><%
End if
%><!-- #include file="../../fechaconexoes.asp" -->
