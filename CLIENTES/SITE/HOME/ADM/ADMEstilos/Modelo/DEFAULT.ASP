<%
arquivo = Request.QueryString("arquivo")
%><html>
<head>
<title>VISUALIZA&Ccedil;&Atilde;O DE ESTILO</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="../../../Clientes/<%= cliente %>/estilos/<%= Request.QueryString("subcam") %>/<%= arquivo %>.css" rel="stylesheet" type="text/css">
</head>

<body>
Texto simples 
<form>
 <input type="text" name="textfield">
 <select name="select">
 </select>
 <input type="submit" name="Submit" value="Enviar">
</form>
<table>
 <tr> 
  <td>C&eacute;lula 01</td>
  <td>C&eacute;lula 02</td>
 </tr>
 <tr> 
  <td>C&eacute;lula 03</td>
  <td>C&eacute;lula 04</td>
 </tr>
</table>
<p>Par&aacute;grafo</p>

 <font>Font</font> <a href="#">a</a> <B>b</B> <I>i</I> 
<blockquote>Blockquote</blockquote>
<ul>
 <li>Listagem</li>
 <li>Listagem</li>
 <li>Listagem</li>
</ul>
<ol>
 <li>Lista</li>
 <li>Lista</li>
 <li>Lista</li>
</ol>
<h1>h1</h1>
<h2>h2</h2>
<h3>h3</h3>
<h4>h4</h4>
<h5>h5</h5>
<h6>h6</h6>
</body>
</html>
