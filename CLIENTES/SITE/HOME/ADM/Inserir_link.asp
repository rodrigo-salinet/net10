<!-- #include file="../conexao.asp" -->
<!-- #include file="conexao_adm.asp" -->
<!-- #include file="validasenha.asp" -->

<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<SCRIPT LANGUAGE="JavaScript" src="crialink.js"></SCRIPT>
</script>

<script language="JavaScript">
<!--
function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);

function muda_inserir(valor)
{
	document.form1.inserir[valor].checked=true;
	altera_campos(valor)
}

function altera_campos(campo)
{
	
	if(campo==0)
	{
		window.open("inserir_grupo.asp?id_grupo=<%= Request.QueryString("id_grupo")%>&cliente=<%= cliente %>", "_self")
//		htm = '<font color="#000066" size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Item: </strong></font> <br> <input name="Grupo" type="text" id="Grupo" size="50"> ';
//		document.form1.enctype="text/plain";
//		document.form1.action = 'inserir_grupo2.asp?id_grupo=<%= Request.QueryString("id_grupo")%>&cliente=<%= cliente %>';
	}
	
	if(campo==1)
	{
		window.open("inserir_link.asp?id_grupo=<%= Request.QueryString("id_grupo")%>&cliente=<%= cliente %>", "_self")
//		document.form1.URL.value= 'http://';
	}
	
	if(campo==2)
	{
		window.open("inserir_arquivo.asp?id_grupo=<%= Request.QueryString("id_grupo")%>&cliente=<%= cliente %>", "_self")
	}
	
}

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
%><form name="form1" method="post" action="inserir_grupo2.asp?id_grupo=<%= Request.QueryString("id_grupo")%>&cliente=<%= cliente %>">
  
 <table height="205" border="1" align="center" cellspacing="0">
  <tr> 
      <td height="21" bordercolor="#000099" bgcolor="#000099"> <center>
          <font face="Verdana, Arial, Helvetica, sans-serif"><b><font color="#FFFFFF" size="2">INSERIR 
          </font></b></font> </center></td>
    </tr>
    <tr> 
      
   <td height="20" bordercolor="#CCCCCC" bgcolor="#CCCCCC">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td><a href="#" onClick="muda_inserir(0)"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"> 
              
	   <input name="inserir" type="radio" value="item">
              Inserir item&nbsp;&nbsp;</font></a></td>
            <td><a href="#" onClick="muda_inserir(1)"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"> 
              
	   <input name="inserir" type="radio" value="link" checked>
              Inserir link&nbsp;&nbsp;</font></a></td>
            <td><a href="#" onClick="muda_inserir(2)"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"> 
              <input type="radio" name="inserir" value="arquivo">
              Inserir arquivo&nbsp;&nbsp;</font></a></td>
          </tr>
        </table></td>
    </tr>
    <tr> 
      
   <td height="115" bordercolor="#999999" bgcolor="#CCCCCC">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	 <tr> 
	  <td><strong><font color="#000066" size="2" face="Verdana, Arial, Helvetica, sans-serif">Nome 
	   do Item:</font></strong> <br> <input name="Grupo" id="Grupo2" type="text" size="50"> 
	  </td>
	 </tr>
	 <tr> 
	  <td><strong><font size="2" face="Verdana, Arial, Helvetica, sans-serif"> 
	   <font color="#000066">P&aacute;gina:</font><br>
	   </font></strong> <input name="URL" type="text" id="URL" value="http://" size="50">
	   <select name="target" id="target">
		<option value="_self" selected>Abrir na mesma p&aacute;gina</option>
		<option value="_blank">Abrir em outra p&aacute;gina</option>
	   </select>
	   <table border="0" align="right" cellpadding="0" cellspacing="0">
		<tr align="center" valign="middle" bordercolor="lightgrey"> 
		 <td height="22" id="celula13"><img src="imagens/link.gif" alt="Adicionar link para outro item" name="button" width="22" height="22" id="celula" onClick="javascript:document.all.URL.value=janela_itens();"></td>
		</tr>
	   </table> </td>
	 </tr>
	 <tr>
	  <td nowrap><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><font color="#000066"><strong>Imagem 
	   do Bot&atilde;o:</strong></font> <font size="1">(caso seja omitido ser&aacute; 
	   mostrado o texto do item)</font></font></font> <br> <input name="imagem" type="text" id="imagem" value="http://" size="50" maxlength="255"></td>
	 </tr>
	</table>
	
   </td>
    </tr>
    <tr> 
      
   <td height="27" align="right" bordercolor="#999999" bgcolor="#CCCCCC">
<input type="submit" name="Submit" value="Inserir"> 
      </td>
    </tr>
    <tr> 
      
   <td height="20" bordercolor="#999999" bgcolor="#CCCCCC"><font face="Arial, Helvetica, sans-serif" size="2"><a href="Administrador.asp?cliente=<%= cliente %>" class="links"><b>Voltar</b></a></font></td>
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
