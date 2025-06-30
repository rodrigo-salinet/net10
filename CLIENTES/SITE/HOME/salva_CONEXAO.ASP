<%
'Se houver erro, passe adiante
on error resume next
Cliente = Request.QueryString("cliente")
If instr(cliente, "#")>0 then
	cliente = left(cliente, instr(cliente, "#")-1)
End if

'Sessão da página mudada para PT-BR
Session.LCID = 1046


'Instancio o File System Object - esse objeto será usado em várias outras páginas
Set fso = CreateObject("Scripting.FileSystemObject")

'Caminho onde estarão os BDs
nome_banco = "database/" & cliente & "/banco.mdb"
caminho_dados = "c:\export\users\ftpnet10\database\" 'fso.GetParentFolderName(fso.GetParentFolderName(arquivo)) & "\"
'caminho_dados = "C:\WINDOWS\Desktop\Net10\novo\database\" 'fso.GetParentFolderName(fso.GetParentFolderName(arquivo)) & "\"

'Se o caminho não existir, mostra um erro em todos os clientes:
If not fso.FolderExists(caminho_dados) then
	Response.Write("<font face=system size=4>Ocorreu um erro nesta página. Por favor entre em contato com o administrador do site.</font> <!-- Caminho dos BDs não encontrado -->" & vbcrlf & "<!-- " & caminho_dados & "-->")
	Response.End()
End if

'Caminho para todas as URLs do site
endereco_virtual = "http://www.net10.com.br/clientes/site/"'"http://jean/net10/novo/clientes/site/"


'Corrige enderecos errados
endereco_errado = Array("http://jean/net10/novo/clientes/site/", "http://www.viasulvirtual.com.br/clientes/net10/clientes/site/")'endereco_errado = Array("http://www.net10.com.br/clientes/site/", "http://www.viasulvirtual.com.br/clientes/net10/clientes/site/")

'Endereco_cliente mostra a pasta onde ficarão os arquivos do cliente 
'Serve também para os IFRAMES (Menu_lateral, Noticias_rotativas, etc)
endereco_cliente = "http://www.net10.com.br/clientes/site/home/clientes/"

'Verifica se o cliente está cadastrado:
caminho_dados = caminho_dados & cliente
If cliente = empty or not fso.FolderExists(caminho_dados) then
	Response.Write("<!-- " & caminho_dados& " --><font face=system size=4>Cliente não cadastrado ou não informado.</font> <hr noshade><a href='javascript:history.go(-1)'>Voltar</a>")
	Response.End()
End if

'Nome do cliente será o cliente em letra maiúscula e substituindo "_" por " "
nome_cliente = replace(Ucase(cliente), "_", " ")

'Início de criação de conexão
Set Conexao_banco = CreateObject("ADODB.Connection")
Conexao_banco.open "DBQ=" & caminho_dados & "\banco.mdb" & ";Driver={Microsoft Access Driver (*.mdb)}"
'Fim da criação da conexão



'ID da pagina atual, serve tanto para mostrar as páginas quanto para criar os links
id = Request.QueryString("id")
If id = empty or id = 0 then
	Set corrigeid = Conexao_banco.Execute("Select * From nivel where principal=true")
	id = corrigeid("id")
End if
If Request.QueryString("idfam") <> empty and id=empty then id = Request.QueryString("idfam")


'Este include pode parar a execução de todo o site, é só descomentar a variável
''em = "construcao"
%>
<!-- #include file="construcao.asp" -->
<%

'Início das Funções úteis

'Função que mostra nome_item/imagem_botao
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


'Vê se um item está dentro do outro
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


'Fim das Funções úteis

%>
