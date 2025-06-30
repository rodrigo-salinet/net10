<!--
function propriedades(){
	if(textEdit.document.selection.type == "Control"){
		var tag = textEdit.document.selection.createRange().item(textEdit.document.selection);
	}
	else{
		var rang = textEdit.document.selection.createRange()
		var tag = rang.parentElement();
	}
	
	if(tag.tagName!="BODY"){
		for(propriedade in tag)	{
			Propriedades = Propriedades + propriedade + ": " + tag[propriedade]
		}
		t = window.showModalDialog("propriedades.asp", tag);
		alert(t);
	}


}

function conteudo(titulo, atual, largura, altura)
{
	return window.showModalDialog('conteudo.asp?titulo='+titulo+'&cliente='+cliente, atual,'dialogWidth='+largura+'px; dialogHeight='+altura+'px');
}

function verHTML()
{
	if(textEdit.document.selection.type == "Control"){
		var tag = textEdit.document.selection.createRange().item(textEdit.document.selection);
	}
	else{
		var rang = textEdit.document.selection.createRange()
		var tag = rang.parentElement();
	}
	if(tag.tagName!="BODY")
	{
		var html = conteudo('Propriedades da tag: ' + tag.tagName, tag.outerHTML, '550', '250');//prompt(tag.tagName,tag.outerHTML);
		if(html != null)
			tag.outerHTML = html;
	}


}
function aplicaEstilo(estilo)
{
	//alert(cliente)
	if(estilo=="")
	{
		var estilo = window.showModalDialog("estilos.asp?cliente="+cliente)//prompt("Nome do Estilo")
		if(estilo!='cancelar')
			estilo = "../clientes/"+cliente+"/estilos/" + estilo;
	}
	
	if(estilo!='cancelar')
	{
		removeEstilo()
		textEdit.window.document.createStyleSheet(estilo)
	}
	parent.parent.document.all.estilo.value = estilo;
}

function removeEstilo()
{
	var aa
	var a = 0
	//var i = 0
	conta = 0
	for(i in textEdit.window.document.styleSheets)
	{
		if (conta > 0)
		textEdit.window.document.styleSheets[i].disabled=true;
		conta++;
	}
//	parent.parent.document.all.estilo.value = "";
}


function mostraBordas()
{
	objeto = textEdit.window.document.body.children
	for(tabela in objeto)
	{	
		//atabela = textEdit.window.document[tabela];
		valor = valor + tabela + ': ' + [objeto][tabela] + '<br>'
	//	if(atabela.tag=="TABLE")
		//{
			//atabela.style.border='1'
		//}
	}
	textEdit.document.selection.createRange().pasteHTML(valor)
}

function colocarEstilo(estilo)
{
	if(textEdit.document.selection.type == "Control"){
		var tag = textEdit.document.selection.createRange().item(textEdit.document.selection);
		
	}
	else{
		var rang = textEdit.document.selection.createRange()
		var tag = rang.parentElement();//.innerHTML;
		//alert(tag)
		//rang.pasteHTML('<span style="' + estilo + '">'+ tag +'</span>')
	}
	if(estilo=="")
		var estilo = prompt("Digite o estilo: ", tag.style.cssText)
	if(estilo!=null)
		tag.style.cssText = estilo;
}

function MenuOpcoes(objeto, tamx, tamy, verifica)
{
		if(textEdit.document.selection.type == "Control"){
			var tag = textEdit.document.selection.createRange().item(textEdit.document.selection);
		}
		else{
			var tag = getEl(objeto,textEdit.document.selection.createRange().parentElement());
		}
		variaveis = 'MenuOpcoes.asp?objeto='+objeto+'&tag='+tag+'&cliente='+cliente
		valor = window.showModalDialog(variaveis,'','dialogWidth:'+tamx+'px;dialogHeight:'+tamy+'px;center:yes;help:no;resizable:yes;status:no;scroll:no');
		window.execScript(valor);
}


