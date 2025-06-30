<html>
<head>
<script language="JavaScript">

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

function retorna(){
	var tudo = "";
	var tudob = "";
	for(a in document.form1){
		tudo = tudo + a + ": " + document.form1[a] + " >> ";
//		for(b in document.form1[a]){
//			tudob = tudob + tudo + document.form1[a][b] ;
//		}
	}
	window.returnValue = tudob;
	alert(tudo);
//	window.close();
}

function subp(prop){
	var subprops = '';
	for(subprop in prop){
	//	alert(subprop)
//		alert(subprop + ' > ' + prop[subprop])
		subprops = subprops + subprop //+ ': ' + prop[subprop]
	}
	return subprops;
}


function muda(propriedade, valor){
	var novovalor = prompt("Digite um valor para " + propriedade, valor)
	document.all[propriedade].value=novovalor;
}


tag = window.dialogArguments;
var cor1 = "#000066";  //vazio
var cor2 = "#cc0000";  //object
var cor3 = "#0000cc";  //string

</script>
<title>Alterar <%= tipo %></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body bgcolor="#C0C0C0" leftmargin="0" topmargin="0" marginwidth="" marginheight="0" onLoad="window.open('#topo', '_self')">
<a name="topo"></a>
<form name="form1" unselectable="on">
 
 <hr size="1" noshad>
 <table width="100%" border="1" cellspacing="0" cellpadding="1" unselectable="on">
  </tr>
  <script>
function cria(tag){
	var i = 1;
	var strings = '<tr unselectable="on" colspan=3><td  unselectable="on" colspan=3><hr size="1" noshade height=1> <font size="2"><strong><font face="Verdana, Arial, Helvetica, sans-serif"> 	PROPRIEDADES </font></strong></font></td>';
	
	var strobjeto = '<tr unselectable="on" colspan=3><td  unselectable="on" colspan=3><hr size="1" noshade height=1> <font size="2"><strong><font face="Verdana, Arial, Helvetica, sans-serif"> 	OBJETOS </font></strong></font></td>';
	var iobjeto = 1;
	
	
	
	for(propriedade in tag){
		var valor = tag[propriedade];
	
		if(valor==""){
			cor = cor1;
		}
		else if(valor=="[object]"){
			cor = cor2;			
		}
		else{
			cor = cor3;
		}
		
		if(valor!='[object]'){
	
			if(i==1){
				strings = strings + '<tr unselectable="on">';
			}
			
					
			strings = strings + '<td unselectable="on"><font size="1" color="'+cor+'" face="Verdana, Arial, Helvetica, sans-serif"><u>'+propriedade+'</u></font>';
			strings = strings + '<br><input size="20" name="'+propriedade+'" value="'+tag[propriedade]+'"></td>';
		  
			if(i==3){
				i=0;
				strings = strings + '</tr>';
			}
			
			i++;
			
			
		}
		else{
			if(iobjeto==1){
				strobjeto = strobjeto + '<tr unselectable="on">';
			}
			
			strobjeto = strobjeto + '<td unselectable="on"><font size="1" color="'+cor+'" face="Verdana, Arial, Helvetica, sans-serif"><u onclick="muda(\''+propriedade+'\', \'' +tag[propriedade]+ '\')" >'+propriedade+'</u></font><input type="hidden" size="30" name="'+propriedade+'" value="'+tag[propriedade]+'"></td>';
		  
			if(iobjeto==3){
				iobjeto=0;
				strobjeto = strobjeto + '</tr>';
			}
			iobjeto++
		}

	}
	document.writeln(strings);
	document.writeln(strobjeto);
}
cria(tag)
</script>
  <tr unselectable="on"> 
   <td colspan="3" unselectable="on"><hr size="1" noshade>
	<table width="100%">
	 <tr align="center"> 
	  <td><strong><font size="1" face="Verdana, Arial, Helvetica, sans-serif" color="#0000CC"> 
	   - Normal</font></strong></td>
	  <td><strong><font size="1" face="Verdana, Arial, Helvetica, sans-serif" color="#000066"> 
	   - Vazio</font></strong></td>
	  <td><strong><font size="1" face="Verdana, Arial, Helvetica, sans-serif" color="#CC0000"> 
	   - Objeto</font></strong></td>
	 </tr>
	</table></td>
  </tr>
  <tr unselectable="on"> 
   <td colspan="3" unselectable="on"> <div align="center"> 
	 <input name="button" type="button" value=".:: Alterar  ::." onClick="retorna()">
	</div></td>
  </tr>
 </table>
</form>
 <OBJECT id=dlgHelper CLASSID="clsid:3050f819-98b5-11cf-bb82-00aa00bdce0b" width="0px" height="0px">
 </OBJECT>
</body>
</html>
