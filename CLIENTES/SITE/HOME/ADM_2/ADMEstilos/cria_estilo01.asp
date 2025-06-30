<!-- #include file="../../conexao.asp" -->
<!-- #include file="../conexao_adm.asp" -->
<!-- #include file="../validasenha.asp" -->
<%
arquivo = Request.QueryString("arquivo")

caminho_css = caminho_cliente & "/estilos/" & arquivo & ".css"
if not fso.fileExists(caminho_css) then fso.CreateTextFile(caminho_css)

Set arquivo_css = fso.OpenTExtFile(caminho_css)
css = arquivo_css.readall
str = css

Function busca(texto, inicio, fim)
	posicao1 = instr(texto, inicio)
	If posicao1>0 then
		texto2 = mid(texto, posicao1, len(texto))
		posicao2 = instr(texto2, fim)
		busca = mid(texto2, len(inicio)+1, posicao2-(len(inicio)+len(fim)))
	End if
	posicao1 = 0
	posicao2 = 0
End function


Function valor_campo(texto, tag, campo)
	tag = trim(busca(texto, tag & "{", "}"))
	valor_campo = trim(busca(tag, campo & ":", ";"))
End function


'on error resume next
%><html>
<head>
<script>
var cliente = "<%= cliente %>"
</script>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<script language="JavaScript" src="funcoes_estilo.js" type="text/javascript">
</script>
<style type="text/css">
<!--
.detalhes {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: xx-small;
	color: #000000;
}
-->
</style>
<style type="text/css">
<!--
td {
	white-space: nowrap;
}
-->
</style>
<link href="../../../css/estilo.css" rel="stylesheet" type="text/css">
</head>

<body bgcolor="#3399CC" text="#000000" link="#0000CC"  vlink="#0000FF" alink="#0066FF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onLoad="carrega('')">
<form action="cria_estilo02.asp?arquivo=<%= arquivo %>&sobre=&cliente=<%= cliente %>" method="post" name="form1" target="_self">
 <table width="500" border="1" align="center" cellspacing="0">
  <tr> 
   <td height="20" colspan="2" bordercolor="#000099" bgcolor="#000099"><a href="../Administrador.asp?cliente=<%= cliente %>"><font color="#FFFFFF" size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Voltar</strong></font></a></td>
  </tr>
  <tr> 
   <td height="16" colspan="2" bordercolor="#000099" bgcolor="#000099"> <center>
	 <font face="Verdana, Arial, Helvetica, sans-serif"><b><font color="#FFFFFF" size="1"> 
	 ADMINISTRADOR</font></b></font> </center></td>
  </tr>
  <%
  If Request.QueryString("msg") <> empty then
  %>
  <tr> 
   <td height="20" colspan="2" align="center" bordercolor="#999999" bgcolor="#CCCCCC"><em><strong><font color="#333333" size="2" face="Arial, Helvetica, sans-serif"><%= Request.QuerySTring("msg") %></font></strong></em></td>
  </tr>
  <%
  End if
  %>
  <tr valign="top">
   <td width="84" rowspan="3" bordercolor="#999999" bgcolor="#CCCCCC"><font color="#990000" size="1" face="Verdana, Arial, Helvetica, sans-serif"><strong>VISUALIZA&Ccedil;&Atilde;O:</strong></font><br> 
	<IFRAME allowTransparency  id=lateral align=center marginWidth=0 marginHeight=0 src="modelo/default.asp?cliente=<%= cliente %>&clicavel=false&arquivo=<%= arquivo %>" frameBorder="0" width="200" height="100%"></IFRAME> 
	&nbsp; </td>
   <td width="223" height="66" align="center" nowrap bordercolor="#CCCCCC" bgcolor="#CCCCCC"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"> 
	<input type="button" name="Submit23" value="Pr&eacute;-Visualiza&ccedil;&atilde;o *" onClick="visualiza()">
	<br>
	<font size="1">(* nada ser&aacute; gravado no banco de dados)</font><br>
	<input type="submit" name="Submit3" value="Atualizar">
	<input name="Submit222" value="Cancelar" type="reset">
	</font></td>
  </tr>
  <tr valign="top"> 
   <td height="301" nowrap bordercolor="#CCCCCC" bgcolor="#CCCCCC">
