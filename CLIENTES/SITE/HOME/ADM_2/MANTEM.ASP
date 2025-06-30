<%
on error resume next
%>
<!-- #include file="../conexao.asp" -->
<!-- #include file="conexao_adm.asp" -->
<!-- #include file="validasenha.asp" -->
<!-- #include file="../fechaconexoes.asp" -->
<html>
<head>
<script>
	//window.close()
	function mantem()
	{
//		window.history.go(0);
//		alert("")
//		setTimeout("mantem()", 20000)
	}
</script>
<title>MANTENDO A CONEXÃO</title>
</head><body onLoad="mantem()//javascript: window.close()">
<a href="javascript:window.close()">FECHAR A PÁGINA</a></body>
</html>