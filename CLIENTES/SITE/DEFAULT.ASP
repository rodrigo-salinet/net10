<!-- #include file="home/conexao.asp" -->
<%
'Início sql página atual
If id<>empty then
	str_pagina = "Select * From nivel where id=" & id
Else
	str_pagina = "Select * From nivel where principal=true"
End if
Set pagina = Conexao_banco.Execute(str_pagina)
'Fim
%>
<html>
<head>
<title>.:::: <%= nome_cliente %> ::::.</title>
<%
'Cabeçalho definido pelo cliente
head = pagina("head")
'Response.Write(vartype(head))
if vartype(head)=8 then
	head = replace(head, "&#39;", "'")
	head = replace(head, "&#34;", """")
	Response.Write(head)
End if
%>
<%
'Aplicar estilo visual (CSS)
estilo = pagina("estilo")
If estilo <> empty then
%>
<link href="<%= estilo %>" rel="stylesheet" type="text/css">
<%
End if


camstatus = Server.MapPath("home/clientes/" & cliente & "/status.txt")

If fso.FileExists(camstatus) then
	Set arqStatus = fso.OpenTextFile(camstatus)
	txtstatus = arqStatus.Readall
Else
	txtstatus = "Bem vindo a " & nome_Cliente & "!"
End if


%>
<script>
window.status='<%= txtstatus %>';
</script>
<style type="text/css">
<!--
.imagensAdm {
	position: absolute;
	left: 770px;
}
-->
</style>
</head>

<%
fundo = pagina("fundo")
fundo_imagem = pagina("fundo_imagem")

If vartype(fundo) = 1 then fundo = "FFFFFF"
%>
<body background="<%= fundo_imagem %>" bgcolor="#<%= fundo %>"<% IF pagina("fundo_fixo") then %> bgproperties="fixed"<% End if %>>
<!-- Cabeçalho da página -->
<!-- #include file="cabecalho.asp" -->
<!-- fim do cabeçalho -->

<!-- Página atual do site: -->
<%
Busca = Request.QueryString("busca")
If len(busca)>0 then
	%>
	<!--#include file="pagina_busca.asp" -->
	<%
Else
	%>
	<!--#include file="pagina_inicial.asp" -->
	<%
End if

%>
<!-- Fim da página atual do site -->
<!-- Cliente: <%= cliente %> -->
</body>
</html>