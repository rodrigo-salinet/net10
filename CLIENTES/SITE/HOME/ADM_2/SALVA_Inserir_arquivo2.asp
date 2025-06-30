<!-- #include file="../conexao.asp" -->
<%
'on error goto 0
id = Request.QueryString("id_grupo")
If id = empty then
	id = 0
End if

Caminho = caminho_dados & "\TEMP\"
Set pst = fso.GetFolder(caminho)

For each ar in pst.files
	fso.deletefile ar
Next


caminho_fisico = Server.MapPath("../clientes/" & cliente & "/arquivos")

Set Upload = Server.CreateObject("Persits.Upload.1")
Upload.Save caminho_fisico


If not fso.FolderExists(caminho) then fso.createFolder(caminho)


grupo = upload.Form("Grupo")
janela = upload.Form("janela")

For Each File in Upload.Files
	nome_arquivo = fso.GetFileName(File.Path)
Next
URL = "home/clientes/" & cliente & "/arquivos/" & nome_arquivo
head = "<script>window.open(&#" & asc("'") & ";" & URL & "&#" & asc("'") & ";, &#" & asc("'") & ";" & janela & "&#" & asc("'") & ";)</script>"
pagina = "<center>Se a página não abrir automaticamente, <a href=""" & endereco_virtual & URL & """ target=""_blank"">clique aqui.</a></center>"
str = "Insert into nivel (nivel, SUBFAM, ordem, pagina_inicial, head) Values ('" & grupo & "', " & id & ", 0, '" & pagina & "', '" & head & "')"
Conexao_banco.Execute(str)
Set rs = conexao_banco.Execute("Select * From nivel order by id desc")
nid = rs("id")


Caminho_adm = caminho_dados & "\usuarios.mdb"
'Response.Write(caminho_adm)
Set conexao_adm = CreateObject("ADODB.Connection")
Conexao_adm.open "DBQ=" & Caminho_adm & ";Driver={Microsoft Access Driver (*.mdb)}"


nome = Server.HTMLEncode(Request.Cookies("login")("nome"))
senha = Server.HTMLEncode(Request.Cookies("login")("senha"))
strs = "Select * From Usuario where nome='" & nome & "' and senha='" & senha & "'"
Set verifica = Conexao_adm.Execute(strs)


Conexao_adm.Execute("Insert into relacao(grupo, usuario) values(" & nid & ", " & verifica("id") & ")")


Set Upload = Nothing
Response.Redirect("Administrador.asp?msg=Inserido com sucesso.&id=" & id & "&cliente=" & cliente)
  %>
<!-- #include file="../fechaconexoes.asp" -->

