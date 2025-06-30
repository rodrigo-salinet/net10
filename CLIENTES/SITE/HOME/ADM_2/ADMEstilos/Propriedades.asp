<%
tag = Request.QueryString("tag")
%>
<html>
<head>
<title>PROPRIEDADES</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<script>
function cria(tag)
{
	var prop = '';
	for(i in tag.style)
	{
		prop = prop + '<tr><td>' + i + '</td><td><input name="' + i + '" value="' + tag.style[i] + '"></td></tr>';
	}
	prop = '<table>' + prop + '</table>'
	document.write(prop)
}
</script>
</head>

<body onLoad="this//cria(<%= tag %>)">
<form name="form1" method="post" action="">
 <table border="0" cellspacing="0" cellpadding="0" id="tabela">
  <tr> 
   <td>Documento:</td>
   <td>&nbsp;</td>
  </tr>
  <tr> 
   <td>Fundo:</td>
   <td>&nbsp;</td>
  </tr>
  <tr> 
   <td>Cor:</td>
   <td><input type="text" name="textfield"></td>
  </tr>
  <tr> 
   <td>Imagem</td>
   <td><input type="text" name="textfield2"></td>
  </tr>
  <tr> 
   <td>Texto:</td>
   <td>&nbsp;</td>
  </tr>
  <tr> 
   <td>Fonte:</td>
   <td><select name="select">
	</select></td>
  </tr>
  <tr>
   <td>&nbsp;</td>
   <td>&nbsp;</td>
  </tr>
 </table>
</form>
</body>
</html>
