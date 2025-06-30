<!-- #include file="../conexao.asp" -->
<!-- #include file="conexao_adm.asp" -->
<!-- #include file="validasenha.asp" -->
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<script language="JavaScript">
<!--
function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);

// -->
</script>
<style type="text/css">
<!--
a:link {
	text-decoration: none;
}
a:visited {
	text-decoration: none;
}
a:hover {
	text-decoration: none;
}
a:active {
	text-decoration: none;
}
-->
</style>
</head>

<body bgcolor="#3399CC" vlink="#0000FF" alink="#0066FF">
<%
If tc < 100 then
%>
<form name="form1" enctype="multipart/form-data" method="post" action="inserir_arquivo2.asp?id_grupo=<%= Request.QueryString("id_grupo")%>&cliente=<%= cliente %>">
  
 <table border="1" cellspacing="0" align="center">
  <tr> 
   <td height="21" bordercolor="#000099" bgcolor="#000099"> <center>
	 <font face="Verdana, Arial, Helvetica, sans-serif"><b><font color="#FFFFFF" size="2">INSERIR 
	 ARQUIVO</font></b></font> </center></td>
  </tr>
  <tr> 
   <td bgcolor="#CCCCCC" bordercolor="#999999"><strong><font color="#000066" size="2" face="Verdana, Arial, Helvetica, sans-serif">Nome 
	do item:</font></strong></td>
  </tr>
  <tr> 
   <td bgcolor="#CCCCCC" bordercolor="#999999"><font color="#000066"> 
	<input name="Grupo" type="text" id="Grupo" size="40">
	</font></td>
  </tr>
  <tr> 
   <td bgcolor="#CCCCCC" bordercolor="#999999"><strong><font color="#000066" size="2" face="Verdana, Arial, Helvetica, sans-serif">Arquivo:</font></strong></td>
  </tr>
  <tr> 
   <td bgcolor="#CCCCCC" bordercolor="#999999"><input name="Arquivo" type="file" size="50"> 
	&nbsp;&nbsp;</td>
  </tr>
  <tr>
   <td bordercolor="#999999" bgcolor="#CCCCCC"><strong><font color="#000066" size="2" face="Verdana, Arial, Helvetica, sans-serif">Abrir 
	em :</font></strong></td>
  </tr>
  <tr> 
   <td bordercolor="#999999" bgcolor="#CCCCCC"><select name="janela" id="janela">
	 <option value="_blank" selected>Em outra janela</option>
	 <option value="_self">Na mesma janela</option>
	</select></td>
  </tr>
  <tr> 
   <td align="right" bordercolor="#999999" bgcolor="#CCCCCC"><input type="submit" name="Submit" value="Inserir"> 
   </td>
  </tr>
  <tr> 
   <td bgcolor="#CCCCCC" bordercolor="#999999"><font face="Arial, Helvetica, sans-serif" size="2"><a href="Administrador.asp?cliente=<%= cliente %>" class="links"><b>Voltar</b></a></font></td>
  </tr>
 </table>
  </form>
  <%
  else
  %>
<font color="#FFFFFF" face="Verdana, Arial, Helvetica, sans-serif"><strong><%= msg_cheia %><br>
<a href="javascript:history.go(-1)"><font size="2">Clique aqui para voltar.</font></a></strong></font> 
<%
  End if
  %>
</body>
</html>
<!-- #include file="../fechaconexoes.asp" -->
