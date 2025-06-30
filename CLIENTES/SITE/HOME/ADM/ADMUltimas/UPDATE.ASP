<!-- #include file="../../conexao.asp" -->
<!-- #include file="../conexao_adm.asp" -->
<!-- #include file="../../CONEXAO_ULTIMAS.asp" -->
<!-- #include file="../validasenha.asp" -->
<%
ID = Request.QueryString("id")
Set rs = Conexao_ultimas.Execute("Select * From Ultimas where id_ultimas=" & id)
textcolor = cores(rs("textcolor"))
%>
<html>
<head>
<title>Administrador <%= ucase(cliente) %></title>
<meta http-equiv="Content-Type" content="text/html; chRset=iso-8859-1">
<script language="JavaScript">
<!--
function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(pRseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);


function valida(valor)
{
}
function ver(nome)
{
	alert(nome + "!!")
	for(a in nome)
	{
		document.write(a + ": " + nome[a] + "<br>")
	}

}



function janelacores(){
	janelacor = window.showModalDialog('../cores.htm','','dialogWidth:400px;dialogHeight:400px;center:yes;help:no;resizable:yes;status:no;scroll:no');
	return janelacor['col'];
}

function muda_fundo(inicial, id, tagin)
{
	
	var cor = '#'+janelacores();
	document.all[id].bgColor=cor;
	document.all[tagin].value=cor;
	
}



function muda_tabela(id, cor)
{
	document.all[id].bgColor=cor;
}



// -->
</script>
<link href="../../../css/pag.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.posicao {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: xx-small;
	font-weight: bold;
	color: #000066;
	background-color: #f0f0f0;
}
.tabela {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: x-small;
	font-weight: bold;
}
-->
</style>
<link href="../../../css/estilo.css" rel="stylesheet" type="text/css">
</head>

