<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<script>
img= window.dialogArguments;
function carrega(img)
{
	imagem.src = img;
	imagem.style.visibility = "visible";
	nome.size = img.length-9;
	nome.value = img;
}
</script>
</head>

<body onLoad="carrega(img)">
<img src="" name="imagem" id="imagem" align="middle" border="0" style="visibility: hidden" onClick="javascript:window.close()"> 
<br>
<input name="nome" id="nome" size="100">
</body>
</html>
