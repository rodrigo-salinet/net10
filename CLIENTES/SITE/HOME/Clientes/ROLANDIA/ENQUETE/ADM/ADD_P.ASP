<!--#include file="conexao.asp"-->
<!--#include file="inc/funcaodata.asp"-->
<%
Set login = Conexao.Execute("Select * FRom Login")
If Session("usuario") <> login("usuario") and Session("senha") <> login("senha") then
	REsponse.Redirect("default.asp?erro=Usuário ou senha inválidos.")
End if
'------------------------------------------------------------------------------------------
' Este ASP adiciona uma pergunta ao banco de dados
'------------------------------------------------------------------------------------------

' Obtenho o valor da data
	data=request.form("data")
' troco o a data de dd/mm/aaaa para aaaa/mm/dd para não dar problema no SQL
	data= datainvertida(data)
' Obtenho o texto da pergunta
	pergunta=request.form("pergunta")
' Troco eventuais " por "" para não dar erro no SQL
	pergunta=replace(pergunta,chr(34),chr(39)&chr(39))
' Seleciono o valor máximo do ID+1 de todas as perguntas
	sql="Select MAX(id_enquete + 1) AS id_max FROM enquete_pergunta"
	set id=conexao.execute(sql)
' Se o valor máximo de ID das respostas for null, ID da resposta passa a ter valor 1	
	if isnull(id("id_max")) then
		id_pergunta=1
	else
' Senão tem o valor do SQL, porque é o id maximo+1
		id_pergunta=id("id_max")
	end if
' Adiciono ao banco de dados o registo de mais uma pergunta	
	sql="INSERT INTO enquete_pergunta (id_enquete, data, pergunta) "
	sql=sql&"values (" & id_pergunta & ",#" & data & "#,'" & pergunta & "')"
	conexao.execute(sql)
' no fim redireciono o browser para a tela de administração
	response.redirect "admin.asp"
%>