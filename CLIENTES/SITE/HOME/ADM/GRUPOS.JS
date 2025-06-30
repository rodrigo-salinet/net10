
<!--

function dicas(mostra)
{
	mostrardicas = window.showModalDialog("dicas.asp", mostra, "dialogWidth=600px; dialogHeight=500px")
	if(mostrardicas!=null){
		document.all.mostradicas.value = mostrardicas
	}
}

	function cabecalho(atual)
	{
		var valor = new String(window.showModalDialog('conteudo.asp?cliente='+cliente, atual,'dialogWidth=550px; dialogHeight=250px'));
		if((valor != "undefined") && (valor!=null) && (valor!=""))
		{
			if(valor =="")
			valor = " "
			
			form1.Head.value = valor;
		}
	}

	function subgrupo(id_nivel)
	{
		var valores = window.showModalDialog('SubGrupo.asp?cliente='+cliente+'&id='+id_nivel, '', 'center:yes; help:no;');
		if((valores!=null))
		{
		  document.all.form1.subfam.value = valores['id_nivel'];
		  return valores['nome'];
		}
	}

  function ColocarTexto(f)
  {
  document.all.myEditor.html = f + " ";
  }
  function PegarTexto(f) {
    f.elements.Mensagem.value = document.all.myEditor.html + " ";
  }

  function Limpar() {
    document.all.myEditor.html = " ";
  }
    
  function abre()
  {
  	janela = window.open("imagens.asp?cliente="+cliente, "_blank", "scrollbars=yes, left=200, top=20, resizable=no, titlebar=no, alwaysRaised=yes")
  }
  
  function muda_fundo(cor)
  {
  	if(cor=="")
	{
    janelacor = window.showModalDialog('cores.htm','','dialogWidth:400px;dialogHeight:400px;center:yes;help:no;resizable:yes;status:no;scroll:no');
	form1.Fundo.value =janelacor['col'];
	bg.bgColor=  "#" + janelacor['col'];
	}
	else
	{
	form1.Fundo.value = cor;
	bg.bgColor=cor;
	}

  }
  
  function altera_fundo()
  {
	  if(confirm('Atenção, você perderá as alterações atuais!\nContinuar?'))
	//  {
		
	  //}
	  //else
	  {
		window.location= 'grupos.asp?cliente='+cliente+'&id_grupo=<%= id_grupo %>&fundo=' + form1.Fundo.value;
	  }
  }
  
function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);


function nome_imagem(caminho, mostra)
{
	if(caminho==true){
		cam = prompt('Nome:', caminho);
	}
	else{
		cam = caminho;
	}
	
	if(cam!=null)
	{
		imagens.innerHTML = "<img name='aimagem'>";
		document.all.aimagem.src=cam;
		document.all.imagem.value=cam;
	}
}
function colocaImagem(nomeImagem){
	document.form1.imagem.value=nomeImagem;
	if(nomeImagem!=null&&nomeImagem!=""){
		
	}
}

function janelaimg(){
	janelaimagens = window.showModalDialog('Admimagens/janela_principal.asp?cliente='+cliente,'','dialogWidth:650px; dialogHeight:400px; center:yes; help:no; resizable:yes; status:no; scroll:no;');
	return janelaimagens;
}
function carrega_img(campo){
	if(campo!=""){
	document.all[campo].value=janelaimg();
	}
}
  

// -->