function colocaratributo(nome,valor){
	var tag = textEdit.document.selection.createRange().parentElement()// getEl("", );
	alert(tag.style.value)
//	tag.setAttribute("style.size", "22")
	//tag.setAttribute(nome,valor)
}
function Propriedades(objeto)
{
	if (format!="HTML"){
		displayError()
		return
	}
	else
	{
	
		if(textEdit.document.selection.type == "Control"){
			var tag = textEdit.document.selection.createRange().item(textEdit.document.selection);
		}
		else{
			var tag = getEl(objeto, textEdit.document.selection.createRange().parentElement());
		}
		if(tag!=null)
		{
			variaveis = 'tabela.asp?cliente='+cliente+'&tipo=' + objeto
			variaveis = variaveis + "&tag_border=" + escape(tag.border)
			variaveis += "&tag_padding=" + escape(tag.cellPadding) 
			variaveis += "&tag_spacing=" + escape(tag.cellSpacing)  
			variaveis += "&tag_width=" + escape(tag.width)  
			variaveis += "&tag_height=" + escape(tag.height)  
			variaveis += "&tag_align=" + escape(tag.align)  
			variaveis += "&tag_vAlign=" + escape(tag.vAlign);
			variaveis += "&tag_borderColor=" + escape(tag.borderColor)  
			variaveis += "&tag_bgColor=" + escape(tag.bgColor)  
			variaveis += "&tag_background=" + escape(tag.background);
			janelatag = window.showModalDialog(variaveis,'','dialogWidth:280px;dialogHeight:400px;center:yes;help:no;resizable:yes;status:no;scroll:no');
			if(janelatag!=null)
			{
				tag.clearAttributes();

				tag.width=janelatag["tag_width"].value;
				tag.height=janelatag["tag_height"].value;
				tag.align=janelatag["tag_align"].value;
				tag.vAlign=janelatag["tag_vAlign"].value;
				tag.border=janelatag["tag_border"].value;
				tag.cellPadding=janelatag["tag_padding"].value;
				tag.cellSpacing=janelatag["tag_spacing"].value;
				tag.borderColor=janelatag["tag_borderColor"].value;
				tag.bgColor=janelatag["tag_bgColor"].value;
				tag.background=janelatag["tag_background"].value;
			}
		}
	}
	
}

function PropriedadesTabela()
{
	if (format!="HTML"){
		displayError()
		return
	}
	else
	{
		var tabela = getEl("TABLE",textEdit.document.selection.createRange().parentElement());
		if(tabela!=null)
		{
			variaveis = 'tabela.asp?tipo=tabela&cliente='+cliente
			var estilo;
			for(estil in tabela.currentStyle)
				estilo=estilo+estil+escape(tabela.currentStyle[estil])+';';
			
			variaveis = variaveis + "&tag_border=" + escape(tabela.border) + "&tag_padding=" + escape(tabela.cellPadding) + "&tag_spacing=" + escape(tabela.cellSpacing) + "&tag_width=" + escape(tabela.width) + "&tag_align=" + escape(tabela.align) + "&tag_bgColor=" + escape(tabela.bgColor) + "&tag_background=" + escape(tabela.background) + "&tag_style=" + estilo;
			janelatbl = window.showModalDialog(variaveis,'','dialogWidth:280px;dialogHeight:400px;center:yes;help:no;resizable:yes;status:no;scroll:no');
			if(janelatbl!=null)
			{
				tabela.width=janelatbl["tag_width"].value;
				tabela.align=janelatbl["tag_align"].value;
				tabela.border=janelatbl["tag_border"].value;
				tabela.cellPadding=janelatbl["tag_padding"].value;
				tabela.cellSpacing=janelatbl["tag_spacing"].value;
				tabela.bgColor=janelatbl["tag_bgColor"].value;
				tabela.background=janelatbl["tag_background"].value;
			}
		}
	}
}
function PropriedadesCelula()
{
	if (format!="HTML"){
		displayError()
		return
	}
	else
	{
		var celula = getEl("TD",textEdit.document.selection.createRange().parentElement());
		if(celula!=null)
		{
			variaveis = 'tabela.asp?tipo=celula&cliente='+cliente
			variaveis = variaveis + "&tag_border=" + escape(celula.border) + "&tag_padding=" + escape(celula.cellPadding) + "&tag_spacing=" + escape(celula.cellSpacing) + "&tag_width=" + escape(celula.width) + "&tag_align=" + escape(celula.align) + "&tag_bgColor=" + escape(celula.bgColor) + "&tag_background=" + escape(celula.background);
			janelacell = window.showModalDialog(variaveis,'','dialogWidth:280px;dialogHeight:450px;center:yes;help:no;resizable:yes;status:no;scroll:no');
			if(janelacell!=null)
			{
				celula.width=janelacell["tag_width"].value;
				celula.align=janelacell["tag_align"].value;
				celula.vAlign=janelacell["tag_vAlign"].value;
				celula.border=janelacell["tag_border"].value;
				celula.cellPadding=janelacell["tag_padding"].value;
				celula.cellSpacing=janelacell["tag_spacing"].value;
				celula.bgColor=janelacell["tag_bgColor"].value;
				celula.background=janelacell["tag_background"].value;
			}
		}
	}
}


