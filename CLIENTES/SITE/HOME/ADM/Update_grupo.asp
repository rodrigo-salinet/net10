<!-- #include file="../conexao.asp" -->
<!-- #include file="conexao_adm.asp" -->
<!-- #include file="validasenha.asp" -->
<%
If tc<100 then

Caminho_ultimas = fso.GetParentFolderName(whichfn) & "\ultimas.mdb"
Set conexao_ultimas = CreateObject("ADODB.Connection")
Conexao_ultimas.open "DBQ=" & Caminho_ultimas & ";Driver={Microsoft Access Driver (*.mdb)}"

mostradicas = Request.Form("mostradicas")
caminho_mostradicas = caminho_cliente & "mostradicas.txt"
Set arquivo_mostradicas = fso.CreateTextFile(caminho_mostradicas)
arquivo_mostradicas.write(mostradicas)

grupo = Request.Form("grupo")
subfam = Request.Form("Subfam")

if subfam = "" then
	subfam = 0
End if
pagina = Request.Form("Mensagem")
pagina = Replace(pagina, """", "&#" & asc("""") & ";")
pagina = Replace(pagina, "'", "&#" & asc("'") & ";")
fundo = Request.Form("fundo")
id_grupo = Request.QueryString("id_grupo")
imagem = Request.Form("imagem")
Ultimas = Request.Form("ultimas")
fundo_imagem = Request.Form("fundo_imagem")
head = Request.Form("HEAD")
head = Replace(head, """", "&#" & asc("'") & ";")
head = Replace(head, "'", "&#" & asc("'") & ";")
estilo = Request.Form("estilo")
estilo = replace(estilo, "../", "home/")
naoMOSTRAR = Request.Form("naomostrar")
If naomostrar = empty then naomostrar = "true"


If imagem <> empty then
	imagem = "|***<img src=&quot;" & imagem & "&quot; alt=&quot;" & grupo & "&quot; border=&quot;0&quot;>***| " 
	grupo = imagem & grupo
End if
If head <> "" then head = "head='"& head &"', "
if pagina = "undefined " then
	Response.Redirect("grupos.asp?msg=Por favor aguarde o carregamento da página!&id_grupo=" & id_grupo & "&fundo=" & fundo & "&cliente=" & cliente)
End if
	str = "Update nivel Set " & head & " nivel='" & grupo & "', estilo='" & estilo & "', pagina_inicial='" & pagina & "', fundo='" & fundo & "', fundo_imagem='" & fundo_imagem  & "', SUBFAM=" & subfam & ", VISUALIZAR='" & naoMOSTRAR & "' where id=" & id_grupo
	Conexao_banco.Execute(str)
	If Ultimas then
		Set ult = Conexao_ultimas.Execute("Select * From ultimas where desturl='" & caminho_virtual & "default.asp?id=" & id_grupo & "&cliente=" & cliente & "'")
		If ult.EOF then
			Conexao_ultimas.Execute("insert into ultimas([desc], delay, font) values('" & texto_imagem("texto", grupo) & "    ', '1000', 'Verdana,bold,14')")
			Conexao_ultimas.Execute("insert into ultimas([desc], desturl, font, textcolor, loadwhere) values('Leia mais...    ', '" & caminho_virtual & "default.asp?id=" & id_grupo & "&cliente=" & cliente & "', 'Verdana,plain,10', '100,0,0', '_parent')")
			Conexao_ultimas.Execute("insert into ultimas([desc]) values(' ')")
		End if
	Else
		Set ult = Conexao_ultimas.Execute("Select * From ultimas where desturl='" & caminho_virtual & "default.asp?id=" & id_grupo & "&cliente=" & cliente & "'")
		If not ult.EOF then
			Conexao_ultimas.Execute("Delete * from ultimas where id_ultimas=" & ult("id_ultimas"))
		End if
	End if
	
	Set rs = Conexao_banco.Execute("Select * From nivel where id=" & id_grupo)
	
	Response.Redirect("Grupos.asp?msg=Alterado com sucesso.&id_grupo=" & Rs("id") & "&fundo=" & rs("fundo") & "&cliente=" & cliente)
%>
<%Else %>
<font color="#FFFFFF" face="Verdana, Arial, Helvetica, sans-serif"><strong><%= msg_cheia %><br>
<a href="javascript:history.go(-1)"><font size="2">Clique aqui para voltar.</font></a></strong></font> 
<%
  End if
  %>
<!-- #include file="../fechaconexoes.asp" -->