<body bgcolor="#3399CC"  vlink="#0000FF" alink="#0066FF" onLoad="muda_tabela('tabela1', '<%= textcolor %>')">
<table height="100%" border="1" align="center" cellspacing="0">
 <tr> 
  <td align="center" bordercolor="#999999" bgcolor="#000099"><strong><font color="#FFFFFF" face="Verdana, Arial, Helvetica, sans-serif">Alterar</font></strong></tr>
 <tr> 
  <td align="center" bordercolor="#999999" bgcolor="#CCCCCC"> 
  <form name="form1" id="form1" method="post" action="update2.asp?id_ultimas=<%= rs("id_ultimas") %>&cliente=<%= cliente %>">
	<table border="0" cellpadding="0" cellspacing="0" class="tabela">
	 <tr> 
	  <td rowspan="7" valign="top"> <IFRAME allowTransparency align=center marginWidth=0 marginHeight=0 src="<%= endereco_virtual %>ultimas.asp?cliente=<%= cliente %>" frameBorder=0 width=160 height=100% scrolling="no" id="ult" name="ult"></IFRAME></td>
	  <td rowspan="17">&nbsp;&nbsp;&nbsp;</td>
	  <td>Texto: 
	   <input name="data" type="hidden" id="data" value="<%= rs("data") %>"></td>
	 </tr>
	 <tr> 
	  <td><input name="desc" type="text" id="desc" size="40" value="<%= rs("desc") %>" onChange="form1.submit()"></td>
	 </tr>
	 <tr> 
	  <td>Link:</td>
	 </tr>
	 <tr> 
	  <td><input name="desturl" type="text" id="desturl" size="40" value="<%= rs("desturl") %>"></td>
	 </tr>
	 <tr> 
	  <td>Abre o link em:</td>
	 </tr>
	 <tr> 
	  <td> <select name="loadwhere" id="loadwhere">
		<option value="<%If cliente = "rolandia" then %>mainFrame<%Else%>_parent<%End if%>"<% IF rs("loadwhere") = "_parent" then %> selected<% End if %>>Pr&oacute;pria 
		p&aacute;gina</option>
		<option value="_blank"<% IF rs("loadwhere") = "_blank" then %> selected<% End if %>>Outra 
		p&aacute;gina</option>
		<option value="mainFrame"<% IF rs("loadwhere") = "mainFrame" then %> selected<% End if %>>P&aacute;gina
		principal</option>
	   </select> </td>
	 </tr>
	 <tr> 
	  <td>&nbsp;</td>
	 </tr>
	 <tr> 
	  <td valign="top">&nbsp;</td>
	  <td>Fonte:</td>
	 </tr>
	 <tr> 
	  <td valign="top">&nbsp;</td>
	  <td><%
			fonte = rs("font")
			fonte = split(fonte)
			%> <font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong> 
	   <select name="font" id="font">
		<option value="Arial"<% IF replace(fonte(0), ",", "")="Arial" then %> selected<% End if %>>Arial</option>
		<option value="Helvetica"<% IF replace(fonte(0), ",", "")="Helvetica" then %> selected<% End if %>>Helvetica</option>
		<option value="Verdana"<% IF replace(fonte(0), ",", "")="Verdana" then %> selected<% End if %>>Verdana</option>
		<option value="Courier"<% IF replace(fonte(0), ",", "Courier")="" then %> selected<% End if %>>Courier</option>
		<option value="System"<% IF replace(fonte(0), ",", "")="System" then %> selected<% End if %>>System</option>
	   </select>
	   <br>
	   <input name="font" type="radio" value="plain"<% IF replace(fonte(1), ",", "")="plain" or replace(fonte(1), ",", "")="" then %> checked<% End if %>>
	   Normal 
	   <input type="radio" name="font" value="bold"<% IF replace(fonte(1), ",", "")="bold" then %> checked<% End if %>>
	   Negrito <br>
	   Tamanho: 
	   <input name="font" type="text" id="font" size="3" maxlength="3" value="<% if len(replace(fonte(2), ",", ""))>1 then%><%= replace(fonte(2), ",", "") %><%Else%> <%End if%>">
	   <font size="1"><em>px </em></font></strong></font></td>
	 </tr>
	 <tr> 
	  <td valign="top">&nbsp;</td>
	  <td>&nbsp;</td>
	 </tr>
	 <tr> 
	  <td valign="top">&nbsp;</td>
	  <td> <font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong> 
	   </strong></font> <table border="0" cellspacing="0" cellpadding="0">
		<tr valign="top" id="cor_fundo"> 
		 <td colspan="2" nowrap><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Cor 
		  do texto:</strong></font> </td>
		</tr>
		<tr valign="top" id="cor_fundo"> 
		 <td width="44" nowrap><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong> 
		  <input name="textcolor" id="textcolor3" size="8" onChange="muda_tabela('tabela1', this.value)" value="<%= textcolor %>">
		  </strong></font></td>
		 <td width="57" nowrap><table width="15" height="15" border="1" cellpadding="0" cellspacing="0" onClick="muda_fundo(this.bgColor, this.id,'textcolor')" class="CLICAVEL" id="tabela1">
		   <tr> 
			<td><font size="1">&nbsp;</font></td>
		   </tr>
		  </table></td>
		</tr>
	   </table></td>
	 </tr>
	 <tr> 
	  <td valign="top">&nbsp;</td>
	  <td>&nbsp;</td>
	 </tr>
	 <tr> 
	  <td valign="top">&nbsp;</td>
	  <td rowspan="3">Tempo de pausa:</td>
	 </tr>
	 <tr> 
	  <td valign="top">&nbsp;</td>
	 </tr>
	 <tr> 
	  <td valign="top">&nbsp;</td>
	 </tr>
	 <tr> 
	  <td valign="top">&nbsp;</td>
	  <td><input name="delay" type="text" id="delay" size="4" value="<%= rs("delay") %>"> 
	   <font size="1"><em>milisegundos</em></font></td>
	 </tr>
	 <tr> 
	  <td valign="top">&nbsp;</td>
	  <td align="right"> <input type="submit" name="Submit" value="Alterar &gt;&gt;"> 
	  </td>
	 </tr>
	</table>
   </form></tr>
 <tr> 
  <td bordercolor="#CCCCCC" bgcolor="#CCCCCC">&nbsp;</td>
 </tr>
 <tr> 
    <td bgcolor="#CCCCCC"><font face="Arial, Helvetica, sans-serif"><b><font size="2"><a href="Default.asp?cliente=<%= cliente %>">Voltar</a></font></b></font></td>
 </tr>
</table>

</body>
</html><!-- #include file="../../fechaconexoes.asp" -->
