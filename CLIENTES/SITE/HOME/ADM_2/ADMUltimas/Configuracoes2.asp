<!-- #include file="../../conexao.asp" -->
<!-- #include file="../conexao_adm.asp" -->
<!-- #include file="../../conexao_ultimas.asp" -->


<!-- #include file="../validasenha.asp" -->

<%
id = Request.QueryString("id_config")
Set dic = CreateObject("Scripting.Dictionary")
str = "Update Config set "
For each a in Request.Form

	valor = Request.Form(a)
	
	If instr(valor, "#") > 0 then
	End if
	
	If a <> "Submit" then
		str = str & "[" & a & "]" & "='" & valor & "', "
	End if
	
Next
str = left(str, len(str)-2)
str = str & " where id_config=" & id
'Response.Write(str)
Conexao_Ultimas.Execute(str)

Response.Redirect("Configuracoes.asp?id=" & id & "&msg=Configurações alteradas.&cliente=" & cliente)
%><!-- #include file="../../fechaconexoes.asp" -->
