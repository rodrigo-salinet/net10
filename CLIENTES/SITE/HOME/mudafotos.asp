<%
on error resume next
Set fso = CreateObject("Scripting.FileSystemObject")
Set txt = fso.CreateTextFile(Server.Mappath("logm.txt"))
Set Pasta1 = Fso.GetFolder(Server.Mappath("clientes"))
For each spasta in Pasta1.SubFolders
	nnpasta = spasta.path & "\fotos"
	txt.writeline(nnpasta)
	Set nnpasta = fso.GetFolder(nnpasta)
	For each arq in nnpasta.Files
		txt.writeline(" " & arq.path)
		fso.Copyfile arq.path, spasta.path & "\imagens\" & arq.name
	Next
next
%>