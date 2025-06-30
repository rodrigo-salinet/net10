<%
table_rows = Request.QueryString("table_rows")
table_cols = Request.QueryString("table_cols")
table_width = Request.QueryString("table_width")
table_align = Request.QueryString("table_align")
table_border = Request.QueryString("table_border")
table_padding = Request.QueryString("table_padding")
table_spacing = Request.QueryString("table_spacing")

%>
<html>
<head>
<script language="JavaScript">
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
		frmTable.table_width.disabled=false;
		frmTable.table_width_type.disabled=false;
	}else{
		frmTable.table_width.disabled=true;
		frmTable.table_width_type.disabled=true;
	}
}
function inserir_tabela(){
	num_linhas=parseInt(frmTable.table_rows.value);
	if(num_linhas==0){
		num_linhas=1;
	}
	num_colunas=parseInt(frmTable.table_cols.value);
	if(num_colunas==0){
		num_colunas=1;
	}
	if(frmTable.table_specify_width.checked){
		largura=parseInt(frmTable.table_width.value);
		largura_tipo=frmTable.table_width_type.options[frmTable.table_width_type.selectedIndex].value;
	}else{
		largura='';
		largura_tipo='';
	}
	borda=parseInt(frmTable.table_border.value);
    alinhamento=frmTable.table_align.options[frmTable.table_align.selectedIndex].value
	preenchimento=parseInt(frmTable.table_padding.value);
	espacamento=parseInt(frmTable.table_spacing.value);

	fundo=frmTable.table_bgColor.value;
	imagem=frmTable.table_background.value;
	tabela_inicio='<table width='+largura+largura_tipo + ' id=tabela'
	tabela_inicio = tabela_inicio +' cellpadding='+preenchimento+'  cellspacing='+espacamento+' border='+borda+' align='+alinhamento
	if(fundo!="")
		tabela_inicio = tabela_inicio+' bgColor='+fundo
	tabela_inicio = tabela_inicio+' background='+imagem+'>';
	tabela_meio=''
	for(i=0;i<num_linhas;i++){
		tabela_meio=tabela_meio+'<tr>'
		for(j=0;j<num_colunas;j++){
			tabela_meio=tabela_meio+'<td>&nbsp;</td>'		
		}
		tabela_meio=tabela_meio+'</tr>'
	}
	tabela_fim='</table>';
	tabela_feita=tabela_inicio+tabela_meio+tabela_fim;
	window.returnValue=tabela_feita;
	window.close();
}
</script>
<title>Inserir Tabela</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body bgcolor="#C0C0C0" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<form name="frmTable" unselectable="on">
  
 <table width="275" border="0" cellspacing="0" cellpadding="1" unselectable="on">
  <tr unselectable="on"> 
   <td width="275" style="font-weight: 600;" unselectable="on" colspan="2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Tamanho 
	</strong> </font> <hr size="1" noshad></td>
  </tr>
  <tr unselectable="on"> 
   <td width="275" unselectable="on"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><strong>Linhas: 
	</strong></font></td>
   <td width="275" unselectable="on"><input type="text" size="2" maxlength="4" name="table_rows" value="<% If table_rows <> empty then %><%= table_rows %><% Else %>2<% End if %>"></td>
  </tr>
  <tr unselectable="on"> 
   <td width="275" unselectable="on"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><strong>Colunas: 
	</strong></font></td>
   <td width="275" unselectable="on"><input type="text" size="2" maxlength="4" name="table_cols" value="<% If table_cols <> empty then %><%= table_cols %><% Else %>2<% End if %>"></td>
  </tr>
  <tr unselectable="on"> 
   <td width="275" unselectable="on"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><strong>Especificar 
	Largura: </strong></font></td>
   <td width="275" unselectable="on"><input type="checkbox" name="table_specify_width" value="1" onClick="tamanho_width(this)"> 
	<input type="text" size="2" maxlength="4" name="table_width" value="<% If table_width <> empty then %><%= table_width %><% Else %>100<% End if %>" disabled> 
	<select disabled unselectable="on" name="table_width_type">
	 <option value="%">% 
	 <option value="">pixels</select> </td>
  </tr>
  <tr unselectable="on"> 
   <td width="275" unselectable="on" colspan="2">&nbsp;</td>
  </tr>
  <tr unselectable="on"> 
   <td width="275" class="columnHeader" style="font-weight: 600;" unselectable="on" colspan="2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Layout 
	</strong> </font> <hr size="1" noshad></td>
  </tr>
  <tr unselectable="on"> 
   <td width="275" unselectable="on"><strong><font size="1" face="Verdana, Arial, Helvetica, sans-serif">Alinhamento: 
	</font></strong></td>
   <td width="275" unselectable="on"><select name="table_align">
	 <option value="0">Padr&atilde;o</option>
	 <option value="left">Esquerda</option>
	 <option value="center">Centro</option>
	 <option value="right">Direita</option>
	</select></td>
  </tr>
  <tr unselectable="on"> 
   <td width="275" unselectable="on"><strong><font size="1" face="Verdana, Arial, Helvetica, sans-serif">Tamanho 
	da Borda: </font></strong></td>
   <td width="275" unselectable="on"><input type="text" size="2" maxlength="4" name="table_border" value="1" style="float:left;"> 
	<div style="position:relative;left:1px;top:1px"> <img id="border_up" unselectable="on" src="imagens/sistema/arrowup_norm.gif" width="12" height="9" alt="Aumenta borda da tabela" title="Aumenta borda da tabela" style="cursor:hand;" onClick="mais(frmTable.table_border)"><Br>
	 <img id="border_down" unselectable="on" src="imagens/sistema/arrowdown_norm.gif" width="12" height="9" alt="Diminui borda da tabela" title="Diminui borda da tabela" style="cursor:hand;" onClick="menos(frmTable.table_border)"></div></td>
  </tr>
  <tr unselectable="on"> 
   <td width="275" unselectable="on"><strong><font size="1" face="Verdana, Arial, Helvetica, sans-serif">Preenchimento 
	de célula: </font></strong></td>
   <td width="275" unselectable="on"><input type="text" size="2" maxlength="4" name="table_padding" value="2" style="float:left;"> 
	<div style="position:relative;left:1px;top:1px"> <img id="padding_up" unselectable="on" src="imagens/sistema/arrowup_norm.gif" width="12" height="9" alt="Aumenta preenchimento da célula" title="Aumenta preenchimento da célula" style="cursor:hand;" onClick="mais(frmTable.table_padding)"><Br>
	 <img id="padding_down" unselectable="on" src="imagens/sistema/arrowdown_norm.gif" width="12" height="9" alt="Diminui preenchimento da célula" title="Diminui preenchimento da célula" style="cursor:hand;" onClick="menos(frmTable.table_padding)"></div></td>
  </tr>
  <tr unselectable="on"> 
   <td width="275" unselectable="on"><strong><font size="1" face="Verdana, Arial, Helvetica, sans-serif">Espa&ccedil;amento 
	de células: </font></strong></td>
   <td width="275" unselectable="on"><input type="text" size="2" maxlength="4" name="table_spacing" value="2" style="float:left;"> 
	<div style="position:relative; left:1px; top:1px; width: 12px; height: 32px;"> 
	 <img id="spacing_up" unselectable="on" src="imagens/sistema/arrowup_norm.gif" width="12" height="9" alt="Aumenta espaçamento da célula" title="Aumenta espaçamento da célula" style="cursor:hand;" onClick="mais(frmTable.table_spacing)"><Br>
	 <img id="spacing_down" unselectable="on" src="imagens/sistema/arrowdown_norm.gif" width="12" height="9" alt="Diminui espaçamento da célula" title="Diminui espaçamento da célula" style="cursor:hand;" onClick="menos(frmTable.table_spacing)"></div></td>
  </tr>
  <tr unselectable="on"> 
   <td unselectable="on"><strong><font size="1" face="Verdana, Arial, Helvetica, sans-serif">Cor 
	de fundo: </font></strong></td>
   <td unselectable="on"><input name="table_bgColor" type="text" id="table_bgColor" style="float:left;"> 
   </td>
  </tr>
  <tr unselectable="on"> 
   <td unselectable="on"><strong><font size="1" face="Verdana, Arial, Helvetica, sans-serif">Imagem 
	de fundo: </font></strong></td>
   <td unselectable="on"><input name="table_background" type="text" id="table_background" style="float:left;"> 
   </td>
  </tr>
  <tr unselectable="on"> 
   <td colspan="2" unselectable="on">&nbsp;</td>
  </tr>
  <tr unselectable="on"> 
   <td colspan="2" unselectable="on"> <div align="center"> 
	 <input name="button" type="button" value=".:: Inserir Tabela ::." onClick="inserir_tabela()">
	</div></td>
  </tr>
 </table>
</form>
</body>
</html>
