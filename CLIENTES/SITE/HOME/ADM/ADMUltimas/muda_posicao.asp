<!-- #include file="../conexao.asp" -->
<!-- #include file="conexao_adm.asp" -->
<!-- #include file="validasenha.asp" -->
<!-- #include file="../../CONEXAO_ULTIMAS.asp" -->
<%
id_ultimas = Request.QueryString("id")
tipo = Request.QueryString("tipo")
ordem = Request.QueryString("posicao")
if cint(ordem) = -1 then
	ordem = 1
End if
Set rs = Conexao_ultimas.Execute("Select * From ultimas where id_ultimas=" & id_ultimas)

If cint(rs("ordem")) < cint(ordem) then
	Conexao_ultimas.Execute("Update ultimas set ordem=" & ordem - 1 & " where ordem=" & ordem)
	ordem = ordem + 1
Else
	Conexao_ultimas.Execute("Update ultimas set ordem=" & ordem + 1 & " where ordem=" & ordem)
End if

Conexao_ultimas.Execute("update ultimas set ordem=" & ordem & " where id_ultimas=" & id_ultimas)

Set corrige = Conexao_ultimas.Execute("Select * From ultimas order by ordem")
Set principal = Conexao_ultimas.Execute("Select * From ultimas where ordem=-1 order by id_ultimas")

Do while not corrige.EOF 
	IF corrige("id_ultimas") <> principal("id_ultimas") then
		conta = conta + 1
		nstr = "Update ultimas set ordem=" & conta & " where id_ultimas=" & corrige("id_ultimas")
		Conexao_ultimas.Execute(nstr)
	End if
	corrige.movenext
Loop

Response.Redirect("default.asp")

%><!-- #include file="../fechaconexoes.asp" -->
