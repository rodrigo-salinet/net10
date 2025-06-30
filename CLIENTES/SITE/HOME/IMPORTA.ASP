<!--#include file="home/conexao.asp" -->
<!--#include file="home/conexao2.asp" -->
<!--#include file="home/conexao_configuracoes.asp" -->
<!--#include file="home/tira_html.asp" -->
<!-- #include file="arvore.asp" -->
<%
Set rs1 = Con2.Execute("Select * From familias")
Do while not rs1.EOF
	i1 = i1 + 1
	%><%= rs1("familia") %><br>
	<%
	Conexao_banco.Execute("Insert into nivel(nivel, subfam, ordem) values('" & rs1("familia") & "', 0, " & i1 & ")")
	Set rs2 = Conexao_banco.Execute("Select * From nivel order by id desc")
	Set srs1 = con2.Execute("Select * From noticias where familia=" & rs1("id"))
	i2 = 0
	Do while not srs1.EOF
		i2 = i2 + 1
		%><blockquote><%= srs1("titulo") %></blockquote>
		<%
		Conexao_banco.Execute("Insert into nivel(nivel, pagina_inicial, subfam, ordem) values('" & srs1("titulo") & "','" & srs1("dica") & "'," & rs2("id") & "," & i2 & ")")
		srs1.movenext
	Loop
	%>
	<hr><%
	rs1.movenext
Loop
%><!-- #include file="home/fechaconexoes.asp" -->
