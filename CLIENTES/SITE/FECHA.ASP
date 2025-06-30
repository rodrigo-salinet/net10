<!-- #include file="home/conexao.asp" -->
<%
cam_online = Server.MapPath("home/clientes/" & Session("cliente") & "/online.txt")
Response.Write(cam_online & "*")
If fso.FileExists(cam_online) then
	Set cam_online1 = fso.OpenTextFile(cam_online)
	total_online = cint(cam_online1.readall)
	Set cam_online = fso.OpenTextFile(cam_online, 2)
else
	Set cam_online = fso.CreateTextFile(cam_online)
	total_online = 1
End if
cam_online.write(total_online - 1)
Session.Contents.RemoveAll()
Session.Abandon()

%>

<html>
<head>
<title>NET10</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body onLoad="javascript:window.close()">
<script>
window.close()
</script>
</body>
</html>
