<!-- #include file="../conexao.asp" -->
<!-- #include file="conexao_adm.asp" -->
<!-- #include file="validasenha.asp" -->
<html>
<head>
<title>CONTE&Uacute;DO DO CABE&Ccedil;ALHO</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<script>

function carrega(valor)
{
	cabecalho.value = valor;
}

function retorna(valor)
{
	window.returnValue = valor;
	window.close();
}
function limpa()
{
	cabecalho.value = "";
}

</script>
</head>

<body onLoad="carrega(window.dialogArguments)" bgcolor="#CCCCCC" vlink="#0000FF" alink="#0066FF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<div align="center">
 <textarea name="cabecalho" cols="60" rows="6" id="cabecalho"></textarea>
 <br>
 <input type="button" onClick="retorna(cabecalho.value)" name="Submit2" value="Enviar">
 <input type="button" onClick="limpa()" name="Submit" value="Redefinir">
 <input type="button" onClick="window.close()" name="Submit3" value="Cancelar">
</div>
</body>
</html>
<!-- #include file="../fechaconexoes.asp" -->
