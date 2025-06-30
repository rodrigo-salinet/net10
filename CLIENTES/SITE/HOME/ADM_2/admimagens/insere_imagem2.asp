<!-- #include file="../../conexao.asp" -->
<%
on error goto 0

nome_pasta = Request.QueryString("categoria")
If nome_pasta <> empty then
	If left(nome_pasta, 1) = "/" then
		nome_pasta = mid(nome_pasta, 2, len(nome_pasta))
	End if
End if


	paraonde = caminho_cliente & "imagens\" & nome_pasta

	Set Upload = Server.CreateObject("Persits.Upload.1")
	Conta = Upload.Save(paraonde)
	If conta = empty or conta = 0 or vartype(conta)=0 then
		msg = "Erro ao enviar o arquivo. Caso continue recebendo esta mensagem, entre em contato com a equipe de suporte."
		Response.Write("<script> alert('" & msg & "'); history.go(-2) </script>")
		Response.End()
	Else
		msg = "Arquivo enviado."
	End if
	Response.Redirect("janela_imagens.asp?cliente=" & cliente & "&categoria=" & nome_pasta & "&msg=" & msg)
  %>
<!-- #include file="../../fechaconexoes.asp" -->
