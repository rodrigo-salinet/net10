<%

nome = Server.HTMLEncode(Request.Form("nome"))
senha = Server.HTMLEncode(Request.Form("Senha"))
If nome = empty and senha = empty then
	nome = Server.HTMLEncode(Request.Cookies("login")("nome"))
	senha = Server.HTMLEncode(Request.Cookies("login")("senha"))
Else
	Response.Cookies("login")("nome") = nome
	Response.Cookies("login")("senha") = senha
	If Request.Form("lembrar") then
		Response.Cookies("login").expires = day(now) & "/" & month(now)+1 & "/" & year(now)
	End if
End if
strs = "Select * From Usuario where nome='" & nome & "' and senha='" & senha & "'"
'REsponse.Write(strs)
Set verifica = Conexao_adm.Execute(strs)
If verifica.EOF then'or (usuario <> "Administrador-ViaSulnet" and senha <> "AdmV5Nldna") then
	Response.Redirect("default.asp?erro=1&cliente=" & cliente)
Else
	id_usuario = verifica("id")
End if
%>