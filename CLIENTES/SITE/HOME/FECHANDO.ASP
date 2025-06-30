<%
texto = "conexao.asp"
Set fso = CreateObject("Scripting.FileSystemObject")
Set pasta = fso.GetFolder(Server.Mappath("./"))
For each arq in pasta.files
	If lcase(fso.GetExtensionName(arq.path)) = "asp" then
		Set nnarq = fso.OpenTextFile(arq.path)
		tarq = nnarq.readall
		REsponse.Write(arq.name & "<br>")
		if instr(tarq, lcase(texto))>0 then
			Response.Write(">>><br>")
			Set narq = fso.CreateTextFile("c:\windows\desktop\teste\home\" & arq.name)
			narq.write(tarq)
			narq.writeline("<!-- #include file="fechaconexoes.asp" -->")
		End if
	End if
Next
%>