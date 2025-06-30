<%
on error resume next
Set FSO = Server.CreateObject("Scripting.FileSystemObject")

'arq2 = "dados/teste/dados/" & Session("Cliente") & "/banco.mdb"
arq2 = "dados2/" & Session("Cliente") & "/banco.mdb"
cam2 = ""

if (FSO.FileExists(arq2) <> true) then
	While NOT(FSO.FileExists(arq22))
		arq22 = Server.MapPath(cam2 & arq2)
		cam2 = "../" & cam2
	Wend
	wf2 = arq22
Else
	wf2 = arq2
End if

Set con2 = CreateObject("ADODB.Connection")
con2.open "DBQ=" & wf2 & ";Driver={Microsoft Access Driver (*.mdb)}"

Set config = con2.Execute("Select * From Config")

%>