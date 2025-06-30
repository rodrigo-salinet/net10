<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<%
cliente = "rolandia"
If Request.QueryString("upload") = "sim" then
	Set objUpload = Server.CreateObject("Dundas.Upload.2")
	objUpload.UseUniqueNames = false
	objUpload.UseVirtualDir = true
	objUpload.Save "../../../dados/" & cliente & "/temp"
End if
%>
</head>

<body>
<form action="uploadsimples.asp?upload=sim" method="post" enctype="multipart/form-data" name="form1">
  <input type="file" name="file">
  <input type="submit" name="Submit" value="Enviar">
</form>
</body>
</html>
