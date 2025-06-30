<!--#include file="conexao.asp"-->
<!--#include file="inc/funcaodata.asp"-->
<%
Set login = Conexao.Execute("Select * From Login")
If Session("usuario") <> login("usuario") and Session("senha") <> login("senha") then
	Response.Redirect("default.asp?erro=Usuário ou senha inválidos.")
End if
'------------------------------------------------------------------------------------------
' Este ASP apaga ou uma resposta ou uma pergunta e todas as suas respostas
'------------------------------------------------------------------------------------------

' Obtenho o ID da pergunta e o ID da resposta	
	id_p=request.form("id_p")
	id_r=request.form("id_r")

	if isempty(id_p) then
' Obtenho o texto da resposta
		resposta=request.form("resposta")
' Atualizo o banco de dados com o texto da resposta
		sql="UPDATE enquete_respostas set respostas='"&resposta&"' WHERE id_resposta="&id_r
		conexao.execute(sql)
	else
' Obtenho a data
		data=request.form("data")
' troco o a data de dd/mm/aaaa para aaaa/mm/dd para não dar problema no SQL
		data= datainvertida(data)
' Obtenho o texto da pergunta
		pergunta=request.form("pergunta")
' Troco eventuais " por "" para não dar erro no SQL
		pergunta=replace(pergunta,chr(34),chr(39)&chr(39))
' Obtenho o texto da msg
		msg=request.form("msg")
' Troco eventuais " por "" para não dar erro no SQL
		msg=replace(msg,chr(34),chr(39)&chr(39))
' Atualizo o banco de dados com a data e o texto da pergunta
		sql="UPDATE enquete_pergunta set data=#"&data&"#, pergunta='"&pergunta&"', msg='"&msg&"' WHERE id_enquete="&id_p
		conexao.execute(sql)
	end if
' no fim redireciono o browser para a tela de administração
	response.redirect "admin.asp"
%>