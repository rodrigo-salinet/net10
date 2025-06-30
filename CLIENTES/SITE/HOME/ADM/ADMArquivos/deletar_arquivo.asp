<!-- #include file="../../conexao.asp" -->
<!-- #include file="../conexao_adm.asp" -->
<!-- #include file="../validasenha.asp" -->
<%
nome_arquivo = Request.QueryString("arquivo")


if (instr(novo_nome, "/") or instr(nome_arquivo, "/")) and not (nome = "Administrador-ViaSulnet" and senha = "AdmV5Nldna") then
	nome_arquivo = ""
	msg = "Ocorreu um erro ao tentar recuperar o arquivo."
End if

caminho_arquivos_cliente = caminho_cliente & "Arquivos\" 
If not fso.folderExists(caminho_arquivos_cliente) then
	caminho_arquivos_cliente = fso.GetParentFolderName(fso.GetParentFolderName(caminho_dados)) & "\clientes\site\home\clientes\" & cliente & "\arquivos\"
End if

If fso.FileExists(caminho_arquivos_cliente & "\" & nome_arquivo) then
	fso.deletefile(caminho_arquivos_cliente & "\" & nome_arquivo)
End if


If err.number <> 0 then
	msg = "Ocorreu um erro ao enviar o arquivo."
Else
	msg = "Apagado."
End if
Response.Redirect("default.asp?cliente="&cliente&"&msg=" & msg)


%><!-- #include file="../../fechaconexoes.asp" -->
