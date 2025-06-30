<html>
<head>
<title>CLIENTES NET10</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<script>
if(window.opener!=undefined)
{
window.close()
}
</script>
</head>

<body>
Nenhum cliente definido, mostrando listagem:<br>
<%
'cam_dados = "C:\WINDOWS\Desktop\Net10\dados\"
If Session("cam_dados") = empty then Session("cam_dados") = "i:\inetpub\wwwroot\net10cbr\dados\"
'For each sessao in Session.Contents()
'Next
'Session.Contents.Remove()

Set fso = createObject("Scripting.FileSystemObject")
Set pasta = fso.GetFolder(Session("cam_dados"))
For Each spasta in pasta.SubFolders
	%><a href="../default.asp?cliente=<%= spasta.name %>"><%= spasta.name %></a><br>
	<%
Next
Session.Abandon()

%>
</body>
</html>
