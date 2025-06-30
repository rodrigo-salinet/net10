<!-- #include file="../conexao.asp" -->
<!-- #include file="conexao_adm.asp" -->
<!-- #include file="validasenha.asp" -->
<%
Function ExcluiGrupo(nivel)
	Set arv = Conexao_Banco.Execute("Select * From nivel where subfam=" & nivel & " order by ordem")
	Do while not arv.EOF
		call ExcluiGrupo(arv("id"))
		Conexao_banco.Execute("Delete * From nivel where id=" & arv("id"))
		arv.movenext
	Loop
End Function


'on error resume next
id = Request.QueryString("id")
Exclui_arquivo = Request.QueryString("exclui_arquivo")
Set rs = Conexao_Banco.Execute("Select * From nivel where id=" & id)
caminho_do_arquivo = rs("pagina_inicial")


'If exclui_arquivo = "sim" then
	arquivo = Mostra_Caminho_do_arquivo(caminho_do_arquivo)
	arquivo = split(arquivo, ",")
	arquivo1 = arquivo(0)
	arquivo1 = replace(arquivo1, "&#39;", "")
'	Response.Write(arquivo1)
'	Response.End()
	arquivo = Server.MapPath("../../" & arquivo1)
	If fso.FileExists(arquivo) then
		fso.DeleteFile(arquivo)
	End if
'End if



Set rs = Conexao_Banco.Execute("Select * From nivel where id=" & id)
subfam = rs("subfam")

If Request.QueryString("subitens")="sim" then
	excluigrupo(id)
Else
	Conexao_banco.Execute("Update Nivel set subfam=" & subfam & " where subfam=" & id)
End if
str = "Delete * from nivel where id=" & id
Conexao_banco.Execute(str)

Conexao_adm.Execute("Delete * From RELACAO where grupo=" & id)

Response.Redirect("Administrador.asp?msg=Excluído com sucesso.&id=" & subfam & "&cliente=" & cliente)
%>
<!-- #include file="../fechaconexoes.asp" -->
