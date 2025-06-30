<!-- #include file="../../conexao.asp" -->
<!-- #include file="../conexao_adm.asp" -->

<!-- #include file="../../CONEXAO_ULTIMAS.asp" -->

<!-- #include file="../validasenha.asp" -->
<%
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


//This variable needs to have global scope for the callColorDlg function to persist the chosen color
var sInitColor = null;
function callColorDlg(sInitColor){
	//if sInitColor is null, the color dialog box has not yet been called
	if (sInitColor == null) 
		var sColor = dlgHelper.ChooseColorDlg();
	else
		//call the dialog box and initialize the color to the color previously chosen
		var sColor = dlgHelper.ChooseColorDlg(sInitColor);
	//change the return value from a decimal value to a hex value and make sure the value has 6
	//digits to represent the RRGGBB schema required by the color table
	sColor = sColor.toString(16);
	if (sColor.length < 6) {
		var sTempString = "000000".substring(0,6-sColor.length);
		sColor = sTempString.concat(sColor);
	}
	document.execCommand("ForeColor", false, sColor);
	
	//set the initialization color to the color chosen
	sInitColor = sColor;
	return sInitColor;
	
}

function cor(campo, tabela){
	novacor = callColorDlg(document.all[campo].value);
	document.all[campo].value = '#' + novacor;
	document.all[tabela].bgColor = '#' + novacor;
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

<body bgcolor="#3399CC"  vlink="#0000FF" alink="#0066FF">
<table height="100%" border="1" align="center" cellspacing="0">
 <tr> 
  <td align="center" bordercolor="#999999" bgcolor="#000099"><strong><font color="#FFFFFF" face="Verdana, Arial, Helvetica, sans-serif">Alterar</font></strong></tr>
 <tr> 
  <td align="center" bordercolor="#999999" bgcolor="#CCCCCC"> 
  <form name="form1" id="form1" method="post" action="Configuracoes2.asp?id_config=<%= rs("id_config") %>&cliente=<%= cliente %>">
	<table border="0" cellpadding="0" cellspacing="0" class="tabela">
	 <tr> 
	  <td rowspan="17" valign="top"> <IFRAME allowTransparency align=center marginWidth=0 marginHeight=0 src="<%= endereco_virtual %>ultimas.asp?cliente=<%= cliente %>" frameBorder=0 width=160 height=100% scrolling="no" id="ult" name="ult"></IFRAME></td>
	  <td rowspan="33">&nbsp;&nbsp;&nbsp;</td>
	  <td> 
	   <table border="0" cellspacing="0" cellpadding="0">
		<tr valign="top"> 
		 <td width="105"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Cor 
		  do fundo:<br>
		  </strong></font> <table bgcolor="<%= rs("bgcolor") %>" onClick="cor('bgcolor', this.id)" id="cor_fundo_principal" width="15" height="15" border="1" align="right" cellpadding="0" cellspacing="0" unselectable="on">
		   <tr> 
			<td></td>
		   </tr>
		  </table>
		  <input name="bgcolor" id="bgcolor" size="8" onChange="muda_tabela('cor_fundo_principal', this.value)" value="<%= rs("bgcolor") %>"> 
		 </td>
		</tr>
	   </table></td>
	 </tr>
	 <tr> 
	  <td>&nbsp;</td>
	 </tr>
	 <tr> 
	  <td> <table border="0" cellspacing="0" cellpadding="0">
		<tr valign="top"> 
		 <td width="105"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Cor 
		  do texto:<br>
		  </strong></font> <table bgcolor="<%= rs("textcolor") %>" onClick="cor('textcolor', this.id)" id="cor_texto" width="15" height="15" border="1" align="right" cellpadding="0" cellspacing="0" unselectable="on">
		   <tr> 
			<td></td>
		   </tr>
		  </table>
		  <input name="textcolor" id="textcolor5" size="8" onChange="muda_tabela('cor_texto', this.value)" value="<%= rs("textcolor") %>"> 
		 </td>
		</tr>
	   </table></td>
	 </tr>
	 <tr> 
	  <td>&nbsp;</td>
	 </tr>
	 <tr> 
	  <td>Fonte:</td>
	 </tr>
	 <tr> 
	  <td> <%
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
	  <td>&nbsp;</td>
	 </tr>
	 <tr> 
	  <td> <table border="0" cellspacing="0" cellpadding="0">
		<tr valign="top"> 
		 <td width="105"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Cor 
		  do link:<br>
		  </strong></font> <table bgcolor="<%= rs("hlcolor") %>" onClick="cor('hlcolor', this.id)" id="cor_link" width="15" height="15" border="1" align="right" cellpadding="0" cellspacing="0" unselectable="on">
		   <tr> 
			<td></td>
		   </tr>
		  </table>
		  <input name="hlcolor" id="hlcolor3" size="8" onChange="muda_tabela('cor_link', this.value)" value="<%= rs("hlcolor") %>"></td>
		</tr>
	   </table></td>
	 </tr>
	 <tr> 
	  <td>&nbsp;</td>
	 </tr>
	 <tr> 
	  <td>Abre links em:</td>
	 </tr>
	 <tr> 
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
	  <td>&nbsp;</td>
	 </tr>
	 <tr> 
	  <td>Alinhamento do texto:</td>
	 </tr>
	 <tr> 
	  <td> <select name="halign" id="halign">
		<option value="Left" selected>Esquerda</option>
		<option value="Right">Direita</option>
		<option value="Center">Centralizado</option>
	   </select></td>
	 </tr>
	 <tr> 
	  <td>&nbsp;</td>
	 </tr>
	 <tr> 
	  <td>Margem do texto:</td>
	 </tr>
	 <tr> 
	  <td> <input name="lrmargin" type="text" id="lrmargin" size="3" value="<%= rs("lrmargin") %>"></td>
	 </tr>
	 <tr> 
	  <td valign="top">&nbsp;</td>
	  <td>&nbsp;</td>
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
	  <td>&nbsp;</td>
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
	  <td>&nbsp;</td>
	 </tr>
	 <tr> 
	  <td valign="top">&nbsp;</td>
	  <td rowspan="6" bgcolor="#000099"><table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#333333">
		<tr class="tabela"> 
		 <td bgcolor="#000099"><font color="#FFFFFF">T&iacute;tulo:</font></td>
		</tr>
		<tr class="tabela"> 
		 <td bordercolor="#CCCCCC" bgcolor="#CCCCCC"> <textarea name="titulo" rows="3" id="titulo"><%= rs("titulo") %></textarea></td>
		</tr>
		<tr class="tabela"> 
		 <td bordercolor="#CCCCCC" bgcolor="#CCCCCC">&nbsp;</td>
		</tr>
		<tr class="tabela"> 
		 <td bordercolor="#CCCCCC" bgcolor="#CCCCCC"> <table border="0" cellspacing="0" cellpadding="0">
		   <tr valign="top"> 
			<td width="105"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Cor 
			 da borda<br>
			 do t&iacute;tulo:&nbsp; <br>
			 </strong></font> <table bgcolor="<%= rs("cor_borda") %>" onClick="cor('cor_borda', 'borda_titulo')" id="borda_titulo" width="15" height="15" border="1" align="right" cellpadding="0" cellspacing="0" unselectable="on">
			  <tr> 
			   <td></td>
			  </tr>
			 </table>
			 <input name="cor_borda" id="cor_borda" size="8" onChange="muda_tabela('borda_titulo', this.value)" value="<%= rs("cor_borda") %>"></td>
		   </tr>
		  </table></td>
		</tr>
		<tr class="tabela"> 
		 <td bordercolor="#CCCCCC" bgcolor="#CCCCCC"><table border="0" cellspacing="0" cellpadding="0">
		   <tr valign="top"> 
			<td width="105"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Cor 
			 da fundo<br>
			 do t&iacute;tulo:&nbsp; <br>
			 </strong></font> <table bgcolor="<%= rs("cor_fundo") %>" onClick="cor('cor_fundo', 'fundo_titulo')" id="fundo_titulo" width="15" height="15" border="1" align="right" cellpadding="0" cellspacing="0" unselectable="on">
			  <tr> 
			   <td></td>
			  </tr>
			 </table>
			 <input name="cor_fundo" id="cor_fundo2" size="8" onChange="muda_tabela('fundo_titulo', this.value)" value="<%= rs("cor_fundo") %>"></td>
		   </tr>
		  </table></td>
		</tr>
		<tr class="tabela"> 
		 <td bordercolor="#CCCCCC" bgcolor="#CCCCCC">&nbsp; </td>
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
  <td bgcolor="#CCCCCC"><font face="Arial, Helvetica, sans-serif"><b><font size="2"><a href="Default.asp?cliente=<%= cliente %>">Voltar</a></font></b></font></td>
 </tr>
</table>

<OBJECT id=dlgHelper CLASSID="clsid:3050f819-98b5-11cf-bb82-00aa00bdce0b" width="0px" height="0px">
 </OBJECT>


</body>
</html><!-- #include file="../../fechaconexoes.asp" -->
