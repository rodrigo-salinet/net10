<!-- #include file="../../conexao.asp" -->
<!-- #include file="../conexao_adm.asp" -->

<!-- #include file="../../CONEXAO_ULTIMAS.asp" -->

<!-- #include file="../validasenha.asp" -->
<%
Caminho_ultimas = fso.GetParentFolderName(whichfn) & "\ultimas.mdb"
Set conexao_ultimas = CreateObject("ADODB.Connection")
Conexao_ultimas.open "DBQ=" & Caminho_ultimas & ";Driver={Microsoft Access Driver (*.mdb)}"
Set rs = Conexao_ultimas.Execute("Select * From Config")
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


function carrega()
{
muda_tabela('tabela1', document.all.bgcolor.value)
muda_tabela('tabela2', document.all.hlcolor.value)
muda_tabela('tabela3', document.all.textcolor.value)
muda_tabela('tabela4', document.all.cor_borda.value)
muda_tabela('tabela5', document.all.cor_fundo.value)
}


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

<body bgcolor="#3399CC"  vlink="#0000FF" alink="#0066FF" onLoad="carrega()">
<table height="100%" border="1" align="center" cellspacing="0">
 <tr> 
  <td align="center" bordercolor="#999999" bgcolor="#000099"><strong><font color="#FFFFFF" face="Verdana, Arial, Helvetica, sans-serif">Alterar</font></strong></tr>
 <tr> 
  <td align="center" bordercolor="#999999" bgcolor="#CCCCCC"> 
  <form name="form1" id="form1" method="post" action="Configuracoes2.asp?id_config=<%= rs("id_config") %>&cliente=<%= cliente %>">
	<table border="0" cellpadding="0" cellspacing="0" class="tabela">
	 <tr> 
	  <td rowspan="5" valign="top"> <IFRAME allowTransparency align=center marginWidth=0 marginHeight=0 src="<%= endereco_virtual %>ultimas.asp?cliente=<%= cliente %>" frameBorder=0 width=160 height=100% scrolling="no" id="ult" name="ult"></IFRAME></td>
	  <td rowspan="26">&nbsp;&nbsp;&nbsp;</td>
	  <td> <table border="0" cellspacing="0" cellpadding="0">
		<tr valign="top"> 
		 <td colspan="2" nowrap><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Cor 
		  de fundo:</strong></font></td>
		</tr>
		<tr valign="top"> 
		 <td width="48" nowrap><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong> 
		  <input name="bgcolor" id="bgcolor" size="8" onChange="muda_tabela('tabela1', this.value)" value="<%= cores(rs("bgcolor")) %>">
		  &nbsp;</strong></font></td>
		 <td width="102" nowrap><table width="15" height="15" border="1" cellpadding="0" cellspacing="0" onClick="muda_fundo(this.bgColor, this.id,'bgcolor')" class="CLICAVEL" id="tabela1">
		   <tr> 
			<td><font size="1">&nbsp;</font></td>
		   </tr>
		  </table></td>
		</tr>
	   </table></td>
	 </tr>
	 <tr> 
	  <td>Alinhamento:</td>
	 </tr>
	 <tr> 
	  <td> <select name="halign" id="halign">
		<option value="Left" selected>Esquerda</option>
		<option value="Right">Direita</option>
		<option value="Center">Centralizado</option>
	   </select></td>
	 </tr>
	 <tr> 
	  <td>Margem:</td>
	 </tr>
	 <tr> 
	  <td> <input name="lrmargin" type="text" id="lrmargin" size="3" value="<%= rs("lrmargin") %>"></td>
	 </tr>
	 <tr> 
	  <td valign="top">&nbsp;</td>
	  <td> <table border="0" cellspacing="0" cellpadding="0">
		<tr valign="top"> 
		 <td colspan="2" nowrap><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Cor 
		  do link:</strong></font></td>
		</tr>
		<tr valign="top"> 
		 <td width="44" nowrap><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong> 
		  <input name="hlcolor" id="hlcolor" size="8" onChange="muda_tabela('tabela2', this.value)" value="<%= cores(rs("hlcolor")) %>">
		  </strong></font></td>
		 <td width="37" nowrap><table width="15" height="15" border="1" cellpadding="0" cellspacing="0" onClick="muda_fundo(this.bgColor, this.id,'hlcolor')" class="CLICAVEL" id="tabela2">
		   <tr> 
			<td><font size="1">&nbsp;</font></td>
		   </tr>
		  </table></td>
		</tr>
	   </table></td>
	 </tr>
	 <tr> 
	  <td valign="top">&nbsp;</td>
	  <td>Tempo de atraso:</td>
	 </tr>
	 <tr> 
	  <td valign="top">&nbsp;</td>
	  <td> <input name="delay" type="text" id="delay" size="4" value="<%= rs("delay")%>"></td>
	 </tr>
	 <tr> 
	  <td valign="top">&nbsp;</td>
	  <td>Tempo de rota&ccedil;&atilde;o:</td>
	 </tr>
	 <tr> 
	  <td valign="top">&nbsp;</td>
	  <td> <input name="scrolldelay" type="text" id="scrolldelay" value="<%= rs("scrolldelay") %>" size="4"></td>
	 </tr>
	 <tr> 
	  <td valign="top">&nbsp;</td>
	  <td>Abre links em:</td>
	 </tr>
	 <tr> 
	  <td valign="top">&nbsp;</td>
	  <td><select name="loadwhere" id="loadwhere">
		<option value="_parent"<% IF rs("loadwhere") = "_parent" then %> selected<% End if %>>Pr&oacute;pria 
		p&aacute;gina</option>
		<option value="_blank"<% IF rs("loadwhere") = "_blank" then %> selected<% End if %>>Outra 
		p&aacute;gina</option>
		<option value="mainFrame"<% IF rs("loadwhere") = "mainFrame" then %> selected<% End if %>>P&aacute;gina
		principal</option>
	   </select></td>
	 </tr>
	 <tr> 
	  <td valign="top">&nbsp;</td>
	  <td>Total de t&oacute;picos:</td>
	 </tr>
	 <tr> 
	  <td valign="top">&nbsp;</td>
	  <td> <input name="total" type="text" id="total" size="3" value="<%= rs("total") %>"></td>
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
	   <input name="font" type="text" id="font" size="3" maxlength="3" value="<%= replace(fonte(2), ",", "") %>">
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
		<tr valign="top"> 
		 <td colspan="2" nowrap><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Cor 
		  do texto:</strong></font> </td>
		</tr>
		<tr valign="top"> 
		 <td width="44" nowrap><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong> 
		  <input name="textcolor" id="textcolor3" size="8" onChange="muda_tabela('tabela3', this.value)" value="<%= cores(rs("textcolor")) %>">
		  </strong></font></td>
		 <td width="57" nowrap><table width="15" height="15" border="1" cellpadding="0" cellspacing="0" onClick="muda_fundo(this.bgColor, this.id,'textcolor')" class="CLICAVEL" id="tabela3">
		   <tr> 
			<td><font size="1">&nbsp;</font></td>
		   </tr>
		  </table></td>
		</tr>
	   </table>
	   <font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong> </strong></font></td>
	 </tr>
	 <tr> 
	  <td valign="top">&nbsp;</td>
	  <td>&nbsp;</td>
	 </tr>
	 <tr> 
	  <td valign="top">&nbsp;</td>
	  <td rowspan="6" bgcolor="#000099"><table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#333333">
		<tr class="tabela"> 
		 <td bgcolor="#000099"><font color="#FFFFFF">T&iacute;tulo:</font></td>
		</tr>
		<tr class="tabela"> 
		 <td bordercolor="#CCCCCC" bgcolor="#CCCCCC"> 
		  <textarea name="titulo" rows="3" id="titulo"><%= rs("titulo") %></textarea></td>
		</tr>
		<tr class="tabela"> 
		 <td bordercolor="#CCCCCC" bgcolor="#CCCCCC">Cor da borda:</td>
		</tr>
		<tr class="tabela"> 
		 <td bordercolor="#CCCCCC" bgcolor="#CCCCCC"> 
		  <table border="0" cellspacing="0" cellpadding="0">
		   <tr valign="top"> 
			<td width="44" nowrap><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong> 
			 <input name="cor_borda" id="cor_borda" size="8" onChange="muda_tabela('tabela4', this.value)" value="<%= cores(rs("cor_borda")) %>">
			 </strong></font></td>
			<td width="57" nowrap><table width="15" height="15" border="1" cellpadding="0" cellspacing="0" onClick="muda_fundo(this.bgColor, this.id,'cor_borda')" class="CLICAVEL" id="tabela4">
			  <tr> 
			   <td><font size="1">&nbsp;</font></td>
			  </tr>
			 </table></td>
		   </tr>
		  </table></td>
		</tr>
		<tr class="tabela"> 
		 <td bordercolor="#CCCCCC" bgcolor="#CCCCCC">Cor do fundo:</td>
		</tr>
		<tr class="tabela"> 
		 <td bordercolor="#CCCCCC" bgcolor="#CCCCCC"> 
		  <table border="0" cellspacing="0" cellpadding="0">
		   <tr valign="top"> 
			<td width="44" nowrap><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong> 
			 <input name="cor_fundo" id="cor_fundo" size="8" onChange="muda_tabela('tabela5', this.value)" value="<%= cores(rs("cor_fundo")) %>">
			 </strong></font></td>
			<td width="57" nowrap><table width="15" height="15" border="1" cellpadding="0" cellspacing="0" onClick="muda_fundo(this.bgColor, this.id,'cor_fundo')" class="CLICAVEL" id="tabela5">
			  <tr> 
			   <td><font size="1">&nbsp;</font></td>
			  </tr>
			 </table></td>
		   </tr>
		  </table></td>
		</tr>
		<tr> 
		 <td bordercolor="#CCCCCC" bgcolor="#CCCCCC">&nbsp;</td>
		</tr>
	   </table></td>
	 </tr>
	 <tr> 
	  <td valign="top">&nbsp;</td>
	 </tr>
	 <tr> 
	  <td valign="top">&nbsp;</td>
	 </tr>
	 <tr> 
	  <td valign="top">&nbsp;</td>
	 </tr>
	 <tr> 
	  <td valign="top">&nbsp;</td>
	 </tr>
	 <tr> 
	  <td valign="top">&nbsp;</td>
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
  <td bgcolor="#CCCCCC"><font face="Arial, Helvetica, sans-serif"><b><font size="2"><a href="Default.asp">Voltar</a></font></b></font></td>
 </tr>
</table>

</body>
</html><!-- #include file="../../fechaconexoes.asp" -->
