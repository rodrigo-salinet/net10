<html>
<head>
<title>Documento sem t&iacute;tulo</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<%
on error resume next
Set fso = CreateObject("Scripting.FileSystemObject")
Set pasta = fso.GetFolder("C:\WINDOWS\Desktop\Net10\dados\")
For each spasta in pasta.subfolders
	whichFN = spasta.path & "\banco.mdb"
	REsponse.Write("<hr>Pasta: " & spasta.Path)
	Set Conexao_banco = CreateObject("ADODB.Connection")
	Conexao_banco.open "DBQ=" & whichFN & ";Driver={Microsoft Access Driver (*.mdb)}"

	Conexao_banco.Execute("Alter table nivel add head MEMO first")
Next
%>

</body>
</html>
