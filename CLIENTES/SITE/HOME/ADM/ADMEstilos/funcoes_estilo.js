
<!--


function carrega(sobre)
{
	muda_tabela(sobre+'tabela_body_background-color', document.all[sobre+'body_background-color'].value)
	muda_tabela(sobre+'tabela_td_color', document.all[sobre+'td_color'].value)
	muda_tabela(sobre+'tabela_td_background-color', document.all[sobre+'td_background-color'].value)
	muda_tabela(sobre+'tabela_table_border-color', document.all[sobre+'table_border-color'].value)
	muda_tabela(sobre+'tabela_input_color', document.all[sobre+'input_color'].value)
	muda_tabela(sobre+'tabela_input_background-color', document.all[sobre+'input_background-color'].value)

}

function visualiza()
{
	document.form1.target = '_blank';
	var anterior = document.form1.action;
	document.form1.action = anterior + '&visualizar=true';
	document.form1.submit();
	document.form1.action = anterior;
	document.form1.target = '_self';
}



function janelacores(){
	janelacor = window.showModalDialog('cores.htm','','dialogWidth:400px;dialogHeight:400px;center:yes;help:no;resizable:yes;status:no;scroll:no');
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

function esconde(id, arg)
{
	arg;
	if(arg=='sim')
	{
		document.all[id].style.visibility='hidden';
		for(a in document.all[id].all)
		{
		document.all[id].all[a].value='transparent';
		}
		arg = 'nao';
	}
	else
	{
		document.all[id].style.visibility='visible';
		arg = 'sim';
	}
}

function janelaimg(){
	janelaimagens = window.showModalDialog('../Admimagens/janela_principal.asp?cliente='+cliente,'','dialogWidth:650px; dialogHeight:400px; center:yes; help:no; resizable:yes; status:no; scroll:no;');
	return janelaimagens;
}
function carrega_img(campo){
	document.all[campo].value=janelaimg();
}
  
function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
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

function cor(nome, sobre){
	novacor = callColorDlg(document.all[nome].value);
	nome = sobre + nome;
	document.all[nome].value = '#' + novacor;
	document.all[sobre+'tabela_'+nome].bgColor = '#' + novacor;
}


// -->