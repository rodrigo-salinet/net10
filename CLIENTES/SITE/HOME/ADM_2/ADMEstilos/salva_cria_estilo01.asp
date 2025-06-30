<!-- #include file="../../conexao.asp" -->
<!-- #include file="../conexao_adm.asp" -->
<!-- #include file="../validasenha.asp" -->
<%
arquivo = Request.QueryString("arquivo")
sobre = Request.QueryString("sobre")
if sobre <> empty then sobre = sobre & "_"

caminho_teste = Server.MapPath("../../clientes/" & cliente & "/estilos/" & arquivo & ".css")
if not fso.fileExists(caminho_teste) then fso.CreateTextFile(caminho_teste)

Set css = fso.OpenTExtFile(caminho_teste)

Set variavel = CreateObject("Scripting.Dictionary")
Do while not css.AtEndOfStream
	linha = css.readline
	If instr(linha, sobre & "body") > 0 then
		tag = sobre & "body"
	Elseif instr(linha, sobre & "table") > 0 then
		tag = sobre & "table"
	Elseif instr(linha, sobre & "td") > 0 then
		tag = sobre & "td"
	Elseif instr(linha, ".sobre") > 0 then
		tag = ".sobre"
	Else
		if instr(linha, "}")<1  then
			ldp = instr(linha, ": ")
			nome = left(linha, ldp + 1)
			valor = replace(replace(linha, nome, ""), ";", "")
			nome = trim(replace(nome, ":", ""))
			nome = tag & "_" & nome 
		End if
		IF not variavel.exists(nome) then
			variavel.add nome, valor
			'Response.Write(nome & " = <font color=white>" & variavel(nome) & "</font><hr>")
		End if
	
	End if
'	Response.Write(campo & "<hr>")
Loop

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

