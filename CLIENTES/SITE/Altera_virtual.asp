<!-- #include file="home/conexao.asp" -->
<!-- #include file="home/conexao_configuracoes.asp" -->
<!-- #include file="home/tira_html.asp" -->
<!-- #include file="arvore.asp" -->
<%
Set rs = Conexao_banco.Execute("Select * from nivel")
Do while not rs.EOF
	pagina_inicial = replace(rs("pagina_inicial"), "http://www.viasulvirtual.com.br/net10/site/", "http://www.net10.com.br/clientes/site/")
	id = rs("id")
	REsponse.Write str & "<br>"
	REsponse.Write(id & "<hr>")
'	Conexao_banco.Execute(str)
	rs.movenext
Loop
%>
<!-- #include file="home/fechaconexoes.asp" -->
