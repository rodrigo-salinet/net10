<!-- #include file="../conexao.asp" -->
<!-- #include file="conexao_adm.asp" -->


<html>
<head>
<title>Op&ccedil;&atilde;o de janela</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<script>
function retorna(valor)
{
	window.returnValue = valor;
	window.close();
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

<body bgcolor="#CCCCCC" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
 <tr>
  <td align="center" valign="middle"><fieldset>
   <legend>Abrir o link em:</legend>
   <select name="select" onChange="retorna(this.value)">
	<option selected>Escolha uma op&ccedil;&atilde;o...</option>
	<option value="_blank">Em uma nova p&aacute;gina</option>
	<option value="_self">Na mesma p&aacute;gina</option>
	<option value="_parent">P&aacute;gina 'pai'</option>
	<option value="_top">P&aacute;gina 'topo'</option>
   </select></fieldset> 
  </td>
 </tr>
</table>
</body></html><!-- #include file="../fechaconexoes.asp" -->