<body bgcolor="#3399CC" text="#000000" link="#0000CC"  vlink="#0000FF" alink="#0066FF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onLoad="carrega('<%= sobre %>')">
<form action="cria_estilo02.asp?arquivo=<%= arquivo %>&sobre=<%= sobre %>&cliente=<%= cliente %>" method="post" name="form1" target="_self">
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
		  </strong></font> <table onClick="cor('<%= sobre %>body_background-color', '<%= sobre %>')" id="tabela_<%= sobre %>body_background-color" width="15" height="15" border="1" align="right" cellpadding="0" cellspacing="0" unselectable="on">
		   <tr> 
			<td></td>
		   </tr>
		  </table>
		  <input name="<%= sobre %>body_background-color" id="<%= sobre %>body_background-color" size="8" onChange="muda_tabela('tabela_<%= sobre %>body_background-color', this.value)" value="<%= variavel(sobre & "body_background-color") %>"></td>
		</tr>
		<tr> 
		 <td><font size="2" face="Verdana, Arial, Helvetica, sans-serif"> 
		  <input name="checkbox" type="checkbox" onClick="if(this.checked==true){arg='sim'}else{arg='nao'}esconde('cor_fundo', arg);"<% If lcase(variavel(sobre & "body_background-color")) = "transparent" then Response.Write(" checked")%>>
		  Herdar</font></td>
		</tr>
	   </table>
	   <br> <hr noshade> <font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Imagem 
	   de Fundo:<img src="../imagens/imgbd.gif" alt="Escolher imagem do banco de dados" width="22" height="22" align="right" onClick="carrega_img('<%= sobre %>body_background-image')"><br>
	   </strong> <strong> 
	   <input name="<%= sobre %>body_background-image" type="text" id="<%= sobre %>body_background-image2" value="<%= replace(replace(variavel(sobre & "body_background-image"), "url(", ""), ")", "") %>" size="30">
	   <br>
	   </strong></font> <font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong> 
	   </strong><strong><br>
	   <input name="<%= sobre %>body_background-attachment" type="checkbox" id="<%= sobre %>body_background-attachment2" value="fixed" checked>
	   </strong>Fixa<strong> <br>
	   Repetir: <br>
	   </strong> 
	   <input name="<%= sobre %>body_background-repeat" type="radio" value="no-repeat"<% if variavel(sobre & "body_background-repeat")="no-repeat" or variavel(sobre & "body_background-repeat")="" then Response.Write(" checked")%>>
	   N&atilde;o repetir <br>
	   <input name="<%= sobre %>body_background-repeat" type="radio" value="repeat"<% if variavel(sobre & "body_background-repeat")="repeat" then Response.Write(" checked")%>>
	   Repetir <br>
	   <input type="radio" name="<%= sobre %>body_background-repeat" value="repeat-x"<% if variavel(sobre & "body_background-repeat")="repeat-x" then Response.Write(" checked")%>>
	   Repetir X<br>
	   <input type="radio" name="<%= sobre %>body_background-repeat" value="repeat-y"<% if variavel(sobre & "body_background-repeat")="repeat-y" then Response.Write(" checked")%>>
	   Repetir Y<br>
	   <strong> </strong><strong> 
	   <input name="<%= sobre %>body_background-position" type="hidden" id="<%= sobre %>body_background-position2" value="left top">
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
	   <select name="<%= sobre %>td_font-family" id="<%= sobre %>td_font-family">
		<option<% if variavel(sobre & "td_font-family")="" then Response.Write(" selected")%>>Fonte 
		padr&atilde;o</option>
		<option value="Arial"<% if variavel(sobre & "td_font-family")="Arial" then Response.Write(" selected")%>>Arial</option>
		<option value="Times New Roman"<% if variavel(sobre & "td_font-family")="Times New Roman" then Response.Write(" selected")%>>Times 
		New Roman</option>
		<option value="Courier New"<% if variavel(sobre & "td_font-family")="Courier New" then Response.Write(" selected")%>>Courier 
		New</option>
		<option value="Georgia"<% if variavel(sobre & "td_font-family")="Georgia" then Response.Write(" selected")%>>Georgia</option>
		<option value="Verdana"<% if variavel(sobre & "td_font-family")="Verdana" then Response.Write(" selected")%>>Verdana</option>
		<option value="Geneva"<% if variavel(sobre & "td_font-family")="Geneva" then Response.Write(" selected")%>>Geneva</option>
	   </select>
	   <br>
	   Alinhamento horizontal:<br>
	   <select name="<%= sobre %>td_text-align" id="<%= sobre %>td_text-align">
		<option value="left"<% if variavel(sobre & "td_text-align")="left" then Response.Write(" selected")%>>&Agrave; 
		esquerda</option>
		<option value="right"<% if variavel(sobre & "td_text-align")="right" then Response.Write(" selected")%>>&Agrave; 
		direita</option>
		<option value="center"<% if variavel(sobre & "td_text-align")="center" then Response.Write(" selected")%>>No 
		centro</option>
		<option value="justify"<% if variavel(sobre & "td_text-align")="justify" then Response.Write(" selected")%>>Justificado</option>
	   </select>
	   <br>
	   Alinhamento vertical:<br>
	   <select name="<%= sobre %>td_vertical-align" id="<%= sobre %>td_vertical-align">
		<option value="top">No alto</option>
		<option value="bottom">Em baixo</option>
		<option value="center">No meio</option>
		<option value="baseline">Linha de base</option>
	   </select>
	   <br>
	   Tamanho: 
	   <input name="<%= sobre %>td_font-size" type="text" id="<%= sobre %>td_font-size" size="3" maxlength="3" value="<%= variavel(sobre & "td_font-size") %>">
	   </strong>px<strong><br>
	   <br>
	   <input name="<%= sobre %>td_font-weight" type="checkbox" id="<%= sobre %>td_font-weight2" value="bold"<% if variavel(sobre & "td_font-weight")="bold" then Response.Write(" checked")%>>
	   Negrito</strong></font> <br> <br> <table border="0" cellspacing="0" cellpadding="0">
		<tr valign="top"> 
		 <td><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Cor 
		  da fonte:&nbsp; <br>
		  </strong></font> <table onClick="cor('<%= sobre %>td_color', '<%= sobre %>')" id="tabela_<%= sobre %>td_color" width="15" height="15" border="1" align="right" cellpadding="0" cellspacing="0" unselectable="on">
		   <tr> 
			<td></td>
		   </tr>
		  </table>
		  <font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong> 
		  <input name="<%= sobre %>td_color" id="<%= sobre %>td_color" size="8" onChange="muda_tabela('tabela_<%= sobre %>td_color', this.value)" value="<%= variavel(sobre & "td_color") %>">
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
		  </strong></font> <table onClick="cor('<%= sobre %>td_background-color', '<%= sobre %>')" id="tabela_<%= sobre %>td_background-color" width="15" height="15" border="1" align="right" cellpadding="0" cellspacing="0" unselectable="on">
		   <tr> 
			<td></td>
		   </tr>
		  </table>
		  <font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong> 
		  <input value="<%= variavel(sobre & "td_background-color") %>" name="<%= sobre %>td_background-color" id="<%= sobre %>td_background-color" size="8"  onChange="muda_tabela('tabela_<%= sobre %>td_background-color', this.value)">
		  &nbsp;</strong></font></td>
		 <td>&nbsp;</td>
		</tr>
		<tr> </tr>
	   </table>
	   <font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong><br>
	   </strong></font><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Imagem 
	   de Fundo:</strong><strong><img src="../imagens/imgbd.gif" alt="Escolher imagem do banco de dados" width="22" height="22" align="right" onClick="carrega_img('<%= sobre %>td_background-image')"></strong><br>
	   <input name="<%= sobre %>td_background-image" type="text" id="<%= sobre %>td_background-image" value="<%= replace(replace(variavel(sobre & "td_background-image"), "url(", ""), ")", "") %>" size="30">
	   <br>
	   <strong> </strong></font> <font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong> 
	   <input name="<%= sobre %>td_background-attachment" type="hidden" id="<%= sobre %>td_background-attachment2" value="fixed">
	   <input name="<%= sobre %>td_background-position" type="hidden" id="<%= sobre %>td_background-position2" value="center center">
	   <input name="<%= sobre %>td_background-repeat" type="hidden" id="<%= sobre %>td_background-repeat2" value="no-repeat">
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
	   <input name="<%= sobre %>td_border" type="text" id="<%= sobre %>td_border" value="<%= replace(replace(variavel(sobre & "td_border"), "solid", ""), " ", "") %>" size="3">
	   <input name="table_border" type="hidden" id="table_border" value="solid">
	   </strong></font></td>
	 </tr>
	 <tr> 
	  <td bordercolor="#CCCCCC" bgcolor="#CCCCCC" id="borda_tabela"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">Tamanho 
	   da borda exterior:</font></td>
	 </tr>
	 <tr> 
	  <td bordercolor="#CCCCCC" bgcolor="#CCCCCC" id="borda_tabela"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong> 
	   <input name="table_border" type="text" id="table_border" value="<%= replace(replace(variavel(sobre & "table_border"), "solid", ""), " ", "") %>" size="3">
	   <input name="<%= sobre %>td_border" type="hidden" id="<%= sobre %>td_border" value="solid">
	   </strong></font></td>
	 </tr>
	 <tr> 
	  <td bordercolor="#CCCCCC" bgcolor="#CCCCCC" id="borda_tabela"> <table border="0" cellspacing="0" cellpadding="0">
		<tr valign="top"> 
		 <td><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Cor 
		  da borda:&nbsp; <br>
		  </strong></font> <table onClick="cor('table_border-color', '<%= sobre %>')" id="tabela_table_border-color" width="15" height="15" border="1" align="right" cellpadding="0" cellspacing="0" unselectable="on">
		   <tr> 
			<td></td>
		   </tr>
		  </table>
		  <font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong> 
		  <input value="<%= variavel(sobre & "table_border-color") %>" name="table_border-color" id="table_border-color2" size="8"  onChange="muda_tabela('tabela_table_border-color', this.value)">
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
	   <select name="<%= sobre %>input_font-family" id="select3">
		<option<% if variavel(sobre & "input_font-family")="" then Response.Write(" selected")%>>Fonte 
		padr&atilde;o</option>
		<option value="Arial"<% if variavel(sobre & "input_font-family")="Arial" then Response.Write(" selected")%>>Arial</option>
		<option value="Times New Roman"<% if variavel(sobre & "input_font-family")="Times New Roman" then Response.Write(" selected")%>>Times 
		New Roman</option>
		<option value="Courier New"<% if variavel(sobre & "input_font-family")="Courier New" then Response.Write(" selected")%>>Courier 
		New</option>
		<option value="Georgia"<% if variavel(sobre & "input_font-family")="Georgia" then Response.Write(" selected")%>>Georgia</option>
		<option value="Verdana"<% if variavel(sobre & "input_font-family")="Verdana" then Response.Write(" selected")%>>Verdana</option>
		<option value="Geneva"<% if variavel(sobre & "input_font-family")="Geneva" then Response.Write(" selected")%>>Geneva</option>
	   </select>
	   <select name="<%= sobre %>input_text-align" id="select4">
		<option<% if variavel(sobre & "input_text-align")="" then Response.Write(" selected")%>>Escolha 
		um...</option>
		<option value="left"<% if variavel(sobre & "input_text-align")="left" then Response.Write(" selected")%>>&Agrave; 
		esquerda</option>
		<option value="right"<% if variavel(sobre & "input_text-align")="right" then Response.Write(" selected")%>>&Agrave; 
		direita</option>
		<option value="center"<% if variavel(sobre & "input_text-align")="center" then Response.Write(" selected")%>>No 
		centro</option>
		<option value="justify"<% if variavel(sobre & "input_text-align")="justify" then Response.Write(" selected")%>>Justificado</option>
	   </select>
	   <br>
	   Tamanho: 
	   <input name="<%= sobre %>input_font-size" type="text" id="<%= sobre %>input_font-size2" size="3" maxlength="3" value="<%= variavel(sobre & "input_font-size") %>">
	   </strong>px<strong><br>
	   <br>
	   <input name="<%= sobre %>input_font-weight" type="checkbox" id="<%= sobre %>input_font-weight2" value="bold"<% if variavel(sobre & "input_font-weight")="bold" then Response.Write(" checked")%>>
	   Negrito</strong></font> <br> <br> <table border="0" cellspacing="0" cellpadding="0">
		<tr valign="top"> 
		 <td><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Cor 
		  da fonte:&nbsp; <br>
		  </strong></font> <table onClick="cor('<%= sobre %>input_color', '<%= sobre %>')" id="tabela_<%= sobre %>input_color" width="15" height="15" border="1" align="right" cellpadding="0" cellspacing="0" unselectable="on">
		   <tr> 
			<td></td>
		   </tr>
		  </table>
		  <font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong> 
		  <input name="<%= sobre %>input_color" id="<%= sobre %>input_color2" size="8" onChange="muda_tabela('tabela_<%= sobre %>input_color', this.value)" value="<%= variavel(sobre & "input_color") %>">
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
		  </strong></font> <table onClick="cor('<%= sobre %>input_background-color', '<%= sobre %>')" id="tabela_<%= sobre %>input_background-color" width="15" height="15" border="1" align="right" cellpadding="0" cellspacing="0" unselectable="on">
		   <tr> 
			<td></td>
		   </tr>
		  </table>
		  <font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong> 
		  <input value="<%= variavel(sobre & "input_background-color") %>" name="<%= sobre %>input_background-color" id="<%= sobre %>input_background-color2" size="8"  onChange="muda_tabela('tabela_<%= sobre %>input_background-color', this.value)">
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
		<option<% if variavel(sobre & ".sobre_font-family")="" then Response.Write(" selected")%>>Não alterar</option>
		<option value="Arial"<% if variavel(sobre & ".sobre_font-family")="Arial" then Response.Write(" selected")%>>Arial</option>
		<option value="Times New Roman"<% if variavel(sobre & ".sobre_font-family")="Times New Roman" then Response.Write(" selected")%>>Times 
		New Roman</option>
		<option value="Courier New"<% if variavel(sobre & ".sobre_font-family")="Courier New" then Response.Write(" selected")%>>Courier 
		New</option>
		<option value="Georgia"<% if variavel(sobre & ".sobre_font-family")="Georgia" then Response.Write(" selected")%>>Georgia</option>
		<option value="Verdana"<% if variavel(sobre & ".sobre_font-family")="Verdana" then Response.Write(" selected")%>>Verdana</option>
		<option value="Geneva"<% if variavel(sobre & ".sobre_font-family")="Geneva" then Response.Write(" selected")%>>Geneva</option>
	   </select>
	   <select name=".sobre_text-align" id=".sobre_text-align">
		<option<% if variavel(sobre & ".sobre_text-align")="" then Response.Write(" selected")%>>Não Alterar</option>
		<option value="left"<% if variavel(sobre & ".sobre_text-align")="left" then Response.Write(" selected")%>>&Agrave; 
		esquerda</option>
		<option value="right"<% if variavel(sobre & ".sobre_text-align")="right" then Response.Write(" selected")%>>&Agrave; 
		direita</option>
		<option value="center"<% if variavel(sobre & ".sobre_text-align")="center" then Response.Write(" selected")%>>No 
		centro</option>
		<option value="justify"<% if variavel(sobre & ".sobre_text-align")="justify" then Response.Write(" selected")%>>Justificado</option>
	   </select>
	   <br>
	   Tamanho: 
	   <input name="<%= sobre %>.sobre_font-size" type="text" id="<%= sobre %>.sobre_font-size" size="3" maxlength="3" value="<%= variavel(sobre & ".sobre_font-size") %>">
	   </strong>px<strong><br>
	   <br>
	   <input name="<%= sobre %>.sobre_font-weight" type="checkbox" id="<%= sobre %>.sobre_font-weight" value="bold"<% if variavel(sobre & ".sobre_font-weight")="bold" then Response.Write(" checked")%>>
	   Negrito</strong></font> <br> <br> <table border="0" cellspacing="0" cellpadding="0">
		<tr valign="top"> 
		 <td><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Cor 
		  da fonte:&nbsp; <br>
		  </strong></font> <table onClick="cor('<%= sobre %>.sobre_color', '<%= sobre %>')" id="tabela_<%= sobre %>.sobre_color" width="15" height="15" border="1" align="right" cellpadding="0" cellspacing="0" unselectable="on">
		   <tr> 
			<td></td>
		   </tr>
		  </table>
		  <font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong> 
		  <input name="<%= sobre %>.sobre_color" id="<%= sobre %>.sobre_color" size="8" onChange="muda_tabela('tabela_<%= sobre %>.sobre_color', this.value)" value="<%= variavel(sobre & ".sobre_color") %>">
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
		  </strong></font> <table onClick="cor('<%= sobre %>.sobre_background-color', '<%= sobre %>')" id="tabela_<%= sobre %>.sobre_background-color" width="15" height="15" border="1" align="right" cellpadding="0" cellspacing="0" unselectable="on">
		   <tr> 
			<td></td>
		   </tr>
		  </table>
		  <font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong> 
		  <input value="<%= variavel(sobre & ".sobre_background-color") %>" name="<%= sobre %>.sobre_background-color" id="<%= sobre %>.sobre_background-color" size="8"  onChange="muda_tabela('tabela_<%= sobre %>.sobre_background-color', this.value)">
		  &nbsp;</strong></font></td>
		 <td>&nbsp;</td>
		</tr>
		<tr> </tr>
	   </table>
	   <table width="100%" border="1" cellspacing="0" cellpadding="0">
		<tr valign="top"> 
		 <td height="20" nowrap bordercolor="#CCCCCC" bgcolor="#FFFFFF"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong><font color="#000099">Bordas:</font></strong></font> 
		  <font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong></strong></font></td>
		</tr>
		<tr> 
		 <td bordercolor="#CCCCCC" bgcolor="#CCCCCC" id="borda_tabela"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">Tamanho 
		  da borda:</font></td>
		</tr>
		<tr> 
		 <td bordercolor="#CCCCCC" bgcolor="#CCCCCC" id="borda_tabela"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong> 
		  <input name="<%= sobre %>.sobre_border" type="text" id="<%= sobre %>.sobre_border" value="<%= replace(replace(variavel(sobre & ".sobre_border"), "solid", ""), " ", "") %>" size="3">
		  <input name=".sobre_border" type="hidden" id=".sobre_border" value="solid">
		  </strong></font></td>
		</tr>
		<tr> 
		 <td bordercolor="#CCCCCC" bgcolor="#CCCCCC" id="borda_tabela"> <table border="0" cellspacing="0" cellpadding="0">
		   <tr valign="top"> 
			<td><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Cor 
			 da borda:&nbsp; <br>
			 </strong></font> <table onClick="cor('.sobre_border-color', '<%= sobre %>')" id="tabela_.sobre_border-color" width="15" height="15" border="1" align="right" cellpadding="0" cellspacing="0" unselectable="on">
			  <tr> 
			   <td></td>
			  </tr>
			 </table>
			 <font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong> 
			 <input value="<%= variavel(sobre & ".sobre_border-color") %>" name=".sobre_border-color" id=".sobre_border-color" size="8"  onChange="muda_tabela('tabela_.sobre_border-color', this.value)">
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
