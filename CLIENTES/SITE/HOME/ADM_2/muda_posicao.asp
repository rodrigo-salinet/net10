<!-- #include file="../conexao.asp" -->
<!-- #include file="conexao_adm.asp" -->
<!-- #include file="validasenha.asp" -->
<%
id=Request.QueryString("id")
id = Request.QueryString("id")
tipo = Request.QueryString("tipo")
ordem = Request.QueryString("posicao")
if cint(ordem) = -1 then
	ordem = 1
End if
Set rs = Conexao_banco.Execute("Select * From nivel where id=" & id)
subfam = rs("subfam")
If cint(rs("ordem")) < cint(ordem) then
	Conexao_banco.Execute("Update nivel set ordem=" & ordem - 1 & " where subfam=" & subfam & " and ordem=" & ordem)
	ordem = ordem + 1
Else
	Conexao_banco.Execute("Update nivel set ordem=" & ordem + 1 & " where subfam=" & subfam & " and ordem=" & ordem)
End if

Conexao_banco.Execute("update nivel set ordem=" & ordem & " where subfam=" & subfam & " and id=" & id)

Set corrige = conexao_banco.Execute("Select * From nivel where subfam=" & subfam & " order by ordem")
Set principal = conexao_banco.Execute("Select * From nivel where ordem=-1 order by id")

Do while not corrige.EOF 
	IF corrige("id") <> principal("id") then
		conta = conta + 1
		nstr = "Update nivel set ordem=" & conta & " where id=" & corrige("id")
		Conexao_banco.Execute(nstr)
	End if
	corrige.movenext
Loop

Response.Redirect("Administrador.asp?id=" & id & "&cliente=" & cliente)

%><!-- #include file="../fechaconexoes.asp" -->
