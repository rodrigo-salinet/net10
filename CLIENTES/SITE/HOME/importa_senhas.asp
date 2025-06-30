<html>
<head>
<title>Importando senhas</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<%
Set FSO = Server.CreateObject("Scripting.FileSystemObject")
on error resume next
Session.Timeout = 20

Set pasta = fso.GetFolder(Server.MapPath("../dados"))
For each spasta in pasta.SubFolders

	If not fso.FileExists(spasta.name & "\usuarios.mdb") then
		fso.copyfile server.MapPath("..\usuarios.mdb"), spasta & "\usuarios.mdb"
	End if
	
	arquivo2 = ""
	whichFN = ""
	arquivo = "dados/" & spasta.name & "/banco.mdb"
	caminho = ""
	
	if (FSO.FileExists(arquivo) <> true) then
		While NOT(FSO.FileExists(arquivo2))
			arquivo2 = Server.MapPath(caminho & arquivo)
			caminho = "../" & caminho
		Wend
		whichFN = arquivo2
	Else
		whichFN = arquivo
	End if
	
	Set Conexao_banco = CreateObject("ADODB.Connection")
	Conexao_banco.open "DBQ=" & whichFN & ";Driver={Microsoft Access Driver (*.mdb)}"
	
	cam2 = Fso.GetParentFolderName(whichFN) & "\usuarios.mdb"
	Response.Write("spasta: " & spasta & "<br>")
	REsponse.Write("cam2: " & cam2 & "<hr>")
'	Response.End()
	Set Conexao_adm = CreateObject("ADODB.Connection")
	Conexao_adm.open "DBQ=" & cam2 & ";Driver={Microsoft Access Driver (*.mdb)}"
	
	Set rs1 = Conexao_banco.Execute("Select * From usuario")
	Do while not rs1.EOF
		nome = rs1("nome")
		senha = rs1("senha")
		expira_em = "20/06/2003"
		geral = true
		str = "Insert into usuario (nome, senha, expira_em, geral) values('" & nome & "', '" & senha & "', '" & expira_em & "', " & geral & ")"

		Conexao_adm.Execute(str)
		rs1.movenext
	Loop
	If err.number>0 then
		Response.Write(err.Number & " - ERRO !<br>")
	End if
Next


%>
</body>
</html>
