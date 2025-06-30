<!-- #include file="../conexao.asp" -->
<!-- #include file="conexao_adm.asp" -->
<!-- #include file="validasenha.asp" -->
<%
id_grupo = Request.QueryString("id_grupo")
If id_grupo = "29" then
	id_grupo = "0"
End if
fundo = replace(Request.QueryString("fundo"), "#", "")
if fundo = empty then
	fundo = "ffffff"
End if
%>
<HTML>
<HEAD>
<TITLE>&nbsp;</TITLE>
<script>
var cliente = "<%= cliente %>";
var grupo_atual = "<%= id_grupo %>";
</script>
<STYLE> 
#contextMenu { 
  position: absolute; 
  visibility: hidden; 
  width: 120px; 
  background-color: lightgrey; 
  layer-background-color: lightgrey; 
  border: 2px outset white; 
} 

.A:Menu { 
   color: black; 
   text-decoration: none; 
  cursor: default; 
   width: 100% 
  } 

 .A:MenuOn { 
   color: white; 
   text-decoration: none; 
   background-color: darkblue; 
  cursor: default; 
   width: 100% 
  } 
</STYLE> 







<STYLE TYPE="text/css">
    BODY {margin: 0pt; padding: 0pt; border: none}
    IFRAME {width: 100%; border: none}
    SELECT {z-index: 0; background-color: #AAD5FF; font-family: "Verdana, Arial, Helvetica, sans-serif"; font-size: 8pt;}
    TABLE {border: 1px black solid; background: lightgrey; text-align: center}
    INPUT {width: 20px; font-family: "Verdana, Arial, Helvetica, sans-serif"; font-size: 8pt;}
    LABEL {font-family: "Verdana, Arial, Helvetica, sans-serif"; font-size: 8pt;}
    .heading {BACKGROUND: #55AAFF}
    .current {color: "red";}
  a:link {
	color: #000000;
	text-decoration: none;
}
a:hover {
	color: #333333;
}
</STYLE>
<SCRIPT LANGUAGE="JavaScript" src="editor.js"></SCRIPT>
</script>

<SCRIPT LANGUAGE="JavaScript" src="menu_btdireito.js"></SCRIPT>
</script>

<SCRIPT LANGUAGE="JavaScript" src="crialink.js"></SCRIPT>
</script>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="../../css/estilo.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.sobre {
	border-top-color: #FFFFFF;	border-right-color: #666666;	border-bottom-color: #333333;	border-left-color: #CCCCCC;
}
-->
</style>
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);


//-->
</script>
<style type="text/css">
<!--
.FontePequena {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: xx-small;
	color: #000000;
}
-->
</style>

