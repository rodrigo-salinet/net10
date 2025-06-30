<%
tipo = Request.QueryString("tipo")
tag_rows = Request.QueryString("tag_rows")
tag_cols = Request.QueryString("tag_cols")
tag_width = Request.QueryString("tag_width")
tag_height = Request.QueryString("tag_height")
tag_align = Request.QueryString("tag_align")
tag_valign = Request.QueryString("tag_valign")
tag_border = Request.QueryString("tag_border")
tag_borderColor = Request.QueryString("tag_borderColor")
tag_padding = Request.QueryString("tag_padding")
tag_spacing = Request.QueryString("tag_spacing")
tag_bgColor = Request.QueryString("tag_bgColor")
tag_background = Request.QueryString("tag_background")
tag_style = Request.QueryString("tag_style")
%>
<html>
<head>
<script language="JavaScript">
function muda(campo, valor)
{
	campo.value = valor;
}

function mais(campo){
	if(parseInt(campo.value)<0){
		campo.value=0;
	}else{
		campo.value=parseInt(campo.value)+1;
	}
}
function menos(campo){
	if(parseInt(campo.value)<0){
		parseInt(campo.value)=0;
	}else{
		if(parseInt(campo.value)!=0){
			campo.value=parseInt(campo.value)-1;
		}
	}
}
function tamanho_width(campo){
	if(campo.checked){
		frmTable.tag_width.disabled=false;
		frmTable.tag_width_type.disabled=false;
	}else{
		frmTable.tag_width.disabled=true;
		frmTable.tag_width_type.disabled=true;
	}
}
function inserir_tabela(){

	var tabela_feita = new Array();
	for(var a; a>=document.frmTable.all.lenght; a++)
	{
		alert(document.frmTable.all[a])
	}
	for(campo in document.frmTable.all)
	{
//		if(isFinite(campo)==false)
//		{
			tabela_feita[campo] = frmTable.all[campo];
//			alert(campo + ": " + tabela_feita[campo].value)
//		}
	}
		
	window.returnValue = tabela_feita;
	window.close();
}


