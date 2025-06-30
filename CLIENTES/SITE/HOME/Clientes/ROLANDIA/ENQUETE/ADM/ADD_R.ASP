<!--#include file="conexao.asp"-->
<%
Set login = Conexao.Execute("Select * FRom Login")
If Session("usuario") <> login("usuario") and Session("senha") <> login("senha") then
	REsponse.Redirect("default.asp?erro=Usuário ou senha inválidos.")
End if
'------------------------------------------------------------------------------------------
' Este ASP adiciona uma resposta a uma pergunta de ID dado
'------------------------------------------------------------------------------------------

' Obtenho o ID da pergunta
id_p=request.form("id_p")
' Obtenho o texto da resposta
resposta=request.form("resposta")
' Troco eventuais " por "" para não dar erro no SQL
resposta=replace(resposta,chr(34),chr(39)&chr(39))
' Seleciono o valor máximo do ID+1 de todas as respostas
sql="Select MAX(id_resposta + 1) AS id_max FROM enquete_respostas"
set id=conexao.execute(sql)
' Se o valor máximo de ID das respostas for null, ID da resposta passa a ter valor 1
if isnull(id("id_max")) then
	id_resposta=1
else
' Senão tem o valor do SQL, porque é o id maximo+1
	id_resposta=id("id_max")
end if
' Adiciono ao banco de dados o registo de mais uma resposta 
sql="INSERT INTO enquete_respostas (id_resposta, id_enquete, respostas, hits) "
sql=sql&"values (" & id_resposta & "," & id_p & ",'" & resposta & "',0)"
conexao.execute(sql)
' no fim redireciono o browser para a tela de administração
response.redirect "admin.asp"
%>