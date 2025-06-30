<%
usuario = Session("nome")
senha = Session("senha")
strs = "Select * From Usuario where nome='" & usuario & "' and senha='" & senha & "'"
Set verifica = Conexao_adm.Execute(strs)
If verifica.EOF then'or (usuario <> "Administrador-ViaSulnet" and senha <> "AdmV5Nldna") then
	Response.Redirect("default.asp?erro=1&cliente=" & Session("cliente"))
End if
%>