//This variable needs to have global scope for the callColorDlg function to persist the chosen color
var sInitColor = null;
function callColorDlg(){
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

function cor(nome){
	novacor = callColorDlg()
	document.all[nome].value = '#' + novacor;
	document.all['tabela_'+nome].bgColor = '#' + novacor;
}
</script>
<title>Alterar <%= tipo %></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body bgcolor="#C0C0C0" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<form name="frmTable" unselectable="on">
  
 <table width="100%" border="0" cellspacing="0" cellpadding="1" unselectable="on">
  <tr unselectable="on"> 
   <td width="275" style="font-weight: 600;" unselectable="on" colspan="2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong> 
	</strong> </font> 
	<hr size="1" noshad></td>
  </tr>
  <tr unselectable="on"> 
   <td width="275" unselectable="on"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><strong>Especificar 
	Largura: </strong></font></td>
   <td width="275" unselectable="on"> <input type="text" size="3" maxlength="5" name="tag_width" value="<% If tag_width <> empty then %><%= tag_width %><% Else %><% End if %>"> 
   </td>
  </tr>
  <tr unselectable="on"> 
   <td unselectable="on"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><strong>Especificar 
	Altura: </strong></font></td>
   <td unselectable="on"> <input type="text" size="3" maxlength="5" name="tag_height" value="<% If tag_height <> empty then %><%= tag_height %><% Else %><% End if %>"> 
   </td>
  </tr>
  <tr unselectable="on"> 
   <td width="275" class="columnHeader" style="font-weight: 600;" unselectable="on" colspan="2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong> 
	</strong> </font> 
	<hr size="1" noshad></td>
  </tr>
  <tr unselectable="on"> 
   <td width="275" unselectable="on"><strong><font size="1" face="Verdana, Arial, Helvetica, sans-serif">Alinhamento: 
	</font></strong></td>
   <td width="275" unselectable="on"> 
   <select name="tag_align1" id="tag_align1" onChange="muda(tag_align, this.value)">
	 <option value="0"<% IF tag_align="0" then Response.Write(" selected")%>>Padr&atilde;o</option>
	 <option value="left"<% IF tag_align="left" then Response.Write(" selected")%>>Esquerda</option>
	 <option value="center"<% IF tag_align="center" then Response.Write(" selected")%>>Centro</option>
	 <option value="right"<% IF tag_align="right" then Response.Write(" selected")%>>Direita</option>
	</select>
	<input name="tag_align" type="hidden" id="tag_align" value="<%= tag_align %>"></td>
  </tr>
  <tr unselectable="on"> 
   <td unselectable="on"><strong><font size="1" face="Verdana, Arial, Helvetica, sans-serif">Alinhamento 
	vert.: </font></strong></td>
   <td unselectable="on">
   <select name="tag_vAlign1" id="tag_vAlign1" onChange="muda(tag_vAlign, this.value)">
	 <option value="0"<% IF tag_valign="0" then Response.Write(" selected")%>>Padr&atilde;o</option>
	 <option value="top"<% IF tag_valign="top" then Response.Write(" selected")%>>No alto</option>
	 <option value="middle"<% IF tag_valign="middle" then Response.Write(" selected")%>>Centro</option>
	 <option value="bottom"<% IF tag_valign="bottom" then Response.Write(" selected")%>>Em baixo</option>
	</select>
	<input name="tag_vAlign" type="hidden" id="tag_vAlign" value="<%= tag_vAlign %>"></td>
  </tr>
  <tr unselectable="on"> 
   <td width="275" unselectable="on"><strong><font size="1" face="Verdana, Arial, Helvetica, sans-serif">Tamanho 
	da Borda: </font></strong></td>
   <td width="275" unselectable="on"><input type="text" size="2" maxlength="4" name="tag_border" value="<% If tag_border <> empty then %><%= tag_border %><% End if %>" style="float:left;"> 
	<div style="position:relative;left:1px;top:1px"> <img id="border_up" unselectable="on" src="imagens/sistema/arrowup_norm.gif" width="12" height="9" alt="Aumenta borda da tabela" title="Aumenta borda da tabela" style="cursor:hand;" onClick="mais(frmTable.tag_border)"><Br>
          <img id="border_down" unselectable="on" src="imagens/sistema/arrowdown_norm.gif" width="12" height="9" alt="Diminui borda da tabela" title="Diminui borda da tabela" style="cursor:hand;" onClick="menos(frmTable.tag_border)"></div></td>
  </tr>
  <tr unselectable="on"> 
   <td width="275" unselectable="on"><strong><font size="1" face="Verdana, Arial, Helvetica, sans-serif">Preenchimento 
	de célula: </font></strong></td>
   <td width="275" unselectable="on"><input type="text" size="2" maxlength="4" name="tag_padding" value="<% If tag_padding <> empty then %><%= tag_padding %><% End if %>" style="float:left;"> 
	<div style="position:relative;left:1px;top:1px"> <img id="padding_up" unselectable="on" src="imagens/sistema/arrowup_norm.gif" width="12" height="9" alt="Aumenta preenchimento da célula" title="Aumenta preenchimento da célula" style="cursor:hand;" onClick="mais(frmTable.tag_padding)"><Br>
          <img id="padding_down" unselectable="on" src="imagens/sistema/arrowdown_norm.gif" width="12" height="9" alt="Diminui preenchimento da célula" title="Diminui preenchimento da célula" style="cursor:hand;" onClick="menos(frmTable.tag_padding)"></div></td>
  </tr>
  <tr unselectable="on"> 
   <td width="275" unselectable="on"><strong><font size="1" face="Verdana, Arial, Helvetica, sans-serif">Espa&ccedil;amento 
	entre as células: </font></strong></td>
   <td width="275" unselectable="on"><input type="text" size="2" maxlength="4" name="tag_spacing" value="<% If tag_spacing <> empty then %><%= tag_spacing %><% End if %>" style="float:left;"> 
	<div style="position:relative; left:1px; top:1px; width: 12px; height: 32px;"> 
          <img id="spacing_up" unselectable="on" src="imagens/sistema/arrowup_norm.gif" width="12" height="9" alt="Aumenta espaçamento da célula" title="Aumenta espaçamento da célula" style="cursor:hand;" onClick="mais(frmTable.tag_spacing)"><Br>
          <img id="spacing_down" unselectable="on" src="imagens/sistema/arrowdown_norm.gif" width="12" height="9" alt="Diminui espaçamento da célula" title="Diminui espaçamento da célula" style="cursor:hand;" onClick="menos(frmTable.tag_spacing)"></div></td>
  </tr>
  <tr unselectable="on"> 
   <td unselectable="on"><strong><font size="1" face="Verdana, Arial, Helvetica, sans-serif">Cor 
	da borda: </font></strong></td>
   <td unselectable="on"> <table width="130" border="0" cellpadding="0" cellspacing="0">
	 <tr> 
	  <td> <table onClick="cor('tag_borderColor')" id="tabela_tag_borderColor" width="15" height="16" border="1" align="right" cellpadding="0" cellspacing="0" unselectable="on">
		<tr> 
		 <td height="14"></td>
		</tr>
	   </table>
	   <input name="tag_borderColor" type="text" id="tag_borderColor" style="float:left;" value="<%= tag_borderColor %>" size="12"></td>
	 </tr>
	</table></td>
  </tr>
  <tr unselectable="on"> 
   <td unselectable="on"><strong><font size="1" face="Verdana, Arial, Helvetica, sans-serif">Cor 
	de fundo: </font></strong></td>
   <td unselectable="on"><table width="130" border="0" cellspacing="0" cellpadding="0">
	 <tr> 
	  <td><table onClick="cor('tag_bgColor')" id="tabela_tag_bgColor" width="15" height="15" border="1" align="right" cellpadding="0" cellspacing="0" unselectable="on">
		<tr> 
		 <td></td>
		</tr>
	   </table>
	   <input name="tag_bgColor" type="text" id="tag_bgColor" style="float:left;" value="<%= tag_bgColor %>" size="12"></td>
	 </tr>
	</table></td>
  </tr>
  <tr unselectable="on"> 
   <td unselectable="on"><strong><font size="1" face="Verdana, Arial, Helvetica, sans-serif">Imagem 
	de fundo: </font></strong></td>
   <td unselectable="on"><input name="tag_background" type="text" id="tag_background" value="<%= tag_background %>" style="float:left;"> 
   </td>
  </tr>
  <tr unselectable="on"> 
   <td colspan="2" unselectable="on">&nbsp;</td>
  </tr>
  <tr unselectable="on"> 
   <td colspan="2" unselectable="on"> <div align="center"> 
	 <input name="button" type="button" value=".:: Alterar <%= tipo %> ::." onClick="inserir_tabela()">
	</div></td>
  </tr>
 </table>
</form>
 <OBJECT id=dlgHelper CLASSID="clsid:3050f819-98b5-11cf-bb82-00aa00bdce0b" width="0px" height="0px">
 </OBJECT>
</body>
</html>