function InsereLinhaTb(local) {
	if (format!="HTML"){
        displayError()
        return
	}else{
          var tabela = getEl("TABLE",textEdit.document.selection.createRange().parentElement());
		  if(tabela!=null)
		  {
			  var linhaAnterior = getEl("TR",textEdit.document.selection.createRange().parentElement());
			  if(local=='')
			  	local = linhaAnterior.rowIndex;
				
			  var linha = tabela.insertRow(local);
			  var conta = 0;
			  for(celulas in linhaAnterior.cells)
			  {
				  if(conta!=0)
					  linha.insertCell()
				  conta++;
			  }
		  }
	}
}
function ExcluiLinhaTb(local) {
	if (format!="HTML"){
        displayError()
        return
	}else{
          var tabela = getEl("TABLE",textEdit.document.selection.createRange().parentElement());
		  var linha = getEl("TR",textEdit.document.selection.createRange().parentElement());
		  if(tabela!=null)
		  {
		  	if(local=='')
				local = linha.rowIndex
				
			  tabela.deleteRow(local)
		  }
	}
}

function InsereColunaTb(local) {
	if (format!="HTML"){
        displayError()
        return
	}else{
          var tabela = getEl("TABLE",textEdit.document.selection.createRange().parentElement());
		  var coluna = getEl("TD",textEdit.document.selection.createRange().parentElement());
		  if(tabela!=null)
		  {
		  if(local=='')
		  	local = coluna.cellIndex;
			
			  for(linha in tabela.rows)
			  {
			  if(linha!="length")
				tabela.rows[linha].insertCell(local);
			  }
		  }
	}
}
function ExcluiColunaTb(local) {
	if (format!="HTML"){
        displayError()
        return
	}else{
          var tabela = getEl("TABLE",textEdit.document.selection.createRange().parentElement());
		  var linha = getEl("TR",textEdit.document.selection.createRange().parentElement());
		  var coluna = getEl("TD",textEdit.document.selection.createRange().parentElement());
		  if(tabela!=null)
		  {
		  if(local=='')
		   local = coluna.cellIndex;
		   
		  	for(var i=0; i<tabela.rows.length; i++)
			  tabela.rows[i].deleteCell(local)
		  }
	}
}

function fundo_2()
{
	janelacor = callColorDlg();
	if(janelacor!=null){
		doFormat('BackColor',janelacor);
		setFocus();
	}
}

function fundo_inicial()
{
	textEdit.document.body.bgColor = parent.parent.document.all.Fundo.value;
	textEdit.document.body.background = parent.parent.document.all.fundo_imagem.value;
}

function mudafundo(tipo){
	if(tipo=="cor"){
		ofundo = callColorDlg(textEdit.document.body.bgColor);
		parent.parent.document.all.Fundo.value = ofundo;
		textEdit.document.body.bgColor=ofundo;
	}
	else{
		aimagem = janelaimg('admimagens/janela_principal.asp?cliente='+cliente);
//		posicao = janelaposicao();
		parent.parent.document.all.fundo_imagem.value = aimagem;
		textEdit.document.body.background = aimagem;
	}
}

function janelaimg(caminho){
	
	janelaimagens = window.showModalDialog(caminho,'','dialogWidth:650px; dialogHeight:400px; center:yes; help:no; resizable:yes; status:yes; scroll:no;');
	return janelaimagens;
}

function janelaposicao()
{
	janela = window.showModalDialog('Posicionamento.asp?cliente='+cliente, '', 'dialogWidth:250px; dialogHeight:170px; center:yes; help:no; resizable:yes; status:no; scroll:no;')
}

function cores(){
	janelacor = window.showModalDialog('cores.htm','','dialogWidth:400px;dialogHeight:400px;center:yes;help:no;resizable:yes;status:no;scroll:no');
	if(janelacor['col']!=null){return janelacor['col'];}else{return ""}
}


