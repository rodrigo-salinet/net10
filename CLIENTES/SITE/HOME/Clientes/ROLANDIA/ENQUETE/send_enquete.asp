<%
'Criando objeto 

Set FSO = Server.CreateObject("Scripting.FileSystemObject")

arquivo = "dados/enquete.mdb"
caminho = ""


'Achando arquivo - INICIO
if (FSO.FileExists(arquivo) <> true) then
	While NOT(FSO.FileExists(arquivo2))
		caminho = "../" & caminho
		arquivo2 = Server.MapPath(caminho & arquivo)
	Wend
	whichFN = arquivo2
Else
	whichFN = arquivo
End if


'Achando arquivo - FIM
contxt = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source="&whichFN&";"
Set Conexao = CreateObject("Adodb.Connection")
'Response.WRite contxt
Conexao.open contxt
%>
<%
	'------------------------------------------------------------------------------------------
	' Este ASP adiciona um hit á resposta da enquete
	'------------------------------------------------------------------------------------------
	
	' Obtenho o ID da resposta a que tenho de adicionar +1
		id_resposta=request.form("resposta")
	' Uso esse ID para saber quantos hits essa resposta já tem
		sql="SELECT ID_enquete, hits FROM enquete_respostas WHERE ID_resposta="&id_resposta
		set resposta=conexao.execute (sql)
if Request.Cookies("CONFEPAR"&Request.Form("ID_enquete"))<>"sim" then
	' Atualizo o banco de dados com o valor atual de hits + 1
		sql="UPDATE enquete_respostas set hits="&resposta("hits")+1&" WHERE id_resposta="&id_resposta
		conexao.execute(sql)
	'Gravando Cookie no Cliente para ele não responder novamente
		Response.Cookies("CONFEPAR"&Request.Form("ID_enquete"))="sim"
	' Redireciono o browser do usuário para a página que exibe os resultados das enquetes
		response.redirect "resultados.asp?id="&resposta(0)
else
	' Pessoa já respondeu
		response.redirect "resultados.asp?erro=sim&id="&resposta(0)
End if
%>