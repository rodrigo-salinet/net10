<!-- #include file="../../conexao.asp" -->
<!-- #include file="../conexao_adm.asp" -->


<!-- #include file="../conexao_adm.asp" -->
<!-- #include file="../validasenha.asp" -->
<%
id = Request.QuerysTring("id")
If verifica("geral") then
	If verifica("id") = id and geral = false then
		%><script>
		alert("Você não pode se autoexcluir!");
		history.go(-1);
		</script>
		<%
		Response.End()
	Else
		Conexao_adm.Execute("Delete * From usuario where id=" & id)
		Conexao_adm.Execute("Delete * From relacao where usuario=" & id)
		Response.Redirect("default.asp?msg=Excluído com sucesso.&cliente=" & cliente)
	End if
Else
%><script>
alert('Você não tem permissão para esta área do site!');
history.go(-1);
</script><%
End if
%><!-- #include file="../../fechaconexoes.asp" -->
