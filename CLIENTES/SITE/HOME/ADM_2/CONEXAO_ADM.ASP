<%
'Response.Write("O Administrador está temporariamente interrompido.")
'Response.End()
msg_cheia = "<font style='filter: Invert'>ATENÇÃO!<br>   Você excedeu o limite máximo da sua conta.<br> Para continuar inserindo novos itens,<br> verifique a possibilidade de eliminação<br> de itens/imagens não utilizados.<hr> Caso queira aumentar o seu espaço,<br> entre em contato com<br> a Viasulnet (43) 3344-1212.</font>"
If Request.Form("usuario") <> empty then
	Session("usuario") = Request.Form("usuario")
	If Request.Form("senha") <> empty then
		Session("senha") = Request.Form("senha")
	End if
End if
Caminho_adm = caminho_dados & "\usuarios.mdb"
Set conexao_adm = CreateObject("ADODB.Connection")
Conexao_adm.open "DBQ=" & Caminho_adm & ";Driver={Microsoft Access Driver (*.mdb)}"

Function Mostra_Caminho_do_arquivo(caminho_do_arquivo)
	If (instr(caminho_do_arquivo, "<script>abrearquivo(&#" & asc("'") & ";")) > 0 or instr(caminho_do_arquivo, "<script>abrearquivo(&#" & asc("'") & ";") > 0 and instr(caminho_do_arquivo, """, ""_blank"");history.go(-1);} abre();</script><center>Se a página não abrir automaticamente, <a href=""#"" onClick=""abre()"">clique aqui.</a></center>")>0 then
		arquivo = caminho_do_arquivo
		arquivo = replace(arquivo, "<script>abrearquivo(&#39;", "")
		arquivo = replace(arquivo, "&#39;, &#39;_self&#39;)</script><center>Se a página não abrir automaticamente, <a href=""" & endereco_virtual, "")
		arquivo = replace(arquivo, """ target=""_blank"">clique aqui.</a></center>", "")
		arquivo = left(arquivo, len(arquivo)/2)
		Mostra_Caminho_do_arquivo = arquivo
	Else
		Mostra_Caminho_do_arquivo = false
	End if
End Function

  Set pasta_dados = fso.GetFolder(caminho_dados)
  caminho_pasta = Server.MapPath(right(Session("caminho_virtual"), len(Session("caminho_virtual"))-3))
  if not fso.FolderExists(caminho_pasta) then
  	caminho_pasta = Server.MapPath( right( Session("caminho_virtual"), len( Session("caminho_virtual") ) ) )
  End if
 ' response.Write(caminho_pasta)
  caminho_pasta = left(caminho_pasta, len(caminho_pasta))'-7)
  Set pasta_arquivos = fso.GetFolder(caminho_pasta)
  conta_bytes = pasta_arquivos.size
  conta_bytes = pasta_dados.size + conta_bytes
  conta_bytes = round(conta_bytes/1024/1024, 2)'-0.864, 2)
  
  caminho_ler = pasta_dados.path & "\tamanho_conta.txt"
  If fso.FileExists(caminho_ler) then
	Set ler = fso.OpenTextFile(caminho_ler)
    tamanho_ideal = ler.readall
  Else
    Set gravar = fso.CreateTextFile(caminho_ler)
	gravar.write("10")
    tamanho_ideal = 1000000
  End if

  conta_porcento = round((conta_bytes * 100)/tamanho_ideal,2)
  tc = conta_porcento
'If not Request.QueryString("admgeral") then
'  tc = 0
'End if
tc = 0

%>
