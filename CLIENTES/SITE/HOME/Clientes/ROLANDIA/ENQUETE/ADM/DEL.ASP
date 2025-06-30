<!--#include file="conexao.asp"-->
<%
Set login = Conexao.Execute("Select * FRom Login")
If Session("usuario") <> login("usuario") and Session("senha") <> login("senha") then
	Response.Redirect("default.asp?erro=Usuário ou senha inválidos.")
End if
'------------------------------------------------------------------------------------------
' Este ASP apaga ou uma resposta ou uma pergunta e todas as suas respostas
'------------------------------------------------------------------------------------------

' Obtenho o ID da pergunta e o ID da resposta
	id_p=request.querystring("id_p")
	id_r=request.querystring("id_r")

' Se o ID da pergunta estiver vazio, então apago a resposta do ID dado
	if isempty(id_p) then
		sql="DELETE * FROM enquete_respostas WHERE id_resposta="&id_r
		conexao.execute(sql)
	else
' Se o ID da pergunta tiver valor, apago todas as respotas dessa pergunta
		sql="DELETE * FROM enquete_respostas WHERE id_enquete="&id_p
		conexao.execute(sql)
' e de seguida apago a pergunta desse ID
		sql="DELETE * FROM enquete_pergunta WHERE id_enquete="&id_p
		conexao.execute(sql)
	end if
' no fim redireciono o browser para a tela de administração
	response.redirect "admin.asp"
%>