<table width="100%" border="1" cellspacing="0" cellpadding="0">
	 <tr valign="top"> 
	  <td width="100%" height="20" nowrap bordercolor="#CCCCCC" bgcolor="#FFFFFF"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong><font color="#000099">Fundo 
	   principal:</font></strong> </font> <font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong></strong></font></td>
	 </tr>
	 <tr> 
	  <td bordercolor="#CCCCCC"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong><br>
	   </strong></font> <table border="0" cellspacing="0" cellpadding="0">
		<tr valign="top" id="cor_fundo"> 
		 <td><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Cor 
		  de fundo:&nbsp; <br>
		  </strong></font> <table onClick="cor('body_background-color', '')" id="tabela_body_background-color" width="15" height="15" border="1" align="right" cellpadding="0" cellspacing="0" unselectable="on">
		   <tr> 
			<td></td>
		   </tr>
		  </table>
		  <input name="body_background-color" id="body_background-color" size="8" onChange="muda_tabela('tabela_body_background-color', this.value)" value="<%= valor_campo(str, "body", "background-color") %>"></td>
		</tr>
		<tr> 
		 <td><font size="2" face="Verdana, Arial, Helvetica, sans-serif"> 
		  <input name="checkbox" type="checkbox" onClick="if(this.checked==true){arg='sim'}else{arg='nao'}esconde('cor_fundo', arg);"<% If lcase(valor_campo(str, "body", "background-color")) = "transparent" then Response.Write(" checked")%>>
		  Herdar</font></td>
		</tr>
	   </table>
	   <br> <hr noshade> <font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Imagem 
	   de Fundo:<img src="../imagens/imgbd.gif" alt="Escolher imagem do banco de dados" width="22" height="22" align="right" onClick="carrega_img('body_background-image')"><br>
	   </strong> <strong> 
	   <input name="body_background-image" type="text" id="body_background-image2" value="<%= replace(replace(valor_campo(str, "body", "background-image") , "url(", ""), ")", "") %>" size="30">
	   <br>
	   </strong></font> <font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong> 
	   </strong><strong><br>
	   <input name="body_background-attachment" type="checkbox" id="body_background-attachment2" value="fixed" checked>
	   </strong>Fixa<strong> <br>
	   Repetir: <br>
	   </strong> 
	   <input name="body_background-repeat" type="radio" value="no-repeat"<% if valor_campo(str, "body", "background-repeat")="no-repeat" or valor_campo(str, "body", "background-repeat")="" then Response.Write(" checked")%>>
	   N&atilde;o repetir <br>
	   <input name="body_background-repeat" type="radio" value="repeat"<% if valor_campo(str, "body", "background-repeat")="repeat" then Response.Write(" checked")%>>
	   Repetir <br>
	   <input type="radio" name="body_background-repeat" value="repeat-x"<% if valor_campo(str, "body", "background-repeat")="repeat-x" then Response.Write(" checked")%>>
	   Repetir X<br>
	   <input type="radio" name="body_background-repeat" value="repeat-y"<% if valor_campo(str, "body", "background-repeat")="repeat-y" then Response.Write(" checked")%>>
	   Repetir Y<br>
	   <strong> </strong><strong> 
	   <input name="body_background-position" type="hidden" id="body_background-position" value="left top">
	   </strong></font></td>
	 </tr>
	</table>
	<hr noshade> <font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong> 
	</strong></font></td>
  </tr>
  <tr valign="top"> 
   <td height="431" nowrap bordercolor="#CCCCCC" bgcolor="#CCCCCC"> <font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong> 
	</strong></font> <table width="100%" border="1" cellspacing="0" cellpadding="0">
	 <tr valign="top"> 
	  <td height="20" nowrap bordercolor="#CCCCCC" bgcolor="#FFFFFF"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong><font color="#000099">Bot&otilde;es:</font></strong></font> 
	   <font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong></strong></font></td>
	 </tr>
	 <tr> 
	  <td bordercolor="#CCCCCC"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong><br>
	   Estilo da fonte:<br>
	   <select name="td_font-family" id="td_font-family">
                <option value=" ">Fonte padr&atilde;o</option>
                <option value="Arial">Arial</option>
                <option value="Times New Roman">Times New Roman</option>
                <option value="Courier New">Courier New</option>
                <option value="Georgia">Georgia</option>
                <option value="Verdana">Verdana</option>
                <option value="Geneva">Geneva</option>
              </select>
	   <br>
	   Alinhamento horizontal:<br>
	   <select name="td_text-align" id="td_text-align">
                <option value="left">&Agrave; esquerda</option>
                <option value="right">&Agrave; direita</option>
                <option value="center">No centro</option>
                <option value="justify">Justificado</option>
              </select>
	   <br>
	   Alinhamento vertical:<br>
	   <select name="td_vertical-align" id="td_vertical-align">
                <option value="top">No alto</option>
                <option value="bottom">Em baixo</option>
                <option value="center">No meio</option>
                <option value="baseline">Linha de base</option>
              </select>
	   <br>
	   Tamanho: 
	   <input name="td_font-size" type="text" id="td_font-size" size="3" maxlength="3" value="<%= valor_campo(str, "td", "font-size") %>">
	   </strong>px<strong><br>
	   <br>
	   <input name="td_font-weight" type="checkbox" id="td_font-weight2" value="bold"<% if valor_campo(str, "td", "font-weight")="bold" then Response.Write(" checked")%>>
	   Negrito</strong></font> <br> <br> <table border="0" cellspacing="0" cellpadding="0">
		<tr valign="top"> 
		 <td><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Cor 
		  da fonte:&nbsp; <br>
		  </strong></font> <table onClick="cor('td_color', '')" id="tabela_td_color" width="15" height="15" border="1" align="right" cellpadding="0" cellspacing="0" unselectable="on">
		   <tr> 
			<td></td>
		   </tr>
		  </table>
		  <font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong> 
		  <input name="td_color" id="td_color" size="8" onChange="muda_tabela('tabela_td_color', this.value)" value="<%= valor_campo(str, "td", "color") %>">
		  &nbsp;</strong></font></td>
		 <td>&nbsp;</td>
		</tr>
		<tr> </tr>
	   </table>
	   <font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong><br>
	   </strong></font> <table border="0" cellspacing="0" cellpadding="0">
		<tr valign="top"> 
		 <td><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Cor 
		  de fundo:&nbsp; <br>
		  </strong></font> <table onClick="cor('td_background-color', '')" id="tabela_td_background-color" width="15" height="15" border="1" align="right" cellpadding="0" cellspacing="0" unselectable="on">
		   <tr> 
			<td></td>
		   </tr>
		  </table>
		  <font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong> 
		  <input value="<%= valor_campo(str, "td", "background-color") %>" name="td_background-color" id="td_background-color" size="8"  onChange="muda_tabela('tabela_td_background-color', this.value)">
		  &nbsp;</strong></font></td>
		 <td>&nbsp;</td>
		</tr>
		<tr> </tr>
	   </table>
	   <font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong><br>
	   </strong></font><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Imagem 
	   de Fundo:</strong><strong><img src="../imagens/imgbd.gif" alt="Escolher imagem do banco de dados" width="22" height="22" align="right" onClick="carrega_img('td_background-image')"></strong><br>
	   <input name="td_background-image" type="text" id="td_background-image" value="<%= replace(replace(valor_campo(str, "td", "background-image"), "url(", ""), ")", "") %>" size="30">
	   <br>
              <strong> </strong></font> <font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong> 
              <input name="td_background-attachment" type="hidden" id="td_background-attachment" value="fixed">
              <input name="td_background-position" type="hidden" id="td_background-position" value="center center">
              <input name="td_background-repeat" type="hidden" id="td_background-repeat" value="no-repeat">
              </strong></font></td>
	 </tr>
	</table>
	<font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong><br>
	<br>
	</strong></font> <strong><font size="2" face="Verdana, Arial, Helvetica, sans-serif"> 
	</font></strong> <table width="100%" border="1" cellspacing="0" cellpadding="0">
	 <tr valign="top"> 
	  <td height="20" nowrap bordercolor="#CCCCCC" bgcolor="#FFFFFF"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong><font color="#000099">Bordas:</font></strong></font> 
	   <font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong></strong></font></td>
	 </tr>
	 <tr> 
	  <td bordercolor="#CCCCCC" bgcolor="#CCCCCC" id="borda_tabela"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">Tamanho 
	   da borda interior:</font></td>
	 </tr>
	 <tr> 
	        <td bordercolor="#CCCCCC" bgcolor="#CCCCCC" id="borda_tabela"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong> 
              <input name="td_border-width" type="text" id="td_border-width" value="<%= replace(replace(valor_campo(str, "td", "border-width"), "solid", ""), " ", "") %>" size="3">
              <input name="td_border-style" type="hidden" id="td_border-style" value="solid">
              </strong></font></td>
	 </tr>
	 <tr> 
	  <td bordercolor="#CCCCCC" bgcolor="#CCCCCC" id="borda_tabela"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">Tamanho 
	   da borda exterior:</font></td>
	 </tr>
	 <tr> 
	        <td bordercolor="#CCCCCC" bgcolor="#CCCCCC" id="borda_tabela"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong> 
              <input name="table_border-width" type="text" id="table_border-width" value="<%= replace(replace(valor_campo(str, "table", "border-width"), "solid", ""), " ", "") %>" size="3">
              <input name="table_border-style" type="hidden" id="table_border-style" value="solid">
              </strong></font></td>
	 </tr>
	 <tr> 
	  <td bordercolor="#CCCCCC" bgcolor="#CCCCCC" id="borda_tabela"> <table border="0" cellspacing="0" cellpadding="0">
		<tr valign="top"> 
		 <td><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Cor 
		  da borda:&nbsp; <br>
		  </strong></font> <table onClick="cor('table_border-color', '')" id="tabela_table_border-color" width="15" height="15" border="1" align="right" cellpadding="0" cellspacing="0" unselectable="on">
		   <tr> 
			<td></td>
		   </tr>
		  </table>
		  <font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong> 
		  <input value="<%= valor_campo(str, "table", "border-color") %>" name="table_border-color" id="table_border-color" size="8"  onChange="muda_tabela('tabela_table_border-color', this.value)">
		  <input value="." name="table_." id="table_." type="hidden">
		  &nbsp;</strong></font></td>
		 <td>&nbsp;</td>
		</tr>
		<tr> </tr>
	   </table></td>
	 </tr>
	</table>
	<br> <table width="100%" border="1" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF"<% If arquivo <> "busca" then Response.Write(" style=""display: none""") %>>
	 <tr valign="top"> 
	  <td height="20" nowrap bordercolor="#CCCCCC" bgcolor="#FFFFFF"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong><font color="#000099">Campos 
	   de formul&aacute;rio:</font></strong></font> <font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong> 
	   </strong></font></td>
	 </tr>
	 <tr> 
	        <td bordercolor="#CCCCCC" bgcolor="#CCCCCC"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Estilo 
              da fonte:<br>
              <select name="input_font-family" id="select">
                <option value=" ">Fonte padr&atilde;o</option>
                <option value="Arial">Arial</option>
                <option value="Times New Roman">Times New Roman</option>
                <option value="Courier New">Courier New</option>
                <option value="Georgia">Georgia</option>
                <option value="Verdana">Verdana</option>
                <option value="Geneva">Geneva</option>
              </select>
              <select name="input_text-align" id="select5">
                <option value=" ">Escolha um...</option>
                <option value="left">&Agrave; esquerda</option>
                <option value="right">&Agrave; direita</option>
                <option value="center">No centro</option>
                <option value="justify">Justificado</option>
              </select>
              <br>
              Tamanho: 
              <input name="input_font-size" type="text" id="input_font-size2" size="3" maxlength="3" value="<%= valor_campo(str, "input", "font-size") %>">
              </strong>px<strong><br>
              <br>
              <input name="input_font-weight" type="checkbox" id="input_font-weight" value="bold"<% if valor_campo(str, "input", "font-weight")="bold" then Response.Write(" checked")%>>
              Negrito</strong></font> <br> <br> <table border="0" cellspacing="0" cellpadding="0">
		<tr valign="top"> 
		 <td><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Cor 
		  da fonte:&nbsp; <br>
		  </strong></font> <table onClick="cor('input_color', '')" id="tabela_input_color" width="15" height="15" border="1" align="right" cellpadding="0" cellspacing="0" unselectable="on">
		   <tr> 
			<td></td>
		   </tr>
		  </table>
		  <font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong> 
		  <input name="input_color" id="input_color" size="8" onChange="muda_tabela('tabela_input_color', this.value)" value="<%= valor_campo(str, "input", "color") %>">
		  &nbsp;</strong></font></td>
		 <td>&nbsp;</td>
		</tr>
		<tr> </tr>
	   </table>
	   <font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong><br>
	   </strong></font> <table border="0" cellspacing="0" cellpadding="0">
		<tr valign="top"> 
		 <td><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Cor 
		  de fundo:&nbsp; <br>
		  </strong></font> <table onClick="cor('input_background-color', '')" id="tabela_input_background-color" width="15" height="15" border="1" align="right" cellpadding="0" cellspacing="0" unselectable="on">
		   <tr> 
			<td></td>
		   </tr>
		  </table>
		  <font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong> 
		  <input value="<%= valor_campo(str, "input", "background-color") %>" name="input_background-color" id="input_background-color2" size="8"  onChange="muda_tabela('tabela_input_background-color', this.value)">
		  &nbsp;</strong></font></td>
		 <td>&nbsp;</td>
		</tr>
		<tr> </tr>
	   </table></td>
	 </tr>
	</table>
	<table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#000000" bgcolor="#FFFFFF"<% If lcase(arquivo) <> "tabela" and lcase(arquivo) <> "menu_lateral" then Response.Write(" style=""display: none""") %>>
	 <tr valign="top"> 
	  <td height="20" nowrap bordercolor="#CCCCCC" bgcolor="#FFFFFF"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong><font color="#000099">Com 
	   mouse sobre:</font></strong></font> <font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong> 
	   </strong></font></td>
	 </tr>
	 <tr> 
	  <td bordercolor="#CCCCCC" bgcolor="#CCCCCC"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Estilo 
	   da fonte:<br>
	   <select name=".sobre_font-family" id=".sobre_font-family">
                <option value=" ">N&atilde;o alterar</option>
                <option value="Arial">Arial</option>
                <option value="Times New Roman">Times New Roman</option>
                <option value="Courier New">Courier New</option>
                <option value="Georgia">Georgia</option>
                <option value="Verdana">Verdana</option>
                <option value="Geneva">Geneva</option>
              </select>
	   <select name=".sobre_text-align" id=".sobre_text-align">
                <option value=" ">N&atilde;o Alterar</option>
                <option value="left">&Agrave; esquerda</option>
                <option value="right">&Agrave; direita</option>
                <option value="center">No centro</option>
                <option value="justify">Justificado</option>
              </select>
	   <br>
	   Tamanho: 
	   <input name=".sobre_font-size" type="text" id=".sobre_font-size" size="3" maxlength="3" value="<%= valor_campo(str, ".sobre", "font-size") %>">
	   </strong>px<strong><br>
	   <br>
	   <input name=".sobre_font-weight" type="checkbox" id=".sobre_font-weight" value="bold"<% if valor_campo(str, ".sobre", "font-weight")="bold" then Response.Write(" checked")%>>
	   Negrito</strong></font> <br> <br> <table border="0" cellspacing="0" cellpadding="0">
		<tr valign="top"> 
		 <td><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Cor 
		  da fonte:&nbsp; <br>
		  </strong></font> <table onClick="cor('.sobre_color', '')" id="tabela_.sobre_color" width="15" height="15" border="1" align="right" cellpadding="0" cellspacing="0" unselectable="on">
		   <tr> 
			<td></td>
		   </tr>
		  </table>
		  <font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong> 
		  <input name=".sobre_color" id=".sobre_color" size="8" onChange="muda_tabela('tabela_.sobre_color', this.value)" value="<%= valor_campo(str, ".sobre", "color") %>">
		  &nbsp;</strong></font></td>
		 <td>&nbsp;</td>
		</tr>
		<tr> </tr>
	   </table>
	   <font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong><br>
	   </strong></font> <table border="0" cellspacing="0" cellpadding="0">
		<tr valign="top"> 
		 <td><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Cor 
		  de fundo:&nbsp; <br>
		  </strong></font> <table onClick="cor('.sobre_background-color', '')" id="tabela_.sobre_background-color" width="15" height="15" border="1" align="right" cellpadding="0" cellspacing="0" unselectable="on">
		   <tr> 
			<td></td>
		   </tr>
		  </table>
		  <font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong> 
		  <input value="<%= valor_campo(str, ".sobre", "background-color") %>" name=".sobre_background-color" id=".sobre_background-color" size="8"  onChange="muda_tabela('tabela_.sobre_background-color', this.value)">
		  &nbsp;</strong></font></td>
		 <td>&nbsp;</td>
		</tr>
		<tr> </tr>
	   </table>
	          <table width="100%" border="1" cellspacing="0" cellpadding="0">
                <tr> 
                  <td bordercolor="#CCCCCC" bgcolor="#CCCCCC" id="borda_tabela"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">Tamanho 
                    da borda:</font></td>
                </tr>
                <tr> 
                  <td bordercolor="#CCCCCC" bgcolor="#CCCCCC" id="borda_tabela"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong> 
                    <input name=".sobre_border-width" type="text" id=".sobre_border-width" value="<%= replace(replace(valor_campo(str, ".sobre", "border-width"), "solid", ""), " ", "") %>" size="3">
                    <input name=".sobre_border-style" type="hidden" id=".sobre_border-style" value="solid">
                    </strong></font></td>
                </tr>
                <tr> 
                  <td bordercolor="#CCCCCC" bgcolor="#CCCCCC" id="borda_tabela"> 
                    <table border="0" cellspacing="0" cellpadding="0">
                      <tr valign="top"> 
                        <td><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Cor 
                          da borda:&nbsp; <br>
                          </strong></font> <table onClick="cor('.sobre_border-color', '')" id="tabela_.sobre_border-color" width="15" height="15" border="1" align="right" cellpadding="0" cellspacing="0" unselectable="on">
                            <tr> 
                              <td></td>
                            </tr>
                          </table>
                          <font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong> 
                          <input value="<%= valor_campo(str, ".sobre", "border-color") %>" name=".sobre_border-color" id=".sobre_border-color" size="8"  onChange="muda_tabela('tabela_.sobre_border-color', this.value)">
                          &nbsp;</strong></font></td>
                        <td>&nbsp;</td>
                      </tr>
                      <tr> </tr>
                    </table></td>
                </tr>
              </table></td>
	 </tr>
	</table>
	<hr noshade> <div align="center"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"> 
	 <input type="button" name="Submit2" value="Pr&eacute;-Visualiza&ccedil;&atilde;o *" onClick="visualiza()">
	 <br>
	 <font size="1">(* nada ser&aacute; gravado no banco de dados)</font><br>
	 <input type="submit" name="Submit" value="Atualizar">
	 <input name="Submit22" value="Cancelar" type="reset">
	 <a href="#" onClick="mostra()"> </a> </font></div></td>
  </tr>
  <tr bordercolor="#CCCCCC"> 
   <td height="20" colspan="2" bgcolor="#CCCCCC"> <a href="../Administrador.asp?cliente=<%= cliente %>"><font color="#000000" size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Voltar</strong></font></a> 
   </td>
  </tr>
 </table>
</form><OBJECT id=dlgHelper CLASSID="clsid:3050f819-98b5-11cf-bb82-00aa00bdce0b" width="0px" height="0px">
 </OBJECT>

</body>
</html>
<!-- #include file="../../fechaconexoes.asp" -->
