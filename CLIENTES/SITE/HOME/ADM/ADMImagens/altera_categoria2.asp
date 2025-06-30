<!-- #include file="../../conexao.asp" -->
<!-- #include file="../conexao_adm.asp" -->

<%
nome_pasta = Request.QueryString("categoria")
nome = Request.Form("nome")
nome_pasta = replace(Request.QueryString("categoria"), "//", "/")
If nome_pasta <> empty then
	If left(nome_pasta, 1) = "/" then
		nome_pasta = mid(nome_pasta, 2, len(nome_pasta))
	End if
End if


caminho_fisico = Server.MapPath(Session("caminho_virtual"))
Set pasta = fso.GetFolder(caminho_fisico)
pasta.name = nome
categoria = fso.GetParentFolderName(pasta.path)
categoria = Replace(lcase(categoria), lcase(Server.Mappath("../../../home/clientes/" & cliente & "/imagens")), "")
nome_pasta = categoria & "\" & nome
nome_pasta = replace(nome_pasta, "/", "\")
nome_pasta = replace(nome_pasta, "\\", "\")
If nome_pasta <> empty then
	If left(nome_pasta, 1) = "\" then
		nome_pasta = mid(nome_pasta, 2, len(nome_pasta))
	End if
End if
Response.Redirect("janela_imagens.asp?cliente="&cliente&"&categoria=" & nome_pasta & "&msg=Categoria alterada.")
%><!-- #include file="../../fechaconexoes.asp" -->