</HEAD>
<BODY link="#CCCCCC" vlink="#CCCCCC" alink="#eeeeee" OnFocus="setFocus()" onclick="setFocus()" OnResize="MudarTamanho();" SCROLL=No>
<TABLE width="100%" align="center" ID=editbar3>
  <TR> 
    
  <TD noWrap> 
   <select name="Paragrafo" onChange="doFormat('formatBlock',this[this.selectedIndex].value);this.selectedIndex=0;setFocus()">
	<option selected>Paragrafo</option>
	<option value="&lt;P&gt;">Normal &lt;P&gt;</option>
	<option value="&lt;H1&gt;">T&iacute;tulo 1 &lt;H1&gt;</option>
	<option value="&lt;H2&gt;">T&iacute;tulo 2 &lt;H2&gt;</option>
	<option value="&lt;H3&gt;">T&iacute;tulo 3 &lt;H3&gt;</option>
	<option value="&lt;H4&gt;">T&iacute;tulo 4 &lt;H4&gt;</option>
	<option value="&lt;H5&gt;">T&iacute;tulo 5 &lt;H5&gt;</option>
	<option value="&lt;H6&gt;">T&iacute;tulo 6 &lt;H6&gt;</option>
	<option value="&lt;PRE&gt;">Pre &lt;PRE&gt;</option>
   </select> <select name="Fontes" onChange="doFormat('fontname',this[this.selectedIndex].value);this.selectedIndex=0;setFocus()">
	<option class="heading" selected>Fonte</option>
	<option value="Arial, Helvetica, sans-serif">Arial</option>
	<option value="Times New Roman, Times, serif">Times New Roman</option>
	<option value="Courier New, Courier, mono">Courier New</option>
	<option value="Georgia, Times New Roman, Times, serif">Georgia</option>
	<option value="Verdana, Arial, Helvetica, sans-serif">Verdana</option>
	<option style="COLOR: navy" value="CustomFont">Outra Fonte...</option>
   </select> <select name="Tamanhos" onChange="doFormat('fontSize',this[this.selectedIndex].text);this.selectedIndex=0;setFocus()">
	<option class="heading" selected>Tam.</option>
	<option>1</option>
	<option>2</option>
	<option>3</option>
	<option>4</option>
	<option>5</option>
	<option>6</option>
	<option>7</option>
   </select>
   &nbsp; &nbsp;&nbsp; <a href="#" onClick="mudafundo('cor')"><strong><font color="#0000FF" size="2" face="Verdana, Arial, Helvetica, sans-serif">&nbsp;Cor 
   de fundo</font></strong></a> |&nbsp;<a href="#" onClick="mudafundo('imagem')"><font color="#0000FF" size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Imagem 
   de fundo</strong></font></a> | <a href="#" onClick="aplicaEstilo('')"><font color="#0000CC" size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Mudar 
   estilo</strong></font></a> </TD>
  </TR>
