<!-- #include file="../conexao.asp" -->
<!-- #include file="conexao_adm.asp" -->

<!-- #include file="validasenha.asp" -->
<html>
<head>
<script>
var cliente="<%= cliente %>";
argumentos = window.dialogArguments;
function preenche()
{
	href = argumentos["href"]
	if(href=='undefined'||href==null)
		href = 'http://';
	document.all.href.value = href;
	propriedades = argumentos["propriedades"];
	propriedades = propriedades.toString();
	propriedades = propriedades.split(", ");
	var i = 0;
	
	for(i; i<propriedades.length; i++)
	{
		propriedade = propriedades[i];
		prop = propriedade.split("=");
		nome = prop[0];
		valor = prop[1];
		if(valor==null)
			valor = "";
			
		if((nome!=" ") && (nome!="") && (document.all[nome]!= null))
		{
			document.all[nome].value=valor;
		}
	}


}

function retorna(valor)
{
	var resultado = new Array();
	resultado[1] = "";
	for(var v=0; v<valor; v++)
	{
		if(document.form1[v].name!="undefined" && document.form1[v].value!="undefined")
		{
			if(document.form1[v].name=="href"){
				resultado[0] = document.form1[v].value;
			}
			else {
				resultado[1] = resultado[1] + document.form1[v].name + "=" + document.form1[v].value + ", "
			}
		}
	}
	id = argumentos[0];
	resultado[2] = "<%= endereco_virtual %>default.asp?id=" + id + "&cliente=<%= cliente %>";

	window.returnValue = resultado;
	window.close();
}	
function mostra(valor)
{
	for(v in valor)
	alert(v)
}
</script>
<title>Alterar <%= objeto %></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style type="text/css">
<!--
a {
	text-decoration: none;
}
-->
</style>
<SCRIPT LANGUAGE="JavaScript" src="crialink.js"></SCRIPT>
</script>

</head>

<body bgcolor="#C0C0C0" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onLoad="preenche()">
<form name="form1" method="post" action="">
 <table width="100%" height="100%" border="1" cellpadding="0" cellspacing="2" bordercolor="#000000" bgcolor="lightgrey" class="FontePequena">
  <tr> 
   <td valign="top" bordercolor="lightgrey"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Endere&ccedil;o:</strong></font> 
	<br>
	<table border="0" align="right" cellpadding="0" cellspacing="0">
	 <tr align="center" valign="middle" bordercolor="lightgrey"> 
	  <td height="22" id="celula13"><img src="imagens/link.gif" alt="Adicionar link para outro item" name="button" width="22" height="22" id="celula" onClick="javascript:document.all.href.value=janela_itens();"></td>
	 </tr>
	</table>
	<input name="href" type="text" id="href2" value="http://" size="50"> <table border="0" cellpadding="0" cellspacing="0">
	 <tr> 
	  <td align="right"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">Largura: 
	   </font></td>
	  <td> <input name="width" type="text" id="width" size="3"> &nbsp;&nbsp;</td>
	  <td align="right"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">Altura:</font></td>
	  <td><input name="height" type="text" id="height" size="3"></td>
	 </tr>
	 <tr> 
	  <td align="right"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">Esquerda:</font></td>
	  <td><input name="left" type="text" id="left" size="3"> &nbsp;&nbsp;</td>
	  <td align="right"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">Topo:</font></td>
	  <td> <input name="top" type="text" id="top" size="3"></td>
	 </tr>
	</table>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	 <tr> 
	  <td><table width="100%" border="0" cellpadding="0" cellspacing="0">
		<tr> 
		 <td><font size="2" face="Verdana, Arial, Helvetica, sans-serif"> 
		  <select name="location" id="location">
		   <option value="yes" selected>Mostrar</option>
		   <option value="no">Esconder</option>
		  </select>
		  Barra de Endere&ccedil;os</font></td>
		</tr>
		<tr> 
		 <td><font size="2" face="Verdana, Arial, Helvetica, sans-serif"> 
		  <select name="statusbar" id="statusbar">
		   <option value="yes" selected>Mostrar</option>
		   <option value="no">Esconder</option>
		  </select>
		  Barra de Status</font></td>
		</tr>
		<tr> 
		 <td><font size="2" face="Verdana, Arial, Helvetica, sans-serif">
		  <select name="scrollbars" id="select2">
		   <option value="yes" selected>Mostrar</option>
		   <option value="no">Esconder</option>
		  </select>
		  Barras de Rolagem</font></td>
		</tr>
	   </table></td>
	 </tr>
	</table>
	<strong><a href="#" onClick="javascript:window.close()"></a><font size="2" face="Verdana, Arial, Helvetica, sans-serif"> 
	&nbsp;</font></strong> <table border="0" align="right">
	 <tr> 
	  <td><table border="1" align="right" cellpadding="0" cellspacing="0">
		<tr> 
		 <td bordercolor="lightgrey" nowrap><strong><a href="#" onClick="javascript:window.close()"><font color="#990000" size="2" face="Verdana, Arial, Helvetica, sans-serif">Cancelar</font></a></strong></td>
		</tr>
	   </table>
	  </td>
	  <td><table border="1" align="right" cellpadding="0" cellspacing="0">
		<tr> 
		 <td bordercolor="lightgrey" nowrap><strong><font size="2" face="Verdana, Arial, Helvetica, sans-serif">&nbsp;<a href="#" onClick="retorna(document.form1.length)"><font color="#009900">Inserir 
		  &gt;&gt;</font></a> </font></strong></td>
		</tr>
	   </table></td>
	 </tr>
	</table>
	<strong> </strong> </td>
  </tr>
 </table>
</form>
</body>
</html>
<!-- #include file="../fechaconexoes.asp" -->
