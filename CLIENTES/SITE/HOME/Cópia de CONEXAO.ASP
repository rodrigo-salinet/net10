<%
on error resume next

If Request.Querystring("cliente") = "camaracambe" then
	%><script>window.location="http://www.camaracambe.com.br/net10/default.asp?<%= Request.ServerVAriables("Query_string") %>"</script><%
	Response.End
End if
'Response.End()
caminho_dados = "i:\inetpub\wwwroot\net10cbr\dados\"
caminho_dados = "c:\export\users\ftpnet10\database\"
caminho_dados = Server.MapPath("../../database") & "\"

Set FSO = Server.CreateObject("Scripting.FileSystemObject")
If Request.QueryString("Servidor") <> empty then Response.Cookies("Servidor") = Request.QueryString("Servidor")
If not fso.FileExists(caminho_dados) then Response.Cookies("Servidor") = "local"
Response.Buffer = false
If Request.Cookies("Servidor") <> empty then
	Session("Servidor") = Request.Cookies("Servidor")
Else
	Response.Cookies("Servidor") = "remoto"
	Session("servidor") = "remoto"
End if
	Response.Cookies("Servidor") = "remoto"
	Session("servidor") = "remoto"
Session.Timeout = 20
Server.ScriptTimeout = 1000
Session.LCID = 1046
'If Session("Servidor") = "local" then
'	endereco_virtual = "http://jean/net10/site/" 'Teste no meu PC
'	cam_dados = "C:\WINDOWS\Desktop\Net10\dados\"
'	endereco_virtual1 = "http://www.viasulvirtual.com.br/net10/site/" 'Teste no Servidor de Testes
'	endereco_virtual2 = "http://intranet/net10/unificado/site/" 'Teste no servidor Viasulnet
'	endereco_virtual3 = "http://srvadm/net10/"   'Enrdereço da Confepar
'	endereco_virtual4 = "http://www.net10.com.br/clientes/site/" 'Última Configuração
	
'	Endereco_cliente = "http://jean/net10/site/home/clientes"
'Else
	endereco_virtual = "http://www.net10.com.br/clientes/site/" 'Última Configuração
	cam_dados = caminho_dados
'	cam_dados = "c:\export\users\ftpnet10\database\"
	endereco_virtual1 = "http://www.viasulvirtual.com.br/net10/site/" 'Teste no Servidor de Testes
	endereco_virtual2 = "http://intranet/net10/unificado/site/" 'Teste no servidor Viasulnet
	endereco_virtual3 = "http://srvadm/net10/"   'Enrdereço da Confepar
	endereco_virtual4 = "http://jean/net10/" 'Teste no meu PC
	
	'Endereco_cliente = "http://imagens.net10.com.br/clientes"
	Endereco_cliente = "http://www.net10.com.br/clientes/site/home/clientes" 
'End if

Session("endereco_virtual") = endereco_virtual
Session("endereco_clientes") = endereco_clientes
Session("cam_dados") = cam_dados
If not fso.FolderExists(cam_dados) then
	%><a href="mailto:webmaster@net10.com.br?subject=Erro NET10 - Cliente: [<%= Request.QueryString("cliente") %>]">Erro!<hr>Ocorreu um erro nesta página.<br>
	 Por favor entre em contato com o administrador.</a><!-- Caminho para banco de dados não encontrado. --><%
	Response.End()
'	Response.Redirect("erro.asp")
End if
cliente_atual = cliente

Set cliente= nothing
cliente = cliente_atual

nomedocliente = Request.QueryString("cliente")

If nomedocliente <> empty then
	cliente = nomedocliente
End if
If cliente = empty and not todos then
	Response.Redirect(endereco_virtual & "home/todos_clientes.asp?cam_dados=" & cam_dados)
	'Response.Write("Nenhum cliente foi definido, ou o servidor ficou inativo por muito tempo.<br>Por favor entre novamente no site.")
	Response.End()
End if


%>
<!-- #include file="construcao.asp" -->
<%

arquivo = "dados/" & cliente & "/banco.mdb"
caminho = ""


whichFN = cam_dados & cliente & "\banco.mdb"

'REsponse.Write(whichFN)
If not fso.FileExists(whichFN) then
	%><script>
	alert('Ocorreu um erro nesta página!\n<%= whichFN%>');
	window.open("http://www.viasulvirtual.com.br/enviar/envia_relatorio.asp?Assunto=Erro no net10<br>&resultado=Banco de dados não encontrado<br>&cliente=<%= cliente %>","_blank", "left=2000, top=2000, width=1, height=1")
	history.go(-1)
	</script><%
End if

Set Conexao_banco = CreateObject("ADODB.Connection")
Conexao_banco.open "DBQ=" & whichFN & ";Driver={Microsoft Access Driver (*.mdb)}"





nome_campo = "VISUALIZAR"
nome_tabela = "nivel"
tipo_campo = "text(50)"
Set tm = Conexao_banco.Execute("Select * from " & nome_tabela)
campo = tm.fields(nome_campo)
set tm = nothing
If vartype(campo)=0 then
	Conexao_banco.Execute("ALTER TABLE " & nome_tabela & " ADD " & nome_campo & " " & tipo_campo)
