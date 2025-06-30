<!-- #include file="../../conexao.asp" -->
<!-- #include file="../conexao_adm.asp" -->

<%
'on error goto 0

imagem = Request.QueryString("imagem")
ncategoria = Request.QueryString("ncategoria")
nome_pasta = ncategoria
msg = "Não alterada."
If imagem <> empty and ncategoria <> "undefined" then
	Set img = fso.GetFile(imagem)
	ncategoria = caminho_cliente & "imagens\" & ncategoria & "\" & img.name
	ncategoria = replace(ncategoria, "/", "\")
	Do while instr(ncategoria, "\\") > 0 
		ncategoria = replace(ncategoria,"\\","\")
	Loop
'	Response.Write(img.path & " = " & ncategoria)
	fso.movefile img.path, ncategoria
	msg = "Alterada."
End if
Response.Redirect("janela_imagens.asp?cliente=" & cliente & "&categoria=" & nome_pasta & "&msg=" & msg)

%><!-- #include file="../../fechaconexoes.asp" -->
