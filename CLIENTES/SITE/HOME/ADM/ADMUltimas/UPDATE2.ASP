<!-- #include file="../../conexao.asp" -->
<!-- #include file="../conexao_adm.asp" -->
<!-- #include file="../../CONEXAO_ULTIMAS.asp" -->
<!-- #include file="../validasenha.asp" -->
<%
id = Request.QueryString("id_ultimas")
Set dic = CreateObject("Scripting.Dictionary")
str = "Update Ultimas set "
For each a in Request.Form

	valor = Request.Form(a)
	
	If instr(valor, "#") > 0 then
		if len(valor)<6 then valor = valor & "00"
		valor = replace(valor, "#", "")
		v1 = mid(valor, 1, 2)
		If v1 <> empty then Nv1 = clng("&h" & v1)
		v2 = mid(valor, 3, 2)
		If v2 <> empty then Nv2 = clng("&h" & v2)
		v3 = mid(valor, 5, 2)
		If v3 <> empty then Nv3 = clng("&h" & v3)
		If v1 = "" then
			Set rs = Conexao_ultimas.Execute("Select * From Configuracoes")
			nvtotal = rs(a)
		Else 
			nvtotal = nv1 & ", " & nv2 & ", " & nv3
		End if
	'	If nv1 = "" then nv1 = "0"
	'	If nv2 = "" then nv2 = "0"
	'	If nv3 = "" then nv3 = "0"
		valor = nvtotal
	End if
'	If a = "desturl" and Request.Form("loadwhere") = "mainFrame" then
'		valor = ""
'	End if
	If a <> "Submit" then
		str = str & "[" & a & "]" & "='" & valor & "', "
	End if
	
Next
str = left(str, len(str)-2)

str = str & " where id_ultimas=" & id
'Response.Write(str)
Conexao_Ultimas.Execute(str)

Response.Redirect("update.asp?cliente="&cliente&"&id=" & id)
%><!-- #include file="../../fechaconexoes.asp" -->
