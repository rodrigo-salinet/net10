<html>
<head>
<title>Dicas para que a p&aacute;gina fique mais r&aacute;pida</title>
<script>
function retorna(valor)
{
	if(valor==true){
		window.returnValue = "naomostrar";
	}
	else{
		window.returnValue = "mostrar";
	}
}
function mostra()
{
	if(window.dialogArguments=="naomostrar")
	{
		document.all.naomostrar.checked=true;
	}
}
</script>
</head>
<body bgcolor="#c0c0c0" onLoad="mostra()"><fieldset>
<legend><font size="2" face="Arial, Helvetica, sans-serif">Dicas</font></legend>
<font size="2" face="Arial, Helvetica, sans-serif"> 
<ol>
  <p align="right"><font size="1" face="Arial, Helvetica, sans-serif"> 
    <input name="naomostrar" type="checkbox" id="naomostrar" value="naomostrar" onClick="retorna(this.checked)">
    N&atilde;o mostrar esta p&aacute;gina automaticamente</font></p>
  <li><font size="2" face="Arial, Helvetica, sans-serif"> Para copiar texto de arquivos do MS Word (ou 
    qualquer outro aplicativo MS Office), primeiro salve o arquivo para a web.<br>
    <br>
    Existe uma atualiza&ccedil;&atilde;o no site da Microsoft que permite que 
    se salve arquivos do Office 2000 para Web com tamanho ainda menor. Para isso, 
    primeiro baixe e instale a atualiza&ccedil;&atilde;o que est&aacute; no link 
    abaixo:<br>
    <br>
    <a href="http://download.microsoft.com/download/office2000pro/msohtmf2/1/WIN98/PT-BR/msohtmf2.exe">http://download.microsoft.com/download/office2000pro/msohtmf2/1/WIN98/PT-BR/msohtmf2.exe</a><br>
    <br>
    Pronto! Quando for exportar o arquivo do Office (Word, Excel, etc), clique 
    em &quot;Exportar para&quot; - &quot;HTML Compacto&quot;<br>
    Como na figura abaixo:<br>
    <br>
    <img src="imagens/Word_em_html.gif" width="439" height="531"></font></li>
</ol>
</font> 
<div align="center">
  <input type="button" name="Submit" value="        OK        " onClick="window.close()">
</div>
</fieldset></html>