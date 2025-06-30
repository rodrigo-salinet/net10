<!-- #include file="../../conexao.asp" -->
<!-- #include file="../conexao_adm.asp" -->
<!-- #include file="../validasenha.asp" -->
<%
nome_arquivo = Request.QueryString("arquivo")

novo_nome = Request.Form("nome_arquivo")
If novo_nome = empty then
	%><script>alert('Digite um nome para o arquivo!');
	history.go(-1);
	</script><%
	Response.End()
End if

Extensao = Request.Form("extensao")
If extensao = "outro" then
	extensao = ""
Else
	novo_nome = novo_nome & "." & extensao
End if

tipo = Request.QueryString("tipo")

texto = Request.Form("arquivo")

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

Set arquivo = fso.CreateTextFile(caminho_arquivos_cliente & "\" & novo_nome)
arquivo.write(texto)

If err.number <> 0 then
	msg = "Ocorreu um erro ao enviar o arquivo."
Else
	msg = "Atualizado."
End if
Response.Redirect(tipo & ".asp?cliente="&cliente&"&msg=" & msg & "&arquivo=" & novo_nome)


%><!-- #include file="../../fechaconexoes.asp" -->
