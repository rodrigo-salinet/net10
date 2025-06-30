<!--
var cliente;

function MenuLinks(idgrupo)
{
	if(textEdit.document.selection.type == "Control"){
		var sel=textEdit.document.selection.createRange().item(textEdit.document.selection);
		var linke = getEl("A",sel)//sel;
		var texto = sel.outerHTML;
		var colar = false;
		var nome = textEdit.document.selection.src;
	}
	else
	{
		var sel = textEdit.document.selection.createRange()
		var linke = getEl("A",sel.parentElement()) // sel.parentElement();
		var texto = sel.text;
		var colar = true;
	}
	var endereco;
	var clicar;
	if(linke!=null)
		clicar = linke.onclick;
		
		propriedades = new Array;
		if(clicar!=null)
		{
			sobre = clicar.split("'");
			endereco = sobre[1];
			propriedades = sobre[5];
			propriedades = propriedades.split(",")
		}
		argumentos = new Array;
		argumentos[0] = idgrupo;
		argumentos["href"] = endereco;
		argumentos["propriedades"] = propriedades;
		//for(a in argumentos)
		//	alert(a+': '+argumentos[a])
		FormularioLinks = window.showModalDialog('MenuLinks.asp?cliente='+cliente,argumentos,'dialogWidth:400px;dialogHeight:230px;center:yes;help:no;resizable:yes;status:no;scroll:no');
		if(FormularioLinks!=null)
		{
	
		  if(colar)
		  {
			  if(texto=="")
				  texto = prompt("Qual o texto do link?", "texto");
			  olink = "<a name=\"" + texto + "\" href=\""+ FormularioLinks[2] +"#"+ texto +"\" onClick=\"javascript:window.open('" + FormularioLinks[0] + "', '_blank', '" + FormularioLinks[1] + "')\">" + texto + "</a>"
			  sel.pasteHTML(olink);
			  sel.select();
		  }
		  else
		  {
			  olink = "<a name=\"" + nome + "\" href=\""+ FormularioLinks[2] +"#" + nome +"\" onClick=\"javascript:window.open('" + FormularioLinks[0] + "', '_blank', '" + FormularioLinks[1] + "')\">" + sel.outerHTML + "</a>"
			  sel.outerHTML = olink;
		  }
		}
}

function janelaabreem()
{
	valor = window.showModalDialog('LINK_ABRE_EM.ASP?cliente='+cliente, '', 'center:yes;dialogWidth:200px;dialogHeight:45px;status:no')
	return valor;
}

//Cria link para outra página

function createLink(numero) {
	if(textEdit.document.selection.type != "Control")
	{
		var isA = getEl("A",textEdit.document.selection.createRange().parentElement())
	}
	
	if (format!="HTML") {
		displayError()
		return
	}
  
	if(numero==1)
	{
		var str = prompt("Para qual URL você quer criar o link? (ex.: http:\/\/www.nome.com.br\/)",isA ? isA.href : "http:\/\/")
		if(str!=null)
			var target = janelaabreem();//prompt("Abrir em:\n(_blank, _self, _parent ou nome da janela)")
		
		if(textEdit.document.selection.type == "Control"){
			var selection=textEdit.document.selection.createRange().item(textEdit.document.selection);
			selection.outerHTML="<a href=\""+str+"\" target=\""+target+"\">" + selection.outerHTML + "</a>";
		}
		else
		{
			texto = textEdit.document.selection.createRange().htmlText

			var isA = getEl("A",textEdit.document.selection.createRange().parentElement())
			if ((str!=null) && (str!="http://")) 
			{
				strNome = texto//textEdit.document.selection.createRange().parentElement.text;
				if(strNome==""){
					var strNome=prompt("Qual texto você quer para o link?",isA ? isA.href : "texto")
				}
				var sel=textEdit.document.selection.createRange()
				sel.pasteHTML("<A NAME=\"" + strNome + "\" ID=\"" + strNome + "\" target=\"" + target + "\" HREF=\""+str+"\">"+strNome+"</A>")
				sel.select()
			}
			else
				textEdit.focus()
		}
	}	  
  
  
  
	else if(numero==2)
	{
		if (format!="HTML") {
			displayError()
			return
		}
		
		var str = window.showModalDialog("crialink01.asp?cliente="+cliente, "", "center:yes; dialogWidth:30; dialogHeight:15; scrollbars=no")
		
		
		if(textEdit.document.selection.type == "Control"){
		
			var sel=textEdit.document.selection.createRange().item(textEdit.document.selection);
			
			if ((str!=null) && (str!="http://")) {
//			var isA = getEl("A",sel.parentElement())
				var target = janelaabreem();
				sel.outerHTML="<a href=\""+str+"\" target=\""+target+"\">" + sel.outerHTML + "</a>";
		//		sel.select()
			}
			else
				textEdit.focus()
				
		}
		else{
		
			var sel=textEdit.document.selection.createRange();
			var isA = getEl("A",sel.parentElement())
			if ((str!=null) && (str!="http://")) {
				if ((textEdit.document.selection.type=="") && (!isA)) {
					var strNome=prompt("Que texto você quer que seja o link?",isA ? isA.href : "texto");
					var target = janelaabreem();
					sel.pasteHTML("<A NAME=\"" + strNome + "\" TARGET=\"" + target + "\" ID=\"" + strNome + "\" HREF=\""+str+"\">"+strNome+"</A> ")
					sel.select()
				}
				else
					doFormat("CreateLink",str)
				}
			else
				textEdit.focus()
		}
		
	}
	  
	  
	  
	  
	  
	  
	  
	  else if(numero==3)
	  {
	  
		  if (format!="HTML") {
			displayError()
			return
		  }
			  var todos_links;
			  var todo = textEdit.document.all;
			  var isA = getEl("A",textEdit.document.selection.createRange().parentElement());
			  for(l in todo)
			  {
				  var e = e + " = "+l
				  if(Number(l)!=l){
				  todos_links = todos_links + "&link=" +  l
			  }
		  }
		  var str = window.showModalDialog("crialink02.asp?cliente="+cliente+"&id_grupo=" + grupo_atual + "&link=" + todos_links, "", "center:yes;");
		  if ((str!=null) && (str!="http://")) {
//			if ((textEdit.document.selection.type=="None") && (!isA)) {
//			  alert("teste")
			  var strNome = textEdit.document.selection.createRange().text
			  if (strNome == "")
				  strNome = prompt("Que texto você quer que seja o link?",isA ? isA.href : "texto")

			  var sel=textEdit.document.selection.createRange()
			  sel.pasteHTML("<A HREF=\""+str+"\" name=\"" + strNome + "\" id=\"" + strNome + "\">"+strNome+"</A> ")
			  sel.select()
//			}
//			else
//			  doFormat("CreateLink(3)",str)
		  }
		  else
			textEdit.focus()
 	
	  }
	  
	}
	
function janela_itens()
{
  var str = window.showModalDialog("crialink01.asp?cliente="+cliente, "", "center:yes; dialogWidth:30; dialogHeight:15; scrollbars=no")
  return str;
}
	
// -->