End if
on error resume next
'Response.Write("------" & err.number & "------")











Set config = Conexao_banco.Execute("Select * From Config")

idfam = Request.QueryString("idfam")
idgrupo = request.QueryString("id_grupo")
Session("idfam") = idfam
Session("id_grupo") = idgrupo



nome_pasta = Request.QueryString("categoria")
nome_pasta = replace(nome_pasta, "\", "/")
nome_pasta = replace(nome_pasta, "//", "/")

If nome_pasta <> empty then
	If left(nome_pasta, 1) = "/" then
		nome_pasta = mid(nome_pasta, 2, len(nome_pasta))
	End if
End if
Session("caminho_virtual") = "../../../home/clientes/" & cliente & "/imagens/" & nome_pasta




Function texto_imagem(tipo, str_inicial)
	comeco_str = 0
	fim_str = 0
	Set re = New RegExp
	re.Pattern = "\|\S{2,}"
	re.ignorecase = false
	re.global = true
	Set inicio_str = re.Execute(str_inicial)
	For each res in inicio_str
		re.Pattern = "\*{3}\|"
		Set ofim = re.Execute(str_inicial)
		comeco_str = cint(res.firstindex) + 1
		For each ans in ofim
			fim_str = cint(ans.firstindex) + 4
		Next
	Next

	if comeco_str <> empty and fim_str <> empty then
		If tipo = "texto" then
			variavel_str = mid(str_inicial, comeco_str, fim_str)
			texto_imagem = replace(str_inicial, variavel_str, "")
		Else
			variavel_str = mid(str_inicial, comeco_str, fim_str)
			img = replace(variavel_str, "|***", "")
			img = replace(img, "***|", "")
			img = replace(img, "&quot;", "'")
			texto_imagem = replace(img, "" & asc("'"), "'")
		End if
	Else
		texto_imagem = texto_imagem & str_inicial
	End if
End Function

Function nome_imagem2(imgm)
	Set re = New RegExp
	re.Pattern = "\<img\ssrc\=\'"
	re.ignorecase = false
	re.global = true
	Set inicio_str = re.Execute(imgm)
	For each res in inicio_str
		imgm = replace(imgm, res, "")
		re.Pattern = "\'\salt\=\'\S{1,}\'\sborder\=\'\S{1,}\'\>" '\S{2,}
		Set ofim = re.Execute(imgm)
		For each ans in ofim
			nome_imagem = replace(imgm, ans, "") 
		Next
	Next
End Function

Function nome_imagem(strHTML, intWorkFlow)

	dim regEx, strTagLess
	
	strTagless = strHTML
	
	set regEx = New RegExp 
	'Cria o objeto regexp 
	regEx.IgnoreCase = True
	'Configuração case sensitivity
	regEx.Global = True
	
	
	if intWorkFlow <> 1 then
	regEx.Pattern = "<[^>]*>"
	'este padrao verifica qqer tag html
	strTagLess = regEx.Replace(strTagLess, "")
	'todas as tags html sao removidas
	end if
	
	if intWorkFlow > 0 and intWorkFlow < 3 then
	regEx.Pattern = "[<]"
	'verifica um < sozinho
	strTagLess = regEx.Replace(strTagLess, "&lt;")
	
	regEx.Pattern = "[>]"
	'verifica um > sozinho
	strTagLess = regEx.Replace(strTagLess, "&gt;")
	end if
	
	set regEx = nothing
	nome_imagem = strTagLess


End Function
Sub log_de_acesso(usuarios)
	cam_log = Server.Mappath("./logs")
	If not fso.FolderExists(cam_log) then fso.CreateFolder(cam_log)
	cam_log = cam_log & "/log" & day(now) & "." & month(now) & "." & year(now) & ".txt"
	
	
	For each vlog in Session.Contents()
		Session_log = session_log & vlog & ": " & Session(vlog)  & vbcrlf
	Next
	
	For each vlog in Request.QueryString()
		Request_log = request_log & vlog & ": " & Request(vlog) & vbcrlf
	Next
	
	
	If fso.FileExists(cam_log) then
		Set arq_log = fso.OpenTextFile(cam_log, 2)	
		Set arq_log_antigo = fso.OpenTextFile(cam_log)
		log_antigo = arq_log_antigo.ReadAll
		Set arq_log_antigo = nothing
	Else
	
		Set arq_log = fso.CreateTextFile(cam_log)
	End if
	
	valor_log = "-------------------------------------------" & vbcrlf & "Iniciando: " & now & vbcrlf & vbcrlf & "Sessões: " & vbcrlf & Session_log & vbcrlf & vbcrlf & "Requests: " & vbcrlf & Request_log & log_antigo
	arq_log.Write(valor_log)
	
	Set arq_log = nothing
	
End sub

Function relaciona(atual, emqual)
	If atual = emqual then
		relaciona = true
	Else
		Set atual = Conexao_banco.Execute("Select * From nivel where id=" & atual)
		If atual("subfam") = emqual then
			relaciona = true
		Else
			If atual("subfam") <> 0 then
				relaciona = relaciona(atual("subfam"), emqual)
			Else
				relaciona = false
			End if
		End if
	End if
End function





pasta_cliente = fso.GetParentFolderName(cam_dados)
%>