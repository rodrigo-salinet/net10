<!-- #include file="../conexao.asp" -->
<!-- #include file="conexao_adm.asp" -->


<html>
<head>
<title>Op&ccedil;&atilde;o de janela</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<script>
//argumentos = window.dialogArguments;
//argumentos = argumentos.split(";")

function retorna(valor)
{
	window.returnValue = valor;
	window.close();
}

function preenche(v)	
{
	document.all.repete.value = v[1];
//	document.all.posx.value = v[2];
//	document.all.posy.value = v[3];
}
</script>
<style type="text/css">
<!--
input {
	font-family: Arial, Helvetica, sans-serif;
}
td {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: x-small;
}
-->
</style>
<link href="ADMImagens/estilo.css" rel="stylesheet" type="text/css">
</head>

<body bgcolor="#CCCCCC" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onLoad="preenche()">
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
 <tr>
  <td align="center" valign="middle"><fieldset>
   <legend>Repeti&ccedil;&atilde;o:</legend>
   <select name="repeticao" id="repeticao">
	<option value="no-repeat" selected>N&atilde;o repete</option>
	<option value="repeat">Repete</option>
	<option value="repeat-x">Repete horizontal</option>
	<option value="repeat-y">Repete vertical</option>
   </select>
   <table border="0" cellpadding="0" cellspacing="0">
	<tr> 
	 <td>Posi&ccedil;&atilde;o horizontal:&nbsp;</td>
	 <td><input name="posx" type="text" id="posx" size="3"></td>
	</tr>
	<tr> 
	 <td>Posi&ccedil;&atilde;o vertical:</td>
	 <td><input name="posy" type="text" id="posy" size="3"></td>
	</tr>
	<tr align="right"> 
	 <td colspan="2"> 
	  <input type="submit" name="Submit" value="&gt;&gt;" onClick="retornados = new Array(repeticao.value, posx.value, posy.value);retorna(retornados)">
	 </td>
	</tr>
   </table>
   </fieldset> 
  </td>
 </tr>
</table>
</body></html><!-- #include file="../fechaconexoes.asp" -->
