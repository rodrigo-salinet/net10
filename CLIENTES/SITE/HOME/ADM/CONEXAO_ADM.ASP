<%
If Request.Form("usuario") <> empty then
	Session("usuario") = Request.Form("usuario")
	If Request.Form("senha") <> empty then
		Session("senha") = Request.Form("senha")
	End if
End if
Caminho_adm = caminho_dados & "\usuarios.mdb"
Set conexao_adm = CreateObject("ADODB.Connection")
Conexao_adm.open "DBQ=" & Caminho_adm & ";Driver={Microsoft Access Driver (*.mdb)}"

Function Mostra_Caminho_do_arquivo(caminho_do_arquivo)
	If (instr(caminho_do_arquivo, "<script>abrearquivo(&#" & asc("'") & ";")) > 0 or instr(caminho_do_arquivo, "<script>abrearquivo(&#" & asc("'") & ";") > 0 and instr(caminho_do_arquivo, """, ""_blank"");history.go(-1);} abre();</script><center>Se a página não abrir automaticamente, <a href=""#"" onClick=""abre()"">clique aqui.</a></center>")>0 then
		arquivo = caminho_do_arquivo
		arquivo = replace(arquivo, "<script>abrearquivo(&#39;", "")
		arquivo = replace(arquivo, "&#39;, &#39;_self&#39;)</script><center>Se a página não abrir automaticamente, <a href=""" & endereco_virtual, "")
		arquivo = replace(arquivo, """ target=""_blank"">clique aqui.</a></center>", "")
		arquivo = left(arquivo, len(arquivo)/2)
		Mostra_Caminho_do_arquivo = arquivo
	Else
		Mostra_Caminho_do_arquivo = false
	End if
End Function
%>
