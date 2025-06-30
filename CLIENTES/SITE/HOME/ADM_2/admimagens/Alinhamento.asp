<!-- #include file="../../conexao.asp" -->
<!-- #include file="../conexao_adm.asp" -->


<html>
<head>
<title>Alinhamento</title>
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
<link href="estilo.css" rel="stylesheet" type="text/css">
</head>

<body bgcolor="#CCCCCC" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
 <tr>
  <td align="center" valign="middle"><fieldset><legend>Alinhamento</legend>
   <select name="select" onChange="retorna(this.value)">
	<option selected>Escolha uma opção...</option>
	<option value="right">Direita</option>
	<option value="left">Esquerda</option>
	<option value="top">No alto</option>
	<option value="bottom">Em baixo</option>
	<option value="baseline">Linha de base</option>
	<option value="absmiddle">No meio</option>
	<option value="texttop">Alto do texto</option>
   </select></fieldset> 
  </td>
 </tr>
</table>
</body></html><!-- #include file="../../fechaconexoes.asp" -->