function janelaalinha()
{
	alinha = window.showModalDialog('Admimagens/Alinhamento.asp?cliente='+cliente,'','dialogWidth:180px; dialogHeight:0.5px; center:yes; help:no; resizable:no; status:no; scroll:no;');
	return alinha;
}

function edita_menu(pagina)
{
	janela = window.open(pagina,'_blank')

}

function btSobre(celula)
	{
	celula.borderColor = "#666666";
	}
function btFora(celula)
	{
	celula.borderColor = "";
	}


function janelacores(){
		janelacor = callColorDlg();
		if(janelacor!=null)
		doFormat('forecolor',janelacor);
		setFocus();
}


function fundo_cor()
{
		janelacor = callColorDlg();
		if(janelacor!=null)
		doFormat('BackColor',janelacor);
		doFormat('bgColor',janelacor);
		setFocus();
}

function janelatabela(){
	if (format!="HTML"){
        displayError()
        return
	}else{
		janelatbl = window.showModalDialog('tabela.asp?cliente='+cliente,'','dialogWidth:280px;dialogHeight:400px;center:yes;help:no;resizable:yes;status:no;scroll:no');
		if(janelatbl){
          var sel=textEdit.document.selection.createRange()
          sel.pasteHTML(janelatbl)
          sel.select()
		}
	}
}





    // O formato default é WYSIWYG HTML.
    var format="HTML";
    var bMode=true;
    // Exportando funções.
    var public_description = new public_description_nt;
	
	
    function public_description_nt() {  
      this.put_html=put_html;
      this.get_html=get_html;
      this.bReady = false
    }
	
	
    // Função de limpeza do código fonte.
    function cleanupHTML() {
      bodyTags=textEdit.document.body.all
      for (i=bodyTags.tags("FONT").length-1;i >= 0;i--)
        if (bodyTags.tags("FONT")[i].style.backgroundColor="#ffffff") {
          bodyTags.tags("FONT")[i].style.backgroundColor=""
          if (bodyTags.tags("FONT")[i].outerHTML.substring(0,6)=="<FONT>")
            bodyTags.tags("FONT")[i].outerHTML=bodyTags.tags("FONT")[i].innerHTML
        }
    }
	
	
    // Função que retorna o texto digitado e formatado.
    // Será chamada no evento OnSubmit do Form.
    function get_html() {
      if (format=="HTML") {
        cleanupHTML()
        return textEdit.document.body.innerHTML
      }
      else
        return textEdit.document.body.innerText
    }
	
	
    // Função que coloca um texto no editor.
    function put_html(v) {
      if (format=="HTML")
        textEdit.document.body.innerHTML=v
      else
        textEdit.document.body.innerText=v
    } 
	
	
    // Inicializa o editor com um documento em branco.
    function initEditor() {
      textEdit.document.designMode="On"
      textEdit.document.open()
      textEdit.document.write("")
      textEdit.document.close()
      textEdit.focus()
	  var aa;
	  var a;
//	  for(a in textEdit.window.document)
	 // {
	  	//aa = aa + a + ': ' + textEdit.window.document[a] + ' - ';
	//  }
	  //alert(aa + ' !')
      MudarTamanho()
    }
	
	
    // Executa um comando no editor.
    // Pelo menos um argumento é requerido. Alguns comandos
    // requerem um segundo argumento opicional:
    // ex., ("formatblock","<H1>") para colocar uma marca <H1>.
	function doFormat(command) {
      if (format!="HTML") {
        displayError()
        return
      }
      if (format=="HTML") {
        if (arguments[1]=="CustomFont") {
     	  arguments[1] = prompt("Com qual fonte você deseja formatar o texto?","Verdana, Arial, Helvetica, sans-serif")
	    }
        if ((arguments[1]=="") && (arguments[0]=="forecolor")) {
          arguments[1] = prompt("Qual a cor (ou código hexadecimal) que você deseja?\n(Em Inglês)","Black")
        }
        var edit = textEdit.document.selection.createRange()
        if (arguments[1]==null)
          edit.execCommand(command)

        else
          edit.execCommand(command, false, arguments[1])

        edit.select()
        textEdit.focus()
      }
    }	
	
    // Função para criação de links.	
	function inseririmg(caminho){
	tam_w = document.body.offsetWidth;
	tam_h = document.body.offsetHeight;
	janela = window.showModalDialog(caminho, "", "dialogWidth="+tam_w+"; dialogHeight="+tam_h+"; scrollbars=auto, top=0, left=0");
	}

    function inseririmg2(caminho, strNome) {
      if (format!="HTML") {
        displayError()
        return
      }
    var isA = getEl("IMG",textEdit.document.selection.createRange().parentElement())
	var tam_w = document.body.offsetWidth;
	var tam_h = document.body.offsetHeight;
	str = janelaimg(caminho);
      if ((str!=null) && (str!="http://")) {
        if ((textEdit.document.selection.type=="None") && (!isA)) {
          var sel=textEdit.document.selection.createRange()
          sel.pasteHTML("<IMG border='0' src=\""+str+"\" align=\""+janelaalinha()+"\">")
          sel.select()
        }
        else
          doFormat("CreateLink",str)
      }
      else
        textEdit.focus()
    }
	
    function inserirmenu(str, pos) {
      if (format!="HTML") {
        displayError()
        return
      }
      if ((str!=null) && (str!="http://")) {
	  textEdit.focus()
          var sel=textEdit.document.selection.createRange()
 
	}
      else
        textEdit.focus()
    }


	function inseriranexo()
	{
		abre = window.showModalDialog("inseriranexo01.asp?cliente="+cliente, "", "dialogWidth: 250px; dialogHeight: 300px");
		if(abre!=null){
		InsertPage(abre[0], abre[1], abre[2], abre[3], abre[4]);
		}
	}
	

	function InsertPage(ID, URL, alinhamento, tx, ty)
	{
	  if(textEdit.document.all[ID]== null)
	  {
		  doFormat("InsertIFrame", ID)
	
		  b = textEdit.document.all;
		  b[ID].frameborder="0";
		  b[ID].hspace="0";
		  b[ID].marginheight="0";
		  b[ID].marginwidth="0";
		  b[ID].width=tx;
		  b[ID].height=ty;
		  b[ID].scrolling="no";
		  b[ID].vspace="0";
		  b[ID].src = URL;
		  b[ID].allowTransparency="true";
		  b[ID].atomicSelection="true";
			  
		  if(alinhamento != "")
		  {
			b[ID].align = alinhamento;
		  }
		  setMode(false);
		  setMode(true);
		  textEdit.focus();
		}
	}




	
	
    function getEl(sTag,start) {
      while ((start!=null) && (start.tagName!=sTag))
        start = start.parentElement
      return start
    }
    function getEl2(sTag,start) {
      while ((start!=null) && (start.tagName!=sTag))
        start = start.parentElement
      return start
    }
	

	function seleciona()
	{
		var sel = textEdit.document.selection.createRange();
		sel.focus();
		
	}
	

	
    // Coloca o foco no editor.
    function setFocus() {
//		var sel = textEdit.document.selection.createRange();
      textEdit.focus();
    }
	
	
    // Função que ajusta o editor na tela.
    function MudarTamanho() {
		document.all.textEdit.height = document.body.offsetHeight - (document.all.editbar.offsetHeight + document.all.editbar2.offsetHeight + document.all.editbar2.offsetHeight); 
		textEdit.document.innerHTML='';
		textEdit.document.innerHTML=parent.parent.document.all.Mensagem.value;
    }
	
	
    // Muda entre os modos WYSIWYG HTML e Texto (fonte do HTML).
    function setMode(bNewMode) {
      if (bNewMode!=bMode) {
        if (bNewMode) {
          textEdit.document.body.innerHTML = textEdit.document.body.innerText;
          format="HTML";
        }
        else {
          cleanupHTML()
          textEdit.document.body.innerText = textEdit.document.body.innerHTML;
          format="Texto";
        }
        bMode=bNewMode
      }
      modeA.className=bMode?"current":"";
      modeB.className=bMode?"":"current";
      textEdit.focus()
      //var s = textEdit.document.body.createTextRange()
    //  s.collapse(false)
     // s.select()
    }
	
	
    // Função que dispara um erro caso o editor esteja
    // em modo Texto e o usuário tente inserir uma marca
    // HTML.
    function displayError() {
      alert("A barra de formatação deve ser utilizada no modo HTML");
      textEdit.focus()
    }
	
	
    window.onload = initEditor





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
function limpaHTML(){
textEdit.document.body.clearAttributes();
}

// -->
