<!-- #include file="dados.inc" --><%
If Request.QueryString("teste") then
	on error goto 0
Else
	'Se houver erro, passe adiante
	on error resume next
End if

Cliente = Request.QueryString("cliente")


If instr(cliente, "#")>0 then
	cliente = left(cliente, instr(cliente, "#")-1)
End if

'Sess�o da p�gina mudada para PT-BR
Session.LCID = 1046


'Instancio o File System Object - esse objeto ser� usado em v�rias outras p�ginas
Set fso = CreateObject("Scripting.FileSystemObject")
pasta_administrador = fso.GetParentFolderName(caminho_dados)
pasta_administrador = pasta_administrador & "\clientes\site\home\adm\" 
If not fso.FileExists(pasta_administrador & "BloquearNet10.asp") then
	'Response.Write(pasta_administrador & "BloquearNet10.asp" & ": " & fso.FileExists(pasta_administrador & "BloquearNet10.asp"))
	Response.Redirect("default.asp?msg=Cliente n�o cadastrado.&cliente=")
	Response.End()
	on error goto 0
	
End if


'Caminho onde estar�o os BDs
If not fso.FolderExists(caminho_dados) then
	caminho_dados = caminho_dados_local 
	pasta_wwwroot = ""
End if

'Caminho f�sico onde est�o os arquivos do cliente
caminho_cliente = fso.getparentfoldername(caminho_dados) & pasta_wwwroot & caminho_pasta_clientes & cliente & "\"


'Se o caminho n�o existir, mostra um erro em todos os clientes:
If not fso.FolderExists(caminho_dados) then
	Response.Write("<font face=system size=4>Ocorreu um erro nesta p�gina. Por favor entre em contato com o administrador do site.</font> <!-- Caminho dos BDs n�o encontrado -->" & vbcrlf & "<!-- " & caminho_dados & "-->")
	Response.End()
End if



'Corrige enderecos errados
endereco_errado = Array("http://jean/net10/novo/clientes/site/", "http://www.viasulvirtual.com.br/clientes/net10/clientes/site/", "http://www.camaracambe.com.br/net10/")'endereco_errado = Array("http://www.net10.com.br/clientes/site/", "http://www.viasulvirtual.com.br/clientes/net10/clientes/site/")


'Verifica se o cliente est� cadastrado:
caminho_dados = caminho_dados & cliente
If cliente = empty or not fso.FolderExists(caminho_dados) then
	Response.Write("<!-- " & caminho_dados& " --><font face=system size=4>Cliente n�o cadastrado ou n�o informado.</font> <hr noshade><a href='javascript:history.go(-1)'>Voltar</a>")
	Response.End()
End if

'Nome do cliente ser� o cliente em letra mai�scula e substituindo "_" por " "
nome_cliente = replace(Ucase(cliente), "_", " ")

'In�cio de cria��o de conex�o
Set Conexao_banco = CreateObject("ADODB.Connection")
Conexao_banco.open "DBQ=" & caminho_dados & "\banco.mdb" & ";Driver={Microsoft Access Driver (*.mdb)}"
'Fim da cria��o da conex�o



'ID da pagina atual, serve tanto para mostrar as p�ginas quanto para criar os links
id = Request.QueryString("id")
If Request.QueryString("idfam") <> empty and id=empty then id = Request.QueryString("idfam")
If id = empty or id = 0 then
	Set corrigeid = Conexao_banco.Execute("Select * From nivel where principal=true")
	id = corrigeid("id")
End if


'Este include pode parar a execu��o de todo o site, � s� descomentar a vari�vel
''em = "construcao"
%>
<!-- #include file="construcao.asp" -->
<%

'In�cio das Fun��es �teis

'Fun��o que mostra nome_item/imagem_botao
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


'V� se um item est� dentro do outro
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


'Fim das Fun��es �teis


%>
