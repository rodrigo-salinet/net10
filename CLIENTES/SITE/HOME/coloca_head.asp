<!-- #include file="home/conexao.asp" -->
<%
Set rs = Conexao_banco.Execute("Select * From nivel")
If rs.fields.count <= 10 then
'	For each i in rs.fields
'		%><%= i %><hr><%
'	Next
'	%><%= RS.FIELDS(10).name %><hr color="#00FF00"><%
'	Conexao_banco.Execute("ALTER TABLE `NIVEL` ADD `HEAD` BLOB")
End if
%>
<!-- #include file="home/fechaconexoes.asp" -->
