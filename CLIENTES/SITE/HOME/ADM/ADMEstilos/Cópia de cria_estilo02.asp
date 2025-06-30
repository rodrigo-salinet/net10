<!-- #include file="../../conexao.asp" -->
<!-- #include file="../conexao_adm.asp" -->
<!-- #include file="../validasenha.asp" -->
<%
quebra = vbcrlf
visualizar = Request.QueryString("visualizar")
arquivo = Request.QueryString("arquivo")
'sobre = Request.QueryString("sobre")
For each campo in Request.Form
	campo = replace(campo, "*", "")
	marcador = instr(campo, "_")
	Valor = Request.Form(campo)
	valor = replace(valor, ",", " ")
	If marcador>1 and valor<> empty then
		tag = left(campo, marcador-1)
		sem_tag = right(campo, len(campo)-marcador)
		if instr(campo, "image")>0 then
			valor = "url(" & valor & ")"
		End if
		If tag = sobre & "body" then
			body = body & sem_tag & ": " & valor & ";"& quebra 
		Elseif tag = sobre & "table" then
			table = table & sem_tag & ": " & valor & ";"& quebra
		Elseif tag = sobre & "td" then
			td = td & sem_tag & ": " & valor & ";"& quebra 
		Elseif tag = sobre & "input" then
			input = input & sem_tag & ": " & valor & ";"& quebra 
		Elseif tag = sobre & ".sobre" then
			input = input & sem_tag & ": " & valor & ";"& quebra 
		End if
	End if
Next

final = ""
final = final & "  body" & "{" & quebra & body & "} " & quebra
final = final & " table{" & quebra & table & "} " & quebra 
final = final & " td{" & quebra & td & "} " & quebra 
final = final & " input{" & quebra & input & "} " & quebra 
final = final & " .sobre{" & quebra & input & "} " & quebra 


If visualizar then
	temp = "temp"
	Redir = "modelo/default.asp?arquivo=" & arquivo & "&cliente=" & Session("cliente") & "&subcam=temp"
Else
	redir = "cria_estilo01.asp?arquivo=" & arquivo
End if

caminho = Server.MapPath("../../clientes/" & Session("cliente") & "/estilos/" & temp)
arquivo = arquivo & ".css"
Set estilo_css = fso.CreateTextFile(caminho & "\" & arquivo)
estilo_css.Write(final)
Response.Redirect(redir)
%>
<!-- #include file="../../fechaconexoes.asp" -->