</TABLE>
<TABLE width="100%" border="0" cellpadding="0" cellspacing="0" ONCLICK="setFocus()" ID=editbar>
  <TR> 
    <TD align="center" valign="middle" noWrap> 
      <table border="1" cellpadding="0" cellspacing="2">
	<tr align="center" valign="middle" bordercolor="lightgrey"> 
	 <td height="22" onMouseOver="btSobre(this)" onMouseOut="btFora(this)" id="celula1"><a href="#" onClick="limpaHTML();setFocus();"></a> 
	  <img src="imagens/bold.gif" alt="Negrito" width="22" height="22" onMouseOver="btSobre(this)" onMouseOut="btFora(this)" id="celula" ONCLICK="doFormat('Bold');setFocus();"></td>
	 <td height="22" onMouseOver="btSobre(this)" onMouseOut="btFora(this)" id="celula2"><img src="imagens/sistema/wed_italic.gif" alt="It&aacute;lico" width="22" height="22" onMouseOver="btSobre(this)" onMouseOut="btFora(this)" id="celula" onClick="doFormat('Italic');setFocus();"></td>
	 <td height="22" onMouseOver="btSobre(this)" onMouseOut="btFora(this)" id="celula3"><img src="imagens/under.gif" alt="Sublinhado" width="22" height="22" onMouseOver="btSobre(this)" onMouseOut="btFora(this)" id="celula" onClick="doFormat('Underline');setFocus();"></td>
	 <td height="22" onMouseOver="btSobre(this)" onMouseOut="btFora(this)" id="celula4"><img src="imagens/sistema/wed_aleft.gif" alt="Alinhar &agrave; esquerda" width="22" height="22" onMouseOver="btSobre(this)" onMouseOut="btFora(this)" id="celula" onClick="doFormat('JustifyLeft');setFocus();"></td>
	 <td height="22" onMouseOver="btSobre(this)" onMouseOut="btFora(this)" id="celula5"><img src="imagens/sistema/wed_center.gif" alt="Centralizar" width="22" height="22" onMouseOver="btSobre(this)" onMouseOut="btFora(this)" id="celula"  ONCLICK="doFormat('JustifyCenter');setFocus();"></td>
	 <td height="22" onMouseOver="btSobre(this)" onMouseOut="btFora(this)" id="celula6"><img src="imagens/sistema/wed_aright.gif" alt="Alinhar &agrave; direita" width="22" height="22" onMouseOver="btSobre(this)" onMouseOut="btFora(this)" id="celula"  ONCLICK="doFormat('JustifyRight');setFocus();"></td>
	 <td height="22" onMouseOver="btSobre(this)" onMouseOut="btFora(this)" id="celula7"><img src="imagens/justif.gif" alt="Justificar" width="22" height="22" onMouseOver="btSobre(this)" onMouseOut="btFora(this)" id="celula" onClick="doFormat('JustifyFull');setFocus();"></td>
	 <td height="22" onMouseOver="btSobre(this)" onMouseOut="btFora(this)" id="celula8"><img src="imagens/sistema/wed_nlist.gif" alt="Numera&ccedil;&atilde;o" width="22" height="22" onMouseOver="btSobre(this)" onMouseOut="btFora(this)" id="celula"  ONCLICK="doFormat('insertorderedlist');setFocus();"></td>
	 <td height="22" onMouseOver="btSobre(this)" onMouseOut="btFora(this)" id="celula9"><img src="imagens/sistema/wed_blist.gif" alt="Marcadores" width="22" height="22" onMouseOver="btSobre(this)" onMouseOut="btFora(this)" id="celula" ONCLICK="doFormat('insertunorderedlist');setFocus();"></td>
	 <td height="22" onMouseOver="btSobre(this)" onMouseOut="btFora(this)" id="celula10"><img src="imagens/sistema/wed_ileft.gif" alt="Diminuir Recuo" width="22" height="22" onMouseOver="btSobre(this)" onMouseOut="btFora(this)" id="celula"  onClick="doFormat('outdent');setFocus();"></td>
	 <td height="22" onMouseOver="btSobre(this)" onMouseOut="btFora(this)" id="celula11"><img src="imagens/sistema/wed_iright.gif" alt="Aumentar Recuo" width="22" height="22" onMouseOver="btSobre(this)" onMouseOut="btFora(this)" id="celula"  ONCLICK="doFormat('indent');setFocus();"></td>
	 <td height="22" onMouseOver="btSobre(this)" onMouseOut="btFora(this)" id="celula12"><img src="imagens/sistema/wed_wlink.gif" alt="Adicionar link para outro Site/P&aacute;gina" name="button" width="22" height="22" onMouseOver="btSobre(this)" onMouseOut="btFora(this)" id="celula"  onClick="createLink(1);setFocus();"></td>
	 <td height="22" onMouseOver="btSobre(this)" onMouseOut="btFora(this)" id="celula13"><img src="imagens/link.gif" alt="Adicionar link para outro item" name="button" width="22" height="22" onMouseOver="btSobre(this)" onMouseOut="btFora(this)" id="celula"  onClick="createLink(2);setFocus();//createLink2();setFocus();"></td>
	 <td height="22" onMouseOver="btSobre(this)" onMouseOut="btFora(this)" id="celula13"><img src="imagens/linklink.gif" alt="Adicionar link para outro link nesta p&aacute;gina" name="button" width="22" height="22" onMouseOver="btSobre(this)" onMouseOut="btFora(this)" id="celula"  onClick="createLink(3);setFocus();//createLink4();setFocus();"></td>
	 <td height="22" onMouseOver="btSobre(this)" onMouseOut="btFora(this)" id="celula18"><img src="imagens/janela.gif" alt="Adicionar link para Janela" width="22" height="22" onClick="MenuLinks('<%= id_grupo %>');setFocus();" onMouseOver="btSobre(this)" onMouseOut="btFora(this)" id="celula"></td>
	 <td height="22" onMouseOver="btSobre(this)" onMouseOut="btFora(this)" id="celula14"><img src="imagens/sistema/wed_wimg.gif" alt="Imagem" name="button" width="22" height="22" onMouseOver="btSobre(this)" onMouseOut="btFora(this)" id="celula"  onClick="inseririmg2('admimagens/janela_principal.asp?cliente=<%= cliente %>');setFocus();"></td>
	      <td height="22" onMouseOver="btSobre(this)" onMouseOut="btFora(this)" id="celula15"><img src="imagens/sistema/table_high.gif" width="22" height="22" onMouseOver="btSobre(this)" onMouseOut="btFora(this)" id="celula" onClick="MenuOpcoes('TABLE', 250, 200, true);" alt="Tabela"></td>
	 <td height="22" onMouseOver="btSobre(this)" onMouseOut="btFora(this)" id="celula16"> 
	  <img src="imagens/sistema/cordaletra.gif" width="22" height="22" onMouseOver="btSobre(this)" onMouseOut="btFora(this)" id="celula" onClick="janelacores();" alt="Escolha a Cor"></td>
	 <td height="22" onMouseOver="btSobre(this)" onMouseOut="btFora(this)" id="celula17"><img src="imagens/sistema/wed_back.gif" width="22" height="22" onMouseOver="btSobre(this)" onMouseOut="btFora(this)" id="celula" onClick="fundo_cor()" alt="Alterar cor de fundo"></td>
	 <td onMouseOver="btSobre(this)" onMouseOut="btFora(this)" id="celula17"><img src="imagens/css.gif" alt="Alterar Estilo Visual (CSS)" width="22" height="22" onClick="colocarEstilo('');"></td>
	 <td onMouseOver="btSobre(this)" onMouseOut="btFora(this)" id="celula17"><img src="imagens/propriedades.gif" alt="Alterar Propriedades" width="22" height="22" onClick="propriedades();"></td>
	      <td><a href="#" onClick="inseriranexo()"><font color="#006600" size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Inserir 
            Componente </strong></font></a> <a href="#" onClick="verHTML()"><font color="#0066CC" size="1" face="Verdana, Arial, Helvetica, sans-serif"><strong>&lt;&gt;</strong></font></a></td>
	</tr>
   </table>
   
   
  </TD>
  </TR>
  <TR> 
    
  <TD noWrap><a href="#" onClick="InsereColunaTb(-1)"> </a> 
   <input name="menu_lateral" type="button" class="subtitulo" id="menu_lateral" style="WIDTH: 250px" onClick="InsertPage('MENUESQUERDA','<%= endereco_virtual %>menu_lateral.asp?cliente=<%= cliente %>&id=<%= id_grupo %>','left', 160, 600);" value="Menu Lateral &agrave; Esquerda"> 
      <input name="menu_lateral2" type="button" class="subtitulo" id="menu_lateral2" style="WIDTH: 250px" onClick="InsertPage('MENUESQUERDA','<%= endereco_virtual %>menu_lateral.asp?cliente=<%= cliente %>&id=<%= id_grupo %>','right', 160, 600);" value="Menu Lateral &agrave; Direita"></TD>
  </TR>
</TABLE>
<IFRAME ID=textEdit WIDTH="100%" HEIGHT="100" OnLoad="MudarTamanho()" OnChange="mostraMenu('')"> </IFRAME><input name="Fundo" type="text"  value="#f0f0f0" size="100" style="display: none">
<TABLE width="100%" ONCLICK="setFocus()" ID=editbar2>
 <TR>
  <TD noWrap> <INPUT ID=mW TYPE="radio" CHECKED NAME=rMode OnClick="setMode(true);"> 
   <LABEL class="current" ID=modeA for=mW>Modo HTML</LABEL> <INPUT ID=mH TYPE="radio" NAME=rMode OnClick="setMode(false);"> 
   <LABEL ID=modeB for=mH>Modo Texto</LABEL> </TD>
 </TR>
</TABLE>
 <OBJECT id=dlgHelper CLASSID="clsid:3050f819-98b5-11cf-bb82-00aa00bdce0b" width="0px" height="0px"></OBJECT>
</BODY>
</HTML>
<!-- Dúvidas: viasulnet@viasulnet.com.br --><!-- #include file="../fechaconexoes.asp" -->
