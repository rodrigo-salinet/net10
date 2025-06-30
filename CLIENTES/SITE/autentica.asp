<%
'on error resume next
Set fso = CreateObject("Scripting.FileSystemObject")
nome_arquivo = Server.MapPath("autentica/log" & day(now) & month(now) & year(now) & "_" & Request.QueryString("cliente") & ".txt")
html = "Este e-mail foi gerado automaticamente pelo endereço http://www.net10.com.br/autentica.asp <br> "& vbcrlf &"Mais informações em anexo, ou no endereço: http://www.net10.com.br/autentica/" & nome_arquivo

Set arquivo = fso.CreateTextFile(nome_arquivo)

arquivo.WriteLine("---------------------[Início de log às " & now & "]---------------------")

variaveis = variaveis & "Variáveis: [request.form]"
For each vari in Request.Form
	variaveis = variaveis &  vbcrlf & vari & ": " & Request.Form(vari) & vbcrlf
Next

variaveis = variaveis & "Variáveis: [request.queryString]"

For each vari in Request.QueryString
	variaveis = variaveis & vbcrlf & vari & ": " & Request.queryString(vari) & vbcrlf
Next

variaveis = variaveis & "Variáveis: [request.cookies]"
For each vari in Request.Cookies
	variaveis = variaveis & vbcrlf & vari & ": " & Request.cookies(vari) & vbcrlf
Next

variaveis = variaveis & "Variáveis: [request.serverVariables]"
For each vari in Request.ServerVariables
	variaveis = variaveis & vbcrlf & vari & ": " & Request.serverVariables(vari) & vbcrlf
Next

arquivo.writeline(variaveis)


html = html & "log gravado no arquivo: <hr>" & variaveis

Set myMail = CreateObject("CDONTS.NewMail") 

'myMail.AttachURL nome_arquivo, nome_arquivo
myMail.From = "webmaster@net10.com.br" ' Remetente
myMail.To = "viasulnet@viasulnet.com.br, jean@viasulnet.com.br" ' Destinatário
myMail.Subject = "Cliente acessando o serviço de bloqueio do NET10" ' Assunto do e-mail
myMail.BodyFormat = 0 
myMail.MailFormat = 0 
myMail.Body = HTML ' Corpo da mensagem definido na variável HTML 
'myMail.Send 
If Err.Number <> 0 then
	fim_status = "> Ocorreu um erro!"
	fim_status = fim_status & "> " & err.number & ": " & err.description
Else
	fim_status = "> Sem erros, arquivo enviado!"
end if
arquivo.writeline(fim_status)
arquivo.writeline("---------------------[fim de log]---------------------")
arquivo.writeblanklines(3)
%>Feito!