<%
on error resume next

If err.number <> 0 then
	descricao = err.description
	Numero = err.Number
	Objeto = err.Source
	AjudaC = err.HelpContext
	AjudaF = err.HelpFile
	For each a in request.QueryString
		query = query & " " & a & ": " & Request.QueryString(a) & "<br>"
	Next	
	For each a in request.Form
		forms = forms & " " & a & ": " & Request.Form(a) & "<br>"
	Next	
	Resposta = "<hr>Descrição do Erro: " & Descricao & "<br>Número: " & Numero & "<br>Objeto: " & Objeto & "<br>Contexto de ajuda: " & AjudaC & "<br>Arquivo de ajuda: " & AjudaF & "<hr>QueryStrings: " & query & "<hr>&Forms: " & forms
	'REsponse.Write(Resposta)

End if
'On error resume next
cliente_atual = cliente

Set cliente= nothing
cliente = cliente_atual
Set FSO = Nothing


Set conexao_imagem = nothing

Conexao_banco.close
Set Conexao_banco = nothing

Conexao_adm.close
Set Conexao_adm = nothing

Conexao_conf.close
Set Conexao_conf = nothing

Conexao_ultimas.close
Set Conexao_ultimas = nothing


%>
