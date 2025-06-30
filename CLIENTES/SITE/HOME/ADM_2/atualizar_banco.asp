<%
on error resume next
CLIENTE= Request.QueryString("cliente")
Session("alterado") = true
caminho_dados = Session("cam_dados")
cam_dados = caminho_dados
Set FSO = Server.CreateObject("Scripting.FileSystemObject")
If Request.QueryString("Servidor") <> empty then Response.Cookies("Servidor") = Request.QueryString("Servidor")
If not fso.FileExists(caminho_dados) then Response.Cookies("Servidor") = "local"

whichFN = cam_dados & cliente & "\banco.mdb"

'REsponse.Write(whichFN)
If not fso.FileExists(whichFN) then
	Response.Write("<script>alert('Ocorreu um erro nesta página!');history.go(-1)</script>")
End if

Set Conexao_banco = CreateObject("ADODB.Connection")
Conexao_banco.open "DBQ=" & whichFN & ";Driver={Microsoft Access Driver (*.mdb)}"

call MudaCampos("NIVEL", "VISUALIZAR", "text(50)")



Sub MudaCampos(tabela, campo, tipo)
	Set rs = Conexao_banco.Execute("Select * From " & tabela)
	For i = 0 to rs.fields.count - 1
		if lcase(rs.fields(i).name) = lcase(campo) then existe_campo = true
	Next
	If existe_campo <> true then
		SQL_insert = "ALTER TABLE "&tabela&" ADD "&campo&" " & tipo & ""'"ALTER TABLE " & table & " ADD column " & campo & " " & tipo '"ALTER TABLE " & tabela & " ADD BOOLEAN " & campo & " "
		Conexao_banco.Execute(SQL_insert)
	End if
'	Response.Write("<script>alert('Campo " & campo & " adicionado na tabela " & tabela & ".')</script>")
End Sub

%>

<html>
<head>
<title>Atualizando o banco de dados</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body onLoad="javscript:window.location='Administrador.asp?cliente=<%= cliente %>&alterado=true'">

</body>
</html>
