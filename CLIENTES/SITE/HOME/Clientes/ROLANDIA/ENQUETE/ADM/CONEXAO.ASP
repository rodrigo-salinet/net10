<%
'Criando objeto 

Set FSO = Server.CreateObject("Scripting.FileSystemObject")

arquivo = "dados/rolandia/enquete.mdb"
caminho = ""


'Achando arquivo - INICIO
if (FSO.FileExists(arquivo) <> true) then
	While NOT(FSO.FileExists(arquivo2)) and total < 10
		total = total + 1
		caminho = "../" & caminho
		arquivo2 = Server.MapPath(caminho & arquivo)
	Wend
	whichFN = arquivo2
Else
	whichFN = arquivo
End if


'Achando arquivo - FIM
contxt = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source="&whichFN&";"
Set Conexao = CreateObject("ADODB.Connection")
Conexao.open contxt

%>